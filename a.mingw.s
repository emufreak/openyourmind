
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
       a:	48e7 313a      	movem.l d2-d3/d7/a2-a4/a6,-(sp)

  SysBase = *((struct ExecBase**)4UL);
       e:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      12:	23ce 0000 4ab6 	move.l a6,4ab6 <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,4a8e <hw>
      1e:	0000 4a8e 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 248f 	lea 248f <incbin_swfont_end+0xbd>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 4a8a 	move.l d0,4a8a <GfxBase>
	if (!GfxBase)
      34:	6700 0c86      	beq.w cbc <main+0xcb6>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 4ab6 	movea.l 4ab6 <SysBase>,a6
      3e:	43f9 0000 24a0 	lea 24a0 <incbin_swfont_end+0xce>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 4aa6 	move.l d0,4aa6 <DOSBase>
	if (!DOSBase)
      50:	6700 0c5e      	beq.w cb0 <main+0xcaa>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 24ac 	pea 24ac <incbin_swfont_end+0xda>
      5a:	4eb9 0000 0f80 	jsr f80 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 24c8 	move.l #9416,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      7e:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
      84:	4eae ffc4      	jsr -60(a6)
      88:	2079 0000 4a8e 	movea.l 4a8e <hw>,a0
      8e:	2628 0080      	move.l 128(a0),d3
      92:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
      98:	2200           	move.l d0,d1
      9a:	243c 0000 24d8 	move.l #9432,d2
      a0:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      a4:	47f9 0000 11dc 	lea 11dc <ClBuild>,a3
      aa:	4e93           	jsr (a3)
      ac:	2440           	movea.l d0,a2
      ae:	23c0 0000 4ab2 	move.l d0,4ab2 <Copperlist1>
  DrawCopper = Copperlist1;
      b4:	23c0 0000 4a9e 	move.l d0,4a9e <DrawCopper>
  Copperlist2 = ClBuild();
      ba:	4e93           	jsr (a3)
      bc:	23c0 0000 4aae 	move.l d0,4aae <Copperlist2>
  ViewCopper = Copperlist2;
      c2:	23c0 0000 4a92 	move.l d0,4a92 <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      c8:	588f           	addq.l #4,sp
      ca:	2012           	move.l (a2),d0
      cc:	b0b9 0000 49f8 	cmp.l 49f8 <ClsSprites>,d0
      d2:	6600 0afa      	bne.w bce <main+0xbc8>
      d6:	206a 0004      	movea.l 4(a2),a0
      da:	b1f9 0000 49fc 	cmpa.l 49fc <ClsSprites+0x4>,a0
      e0:	6600 0aec      	bne.w bce <main+0xbc8>
      e4:	202a 0008      	move.l 8(a2),d0
      e8:	b0b9 0000 4a00 	cmp.l 4a00 <ClsSprites+0x8>,d0
      ee:	6600 0ade      	bne.w bce <main+0xbc8>
      f2:	206a 000c      	movea.l 12(a2),a0
      f6:	b1f9 0000 4a04 	cmpa.l 4a04 <ClsSprites+0xc>,a0
      fc:	6600 0ad0      	bne.w bce <main+0xbc8>
     100:	202a 0010      	move.l 16(a2),d0
     104:	b0b9 0000 4a08 	cmp.l 4a08 <ClsSprites+0x10>,d0
     10a:	6600 0ac2      	bne.w bce <main+0xbc8>
     10e:	206a 0014      	movea.l 20(a2),a0
     112:	b1f9 0000 4a0c 	cmpa.l 4a0c <ClsSprites+0x14>,a0
     118:	6600 0ab4      	bne.w bce <main+0xbc8>
     11c:	202a 0018      	move.l 24(a2),d0
     120:	b0b9 0000 4a10 	cmp.l 4a10 <ClsSprites+0x18>,d0
     126:	6600 0aa6      	bne.w bce <main+0xbc8>
     12a:	206a 001c      	movea.l 28(a2),a0
     12e:	b1f9 0000 4a14 	cmpa.l 4a14 <ClsSprites+0x1c>,a0
     134:	6600 0a98      	bne.w bce <main+0xbc8>
     138:	202a 0020      	move.l 32(a2),d0
     13c:	b0b9 0000 4a18 	cmp.l 4a18 <ClsSprites+0x20>,d0
     142:	6600 0a8a      	bne.w bce <main+0xbc8>
     146:	206a 0024      	movea.l 36(a2),a0
     14a:	b1f9 0000 4a1c 	cmpa.l 4a1c <ClsSprites+0x24>,a0
     150:	6600 0a7c      	bne.w bce <main+0xbc8>
     154:	202a 0028      	move.l 40(a2),d0
     158:	b0b9 0000 4a20 	cmp.l 4a20 <ClsSprites+0x28>,d0
     15e:	6600 0a6e      	bne.w bce <main+0xbc8>
     162:	206a 002c      	movea.l 44(a2),a0
     166:	b1f9 0000 4a24 	cmpa.l 4a24 <ClsSprites+0x2c>,a0
     16c:	6600 0a60      	bne.w bce <main+0xbc8>
     170:	202a 0030      	move.l 48(a2),d0
     174:	b0b9 0000 4a28 	cmp.l 4a28 <ClsSprites+0x30>,d0
     17a:	6600 0a52      	bne.w bce <main+0xbc8>
     17e:	206a 0034      	movea.l 52(a2),a0
     182:	b1f9 0000 4a2c 	cmpa.l 4a2c <ClsSprites+0x34>,a0
     188:	6600 0a44      	bne.w bce <main+0xbc8>
     18c:	202a 0038      	move.l 56(a2),d0
     190:	b0b9 0000 4a30 	cmp.l 4a30 <ClsSprites+0x38>,d0
     196:	6600 0a36      	bne.w bce <main+0xbc8>
     19a:	246a 003c      	movea.l 60(a2),a2
     19e:	b5f9 0000 4a34 	cmpa.l 4a34 <ClsSprites+0x3c>,a2
     1a4:	6600 0a28      	bne.w bce <main+0xbc8>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1a8:	2079 0000 4ab2 	movea.l 4ab2 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ae:	2039 0000 49c8 	move.l 49c8 <ClScreen>,d0
     1b4:	b0a8 0040      	cmp.l 64(a0),d0
     1b8:	6600 0a36      	bne.w bf0 <main+0xbea>
     1bc:	2039 0000 49cc 	move.l 49cc <ClScreen+0x4>,d0
     1c2:	b0a8 0044      	cmp.l 68(a0),d0
     1c6:	6600 0a28      	bne.w bf0 <main+0xbea>
     1ca:	2039 0000 49d0 	move.l 49d0 <ClScreen+0x8>,d0
     1d0:	b0a8 0048      	cmp.l 72(a0),d0
     1d4:	6600 0a1a      	bne.w bf0 <main+0xbea>
     1d8:	2039 0000 49d4 	move.l 49d4 <ClScreen+0xc>,d0
     1de:	b0a8 004c      	cmp.l 76(a0),d0
     1e2:	6600 0a0c      	bne.w bf0 <main+0xbea>
     1e6:	2039 0000 49d8 	move.l 49d8 <ClScreen+0x10>,d0
     1ec:	b0a8 0050      	cmp.l 80(a0),d0
     1f0:	6600 09fe      	bne.w bf0 <main+0xbea>
     1f4:	2039 0000 49dc 	move.l 49dc <ClScreen+0x14>,d0
     1fa:	b0a8 0054      	cmp.l 84(a0),d0
     1fe:	6600 09f0      	bne.w bf0 <main+0xbea>
     202:	2039 0000 49e0 	move.l 49e0 <ClScreen+0x18>,d0
     208:	b0a8 0058      	cmp.l 88(a0),d0
     20c:	6600 09e2      	bne.w bf0 <main+0xbea>
     210:	2028 005c      	move.l 92(a0),d0
     214:	b0b9 0000 49e4 	cmp.l 49e4 <ClScreen+0x1c>,d0
     21a:	6600 09d4      	bne.w bf0 <main+0xbea>
     21e:	2028 0060      	move.l 96(a0),d0
     222:	b0b9 0000 49e8 	cmp.l 49e8 <ClScreen+0x20>,d0
     228:	6600 09c6      	bne.w bf0 <main+0xbea>
     22c:	2028 0064      	move.l 100(a0),d0
     230:	b0b9 0000 49ec 	cmp.l 49ec <ClScreen+0x24>,d0
     236:	6600 09b8      	bne.w bf0 <main+0xbea>
     23a:	2028 0068      	move.l 104(a0),d0
     23e:	b0b9 0000 49f0 	cmp.l 49f0 <ClScreen+0x28>,d0
     244:	6600 09aa      	bne.w bf0 <main+0xbea>
     248:	2068 006c      	movea.l 108(a0),a0
     24c:	b1f9 0000 49f4 	cmpa.l 49f4 <ClScreen+0x2c>,a0
     252:	6600 099c      	bne.w bf0 <main+0xbea>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = 0x40000;
     256:	23fc 0004 0000 	move.l #262144,4aa2 <DrawBuffer>
     25c:	0000 4aa2 
  ViewBuffer = 0x50000;
     260:	23fc 0005 0000 	move.l #327680,4a96 <ViewBuffer>
     266:	0000 4a96 
  SetBplPointers();
     26a:	47f9 0000 1770 	lea 1770 <SetBplPointers>,a3
     270:	4e93           	jsr (a3)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     272:	0cb9 0005 0000 	cmpi.l #327680,4aa2 <DrawBuffer>
     278:	0000 4aa2 
     27c:	6700 0b8e      	beq.w e0c <main+0xe06>
    Write( Output(), 
     280:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     286:	4eae ffc4      	jsr -60(a6)
     28a:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     290:	2200           	move.l d0,d1
     292:	243c 0000 24db 	move.l #9435,d2
     298:	763b           	moveq #59,d3
     29a:	4eae ffd0      	jsr -48(a6)
  int test1 = instructions[pos];
     29e:	2079 0000 4ab2 	movea.l 4ab2 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2a4:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2aa:	0070 
     2ac:	6724           	beq.s 2d2 <main+0x2cc>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ae:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     2b4:	4eae ffc4      	jsr -60(a6)
     2b8:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     2be:	2200           	move.l d0,d1
     2c0:	243c 0000 2517 	move.l #9495,d2
     2c6:	763c           	moveq #60,d3
     2c8:	4eae ffd0      	jsr -48(a6)
     2cc:	2079 0000 4ab2 	movea.l 4ab2 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2d2:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2d8:	0074 
     2da:	6724           	beq.s 300 <main+0x2fa>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2dc:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     2e2:	4eae ffc4      	jsr -60(a6)
     2e6:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     2ec:	2200           	move.l d0,d1
     2ee:	243c 0000 2554 	move.l #9556,d2
     2f4:	763c           	moveq #60,d3
     2f6:	4eae ffd0      	jsr -48(a6)
     2fa:	2079 0000 4ab2 	movea.l 4ab2 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     300:	2028 0078      	move.l 120(a0),d0
     304:	b0b9 0000 49c0 	cmp.l 49c0 <ClColor>,d0
     30a:	6600 0b30      	bne.w e3c <main+0xe36>
     30e:	2028 007c      	move.l 124(a0),d0
     312:	b0b9 0000 49c4 	cmp.l 49c4 <ClColor+0x4>,d0
     318:	6600 0b22      	bne.w e3c <main+0xe36>
  if( instructions[pos] == value ) 
     31c:	70fe           	moveq #-2,d0
     31e:	b0a8 0080      	cmp.l 128(a0),d0
     322:	671e           	beq.s 342 <main+0x33c>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     324:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     32a:	4eae ffc4      	jsr -60(a6)
     32e:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     334:	2200           	move.l d0,d1
     336:	243c 0000 25b3 	move.l #9651,d2
     33c:	7622           	moveq #34,d3
     33e:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     342:	45f9 0000 174a 	lea 174a <SwapCl>,a2
     348:	4e92           	jsr (a2)
  if( DrawCopper != Copperlist2)
     34a:	2079 0000 4a9e 	movea.l 4a9e <DrawCopper>,a0
     350:	b1f9 0000 4aae 	cmpa.l 4aae <Copperlist2>,a0
     356:	671e           	beq.s 376 <main+0x370>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     358:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     35e:	4eae ffc4      	jsr -60(a6)
     362:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     368:	2200           	move.l d0,d1
     36a:	243c 0000 25d6 	move.l #9686,d2
     370:	7615           	moveq #21,d3
     372:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     376:	49f9 0000 179c 	lea 179c <PrepareDisplay>,a4
     37c:	4e94           	jsr (a4)
  if( DrawBuffer != Bitplane1) 
     37e:	2039 0000 4aa2 	move.l 4aa2 <DrawBuffer>,d0
     384:	b0b9 0000 4aaa 	cmp.l 4aaa <Bitplane1>,d0
     38a:	671e           	beq.s 3aa <main+0x3a4>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     38c:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     392:	4eae ffc4      	jsr -60(a6)
     396:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     39c:	2200           	move.l d0,d1
     39e:	243c 0000 25ec 	move.l #9708,d2
     3a4:	7637           	moveq #55,d3
     3a6:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3aa:	2079 0000 4a9e 	movea.l 4a9e <DrawCopper>,a0
     3b0:	b1f9 0000 4ab2 	cmpa.l 4ab2 <Copperlist1>,a0
     3b6:	671e           	beq.s 3d6 <main+0x3d0>
    Write( Output(), 
     3b8:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     3be:	4eae ffc4      	jsr -60(a6)
     3c2:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     3c8:	2200           	move.l d0,d1
     3ca:	243c 0000 2624 	move.l #9764,d2
     3d0:	7639           	moveq #57,d3
     3d2:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3d6:	4e94           	jsr (a4)

  if( ViewBuffer != Bitplane2) 
     3d8:	2039 0000 4a96 	move.l 4a96 <ViewBuffer>,d0
     3de:	b0b9 0000 4a9a 	cmp.l 4a9a <Bitplane2>,d0
     3e4:	671e           	beq.s 404 <main+0x3fe>
    Write( Output(), 
     3e6:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     3ec:	4eae ffc4      	jsr -60(a6)
     3f0:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     3f6:	2200           	move.l d0,d1
     3f8:	243c 0000 265e 	move.l #9822,d2
     3fe:	7638           	moveq #56,d3
     400:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     404:	2079 0000 4a92 	movea.l 4a92 <ViewCopper>,a0
     40a:	b1f9 0000 4aae 	cmpa.l 4aae <Copperlist2>,a0
     410:	671e           	beq.s 430 <main+0x42a>
    Write( Output(), 
     412:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     418:	4eae ffc4      	jsr -60(a6)
     41c:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     422:	2200           	move.l d0,d1
     424:	243c 0000 2697 	move.l #9879,d2
     42a:	763a           	moveq #58,d3
     42c:	4eae ffd0      	jsr -48(a6)
	}
	SetInterruptHandler((APTR)interruptHandler);
}

void RunFrame() {
  SwapCl();
     430:	4e92           	jsr (a2)
  SetBplPointers();
     432:	4e93           	jsr (a3)
             "PrepareDisplay: ViewCopper should be set to Copperlist 2.\n", 58);

  RunFrame();
  UWORD *copword = ViewCopper;
     434:	2079 0000 4a92 	movea.l 4a92 <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     43a:	7000           	moveq #0,d0
     43c:	3028 0072      	move.w 114(a0),d0
     440:	4840           	swap d0
     442:	4240           	clr.w d0
     444:	7200           	moveq #0,d1
     446:	3228 0076      	move.w 118(a0),d1
     44a:	d081           	add.l d1,d0
  if( pointer != Bitplane2) 
     44c:	b0b9 0000 4a9a 	cmp.l 4a9a <Bitplane2>,d0
     452:	671e           	beq.s 472 <main+0x46c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     454:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     45a:	4eae ffc4      	jsr -60(a6)
     45e:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     464:	2200           	move.l d0,d1
     466:	243c 0000 26d2 	move.l #9938,d2
     46c:	7648           	moveq #72,d3
     46e:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     472:	4e92           	jsr (a2)
  SetBplPointers();
     474:	4e93           	jsr (a3)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = ViewCopper;
     476:	2079 0000 4a92 	movea.l 4a92 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     47c:	7000           	moveq #0,d0
     47e:	3028 0072      	move.w 114(a0),d0
     482:	4840           	swap d0
     484:	4240           	clr.w d0
     486:	7200           	moveq #0,d1
     488:	3228 0076      	move.w 118(a0),d1
     48c:	d081           	add.l d1,d0
  if( pointer != Bitplane1) 
     48e:	b0b9 0000 4aaa 	cmp.l 4aaa <Bitplane1>,d0
     494:	671e           	beq.s 4b4 <main+0x4ae>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     496:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     49c:	4eae ffc4      	jsr -60(a6)
     4a0:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     4a6:	2200           	move.l d0,d1
     4a8:	243c 0000 271b 	move.l #10011,d2
     4ae:	7649           	moveq #73,d3
     4b0:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4b4:	4e92           	jsr (a2)
  SetBplPointers();
     4b6:	4e93           	jsr (a3)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = ViewCopper;
     4b8:	2079 0000 4a92 	movea.l 4a92 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4be:	7000           	moveq #0,d0
     4c0:	3028 0072      	move.w 114(a0),d0
     4c4:	4840           	swap d0
     4c6:	4240           	clr.w d0
     4c8:	7200           	moveq #0,d1
     4ca:	3228 0076      	move.w 118(a0),d1
     4ce:	d081           	add.l d1,d0
  if( pointer != Bitplane2) 
     4d0:	b0b9 0000 4a9a 	cmp.l 4a9a <Bitplane2>,d0
     4d6:	671e           	beq.s 4f6 <main+0x4f0>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4d8:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     4de:	4eae ffc4      	jsr -60(a6)
     4e2:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     4e8:	2200           	move.l d0,d1
     4ea:	243c 0000 2765 	move.l #10085,d2
     4f0:	7648           	moveq #72,d3
     4f2:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     4f6:	2f3c 0000 c800 	move.l #51200,-(sp)
     4fc:	4878 0084      	pea 84 <main+0x7e>
     500:	49f9 0000 18da 	lea 18da <FreeDisplay>,a4
     506:	4e94           	jsr (a4)
  return retval;
}

 int PrepareDisplayZoom() {

  Copperlist1 = ClbuildZoom();
     508:	47f9 0000 1480 	lea 1480 <ClbuildZoom>,a3
     50e:	4e93           	jsr (a3)
     510:	23c0 0000 4ab2 	move.l d0,4ab2 <Copperlist1>
  Copperlist2 = ClbuildZoom();
     516:	4e93           	jsr (a3)
     518:	23c0 0000 4aae 	move.l d0,4aae <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
     51e:	2c79 0000 4ab6 	movea.l 4ab6 <SysBase>,a6
     524:	203c 0000 fa00 	move.l #64000,d0
     52a:	7202           	moveq #2,d1
     52c:	4eae ff3a      	jsr -198(a6)
     530:	23c0 0000 4aaa 	move.l d0,4aaa <Bitplane1>
  if(Bitplane1 == 0) {
     536:	508f           	addq.l #8,sp
     538:	6700 0870      	beq.w daa <main+0xda4>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    Exit(1);
  }
  DrawBuffer = Bitplane1;
     53c:	23c0 0000 4aa2 	move.l d0,4aa2 <DrawBuffer>
  DrawCopper = Copperlist1;
     542:	23f9 0000 4ab2 	move.l 4ab2 <Copperlist1>,4a9e <DrawCopper>
     548:	0000 4a9e 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
     54c:	2c79 0000 4ab6 	movea.l 4ab6 <SysBase>,a6
     552:	203c 0000 fa00 	move.l #64000,d0
     558:	7202           	moveq #2,d1
     55a:	4eae ff3a      	jsr -198(a6)
     55e:	2400           	move.l d0,d2
     560:	23c0 0000 4a9a 	move.l d0,4a9a <Bitplane2>
  if(Bitplane2 == 0) {
     566:	6700 077e      	beq.w ce6 <main+0xce0>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    Exit(1);
  }
  ViewBuffer = Bitplane2;
  ViewCopper = Copperlist2;
     56a:	23f9 0000 4aae 	move.l 4aae <Copperlist2>,4a92 <ViewCopper>
     570:	0000 4a92 
  SwapCl();
     574:	4e92           	jsr (a2)
  Zoom_SetBplPointers();
  return 0;
}

void Zoom_SetBplPointers() {
  ULONG ptr = DrawBuffer;
     576:	2039 0000 4aa2 	move.l 4aa2 <DrawBuffer>,d0
  UWORD *copword = DrawCopper;
     57c:	2079 0000 4a9e 	movea.l 4a9e <DrawCopper>,a0
  copword += ZMBPLPTRS+1;
  for(int i=1;i<=2;i++) {
    UWORD highword = ptr >> 16;
     582:	2200           	move.l d0,d1
     584:	4241           	clr.w d1
     586:	4841           	swap d1
     588:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
     58c:	3140 0076      	move.w d0,118(a0)
    *copword = highword;
    copword += 2;
    *copword = lowword;
    copword += 2;
    ptr += 40*256;
     590:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
     596:	2200           	move.l d0,d1
     598:	4241           	clr.w d1
     59a:	4841           	swap d1
     59c:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
     5a0:	3140 007e      	move.w d0,126(a0)
  SwapCl();
     5a4:	4e92           	jsr (a2)
  UWORD *copword = DrawCopper;
     5a6:	2079 0000 4a9e 	movea.l 4a9e <DrawCopper>,a0
    UWORD highword = ptr >> 16;
     5ac:	2002           	move.l d2,d0
     5ae:	4240           	clr.w d0
     5b0:	4840           	swap d0
     5b2:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
     5b6:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
     5ba:	2002           	move.l d2,d0
     5bc:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
     5c2:	2200           	move.l d0,d1
     5c4:	4241           	clr.w d1
     5c6:	4841           	swap d1
     5c8:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
     5cc:	3140 007e      	move.w d0,126(a0)
  }
  ULONG tmp = DrawBuffer;
  DrawBuffer = ViewBuffer;
  ViewBuffer = tmp;
     5d0:	23c2 0000 4a96 	move.l d2,4a96 <ViewBuffer>

void ZoomTest() {

  PrepareDisplayZoom();

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     5d6:	4878 0010      	pea 10 <main+0xa>
     5da:	4879 0000 49f8 	pea 49f8 <ClsSprites>
     5e0:	42a7           	clr.l -(sp)
     5e2:	2f39 0000 4ab2 	move.l 4ab2 <Copperlist1>,-(sp)
     5e8:	45f9 0000 1006 	lea 1006 <TestCopperlistBatch>,a2
     5ee:	4e92           	jsr (a2)
     5f0:	4fef 0010      	lea 16(sp),sp
     5f4:	4a80           	tst.l d0
     5f6:	661e           	bne.s 616 <main+0x610>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     5f8:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     5fe:	4eae ffc4      	jsr -60(a6)
     602:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     608:	2200           	move.l d0,d1
     60a:	243c 0000 27ae 	move.l #10158,d2
     610:	762c           	moveq #44,d3
     612:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
     616:	4878 000c      	pea c <main+0x6>
     61a:	4879 0000 4990 	pea 4990 <ClScreenZoom>
     620:	4878 0010      	pea 10 <main+0xa>
     624:	2f39 0000 4ab2 	move.l 4ab2 <Copperlist1>,-(sp)
     62a:	4e92           	jsr (a2)
     62c:	4fef 0010      	lea 16(sp),sp
     630:	4a80           	tst.l d0
     632:	661e           	bne.s 652 <main+0x64c>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     634:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     63a:	4eae ffc4      	jsr -60(a6)
     63e:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     644:	2200           	move.l d0,d1
     646:	243c 0000 27e4 	move.l #10212,d2
     64c:	7636           	moveq #54,d3
     64e:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  DrawBuffer = 0x40000;
     652:	23fc 0004 0000 	move.l #262144,4aa2 <DrawBuffer>
     658:	0000 4aa2 
  ViewBuffer = 0x50000;
     65c:	23fc 0005 0000 	move.l #327680,4a96 <ViewBuffer>
     662:	0000 4a96 
  Zoom_SetBplPointers();
     666:	4eb9 0000 143a 	jsr 143a <Zoom_SetBplPointers>
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     66c:	0cb9 0005 0000 	cmpi.l #327680,4aa2 <DrawBuffer>
     672:	0000 4aa2 
     676:	6700 0608      	beq.w c80 <main+0xc7a>
    Write( Output(), 
     67a:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     680:	4eae ffc4      	jsr -60(a6)
     684:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     68a:	2200           	move.l d0,d1
     68c:	243c 0000 24db 	move.l #9435,d2
     692:	763b           	moveq #59,d3
     694:	4eae ffd0      	jsr -48(a6)
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
     698:	2f3c 00e0 0004 	move.l #14680068,-(sp)
     69e:	4878 001c      	pea 1c <main+0x16>
     6a2:	2f39 0000 4ab2 	move.l 4ab2 <Copperlist1>,-(sp)
     6a8:	47f9 0000 0fe8 	lea fe8 <TestCopperlistPos>,a3
     6ae:	4e93           	jsr (a3)
     6b0:	4fef 000c      	lea 12(sp),sp
     6b4:	4a80           	tst.l d0
     6b6:	661e           	bne.s 6d6 <main+0x6d0>
    Write(Output(), 
     6b8:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     6be:	4eae ffc4      	jsr -60(a6)
     6c2:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     6c8:	2200           	move.l d0,d1
     6ca:	243c 0000 2517 	move.l #9495,d2
     6d0:	763c           	moveq #60,d3
     6d2:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
     6d6:	2f3c 00e2 0000 	move.l #14811136,-(sp)
     6dc:	4878 001d      	pea 1d <main+0x17>
     6e0:	2f39 0000 4ab2 	move.l 4ab2 <Copperlist1>,-(sp)
     6e6:	4e93           	jsr (a3)
     6e8:	4fef 000c      	lea 12(sp),sp
     6ec:	4a80           	tst.l d0
     6ee:	661e           	bne.s 70e <main+0x708>
    Write(Output(), 
     6f0:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     6f6:	4eae ffc4      	jsr -60(a6)
     6fa:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     700:	2200           	move.l d0,d1
     702:	243c 0000 2554 	move.l #9556,d2
     708:	763c           	moveq #60,d3
     70a:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
     70e:	2f3c 00e4 0004 	move.l #14942212,-(sp)
     714:	4878 001e      	pea 1e <main+0x18>
     718:	2f39 0000 4ab2 	move.l 4ab2 <Copperlist1>,-(sp)
     71e:	4e93           	jsr (a3)
     720:	4fef 000c      	lea 12(sp),sp
     724:	4a80           	tst.l d0
     726:	661e           	bne.s 746 <main+0x740>
    Write(Output(), 
     728:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     72e:	4eae ffc4      	jsr -60(a6)
     732:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     738:	2200           	move.l d0,d1
     73a:	243c 0000 281b 	move.l #10267,d2
     740:	763c           	moveq #60,d3
     742:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
     746:	2f3c 00e6 2800 	move.l #15083520,-(sp)
     74c:	4878 001f      	pea 1f <main+0x19>
     750:	2f39 0000 4ab2 	move.l 4ab2 <Copperlist1>,-(sp)
     756:	4e93           	jsr (a3)
     758:	4fef 000c      	lea 12(sp),sp
     75c:	4a80           	tst.l d0
     75e:	661e           	bne.s 77e <main+0x778>
    Write(Output(), 
     760:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     766:	4eae ffc4      	jsr -60(a6)
     76a:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     770:	2200           	move.l d0,d1
     772:	243c 0000 2858 	move.l #10328,d2
     778:	763c           	moveq #60,d3
     77a:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl2pl should be 2800\n", 60);


   if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
     77e:	4878 0002      	pea 2 <_start+0x2>
     782:	4879 0000 49c0 	pea 49c0 <ClColor>
     788:	4878 0020      	pea 20 <main+0x1a>
     78c:	2f39 0000 4ab2 	move.l 4ab2 <Copperlist1>,-(sp)
     792:	4e92           	jsr (a2)
     794:	4fef 0010      	lea 16(sp),sp
     798:	4a80           	tst.l d0
     79a:	661e           	bne.s 7ba <main+0x7b4>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     79c:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     7a2:	4eae ffc4      	jsr -60(a6)
     7a6:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     7ac:	2200           	move.l d0,d1
     7ae:	243c 0000 2591 	move.l #9617,d2
     7b4:	7621           	moveq #33,d3
     7b6:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     7ba:	7ec0           	moveq #-64,d7
     7bc:	de8d           	add.l a5,d7
     7be:	4878 0040      	pea 40 <main+0x3a>
     7c2:	4879 0000 2950 	pea 2950 <incbin_swfont_end+0x57e>
     7c8:	2f07           	move.l d7,-(sp)
     7ca:	4eb9 0000 1992 	jsr 1992 <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
     7d0:	4878 0010      	pea 10 <main+0xa>
     7d4:	2f07           	move.l d7,-(sp)
     7d6:	4878 0022      	pea 22 <main+0x1c>
     7da:	2f39 0000 4ab2 	move.l 4ab2 <Copperlist1>,-(sp)
     7e0:	4e92           	jsr (a2)
     7e2:	4fef 001c      	lea 28(sp),sp
     7e6:	4a80           	tst.l d0
     7e8:	661e           	bne.s 808 <main+0x802>
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);
     7ea:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     7f0:	4eae ffc4      	jsr -60(a6)
     7f4:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     7fa:	2200           	move.l d0,d1
     7fc:	243c 0000 2895 	move.l #10389,d2
     802:	7621           	moveq #33,d3
     804:	4eae ffd0      	jsr -48(a6)

  ULONG clpart2[] = { 0x2d07fffe, 0x018200f0, 0x01820f00 };
     808:	2b7c 2d07 fffe 	move.l #755499006,-76(a5)
     80e:	ffb4 
     810:	2b7c 0182 00f0 	move.l #25297136,-72(a5)
     816:	ffb8 
     818:	2b7c 0182 0f00 	move.l #25300736,-68(a5)
     81e:	ffbc 

  if( TestCopperlistBatch( Copperlist1, 75, clpart2, 3) == 0)
     820:	4878 0003      	pea 3 <_start+0x3>
     824:	486d ffb4      	pea -76(a5)
     828:	4878 004b      	pea 4b <main+0x45>
     82c:	2f39 0000 4ab2 	move.l 4ab2 <Copperlist1>,-(sp)
     832:	4e92           	jsr (a2)
     834:	4fef 0010      	lea 16(sp),sp
     838:	4a80           	tst.l d0
     83a:	661e           	bne.s 85a <main+0x854>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     83c:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     842:	4eae ffc4      	jsr -60(a6)
     846:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     84c:	2200           	move.l d0,d1
     84e:	243c 0000 28b7 	move.l #10423,d2
     854:	762c           	moveq #44,d3
     856:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
     85a:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdec78>
     85e:	4878 2922      	pea 2922 <incbin_swfont_end+0x550>
     862:	2f39 0000 4ab2 	move.l 4ab2 <Copperlist1>,-(sp)
     868:	4e93           	jsr (a3)
     86a:	4fef 000c      	lea 12(sp),sp
     86e:	4a80           	tst.l d0
     870:	6700 03ec      	beq.w c5e <main+0xc58>
  for( int i =0; i<256; i++) {
    tstcopycolumn[i] = rownr;
    rownr += 2;
  }

  UWORD *destination = DrawBuffer;
     874:	2079 0000 4aa2 	movea.l 4aa2 <DrawBuffer>,a0
  *destination= 0x0000;
     87a:	4250           	clr.w (a0)
  destination += 20;
  *destination= 0x0000;
     87c:	4268 0028      	clr.w 40(a0)
  Zoom_Source = AllocMem(80*512*5, MEMF_CHIP); 
     880:	2c79 0000 4ab6 	movea.l 4ab6 <SysBase>,a6
     886:	203c 0003 2000 	move.l #204800,d0
     88c:	7202           	moveq #2,d1
     88e:	4eae ff3a      	jsr -198(a6)
  UWORD *tstsource = Zoom_Source;
  *tstsource = 0xffff;
     892:	2040           	movea.l d0,a0
     894:	30bc ffff      	move.w #-1,(a0)
  Zoom_CopyColumn( Zoom_Source, DrawBuffer, 0);
     898:	2079 0000 4aa2 	movea.l 4aa2 <DrawBuffer>,a0
  *destpos = (*destpos & bitmaskneg) | fetcheddata;
     89e:	3210           	move.w (a0),d1
     8a0:	3001           	move.w d1,d0
     8a2:	4640           	not.w d0
     8a4:	0240 8000      	andi.w #-32768,d0
     8a8:	b340           	eor.w d1,d0
     8aa:	3080           	move.w d0,(a0)
  destination = DrawBuffer;
  if( *destination != 0x8000)
     8ac:	0c40 8000      	cmpi.w #-32768,d0
     8b0:	671e           	beq.s 8d0 <main+0x8ca>
    Write(  Output(), "Zoomtest: CopyColumn - First row wrong.\n",40);
     8b2:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     8b8:	4eae ffc4      	jsr -60(a6)
     8bc:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     8c2:	2200           	move.l d0,d1
     8c4:	243c 0000 28e4 	move.l #10468,d2
     8ca:	7628           	moveq #40,d3
     8cc:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     8d0:	2f3c 0000 fa00 	move.l #64000,-(sp)
     8d6:	2f3c 0000 a48c 	move.l #42124,-(sp)
     8dc:	4e94           	jsr (a4)
char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
  PrepareDisplaySW();
     8de:	4eb9 0000 179c 	jsr 179c <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     8e4:	4878 0010      	pea 10 <main+0xa>
     8e8:	4879 0000 49f8 	pea 49f8 <ClsSprites>
     8ee:	42a7           	clr.l -(sp)
     8f0:	2f39 0000 4ab2 	move.l 4ab2 <Copperlist1>,-(sp)
     8f6:	4e92           	jsr (a2)
     8f8:	4fef 0018      	lea 24(sp),sp
     8fc:	4a80           	tst.l d0
     8fe:	661e           	bne.s 91e <main+0x918>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     900:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     906:	4eae ffc4      	jsr -60(a6)
     90a:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     910:	2200           	move.l d0,d1
     912:	243c 0000 27ae 	move.l #10158,d2
     918:	762c           	moveq #44,d3
     91a:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     91e:	4878 000c      	pea c <main+0x6>
     922:	4879 0000 49c8 	pea 49c8 <ClScreen>
     928:	4878 0010      	pea 10 <main+0xa>
     92c:	2f39 0000 4ab2 	move.l 4ab2 <Copperlist1>,-(sp)
     932:	4e92           	jsr (a2)
     934:	4fef 0010      	lea 16(sp),sp
     938:	4a80           	tst.l d0
     93a:	661e           	bne.s 95a <main+0x954>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     93c:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     942:	4eae ffc4      	jsr -60(a6)
     946:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     94c:	2200           	move.l d0,d1
     94e:	243c 0000 27e4 	move.l #10212,d2
     954:	7636           	moveq #54,d3
     956:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
     95a:	4878 0002      	pea 2 <_start+0x2>
     95e:	4879 0000 49c0 	pea 49c0 <ClColor>
     964:	4878 001e      	pea 1e <main+0x18>
     968:	2f39 0000 4ab2 	move.l 4ab2 <Copperlist1>,-(sp)
     96e:	4e92           	jsr (a2)
     970:	4fef 0010      	lea 16(sp),sp
     974:	4a80           	tst.l d0
     976:	661e           	bne.s 996 <main+0x990>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     978:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     97e:	4eae ffc4      	jsr -60(a6)
     982:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     988:	2200           	move.l d0,d1
     98a:	243c 0000 2591 	move.l #9617,d2
     990:	7621           	moveq #33,d3
     992:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
     996:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdec78>
     99a:	4878 0020      	pea 20 <main+0x1a>
     99e:	2f39 0000 4ab2 	move.l 4ab2 <Copperlist1>,-(sp)
     9a4:	4e93           	jsr (a3)
     9a6:	4fef 000c      	lea 12(sp),sp
     9aa:	4a80           	tst.l d0
     9ac:	6700 028e      	beq.w c3c <main+0xc36>
    Write( Output(), "Copperlist End not correctly set.\n", 34);

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
     9b0:	2479 0000 4aa2 	movea.l 4aa2 <DrawBuffer>,a2
     9b6:	4879 0000 290d 	pea 290d <incbin_swfont_end+0x53b>
     9bc:	2f0a           	move.l a2,-(sp)
     9be:	4eb9 0000 0e90 	jsr e90 <WriteFont.constprop.1>

  UWORD *tstpointer = DrawBuffer;
  if( *tstpointer != 0xff00)
     9c4:	508f           	addq.l #8,sp
     9c6:	0c52 ff00      	cmpi.w #-256,(a2)
     9ca:	671e           	beq.s 9ea <main+0x9e4>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
     9cc:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     9d2:	4eae ffc4      	jsr -60(a6)
     9d6:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     9dc:	2200           	move.l d0,d1
     9de:	243c 0000 291e 	move.l #10526,d2
     9e4:	7631           	moveq #49,d3
     9e6:	4eae ffd0      	jsr -48(a6)



  FreeDisplay( SWCPSIZE, SWBPLSIZE);
     9ea:	2f3c 0000 c800 	move.l #51200,-(sp)
     9f0:	4878 0084      	pea 84 <main+0x7e>
     9f4:	4e94           	jsr (a4)
  RunTests();
	Delay(50);
     9f6:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     9fc:	7232           	moveq #50,d1
     9fe:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
     a02:	247c 00f0 ff60 	movea.l #15794016,a2
     a08:	508f           	addq.l #8,sp
     a0a:	4a92           	tst.l (a2)
     a0c:	6718           	beq.s a26 <main+0xa20>
     a0e:	4878 0001      	pea 1 <_start+0x1>
     a12:	47f9 0000 0ede 	lea ede <warpmode.part.0>,a3
     a18:	4e93           	jsr (a3)
     a1a:	588f           	addq.l #4,sp
     a1c:	4a92           	tst.l (a2)
     a1e:	6706           	beq.s a26 <main+0xa20>
     a20:	42a7           	clr.l -(sp)
     a22:	4e93           	jsr (a3)
     a24:	588f           	addq.l #4,sp
  ViewCopper = tmp;
  hw->cop1lc = ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
     a26:	2c79 0000 4a8a 	movea.l 4a8a <GfxBase>,a6
     a2c:	23ee 0022 0000 	move.l 34(a6),4a78 <ActiView>
     a32:	4a78 
	OwnBlitter();
     a34:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     a38:	2c79 0000 4a8a 	movea.l 4a8a <GfxBase>,a6
     a3e:	4eae ff1c      	jsr -228(a6)
	Disable();
     a42:	2c79 0000 4ab6 	movea.l 4ab6 <SysBase>,a6
     a48:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
     a4c:	2679 0000 4a8e 	movea.l 4a8e <hw>,a3
     a52:	302b 0010      	move.w 16(a3),d0
     a56:	33c0 0000 4a7c 	move.w d0,4a7c <SystemADKCON>
	SystemInts=hw->intenar;
     a5c:	302b 001c      	move.w 28(a3),d0
     a60:	33c0 0000 4a80 	move.w d0,4a80 <SystemInts>
	SystemDMA=hw->dmaconr;
     a66:	302b 0002      	move.w 2(a3),d0
     a6a:	33c0 0000 4a7e 	move.w d0,4a7e <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
     a70:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     a76:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
     a7c:	45f9 0000 194c 	lea 194c <WaitVbl>,a2
     a82:	4e92           	jsr (a2)
	WaitVbl();
     a84:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
     a86:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
     a8c:	2c79 0000 4a8a 	movea.l 4a8a <GfxBase>,a6
     a92:	93c9           	suba.l a1,a1
     a94:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     a98:	2c79 0000 4a8a 	movea.l 4a8a <GfxBase>,a6
     a9e:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     aa2:	2c79 0000 4a8a 	movea.l 4a8a <GfxBase>,a6
     aa8:	4eae fef2      	jsr -270(a6)

	WaitVbl();
     aac:	4e92           	jsr (a2)
	WaitVbl();
     aae:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     ab0:	3b7c 4e7a ffc0 	move.w #20090,-64(a5)
     ab6:	3b7c 0801 ffc2 	move.w #2049,-62(a5)
     abc:	3b7c 4e73 ffc4 	move.w #20083,-60(a5)
	if (SysBase->AttnFlags & AFF_68010) 
     ac2:	2c79 0000 4ab6 	movea.l 4ab6 <SysBase>,a6
     ac8:	082e 0000 0129 	btst #0,297(a6)
     ace:	6700 0394      	beq.w e64 <main+0xe5e>
		vbr = (APTR)Supervisor((void*)getvbr);
     ad2:	cf8d           	exg d7,a5
     ad4:	4eae ffe2      	jsr -30(a6)
     ad8:	cf8d           	exg d7,a5

	VBR=GetVBR();
     ada:	23c0 0000 4a82 	move.l d0,4a82 <VBR.lto_priv.2>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     ae0:	2079 0000 4a82 	movea.l 4a82 <VBR.lto_priv.2>,a0
     ae6:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
     aea:	23c2 0000 4a86 	move.l d2,4a86 <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
     af0:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
     af2:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     af4:	2079 0000 4a8e 	movea.l 4a8e <hw>,a0
     afa:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     afe:	3028 0002      	move.w 2(a0),d0
     b02:	0800 000e      	btst #14,d0
     b06:	66f6           	bne.s afe <main+0xaf8>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
     b08:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     b0e:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
     b14:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     b1a:	2279 0000 4a82 	movea.l 4a82 <VBR.lto_priv.2>,a1
     b20:	2342 006c      	move.l d2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
     b24:	2c79 0000 4a8a 	movea.l 4a8a <GfxBase>,a6
     b2a:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
     b30:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
     b36:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
     b3c:	3039 0000 4a80 	move.w 4a80 <SystemInts>,d0
     b42:	0040 8000      	ori.w #-32768,d0
     b46:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
     b4a:	3039 0000 4a7e 	move.w 4a7e <SystemDMA>,d0
     b50:	0040 8000      	ori.w #-32768,d0
     b54:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
     b58:	3039 0000 4a7c 	move.w 4a7c <SystemADKCON>,d0
     b5e:	0040 8000      	ori.w #-32768,d0
     b62:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
     b66:	2279 0000 4a78 	movea.l 4a78 <ActiView>,a1
     b6c:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     b70:	2c79 0000 4a8a 	movea.l 4a8a <GfxBase>,a6
     b76:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     b7a:	2c79 0000 4a8a 	movea.l 4a8a <GfxBase>,a6
     b80:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     b84:	2c79 0000 4a8a 	movea.l 4a8a <GfxBase>,a6
     b8a:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     b8e:	2c79 0000 4a8a 	movea.l 4a8a <GfxBase>,a6
     b94:	4eae fe32      	jsr -462(a6)
	Enable();
     b98:	2c79 0000 4ab6 	movea.l 4ab6 <SysBase>,a6
     b9e:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
     ba2:	2c79 0000 4ab6 	movea.l 4ab6 <SysBase>,a6
     ba8:	2279 0000 4aa6 	movea.l 4aa6 <DOSBase>,a1
     bae:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     bb2:	2c79 0000 4ab6 	movea.l 4ab6 <SysBase>,a6
     bb8:	2279 0000 4a8a 	movea.l 4a8a <GfxBase>,a1
     bbe:	4eae fe62      	jsr -414(a6)
}
     bc2:	7000           	moveq #0,d0
     bc4:	4ced 5c8c ff98 	movem.l -104(a5),d2-d3/d7/a2-a4/a6
     bca:	4e5d           	unlk a5
     bcc:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     bce:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     bd4:	4eae ffc4      	jsr -60(a6)
     bd8:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     bde:	2200           	move.l d0,d1
     be0:	243c 0000 27ae 	move.l #10158,d2
     be6:	762c           	moveq #44,d3
     be8:	4eae ffd0      	jsr -48(a6)
     bec:	6000 f5ba      	bra.w 1a8 <main+0x1a2>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
     bf0:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     bf6:	4eae ffc4      	jsr -60(a6)
     bfa:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     c00:	2200           	move.l d0,d1
     c02:	243c 0000 27e4 	move.l #10212,d2
     c08:	7636           	moveq #54,d3
     c0a:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = 0x40000;
     c0e:	23fc 0004 0000 	move.l #262144,4aa2 <DrawBuffer>
     c14:	0000 4aa2 
  ViewBuffer = 0x50000;
     c18:	23fc 0005 0000 	move.l #327680,4a96 <ViewBuffer>
     c1e:	0000 4a96 
  SetBplPointers();
     c22:	47f9 0000 1770 	lea 1770 <SetBplPointers>,a3
     c28:	4e93           	jsr (a3)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     c2a:	0cb9 0005 0000 	cmpi.l #327680,4aa2 <DrawBuffer>
     c30:	0000 4aa2 
     c34:	6600 f64a      	bne.w 280 <main+0x27a>
     c38:	6000 01d2      	bra.w e0c <main+0xe06>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     c3c:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     c42:	4eae ffc4      	jsr -60(a6)
     c46:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     c4c:	2200           	move.l d0,d1
     c4e:	243c 0000 25b3 	move.l #9651,d2
     c54:	7622           	moveq #34,d3
     c56:	4eae ffd0      	jsr -48(a6)
     c5a:	6000 fd54      	bra.w 9b0 <main+0x9aa>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     c5e:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     c64:	4eae ffc4      	jsr -60(a6)
     c68:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     c6e:	2200           	move.l d0,d1
     c70:	243c 0000 25b3 	move.l #9651,d2
     c76:	7622           	moveq #34,d3
     c78:	4eae ffd0      	jsr -48(a6)
     c7c:	6000 fbf6      	bra.w 874 <main+0x86e>
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     c80:	0cb9 0004 0000 	cmpi.l #262144,4a96 <ViewBuffer>
     c86:	0000 4a96 
     c8a:	6700 fa0c      	beq.w 698 <main+0x692>
    Write( Output(), 
     c8e:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     c94:	4eae ffc4      	jsr -60(a6)
     c98:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     c9e:	2200           	move.l d0,d1
     ca0:	243c 0000 24db 	move.l #9435,d2
     ca6:	763b           	moveq #59,d3
     ca8:	4eae ffd0      	jsr -48(a6)
     cac:	6000 f9ea      	bra.w 698 <main+0x692>
		Exit(0);
     cb0:	9dce           	suba.l a6,a6
     cb2:	7200           	moveq #0,d1
     cb4:	4eae ff70      	jsr -144(a6)
     cb8:	6000 f39a      	bra.w 54 <main+0x4e>
		Exit(0);
     cbc:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     cc2:	7200           	moveq #0,d1
     cc4:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     cc8:	2c79 0000 4ab6 	movea.l 4ab6 <SysBase>,a6
     cce:	43f9 0000 24a0 	lea 24a0 <incbin_swfont_end+0xce>,a1
     cd4:	7000           	moveq #0,d0
     cd6:	4eae fdd8      	jsr -552(a6)
     cda:	23c0 0000 4aa6 	move.l d0,4aa6 <DOSBase>
	if (!DOSBase)
     ce0:	6600 f372      	bne.w 54 <main+0x4e>
     ce4:	60ca           	bra.s cb0 <main+0xcaa>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     ce6:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     cec:	4eae ffc4      	jsr -60(a6)
     cf0:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     cf6:	2200           	move.l d0,d1
     cf8:	243c 0000 2468 	move.l #9320,d2
     cfe:	7626           	moveq #38,d3
     d00:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     d04:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     d0a:	7201           	moveq #1,d1
     d0c:	4eae ff70      	jsr -144(a6)
     d10:	2439 0000 4a9a 	move.l 4a9a <Bitplane2>,d2
  ViewCopper = Copperlist2;
     d16:	23f9 0000 4aae 	move.l 4aae <Copperlist2>,4a92 <ViewCopper>
     d1c:	0000 4a92 
  SwapCl();
     d20:	4e92           	jsr (a2)
  ULONG ptr = DrawBuffer;
     d22:	2039 0000 4aa2 	move.l 4aa2 <DrawBuffer>,d0
  UWORD *copword = DrawCopper;
     d28:	2079 0000 4a9e 	movea.l 4a9e <DrawCopper>,a0
    UWORD highword = ptr >> 16;
     d2e:	2200           	move.l d0,d1
     d30:	4241           	clr.w d1
     d32:	4841           	swap d1
     d34:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
     d38:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
     d3c:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
     d42:	2200           	move.l d0,d1
     d44:	4241           	clr.w d1
     d46:	4841           	swap d1
     d48:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
     d4c:	3140 007e      	move.w d0,126(a0)
  SwapCl();
     d50:	4e92           	jsr (a2)
  UWORD *copword = DrawCopper;
     d52:	2079 0000 4a9e 	movea.l 4a9e <DrawCopper>,a0
    UWORD highword = ptr >> 16;
     d58:	2002           	move.l d2,d0
     d5a:	4240           	clr.w d0
     d5c:	4840           	swap d0
     d5e:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
     d62:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
     d66:	2002           	move.l d2,d0
     d68:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
     d6e:	2200           	move.l d0,d1
     d70:	4241           	clr.w d1
     d72:	4841           	swap d1
     d74:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
     d78:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = tmp;
     d7c:	23c2 0000 4a96 	move.l d2,4a96 <ViewBuffer>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     d82:	4878 0010      	pea 10 <main+0xa>
     d86:	4879 0000 49f8 	pea 49f8 <ClsSprites>
     d8c:	42a7           	clr.l -(sp)
     d8e:	2f39 0000 4ab2 	move.l 4ab2 <Copperlist1>,-(sp)
     d94:	45f9 0000 1006 	lea 1006 <TestCopperlistBatch>,a2
     d9a:	4e92           	jsr (a2)
     d9c:	4fef 0010      	lea 16(sp),sp
     da0:	4a80           	tst.l d0
     da2:	6600 f872      	bne.w 616 <main+0x610>
     da6:	6000 f850      	bra.w 5f8 <main+0x5f2>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     daa:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     db0:	4eae ffc4      	jsr -60(a6)
     db4:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     dba:	2200           	move.l d0,d1
     dbc:	243c 0000 2441 	move.l #9281,d2
     dc2:	7626           	moveq #38,d3
     dc4:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     dc8:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     dce:	7201           	moveq #1,d1
     dd0:	4eae ff70      	jsr -144(a6)
     dd4:	2039 0000 4aaa 	move.l 4aaa <Bitplane1>,d0
  DrawBuffer = Bitplane1;
     dda:	23c0 0000 4aa2 	move.l d0,4aa2 <DrawBuffer>
  DrawCopper = Copperlist1;
     de0:	23f9 0000 4ab2 	move.l 4ab2 <Copperlist1>,4a9e <DrawCopper>
     de6:	0000 4a9e 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
     dea:	2c79 0000 4ab6 	movea.l 4ab6 <SysBase>,a6
     df0:	203c 0000 fa00 	move.l #64000,d0
     df6:	7202           	moveq #2,d1
     df8:	4eae ff3a      	jsr -198(a6)
     dfc:	2400           	move.l d0,d2
     dfe:	23c0 0000 4a9a 	move.l d0,4a9a <Bitplane2>
  if(Bitplane2 == 0) {
     e04:	6600 f764      	bne.w 56a <main+0x564>
     e08:	6000 fedc      	bra.w ce6 <main+0xce0>
     e0c:	0cb9 0004 0000 	cmpi.l #262144,4a96 <ViewBuffer>
     e12:	0000 4a96 
     e16:	6700 f486      	beq.w 29e <main+0x298>
    Write( Output(), 
     e1a:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     e20:	4eae ffc4      	jsr -60(a6)
     e24:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     e2a:	2200           	move.l d0,d1
     e2c:	243c 0000 24db 	move.l #9435,d2
     e32:	763b           	moveq #59,d3
     e34:	4eae ffd0      	jsr -48(a6)
     e38:	6000 f464      	bra.w 29e <main+0x298>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     e3c:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     e42:	4eae ffc4      	jsr -60(a6)
     e46:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
     e4c:	2200           	move.l d0,d1
     e4e:	243c 0000 2591 	move.l #9617,d2
     e54:	7621           	moveq #33,d3
     e56:	4eae ffd0      	jsr -48(a6)
     e5a:	2079 0000 4ab2 	movea.l 4ab2 <Copperlist1>,a0
     e60:	6000 f4ba      	bra.w 31c <main+0x316>
	APTR vbr = 0;
     e64:	7000           	moveq #0,d0
	VBR=GetVBR();
     e66:	23c0 0000 4a82 	move.l d0,4a82 <VBR.lto_priv.2>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     e6c:	2079 0000 4a82 	movea.l 4a82 <VBR.lto_priv.2>,a0
     e72:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
     e76:	23c2 0000 4a86 	move.l d2,4a86 <SystemIrq>
	WaitVbl();
     e7c:	4e92           	jsr (a2)
	WaitVbl();
     e7e:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     e80:	2079 0000 4a8e 	movea.l 4a8e <hw>,a0
     e86:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     e8a:	6000 fc72      	bra.w afe <main+0xaf8>
     e8e:	4e71           	nop

00000e90 <WriteFont.constprop.1>:
  *cl = 0xfffffffe;

  return retval;
}

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
     e90:	226f 0004      	movea.l 4(sp),a1
  UWORD *bmpptr = Destination;
  UWORD *fntptr = font;

  char charpos = *text;
  charpos -= 0x20;
     e94:	206f 0008      	movea.l 8(sp),a0
     e98:	1010           	move.b (a0),d0
     e9a:	0600 ffe0      	addi.b #-32,d0
  charpos = charpos<<3;
     e9e:	4880           	ext.w d0
     ea0:	48c0           	ext.l d0
     ea2:	e788           	lsl.l #3,d0
  fntptr += charpos;
     ea4:	4880           	ext.w d0
     ea6:	3040           	movea.w d0,a0
     ea8:	d1c8           	adda.l a0,a0
     eaa:	d1fc 0000 4a38 	adda.l #19000,a0
  for(int i=1;i<=8;i++) {
    *bmpptr = *fntptr++;
     eb0:	3290           	move.w (a0),(a1)
     eb2:	3368 0002 0050 	move.w 2(a0),80(a1)
     eb8:	3368 0004 00a0 	move.w 4(a0),160(a1)
     ebe:	3368 0006 00f0 	move.w 6(a0),240(a1)
     ec4:	3368 0008 0140 	move.w 8(a0),320(a1)
     eca:	3368 000a 0190 	move.w 10(a0),400(a1)
     ed0:	3368 000c 01e0 	move.w 12(a0),480(a1)
     ed6:	3368 000e 0230 	move.w 14(a0),560(a1)
    bmpptr += 40;
  }

}
     edc:	4e75           	rts

00000ede <warpmode.part.0>:
void warpmode(int on) 
     ede:	598f           	subq.l #4,sp
     ee0:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     ee2:	4aaf 000c      	tst.l 12(sp)
     ee6:	674c           	beq.s f34 <warpmode.part.0+0x56>
     ee8:	4878 0001      	pea 1 <_start+0x1>
     eec:	740b           	moveq #11,d2
     eee:	d48f           	add.l sp,d2
     ef0:	2f02           	move.l d2,-(sp)
     ef2:	42a7           	clr.l -(sp)
     ef4:	4879 0000 2406 	pea 2406 <incbin_swfont_end+0x34>
     efa:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdec79>
     efe:	4878 0052      	pea 52 <main+0x4c>
     f02:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeeebda>
     f08:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     f0c:	203c 0000 23ec 	move.l #9196,d0
     f12:	4878 0001      	pea 1 <_start+0x1>
     f16:	2f02           	move.l d2,-(sp)
     f18:	42a7           	clr.l -(sp)
     f1a:	2f00           	move.l d0,-(sp)
     f1c:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdec79>
     f20:	4878 0052      	pea 52 <main+0x4c>
     f24:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeeebda>
	}
}
     f2a:	4fef 0018      	lea 24(sp),sp
     f2e:	241f           	move.l (sp)+,d2
     f30:	588f           	addq.l #4,sp
     f32:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     f34:	4878 0001      	pea 1 <_start+0x1>
     f38:	740b           	moveq #11,d2
     f3a:	d48f           	add.l sp,d2
     f3c:	2f02           	move.l d2,-(sp)
     f3e:	42a7           	clr.l -(sp)
     f40:	4879 0000 2410 	pea 2410 <incbin_swfont_end+0x3e>
     f46:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdec79>
     f4a:	4878 0052      	pea 52 <main+0x4c>
     f4e:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeeebda>
     f54:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     f58:	203c 0000 23d3 	move.l #9171,d0
     f5e:	4878 0001      	pea 1 <_start+0x1>
     f62:	2f02           	move.l d2,-(sp)
     f64:	42a7           	clr.l -(sp)
     f66:	2f00           	move.l d0,-(sp)
     f68:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdec79>
     f6c:	4878 0052      	pea 52 <main+0x4c>
     f70:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeeebda>
}
     f76:	4fef 0018      	lea 24(sp),sp
     f7a:	241f           	move.l (sp)+,d2
     f7c:	588f           	addq.l #4,sp
     f7e:	4e75           	rts

00000f80 <KPrintF>:
{
     f80:	4fef ff80      	lea -128(sp),sp
     f84:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
     f88:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeeebda>
     f8e:	6734           	beq.s fc4 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
     f90:	2c79 0000 4ab6 	movea.l 4ab6 <SysBase>,a6
     f96:	206f 0090      	movea.l 144(sp),a0
     f9a:	43ef 0094      	lea 148(sp),a1
     f9e:	45f9 0000 1c10 	lea 1c10 <PutChar>,a2
     fa4:	47ef 000c      	lea 12(sp),a3
     fa8:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
     fac:	2f0b           	move.l a3,-(sp)
     fae:	4878 0056      	pea 56 <main+0x50>
     fb2:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeeebda>
     fb8:	508f           	addq.l #8,sp
}
     fba:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     fbe:	4fef 0080      	lea 128(sp),sp
     fc2:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
     fc4:	2c79 0000 4ab6 	movea.l 4ab6 <SysBase>,a6
     fca:	206f 0090      	movea.l 144(sp),a0
     fce:	43ef 0094      	lea 148(sp),a1
     fd2:	45f9 0000 1c02 	lea 1c02 <KPutCharX>,a2
     fd8:	97cb           	suba.l a3,a3
     fda:	4eae fdf6      	jsr -522(a6)
}
     fde:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     fe2:	4fef 0080      	lea 128(sp),sp
     fe6:	4e75           	rts

00000fe8 <TestCopperlistPos>:
  int test1 = instructions[pos];
     fe8:	202f 0008      	move.l 8(sp),d0
     fec:	d080           	add.l d0,d0
     fee:	d080           	add.l d0,d0
  if( instructions[pos] == value ) 
     ff0:	206f 0004      	movea.l 4(sp),a0
     ff4:	2030 0800      	move.l (0,a0,d0.l),d0
     ff8:	b0af 000c      	cmp.l 12(sp),d0
     ffc:	57c0           	seq d0
     ffe:	4880           	ext.w d0
    1000:	48c0           	ext.l d0
}
    1002:	4480           	neg.l d0
    1004:	4e75           	rts

00001006 <TestCopperlistBatch>:
                                                                  long length) {
    1006:	48e7 2030      	movem.l d2/a2-a3,-(sp)
    100a:	246f 0010      	movea.l 16(sp),a2
    100e:	206f 0014      	movea.l 20(sp),a0
    1012:	226f 0018      	movea.l 24(sp),a1
    1016:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
    101a:	2008           	move.l a0,d0
    101c:	d088           	add.l a0,d0
    101e:	d080           	add.l d0,d0
    1020:	2411           	move.l (a1),d2
    1022:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
    1026:	6600 01ac      	bne.w 11d4 <TestCopperlistBatch+0x1ce>
    102a:	2008           	move.l a0,d0
    102c:	5280           	addq.l #1,d0
    102e:	d080           	add.l d0,d0
    1030:	d080           	add.l d0,d0
    1032:	2032 0800      	move.l (0,a2,d0.l),d0
    1036:	b0a9 0004      	cmp.l 4(a1),d0
    103a:	6600 0198      	bne.w 11d4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    103e:	7002           	moveq #2,d0
    1040:	b081           	cmp.l d1,d0
    1042:	6700 0188      	beq.w 11cc <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1046:	2008           	move.l a0,d0
    1048:	5480           	addq.l #2,d0
    104a:	d080           	add.l d0,d0
    104c:	d080           	add.l d0,d0
    104e:	2032 0800      	move.l (0,a2,d0.l),d0
    1052:	b0a9 0008      	cmp.l 8(a1),d0
    1056:	6600 017c      	bne.w 11d4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    105a:	7403           	moveq #3,d2
    105c:	b481           	cmp.l d1,d2
    105e:	6700 016c      	beq.w 11cc <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1062:	2008           	move.l a0,d0
    1064:	5680           	addq.l #3,d0
    1066:	d080           	add.l d0,d0
    1068:	d080           	add.l d0,d0
    106a:	2032 0800      	move.l (0,a2,d0.l),d0
    106e:	b0a9 000c      	cmp.l 12(a1),d0
    1072:	6600 0160      	bne.w 11d4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1076:	7004           	moveq #4,d0
    1078:	b081           	cmp.l d1,d0
    107a:	6700 0150      	beq.w 11cc <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    107e:	2008           	move.l a0,d0
    1080:	5880           	addq.l #4,d0
    1082:	d080           	add.l d0,d0
    1084:	d080           	add.l d0,d0
    1086:	2032 0800      	move.l (0,a2,d0.l),d0
    108a:	b0a9 0010      	cmp.l 16(a1),d0
    108e:	6600 0144      	bne.w 11d4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1092:	7405           	moveq #5,d2
    1094:	b481           	cmp.l d1,d2
    1096:	6700 0134      	beq.w 11cc <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    109a:	2008           	move.l a0,d0
    109c:	5a80           	addq.l #5,d0
    109e:	d080           	add.l d0,d0
    10a0:	d080           	add.l d0,d0
    10a2:	2032 0800      	move.l (0,a2,d0.l),d0
    10a6:	b0a9 0014      	cmp.l 20(a1),d0
    10aa:	6600 0128      	bne.w 11d4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    10ae:	7006           	moveq #6,d0
    10b0:	b081           	cmp.l d1,d0
    10b2:	6700 0118      	beq.w 11cc <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    10b6:	2008           	move.l a0,d0
    10b8:	5c80           	addq.l #6,d0
    10ba:	d080           	add.l d0,d0
    10bc:	d080           	add.l d0,d0
    10be:	2032 0800      	move.l (0,a2,d0.l),d0
    10c2:	b0a9 0018      	cmp.l 24(a1),d0
    10c6:	6600 010c      	bne.w 11d4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    10ca:	7407           	moveq #7,d2
    10cc:	b481           	cmp.l d1,d2
    10ce:	6700 00fc      	beq.w 11cc <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    10d2:	2008           	move.l a0,d0
    10d4:	5e80           	addq.l #7,d0
    10d6:	d080           	add.l d0,d0
    10d8:	d080           	add.l d0,d0
    10da:	2032 0800      	move.l (0,a2,d0.l),d0
    10de:	b0a9 001c      	cmp.l 28(a1),d0
    10e2:	6600 00f0      	bne.w 11d4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    10e6:	7008           	moveq #8,d0
    10e8:	b081           	cmp.l d1,d0
    10ea:	6700 00e0      	beq.w 11cc <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    10ee:	2008           	move.l a0,d0
    10f0:	5080           	addq.l #8,d0
    10f2:	d080           	add.l d0,d0
    10f4:	d080           	add.l d0,d0
    10f6:	2032 0800      	move.l (0,a2,d0.l),d0
    10fa:	b0a9 0020      	cmp.l 32(a1),d0
    10fe:	6600 00d4      	bne.w 11d4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1102:	7409           	moveq #9,d2
    1104:	b481           	cmp.l d1,d2
    1106:	6700 00c4      	beq.w 11cc <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    110a:	47e8 0009      	lea 9(a0),a3
    110e:	200b           	move.l a3,d0
    1110:	d08b           	add.l a3,d0
    1112:	d080           	add.l d0,d0
    1114:	2032 0800      	move.l (0,a2,d0.l),d0
    1118:	b0a9 0024      	cmp.l 36(a1),d0
    111c:	6600 00b6      	bne.w 11d4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1120:	700a           	moveq #10,d0
    1122:	b081           	cmp.l d1,d0
    1124:	6700 00a6      	beq.w 11cc <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1128:	47e8 000a      	lea 10(a0),a3
    112c:	200b           	move.l a3,d0
    112e:	d08b           	add.l a3,d0
    1130:	d080           	add.l d0,d0
    1132:	2032 0800      	move.l (0,a2,d0.l),d0
    1136:	b0a9 0028      	cmp.l 40(a1),d0
    113a:	6600 0098      	bne.w 11d4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    113e:	740b           	moveq #11,d2
    1140:	b481           	cmp.l d1,d2
    1142:	6700 0088      	beq.w 11cc <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1146:	47e8 000b      	lea 11(a0),a3
    114a:	200b           	move.l a3,d0
    114c:	d08b           	add.l a3,d0
    114e:	d080           	add.l d0,d0
    1150:	2032 0800      	move.l (0,a2,d0.l),d0
    1154:	b0a9 002c      	cmp.l 44(a1),d0
    1158:	667a           	bne.s 11d4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    115a:	700c           	moveq #12,d0
    115c:	b081           	cmp.l d1,d0
    115e:	676c           	beq.s 11cc <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1160:	47e8 000c      	lea 12(a0),a3
    1164:	200b           	move.l a3,d0
    1166:	d08b           	add.l a3,d0
    1168:	d080           	add.l d0,d0
    116a:	2032 0800      	move.l (0,a2,d0.l),d0
    116e:	b0a9 0030      	cmp.l 48(a1),d0
    1172:	6660           	bne.s 11d4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1174:	740d           	moveq #13,d2
    1176:	b481           	cmp.l d1,d2
    1178:	6752           	beq.s 11cc <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    117a:	47e8 000d      	lea 13(a0),a3
    117e:	200b           	move.l a3,d0
    1180:	d08b           	add.l a3,d0
    1182:	d080           	add.l d0,d0
    1184:	2032 0800      	move.l (0,a2,d0.l),d0
    1188:	b0a9 0034      	cmp.l 52(a1),d0
    118c:	6646           	bne.s 11d4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    118e:	700e           	moveq #14,d0
    1190:	b081           	cmp.l d1,d0
    1192:	6738           	beq.s 11cc <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1194:	47e8 000e      	lea 14(a0),a3
    1198:	200b           	move.l a3,d0
    119a:	d08b           	add.l a3,d0
    119c:	d080           	add.l d0,d0
    119e:	2032 0800      	move.l (0,a2,d0.l),d0
    11a2:	b0a9 0038      	cmp.l 56(a1),d0
    11a6:	662c           	bne.s 11d4 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    11a8:	7410           	moveq #16,d2
    11aa:	b481           	cmp.l d1,d2
    11ac:	661e           	bne.s 11cc <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    11ae:	41e8 000f      	lea 15(a0),a0
    11b2:	d1c8           	adda.l a0,a0
    11b4:	d1c8           	adda.l a0,a0
    11b6:	2070 a800      	movea.l (0,a0,a2.l),a0
    11ba:	b1e9 003c      	cmpa.l 60(a1),a0
    11be:	57c0           	seq d0
    11c0:	4880           	ext.w d0
    11c2:	48c0           	ext.l d0
    11c4:	4480           	neg.l d0
}
    11c6:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    11ca:	4e75           	rts
  return 1;
    11cc:	7001           	moveq #1,d0
}
    11ce:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    11d2:	4e75           	rts
      return 0;
    11d4:	7000           	moveq #0,d0
}
    11d6:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    11da:	4e75           	rts

