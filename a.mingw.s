
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
       a:	48e7 393a      	movem.l d2-d4/d7/a2-a4/a6,-(sp)

  SysBase = *((struct ExecBase**)4UL);
       e:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      12:	23ce 0000 4fee 	move.l a6,4fee <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,4fc6 <hw>
      1e:	0000 4fc6 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 2853 	lea 2853 <incbin_swfont_end+0xbd>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 4fc2 	move.l d0,4fc2 <GfxBase>
	if (!GfxBase)
      34:	6700 0fd4      	beq.w 100a <main+0x1004>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
      3e:	43f9 0000 2864 	lea 2864 <incbin_swfont_end+0xce>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 4fde 	move.l d0,4fde <DOSBase>
	if (!DOSBase)
      50:	6700 0fac      	beq.w ffe <main+0xff8>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 2870 	pea 2870 <incbin_swfont_end+0xda>
      5a:	4eb9 0000 11a8 	jsr 11a8 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 288c 	move.l #10380,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      7e:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
      84:	4eae ffc4      	jsr -60(a6)
      88:	2079 0000 4fc6 	movea.l 4fc6 <hw>,a0
      8e:	2628 0080      	move.l 128(a0),d3
      92:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
      98:	2200           	move.l d0,d1
      9a:	243c 0000 289c 	move.l #10396,d2
      a0:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      a4:	47f9 0000 1404 	lea 1404 <ClBuild>,a3
      aa:	4e93           	jsr (a3)
      ac:	2440           	movea.l d0,a2
      ae:	23c0 0000 4fea 	move.l d0,4fea <Copperlist1>
  DrawCopper = Copperlist1;
      b4:	23c0 0000 4fd6 	move.l d0,4fd6 <DrawCopper>
  Copperlist2 = ClBuild();
      ba:	4e93           	jsr (a3)
      bc:	23c0 0000 4fe6 	move.l d0,4fe6 <Copperlist2>
  ViewCopper = Copperlist2;
      c2:	23c0 0000 4fca 	move.l d0,4fca <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      c8:	588f           	addq.l #4,sp
      ca:	2012           	move.l (a2),d0
      cc:	b0b9 0000 4f28 	cmp.l 4f28 <ClsSprites>,d0
      d2:	6600 0d98      	bne.w e6c <main+0xe66>
      d6:	206a 0004      	movea.l 4(a2),a0
      da:	b1f9 0000 4f2c 	cmpa.l 4f2c <ClsSprites+0x4>,a0
      e0:	6600 0d8a      	bne.w e6c <main+0xe66>
      e4:	202a 0008      	move.l 8(a2),d0
      e8:	b0b9 0000 4f30 	cmp.l 4f30 <ClsSprites+0x8>,d0
      ee:	6600 0d7c      	bne.w e6c <main+0xe66>
      f2:	206a 000c      	movea.l 12(a2),a0
      f6:	b1f9 0000 4f34 	cmpa.l 4f34 <ClsSprites+0xc>,a0
      fc:	6600 0d6e      	bne.w e6c <main+0xe66>
     100:	202a 0010      	move.l 16(a2),d0
     104:	b0b9 0000 4f38 	cmp.l 4f38 <ClsSprites+0x10>,d0
     10a:	6600 0d60      	bne.w e6c <main+0xe66>
     10e:	206a 0014      	movea.l 20(a2),a0
     112:	b1f9 0000 4f3c 	cmpa.l 4f3c <ClsSprites+0x14>,a0
     118:	6600 0d52      	bne.w e6c <main+0xe66>
     11c:	202a 0018      	move.l 24(a2),d0
     120:	b0b9 0000 4f40 	cmp.l 4f40 <ClsSprites+0x18>,d0
     126:	6600 0d44      	bne.w e6c <main+0xe66>
     12a:	206a 001c      	movea.l 28(a2),a0
     12e:	b1f9 0000 4f44 	cmpa.l 4f44 <ClsSprites+0x1c>,a0
     134:	6600 0d36      	bne.w e6c <main+0xe66>
     138:	202a 0020      	move.l 32(a2),d0
     13c:	b0b9 0000 4f48 	cmp.l 4f48 <ClsSprites+0x20>,d0
     142:	6600 0d28      	bne.w e6c <main+0xe66>
     146:	206a 0024      	movea.l 36(a2),a0
     14a:	b1f9 0000 4f4c 	cmpa.l 4f4c <ClsSprites+0x24>,a0
     150:	6600 0d1a      	bne.w e6c <main+0xe66>
     154:	202a 0028      	move.l 40(a2),d0
     158:	b0b9 0000 4f50 	cmp.l 4f50 <ClsSprites+0x28>,d0
     15e:	6600 0d0c      	bne.w e6c <main+0xe66>
     162:	206a 002c      	movea.l 44(a2),a0
     166:	b1f9 0000 4f54 	cmpa.l 4f54 <ClsSprites+0x2c>,a0
     16c:	6600 0cfe      	bne.w e6c <main+0xe66>
     170:	202a 0030      	move.l 48(a2),d0
     174:	b0b9 0000 4f58 	cmp.l 4f58 <ClsSprites+0x30>,d0
     17a:	6600 0cf0      	bne.w e6c <main+0xe66>
     17e:	206a 0034      	movea.l 52(a2),a0
     182:	b1f9 0000 4f5c 	cmpa.l 4f5c <ClsSprites+0x34>,a0
     188:	6600 0ce2      	bne.w e6c <main+0xe66>
     18c:	202a 0038      	move.l 56(a2),d0
     190:	b0b9 0000 4f60 	cmp.l 4f60 <ClsSprites+0x38>,d0
     196:	6600 0cd4      	bne.w e6c <main+0xe66>
     19a:	246a 003c      	movea.l 60(a2),a2
     19e:	b5f9 0000 4f64 	cmpa.l 4f64 <ClsSprites+0x3c>,a2
     1a4:	6600 0cc6      	bne.w e6c <main+0xe66>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1a8:	2079 0000 4fea 	movea.l 4fea <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ae:	2039 0000 4ef8 	move.l 4ef8 <ClScreen>,d0
     1b4:	b0a8 0040      	cmp.l 64(a0),d0
     1b8:	6600 0cd4      	bne.w e8e <main+0xe88>
     1bc:	2039 0000 4efc 	move.l 4efc <ClScreen+0x4>,d0
     1c2:	b0a8 0044      	cmp.l 68(a0),d0
     1c6:	6600 0cc6      	bne.w e8e <main+0xe88>
     1ca:	2039 0000 4f00 	move.l 4f00 <ClScreen+0x8>,d0
     1d0:	b0a8 0048      	cmp.l 72(a0),d0
     1d4:	6600 0cb8      	bne.w e8e <main+0xe88>
     1d8:	2039 0000 4f04 	move.l 4f04 <ClScreen+0xc>,d0
     1de:	b0a8 004c      	cmp.l 76(a0),d0
     1e2:	6600 0caa      	bne.w e8e <main+0xe88>
     1e6:	2039 0000 4f08 	move.l 4f08 <ClScreen+0x10>,d0
     1ec:	b0a8 0050      	cmp.l 80(a0),d0
     1f0:	6600 0c9c      	bne.w e8e <main+0xe88>
     1f4:	2039 0000 4f0c 	move.l 4f0c <ClScreen+0x14>,d0
     1fa:	b0a8 0054      	cmp.l 84(a0),d0
     1fe:	6600 0c8e      	bne.w e8e <main+0xe88>
     202:	2028 0058      	move.l 88(a0),d0
     206:	b0b9 0000 4f10 	cmp.l 4f10 <ClScreen+0x18>,d0
     20c:	6600 0c80      	bne.w e8e <main+0xe88>
     210:	2039 0000 4f14 	move.l 4f14 <ClScreen+0x1c>,d0
     216:	b0a8 005c      	cmp.l 92(a0),d0
     21a:	6600 0c72      	bne.w e8e <main+0xe88>
     21e:	2028 0060      	move.l 96(a0),d0
     222:	b0b9 0000 4f18 	cmp.l 4f18 <ClScreen+0x20>,d0
     228:	6600 0c64      	bne.w e8e <main+0xe88>
     22c:	2028 0064      	move.l 100(a0),d0
     230:	b0b9 0000 4f1c 	cmp.l 4f1c <ClScreen+0x24>,d0
     236:	6600 0c56      	bne.w e8e <main+0xe88>
     23a:	2028 0068      	move.l 104(a0),d0
     23e:	b0b9 0000 4f20 	cmp.l 4f20 <ClScreen+0x28>,d0
     244:	6600 0c48      	bne.w e8e <main+0xe88>
     248:	2068 006c      	movea.l 108(a0),a0
     24c:	b1f9 0000 4f24 	cmpa.l 4f24 <ClScreen+0x2c>,a0
     252:	6600 0c3a      	bne.w e8e <main+0xe88>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = 0x40000;
     256:	23fc 0004 0000 	move.l #262144,4fda <DrawBuffer>
     25c:	0000 4fda 
  ViewBuffer = 0x50000;
     260:	23fc 0005 0000 	move.l #327680,4fce <ViewBuffer>
     266:	0000 4fce 
  SetBplPointers();
     26a:	45f9 0000 1b34 	lea 1b34 <SetBplPointers>,a2
     270:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     272:	0cb9 0005 0000 	cmpi.l #327680,4fda <DrawBuffer>
     278:	0000 4fda 
     27c:	6700 0db6      	beq.w 1034 <main+0x102e>
    Write( Output(), 
     280:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     286:	4eae ffc4      	jsr -60(a6)
     28a:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     290:	2200           	move.l d0,d1
     292:	243c 0000 289f 	move.l #10399,d2
     298:	763b           	moveq #59,d3
     29a:	4eae ffd0      	jsr -48(a6)
  int test1 = instructions[pos];
     29e:	2079 0000 4fea 	movea.l 4fea <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2a4:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2aa:	0070 
     2ac:	6724           	beq.s 2d2 <main+0x2cc>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ae:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     2b4:	4eae ffc4      	jsr -60(a6)
     2b8:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     2be:	2200           	move.l d0,d1
     2c0:	243c 0000 28db 	move.l #10459,d2
     2c6:	763c           	moveq #60,d3
     2c8:	4eae ffd0      	jsr -48(a6)
     2cc:	2079 0000 4fea 	movea.l 4fea <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2d2:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2d8:	0074 
     2da:	6724           	beq.s 300 <main+0x2fa>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2dc:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     2e2:	4eae ffc4      	jsr -60(a6)
     2e6:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     2ec:	2200           	move.l d0,d1
     2ee:	243c 0000 2918 	move.l #10520,d2
     2f4:	763c           	moveq #60,d3
     2f6:	4eae ffd0      	jsr -48(a6)
     2fa:	2079 0000 4fea 	movea.l 4fea <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     300:	2028 0078      	move.l 120(a0),d0
     304:	b0b9 0000 4ef0 	cmp.l 4ef0 <ClColor>,d0
     30a:	6600 0d58      	bne.w 1064 <main+0x105e>
     30e:	2028 007c      	move.l 124(a0),d0
     312:	b0b9 0000 4ef4 	cmp.l 4ef4 <ClColor+0x4>,d0
     318:	6600 0d4a      	bne.w 1064 <main+0x105e>
  if( instructions[pos] == value ) 
     31c:	70fe           	moveq #-2,d0
     31e:	b0a8 0080      	cmp.l 128(a0),d0
     322:	671e           	beq.s 342 <main+0x33c>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     324:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     32a:	4eae ffc4      	jsr -60(a6)
     32e:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     334:	2200           	move.l d0,d1
     336:	243c 0000 2977 	move.l #10615,d2
     33c:	7622           	moveq #34,d3
     33e:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     342:	47f9 0000 192c 	lea 192c <SwapCl>,a3
     348:	4e93           	jsr (a3)
  if( DrawCopper != Copperlist2)
     34a:	2079 0000 4fd6 	movea.l 4fd6 <DrawCopper>,a0
     350:	b1f9 0000 4fe6 	cmpa.l 4fe6 <Copperlist2>,a0
     356:	671e           	beq.s 376 <main+0x370>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     358:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     35e:	4eae ffc4      	jsr -60(a6)
     362:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     368:	2200           	move.l d0,d1
     36a:	243c 0000 299a 	move.l #10650,d2
     370:	7615           	moveq #21,d3
     372:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     376:	49f9 0000 1b60 	lea 1b60 <PrepareDisplay>,a4
     37c:	4e94           	jsr (a4)
  if( DrawBuffer != Bitplane1) 
     37e:	2039 0000 4fda 	move.l 4fda <DrawBuffer>,d0
     384:	b0b9 0000 4fe2 	cmp.l 4fe2 <Bitplane1>,d0
     38a:	671e           	beq.s 3aa <main+0x3a4>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     38c:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     392:	4eae ffc4      	jsr -60(a6)
     396:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     39c:	2200           	move.l d0,d1
     39e:	243c 0000 29b0 	move.l #10672,d2
     3a4:	7637           	moveq #55,d3
     3a6:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3aa:	2079 0000 4fd6 	movea.l 4fd6 <DrawCopper>,a0
     3b0:	b1f9 0000 4fea 	cmpa.l 4fea <Copperlist1>,a0
     3b6:	671e           	beq.s 3d6 <main+0x3d0>
    Write( Output(), 
     3b8:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     3be:	4eae ffc4      	jsr -60(a6)
     3c2:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     3c8:	2200           	move.l d0,d1
     3ca:	243c 0000 29e8 	move.l #10728,d2
     3d0:	7639           	moveq #57,d3
     3d2:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3d6:	4e94           	jsr (a4)

  if( ViewBuffer != Bitplane2) 
     3d8:	2039 0000 4fce 	move.l 4fce <ViewBuffer>,d0
     3de:	b0b9 0000 4fd2 	cmp.l 4fd2 <Bitplane2>,d0
     3e4:	671e           	beq.s 404 <main+0x3fe>
    Write( Output(), 
     3e6:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     3ec:	4eae ffc4      	jsr -60(a6)
     3f0:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     3f6:	2200           	move.l d0,d1
     3f8:	243c 0000 2a22 	move.l #10786,d2
     3fe:	7638           	moveq #56,d3
     400:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     404:	2079 0000 4fca 	movea.l 4fca <ViewCopper>,a0
     40a:	b1f9 0000 4fe6 	cmpa.l 4fe6 <Copperlist2>,a0
     410:	671e           	beq.s 430 <main+0x42a>
    Write( Output(), 
     412:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     418:	4eae ffc4      	jsr -60(a6)
     41c:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     422:	2200           	move.l d0,d1
     424:	243c 0000 2a5b 	move.l #10843,d2
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
     434:	2079 0000 4fca 	movea.l 4fca <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     43a:	7000           	moveq #0,d0
     43c:	3028 0072      	move.w 114(a0),d0
     440:	4840           	swap d0
     442:	4240           	clr.w d0
     444:	7200           	moveq #0,d1
     446:	3228 0076      	move.w 118(a0),d1
     44a:	d081           	add.l d1,d0
  if( pointer != Bitplane2) 
     44c:	b0b9 0000 4fd2 	cmp.l 4fd2 <Bitplane2>,d0
     452:	671e           	beq.s 472 <main+0x46c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     454:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     45a:	4eae ffc4      	jsr -60(a6)
     45e:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     464:	2200           	move.l d0,d1
     466:	243c 0000 2a96 	move.l #10902,d2
     46c:	7648           	moveq #72,d3
     46e:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     472:	4e93           	jsr (a3)
  SetBplPointers();
     474:	4e92           	jsr (a2)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = ViewCopper;
     476:	2079 0000 4fca 	movea.l 4fca <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     47c:	7000           	moveq #0,d0
     47e:	3028 0072      	move.w 114(a0),d0
     482:	4840           	swap d0
     484:	4240           	clr.w d0
     486:	7200           	moveq #0,d1
     488:	3228 0076      	move.w 118(a0),d1
     48c:	d081           	add.l d1,d0
  if( pointer != Bitplane1) 
     48e:	b0b9 0000 4fe2 	cmp.l 4fe2 <Bitplane1>,d0
     494:	671e           	beq.s 4b4 <main+0x4ae>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     496:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     49c:	4eae ffc4      	jsr -60(a6)
     4a0:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     4a6:	2200           	move.l d0,d1
     4a8:	243c 0000 2adf 	move.l #10975,d2
     4ae:	7649           	moveq #73,d3
     4b0:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4b4:	4e93           	jsr (a3)
  SetBplPointers();
     4b6:	4e92           	jsr (a2)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = ViewCopper;
     4b8:	2079 0000 4fca 	movea.l 4fca <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4be:	7000           	moveq #0,d0
     4c0:	3028 0072      	move.w 114(a0),d0
     4c4:	4840           	swap d0
     4c6:	4240           	clr.w d0
     4c8:	7200           	moveq #0,d1
     4ca:	3228 0076      	move.w 118(a0),d1
     4ce:	d081           	add.l d1,d0
  if( pointer != Bitplane2) 
     4d0:	b0b9 0000 4fd2 	cmp.l 4fd2 <Bitplane2>,d0
     4d6:	671e           	beq.s 4f6 <main+0x4f0>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4d8:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     4de:	4eae ffc4      	jsr -60(a6)
     4e2:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     4e8:	2200           	move.l d0,d1
     4ea:	243c 0000 2b29 	move.l #11049,d2
     4f0:	7648           	moveq #72,d3
     4f2:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     4f6:	2f3c 0000 c800 	move.l #51200,-(sp)
     4fc:	4878 0084      	pea 84 <main+0x7e>
     500:	4eb9 0000 1c9e 	jsr 1c9e <FreeDisplay>
  TestCopyColumnOfZoom();
}

void ZoomTestDisplay() {

  PrepareDisplayZoom();
     506:	283c 0000 1952 	move.l #6482,d4
     50c:	2044           	movea.l d4,a0
     50e:	4e90           	jsr (a0)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     510:	4878 0010      	pea 10 <main+0xa>
     514:	4879 0000 4f28 	pea 4f28 <ClsSprites>
     51a:	42a7           	clr.l -(sp)
     51c:	2f39 0000 4fea 	move.l 4fea <Copperlist1>,-(sp)
     522:	45f9 0000 122e 	lea 122e <TestCopperlistBatch>,a2
     528:	4e92           	jsr (a2)
     52a:	4fef 0018      	lea 24(sp),sp
     52e:	4a80           	tst.l d0
     530:	661e           	bne.s 550 <main+0x54a>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     532:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     538:	4eae ffc4      	jsr -60(a6)
     53c:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     542:	2200           	move.l d0,d1
     544:	243c 0000 2b72 	move.l #11122,d2
     54a:	762c           	moveq #44,d3
     54c:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
     550:	4878 000c      	pea c <main+0x6>
     554:	4879 0000 4ec0 	pea 4ec0 <ClScreenZoom>
     55a:	4878 0010      	pea 10 <main+0xa>
     55e:	2f39 0000 4fea 	move.l 4fea <Copperlist1>,-(sp)
     564:	4e92           	jsr (a2)
     566:	4fef 0010      	lea 16(sp),sp
     56a:	4a80           	tst.l d0
     56c:	661e           	bne.s 58c <main+0x586>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     56e:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     574:	4eae ffc4      	jsr -60(a6)
     578:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     57e:	2200           	move.l d0,d1
     580:	243c 0000 2ba8 	move.l #11176,d2
     586:	7636           	moveq #54,d3
     588:	4eae ffd0      	jsr -48(a6)
  return 0;
}

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
  UWORD *copword = (UWORD *) DrawCopper;
     58c:	2079 0000 4fd6 	movea.l 4fd6 <DrawCopper>,a0
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
     5a8:	23fc 0005 0000 	move.l #327680,4fda <DrawBuffer>
     5ae:	0000 4fda 
  ViewBuffer = (ULONG *) tmp;
     5b2:	23fc 0004 0000 	move.l #262144,4fce <ViewBuffer>
     5b8:	0000 4fce 
  Zoom_SetBplPointers();
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
     5bc:	2f3c 00e0 0004 	move.l #14680068,-(sp)
     5c2:	4878 001c      	pea 1c <main+0x16>
     5c6:	2f39 0000 4fea 	move.l 4fea <Copperlist1>,-(sp)
     5cc:	49f9 0000 1210 	lea 1210 <TestCopperlistPos>,a4
     5d2:	4e94           	jsr (a4)
     5d4:	4fef 000c      	lea 12(sp),sp
     5d8:	4a80           	tst.l d0
     5da:	661e           	bne.s 5fa <main+0x5f4>
    Write(Output(), 
     5dc:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     5e2:	4eae ffc4      	jsr -60(a6)
     5e6:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     5ec:	2200           	move.l d0,d1
     5ee:	243c 0000 28db 	move.l #10459,d2
     5f4:	763c           	moveq #60,d3
     5f6:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
     5fa:	2f3c 00e2 0000 	move.l #14811136,-(sp)
     600:	4878 001d      	pea 1d <main+0x17>
     604:	2f39 0000 4fea 	move.l 4fea <Copperlist1>,-(sp)
     60a:	4e94           	jsr (a4)
     60c:	4fef 000c      	lea 12(sp),sp
     610:	4a80           	tst.l d0
     612:	661e           	bne.s 632 <main+0x62c>
    Write(Output(), 
     614:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     61a:	4eae ffc4      	jsr -60(a6)
     61e:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     624:	2200           	move.l d0,d1
     626:	243c 0000 2918 	move.l #10520,d2
     62c:	763c           	moveq #60,d3
     62e:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
     632:	2f3c 00e4 0004 	move.l #14942212,-(sp)
     638:	4878 001e      	pea 1e <main+0x18>
     63c:	2f39 0000 4fea 	move.l 4fea <Copperlist1>,-(sp)
     642:	4e94           	jsr (a4)
     644:	4fef 000c      	lea 12(sp),sp
     648:	4a80           	tst.l d0
     64a:	661e           	bne.s 66a <main+0x664>
    Write(Output(), 
     64c:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     652:	4eae ffc4      	jsr -60(a6)
     656:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     65c:	2200           	move.l d0,d1
     65e:	243c 0000 2bdf 	move.l #11231,d2
     664:	763c           	moveq #60,d3
     666:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
     66a:	2f3c 00e6 2800 	move.l #15083520,-(sp)
     670:	4878 001f      	pea 1f <main+0x19>
     674:	2f39 0000 4fea 	move.l 4fea <Copperlist1>,-(sp)
     67a:	4e94           	jsr (a4)
     67c:	4fef 000c      	lea 12(sp),sp
     680:	4a80           	tst.l d0
     682:	661e           	bne.s 6a2 <main+0x69c>
    Write(Output(), 
     684:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     68a:	4eae ffc4      	jsr -60(a6)
     68e:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     694:	2200           	move.l d0,d1
     696:	243c 0000 2c1c 	move.l #11292,d2
     69c:	763c           	moveq #60,d3
     69e:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl2pl should be 2800\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
     6a2:	4878 0002      	pea 2 <_start+0x2>
     6a6:	4879 0000 4ef0 	pea 4ef0 <ClColor>
     6ac:	4878 0020      	pea 20 <main+0x1a>
     6b0:	2f39 0000 4fea 	move.l 4fea <Copperlist1>,-(sp)
     6b6:	4e92           	jsr (a2)
     6b8:	4fef 0010      	lea 16(sp),sp
     6bc:	4a80           	tst.l d0
     6be:	661e           	bne.s 6de <main+0x6d8>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     6c0:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     6c6:	4eae ffc4      	jsr -60(a6)
     6ca:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     6d0:	2200           	move.l d0,d1
     6d2:	243c 0000 2955 	move.l #10581,d2
     6d8:	7621           	moveq #33,d3
     6da:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     6de:	7ec0           	moveq #-64,d7
     6e0:	de8d           	add.l a5,d7
     6e2:	4878 0040      	pea 40 <main+0x3a>
     6e6:	4879 0000 2e7e 	pea 2e7e <incbin_swfont_end+0x6e8>
     6ec:	2f07           	move.l d7,-(sp)
     6ee:	4eb9 0000 1d56 	jsr 1d56 <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
     6f4:	4878 0010      	pea 10 <main+0xa>
     6f8:	2f07           	move.l d7,-(sp)
     6fa:	4878 0022      	pea 22 <main+0x1c>
     6fe:	2f39 0000 4fea 	move.l 4fea <Copperlist1>,-(sp)
     704:	4e92           	jsr (a2)
     706:	4fef 001c      	lea 28(sp),sp
     70a:	4a80           	tst.l d0
     70c:	661e           	bne.s 72c <main+0x726>
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);
     70e:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     714:	4eae ffc4      	jsr -60(a6)
     718:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     71e:	2200           	move.l d0,d1
     720:	243c 0000 2c59 	move.l #11353,d2
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
     750:	2f39 0000 4fea 	move.l 4fea <Copperlist1>,-(sp)
     756:	4e92           	jsr (a2)
     758:	4fef 0010      	lea 16(sp),sp
     75c:	4a80           	tst.l d0
     75e:	661e           	bne.s 77e <main+0x778>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     760:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     766:	4eae ffc4      	jsr -60(a6)
     76a:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     770:	2200           	move.l d0,d1
     772:	243c 0000 2c7b 	move.l #11387,d2
     778:	762c           	moveq #44,d3
     77a:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
     77e:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffddfe5>
     782:	4878 2922      	pea 2922 <incbin_swfont_end+0x18c>
     786:	2f39 0000 4fea 	move.l 4fea <Copperlist1>,-(sp)
     78c:	4e94           	jsr (a4)
     78e:	4fef 000c      	lea 12(sp),sp
     792:	4a80           	tst.l d0
     794:	6700 0766      	beq.w efc <main+0xef6>
    Write( Output(), "Copperlist End not correctly set.\n", 34);

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     798:	2f3c 0001 2c00 	move.l #76800,-(sp)
     79e:	2f3c 0000 a48c 	move.l #42124,-(sp)
     7a4:	4eb9 0000 1c9e 	jsr 1c9e <FreeDisplay>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     7aa:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
     7b0:	7004           	moveq #4,d0
     7b2:	7202           	moveq #2,d1
     7b4:	4eae ff3a      	jsr -198(a6)
     7b8:	23c0 0000 4fa8 	move.l d0,4fa8 <Zoom_ZoomBlitMask>

}

void TestBlitleftOfZoom() {
  Zoom_Init();
  PrepareDisplayZoom();
     7be:	2044           	movea.l d4,a0
     7c0:	4e90           	jsr (a0)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     7c2:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
     7c8:	203c 0000 c800 	move.l #51200,d0
     7ce:	7202           	moveq #2,d1
     7d0:	4eae ff3a      	jsr -198(a6)
     7d4:	2640           	movea.l d0,a3
     7d6:	23c0 0000 4fac 	move.l d0,4fac <Zoom_Source>
  if( Zoom_Source == 0) {
     7dc:	508f           	addq.l #8,sp
     7de:	6700 0784      	beq.w f64 <main+0xf5e>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }

  UWORD *tstsource = Zoom_Source;
  *tstsource++ = 0x0000;
     7e2:	2040           	movea.l d0,a0
     7e4:	4258           	clr.w (a0)+
     7e6:	2408           	move.l a0,d2
  *tstsource = 0x0080;
     7e8:	377c 0080 0002 	move.w #128,2(a3)
  tstsource += 19;
  *tstsource = 0x1000;
     7ee:	377c 1000 0028 	move.w #4096,40(a3)
  tstsource++;
  *tstsource = 0x8e88;
     7f4:	377c 8e88 002a 	move.w #-29048,42(a3)
  tstsource += 19;

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
  *tstsource++ = 0x0000;
     7fa:	426b 13d8      	clr.w 5080(a3)
  *tstsource = 0x00ff;
     7fe:	377c 00ff 13da 	move.w #255,5082(a3)

  Zoom_ZoomBlitLeft( Zoom_Source+1, (UWORD *)DrawBuffer, 8, 128);
     804:	2639 0000 4fda 	move.l 4fda <DrawBuffer>,d3
  *Zoom_ZoomBlitMask = (0xffff << (16-colnr)) & 0xffff; 
     80a:	2079 0000 4fa8 	movea.l 4fa8 <Zoom_ZoomBlitMask>,a0
     810:	20bc 0000 ff00 	move.l #65280,(a0)
  WaitBlit();
     816:	2c79 0000 4fc2 	movea.l 4fc2 <GfxBase>,a6
     81c:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     820:	2079 0000 4fc6 	movea.l 4fc6 <hw>,a0
     826:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xfe4 + shifta;
     82c:	317c ffe4 0040 	move.w #-28,64(a0)
  hw->bltafwm = 0xffff;
     832:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     838:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     83e:	317c 0024 0064 	move.w #36,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     844:	317c 0024 0062 	move.w #36,98(a0)
  hw->bltcmod = -4;
     84a:	317c fffc 0060 	move.w #-4,96(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     850:	317c 0024 0066 	move.w #36,102(a0)
  hw->bltcpt= (UWORD *) Zoom_ZoomBlitMask;
     856:	2179 0000 4fa8 	move.l 4fa8 <Zoom_ZoomBlitMask>,72(a0)
     85c:	0048 
  hw->bltapt = srca;
     85e:	2142 0050      	move.l d2,80(a0)
  hw->bltbpt = srcb;
     862:	214b 004c      	move.l a3,76(a0)
  hw->bltdpt = destination;
     866:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
     86a:	317c 2002 0058 	move.w #8194,88(a0)
  WaitBlit();
     870:	2c79 0000 4fc2 	movea.l 4fc2 <GfxBase>,a6
     876:	4eae ff1c      	jsr -228(a6)
  UWORD *br = (UWORD *) 0x200;
  *br = 0;
     87a:	4278 0200      	clr.w 200 <main+0x1fa>
  UWORD *destination = (UWORD *)DrawBuffer+1;
     87e:	2679 0000 4fda 	movea.l 4fda <DrawBuffer>,a3
  if( *destination != 0x0180) {
     884:	0c6b 0180 0002 	cmpi.w #384,2(a3)
     88a:	671e           	beq.s 8aa <main+0x8a4>
    Write(  Output(), "Zoomblitleft - First row wrong.\n",32);
     88c:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     892:	4eae ffc4      	jsr -60(a6)
     896:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     89c:	2200           	move.l d0,d1
     89e:	243c 0000 2ce0 	move.l #11488,d2
     8a4:	7620           	moveq #32,d3
     8a6:	4eae ffd0      	jsr -48(a6)
  }
  destination += 20;
  if( *destination != 0x1d88)
     8aa:	0c6b 1d88 002a 	cmpi.w #7560,42(a3)
     8b0:	671e           	beq.s 8d0 <main+0x8ca>
    Write(  Output(), "Zoomblitleft: Second row wrong.\n",32);
     8b2:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     8b8:	4eae ffc4      	jsr -60(a6)
     8bc:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     8c2:	2200           	move.l d0,d1
     8c4:	243c 0000 2d01 	move.l #11521,d2
     8ca:	7620           	moveq #32,d3
     8cc:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
  destination++;
  if( *destination != 0x01ff) {
     8d0:	2079 0000 4fda 	movea.l 4fda <DrawBuffer>,a0
     8d6:	0c68 01ff 13da 	cmpi.w #511,5082(a0)
     8dc:	671e           	beq.s 8fc <main+0x8f6>
    Write(  Output(), "Zoomblitleft: Last row wrong.\n",40);
     8de:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     8e4:	4eae ffc4      	jsr -60(a6)
     8e8:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     8ee:	2200           	move.l d0,d1
     8f0:	243c 0000 2d22 	move.l #11554,d2
     8f6:	7628           	moveq #40,d3
     8f8:	4eae ffd0      	jsr -48(a6)
  }
  FreeMem( Zoom_Source, 40*256*5);
     8fc:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
     902:	2279 0000 4fac 	movea.l 4fac <Zoom_Source>,a1
     908:	203c 0000 c800 	move.l #51200,d0
     90e:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     912:	2f3c 0001 2c00 	move.l #76800,-(sp)
     918:	2f3c 0000 a48c 	move.l #42124,-(sp)
     91e:	4eb9 0000 1c9e 	jsr 1c9e <FreeDisplay>
     924:	508f           	addq.l #8,sp
}

void TestCopyColumnOfZoom() {

  PrepareDisplayZoom();
     926:	2044           	movea.l d4,a0
     928:	4e90           	jsr (a0)

  UWORD *destination = (UWORD *)DrawBuffer;
     92a:	2079 0000 4fda 	movea.l 4fda <DrawBuffer>,a0
  *destination= 0x0000;
     930:	4250           	clr.w (a0)
  destination += 20;
  *destination= 0x000f;
     932:	317c 000f 0028 	move.w #15,40(a0)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     938:	317c 000f 3bd8 	move.w #15,15320(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     93e:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
     944:	203c 0000 c800 	move.l #51200,d0
     94a:	7202           	moveq #2,d1
     94c:	4eae ff3a      	jsr -198(a6)
     950:	2640           	movea.l d0,a3
     952:	23c0 0000 4fac 	move.l d0,4fac <Zoom_Source>
  if( Zoom_Source == 0) {
     958:	6700 065e      	beq.w fb8 <main+0xfb2>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }

  UWORD *tstsource = Zoom_Source;
  *tstsource = 0xffff;
     95c:	36bc ffff      	move.w #-1,(a3)
  tstsource += 20;
  *tstsource = 0xffff;
     960:	377c ffff 0028 	move.w #-1,40(a3)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0xc000;
     966:	377c c000 3bd8 	move.w #-16384,15320(a3)
  Zoom_CopyColumn( Zoom_Source, (UWORD *)DrawBuffer, 1, 1);
     96c:	2439 0000 4fda 	move.l 4fda <DrawBuffer>,d2
  WaitBlit();
     972:	2c79 0000 4fc2 	movea.l 4fc2 <GfxBase>,a6
     978:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     97c:	2079 0000 4fc6 	movea.l 4fc6 <hw>,a0
     982:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4;
     988:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltafwm = 0xffff;
     98e:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     994:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 2;
     99a:	317c 0026 0064 	move.w #38,100(a0)
  hw->bltbmod = ZMLINESIZE - 2;
     9a0:	317c 0026 0062 	move.w #38,98(a0)
  hw->bltdmod = ZMLINESIZE - 2;
     9a6:	317c 0026 0066 	move.w #38,102(a0)
  hw->bltcdat = bltmask;
     9ac:	317c 4000 0070 	move.w #16384,112(a0)
  hw->bltapt = (UWORD *) sourcepos;
     9b2:	214b 0050      	move.l a3,80(a0)
  hw->bltbpt = (UWORD *) destpos;
     9b6:	2142 004c      	move.l d2,76(a0)
  hw->bltdpt = (UWORD *) destpos;
     9ba:	2142 0054      	move.l d2,84(a0)
  hw->bltsize = ZMCOLHEIGHT*64+1;
     9be:	317c 6001 0058 	move.w #24577,88(a0)
  
  WaitBlit();
     9c4:	2c79 0000 4fc2 	movea.l 4fc2 <GfxBase>,a6
     9ca:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     9ce:	2679 0000 4fda 	movea.l 4fda <DrawBuffer>,a3
  if( *destination != 0x4000)
     9d4:	0c53 4000      	cmpi.w #16384,(a3)
     9d8:	671e           	beq.s 9f8 <main+0x9f2>
    Write(  Output(), "Zoomtest: CopyColumn2 - First row wrong.\n",41);
     9da:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     9e0:	4eae ffc4      	jsr -60(a6)
     9e4:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     9ea:	2200           	move.l d0,d1
     9ec:	243c 0000 2d41 	move.l #11585,d2
     9f2:	7629           	moveq #41,d3
     9f4:	4eae ffd0      	jsr -48(a6)

  destination+= 20;
  if( *destination != 0x400f)
     9f8:	0c6b 400f 0028 	cmpi.w #16399,40(a3)
     9fe:	671e           	beq.s a1e <main+0xa18>
    Write(  Output(), "Zoomtest: CopyColumn2 - Second row wrong.\n",42);
     a00:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     a06:	4eae ffc4      	jsr -60(a6)
     a0a:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     a10:	2200           	move.l d0,d1
     a12:	243c 0000 2d6b 	move.l #11627,d2
     a18:	762a           	moveq #42,d3
     a1a:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x400f)
     a1e:	2679 0000 4fda 	movea.l 4fda <DrawBuffer>,a3
     a24:	0c6b 400f 3bd8 	cmpi.w #16399,15320(a3)
     a2a:	6724           	beq.s a50 <main+0xa4a>
    Write(  Output(), "Zoomtest: CopyColumn2 - Last row wrong.\n",40);
     a2c:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     a32:	4eae ffc4      	jsr -60(a6)
     a36:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     a3c:	2200           	move.l d0,d1
     a3e:	243c 0000 2d96 	move.l #11670,d2
     a44:	7628           	moveq #40,d3
     a46:	4eae ffd0      	jsr -48(a6)
     a4a:	2679 0000 4fda 	movea.l 4fda <DrawBuffer>,a3

  destination = DrawBuffer;
  *destination= 0x0000;
     a50:	4253           	clr.w (a3)
  destination += 20;
  *destination= 0x000f;
     a52:	377c 000f 0028 	move.w #15,40(a3)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     a58:	377c 000f 3bd8 	move.w #15,15320(a3)

  tstsource = Zoom_Source;
     a5e:	2839 0000 4fac 	move.l 4fac <Zoom_Source>,d4
  *tstsource = 0xffff;
     a64:	2044           	movea.l d4,a0
     a66:	30bc ffff      	move.w #-1,(a0)
  tstsource += 20;
  *tstsource = 0xffff;
     a6a:	317c ffff 0028 	move.w #-1,40(a0)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0x8000;
     a70:	317c 8000 3bd8 	move.w #-32768,15320(a0)
  WaitBlit();
     a76:	2c79 0000 4fc2 	movea.l 4fc2 <GfxBase>,a6
     a7c:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     a80:	2079 0000 4fc6 	movea.l 4fc6 <hw>,a0
     a86:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4;
     a8c:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltafwm = 0xffff;
     a92:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     a98:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 2;
     a9e:	317c 0026 0064 	move.w #38,100(a0)
  hw->bltbmod = ZMLINESIZE - 2;
     aa4:	317c 0026 0062 	move.w #38,98(a0)
  hw->bltdmod = ZMLINESIZE - 2;
     aaa:	317c 0026 0066 	move.w #38,102(a0)
  hw->bltcdat = bltmask;
     ab0:	317c 8000 0070 	move.w #-32768,112(a0)
  hw->bltapt = (UWORD *) sourcepos;
     ab6:	2144 0050      	move.l d4,80(a0)
  hw->bltbpt = (UWORD *) destpos;
     aba:	214b 004c      	move.l a3,76(a0)
  hw->bltdpt = (UWORD *) destpos;
     abe:	214b 0054      	move.l a3,84(a0)
  hw->bltsize = ZMCOLHEIGHT*64+1;
     ac2:	317c 6001 0058 	move.w #24577,88(a0)
  Zoom_CopyColumn( Zoom_Source, (UWORD *)DrawBuffer, 0, 0);
  
  WaitBlit();
     ac8:	2c79 0000 4fc2 	movea.l 4fc2 <GfxBase>,a6
     ace:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     ad2:	2679 0000 4fda 	movea.l 4fda <DrawBuffer>,a3
  if( *destination != 0x8000)
     ad8:	0c53 8000      	cmpi.w #-32768,(a3)
     adc:	671e           	beq.s afc <main+0xaf6>
    Write(  Output(), "Zoomtest: CopyColumn - First row wrong.\n",40);
     ade:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     ae4:	4eae ffc4      	jsr -60(a6)
     ae8:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     aee:	2200           	move.l d0,d1
     af0:	243c 0000 2dbf 	move.l #11711,d2
     af6:	7628           	moveq #40,d3
     af8:	4eae ffd0      	jsr -48(a6)

  destination+= 20;
  if( *destination != 0x800f)
     afc:	0c6b 800f 0028 	cmpi.w #-32753,40(a3)
     b02:	671e           	beq.s b22 <main+0xb1c>
    Write(  Output(), "Zoomtest: CopyColumn - Second row wrong.\n",41);
     b04:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     b0a:	4eae ffc4      	jsr -60(a6)
     b0e:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     b14:	2200           	move.l d0,d1
     b16:	243c 0000 2de8 	move.l #11752,d2
     b1c:	7629           	moveq #41,d3
     b1e:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x800f)
     b22:	2079 0000 4fda 	movea.l 4fda <DrawBuffer>,a0
     b28:	0c68 800f 3bd8 	cmpi.w #-32753,15320(a0)
     b2e:	671e           	beq.s b4e <main+0xb48>
    Write(  Output(), "Zoomtest: CopyColumn - Last row wrong.\n",39);
     b30:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     b36:	4eae ffc4      	jsr -60(a6)
     b3a:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     b40:	2200           	move.l d0,d1
     b42:	243c 0000 2e12 	move.l #11794,d2
     b48:	7627           	moveq #39,d3
     b4a:	4eae ffd0      	jsr -48(a6)

  FreeMem( Zoom_Source, 40*256*5);
     b4e:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
     b54:	2279 0000 4fac 	movea.l 4fac <Zoom_Source>,a1
     b5a:	203c 0000 c800 	move.l #51200,d0
     b60:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     b64:	2f3c 0001 2c00 	move.l #76800,-(sp)
     b6a:	2f3c 0000 a48c 	move.l #42124,-(sp)
     b70:	4eb9 0000 1c9e 	jsr 1c9e <FreeDisplay>
     b76:	508f           	addq.l #8,sp
char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
  PrepareDisplaySW();
     b78:	4eb9 0000 1b60 	jsr 1b60 <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     b7e:	4878 0010      	pea 10 <main+0xa>
     b82:	4879 0000 4f28 	pea 4f28 <ClsSprites>
     b88:	42a7           	clr.l -(sp)
     b8a:	2f39 0000 4fea 	move.l 4fea <Copperlist1>,-(sp)
     b90:	4e92           	jsr (a2)
     b92:	4fef 0010      	lea 16(sp),sp
     b96:	4a80           	tst.l d0
     b98:	661e           	bne.s bb8 <main+0xbb2>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     b9a:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     ba0:	4eae ffc4      	jsr -60(a6)
     ba4:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     baa:	2200           	move.l d0,d1
     bac:	243c 0000 2b72 	move.l #11122,d2
     bb2:	762c           	moveq #44,d3
     bb4:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     bb8:	4878 000c      	pea c <main+0x6>
     bbc:	4879 0000 4ef8 	pea 4ef8 <ClScreen>
     bc2:	4878 0010      	pea 10 <main+0xa>
     bc6:	2f39 0000 4fea 	move.l 4fea <Copperlist1>,-(sp)
     bcc:	4e92           	jsr (a2)
     bce:	4fef 0010      	lea 16(sp),sp
     bd2:	4a80           	tst.l d0
     bd4:	661e           	bne.s bf4 <main+0xbee>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     bd6:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     bdc:	4eae ffc4      	jsr -60(a6)
     be0:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     be6:	2200           	move.l d0,d1
     be8:	243c 0000 2ba8 	move.l #11176,d2
     bee:	7636           	moveq #54,d3
     bf0:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
     bf4:	4878 0002      	pea 2 <_start+0x2>
     bf8:	4879 0000 4ef0 	pea 4ef0 <ClColor>
     bfe:	4878 001e      	pea 1e <main+0x18>
     c02:	2f39 0000 4fea 	move.l 4fea <Copperlist1>,-(sp)
     c08:	4e92           	jsr (a2)
     c0a:	4fef 0010      	lea 16(sp),sp
     c0e:	4a80           	tst.l d0
     c10:	661e           	bne.s c30 <main+0xc2a>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     c12:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     c18:	4eae ffc4      	jsr -60(a6)
     c1c:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     c22:	2200           	move.l d0,d1
     c24:	243c 0000 2955 	move.l #10581,d2
     c2a:	7621           	moveq #33,d3
     c2c:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
     c30:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffddfe5>
     c34:	4878 0020      	pea 20 <main+0x1a>
     c38:	2f39 0000 4fea 	move.l 4fea <Copperlist1>,-(sp)
     c3e:	4e94           	jsr (a4)
     c40:	4fef 000c      	lea 12(sp),sp
     c44:	4a80           	tst.l d0
     c46:	6700 0292      	beq.w eda <main+0xed4>
    Write( Output(), "Copperlist End not correctly set.\n", 34);

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
     c4a:	2479 0000 4fda 	movea.l 4fda <DrawBuffer>,a2
     c50:	4879 0000 2e3a 	pea 2e3a <incbin_swfont_end+0x6a4>
     c56:	2f0a           	move.l a2,-(sp)
     c58:	4eb9 0000 10b8 	jsr 10b8 <WriteFont.constprop.1>

  UWORD *tstpointer = DrawBuffer;
  if( *tstpointer != 0xff00)
     c5e:	508f           	addq.l #8,sp
     c60:	0c52 ff00      	cmpi.w #-256,(a2)
     c64:	671e           	beq.s c84 <main+0xc7e>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
     c66:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     c6c:	4eae ffc4      	jsr -60(a6)
     c70:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     c76:	2200           	move.l d0,d1
     c78:	243c 0000 2e4b 	move.l #11851,d2
     c7e:	7631           	moveq #49,d3
     c80:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
     c84:	2f3c 0000 c800 	move.l #51200,-(sp)
     c8a:	4878 0084      	pea 84 <main+0x7e>
     c8e:	4eb9 0000 1c9e 	jsr 1c9e <FreeDisplay>
  RunTests();
	Delay(50);
     c94:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     c9a:	7232           	moveq #50,d1
     c9c:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
     ca0:	247c 00f0 ff60 	movea.l #15794016,a2
     ca6:	508f           	addq.l #8,sp
     ca8:	4a92           	tst.l (a2)
     caa:	6718           	beq.s cc4 <main+0xcbe>
     cac:	4878 0001      	pea 1 <_start+0x1>
     cb0:	47f9 0000 1106 	lea 1106 <warpmode.part.0>,a3
     cb6:	4e93           	jsr (a3)
     cb8:	588f           	addq.l #4,sp
     cba:	4a92           	tst.l (a2)
     cbc:	6706           	beq.s cc4 <main+0xcbe>
     cbe:	42a7           	clr.l -(sp)
     cc0:	4e93           	jsr (a3)
     cc2:	588f           	addq.l #4,sp
  ViewCopper = tmp;
  hw->cop1lc = ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
     cc4:	2c79 0000 4fc2 	movea.l 4fc2 <GfxBase>,a6
     cca:	23ee 0022 0000 	move.l 34(a6),4fb0 <ActiView>
     cd0:	4fb0 
	OwnBlitter();
     cd2:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     cd6:	2c79 0000 4fc2 	movea.l 4fc2 <GfxBase>,a6
     cdc:	4eae ff1c      	jsr -228(a6)
	Disable();
     ce0:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
     ce6:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
     cea:	2679 0000 4fc6 	movea.l 4fc6 <hw>,a3
     cf0:	302b 0010      	move.w 16(a3),d0
     cf4:	33c0 0000 4fb4 	move.w d0,4fb4 <SystemADKCON>
	SystemInts=hw->intenar;
     cfa:	302b 001c      	move.w 28(a3),d0
     cfe:	33c0 0000 4fb8 	move.w d0,4fb8 <SystemInts>
	SystemDMA=hw->dmaconr;
     d04:	302b 0002      	move.w 2(a3),d0
     d08:	33c0 0000 4fb6 	move.w d0,4fb6 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
     d0e:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     d14:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
     d1a:	45f9 0000 1d10 	lea 1d10 <WaitVbl>,a2
     d20:	4e92           	jsr (a2)
	WaitVbl();
     d22:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
     d24:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
     d2a:	2c79 0000 4fc2 	movea.l 4fc2 <GfxBase>,a6
     d30:	93c9           	suba.l a1,a1
     d32:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     d36:	2c79 0000 4fc2 	movea.l 4fc2 <GfxBase>,a6
     d3c:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     d40:	2c79 0000 4fc2 	movea.l 4fc2 <GfxBase>,a6
     d46:	4eae fef2      	jsr -270(a6)

	WaitVbl();
     d4a:	4e92           	jsr (a2)
	WaitVbl();
     d4c:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     d4e:	3b7c 4e7a ffc0 	move.w #20090,-64(a5)
     d54:	3b7c 0801 ffc2 	move.w #2049,-62(a5)
     d5a:	3b7c 4e73 ffc4 	move.w #20083,-60(a5)
	if (SysBase->AttnFlags & AFF_68010) 
     d60:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
     d66:	082e 0000 0129 	btst #0,297(a6)
     d6c:	6700 031e      	beq.w 108c <main+0x1086>
		vbr = (APTR)Supervisor((void*)getvbr);
     d70:	cf8d           	exg d7,a5
     d72:	4eae ffe2      	jsr -30(a6)
     d76:	cf8d           	exg d7,a5

	VBR=GetVBR();
     d78:	23c0 0000 4fba 	move.l d0,4fba <VBR.lto_priv.2>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     d7e:	2079 0000 4fba 	movea.l 4fba <VBR.lto_priv.2>,a0
     d84:	2828 006c      	move.l 108(a0),d4
	SystemIrq=GetInterruptHandler(); //store interrupt register
     d88:	23c4 0000 4fbe 	move.l d4,4fbe <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
     d8e:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
     d90:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     d92:	2079 0000 4fc6 	movea.l 4fc6 <hw>,a0
     d98:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     d9c:	3028 0002      	move.w 2(a0),d0
     da0:	0800 000e      	btst #14,d0
     da4:	66f6           	bne.s d9c <main+0xd96>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
     da6:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     dac:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
     db2:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     db8:	2279 0000 4fba 	movea.l 4fba <VBR.lto_priv.2>,a1
     dbe:	2344 006c      	move.l d4,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
     dc2:	2c79 0000 4fc2 	movea.l 4fc2 <GfxBase>,a6
     dc8:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
     dce:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
     dd4:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
     dda:	3039 0000 4fb8 	move.w 4fb8 <SystemInts>,d0
     de0:	0040 8000      	ori.w #-32768,d0
     de4:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
     de8:	3039 0000 4fb6 	move.w 4fb6 <SystemDMA>,d0
     dee:	0040 8000      	ori.w #-32768,d0
     df2:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
     df6:	3039 0000 4fb4 	move.w 4fb4 <SystemADKCON>,d0
     dfc:	0040 8000      	ori.w #-32768,d0
     e00:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
     e04:	2279 0000 4fb0 	movea.l 4fb0 <ActiView>,a1
     e0a:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     e0e:	2c79 0000 4fc2 	movea.l 4fc2 <GfxBase>,a6
     e14:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     e18:	2c79 0000 4fc2 	movea.l 4fc2 <GfxBase>,a6
     e1e:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     e22:	2c79 0000 4fc2 	movea.l 4fc2 <GfxBase>,a6
     e28:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     e2c:	2c79 0000 4fc2 	movea.l 4fc2 <GfxBase>,a6
     e32:	4eae fe32      	jsr -462(a6)
	Enable();
     e36:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
     e3c:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
     e40:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
     e46:	2279 0000 4fde 	movea.l 4fde <DOSBase>,a1
     e4c:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     e50:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
     e56:	2279 0000 4fc2 	movea.l 4fc2 <GfxBase>,a1
     e5c:	4eae fe62      	jsr -414(a6)
}
     e60:	7000           	moveq #0,d0
     e62:	4ced 5c9c ff94 	movem.l -108(a5),d2-d4/d7/a2-a4/a6
     e68:	4e5d           	unlk a5
     e6a:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     e6c:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     e72:	4eae ffc4      	jsr -60(a6)
     e76:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     e7c:	2200           	move.l d0,d1
     e7e:	243c 0000 2b72 	move.l #11122,d2
     e84:	762c           	moveq #44,d3
     e86:	4eae ffd0      	jsr -48(a6)
     e8a:	6000 f31c      	bra.w 1a8 <main+0x1a2>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
     e8e:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     e94:	4eae ffc4      	jsr -60(a6)
     e98:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     e9e:	2200           	move.l d0,d1
     ea0:	243c 0000 2ba8 	move.l #11176,d2
     ea6:	7636           	moveq #54,d3
     ea8:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = 0x40000;
     eac:	23fc 0004 0000 	move.l #262144,4fda <DrawBuffer>
     eb2:	0000 4fda 
  ViewBuffer = 0x50000;
     eb6:	23fc 0005 0000 	move.l #327680,4fce <ViewBuffer>
     ebc:	0000 4fce 
  SetBplPointers();
     ec0:	45f9 0000 1b34 	lea 1b34 <SetBplPointers>,a2
     ec6:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     ec8:	0cb9 0005 0000 	cmpi.l #327680,4fda <DrawBuffer>
     ece:	0000 4fda 
     ed2:	6600 f3ac      	bne.w 280 <main+0x27a>
     ed6:	6000 015c      	bra.w 1034 <main+0x102e>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     eda:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     ee0:	4eae ffc4      	jsr -60(a6)
     ee4:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     eea:	2200           	move.l d0,d1
     eec:	243c 0000 2977 	move.l #10615,d2
     ef2:	7622           	moveq #34,d3
     ef4:	4eae ffd0      	jsr -48(a6)
     ef8:	6000 fd50      	bra.w c4a <main+0xc44>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     efc:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     f02:	4eae ffc4      	jsr -60(a6)
     f06:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     f0c:	2200           	move.l d0,d1
     f0e:	243c 0000 2977 	move.l #10615,d2
     f14:	7622           	moveq #34,d3
     f16:	4eae ffd0      	jsr -48(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     f1a:	2f3c 0001 2c00 	move.l #76800,-(sp)
     f20:	2f3c 0000 a48c 	move.l #42124,-(sp)
     f26:	4eb9 0000 1c9e 	jsr 1c9e <FreeDisplay>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     f2c:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
     f32:	7004           	moveq #4,d0
     f34:	7202           	moveq #2,d1
     f36:	4eae ff3a      	jsr -198(a6)
     f3a:	23c0 0000 4fa8 	move.l d0,4fa8 <Zoom_ZoomBlitMask>
  PrepareDisplayZoom();
     f40:	2044           	movea.l d4,a0
     f42:	4e90           	jsr (a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     f44:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
     f4a:	203c 0000 c800 	move.l #51200,d0
     f50:	7202           	moveq #2,d1
     f52:	4eae ff3a      	jsr -198(a6)
     f56:	2640           	movea.l d0,a3
     f58:	23c0 0000 4fac 	move.l d0,4fac <Zoom_Source>
  if( Zoom_Source == 0) {
     f5e:	508f           	addq.l #8,sp
     f60:	6600 f880      	bne.w 7e2 <main+0x7dc>
    Write(  Output(), 
     f64:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     f6a:	4eae ffc4      	jsr -60(a6)
     f6e:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     f74:	2200           	move.l d0,d1
     f76:	243c 0000 2ca8 	move.l #11432,d2
     f7c:	7636           	moveq #54,d3
     f7e:	4eae ffd0      	jsr -48(a6)
  PrepareDisplayZoom();
     f82:	2044           	movea.l d4,a0
     f84:	4e90           	jsr (a0)
  UWORD *destination = (UWORD *)DrawBuffer;
     f86:	2079 0000 4fda 	movea.l 4fda <DrawBuffer>,a0
  *destination= 0x0000;
     f8c:	4250           	clr.w (a0)
  *destination= 0x000f;
     f8e:	317c 000f 0028 	move.w #15,40(a0)
  *destination = 0x000f;
     f94:	317c 000f 3bd8 	move.w #15,15320(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     f9a:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
     fa0:	203c 0000 c800 	move.l #51200,d0
     fa6:	7202           	moveq #2,d1
     fa8:	4eae ff3a      	jsr -198(a6)
     fac:	2640           	movea.l d0,a3
     fae:	23c0 0000 4fac 	move.l d0,4fac <Zoom_Source>
  if( Zoom_Source == 0) {
     fb4:	6600 f9a6      	bne.w 95c <main+0x956>
    Write(  Output(), 
     fb8:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     fbe:	4eae ffc4      	jsr -60(a6)
     fc2:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
     fc8:	2200           	move.l d0,d1
     fca:	243c 0000 2ca8 	move.l #11432,d2
     fd0:	7636           	moveq #54,d3
     fd2:	4eae ffd0      	jsr -48(a6)
  PrepareDisplaySW();
     fd6:	4eb9 0000 1b60 	jsr 1b60 <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     fdc:	4878 0010      	pea 10 <main+0xa>
     fe0:	4879 0000 4f28 	pea 4f28 <ClsSprites>
     fe6:	42a7           	clr.l -(sp)
     fe8:	2f39 0000 4fea 	move.l 4fea <Copperlist1>,-(sp)
     fee:	4e92           	jsr (a2)
     ff0:	4fef 0010      	lea 16(sp),sp
     ff4:	4a80           	tst.l d0
     ff6:	6600 fbc0      	bne.w bb8 <main+0xbb2>
     ffa:	6000 fb9e      	bra.w b9a <main+0xb94>
		Exit(0);
     ffe:	9dce           	suba.l a6,a6
    1000:	7200           	moveq #0,d1
    1002:	4eae ff70      	jsr -144(a6)
    1006:	6000 f04c      	bra.w 54 <main+0x4e>
		Exit(0);
    100a:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
    1010:	7200           	moveq #0,d1
    1012:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
    1016:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
    101c:	43f9 0000 2864 	lea 2864 <incbin_swfont_end+0xce>,a1
    1022:	7000           	moveq #0,d0
    1024:	4eae fdd8      	jsr -552(a6)
    1028:	23c0 0000 4fde 	move.l d0,4fde <DOSBase>
	if (!DOSBase)
    102e:	6600 f024      	bne.w 54 <main+0x4e>
    1032:	60ca           	bra.s ffe <main+0xff8>
    1034:	0cb9 0004 0000 	cmpi.l #262144,4fce <ViewBuffer>
    103a:	0000 4fce 
    103e:	6700 f25e      	beq.w 29e <main+0x298>
    Write( Output(), 
    1042:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
    1048:	4eae ffc4      	jsr -60(a6)
    104c:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
    1052:	2200           	move.l d0,d1
    1054:	243c 0000 289f 	move.l #10399,d2
    105a:	763b           	moveq #59,d3
    105c:	4eae ffd0      	jsr -48(a6)
    1060:	6000 f23c      	bra.w 29e <main+0x298>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    1064:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
    106a:	4eae ffc4      	jsr -60(a6)
    106e:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
    1074:	2200           	move.l d0,d1
    1076:	243c 0000 2955 	move.l #10581,d2
    107c:	7621           	moveq #33,d3
    107e:	4eae ffd0      	jsr -48(a6)
    1082:	2079 0000 4fea 	movea.l 4fea <Copperlist1>,a0
    1088:	6000 f292      	bra.w 31c <main+0x316>
	APTR vbr = 0;
    108c:	7000           	moveq #0,d0
	VBR=GetVBR();
    108e:	23c0 0000 4fba 	move.l d0,4fba <VBR.lto_priv.2>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    1094:	2079 0000 4fba 	movea.l 4fba <VBR.lto_priv.2>,a0
    109a:	2828 006c      	move.l 108(a0),d4
	SystemIrq=GetInterruptHandler(); //store interrupt register
    109e:	23c4 0000 4fbe 	move.l d4,4fbe <SystemIrq>
	WaitVbl();
    10a4:	4e92           	jsr (a2)
	WaitVbl();
    10a6:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    10a8:	2079 0000 4fc6 	movea.l 4fc6 <hw>,a0
    10ae:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    10b2:	6000 fce8      	bra.w d9c <main+0xd96>
    10b6:	4e71           	nop

000010b8 <WriteFont.constprop.1>:
  *cl = 0xfffffffe;

  return retval;
}

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
    10b8:	226f 0004      	movea.l 4(sp),a1
  UWORD *bmpptr = Destination;
  UWORD *fntptr = font;

  char charpos = *text;
  charpos -= 0x20;
    10bc:	206f 0008      	movea.l 8(sp),a0
    10c0:	1010           	move.b (a0),d0
    10c2:	0600 ffe0      	addi.b #-32,d0
  charpos = charpos<<3;
    10c6:	4880           	ext.w d0
    10c8:	48c0           	ext.l d0
    10ca:	e788           	lsl.l #3,d0
  fntptr += charpos;
    10cc:	4880           	ext.w d0
    10ce:	3040           	movea.w d0,a0
    10d0:	d1c8           	adda.l a0,a0
    10d2:	d1fc 0000 4f68 	adda.l #20328,a0
  for(int i=1;i<=8;i++) {
    *bmpptr = *fntptr++;
    10d8:	3290           	move.w (a0),(a1)
    10da:	3368 0002 0050 	move.w 2(a0),80(a1)
    10e0:	3368 0004 00a0 	move.w 4(a0),160(a1)
    10e6:	3368 0006 00f0 	move.w 6(a0),240(a1)
    10ec:	3368 0008 0140 	move.w 8(a0),320(a1)
    10f2:	3368 000a 0190 	move.w 10(a0),400(a1)
    10f8:	3368 000c 01e0 	move.w 12(a0),480(a1)
    10fe:	3368 000e 0230 	move.w 14(a0),560(a1)
    bmpptr += 40;
  }

}
    1104:	4e75           	rts

00001106 <warpmode.part.0>:
void warpmode(int on) 
    1106:	598f           	subq.l #4,sp
    1108:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    110a:	4aaf 000c      	tst.l 12(sp)
    110e:	674c           	beq.s 115c <warpmode.part.0+0x56>
    1110:	4878 0001      	pea 1 <_start+0x1>
    1114:	740b           	moveq #11,d2
    1116:	d48f           	add.l sp,d2
    1118:	2f02           	move.l d2,-(sp)
    111a:	42a7           	clr.l -(sp)
    111c:	4879 0000 27ca 	pea 27ca <incbin_swfont_end+0x34>
    1122:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffddfe6>
    1126:	4878 0052      	pea 52 <main+0x4c>
    112a:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeedf47>
    1130:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    1134:	203c 0000 27b0 	move.l #10160,d0
    113a:	4878 0001      	pea 1 <_start+0x1>
    113e:	2f02           	move.l d2,-(sp)
    1140:	42a7           	clr.l -(sp)
    1142:	2f00           	move.l d0,-(sp)
    1144:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffddfe6>
    1148:	4878 0052      	pea 52 <main+0x4c>
    114c:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeedf47>
	}
}
    1152:	4fef 0018      	lea 24(sp),sp
    1156:	241f           	move.l (sp)+,d2
    1158:	588f           	addq.l #4,sp
    115a:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    115c:	4878 0001      	pea 1 <_start+0x1>
    1160:	740b           	moveq #11,d2
    1162:	d48f           	add.l sp,d2
    1164:	2f02           	move.l d2,-(sp)
    1166:	42a7           	clr.l -(sp)
    1168:	4879 0000 27d4 	pea 27d4 <incbin_swfont_end+0x3e>
    116e:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffddfe6>
    1172:	4878 0052      	pea 52 <main+0x4c>
    1176:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeedf47>
    117c:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    1180:	203c 0000 2797 	move.l #10135,d0
    1186:	4878 0001      	pea 1 <_start+0x1>
    118a:	2f02           	move.l d2,-(sp)
    118c:	42a7           	clr.l -(sp)
    118e:	2f00           	move.l d0,-(sp)
    1190:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffddfe6>
    1194:	4878 0052      	pea 52 <main+0x4c>
    1198:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeedf47>
}
    119e:	4fef 0018      	lea 24(sp),sp
    11a2:	241f           	move.l (sp)+,d2
    11a4:	588f           	addq.l #4,sp
    11a6:	4e75           	rts

000011a8 <KPrintF>:
{
    11a8:	4fef ff80      	lea -128(sp),sp
    11ac:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
    11b0:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeedf47>
    11b6:	6734           	beq.s 11ec <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
    11b8:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
    11be:	206f 0090      	movea.l 144(sp),a0
    11c2:	43ef 0094      	lea 148(sp),a1
    11c6:	45f9 0000 1fd4 	lea 1fd4 <PutChar>,a2
    11cc:	47ef 000c      	lea 12(sp),a3
    11d0:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    11d4:	2f0b           	move.l a3,-(sp)
    11d6:	4878 0056      	pea 56 <main+0x50>
    11da:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeedf47>
    11e0:	508f           	addq.l #8,sp
}
    11e2:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    11e6:	4fef 0080      	lea 128(sp),sp
    11ea:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
    11ec:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
    11f2:	206f 0090      	movea.l 144(sp),a0
    11f6:	43ef 0094      	lea 148(sp),a1
    11fa:	45f9 0000 1fc6 	lea 1fc6 <KPutCharX>,a2
    1200:	97cb           	suba.l a3,a3
    1202:	4eae fdf6      	jsr -522(a6)
}
    1206:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    120a:	4fef 0080      	lea 128(sp),sp
    120e:	4e75           	rts

00001210 <TestCopperlistPos>:
  int test1 = instructions[pos];
    1210:	202f 0008      	move.l 8(sp),d0
    1214:	d080           	add.l d0,d0
    1216:	d080           	add.l d0,d0
  if( instructions[pos] == value ) 
    1218:	206f 0004      	movea.l 4(sp),a0
    121c:	2030 0800      	move.l (0,a0,d0.l),d0
    1220:	b0af 000c      	cmp.l 12(sp),d0
    1224:	57c0           	seq d0
    1226:	4880           	ext.w d0
    1228:	48c0           	ext.l d0
}
    122a:	4480           	neg.l d0
    122c:	4e75           	rts

0000122e <TestCopperlistBatch>:
                                                                  long length) {
    122e:	48e7 2030      	movem.l d2/a2-a3,-(sp)
    1232:	246f 0010      	movea.l 16(sp),a2
    1236:	206f 0014      	movea.l 20(sp),a0
    123a:	226f 0018      	movea.l 24(sp),a1
    123e:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
    1242:	2008           	move.l a0,d0
    1244:	d088           	add.l a0,d0
    1246:	d080           	add.l d0,d0
    1248:	2411           	move.l (a1),d2
    124a:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
    124e:	6600 01ac      	bne.w 13fc <TestCopperlistBatch+0x1ce>
    1252:	2008           	move.l a0,d0
    1254:	5280           	addq.l #1,d0
    1256:	d080           	add.l d0,d0
    1258:	d080           	add.l d0,d0
    125a:	2032 0800      	move.l (0,a2,d0.l),d0
    125e:	b0a9 0004      	cmp.l 4(a1),d0
    1262:	6600 0198      	bne.w 13fc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1266:	7002           	moveq #2,d0
    1268:	b081           	cmp.l d1,d0
    126a:	6700 0188      	beq.w 13f4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    126e:	2008           	move.l a0,d0
    1270:	5480           	addq.l #2,d0
    1272:	d080           	add.l d0,d0
    1274:	d080           	add.l d0,d0
    1276:	2032 0800      	move.l (0,a2,d0.l),d0
    127a:	b0a9 0008      	cmp.l 8(a1),d0
    127e:	6600 017c      	bne.w 13fc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1282:	7403           	moveq #3,d2
    1284:	b481           	cmp.l d1,d2
    1286:	6700 016c      	beq.w 13f4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    128a:	2008           	move.l a0,d0
    128c:	5680           	addq.l #3,d0
    128e:	d080           	add.l d0,d0
    1290:	d080           	add.l d0,d0
    1292:	2032 0800      	move.l (0,a2,d0.l),d0
    1296:	b0a9 000c      	cmp.l 12(a1),d0
    129a:	6600 0160      	bne.w 13fc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    129e:	7004           	moveq #4,d0
    12a0:	b081           	cmp.l d1,d0
    12a2:	6700 0150      	beq.w 13f4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    12a6:	2008           	move.l a0,d0
    12a8:	5880           	addq.l #4,d0
    12aa:	d080           	add.l d0,d0
    12ac:	d080           	add.l d0,d0
    12ae:	2032 0800      	move.l (0,a2,d0.l),d0
    12b2:	b0a9 0010      	cmp.l 16(a1),d0
    12b6:	6600 0144      	bne.w 13fc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    12ba:	7405           	moveq #5,d2
    12bc:	b481           	cmp.l d1,d2
    12be:	6700 0134      	beq.w 13f4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    12c2:	2008           	move.l a0,d0
    12c4:	5a80           	addq.l #5,d0
    12c6:	d080           	add.l d0,d0
    12c8:	d080           	add.l d0,d0
    12ca:	2032 0800      	move.l (0,a2,d0.l),d0
    12ce:	b0a9 0014      	cmp.l 20(a1),d0
    12d2:	6600 0128      	bne.w 13fc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    12d6:	7006           	moveq #6,d0
    12d8:	b081           	cmp.l d1,d0
    12da:	6700 0118      	beq.w 13f4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    12de:	2008           	move.l a0,d0
    12e0:	5c80           	addq.l #6,d0
    12e2:	d080           	add.l d0,d0
    12e4:	d080           	add.l d0,d0
    12e6:	2032 0800      	move.l (0,a2,d0.l),d0
    12ea:	b0a9 0018      	cmp.l 24(a1),d0
    12ee:	6600 010c      	bne.w 13fc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    12f2:	7407           	moveq #7,d2
    12f4:	b481           	cmp.l d1,d2
    12f6:	6700 00fc      	beq.w 13f4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    12fa:	2008           	move.l a0,d0
    12fc:	5e80           	addq.l #7,d0
    12fe:	d080           	add.l d0,d0
    1300:	d080           	add.l d0,d0
    1302:	2032 0800      	move.l (0,a2,d0.l),d0
    1306:	b0a9 001c      	cmp.l 28(a1),d0
    130a:	6600 00f0      	bne.w 13fc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    130e:	7008           	moveq #8,d0
    1310:	b081           	cmp.l d1,d0
    1312:	6700 00e0      	beq.w 13f4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1316:	2008           	move.l a0,d0
    1318:	5080           	addq.l #8,d0
    131a:	d080           	add.l d0,d0
    131c:	d080           	add.l d0,d0
    131e:	2032 0800      	move.l (0,a2,d0.l),d0
    1322:	b0a9 0020      	cmp.l 32(a1),d0
    1326:	6600 00d4      	bne.w 13fc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    132a:	7409           	moveq #9,d2
    132c:	b481           	cmp.l d1,d2
    132e:	6700 00c4      	beq.w 13f4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1332:	47e8 0009      	lea 9(a0),a3
    1336:	200b           	move.l a3,d0
    1338:	d08b           	add.l a3,d0
    133a:	d080           	add.l d0,d0
    133c:	2032 0800      	move.l (0,a2,d0.l),d0
    1340:	b0a9 0024      	cmp.l 36(a1),d0
    1344:	6600 00b6      	bne.w 13fc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1348:	700a           	moveq #10,d0
    134a:	b081           	cmp.l d1,d0
    134c:	6700 00a6      	beq.w 13f4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1350:	47e8 000a      	lea 10(a0),a3
    1354:	200b           	move.l a3,d0
    1356:	d08b           	add.l a3,d0
    1358:	d080           	add.l d0,d0
    135a:	2032 0800      	move.l (0,a2,d0.l),d0
    135e:	b0a9 0028      	cmp.l 40(a1),d0
    1362:	6600 0098      	bne.w 13fc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1366:	740b           	moveq #11,d2
    1368:	b481           	cmp.l d1,d2
    136a:	6700 0088      	beq.w 13f4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    136e:	47e8 000b      	lea 11(a0),a3
    1372:	200b           	move.l a3,d0
    1374:	d08b           	add.l a3,d0
    1376:	d080           	add.l d0,d0
    1378:	2032 0800      	move.l (0,a2,d0.l),d0
    137c:	b0a9 002c      	cmp.l 44(a1),d0
    1380:	667a           	bne.s 13fc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1382:	700c           	moveq #12,d0
    1384:	b081           	cmp.l d1,d0
    1386:	676c           	beq.s 13f4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1388:	47e8 000c      	lea 12(a0),a3
    138c:	200b           	move.l a3,d0
    138e:	d08b           	add.l a3,d0
    1390:	d080           	add.l d0,d0
    1392:	2032 0800      	move.l (0,a2,d0.l),d0
    1396:	b0a9 0030      	cmp.l 48(a1),d0
    139a:	6660           	bne.s 13fc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    139c:	740d           	moveq #13,d2
    139e:	b481           	cmp.l d1,d2
    13a0:	6752           	beq.s 13f4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    13a2:	47e8 000d      	lea 13(a0),a3
    13a6:	200b           	move.l a3,d0
    13a8:	d08b           	add.l a3,d0
    13aa:	d080           	add.l d0,d0
    13ac:	2032 0800      	move.l (0,a2,d0.l),d0
    13b0:	b0a9 0034      	cmp.l 52(a1),d0
    13b4:	6646           	bne.s 13fc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    13b6:	700e           	moveq #14,d0
    13b8:	b081           	cmp.l d1,d0
    13ba:	6738           	beq.s 13f4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    13bc:	47e8 000e      	lea 14(a0),a3
    13c0:	200b           	move.l a3,d0
    13c2:	d08b           	add.l a3,d0
    13c4:	d080           	add.l d0,d0
    13c6:	2032 0800      	move.l (0,a2,d0.l),d0
    13ca:	b0a9 0038      	cmp.l 56(a1),d0
    13ce:	662c           	bne.s 13fc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    13d0:	7410           	moveq #16,d2
    13d2:	b481           	cmp.l d1,d2
    13d4:	661e           	bne.s 13f4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    13d6:	41e8 000f      	lea 15(a0),a0
    13da:	d1c8           	adda.l a0,a0
    13dc:	d1c8           	adda.l a0,a0
    13de:	2070 a800      	movea.l (0,a0,a2.l),a0
    13e2:	b1e9 003c      	cmpa.l 60(a1),a0
    13e6:	57c0           	seq d0
    13e8:	4880           	ext.w d0
    13ea:	48c0           	ext.l d0
    13ec:	4480           	neg.l d0
}
    13ee:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    13f2:	4e75           	rts
  return 1;
    13f4:	7001           	moveq #1,d0
}
    13f6:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    13fa:	4e75           	rts
      return 0;
    13fc:	7000           	moveq #0,d0
}
    13fe:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    1402:	4e75           	rts

00001404 <ClBuild>:
ULONG * ClbuildSW() {
    1404:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
    1408:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
    140e:	707b           	moveq #123,d0
    1410:	4600           	not.b d0
    1412:	7202           	moveq #2,d1
    1414:	4eae ff3a      	jsr -198(a6)
    1418:	2440           	movea.l d0,a2
  if( retval == 0) {
    141a:	4a80           	tst.l d0
    141c:	6700 010e      	beq.w 152c <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
    1420:	24b9 0000 4f28 	move.l 4f28 <ClsSprites>,(a2)
    1426:	2579 0000 4f2c 	move.l 4f2c <ClsSprites+0x4>,4(a2)
    142c:	0004 
    142e:	2579 0000 4f30 	move.l 4f30 <ClsSprites+0x8>,8(a2)
    1434:	0008 
    1436:	2579 0000 4f34 	move.l 4f34 <ClsSprites+0xc>,12(a2)
    143c:	000c 
    143e:	2579 0000 4f38 	move.l 4f38 <ClsSprites+0x10>,16(a2)
    1444:	0010 
    1446:	2579 0000 4f3c 	move.l 4f3c <ClsSprites+0x14>,20(a2)
    144c:	0014 
    144e:	2579 0000 4f40 	move.l 4f40 <ClsSprites+0x18>,24(a2)
    1454:	0018 
    1456:	2579 0000 4f44 	move.l 4f44 <ClsSprites+0x1c>,28(a2)
    145c:	001c 
    145e:	2579 0000 4f48 	move.l 4f48 <ClsSprites+0x20>,32(a2)
    1464:	0020 
    1466:	2579 0000 4f4c 	move.l 4f4c <ClsSprites+0x24>,36(a2)
    146c:	0024 
    146e:	2579 0000 4f50 	move.l 4f50 <ClsSprites+0x28>,40(a2)
    1474:	0028 
    1476:	2579 0000 4f54 	move.l 4f54 <ClsSprites+0x2c>,44(a2)
    147c:	002c 
    147e:	2579 0000 4f58 	move.l 4f58 <ClsSprites+0x30>,48(a2)
    1484:	0030 
    1486:	2579 0000 4f5c 	move.l 4f5c <ClsSprites+0x34>,52(a2)
    148c:	0034 
    148e:	2579 0000 4f60 	move.l 4f60 <ClsSprites+0x38>,56(a2)
    1494:	0038 
    1496:	2579 0000 4f64 	move.l 4f64 <ClsSprites+0x3c>,60(a2)
    149c:	003c 
    *cl++ = *clpartinstruction++;
    149e:	2579 0000 4ef8 	move.l 4ef8 <ClScreen>,64(a2)
    14a4:	0040 
    14a6:	2579 0000 4efc 	move.l 4efc <ClScreen+0x4>,68(a2)
    14ac:	0044 
    14ae:	2579 0000 4f00 	move.l 4f00 <ClScreen+0x8>,72(a2)
    14b4:	0048 
    14b6:	2579 0000 4f04 	move.l 4f04 <ClScreen+0xc>,76(a2)
    14bc:	004c 
    14be:	2579 0000 4f08 	move.l 4f08 <ClScreen+0x10>,80(a2)
    14c4:	0050 
    14c6:	2579 0000 4f0c 	move.l 4f0c <ClScreen+0x14>,84(a2)
    14cc:	0054 
    14ce:	2579 0000 4f10 	move.l 4f10 <ClScreen+0x18>,88(a2)
    14d4:	0058 
    14d6:	2579 0000 4f14 	move.l 4f14 <ClScreen+0x1c>,92(a2)
    14dc:	005c 
    14de:	2579 0000 4f18 	move.l 4f18 <ClScreen+0x20>,96(a2)
    14e4:	0060 
    14e6:	2579 0000 4f1c 	move.l 4f1c <ClScreen+0x24>,100(a2)
    14ec:	0064 
    14ee:	2579 0000 4f20 	move.l 4f20 <ClScreen+0x28>,104(a2)
    14f4:	0068 
    14f6:	2579 0000 4f24 	move.l 4f24 <ClScreen+0x2c>,108(a2)
    14fc:	006c 
  *cl++ = 0x00e00000;
    14fe:	257c 00e0 0000 	move.l #14680064,112(a2)
    1504:	0070 
  *cl++ = 0x00e20000;
    1506:	257c 00e2 0000 	move.l #14811136,116(a2)
    150c:	0074 
    *cl++ = *clpartinstruction++;
    150e:	2579 0000 4ef0 	move.l 4ef0 <ClColor>,120(a2)
    1514:	0078 
    1516:	2579 0000 4ef4 	move.l 4ef4 <ClColor+0x4>,124(a2)
    151c:	007c 
  *cl = 0xfffffffe;
    151e:	70fe           	moveq #-2,d0
    1520:	2540 0080      	move.l d0,128(a2)
}
    1524:	200a           	move.l a2,d0
    1526:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    152a:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    152c:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
    1532:	4eae ffc4      	jsr -60(a6)
    1536:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
    153c:	2200           	move.l d0,d1
    153e:	243c 0000 27df 	move.l #10207,d2
    1544:	7628           	moveq #40,d3
    1546:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    154a:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
    1550:	7201           	moveq #1,d1
    1552:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1556:	24b9 0000 4f28 	move.l 4f28 <ClsSprites>,(a2)
    155c:	2579 0000 4f2c 	move.l 4f2c <ClsSprites+0x4>,4(a2)
    1562:	0004 
    1564:	2579 0000 4f30 	move.l 4f30 <ClsSprites+0x8>,8(a2)
    156a:	0008 
    156c:	2579 0000 4f34 	move.l 4f34 <ClsSprites+0xc>,12(a2)
    1572:	000c 
    1574:	2579 0000 4f38 	move.l 4f38 <ClsSprites+0x10>,16(a2)
    157a:	0010 
    157c:	2579 0000 4f3c 	move.l 4f3c <ClsSprites+0x14>,20(a2)
    1582:	0014 
    1584:	2579 0000 4f40 	move.l 4f40 <ClsSprites+0x18>,24(a2)
    158a:	0018 
    158c:	2579 0000 4f44 	move.l 4f44 <ClsSprites+0x1c>,28(a2)
    1592:	001c 
    1594:	2579 0000 4f48 	move.l 4f48 <ClsSprites+0x20>,32(a2)
    159a:	0020 
    159c:	2579 0000 4f4c 	move.l 4f4c <ClsSprites+0x24>,36(a2)
    15a2:	0024 
    15a4:	2579 0000 4f50 	move.l 4f50 <ClsSprites+0x28>,40(a2)
    15aa:	0028 
    15ac:	2579 0000 4f54 	move.l 4f54 <ClsSprites+0x2c>,44(a2)
    15b2:	002c 
    15b4:	2579 0000 4f58 	move.l 4f58 <ClsSprites+0x30>,48(a2)
    15ba:	0030 
    15bc:	2579 0000 4f5c 	move.l 4f5c <ClsSprites+0x34>,52(a2)
    15c2:	0034 
    15c4:	2579 0000 4f60 	move.l 4f60 <ClsSprites+0x38>,56(a2)
    15ca:	0038 
    15cc:	2579 0000 4f64 	move.l 4f64 <ClsSprites+0x3c>,60(a2)
    15d2:	003c 
    *cl++ = *clpartinstruction++;
    15d4:	2579 0000 4ef8 	move.l 4ef8 <ClScreen>,64(a2)
    15da:	0040 
    15dc:	2579 0000 4efc 	move.l 4efc <ClScreen+0x4>,68(a2)
    15e2:	0044 
    15e4:	2579 0000 4f00 	move.l 4f00 <ClScreen+0x8>,72(a2)
    15ea:	0048 
    15ec:	2579 0000 4f04 	move.l 4f04 <ClScreen+0xc>,76(a2)
    15f2:	004c 
    15f4:	2579 0000 4f08 	move.l 4f08 <ClScreen+0x10>,80(a2)
    15fa:	0050 
    15fc:	2579 0000 4f0c 	move.l 4f0c <ClScreen+0x14>,84(a2)
    1602:	0054 
    1604:	2579 0000 4f10 	move.l 4f10 <ClScreen+0x18>,88(a2)
    160a:	0058 
    160c:	2579 0000 4f14 	move.l 4f14 <ClScreen+0x1c>,92(a2)
    1612:	005c 
    1614:	2579 0000 4f18 	move.l 4f18 <ClScreen+0x20>,96(a2)
    161a:	0060 
    161c:	2579 0000 4f1c 	move.l 4f1c <ClScreen+0x24>,100(a2)
    1622:	0064 
    1624:	2579 0000 4f20 	move.l 4f20 <ClScreen+0x28>,104(a2)
    162a:	0068 
    162c:	2579 0000 4f24 	move.l 4f24 <ClScreen+0x2c>,108(a2)
    1632:	006c 
  *cl++ = 0x00e00000;
    1634:	257c 00e0 0000 	move.l #14680064,112(a2)
    163a:	0070 
  *cl++ = 0x00e20000;
    163c:	257c 00e2 0000 	move.l #14811136,116(a2)
    1642:	0074 
    *cl++ = *clpartinstruction++;
    1644:	2579 0000 4ef0 	move.l 4ef0 <ClColor>,120(a2)
    164a:	0078 
    164c:	2579 0000 4ef4 	move.l 4ef4 <ClColor+0x4>,124(a2)
    1652:	007c 
  *cl = 0xfffffffe;
    1654:	70fe           	moveq #-2,d0
    1656:	2540 0080      	move.l d0,128(a2)
}
    165a:	200a           	move.l a2,d0
    165c:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1660:	4e75           	rts