000011dc <ClBuild>:
ULONG * ClbuildSW() {
    11dc:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
    11e0:	2c79 0000 4ab6 	movea.l 4ab6 <SysBase>,a6
    11e6:	707b           	moveq #123,d0
    11e8:	4600           	not.b d0
    11ea:	7202           	moveq #2,d1
    11ec:	4eae ff3a      	jsr -198(a6)
    11f0:	2440           	movea.l d0,a2
  if( retval == 0) {
    11f2:	4a80           	tst.l d0
    11f4:	6700 010e      	beq.w 1304 <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
    11f8:	24b9 0000 49f8 	move.l 49f8 <ClsSprites>,(a2)
    11fe:	2579 0000 49fc 	move.l 49fc <ClsSprites+0x4>,4(a2)
    1204:	0004 
    1206:	2579 0000 4a00 	move.l 4a00 <ClsSprites+0x8>,8(a2)
    120c:	0008 
    120e:	2579 0000 4a04 	move.l 4a04 <ClsSprites+0xc>,12(a2)
    1214:	000c 
    1216:	2579 0000 4a08 	move.l 4a08 <ClsSprites+0x10>,16(a2)
    121c:	0010 
    121e:	2579 0000 4a0c 	move.l 4a0c <ClsSprites+0x14>,20(a2)
    1224:	0014 
    1226:	2579 0000 4a10 	move.l 4a10 <ClsSprites+0x18>,24(a2)
    122c:	0018 
    122e:	2579 0000 4a14 	move.l 4a14 <ClsSprites+0x1c>,28(a2)
    1234:	001c 
    1236:	2579 0000 4a18 	move.l 4a18 <ClsSprites+0x20>,32(a2)
    123c:	0020 
    123e:	2579 0000 4a1c 	move.l 4a1c <ClsSprites+0x24>,36(a2)
    1244:	0024 
    1246:	2579 0000 4a20 	move.l 4a20 <ClsSprites+0x28>,40(a2)
    124c:	0028 
    124e:	2579 0000 4a24 	move.l 4a24 <ClsSprites+0x2c>,44(a2)
    1254:	002c 
    1256:	2579 0000 4a28 	move.l 4a28 <ClsSprites+0x30>,48(a2)
    125c:	0030 
    125e:	2579 0000 4a2c 	move.l 4a2c <ClsSprites+0x34>,52(a2)
    1264:	0034 
    1266:	2579 0000 4a30 	move.l 4a30 <ClsSprites+0x38>,56(a2)
    126c:	0038 
    126e:	2579 0000 4a34 	move.l 4a34 <ClsSprites+0x3c>,60(a2)
    1274:	003c 
    *cl++ = *clpartinstruction++;
    1276:	2579 0000 49c8 	move.l 49c8 <ClScreen>,64(a2)
    127c:	0040 
    127e:	2579 0000 49cc 	move.l 49cc <ClScreen+0x4>,68(a2)
    1284:	0044 
    1286:	2579 0000 49d0 	move.l 49d0 <ClScreen+0x8>,72(a2)
    128c:	0048 
    128e:	2579 0000 49d4 	move.l 49d4 <ClScreen+0xc>,76(a2)
    1294:	004c 
    1296:	2579 0000 49d8 	move.l 49d8 <ClScreen+0x10>,80(a2)
    129c:	0050 
    129e:	2579 0000 49dc 	move.l 49dc <ClScreen+0x14>,84(a2)
    12a4:	0054 
    12a6:	2579 0000 49e0 	move.l 49e0 <ClScreen+0x18>,88(a2)
    12ac:	0058 
    12ae:	2579 0000 49e4 	move.l 49e4 <ClScreen+0x1c>,92(a2)
    12b4:	005c 
    12b6:	2579 0000 49e8 	move.l 49e8 <ClScreen+0x20>,96(a2)
    12bc:	0060 
    12be:	2579 0000 49ec 	move.l 49ec <ClScreen+0x24>,100(a2)
    12c4:	0064 
    12c6:	2579 0000 49f0 	move.l 49f0 <ClScreen+0x28>,104(a2)
    12cc:	0068 
    12ce:	2579 0000 49f4 	move.l 49f4 <ClScreen+0x2c>,108(a2)
    12d4:	006c 
  *cl++ = 0x00e00000;
    12d6:	257c 00e0 0000 	move.l #14680064,112(a2)
    12dc:	0070 
  *cl++ = 0x00e20000;
    12de:	257c 00e2 0000 	move.l #14811136,116(a2)
    12e4:	0074 
    *cl++ = *clpartinstruction++;
    12e6:	2579 0000 49c0 	move.l 49c0 <ClColor>,120(a2)
    12ec:	0078 
    12ee:	2579 0000 49c4 	move.l 49c4 <ClColor+0x4>,124(a2)
    12f4:	007c 
  *cl = 0xfffffffe;
    12f6:	70fe           	moveq #-2,d0
    12f8:	2540 0080      	move.l d0,128(a2)
}
    12fc:	200a           	move.l a2,d0
    12fe:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1302:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1304:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
    130a:	4eae ffc4      	jsr -60(a6)
    130e:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
    1314:	2200           	move.l d0,d1
    1316:	243c 0000 241b 	move.l #9243,d2
    131c:	7628           	moveq #40,d3
    131e:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1322:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
    1328:	7201           	moveq #1,d1
    132a:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    132e:	24b9 0000 49f8 	move.l 49f8 <ClsSprites>,(a2)
    1334:	2579 0000 49fc 	move.l 49fc <ClsSprites+0x4>,4(a2)
    133a:	0004 
    133c:	2579 0000 4a00 	move.l 4a00 <ClsSprites+0x8>,8(a2)
    1342:	0008 
    1344:	2579 0000 4a04 	move.l 4a04 <ClsSprites+0xc>,12(a2)
    134a:	000c 
    134c:	2579 0000 4a08 	move.l 4a08 <ClsSprites+0x10>,16(a2)
    1352:	0010 
    1354:	2579 0000 4a0c 	move.l 4a0c <ClsSprites+0x14>,20(a2)
    135a:	0014 
    135c:	2579 0000 4a10 	move.l 4a10 <ClsSprites+0x18>,24(a2)
    1362:	0018 
    1364:	2579 0000 4a14 	move.l 4a14 <ClsSprites+0x1c>,28(a2)
    136a:	001c 
    136c:	2579 0000 4a18 	move.l 4a18 <ClsSprites+0x20>,32(a2)
    1372:	0020 
    1374:	2579 0000 4a1c 	move.l 4a1c <ClsSprites+0x24>,36(a2)
    137a:	0024 
    137c:	2579 0000 4a20 	move.l 4a20 <ClsSprites+0x28>,40(a2)
    1382:	0028 
    1384:	2579 0000 4a24 	move.l 4a24 <ClsSprites+0x2c>,44(a2)
    138a:	002c 
    138c:	2579 0000 4a28 	move.l 4a28 <ClsSprites+0x30>,48(a2)
    1392:	0030 
    1394:	2579 0000 4a2c 	move.l 4a2c <ClsSprites+0x34>,52(a2)
    139a:	0034 
    139c:	2579 0000 4a30 	move.l 4a30 <ClsSprites+0x38>,56(a2)
    13a2:	0038 
    13a4:	2579 0000 4a34 	move.l 4a34 <ClsSprites+0x3c>,60(a2)
    13aa:	003c 
    *cl++ = *clpartinstruction++;
    13ac:	2579 0000 49c8 	move.l 49c8 <ClScreen>,64(a2)
    13b2:	0040 
    13b4:	2579 0000 49cc 	move.l 49cc <ClScreen+0x4>,68(a2)
    13ba:	0044 
    13bc:	2579 0000 49d0 	move.l 49d0 <ClScreen+0x8>,72(a2)
    13c2:	0048 
    13c4:	2579 0000 49d4 	move.l 49d4 <ClScreen+0xc>,76(a2)
    13ca:	004c 
    13cc:	2579 0000 49d8 	move.l 49d8 <ClScreen+0x10>,80(a2)
    13d2:	0050 
    13d4:	2579 0000 49dc 	move.l 49dc <ClScreen+0x14>,84(a2)
    13da:	0054 
    13dc:	2579 0000 49e0 	move.l 49e0 <ClScreen+0x18>,88(a2)
    13e2:	0058 
    13e4:	2579 0000 49e4 	move.l 49e4 <ClScreen+0x1c>,92(a2)
    13ea:	005c 
    13ec:	2579 0000 49e8 	move.l 49e8 <ClScreen+0x20>,96(a2)
    13f2:	0060 
    13f4:	2579 0000 49ec 	move.l 49ec <ClScreen+0x24>,100(a2)
    13fa:	0064 
    13fc:	2579 0000 49f0 	move.l 49f0 <ClScreen+0x28>,104(a2)
    1402:	0068 
    1404:	2579 0000 49f4 	move.l 49f4 <ClScreen+0x2c>,108(a2)
    140a:	006c 
  *cl++ = 0x00e00000;
    140c:	257c 00e0 0000 	move.l #14680064,112(a2)
    1412:	0070 
  *cl++ = 0x00e20000;
    1414:	257c 00e2 0000 	move.l #14811136,116(a2)
    141a:	0074 
    *cl++ = *clpartinstruction++;
    141c:	2579 0000 49c0 	move.l 49c0 <ClColor>,120(a2)
    1422:	0078 
    1424:	2579 0000 49c4 	move.l 49c4 <ClColor+0x4>,124(a2)
    142a:	007c 
  *cl = 0xfffffffe;
    142c:	70fe           	moveq #-2,d0
    142e:	2540 0080      	move.l d0,128(a2)
}
    1432:	200a           	move.l a2,d0
    1434:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1438:	4e75           	rts