00001662 <ClbuildZoom>:
ULONG * ClbuildZoom() {
    1662:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    1666:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
    166c:	203c 0000 a48c 	move.l #42124,d0
    1672:	7202           	moveq #2,d1
    1674:	4eae ff3a      	jsr -198(a6)
    1678:	2440           	movea.l d0,a2
  if( retval == 0) {
    167a:	4a80           	tst.l d0
    167c:	6700 0160      	beq.w 17de <ClbuildZoom+0x17c>
    *cl++ = *clpartinstruction++;
    1680:	24b9 0000 4f28 	move.l 4f28 <ClsSprites>,(a2)
    1686:	2579 0000 4f2c 	move.l 4f2c <ClsSprites+0x4>,4(a2)
    168c:	0004 
    168e:	2579 0000 4f30 	move.l 4f30 <ClsSprites+0x8>,8(a2)
    1694:	0008 
    1696:	2579 0000 4f34 	move.l 4f34 <ClsSprites+0xc>,12(a2)
    169c:	000c 
    169e:	2579 0000 4f38 	move.l 4f38 <ClsSprites+0x10>,16(a2)
    16a4:	0010 
    16a6:	2579 0000 4f3c 	move.l 4f3c <ClsSprites+0x14>,20(a2)
    16ac:	0014 
    16ae:	2579 0000 4f40 	move.l 4f40 <ClsSprites+0x18>,24(a2)
    16b4:	0018 
    16b6:	2579 0000 4f44 	move.l 4f44 <ClsSprites+0x1c>,28(a2)
    16bc:	001c 
    16be:	2579 0000 4f48 	move.l 4f48 <ClsSprites+0x20>,32(a2)
    16c4:	0020 
    16c6:	2579 0000 4f4c 	move.l 4f4c <ClsSprites+0x24>,36(a2)
    16cc:	0024 
    16ce:	2579 0000 4f50 	move.l 4f50 <ClsSprites+0x28>,40(a2)
    16d4:	0028 
    16d6:	2579 0000 4f54 	move.l 4f54 <ClsSprites+0x2c>,44(a2)
    16dc:	002c 
    16de:	2579 0000 4f58 	move.l 4f58 <ClsSprites+0x30>,48(a2)
    16e4:	0030 
    16e6:	2579 0000 4f5c 	move.l 4f5c <ClsSprites+0x34>,52(a2)
    16ec:	0034 
    16ee:	2579 0000 4f60 	move.l 4f60 <ClsSprites+0x38>,56(a2)
    16f4:	0038 
    16f6:	2579 0000 4f64 	move.l 4f64 <ClsSprites+0x3c>,60(a2)
    16fc:	003c 
    *cl++ = *clpartinstruction++;
    16fe:	2579 0000 4ec0 	move.l 4ec0 <ClScreenZoom>,64(a2)
    1704:	0040 
    1706:	2579 0000 4ec4 	move.l 4ec4 <ClScreenZoom+0x4>,68(a2)
    170c:	0044 
    170e:	2579 0000 4ec8 	move.l 4ec8 <ClScreenZoom+0x8>,72(a2)
    1714:	0048 
    1716:	2579 0000 4ecc 	move.l 4ecc <ClScreenZoom+0xc>,76(a2)
    171c:	004c 
    171e:	2579 0000 4ed0 	move.l 4ed0 <ClScreenZoom+0x10>,80(a2)
    1724:	0050 
    1726:	2579 0000 4ed4 	move.l 4ed4 <ClScreenZoom+0x14>,84(a2)
    172c:	0054 
    172e:	2579 0000 4ed8 	move.l 4ed8 <ClScreenZoom+0x18>,88(a2)
    1734:	0058 
    1736:	2579 0000 4edc 	move.l 4edc <ClScreenZoom+0x1c>,92(a2)
    173c:	005c 
    173e:	2579 0000 4ee0 	move.l 4ee0 <ClScreenZoom+0x20>,96(a2)
    1744:	0060 
    1746:	2579 0000 4ee4 	move.l 4ee4 <ClScreenZoom+0x24>,100(a2)
    174c:	0064 
    174e:	2579 0000 4ee8 	move.l 4ee8 <ClScreenZoom+0x28>,104(a2)
    1754:	0068 
    1756:	2579 0000 4eec 	move.l 4eec <ClScreenZoom+0x2c>,108(a2)
    175c:	006c 
  *cl++ = 0x00e00000;
    175e:	257c 00e0 0000 	move.l #14680064,112(a2)
    1764:	0070 
  *cl++ = 0x00e20000;
    1766:	257c 00e2 0000 	move.l #14811136,116(a2)
    176c:	0074 
  *cl++ = 0x00e40000;
    176e:	257c 00e4 0000 	move.l #14942208,120(a2)
    1774:	0078 
  *cl++ = 0x00e60000;
    1776:	257c 00e6 0000 	move.l #15073280,124(a2)
    177c:	007c 
    *cl++ = *clpartinstruction++;
    177e:	2579 0000 4ef0 	move.l 4ef0 <ClColor>,128(a2)
    1784:	0080 
    1786:	2579 0000 4ef4 	move.l 4ef4 <ClColor+0x4>,132(a2)
    178c:	0084 
    178e:	43ea 012c      	lea 300(a2),a1
    1792:	220a           	move.l a2,d1
    1794:	0681 0000 a52c 	addi.l #42284,d1
    179a:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    17a0:	41e9 ff60      	lea -160(a1),a0
    17a4:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    17a8:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    17ae:	5088           	addq.l #8,a0
    17b0:	217c 0182 0f00 	move.l #25300736,-4(a0)
    17b6:	fffc 
    for(int i2=0;i2<20;i2++) {
    17b8:	b3c8           	cmpa.l a0,a1
    17ba:	66ec           	bne.s 17a8 <ClbuildZoom+0x146>
    17bc:	43e8 00a4      	lea 164(a0),a1
    17c0:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    17c6:	b3c1           	cmpa.l d1,a1
    17c8:	66d6           	bne.s 17a0 <ClbuildZoom+0x13e>
   *cl = 0xfffffffe;
    17ca:	203c 0000 a488 	move.l #42120,d0
    17d0:	72fe           	moveq #-2,d1
    17d2:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    17d6:	200a           	move.l a2,d0
    17d8:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    17dc:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    17de:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
    17e4:	4eae ffc4      	jsr -60(a6)
    17e8:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
    17ee:	2200           	move.l d0,d1
    17f0:	243c 0000 27df 	move.l #10207,d2
    17f6:	7628           	moveq #40,d3
    17f8:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    17fc:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
    1802:	7201           	moveq #1,d1
    1804:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1808:	24b9 0000 4f28 	move.l 4f28 <ClsSprites>,(a2)
    180e:	2579 0000 4f2c 	move.l 4f2c <ClsSprites+0x4>,4(a2)
    1814:	0004 
    1816:	2579 0000 4f30 	move.l 4f30 <ClsSprites+0x8>,8(a2)
    181c:	0008 
    181e:	2579 0000 4f34 	move.l 4f34 <ClsSprites+0xc>,12(a2)
    1824:	000c 
    1826:	2579 0000 4f38 	move.l 4f38 <ClsSprites+0x10>,16(a2)
    182c:	0010 
    182e:	2579 0000 4f3c 	move.l 4f3c <ClsSprites+0x14>,20(a2)
    1834:	0014 
    1836:	2579 0000 4f40 	move.l 4f40 <ClsSprites+0x18>,24(a2)
    183c:	0018 
    183e:	2579 0000 4f44 	move.l 4f44 <ClsSprites+0x1c>,28(a2)
    1844:	001c 
    1846:	2579 0000 4f48 	move.l 4f48 <ClsSprites+0x20>,32(a2)
    184c:	0020 
    184e:	2579 0000 4f4c 	move.l 4f4c <ClsSprites+0x24>,36(a2)
    1854:	0024 
    1856:	2579 0000 4f50 	move.l 4f50 <ClsSprites+0x28>,40(a2)
    185c:	0028 
    185e:	2579 0000 4f54 	move.l 4f54 <ClsSprites+0x2c>,44(a2)
    1864:	002c 
    1866:	2579 0000 4f58 	move.l 4f58 <ClsSprites+0x30>,48(a2)
    186c:	0030 
    186e:	2579 0000 4f5c 	move.l 4f5c <ClsSprites+0x34>,52(a2)
    1874:	0034 
    1876:	2579 0000 4f60 	move.l 4f60 <ClsSprites+0x38>,56(a2)
    187c:	0038 
    187e:	2579 0000 4f64 	move.l 4f64 <ClsSprites+0x3c>,60(a2)
    1884:	003c 
    *cl++ = *clpartinstruction++;
    1886:	2579 0000 4ec0 	move.l 4ec0 <ClScreenZoom>,64(a2)
    188c:	0040 
    188e:	2579 0000 4ec4 	move.l 4ec4 <ClScreenZoom+0x4>,68(a2)
    1894:	0044 
    1896:	2579 0000 4ec8 	move.l 4ec8 <ClScreenZoom+0x8>,72(a2)
    189c:	0048 
    189e:	2579 0000 4ecc 	move.l 4ecc <ClScreenZoom+0xc>,76(a2)
    18a4:	004c 
    18a6:	2579 0000 4ed0 	move.l 4ed0 <ClScreenZoom+0x10>,80(a2)
    18ac:	0050 
    18ae:	2579 0000 4ed4 	move.l 4ed4 <ClScreenZoom+0x14>,84(a2)
    18b4:	0054 
    18b6:	2579 0000 4ed8 	move.l 4ed8 <ClScreenZoom+0x18>,88(a2)
    18bc:	0058 
    18be:	2579 0000 4edc 	move.l 4edc <ClScreenZoom+0x1c>,92(a2)
    18c4:	005c 
    18c6:	2579 0000 4ee0 	move.l 4ee0 <ClScreenZoom+0x20>,96(a2)
    18cc:	0060 
    18ce:	2579 0000 4ee4 	move.l 4ee4 <ClScreenZoom+0x24>,100(a2)
    18d4:	0064 
    18d6:	2579 0000 4ee8 	move.l 4ee8 <ClScreenZoom+0x28>,104(a2)
    18dc:	0068 
    18de:	2579 0000 4eec 	move.l 4eec <ClScreenZoom+0x2c>,108(a2)
    18e4:	006c 
  *cl++ = 0x00e00000;
    18e6:	257c 00e0 0000 	move.l #14680064,112(a2)
    18ec:	0070 
  *cl++ = 0x00e20000;
    18ee:	257c 00e2 0000 	move.l #14811136,116(a2)
    18f4:	0074 
  *cl++ = 0x00e40000;
    18f6:	257c 00e4 0000 	move.l #14942208,120(a2)
    18fc:	0078 
  *cl++ = 0x00e60000;
    18fe:	257c 00e6 0000 	move.l #15073280,124(a2)
    1904:	007c 
    *cl++ = *clpartinstruction++;
    1906:	2579 0000 4ef0 	move.l 4ef0 <ClColor>,128(a2)
    190c:	0080 
    190e:	2579 0000 4ef4 	move.l 4ef4 <ClColor+0x4>,132(a2)
    1914:	0084 
    1916:	43ea 012c      	lea 300(a2),a1
    191a:	220a           	move.l a2,d1
    191c:	0681 0000 a52c 	addi.l #42284,d1
    1922:	203c 2c07 fffe 	move.l #738721790,d0
    1928:	6000 fe76      	bra.w 17a0 <ClbuildZoom+0x13e>

0000192c <SwapCl>:
  ULONG tmp = DrawCopper;
    192c:	2039 0000 4fd6 	move.l 4fd6 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    1932:	23f9 0000 4fca 	move.l 4fca <ViewCopper>,4fd6 <DrawCopper>
    1938:	0000 4fd6 
  ViewCopper = tmp;
    193c:	23c0 0000 4fca 	move.l d0,4fca <ViewCopper>
  hw->cop1lc = ViewCopper;
    1942:	2079 0000 4fc6 	movea.l 4fc6 <hw>,a0
    1948:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    194c:	3140 0088      	move.w d0,136(a0)
}
    1950:	4e75           	rts

00001952 <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    1952:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    1956:	45fa fd0a      	lea 1662 <ClbuildZoom>(pc),a2
    195a:	4e92           	jsr (a2)
    195c:	23c0 0000 4fea 	move.l d0,4fea <Copperlist1>
  Copperlist2 = ClbuildZoom();
    1962:	4e92           	jsr (a2)
    1964:	23c0 0000 4fe6 	move.l d0,4fe6 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    196a:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
    1970:	203c 0001 2c00 	move.l #76800,d0
    1976:	7202           	moveq #2,d1
    1978:	4eae ff3a      	jsr -198(a6)
    197c:	23c0 0000 4fe2 	move.l d0,4fe2 <Bitplane1>
  if(Bitplane1 == 0) {
    1982:	6700 014e      	beq.w 1ad2 <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    1986:	23c0 0000 4fda 	move.l d0,4fda <DrawBuffer>
  DrawCopper = Copperlist1;
    198c:	23f9 0000 4fea 	move.l 4fea <Copperlist1>,4fd6 <DrawCopper>
    1992:	0000 4fd6 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1996:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
    199c:	203c 0001 2c00 	move.l #76800,d0
    19a2:	7202           	moveq #2,d1
    19a4:	4eae ff3a      	jsr -198(a6)
    19a8:	2400           	move.l d0,d2
    19aa:	23c0 0000 4fd2 	move.l d0,4fd2 <Bitplane2>
  if(Bitplane2 == 0) {
    19b0:	6778           	beq.s 1a2a <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    19b2:	23f9 0000 4fe6 	move.l 4fe6 <Copperlist2>,4fca <ViewCopper>
    19b8:	0000 4fca 
  SwapCl();
    19bc:	45fa ff6e      	lea 192c <SwapCl>(pc),a2
    19c0:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    19c2:	2039 0000 4fda 	move.l 4fda <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    19c8:	2079 0000 4fd6 	movea.l 4fd6 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    19ce:	2200           	move.l d0,d1
    19d0:	4241           	clr.w d1
    19d2:	4841           	swap d1
    19d4:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    19d8:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    19dc:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    19e2:	2200           	move.l d0,d1
    19e4:	4241           	clr.w d1
    19e6:	4841           	swap d1
    19e8:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    19ec:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    19f0:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    19f2:	2079 0000 4fd6 	movea.l 4fd6 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    19f8:	2002           	move.l d2,d0
    19fa:	4240           	clr.w d0
    19fc:	4840           	swap d0
    19fe:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    1a02:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    1a06:	2002           	move.l d2,d0
    1a08:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    1a0e:	2200           	move.l d0,d1
    1a10:	4241           	clr.w d1
    1a12:	4841           	swap d1
    1a14:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    1a18:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    1a1c:	23c2 0000 4fce 	move.l d2,4fce <ViewBuffer>
}
    1a22:	7000           	moveq #0,d0
    1a24:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1a28:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    1a2a:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
    1a30:	4eae ffc4      	jsr -60(a6)
    1a34:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
    1a3a:	2200           	move.l d0,d1
    1a3c:	243c 0000 282c 	move.l #10284,d2
    1a42:	7626           	moveq #38,d3
    1a44:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1a48:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
    1a4e:	7201           	moveq #1,d1
    1a50:	4eae ff70      	jsr -144(a6)
    1a54:	2439 0000 4fd2 	move.l 4fd2 <Bitplane2>,d2
  ViewCopper = Copperlist2;
    1a5a:	23f9 0000 4fe6 	move.l 4fe6 <Copperlist2>,4fca <ViewCopper>
    1a60:	0000 4fca 
  SwapCl();
    1a64:	45fa fec6      	lea 192c <SwapCl>(pc),a2
    1a68:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    1a6a:	2039 0000 4fda 	move.l 4fda <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    1a70:	2079 0000 4fd6 	movea.l 4fd6 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    1a76:	2200           	move.l d0,d1
    1a78:	4241           	clr.w d1
    1a7a:	4841           	swap d1
    1a7c:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    1a80:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    1a84:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    1a8a:	2200           	move.l d0,d1
    1a8c:	4241           	clr.w d1
    1a8e:	4841           	swap d1
    1a90:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    1a94:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    1a98:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    1a9a:	2079 0000 4fd6 	movea.l 4fd6 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    1aa0:	2002           	move.l d2,d0
    1aa2:	4240           	clr.w d0
    1aa4:	4840           	swap d0
    1aa6:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    1aaa:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    1aae:	2002           	move.l d2,d0
    1ab0:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    1ab6:	2200           	move.l d0,d1
    1ab8:	4241           	clr.w d1
    1aba:	4841           	swap d1
    1abc:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    1ac0:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    1ac4:	23c2 0000 4fce 	move.l d2,4fce <ViewBuffer>
}
    1aca:	7000           	moveq #0,d0
    1acc:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1ad0:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    1ad2:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
    1ad8:	4eae ffc4      	jsr -60(a6)
    1adc:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
    1ae2:	2200           	move.l d0,d1
    1ae4:	243c 0000 2805 	move.l #10245,d2
    1aea:	7626           	moveq #38,d3
    1aec:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1af0:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
    1af6:	7201           	moveq #1,d1
    1af8:	4eae ff70      	jsr -144(a6)
    1afc:	2039 0000 4fe2 	move.l 4fe2 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    1b02:	23c0 0000 4fda 	move.l d0,4fda <DrawBuffer>
  DrawCopper = Copperlist1;
    1b08:	23f9 0000 4fea 	move.l 4fea <Copperlist1>,4fd6 <DrawCopper>
    1b0e:	0000 4fd6 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1b12:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
    1b18:	203c 0001 2c00 	move.l #76800,d0
    1b1e:	7202           	moveq #2,d1
    1b20:	4eae ff3a      	jsr -198(a6)
    1b24:	2400           	move.l d0,d2
    1b26:	23c0 0000 4fd2 	move.l d0,4fd2 <Bitplane2>
  if(Bitplane2 == 0) {
    1b2c:	6600 fe84      	bne.w 19b2 <PrepareDisplayZoom+0x60>
    1b30:	6000 fef8      	bra.w 1a2a <PrepareDisplayZoom+0xd8>

00001b34 <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    1b34:	2039 0000 4fda 	move.l 4fda <DrawBuffer>,d0
  UWORD *copword = DrawCopper;
    1b3a:	2079 0000 4fd6 	movea.l 4fd6 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    1b40:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    1b44:	2200           	move.l d0,d1
    1b46:	4241           	clr.w d1
    1b48:	4841           	swap d1
    1b4a:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    1b4e:	23f9 0000 4fce 	move.l 4fce <ViewBuffer>,4fda <DrawBuffer>
    1b54:	0000 4fda 
  ViewBuffer = tmp;
    1b58:	23c0 0000 4fce 	move.l d0,4fce <ViewBuffer>
}
    1b5e:	4e75           	rts

00001b60 <PrepareDisplay>:
 int PrepareDisplaySW() {
    1b60:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClbuildSW();
    1b64:	45fa f89e      	lea 1404 <ClBuild>(pc),a2
    1b68:	4e92           	jsr (a2)
    1b6a:	23c0 0000 4fea 	move.l d0,4fea <Copperlist1>
  Copperlist2 = ClbuildSW();
    1b70:	4e92           	jsr (a2)
    1b72:	23c0 0000 4fe6 	move.l d0,4fe6 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    1b78:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
    1b7e:	203c 0000 c800 	move.l #51200,d0
    1b84:	7202           	moveq #2,d1
    1b86:	4eae ff3a      	jsr -198(a6)
    1b8a:	23c0 0000 4fe2 	move.l d0,4fe2 <Bitplane1>
  if(Bitplane1 == 0) {
    1b90:	6700 00ac      	beq.w 1c3e <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    1b94:	23c0 0000 4fda 	move.l d0,4fda <DrawBuffer>
  DrawCopper = Copperlist1;
    1b9a:	23f9 0000 4fea 	move.l 4fea <Copperlist1>,4fd6 <DrawCopper>
    1ba0:	0000 4fd6 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    1ba4:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
    1baa:	203c 0000 c800 	move.l #51200,d0
    1bb0:	7202           	moveq #2,d1
    1bb2:	4eae ff3a      	jsr -198(a6)
    1bb6:	23c0 0000 4fd2 	move.l d0,4fd2 <Bitplane2>
  if(Bitplane2 == 0) {
    1bbc:	6728           	beq.s 1be6 <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    1bbe:	23c0 0000 4fce 	move.l d0,4fce <ViewBuffer>
  ViewCopper = Copperlist2;
    1bc4:	23f9 0000 4fe6 	move.l 4fe6 <Copperlist2>,4fca <ViewCopper>
    1bca:	0000 4fca 
  SwapCl();
    1bce:	47fa fd5c      	lea 192c <SwapCl>(pc),a3
    1bd2:	4e93           	jsr (a3)
  SetBplPointers();
    1bd4:	45fa ff5e      	lea 1b34 <SetBplPointers>(pc),a2
    1bd8:	4e92           	jsr (a2)
  SwapCl();
    1bda:	4e93           	jsr (a3)
  SetBplPointers();
    1bdc:	4e92           	jsr (a2)
}
    1bde:	7000           	moveq #0,d0
    1be0:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    1be4:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    1be6:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
    1bec:	4eae ffc4      	jsr -60(a6)
    1bf0:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
    1bf6:	2200           	move.l d0,d1
    1bf8:	243c 0000 282c 	move.l #10284,d2
    1bfe:	7626           	moveq #38,d3
    1c00:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1c04:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
    1c0a:	7201           	moveq #1,d1
    1c0c:	4eae ff70      	jsr -144(a6)
    1c10:	2039 0000 4fd2 	move.l 4fd2 <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    1c16:	23c0 0000 4fce 	move.l d0,4fce <ViewBuffer>
  ViewCopper = Copperlist2;
    1c1c:	23f9 0000 4fe6 	move.l 4fe6 <Copperlist2>,4fca <ViewCopper>
    1c22:	0000 4fca 
  SwapCl();
    1c26:	47fa fd04      	lea 192c <SwapCl>(pc),a3
    1c2a:	4e93           	jsr (a3)
  SetBplPointers();
    1c2c:	45fa ff06      	lea 1b34 <SetBplPointers>(pc),a2
    1c30:	4e92           	jsr (a2)
  SwapCl();
    1c32:	4e93           	jsr (a3)
  SetBplPointers();
    1c34:	4e92           	jsr (a2)
}
    1c36:	7000           	moveq #0,d0
    1c38:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    1c3c:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    1c3e:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
    1c44:	4eae ffc4      	jsr -60(a6)
    1c48:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
    1c4e:	2200           	move.l d0,d1
    1c50:	243c 0000 2805 	move.l #10245,d2
    1c56:	7626           	moveq #38,d3
    1c58:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1c5c:	2c79 0000 4fde 	movea.l 4fde <DOSBase>,a6
    1c62:	7201           	moveq #1,d1
    1c64:	4eae ff70      	jsr -144(a6)
    1c68:	2039 0000 4fe2 	move.l 4fe2 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    1c6e:	23c0 0000 4fda 	move.l d0,4fda <DrawBuffer>
  DrawCopper = Copperlist1;
    1c74:	23f9 0000 4fea 	move.l 4fea <Copperlist1>,4fd6 <DrawCopper>
    1c7a:	0000 4fd6 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    1c7e:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
    1c84:	203c 0000 c800 	move.l #51200,d0
    1c8a:	7202           	moveq #2,d1
    1c8c:	4eae ff3a      	jsr -198(a6)
    1c90:	23c0 0000 4fd2 	move.l d0,4fd2 <Bitplane2>
  if(Bitplane2 == 0) {
    1c96:	6600 ff26      	bne.w 1bbe <PrepareDisplay+0x5e>
    1c9a:	6000 ff4a      	bra.w 1be6 <PrepareDisplay+0x86>

00001c9e <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    1c9e:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    1ca2:	262f 0010      	move.l 16(sp),d3
    1ca6:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    1caa:	2279 0000 4fea 	movea.l 4fea <Copperlist1>,a1
    1cb0:	b2fc 0000      	cmpa.w #0,a1
    1cb4:	670c           	beq.s 1cc2 <FreeDisplay+0x24>
    1cb6:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
    1cbc:	2003           	move.l d3,d0
    1cbe:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    1cc2:	2279 0000 4fe6 	movea.l 4fe6 <Copperlist2>,a1
    1cc8:	b2fc 0000      	cmpa.w #0,a1
    1ccc:	670c           	beq.s 1cda <FreeDisplay+0x3c>
    1cce:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
    1cd4:	2003           	move.l d3,d0
    1cd6:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    1cda:	2279 0000 4fe2 	movea.l 4fe2 <Bitplane1>,a1
    1ce0:	b2fc 0000      	cmpa.w #0,a1
    1ce4:	670c           	beq.s 1cf2 <FreeDisplay+0x54>
    1ce6:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
    1cec:	2002           	move.l d2,d0
    1cee:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    1cf2:	2279 0000 4fd2 	movea.l 4fd2 <Bitplane2>,a1
    1cf8:	b2fc 0000      	cmpa.w #0,a1
    1cfc:	670c           	beq.s 1d0a <FreeDisplay+0x6c>
    1cfe:	2c79 0000 4fee 	movea.l 4fee <SysBase>,a6
    1d04:	2002           	move.l d2,d0
    1d06:	4eae ff2e      	jsr -210(a6)
}
    1d0a:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    1d0e:	4e75           	rts

00001d10 <WaitVbl>:
void WaitVbl() {
    1d10:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    1d12:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddcfeb>,d0
    1d18:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    1d1a:	2017           	move.l (sp),d0
    1d1c:	0280 0001 ff00 	andi.l #130816,d0
    1d22:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    1d24:	2017           	move.l (sp),d0
    1d26:	0c80 0001 3700 	cmpi.l #79616,d0
    1d2c:	67e4           	beq.s 1d12 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    1d2e:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddcfeb>,d0
    1d34:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    1d38:	202f 0004      	move.l 4(sp),d0
    1d3c:	0280 0001 ff00 	andi.l #130816,d0
    1d42:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    1d46:	202f 0004      	move.l 4(sp),d0
    1d4a:	0c80 0001 3700 	cmpi.l #79616,d0
    1d50:	66dc           	bne.s 1d2e <WaitVbl+0x1e>
}
    1d52:	508f           	addq.l #8,sp
    1d54:	4e75           	rts

00001d56 <memcpy>:
{
    1d56:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    1d5a:	202f 0014      	move.l 20(sp),d0
    1d5e:	226f 0018      	movea.l 24(sp),a1
    1d62:	222f 001c      	move.l 28(sp),d1
	while(len--)
    1d66:	2601           	move.l d1,d3
    1d68:	5383           	subq.l #1,d3
    1d6a:	4a81           	tst.l d1
    1d6c:	6762           	beq.s 1dd0 <memcpy+0x7a>
    1d6e:	2040           	movea.l d0,a0
    1d70:	5888           	addq.l #4,a0
    1d72:	b1c9           	cmpa.l a1,a0
    1d74:	53c2           	sl.s d2
    1d76:	4402           	neg.b d2
    1d78:	41e9 0004      	lea 4(a1),a0
    1d7c:	b1c0           	cmpa.l d0,a0
    1d7e:	53c4           	sl.s d4
    1d80:	4404           	neg.b d4
    1d82:	8404           	or.b d4,d2
    1d84:	7808           	moveq #8,d4
    1d86:	b883           	cmp.l d3,d4
    1d88:	55c4           	sc.s d4
    1d8a:	4404           	neg.b d4
    1d8c:	c404           	and.b d4,d2
    1d8e:	6746           	beq.s 1dd6 <memcpy+0x80>
    1d90:	2409           	move.l a1,d2
    1d92:	8480           	or.l d0,d2
    1d94:	7803           	moveq #3,d4
    1d96:	c484           	and.l d4,d2
    1d98:	663c           	bne.s 1dd6 <memcpy+0x80>
    1d9a:	2049           	movea.l a1,a0
    1d9c:	2440           	movea.l d0,a2
    1d9e:	74fc           	moveq #-4,d2
    1da0:	c481           	and.l d1,d2
    1da2:	d489           	add.l a1,d2
		*d++ = *s++;
    1da4:	24d8           	move.l (a0)+,(a2)+
    1da6:	b488           	cmp.l a0,d2
    1da8:	66fa           	bne.s 1da4 <memcpy+0x4e>
    1daa:	74fc           	moveq #-4,d2
    1dac:	c481           	and.l d1,d2
    1dae:	2040           	movea.l d0,a0
    1db0:	d1c2           	adda.l d2,a0
    1db2:	d3c2           	adda.l d2,a1
    1db4:	9682           	sub.l d2,d3
    1db6:	b481           	cmp.l d1,d2
    1db8:	6716           	beq.s 1dd0 <memcpy+0x7a>
    1dba:	1091           	move.b (a1),(a0)
	while(len--)
    1dbc:	4a83           	tst.l d3
    1dbe:	6710           	beq.s 1dd0 <memcpy+0x7a>
		*d++ = *s++;
    1dc0:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    1dc6:	5383           	subq.l #1,d3
    1dc8:	6706           	beq.s 1dd0 <memcpy+0x7a>
		*d++ = *s++;
    1dca:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    1dd0:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    1dd4:	4e75           	rts
    1dd6:	2040           	movea.l d0,a0
    1dd8:	d289           	add.l a1,d1
		*d++ = *s++;
    1dda:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    1ddc:	b289           	cmp.l a1,d1
    1dde:	67f0           	beq.s 1dd0 <memcpy+0x7a>
		*d++ = *s++;
    1de0:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    1de2:	b289           	cmp.l a1,d1
    1de4:	66f4           	bne.s 1dda <memcpy+0x84>
    1de6:	60e8           	bra.s 1dd0 <memcpy+0x7a>

00001de8 <memset>:
{
    1de8:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    1dec:	202f 0024      	move.l 36(sp),d0
    1df0:	2a2f 0028      	move.l 40(sp),d5
    1df4:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    1df8:	2809           	move.l a1,d4
    1dfa:	5384           	subq.l #1,d4
    1dfc:	b2fc 0000      	cmpa.w #0,a1
    1e00:	6f00 00b0      	ble.w 1eb2 <memset+0xca>
    1e04:	1e05           	move.b d5,d7
    1e06:	2200           	move.l d0,d1
    1e08:	4481           	neg.l d1
    1e0a:	7403           	moveq #3,d2
    1e0c:	c282           	and.l d2,d1
    1e0e:	7c05           	moveq #5,d6
		*ptr++ = val;
    1e10:	2440           	movea.l d0,a2
    1e12:	bc84           	cmp.l d4,d6
    1e14:	646a           	bcc.s 1e80 <memset+0x98>
    1e16:	4a81           	tst.l d1
    1e18:	6724           	beq.s 1e3e <memset+0x56>
    1e1a:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    1e1c:	5384           	subq.l #1,d4
    1e1e:	7401           	moveq #1,d2
    1e20:	b481           	cmp.l d1,d2
    1e22:	671a           	beq.s 1e3e <memset+0x56>
		*ptr++ = val;
    1e24:	2440           	movea.l d0,a2
    1e26:	548a           	addq.l #2,a2
    1e28:	2040           	movea.l d0,a0
    1e2a:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    1e2e:	5384           	subq.l #1,d4
    1e30:	7403           	moveq #3,d2
    1e32:	b481           	cmp.l d1,d2
    1e34:	6608           	bne.s 1e3e <memset+0x56>
		*ptr++ = val;
    1e36:	528a           	addq.l #1,a2
    1e38:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    1e3c:	5384           	subq.l #1,d4
    1e3e:	2609           	move.l a1,d3
    1e40:	9681           	sub.l d1,d3
    1e42:	7c00           	moveq #0,d6
    1e44:	1c05           	move.b d5,d6
    1e46:	2406           	move.l d6,d2
    1e48:	4842           	swap d2
    1e4a:	4242           	clr.w d2
    1e4c:	2042           	movea.l d2,a0
    1e4e:	2406           	move.l d6,d2
    1e50:	e14a           	lsl.w #8,d2
    1e52:	4842           	swap d2
    1e54:	4242           	clr.w d2
    1e56:	e18e           	lsl.l #8,d6
    1e58:	2646           	movea.l d6,a3
    1e5a:	2c08           	move.l a0,d6
    1e5c:	8486           	or.l d6,d2
    1e5e:	2c0b           	move.l a3,d6
    1e60:	8486           	or.l d6,d2
    1e62:	1407           	move.b d7,d2
    1e64:	2040           	movea.l d0,a0
    1e66:	d1c1           	adda.l d1,a0
    1e68:	72fc           	moveq #-4,d1
    1e6a:	c283           	and.l d3,d1
    1e6c:	d288           	add.l a0,d1
		*ptr++ = val;
    1e6e:	20c2           	move.l d2,(a0)+
    1e70:	b1c1           	cmpa.l d1,a0
    1e72:	66fa           	bne.s 1e6e <memset+0x86>
    1e74:	72fc           	moveq #-4,d1
    1e76:	c283           	and.l d3,d1
    1e78:	d5c1           	adda.l d1,a2
    1e7a:	9881           	sub.l d1,d4
    1e7c:	b283           	cmp.l d3,d1
    1e7e:	6732           	beq.s 1eb2 <memset+0xca>
    1e80:	1485           	move.b d5,(a2)
	while(len-- > 0)
    1e82:	4a84           	tst.l d4
    1e84:	6f2c           	ble.s 1eb2 <memset+0xca>
		*ptr++ = val;
    1e86:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    1e8a:	7201           	moveq #1,d1
    1e8c:	b284           	cmp.l d4,d1
    1e8e:	6c22           	bge.s 1eb2 <memset+0xca>
		*ptr++ = val;
    1e90:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    1e94:	7402           	moveq #2,d2
    1e96:	b484           	cmp.l d4,d2
    1e98:	6c18           	bge.s 1eb2 <memset+0xca>
		*ptr++ = val;
    1e9a:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    1e9e:	7c03           	moveq #3,d6
    1ea0:	bc84           	cmp.l d4,d6
    1ea2:	6c0e           	bge.s 1eb2 <memset+0xca>
		*ptr++ = val;
    1ea4:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    1ea8:	7204           	moveq #4,d1
    1eaa:	b284           	cmp.l d4,d1
    1eac:	6c04           	bge.s 1eb2 <memset+0xca>
		*ptr++ = val;
    1eae:	1545 0005      	move.b d5,5(a2)
}
    1eb2:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    1eb6:	4e75           	rts

00001eb8 <strlen>:
{
    1eb8:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    1ebc:	7000           	moveq #0,d0
	while(*s++)
    1ebe:	4a10           	tst.b (a0)
    1ec0:	6708           	beq.s 1eca <strlen+0x12>
		t++;
    1ec2:	5280           	addq.l #1,d0
	while(*s++)
    1ec4:	4a30 0800      	tst.b (0,a0,d0.l)
    1ec8:	66f8           	bne.s 1ec2 <strlen+0xa>
}
    1eca:	4e75           	rts

00001ecc <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    1ecc:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    1ed0:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    1ed4:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    1ed8:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    1edc:	d041           	add.w d1,d0
	swap	d0
    1ede:	4840           	swap d0
	clrw	d0
    1ee0:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    1ee2:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    1ee6:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    1eea:	d081           	add.l d1,d0

	rts
    1eec:	4e75           	rts

00001eee <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    1eee:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    1ef0:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    1ef4:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    1ef8:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    1efe:	6416           	bcc.s 1f16 <__udivsi3+0x28>
	movel	d0, d2
    1f00:	2400           	move.l d0,d2
	clrw	d2
    1f02:	4242           	clr.w d2
	swap	d2
    1f04:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    1f06:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    1f08:	3002           	move.w d2,d0
	swap	d0
    1f0a:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    1f0c:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    1f10:	84c1           	divu.w d1,d2
	movew	d2, d0
    1f12:	3002           	move.w d2,d0
	jra	6f
    1f14:	6030           	bra.s 1f46 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    1f16:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    1f18:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    1f1a:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    1f1c:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    1f22:	64f4           	bcc.s 1f18 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    1f24:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    1f26:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    1f2c:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    1f2e:	c2c0           	mulu.w d0,d1
	swap	d2
    1f30:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    1f32:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    1f34:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    1f36:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    1f38:	660a           	bne.s 1f44 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    1f3a:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    1f3c:	6506           	bcs.s 1f44 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    1f3e:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    1f42:	6302           	bls.s 1f46 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    1f44:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    1f46:	241f           	move.l (sp)+,d2
	rts
    1f48:	4e75           	rts

00001f4a <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    1f4a:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    1f4c:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    1f4e:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    1f52:	6a04           	bpl.s 1f58 <__divsi3+0xe>
	negl	d1
    1f54:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    1f56:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    1f58:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    1f5c:	6a04           	bpl.s 1f62 <__divsi3+0x18>
	negl	d0
    1f5e:	4480           	neg.l d0
	negb	d2
    1f60:	4402           	neg.b d2

2:	movel	d1, sp@-
    1f62:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1f64:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    1f66:	6186           	bsr.s 1eee <__udivsi3>
	addql	IMM (8), sp
    1f68:	508f           	addq.l #8,sp

	tstb	d2
    1f6a:	4a02           	tst.b d2
	jpl	3f
    1f6c:	6a02           	bpl.s 1f70 <__divsi3+0x26>
	negl	d0
    1f6e:	4480           	neg.l d0

3:	movel	sp@+, d2
    1f70:	241f           	move.l (sp)+,d2
	rts
    1f72:	4e75           	rts

00001f74 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    1f74:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    1f78:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    1f7c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1f7e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    1f80:	61c8           	bsr.s 1f4a <__divsi3>
	addql	IMM (8), sp
    1f82:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    1f84:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    1f88:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1f8a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    1f8c:	6100 ff3e      	bsr.w 1ecc <__mulsi3>
	addql	IMM (8), sp
    1f90:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    1f92:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    1f96:	9280           	sub.l d0,d1
	movel	d1, d0
    1f98:	2001           	move.l d1,d0
	rts
    1f9a:	4e75           	rts

00001f9c <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    1f9c:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    1fa0:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    1fa4:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1fa6:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    1fa8:	6100 ff44      	bsr.w 1eee <__udivsi3>
	addql	IMM (8), sp
    1fac:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    1fae:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    1fb2:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1fb4:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    1fb6:	6100 ff14      	bsr.w 1ecc <__mulsi3>
	addql	IMM (8), sp
    1fba:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    1fbc:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    1fc0:	9280           	sub.l d0,d1
	movel	d1, d0
    1fc2:	2001           	move.l d1,d0
	rts
    1fc4:	4e75           	rts

00001fc6 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    1fc6:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    1fc8:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    1fcc:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    1fd0:	2c5f           	movea.l (sp)+,a6
    rts
    1fd2:	4e75           	rts

00001fd4 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    1fd4:	16c0           	move.b d0,(a3)+
	rts
    1fd6:	4e75           	rts

00001fd8 <saveregs>:
	...

00002014 <font2distance>:
    2014:	0505           	btst d2,d5
    2016:	0505           	btst d2,d5
    2018:	0505           	btst d2,d5
    201a:	0505           	btst d2,d5
    201c:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    201e:	0505           	btst d2,d5
    2020:	0505           	btst d2,d5
    2022:	0005 0505      	ori.b #5,d5
    2026:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    2028:	0505           	btst d2,d5
    202a:	0505           	btst d2,d5
    202c:	0505           	btst d2,d5
    202e:	0505           	btst d2,d5
    2030:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    2032:	0505           	btst d2,d5
    2034:	0505           	btst d2,d5
    2036:	0505           	btst d2,d5
    2038:	0505           	btst d2,d5
    203a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    203c:	0500           	btst d2,d0
    203e:	0505           	btst d2,d5
    2040:	0505           	btst d2,d5
    2042:	0505           	btst d2,d5
    2044:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    2046:	0505           	btst d2,d5
    2048:	0505           	btst d2,d5
    204a:	0505           	btst d2,d5
    204c:	0505           	btst d2,d5
    204e:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    2050:	0505           	btst d2,d5
    2052:	0505           	btst d2,d5
    2054:	0503           	btst d2,d3
    2056:	0505           	btst d2,d5
    2058:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    205a:	0505           	btst d2,d5
    205c:	0500           	btst d2,d0
    205e:	0505           	btst d2,d5
    2060:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    2064:	0505           	btst d2,d5
    2066:	0503           	btst d2,d3
    2068:	0205 0507      	andi.b #7,d5
    206c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    206e:	0505           	btst d2,d5
    2070:	0505           	btst d2,d5
    2072:	0505           	btst d2,d5
    2074:	0505           	btst d2,d5
    2076:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2078:	0505           	btst d2,d5
    207a:	0505           	btst d2,d5
    207c:	0505           	btst d2,d5
    207e:	0505           	btst d2,d5
    2080:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2082:	0505           	btst d2,d5
    2084:	0505           	btst d2,d5
    2086:	0505           	btst d2,d5
    2088:	0505           	btst d2,d5
    208a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    208c:	0505           	btst d2,d5
    208e:	0505           	btst d2,d5
    2090:	0505           	btst d2,d5
    2092:	0505           	btst d2,d5
    2094:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2096:	0505           	btst d2,d5
    2098:	0505           	btst d2,d5
    209a:	0505           	btst d2,d5
    209c:	0505           	btst d2,d5
    209e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    20a0:	0505           	btst d2,d5
    20a2:	0505           	btst d2,d5
    20a4:	0505           	btst d2,d5
    20a6:	0505           	btst d2,d5
    20a8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    20aa:	0505           	btst d2,d5
    20ac:	0505           	btst d2,d5
    20ae:	0505           	btst d2,d5
    20b0:	0505           	btst d2,d5
    20b2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    20b4:	0505           	btst d2,d5
    20b6:	0505           	btst d2,d5
    20b8:	0505           	btst d2,d5
    20ba:	0505           	btst d2,d5
    20bc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    20be:	0505           	btst d2,d5
    20c0:	0505           	btst d2,d5
    20c2:	0505           	btst d2,d5
    20c4:	0505           	btst d2,d5
    20c6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    20c8:	0505           	btst d2,d5
    20ca:	0505           	btst d2,d5
    20cc:	0505           	btst d2,d5
    20ce:	0505           	btst d2,d5
    20d0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    20d2:	0505           	btst d2,d5
    20d4:	0505           	btst d2,d5
    20d6:	0505           	btst d2,d5
    20d8:	0505           	btst d2,d5
    20da:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    20dc:	0505           	btst d2,d5
    20de:	0505           	btst d2,d5
    20e0:	0505           	btst d2,d5
    20e2:	0505           	btst d2,d5
    20e4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    20e6:	0505           	btst d2,d5
    20e8:	0505           	btst d2,d5
    20ea:	0505           	btst d2,d5
    20ec:	0505           	btst d2,d5
    20ee:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    20f0:	0505           	btst d2,d5
    20f2:	0505           	btst d2,d5
    20f4:	0505           	btst d2,d5
    20f6:	0505           	btst d2,d5
    20f8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    20fa:	0505           	btst d2,d5
    20fc:	0505           	btst d2,d5
    20fe:	0505           	btst d2,d5
    2100:	0505           	btst d2,d5
    2102:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2104:	0505           	btst d2,d5
    2106:	0505           	btst d2,d5
    2108:	0505           	btst d2,d5
    210a:	0505           	btst d2,d5
    210c:	0505           	btst d2,d5

0000210e <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    210e:	48f9 7fff 0000 	movem.l d0-a6,1fd8 <saveregs>
    2114:	1fd8 
  lea 0xdff000,a5
    2116:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddcfe7>,a5
  move.l sp@(4),a0  //Fontlocation
    211c:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    2120:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    2124:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    2128:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    212a:	082d 0006 0002 	btst #6,2(a5)

00002130 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    2130:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    2136:	66f8           	bne.s 2130 <st2wblit>

00002138 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    2138:	7019           	moveq #25,d0
	sub.l d5,d5      
    213a:	9a85           	sub.l d5,d5

0000213c <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    213c:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    213e:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    2140:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    2144:	9dce           	suba.l a6,a6
	move.l d2, a6
    2146:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    2148:	ddfc 0000 2014 	adda.l #8212,a6

	LSL  	#4,d2 	    //Fetch next char
    214e:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    2150:	2842           	movea.l d2,a4


	move.l  #0,d4
    2152:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    2154:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    2156:	3814           	move.w (a4),d4
	swap	d4
    2158:	4844           	swap d4
	lsr.l	d5, d4
    215a:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    215c:	8993           	or.l d4,(a3)
	clr.l	d4
    215e:	4284           	clr.l d4
	move.w  2(a4), d4
    2160:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    2164:	4844           	swap d4
	lsr.l	d5, d4
    2166:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    2168:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    216c:	4284           	clr.l d4
	move.w  4(a4), d4
    216e:	382c 0004      	move.w 4(a4),d4
	swap	d4
    2172:	4844           	swap d4
	lsr.l	d5, d4
    2174:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    2176:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    217a:	4284           	clr.l d4
	move.w  6(a4), d4
    217c:	382c 0006      	move.w 6(a4),d4
	swap	d4
    2180:	4844           	swap d4
	lsr.l	d5, d4
    2182:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    2184:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    2188:	4284           	clr.l d4
	move.w  8(a4), d4
    218a:	382c 0008      	move.w 8(a4),d4
	swap	d4
    218e:	4844           	swap d4
	lsr.l	d5, d4
    2190:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    2192:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    2196:	4284           	clr.l d4
	move.w  10(a4), d4
    2198:	382c 000a      	move.w 10(a4),d4
	swap	d4
    219c:	4844           	swap d4
	lsr.l	d5, d4
    219e:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    21a0:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    21a4:	4284           	clr.l d4
	move.w  12(a4), d4
    21a6:	382c 000c      	move.w 12(a4),d4
	swap	d4
    21aa:	4844           	swap d4
	lsr.l	d5, d4
    21ac:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    21ae:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    21b2:	4284           	clr.l d4
	move.w  14(a4), d4
    21b4:	382c 000e      	move.w 14(a4),d4
	swap	d4
    21b8:	4844           	swap d4
	lsr.l	d5, d4
    21ba:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    21bc:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    21c0:	4284           	clr.l d4

	add.b   (a6), d5
    21c2:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    21c4:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    21c8:	6500 0006      	bcs.w 21d0 <noadditionalchar>
	addq.w  #1, a3
    21cc:	524b           	addq.w #1,a3
	sub.w   #8,d5
    21ce:	5145           	subq.w #8,d5

000021d0 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    21d0:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    21d2:	51c8 ff68      	dbf d0,213c <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    21d6:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    21da:	51cb ff5c      	dbf d3,2138 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    21de:	4cfa 7fff fdf6 	movem.l 1fd8 <saveregs>(pc),d0-a6

	RTS
    21e4:	4e75           	rts