0000143a <Zoom_SetBplPointers>:
void Zoom_SetBplPointers() {
    143a:	2f02           	move.l d2,-(sp)
  ULONG ptr = DrawBuffer;
    143c:	2039 0000 4aa2 	move.l 4aa2 <DrawBuffer>,d0
  UWORD *copword = DrawCopper;
    1442:	2079 0000 4a9e 	movea.l 4a9e <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    1448:	2200           	move.l d0,d1
    144a:	4241           	clr.w d1
    144c:	4841           	swap d1
    144e:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    1452:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    1456:	2200           	move.l d0,d1
    1458:	0681 0000 2800 	addi.l #10240,d1
    UWORD highword = ptr >> 16;
    145e:	2401           	move.l d1,d2
    1460:	4242           	clr.w d2
    1462:	4842           	swap d2
    1464:	3142 007a      	move.w d2,122(a0)
    UWORD lowword = ptr & 0xffff;
    1468:	3141 007e      	move.w d1,126(a0)
  DrawBuffer = ViewBuffer;
    146c:	23f9 0000 4a96 	move.l 4a96 <ViewBuffer>,4aa2 <DrawBuffer>
    1472:	0000 4aa2 
  ViewBuffer = tmp;
    1476:	23c0 0000 4a96 	move.l d0,4a96 <ViewBuffer>
}
    147c:	241f           	move.l (sp)+,d2
    147e:	4e75           	rts

00001480 <ClbuildZoom>:
ULONG * ClbuildZoom() {
    1480:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    1484:	2c79 0000 4ab6 	movea.l 4ab6 <SysBase>,a6
    148a:	203c 0000 a48c 	move.l #42124,d0
    1490:	7202           	moveq #2,d1
    1492:	4eae ff3a      	jsr -198(a6)
    1496:	2440           	movea.l d0,a2
  if( retval == 0) {
    1498:	4a80           	tst.l d0
    149a:	6700 0160      	beq.w 15fc <ClbuildZoom+0x17c>
    *cl++ = *clpartinstruction++;
    149e:	24b9 0000 49f8 	move.l 49f8 <ClsSprites>,(a2)
    14a4:	2579 0000 49fc 	move.l 49fc <ClsSprites+0x4>,4(a2)
    14aa:	0004 
    14ac:	2579 0000 4a00 	move.l 4a00 <ClsSprites+0x8>,8(a2)
    14b2:	0008 
    14b4:	2579 0000 4a04 	move.l 4a04 <ClsSprites+0xc>,12(a2)
    14ba:	000c 
    14bc:	2579 0000 4a08 	move.l 4a08 <ClsSprites+0x10>,16(a2)
    14c2:	0010 
    14c4:	2579 0000 4a0c 	move.l 4a0c <ClsSprites+0x14>,20(a2)
    14ca:	0014 
    14cc:	2579 0000 4a10 	move.l 4a10 <ClsSprites+0x18>,24(a2)
    14d2:	0018 
    14d4:	2579 0000 4a14 	move.l 4a14 <ClsSprites+0x1c>,28(a2)
    14da:	001c 
    14dc:	2579 0000 4a18 	move.l 4a18 <ClsSprites+0x20>,32(a2)
    14e2:	0020 
    14e4:	2579 0000 4a1c 	move.l 4a1c <ClsSprites+0x24>,36(a2)
    14ea:	0024 
    14ec:	2579 0000 4a20 	move.l 4a20 <ClsSprites+0x28>,40(a2)
    14f2:	0028 
    14f4:	2579 0000 4a24 	move.l 4a24 <ClsSprites+0x2c>,44(a2)
    14fa:	002c 
    14fc:	2579 0000 4a28 	move.l 4a28 <ClsSprites+0x30>,48(a2)
    1502:	0030 
    1504:	2579 0000 4a2c 	move.l 4a2c <ClsSprites+0x34>,52(a2)
    150a:	0034 
    150c:	2579 0000 4a30 	move.l 4a30 <ClsSprites+0x38>,56(a2)
    1512:	0038 
    1514:	2579 0000 4a34 	move.l 4a34 <ClsSprites+0x3c>,60(a2)
    151a:	003c 
    *cl++ = *clpartinstruction++;
    151c:	2579 0000 4990 	move.l 4990 <ClScreenZoom>,64(a2)
    1522:	0040 
    1524:	2579 0000 4994 	move.l 4994 <ClScreenZoom+0x4>,68(a2)
    152a:	0044 
    152c:	2579 0000 4998 	move.l 4998 <ClScreenZoom+0x8>,72(a2)
    1532:	0048 
    1534:	2579 0000 499c 	move.l 499c <ClScreenZoom+0xc>,76(a2)
    153a:	004c 
    153c:	2579 0000 49a0 	move.l 49a0 <ClScreenZoom+0x10>,80(a2)
    1542:	0050 
    1544:	2579 0000 49a4 	move.l 49a4 <ClScreenZoom+0x14>,84(a2)
    154a:	0054 
    154c:	2579 0000 49a8 	move.l 49a8 <ClScreenZoom+0x18>,88(a2)
    1552:	0058 
    1554:	2579 0000 49ac 	move.l 49ac <ClScreenZoom+0x1c>,92(a2)
    155a:	005c 
    155c:	2579 0000 49b0 	move.l 49b0 <ClScreenZoom+0x20>,96(a2)
    1562:	0060 
    1564:	2579 0000 49b4 	move.l 49b4 <ClScreenZoom+0x24>,100(a2)
    156a:	0064 
    156c:	2579 0000 49b8 	move.l 49b8 <ClScreenZoom+0x28>,104(a2)
    1572:	0068 
    1574:	2579 0000 49bc 	move.l 49bc <ClScreenZoom+0x2c>,108(a2)
    157a:	006c 
  *cl++ = 0x00e00000;
    157c:	257c 00e0 0000 	move.l #14680064,112(a2)
    1582:	0070 
  *cl++ = 0x00e20000;
    1584:	257c 00e2 0000 	move.l #14811136,116(a2)
    158a:	0074 
  *cl++ = 0x00e40000;
    158c:	257c 00e4 0000 	move.l #14942208,120(a2)
    1592:	0078 
  *cl++ = 0x00e60000;
    1594:	257c 00e6 0000 	move.l #15073280,124(a2)
    159a:	007c 
    *cl++ = *clpartinstruction++;
    159c:	2579 0000 49c0 	move.l 49c0 <ClColor>,128(a2)
    15a2:	0080 
    15a4:	2579 0000 49c4 	move.l 49c4 <ClColor+0x4>,132(a2)
    15aa:	0084 
    15ac:	43ea 012c      	lea 300(a2),a1
    15b0:	220a           	move.l a2,d1
    15b2:	0681 0000 a52c 	addi.l #42284,d1
    15b8:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    15be:	41e9 ff60      	lea -160(a1),a0
    15c2:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    15c6:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    15cc:	5088           	addq.l #8,a0
    15ce:	217c 0182 0f00 	move.l #25300736,-4(a0)
    15d4:	fffc 
    for(int i2=0;i2<20;i2++) {
    15d6:	b3c8           	cmpa.l a0,a1
    15d8:	66ec           	bne.s 15c6 <ClbuildZoom+0x146>
    15da:	43e8 00a4      	lea 164(a0),a1
    15de:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    15e4:	b3c1           	cmpa.l d1,a1
    15e6:	66d6           	bne.s 15be <ClbuildZoom+0x13e>
   *cl = 0xfffffffe;
    15e8:	203c 0000 a488 	move.l #42120,d0
    15ee:	72fe           	moveq #-2,d1
    15f0:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    15f4:	200a           	move.l a2,d0
    15f6:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    15fa:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    15fc:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
    1602:	4eae ffc4      	jsr -60(a6)
    1606:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
    160c:	2200           	move.l d0,d1
    160e:	243c 0000 241b 	move.l #9243,d2
    1614:	7628           	moveq #40,d3
    1616:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    161a:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
    1620:	7201           	moveq #1,d1
    1622:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1626:	24b9 0000 49f8 	move.l 49f8 <ClsSprites>,(a2)
    162c:	2579 0000 49fc 	move.l 49fc <ClsSprites+0x4>,4(a2)
    1632:	0004 
    1634:	2579 0000 4a00 	move.l 4a00 <ClsSprites+0x8>,8(a2)
    163a:	0008 
    163c:	2579 0000 4a04 	move.l 4a04 <ClsSprites+0xc>,12(a2)
    1642:	000c 
    1644:	2579 0000 4a08 	move.l 4a08 <ClsSprites+0x10>,16(a2)
    164a:	0010 
    164c:	2579 0000 4a0c 	move.l 4a0c <ClsSprites+0x14>,20(a2)
    1652:	0014 
    1654:	2579 0000 4a10 	move.l 4a10 <ClsSprites+0x18>,24(a2)
    165a:	0018 
    165c:	2579 0000 4a14 	move.l 4a14 <ClsSprites+0x1c>,28(a2)
    1662:	001c 
    1664:	2579 0000 4a18 	move.l 4a18 <ClsSprites+0x20>,32(a2)
    166a:	0020 
    166c:	2579 0000 4a1c 	move.l 4a1c <ClsSprites+0x24>,36(a2)
    1672:	0024 
    1674:	2579 0000 4a20 	move.l 4a20 <ClsSprites+0x28>,40(a2)
    167a:	0028 
    167c:	2579 0000 4a24 	move.l 4a24 <ClsSprites+0x2c>,44(a2)
    1682:	002c 
    1684:	2579 0000 4a28 	move.l 4a28 <ClsSprites+0x30>,48(a2)
    168a:	0030 
    168c:	2579 0000 4a2c 	move.l 4a2c <ClsSprites+0x34>,52(a2)
    1692:	0034 
    1694:	2579 0000 4a30 	move.l 4a30 <ClsSprites+0x38>,56(a2)
    169a:	0038 
    169c:	2579 0000 4a34 	move.l 4a34 <ClsSprites+0x3c>,60(a2)
    16a2:	003c 
    *cl++ = *clpartinstruction++;
    16a4:	2579 0000 4990 	move.l 4990 <ClScreenZoom>,64(a2)
    16aa:	0040 
    16ac:	2579 0000 4994 	move.l 4994 <ClScreenZoom+0x4>,68(a2)
    16b2:	0044 
    16b4:	2579 0000 4998 	move.l 4998 <ClScreenZoom+0x8>,72(a2)
    16ba:	0048 
    16bc:	2579 0000 499c 	move.l 499c <ClScreenZoom+0xc>,76(a2)
    16c2:	004c 
    16c4:	2579 0000 49a0 	move.l 49a0 <ClScreenZoom+0x10>,80(a2)
    16ca:	0050 
    16cc:	2579 0000 49a4 	move.l 49a4 <ClScreenZoom+0x14>,84(a2)
    16d2:	0054 
    16d4:	2579 0000 49a8 	move.l 49a8 <ClScreenZoom+0x18>,88(a2)
    16da:	0058 
    16dc:	2579 0000 49ac 	move.l 49ac <ClScreenZoom+0x1c>,92(a2)
    16e2:	005c 
    16e4:	2579 0000 49b0 	move.l 49b0 <ClScreenZoom+0x20>,96(a2)
    16ea:	0060 
    16ec:	2579 0000 49b4 	move.l 49b4 <ClScreenZoom+0x24>,100(a2)
    16f2:	0064 
    16f4:	2579 0000 49b8 	move.l 49b8 <ClScreenZoom+0x28>,104(a2)
    16fa:	0068 
    16fc:	2579 0000 49bc 	move.l 49bc <ClScreenZoom+0x2c>,108(a2)
    1702:	006c 
  *cl++ = 0x00e00000;
    1704:	257c 00e0 0000 	move.l #14680064,112(a2)
    170a:	0070 
  *cl++ = 0x00e20000;
    170c:	257c 00e2 0000 	move.l #14811136,116(a2)
    1712:	0074 
  *cl++ = 0x00e40000;
    1714:	257c 00e4 0000 	move.l #14942208,120(a2)
    171a:	0078 
  *cl++ = 0x00e60000;
    171c:	257c 00e6 0000 	move.l #15073280,124(a2)
    1722:	007c 
    *cl++ = *clpartinstruction++;
    1724:	2579 0000 49c0 	move.l 49c0 <ClColor>,128(a2)
    172a:	0080 
    172c:	2579 0000 49c4 	move.l 49c4 <ClColor+0x4>,132(a2)
    1732:	0084 
    1734:	43ea 012c      	lea 300(a2),a1
    1738:	220a           	move.l a2,d1
    173a:	0681 0000 a52c 	addi.l #42284,d1
    1740:	203c 2c07 fffe 	move.l #738721790,d0
    1746:	6000 fe76      	bra.w 15be <ClbuildZoom+0x13e>

0000174a <SwapCl>:
  ULONG tmp = DrawCopper;
    174a:	2039 0000 4a9e 	move.l 4a9e <DrawCopper>,d0
  DrawCopper = ViewCopper;
    1750:	23f9 0000 4a92 	move.l 4a92 <ViewCopper>,4a9e <DrawCopper>
    1756:	0000 4a9e 
  ViewCopper = tmp;
    175a:	23c0 0000 4a92 	move.l d0,4a92 <ViewCopper>
  hw->cop1lc = ViewCopper;
    1760:	2079 0000 4a8e 	movea.l 4a8e <hw>,a0
    1766:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    176a:	3140 0088      	move.w d0,136(a0)
}
    176e:	4e75           	rts

00001770 <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    1770:	2039 0000 4aa2 	move.l 4aa2 <DrawBuffer>,d0
  UWORD *copword = DrawCopper;
    1776:	2079 0000 4a9e 	movea.l 4a9e <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    177c:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    1780:	2200           	move.l d0,d1
    1782:	4241           	clr.w d1
    1784:	4841           	swap d1
    1786:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    178a:	23f9 0000 4a96 	move.l 4a96 <ViewBuffer>,4aa2 <DrawBuffer>
    1790:	0000 4aa2 
  ViewBuffer = tmp;
    1794:	23c0 0000 4a96 	move.l d0,4a96 <ViewBuffer>
}
    179a:	4e75           	rts

0000179c <PrepareDisplay>:
 int PrepareDisplaySW() {
    179c:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClbuildSW();
    17a0:	45fa fa3a      	lea 11dc <ClBuild>(pc),a2
    17a4:	4e92           	jsr (a2)
    17a6:	23c0 0000 4ab2 	move.l d0,4ab2 <Copperlist1>
  Copperlist2 = ClbuildSW();
    17ac:	4e92           	jsr (a2)
    17ae:	23c0 0000 4aae 	move.l d0,4aae <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    17b4:	2c79 0000 4ab6 	movea.l 4ab6 <SysBase>,a6
    17ba:	203c 0000 c800 	move.l #51200,d0
    17c0:	7202           	moveq #2,d1
    17c2:	4eae ff3a      	jsr -198(a6)
    17c6:	23c0 0000 4aaa 	move.l d0,4aaa <Bitplane1>
  if(Bitplane1 == 0) {
    17cc:	6700 00ac      	beq.w 187a <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    17d0:	23c0 0000 4aa2 	move.l d0,4aa2 <DrawBuffer>
  DrawCopper = Copperlist1;
    17d6:	23f9 0000 4ab2 	move.l 4ab2 <Copperlist1>,4a9e <DrawCopper>
    17dc:	0000 4a9e 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    17e0:	2c79 0000 4ab6 	movea.l 4ab6 <SysBase>,a6
    17e6:	203c 0000 c800 	move.l #51200,d0
    17ec:	7202           	moveq #2,d1
    17ee:	4eae ff3a      	jsr -198(a6)
    17f2:	23c0 0000 4a9a 	move.l d0,4a9a <Bitplane2>
  if(Bitplane2 == 0) {
    17f8:	6728           	beq.s 1822 <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    17fa:	23c0 0000 4a96 	move.l d0,4a96 <ViewBuffer>
  ViewCopper = Copperlist2;
    1800:	23f9 0000 4aae 	move.l 4aae <Copperlist2>,4a92 <ViewCopper>
    1806:	0000 4a92 
  SwapCl();
    180a:	47fa ff3e      	lea 174a <SwapCl>(pc),a3
    180e:	4e93           	jsr (a3)
  SetBplPointers();
    1810:	45fa ff5e      	lea 1770 <SetBplPointers>(pc),a2
    1814:	4e92           	jsr (a2)
  SwapCl();
    1816:	4e93           	jsr (a3)
  SetBplPointers();
    1818:	4e92           	jsr (a2)
}
    181a:	7000           	moveq #0,d0
    181c:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    1820:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    1822:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
    1828:	4eae ffc4      	jsr -60(a6)
    182c:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
    1832:	2200           	move.l d0,d1
    1834:	243c 0000 2468 	move.l #9320,d2
    183a:	7626           	moveq #38,d3
    183c:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1840:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
    1846:	7201           	moveq #1,d1
    1848:	4eae ff70      	jsr -144(a6)
    184c:	2039 0000 4a9a 	move.l 4a9a <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    1852:	23c0 0000 4a96 	move.l d0,4a96 <ViewBuffer>
  ViewCopper = Copperlist2;
    1858:	23f9 0000 4aae 	move.l 4aae <Copperlist2>,4a92 <ViewCopper>
    185e:	0000 4a92 
  SwapCl();
    1862:	47fa fee6      	lea 174a <SwapCl>(pc),a3
    1866:	4e93           	jsr (a3)
  SetBplPointers();
    1868:	45fa ff06      	lea 1770 <SetBplPointers>(pc),a2
    186c:	4e92           	jsr (a2)
  SwapCl();
    186e:	4e93           	jsr (a3)
  SetBplPointers();
    1870:	4e92           	jsr (a2)
}
    1872:	7000           	moveq #0,d0
    1874:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    1878:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    187a:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
    1880:	4eae ffc4      	jsr -60(a6)
    1884:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
    188a:	2200           	move.l d0,d1
    188c:	243c 0000 2441 	move.l #9281,d2
    1892:	7626           	moveq #38,d3
    1894:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1898:	2c79 0000 4aa6 	movea.l 4aa6 <DOSBase>,a6
    189e:	7201           	moveq #1,d1
    18a0:	4eae ff70      	jsr -144(a6)
    18a4:	2039 0000 4aaa 	move.l 4aaa <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    18aa:	23c0 0000 4aa2 	move.l d0,4aa2 <DrawBuffer>
  DrawCopper = Copperlist1;
    18b0:	23f9 0000 4ab2 	move.l 4ab2 <Copperlist1>,4a9e <DrawCopper>
    18b6:	0000 4a9e 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    18ba:	2c79 0000 4ab6 	movea.l 4ab6 <SysBase>,a6
    18c0:	203c 0000 c800 	move.l #51200,d0
    18c6:	7202           	moveq #2,d1
    18c8:	4eae ff3a      	jsr -198(a6)
    18cc:	23c0 0000 4a9a 	move.l d0,4a9a <Bitplane2>
  if(Bitplane2 == 0) {
    18d2:	6600 ff26      	bne.w 17fa <PrepareDisplay+0x5e>
    18d6:	6000 ff4a      	bra.w 1822 <PrepareDisplay+0x86>

000018da <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    18da:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    18de:	262f 0010      	move.l 16(sp),d3
    18e2:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    18e6:	2279 0000 4ab2 	movea.l 4ab2 <Copperlist1>,a1
    18ec:	b2fc 0000      	cmpa.w #0,a1
    18f0:	670c           	beq.s 18fe <FreeDisplay+0x24>
    18f2:	2c79 0000 4ab6 	movea.l 4ab6 <SysBase>,a6
    18f8:	2003           	move.l d3,d0
    18fa:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    18fe:	2279 0000 4aae 	movea.l 4aae <Copperlist2>,a1
    1904:	b2fc 0000      	cmpa.w #0,a1
    1908:	670c           	beq.s 1916 <FreeDisplay+0x3c>
    190a:	2c79 0000 4ab6 	movea.l 4ab6 <SysBase>,a6
    1910:	2003           	move.l d3,d0
    1912:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    1916:	2279 0000 4aaa 	movea.l 4aaa <Bitplane1>,a1
    191c:	b2fc 0000      	cmpa.w #0,a1
    1920:	670c           	beq.s 192e <FreeDisplay+0x54>
    1922:	2c79 0000 4ab6 	movea.l 4ab6 <SysBase>,a6
    1928:	2002           	move.l d2,d0
    192a:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    192e:	2279 0000 4a9a 	movea.l 4a9a <Bitplane2>,a1
    1934:	b2fc 0000      	cmpa.w #0,a1
    1938:	670c           	beq.s 1946 <FreeDisplay+0x6c>
    193a:	2c79 0000 4ab6 	movea.l 4ab6 <SysBase>,a6
    1940:	2002           	move.l d2,d0
    1942:	4eae ff2e      	jsr -210(a6)
}
    1946:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    194a:	4e75           	rts

0000194c <WaitVbl>:
void WaitVbl() {
    194c:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    194e:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdddc7e>,d0
    1954:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    1956:	2017           	move.l (sp),d0
    1958:	0280 0001 ff00 	andi.l #130816,d0
    195e:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    1960:	2017           	move.l (sp),d0
    1962:	0c80 0001 3700 	cmpi.l #79616,d0
    1968:	67e4           	beq.s 194e <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    196a:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdddc7e>,d0
    1970:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    1974:	202f 0004      	move.l 4(sp),d0
    1978:	0280 0001 ff00 	andi.l #130816,d0
    197e:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    1982:	202f 0004      	move.l 4(sp),d0
    1986:	0c80 0001 3700 	cmpi.l #79616,d0
    198c:	66dc           	bne.s 196a <WaitVbl+0x1e>
}
    198e:	508f           	addq.l #8,sp
    1990:	4e75           	rts

00001992 <memcpy>:
{
    1992:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    1996:	202f 0014      	move.l 20(sp),d0
    199a:	226f 0018      	movea.l 24(sp),a1
    199e:	222f 001c      	move.l 28(sp),d1
	while(len--)
    19a2:	2601           	move.l d1,d3
    19a4:	5383           	subq.l #1,d3
    19a6:	4a81           	tst.l d1
    19a8:	6762           	beq.s 1a0c <memcpy+0x7a>
    19aa:	2040           	movea.l d0,a0
    19ac:	5888           	addq.l #4,a0
    19ae:	b1c9           	cmpa.l a1,a0
    19b0:	53c2           	sl.s d2
    19b2:	4402           	neg.b d2
    19b4:	41e9 0004      	lea 4(a1),a0
    19b8:	b1c0           	cmpa.l d0,a0
    19ba:	53c4           	sl.s d4
    19bc:	4404           	neg.b d4
    19be:	8404           	or.b d4,d2
    19c0:	7808           	moveq #8,d4
    19c2:	b883           	cmp.l d3,d4
    19c4:	55c4           	sc.s d4
    19c6:	4404           	neg.b d4
    19c8:	c404           	and.b d4,d2
    19ca:	6746           	beq.s 1a12 <memcpy+0x80>
    19cc:	2409           	move.l a1,d2
    19ce:	8480           	or.l d0,d2
    19d0:	7803           	moveq #3,d4
    19d2:	c484           	and.l d4,d2
    19d4:	663c           	bne.s 1a12 <memcpy+0x80>
    19d6:	2049           	movea.l a1,a0
    19d8:	2440           	movea.l d0,a2
    19da:	74fc           	moveq #-4,d2
    19dc:	c481           	and.l d1,d2
    19de:	d489           	add.l a1,d2
		*d++ = *s++;
    19e0:	24d8           	move.l (a0)+,(a2)+
    19e2:	b488           	cmp.l a0,d2
    19e4:	66fa           	bne.s 19e0 <memcpy+0x4e>
    19e6:	74fc           	moveq #-4,d2
    19e8:	c481           	and.l d1,d2
    19ea:	2040           	movea.l d0,a0
    19ec:	d1c2           	adda.l d2,a0
    19ee:	d3c2           	adda.l d2,a1
    19f0:	9682           	sub.l d2,d3
    19f2:	b481           	cmp.l d1,d2
    19f4:	6716           	beq.s 1a0c <memcpy+0x7a>
    19f6:	1091           	move.b (a1),(a0)
	while(len--)
    19f8:	4a83           	tst.l d3
    19fa:	6710           	beq.s 1a0c <memcpy+0x7a>
		*d++ = *s++;
    19fc:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    1a02:	5383           	subq.l #1,d3
    1a04:	6706           	beq.s 1a0c <memcpy+0x7a>
		*d++ = *s++;
    1a06:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    1a0c:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    1a10:	4e75           	rts
    1a12:	2040           	movea.l d0,a0
    1a14:	d289           	add.l a1,d1
		*d++ = *s++;
    1a16:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    1a18:	b289           	cmp.l a1,d1
    1a1a:	67f0           	beq.s 1a0c <memcpy+0x7a>
		*d++ = *s++;
    1a1c:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    1a1e:	b289           	cmp.l a1,d1
    1a20:	66f4           	bne.s 1a16 <memcpy+0x84>
    1a22:	60e8           	bra.s 1a0c <memcpy+0x7a>

00001a24 <memset>:
{
    1a24:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    1a28:	202f 0024      	move.l 36(sp),d0
    1a2c:	2a2f 0028      	move.l 40(sp),d5
    1a30:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    1a34:	2809           	move.l a1,d4
    1a36:	5384           	subq.l #1,d4
    1a38:	b2fc 0000      	cmpa.w #0,a1
    1a3c:	6f00 00b0      	ble.w 1aee <memset+0xca>
    1a40:	1e05           	move.b d5,d7
    1a42:	2200           	move.l d0,d1
    1a44:	4481           	neg.l d1
    1a46:	7403           	moveq #3,d2
    1a48:	c282           	and.l d2,d1
    1a4a:	7c05           	moveq #5,d6
		*ptr++ = val;
    1a4c:	2440           	movea.l d0,a2
    1a4e:	bc84           	cmp.l d4,d6
    1a50:	646a           	bcc.s 1abc <memset+0x98>
    1a52:	4a81           	tst.l d1
    1a54:	6724           	beq.s 1a7a <memset+0x56>
    1a56:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    1a58:	5384           	subq.l #1,d4
    1a5a:	7401           	moveq #1,d2
    1a5c:	b481           	cmp.l d1,d2
    1a5e:	671a           	beq.s 1a7a <memset+0x56>
		*ptr++ = val;
    1a60:	2440           	movea.l d0,a2
    1a62:	548a           	addq.l #2,a2
    1a64:	2040           	movea.l d0,a0
    1a66:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    1a6a:	5384           	subq.l #1,d4
    1a6c:	7403           	moveq #3,d2
    1a6e:	b481           	cmp.l d1,d2
    1a70:	6608           	bne.s 1a7a <memset+0x56>
		*ptr++ = val;
    1a72:	528a           	addq.l #1,a2
    1a74:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    1a78:	5384           	subq.l #1,d4
    1a7a:	2609           	move.l a1,d3
    1a7c:	9681           	sub.l d1,d3
    1a7e:	7c00           	moveq #0,d6
    1a80:	1c05           	move.b d5,d6
    1a82:	2406           	move.l d6,d2
    1a84:	4842           	swap d2
    1a86:	4242           	clr.w d2
    1a88:	2042           	movea.l d2,a0
    1a8a:	2406           	move.l d6,d2
    1a8c:	e14a           	lsl.w #8,d2
    1a8e:	4842           	swap d2
    1a90:	4242           	clr.w d2
    1a92:	e18e           	lsl.l #8,d6
    1a94:	2646           	movea.l d6,a3
    1a96:	2c08           	move.l a0,d6
    1a98:	8486           	or.l d6,d2
    1a9a:	2c0b           	move.l a3,d6
    1a9c:	8486           	or.l d6,d2
    1a9e:	1407           	move.b d7,d2
    1aa0:	2040           	movea.l d0,a0
    1aa2:	d1c1           	adda.l d1,a0
    1aa4:	72fc           	moveq #-4,d1
    1aa6:	c283           	and.l d3,d1
    1aa8:	d288           	add.l a0,d1
		*ptr++ = val;
    1aaa:	20c2           	move.l d2,(a0)+
    1aac:	b1c1           	cmpa.l d1,a0
    1aae:	66fa           	bne.s 1aaa <memset+0x86>
    1ab0:	72fc           	moveq #-4,d1
    1ab2:	c283           	and.l d3,d1
    1ab4:	d5c1           	adda.l d1,a2
    1ab6:	9881           	sub.l d1,d4
    1ab8:	b283           	cmp.l d3,d1
    1aba:	6732           	beq.s 1aee <memset+0xca>
    1abc:	1485           	move.b d5,(a2)
	while(len-- > 0)
    1abe:	4a84           	tst.l d4
    1ac0:	6f2c           	ble.s 1aee <memset+0xca>
		*ptr++ = val;
    1ac2:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    1ac6:	7201           	moveq #1,d1
    1ac8:	b284           	cmp.l d4,d1
    1aca:	6c22           	bge.s 1aee <memset+0xca>
		*ptr++ = val;
    1acc:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    1ad0:	7402           	moveq #2,d2
    1ad2:	b484           	cmp.l d4,d2
    1ad4:	6c18           	bge.s 1aee <memset+0xca>
		*ptr++ = val;
    1ad6:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    1ada:	7c03           	moveq #3,d6
    1adc:	bc84           	cmp.l d4,d6
    1ade:	6c0e           	bge.s 1aee <memset+0xca>
		*ptr++ = val;
    1ae0:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    1ae4:	7204           	moveq #4,d1
    1ae6:	b284           	cmp.l d4,d1
    1ae8:	6c04           	bge.s 1aee <memset+0xca>
		*ptr++ = val;
    1aea:	1545 0005      	move.b d5,5(a2)
}
    1aee:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    1af2:	4e75           	rts

00001af4 <strlen>:
{
    1af4:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    1af8:	7000           	moveq #0,d0
	while(*s++)
    1afa:	4a10           	tst.b (a0)
    1afc:	6708           	beq.s 1b06 <strlen+0x12>
		t++;
    1afe:	5280           	addq.l #1,d0
	while(*s++)
    1b00:	4a30 0800      	tst.b (0,a0,d0.l)
    1b04:	66f8           	bne.s 1afe <strlen+0xa>
}
    1b06:	4e75           	rts

00001b08 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    1b08:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    1b0c:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    1b10:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    1b14:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    1b18:	d041           	add.w d1,d0
	swap	d0
    1b1a:	4840           	swap d0
	clrw	d0
    1b1c:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    1b1e:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    1b22:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    1b26:	d081           	add.l d1,d0

	rts
    1b28:	4e75           	rts

00001b2a <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    1b2a:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    1b2c:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    1b30:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    1b34:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    1b3a:	6416           	bcc.s 1b52 <__udivsi3+0x28>
	movel	d0, d2
    1b3c:	2400           	move.l d0,d2
	clrw	d2
    1b3e:	4242           	clr.w d2
	swap	d2
    1b40:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    1b42:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    1b44:	3002           	move.w d2,d0
	swap	d0
    1b46:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    1b48:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    1b4c:	84c1           	divu.w d1,d2
	movew	d2, d0
    1b4e:	3002           	move.w d2,d0
	jra	6f
    1b50:	6030           	bra.s 1b82 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    1b52:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    1b54:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    1b56:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    1b58:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    1b5e:	64f4           	bcc.s 1b54 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    1b60:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    1b62:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    1b68:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    1b6a:	c2c0           	mulu.w d0,d1
	swap	d2
    1b6c:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    1b6e:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    1b70:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    1b72:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    1b74:	660a           	bne.s 1b80 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    1b76:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    1b78:	6506           	bcs.s 1b80 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    1b7a:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    1b7e:	6302           	bls.s 1b82 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    1b80:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    1b82:	241f           	move.l (sp)+,d2
	rts
    1b84:	4e75           	rts

00001b86 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    1b86:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    1b88:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    1b8a:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    1b8e:	6a04           	bpl.s 1b94 <__divsi3+0xe>
	negl	d1
    1b90:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    1b92:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    1b94:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    1b98:	6a04           	bpl.s 1b9e <__divsi3+0x18>
	negl	d0
    1b9a:	4480           	neg.l d0
	negb	d2
    1b9c:	4402           	neg.b d2

2:	movel	d1, sp@-
    1b9e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1ba0:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    1ba2:	6186           	bsr.s 1b2a <__udivsi3>
	addql	IMM (8), sp
    1ba4:	508f           	addq.l #8,sp

	tstb	d2
    1ba6:	4a02           	tst.b d2
	jpl	3f
    1ba8:	6a02           	bpl.s 1bac <__divsi3+0x26>
	negl	d0
    1baa:	4480           	neg.l d0

3:	movel	sp@+, d2
    1bac:	241f           	move.l (sp)+,d2
	rts
    1bae:	4e75           	rts

00001bb0 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    1bb0:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    1bb4:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    1bb8:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1bba:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    1bbc:	61c8           	bsr.s 1b86 <__divsi3>
	addql	IMM (8), sp
    1bbe:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    1bc0:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    1bc4:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1bc6:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    1bc8:	6100 ff3e      	bsr.w 1b08 <__mulsi3>
	addql	IMM (8), sp
    1bcc:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    1bce:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    1bd2:	9280           	sub.l d0,d1
	movel	d1, d0
    1bd4:	2001           	move.l d1,d0
	rts
    1bd6:	4e75           	rts

00001bd8 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    1bd8:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    1bdc:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    1be0:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1be2:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    1be4:	6100 ff44      	bsr.w 1b2a <__udivsi3>
	addql	IMM (8), sp
    1be8:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    1bea:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    1bee:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1bf0:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    1bf2:	6100 ff14      	bsr.w 1b08 <__mulsi3>
	addql	IMM (8), sp
    1bf6:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    1bf8:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    1bfc:	9280           	sub.l d0,d1
	movel	d1, d0
    1bfe:	2001           	move.l d1,d0
	rts
    1c00:	4e75           	rts

00001c02 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    1c02:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    1c04:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    1c08:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    1c0c:	2c5f           	movea.l (sp)+,a6
    rts
    1c0e:	4e75           	rts

00001c10 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    1c10:	16c0           	move.b d0,(a3)+
	rts
    1c12:	4e75           	rts

00001c14 <saveregs>:
	...

00001c50 <font2distance>:
    1c50:	0505           	btst d2,d5
    1c52:	0505           	btst d2,d5
    1c54:	0505           	btst d2,d5
    1c56:	0505           	btst d2,d5
    1c58:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    1c5a:	0505           	btst d2,d5
    1c5c:	0505           	btst d2,d5
    1c5e:	0005 0505      	ori.b #5,d5
    1c62:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    1c64:	0505           	btst d2,d5
    1c66:	0505           	btst d2,d5
    1c68:	0505           	btst d2,d5
    1c6a:	0505           	btst d2,d5
    1c6c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    1c6e:	0505           	btst d2,d5
    1c70:	0505           	btst d2,d5
    1c72:	0505           	btst d2,d5
    1c74:	0505           	btst d2,d5
    1c76:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    1c78:	0500           	btst d2,d0
    1c7a:	0505           	btst d2,d5
    1c7c:	0505           	btst d2,d5
    1c7e:	0505           	btst d2,d5
    1c80:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    1c82:	0505           	btst d2,d5
    1c84:	0505           	btst d2,d5
    1c86:	0505           	btst d2,d5
    1c88:	0505           	btst d2,d5
    1c8a:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    1c8c:	0505           	btst d2,d5
    1c8e:	0505           	btst d2,d5
    1c90:	0503           	btst d2,d3
    1c92:	0505           	btst d2,d5
    1c94:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    1c96:	0505           	btst d2,d5
    1c98:	0500           	btst d2,d0
    1c9a:	0505           	btst d2,d5
    1c9c:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    1ca0:	0505           	btst d2,d5
    1ca2:	0503           	btst d2,d3
    1ca4:	0205 0507      	andi.b #7,d5
    1ca8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    1caa:	0505           	btst d2,d5
    1cac:	0505           	btst d2,d5
    1cae:	0505           	btst d2,d5
    1cb0:	0505           	btst d2,d5
    1cb2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1cb4:	0505           	btst d2,d5
    1cb6:	0505           	btst d2,d5
    1cb8:	0505           	btst d2,d5
    1cba:	0505           	btst d2,d5
    1cbc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1cbe:	0505           	btst d2,d5
    1cc0:	0505           	btst d2,d5
    1cc2:	0505           	btst d2,d5
    1cc4:	0505           	btst d2,d5
    1cc6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1cc8:	0505           	btst d2,d5
    1cca:	0505           	btst d2,d5
    1ccc:	0505           	btst d2,d5
    1cce:	0505           	btst d2,d5
    1cd0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1cd2:	0505           	btst d2,d5
    1cd4:	0505           	btst d2,d5
    1cd6:	0505           	btst d2,d5
    1cd8:	0505           	btst d2,d5
    1cda:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1cdc:	0505           	btst d2,d5
    1cde:	0505           	btst d2,d5
    1ce0:	0505           	btst d2,d5
    1ce2:	0505           	btst d2,d5
    1ce4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1ce6:	0505           	btst d2,d5
    1ce8:	0505           	btst d2,d5
    1cea:	0505           	btst d2,d5
    1cec:	0505           	btst d2,d5
    1cee:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1cf0:	0505           	btst d2,d5
    1cf2:	0505           	btst d2,d5
    1cf4:	0505           	btst d2,d5
    1cf6:	0505           	btst d2,d5
    1cf8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1cfa:	0505           	btst d2,d5
    1cfc:	0505           	btst d2,d5
    1cfe:	0505           	btst d2,d5
    1d00:	0505           	btst d2,d5
    1d02:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1d04:	0505           	btst d2,d5
    1d06:	0505           	btst d2,d5
    1d08:	0505           	btst d2,d5
    1d0a:	0505           	btst d2,d5
    1d0c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1d0e:	0505           	btst d2,d5
    1d10:	0505           	btst d2,d5
    1d12:	0505           	btst d2,d5
    1d14:	0505           	btst d2,d5
    1d16:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1d18:	0505           	btst d2,d5
    1d1a:	0505           	btst d2,d5
    1d1c:	0505           	btst d2,d5
    1d1e:	0505           	btst d2,d5
    1d20:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1d22:	0505           	btst d2,d5
    1d24:	0505           	btst d2,d5
    1d26:	0505           	btst d2,d5
    1d28:	0505           	btst d2,d5
    1d2a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1d2c:	0505           	btst d2,d5
    1d2e:	0505           	btst d2,d5
    1d30:	0505           	btst d2,d5
    1d32:	0505           	btst d2,d5
    1d34:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1d36:	0505           	btst d2,d5
    1d38:	0505           	btst d2,d5
    1d3a:	0505           	btst d2,d5
    1d3c:	0505           	btst d2,d5
    1d3e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1d40:	0505           	btst d2,d5
    1d42:	0505           	btst d2,d5
    1d44:	0505           	btst d2,d5
    1d46:	0505           	btst d2,d5
    1d48:	0505           	btst d2,d5

00001d4a <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    1d4a:	48f9 7fff 0000 	movem.l d0-a6,1c14 <saveregs>
    1d50:	1c14 
  lea 0xdff000,a5
    1d52:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xdddc7a>,a5
  move.l sp@(4),a0  //Fontlocation
    1d58:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    1d5c:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    1d60:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    1d64:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    1d66:	082d 0006 0002 	btst #6,2(a5)

00001d6c <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    1d6c:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    1d72:	66f8           	bne.s 1d6c <st2wblit>

00001d74 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    1d74:	7019           	moveq #25,d0
	sub.l d5,d5      
    1d76:	9a85           	sub.l d5,d5

00001d78 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    1d78:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    1d7a:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    1d7c:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    1d80:	9dce           	suba.l a6,a6
	move.l d2, a6
    1d82:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    1d84:	ddfc 0000 1c50 	adda.l #7248,a6

	LSL  	#4,d2 	    //Fetch next char
    1d8a:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    1d8c:	2842           	movea.l d2,a4


	move.l  #0,d4
    1d8e:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    1d90:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    1d92:	3814           	move.w (a4),d4
	swap	d4
    1d94:	4844           	swap d4
	lsr.l	d5, d4
    1d96:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    1d98:	8993           	or.l d4,(a3)
	clr.l	d4
    1d9a:	4284           	clr.l d4
	move.w  2(a4), d4
    1d9c:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    1da0:	4844           	swap d4
	lsr.l	d5, d4
    1da2:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    1da4:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    1da8:	4284           	clr.l d4
	move.w  4(a4), d4
    1daa:	382c 0004      	move.w 4(a4),d4
	swap	d4
    1dae:	4844           	swap d4
	lsr.l	d5, d4
    1db0:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    1db2:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    1db6:	4284           	clr.l d4
	move.w  6(a4), d4
    1db8:	382c 0006      	move.w 6(a4),d4
	swap	d4
    1dbc:	4844           	swap d4
	lsr.l	d5, d4
    1dbe:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    1dc0:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    1dc4:	4284           	clr.l d4
	move.w  8(a4), d4
    1dc6:	382c 0008      	move.w 8(a4),d4
	swap	d4
    1dca:	4844           	swap d4
	lsr.l	d5, d4
    1dcc:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    1dce:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    1dd2:	4284           	clr.l d4
	move.w  10(a4), d4
    1dd4:	382c 000a      	move.w 10(a4),d4
	swap	d4
    1dd8:	4844           	swap d4
	lsr.l	d5, d4
    1dda:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    1ddc:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    1de0:	4284           	clr.l d4
	move.w  12(a4), d4
    1de2:	382c 000c      	move.w 12(a4),d4
	swap	d4
    1de6:	4844           	swap d4
	lsr.l	d5, d4
    1de8:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    1dea:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    1dee:	4284           	clr.l d4
	move.w  14(a4), d4
    1df0:	382c 000e      	move.w 14(a4),d4
	swap	d4
    1df4:	4844           	swap d4
	lsr.l	d5, d4
    1df6:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    1df8:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    1dfc:	4284           	clr.l d4

	add.b   (a6), d5
    1dfe:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    1e00:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    1e04:	6500 0006      	bcs.w 1e0c <noadditionalchar>
	addq.w  #1, a3
    1e08:	524b           	addq.w #1,a3
	sub.w   #8,d5
    1e0a:	5145           	subq.w #8,d5

00001e0c <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    1e0c:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    1e0e:	51c8 ff68      	dbf d0,1d78 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    1e12:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    1e16:	51cb ff5c      	dbf d3,1d74 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    1e1a:	4cfa 7fff fdf6 	movem.l 1c14 <saveregs>(pc),d0-a6

	RTS
    1e20:	4e75           	rts
