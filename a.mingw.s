
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
       6:	4fef ffdc      	lea -36(sp),sp
       a:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)

  SysBase = *((struct ExecBase**)4UL);
       e:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      12:	23ce 0000 484e 	move.l a6,484e <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,4824 <hw>
      1e:	0000 4824 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 22cf 	lea 22cf <incbin_swfont_end+0xbd>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 4820 	move.l d0,4820 <GfxBase>
	if (!GfxBase)
      34:	6700 0c8c      	beq.w cc2 <main+0xcbc>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
      3e:	43f9 0000 22e0 	lea 22e0 <incbin_swfont_end+0xce>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 482e 	move.l d0,482e <DOSBase>
	if (!DOSBase)
      50:	6700 0c98      	beq.w cea <main+0xce4>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 22ec 	pea 22ec <incbin_swfont_end+0xda>
      5a:	4eb9 0000 0ee0 	jsr ee0 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 2308 	move.l #8968,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
	Delay(50);
      7e:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
      84:	7232           	moveq #50,d1
      86:	4eae ff3a      	jsr -198(a6)
  Zoom_InitRun();
      8a:	4eb9 0000 1482 	jsr 1482 <Zoom_InitRun>
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      90:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
      96:	4eae ffc4      	jsr -60(a6)
      9a:	2079 0000 4824 	movea.l 4824 <hw>,a0
      a0:	2628 0080      	move.l 128(a0),d3
      a4:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
      aa:	2200           	move.l d0,d1
      ac:	243c 0000 2318 	move.l #8984,d2
      b2:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      b6:	47f9 0000 0f50 	lea f50 <ClBuild>,a3
      bc:	4e93           	jsr (a3)
      be:	2440           	movea.l d0,a2
      c0:	23c0 0000 4852 	move.l d0,4852 <Copperlist1>
  DrawCopper = Copperlist1;
      c6:	23c0 0000 483a 	move.l d0,483a <DrawCopper>
  Copperlist2 = ClBuild();
      cc:	4e93           	jsr (a3)
      ce:	23c0 0000 484a 	move.l d0,484a <Copperlist2>
  ViewCopper = Copperlist2;
      d4:	23c0 0000 482a 	move.l d0,482a <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      da:	588f           	addq.l #4,sp
      dc:	2039 0000 47ac 	move.l 47ac <ClsSprites>,d0
      e2:	b092           	cmp.l (a2),d0
      e4:	6600 0980      	bne.w a66 <main+0xa60>
      e8:	222a 0004      	move.l 4(a2),d1
      ec:	b2b9 0000 47b0 	cmp.l 47b0 <ClsSprites+0x4>,d1
      f2:	6600 0972      	bne.w a66 <main+0xa60>
      f6:	2079 0000 47b4 	movea.l 47b4 <ClsSprites+0x8>,a0
      fc:	b1ea 0008      	cmpa.l 8(a2),a0
     100:	6600 0964      	bne.w a66 <main+0xa60>
     104:	2039 0000 47b8 	move.l 47b8 <ClsSprites+0xc>,d0
     10a:	b0aa 000c      	cmp.l 12(a2),d0
     10e:	6600 0956      	bne.w a66 <main+0xa60>
     112:	222a 0010      	move.l 16(a2),d1
     116:	b2b9 0000 47bc 	cmp.l 47bc <ClsSprites+0x10>,d1
     11c:	6600 0948      	bne.w a66 <main+0xa60>
     120:	2079 0000 47c0 	movea.l 47c0 <ClsSprites+0x14>,a0
     126:	b1ea 0014      	cmpa.l 20(a2),a0
     12a:	6600 093a      	bne.w a66 <main+0xa60>
     12e:	202a 0018      	move.l 24(a2),d0
     132:	b0b9 0000 47c4 	cmp.l 47c4 <ClsSprites+0x18>,d0
     138:	6600 092c      	bne.w a66 <main+0xa60>
     13c:	222a 001c      	move.l 28(a2),d1
     140:	b2b9 0000 47c8 	cmp.l 47c8 <ClsSprites+0x1c>,d1
     146:	6600 091e      	bne.w a66 <main+0xa60>
     14a:	206a 0020      	movea.l 32(a2),a0
     14e:	b1f9 0000 47cc 	cmpa.l 47cc <ClsSprites+0x20>,a0
     154:	6600 0910      	bne.w a66 <main+0xa60>
     158:	202a 0024      	move.l 36(a2),d0
     15c:	b0b9 0000 47d0 	cmp.l 47d0 <ClsSprites+0x24>,d0
     162:	6600 0902      	bne.w a66 <main+0xa60>
     166:	222a 0028      	move.l 40(a2),d1
     16a:	b2b9 0000 47d4 	cmp.l 47d4 <ClsSprites+0x28>,d1
     170:	6600 08f4      	bne.w a66 <main+0xa60>
     174:	206a 002c      	movea.l 44(a2),a0
     178:	b1f9 0000 47d8 	cmpa.l 47d8 <ClsSprites+0x2c>,a0
     17e:	6600 08e6      	bne.w a66 <main+0xa60>
     182:	202a 0030      	move.l 48(a2),d0
     186:	b0b9 0000 47dc 	cmp.l 47dc <ClsSprites+0x30>,d0
     18c:	6600 08d8      	bne.w a66 <main+0xa60>
     190:	222a 0034      	move.l 52(a2),d1
     194:	b2b9 0000 47e0 	cmp.l 47e0 <ClsSprites+0x34>,d1
     19a:	6600 08ca      	bne.w a66 <main+0xa60>
     19e:	206a 0038      	movea.l 56(a2),a0
     1a2:	b1f9 0000 47e4 	cmpa.l 47e4 <ClsSprites+0x38>,a0
     1a8:	6600 08bc      	bne.w a66 <main+0xa60>
     1ac:	246a 003c      	movea.l 60(a2),a2
     1b0:	b5f9 0000 47e8 	cmpa.l 47e8 <ClsSprites+0x3c>,a2
     1b6:	6600 08ae      	bne.w a66 <main+0xa60>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1ba:	2079 0000 4852 	movea.l 4852 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1c0:	2039 0000 477c 	move.l 477c <ClScreen>,d0
     1c6:	b0a8 0040      	cmp.l 64(a0),d0
     1ca:	6600 08e4      	bne.w ab0 <main+0xaaa>
     1ce:	2239 0000 4780 	move.l 4780 <ClScreen+0x4>,d1
     1d4:	b2a8 0044      	cmp.l 68(a0),d1
     1d8:	6600 08d6      	bne.w ab0 <main+0xaaa>
     1dc:	2039 0000 4784 	move.l 4784 <ClScreen+0x8>,d0
     1e2:	b0a8 0048      	cmp.l 72(a0),d0
     1e6:	6600 08c8      	bne.w ab0 <main+0xaaa>
     1ea:	2239 0000 4788 	move.l 4788 <ClScreen+0xc>,d1
     1f0:	b2a8 004c      	cmp.l 76(a0),d1
     1f4:	6600 08ba      	bne.w ab0 <main+0xaaa>
     1f8:	2039 0000 478c 	move.l 478c <ClScreen+0x10>,d0
     1fe:	b0a8 0050      	cmp.l 80(a0),d0
     202:	6600 08ac      	bne.w ab0 <main+0xaaa>
     206:	2239 0000 4790 	move.l 4790 <ClScreen+0x14>,d1
     20c:	b2a8 0054      	cmp.l 84(a0),d1
     210:	6600 089e      	bne.w ab0 <main+0xaaa>
     214:	2039 0000 4794 	move.l 4794 <ClScreen+0x18>,d0
     21a:	b0a8 0058      	cmp.l 88(a0),d0
     21e:	6600 0890      	bne.w ab0 <main+0xaaa>
     222:	2239 0000 4798 	move.l 4798 <ClScreen+0x1c>,d1
     228:	b2a8 005c      	cmp.l 92(a0),d1
     22c:	6600 0882      	bne.w ab0 <main+0xaaa>
     230:	2039 0000 479c 	move.l 479c <ClScreen+0x20>,d0
     236:	b0a8 0060      	cmp.l 96(a0),d0
     23a:	6600 0874      	bne.w ab0 <main+0xaaa>
     23e:	2239 0000 47a0 	move.l 47a0 <ClScreen+0x24>,d1
     244:	b2a8 0064      	cmp.l 100(a0),d1
     248:	6600 0866      	bne.w ab0 <main+0xaaa>
     24c:	2039 0000 47a4 	move.l 47a4 <ClScreen+0x28>,d0
     252:	b0a8 0068      	cmp.l 104(a0),d0
     256:	6600 0858      	bne.w ab0 <main+0xaaa>
     25a:	2068 006c      	movea.l 108(a0),a0
     25e:	b1f9 0000 47a8 	cmpa.l 47a8 <ClScreen+0x2c>,a0
     264:	6600 084a      	bne.w ab0 <main+0xaaa>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     268:	23fc 0004 0000 	move.l #262144,483e <DrawBuffer>
     26e:	0000 483e 
  ViewBuffer = (ULONG *)0x50000;
     272:	23fc 0005 0000 	move.l #327680,4836 <ViewBuffer>
     278:	0000 4836 
  SetBplPointers( 1, 0); //Sizeofplane irrevelant if only one plane
     27c:	45f9 0000 0e12 	lea e12 <SetBplPointers.constprop.1>,a2
     282:	4e92           	jsr (a2)
  if( DrawBuffer != (ULONG *) 0x50000 || ViewBuffer != (ULONG *)0x40000)
     284:	0cb9 0005 0000 	cmpi.l #327680,483e <DrawBuffer>
     28a:	0000 483e 
     28e:	6700 0a66      	beq.w cf6 <main+0xcf0>
    Write( Output(), 
     292:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     298:	4eae ffc4      	jsr -60(a6)
     29c:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     2a2:	2200           	move.l d0,d1
     2a4:	243c 0000 231b 	move.l #8987,d2
     2aa:	763b           	moveq #59,d3
     2ac:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     2b0:	2079 0000 4852 	movea.l 4852 <Copperlist1>,a0
     2b6:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2bc:	0070 
     2be:	6724           	beq.s 2e4 <main+0x2de>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2c0:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     2c6:	4eae ffc4      	jsr -60(a6)
     2ca:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     2d0:	2200           	move.l d0,d1
     2d2:	243c 0000 2357 	move.l #9047,d2
     2d8:	763c           	moveq #60,d3
     2da:	4eae ffd0      	jsr -48(a6)
     2de:	2079 0000 4852 	movea.l 4852 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2e4:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2ea:	0074 
     2ec:	6724           	beq.s 312 <main+0x30c>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2ee:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     2f4:	4eae ffc4      	jsr -60(a6)
     2f8:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     2fe:	2200           	move.l d0,d1
     300:	243c 0000 2394 	move.l #9108,d2
     306:	763c           	moveq #60,d3
     308:	4eae ffd0      	jsr -48(a6)
     30c:	2079 0000 4852 	movea.l 4852 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     312:	2228 0078      	move.l 120(a0),d1
     316:	b2b9 0000 46fc 	cmp.l 46fc <ClColor>,d1
     31c:	6600 076a      	bne.w a88 <main+0xa82>
     320:	2028 007c      	move.l 124(a0),d0
     324:	b0b9 0000 4700 	cmp.l 4700 <ClColor+0x4>,d0
     32a:	6600 075c      	bne.w a88 <main+0xa82>
  if( instructions[pos] == value ) 
     32e:	72fe           	moveq #-2,d1
     330:	b2a8 0080      	cmp.l 128(a0),d1
     334:	671e           	beq.s 354 <main+0x34e>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     336:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     33c:	4eae ffc4      	jsr -60(a6)
     340:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     346:	2200           	move.l d0,d1
     348:	243c 0000 23f3 	move.l #9203,d2
     34e:	7622           	moveq #34,d3
     350:	4eae ffd0      	jsr -48(a6)

  SwapCl();
     354:	47f9 0000 162c 	lea 162c <SwapCl>,a3
     35a:	4e93           	jsr (a3)
  if( DrawCopper != Copperlist2)
     35c:	2079 0000 483a 	movea.l 483a <DrawCopper>,a0
     362:	b1f9 0000 484a 	cmpa.l 484a <Copperlist2>,a0
     368:	671e           	beq.s 388 <main+0x382>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     36a:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     370:	4eae ffc4      	jsr -60(a6)
     374:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     37a:	2200           	move.l d0,d1
     37c:	243c 0000 2416 	move.l #9238,d2
     382:	7615           	moveq #21,d3
     384:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     388:	49f9 0000 1652 	lea 1652 <PrepareDisplay>,a4
     38e:	4e94           	jsr (a4)
  if( DrawBuffer != Bitplane2) 
     390:	2039 0000 483e 	move.l 483e <DrawBuffer>,d0
     396:	b0b9 0000 4842 	cmp.l 4842 <Bitplane2>,d0
     39c:	671e           	beq.s 3bc <main+0x3b6>
    Write( Output(), "DrawBuffer should be set to Bitplane 2 on first frame.\n",
     39e:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     3a4:	4eae ffc4      	jsr -60(a6)
     3a8:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     3ae:	2200           	move.l d0,d1
     3b0:	243c 0000 242c 	move.l #9260,d2
     3b6:	7637           	moveq #55,d3
     3b8:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist2) 
     3bc:	2239 0000 483a 	move.l 483a <DrawCopper>,d1
     3c2:	b2b9 0000 484a 	cmp.l 484a <Copperlist2>,d1
     3c8:	671e           	beq.s 3e8 <main+0x3e2>
    Write( Output(), 
     3ca:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     3d0:	4eae ffc4      	jsr -60(a6)
     3d4:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     3da:	2200           	move.l d0,d1
     3dc:	243c 0000 2464 	move.l #9316,d2
     3e2:	7639           	moveq #57,d3
     3e4:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  PrepareDisplay();
     3e8:	4e94           	jsr (a4)

  if( ViewBuffer != Bitplane1) 
     3ea:	2079 0000 4836 	movea.l 4836 <ViewBuffer>,a0
     3f0:	b1f9 0000 4846 	cmpa.l 4846 <Bitplane1>,a0
     3f6:	671e           	beq.s 416 <main+0x410>
    Write( Output(), 
     3f8:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     3fe:	4eae ffc4      	jsr -60(a6)
     402:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     408:	2200           	move.l d0,d1
     40a:	243c 0000 249e 	move.l #9374,d2
     410:	7638           	moveq #56,d3
     412:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
     416:	2039 0000 482a 	move.l 482a <ViewCopper>,d0
     41c:	b0b9 0000 4852 	cmp.l 4852 <Copperlist1>,d0
     422:	671e           	beq.s 442 <main+0x43c>
    Write( Output(), 
     424:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     42a:	4eae ffc4      	jsr -60(a6)
     42e:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     434:	2200           	move.l d0,d1
     436:	243c 0000 24d7 	move.l #9431,d2
     43c:	763a           	moveq #58,d3
     43e:	4eae ffd0      	jsr -48(a6)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);


  SetBplPointers( 1, 0);
     442:	4e92           	jsr (a2)
  SwapCl();
     444:	4e93           	jsr (a3)

  //RunFrame();
  UWORD *copword = (UWORD *)ViewCopper;
     446:	2079 0000 482a 	movea.l 482a <ViewCopper>,a0
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     44c:	7000           	moveq #0,d0
     44e:	3028 0072      	move.w 114(a0),d0
     452:	4840           	swap d0
     454:	4240           	clr.w d0
     456:	7200           	moveq #0,d1
     458:	3228 0076      	move.w 118(a0),d1
     45c:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     45e:	b0b9 0000 4842 	cmp.l 4842 <Bitplane2>,d0
     464:	671e           	beq.s 484 <main+0x47e>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     466:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     46c:	4eae ffc4      	jsr -60(a6)
     470:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     476:	2200           	move.l d0,d1
     478:	243c 0000 2512 	move.l #9490,d2
     47e:	7648           	moveq #72,d3
     480:	4eae ffd0      	jsr -48(a6)
                                                   " after first frame.\n", 72);
  
  SetBplPointers( 1, 0);
     484:	4e92           	jsr (a2)
  SwapCl();
     486:	4e93           	jsr (a3)

  copword = (UWORD *) ViewCopper;
     488:	2079 0000 482a 	movea.l 482a <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     48e:	7000           	moveq #0,d0
     490:	3028 0072      	move.w 114(a0),d0
     494:	4840           	swap d0
     496:	4240           	clr.w d0
     498:	7200           	moveq #0,d1
     49a:	3228 0076      	move.w 118(a0),d1
     49e:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     4a0:	b0b9 0000 4846 	cmp.l 4846 <Bitplane1>,d0
     4a6:	671e           	beq.s 4c6 <main+0x4c0>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     4a8:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     4ae:	4eae ffc4      	jsr -60(a6)
     4b2:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     4b8:	2200           	move.l d0,d1
     4ba:	243c 0000 255b 	move.l #9563,d2
     4c0:	7649           	moveq #73,d3
     4c2:	4eae ffd0      	jsr -48(a6)
                                                  " after second frame.\n", 73);

  SetBplPointers( 1, 0);
     4c6:	4e92           	jsr (a2)
  SwapCl();
     4c8:	4e93           	jsr (a3)


  copword = (UWORD *) ViewCopper;
     4ca:	2079 0000 482a 	movea.l 482a <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     4d0:	7000           	moveq #0,d0
     4d2:	3028 0072      	move.w 114(a0),d0
     4d6:	4840           	swap d0
     4d8:	4240           	clr.w d0
     4da:	7200           	moveq #0,d1
     4dc:	3228 0076      	move.w 118(a0),d1
     4e0:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4e2:	b0b9 0000 4842 	cmp.l 4842 <Bitplane2>,d0
     4e8:	671e           	beq.s 508 <main+0x502>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4ea:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     4f0:	4eae ffc4      	jsr -60(a6)
     4f4:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     4fa:	2200           	move.l d0,d1
     4fc:	243c 0000 25a5 	move.l #9637,d2
     502:	7648           	moveq #72,d3
     504:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     508:	4eb9 0000 0da0 	jsr da0 <FreeDisplay.constprop.2>
  Counter4Frames++;
}

void TestZoomSpeed() {

  hw->dmacon = 0b1000010000000000; //Blitter nasty
     50e:	2079 0000 4824 	movea.l 4824 <hw>,a0
     514:	317c 8400 0096 	move.w #-31744,150(a0)
  Counter4Frames = 0;
     51a:	42b9 0000 4832 	clr.l 4832 <Counter4Frames>
  struct Interrupt *vbint;
                                                       
  if ( ( vbint = AllocMem( sizeof( struct Interrupt),    
     520:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
     526:	7016           	moveq #22,d0
     528:	223c 0001 0001 	move.l #65537,d1
     52e:	4eae ff3a      	jsr -198(a6)
     532:	2840           	movea.l d0,a4
     534:	4a80           	tst.l d0
     536:	671a           	beq.s 552 <main+0x54c>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    vbint->is_Node.ln_Type = NT_INTERRUPT;       
     538:	397c 02c4 0008 	move.w #708,8(a4)
    vbint->is_Node.ln_Pri = -60;
    vbint->is_Node.ln_Name = "VertB-Example";
     53e:	297c 0000 25ee 	move.l #9710,10(a4)
     544:	000a 
    vbint->is_Data = NULL;
     546:	42ac 000e      	clr.l 14(a4)
    vbint->is_Code = Vblankcounter;
     54a:	297c 0000 0f48 	move.l #3912,18(a4)
     550:	0012 
  }

  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
     552:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
     558:	203c 0001 1440 	move.l #70720,d0
     55e:	7202           	moveq #2,d1
     560:	4eae ff3a      	jsr -198(a6)
     564:	2f40 002c      	move.l d0,44(sp)
  if( source == 0) {
     568:	6700 07e6      	beq.w d50 <main+0xd4a>
    Write(  Output(), 
               "TestZoomSpeed: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
     56c:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
     572:	203c 0001 1440 	move.l #70720,d0
     578:	7202           	moveq #2,d1
     57a:	4eae ff3a      	jsr -198(a6)
     57e:	2f40 003c      	move.l d0,60(sp)
  if( destination == 0) {
     582:	6700 07f4      	beq.w d78 <main+0xd72>
     586:	202f 002c      	move.l 44(sp),d0
     58a:	0680 0000 3300 	addi.l #13056,d0
     590:	206f 002c      	movea.l 44(sp),a0
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
  for(int i=0;i<128+8;i++) {
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0x55555555;
     594:	20bc 5555 5555 	move.l #1431655765,(a0)
     59a:	217c 5555 5555 	move.l #1431655765,4(a0)
     5a0:	0004 
     5a2:	217c 5555 5555 	move.l #1431655765,8(a0)
     5a8:	0008 
     5aa:	217c 5555 5555 	move.l #1431655765,12(a0)
     5b0:	000c 
     5b2:	217c 5555 5555 	move.l #1431655765,16(a0)
     5b8:	0010 
     5ba:	217c 5555 5555 	move.l #1431655765,20(a0)
     5c0:	0014 
     5c2:	217c 5555 5555 	move.l #1431655765,24(a0)
     5c8:	0018 
     5ca:	217c 5555 5555 	move.l #1431655765,28(a0)
     5d0:	001c 
     5d2:	217c 5555 5555 	move.l #1431655765,32(a0)
     5d8:	0020 
     5da:	217c 5555 5555 	move.l #1431655765,36(a0)
     5e0:	0024 
     5e2:	217c 5555 5555 	move.l #1431655765,40(a0)
     5e8:	0028 
     5ea:	217c 5555 5555 	move.l #1431655765,44(a0)
     5f0:	002c 
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0xaaaaaaaa;
     5f2:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
     5f8:	0030 
     5fa:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
     600:	0034 
     602:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
     608:	0038 
     60a:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
     610:	003c 
     612:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
     618:	0040 
     61a:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
     620:	0044 
     622:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
     628:	0048 
     62a:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
     630:	004c 
     632:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
     638:	0050 
     63a:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
     640:	0054 
     642:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
     648:	0058 
     64a:	41e8 0060      	lea 96(a0),a0
     64e:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
     654:	fffc 
  for(int i=0;i<128+8;i++) {
     656:	b088           	cmp.l a0,d0
     658:	6600 ff3a      	bne.w 594 <main+0x58e>
  }

  WaitVbl();
     65c:	45f9 0000 1788 	lea 1788 <WaitVbl>,a2
     662:	4e92           	jsr (a2)

  return retval;
}

void Init_Blit() {
  hw->bltafwm = 0xffff;
     664:	2079 0000 4824 	movea.l 4824 <hw>,a0
     66a:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     670:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     676:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     67c:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     682:	317c 002c 0066 	move.w #44,102(a0)

  UWORD colnr = nextzoom - startofword - 1;                                                                          
  UWORD shiftb = shiftright << 12;    //SEEEEE0|12.X..f E=Empty
  UWORD shifta;
  if( shiftright == 0) {
    ZoomBlit_Increment4SrcA = 1;
     688:	33fc 0001 0000 	move.w #1,480c <ZoomBlit_Increment4SrcA>
     68e:	480c 
    shifta = 15 << 12;
  } else {
    shifta = (shiftright - 1) << 12;
  }
  WaitBlit(); 
     690:	2c79 0000 4820 	movea.l 4820 <GfxBase>,a6
     696:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     69a:	2079 0000 4824 	movea.l 4824 <hw>,a0
     6a0:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
     6a6:	317c fde4 0040 	move.w #-540,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     6ac:	317c fff8 0070 	move.w #-8,112(a0)
  Init_Blit();
  Init_ZoomBlit(322, 336, 0);
  AddIntServer(INTB_VERTB, vbint);
     6b2:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
     6b8:	7005           	moveq #5,d0
     6ba:	224c           	movea.l a4,a1
     6bc:	4eae ff58      	jsr -168(a6)
  hw->bltcon1 = 0;
}

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
  WaitBlit();
     6c0:	2c79 0000 4820 	movea.l 4820 <GfxBase>,a6
     6c6:	4eae ff1c      	jsr -228(a6)
  hw->bltafwm = 0xffff;
     6ca:	2079 0000 4824 	movea.l 4824 <hw>,a0
     6d0:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     6d6:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     6dc:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     6e2:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     6e8:	317c 002c 0066 	move.w #44,102(a0)
     6ee:	222f 002c      	move.l 44(sp),d1
     6f2:	0681 0000 06bc 	addi.l #1724,d1
     6f8:	2f41 0030      	move.l d1,48(sp)
     6fc:	307c 002c      	movea.w #44,a0
     700:	d1ef 003c      	adda.l 60(sp),a0
     704:	2f48 0034      	move.l a0,52(sp)
  while( nextzoom > 22 * 16) {
    nextzoom -= (19 + zoomnr);
    shiftright--;
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
     708:	426f 0040      	clr.w 64(sp)
  hw->bltdmod = ZMLINESIZE - 4;
     70c:	7809           	moveq #9,d4
     70e:	303c 014c      	move.w #332,d0
  UWORD startofword = 21*16;
     712:	3a7c 0150      	movea.w #336,a5
    ZoomBlit_Increment4SrcA = 1;
     716:	3c0d           	move.w a5,d6
     718:	2f4c 0042      	move.l a4,66(sp)
     71c:	2f4a 0046      	move.l a2,70(sp)
     720:	3440           	movea.w d0,a2
      shifthoriz--;
  } 

  for(int i=0;i<22;i++) {

    ZoomHorizontal = ZoomHorizontalStart;
     722:	33fc 0012 0000 	move.w #18,4828 <ZoomHorizontal>
     728:	4828 

    WORD linesleft = 272;
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
     72a:	242f 0030      	move.l 48(sp),d2
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
     72e:	262f 0034      	move.l 52(sp),d3
     732:	3a44           	movea.w d4,a5
     734:	3004           	move.w d4,d0
     736:	720c           	moveq #12,d1
     738:	e368           	lsl.w d1,d0
     73a:	3640           	movea.w d0,a3
     73c:	7000           	moveq #0,d0
     73e:	302f 0040      	move.w 64(sp),d0
     742:	2840           	movea.l d0,a4
     744:	41f4 c800      	lea (0,a4,a4.l),a0
     748:	2f48 0038      	move.l a0,56(sp)
     74c:	2c79 0000 4820 	movea.l 4820 <GfxBase>,a6
    /*UWORD size4blitsmall = ZMLINESIZE/2*ZoomHorizontal*planes;
    UWORD size4blitbig = ZMLINESIZE/2*(ZoomHorizontal+1)*planes;*/

    UWORD onestep = ZMLINESIZE/2*planes;
    
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
     752:	3006           	move.w d6,d0
     754:	304a           	movea.w a2,a0
     756:	b1c0           	cmpa.l d0,a0
     758:	6e00 03ca      	bgt.w b24 <main+0xb1e>
  WaitBlit();
     75c:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
     760:	2079 0000 4824 	movea.l 4824 <hw>,a0
     766:	47eb 09f0      	lea 2544(a3),a3
     76a:	314b 0040      	move.w a3,64(a0)
  hw->bltcon1 = 0;
     76e:	317c 0000 0042 	move.w #0,66(a0)
     774:	3239 0000 4828 	move.w 4828 <ZoomHorizontal>,d1
    WORD linesleft = 272;
     77a:	3a3c 0110      	move.w #272,d5
      Init_Copy( shiftright);
              
      while(linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
     77e:	b245           	cmp.w d5,d1
     780:	6c00 037a      	bge.w afc <main+0xaf6>
          linesleft -= ZoomHorizontal;
     784:	9a41           	sub.w d1,d5
        } else {
          ZoomHorizontal = linesleft;
          linesleft = 0;
        } 
        UWORD size4blit = ZoomHorizontal*onestep; 
     786:	3001           	move.w d1,d0
     788:	c1fc 0078      	muls.w #120,d0
     78c:	0280 0000 ffff 	andi.l #65535,d0
     792:	2240           	movea.l d0,a1
     794:	d3c0           	adda.l d0,a1
        //Add aditional line
        if( linesleft>0) {
     796:	4a45           	tst.w d5
     798:	6f3a           	ble.s 7d4 <main+0x7ce>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
     79a:	220c           	move.l a4,d1
     79c:	d280           	add.l d0,d1
     79e:	d281           	add.l d1,d1
     7a0:	d282           	add.l d2,d1
          UWORD *tmpdest = pos4dest +  size4blit;
     7a2:	2e03           	move.l d3,d7
     7a4:	de89           	add.l a1,d7
  *bp = 0;
     7a6:	4278 0200      	clr.w 200 <main+0x1fa>
			break;
	}
}

inline void WaitBlt() {
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     7aa:	3668 0002      	movea.w 2(a0),a3
     7ae:	2c40           	movea.l d0,a6
	(void)tst;
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     7b0:	3668 0002      	movea.w 2(a0),a3
     7b4:	200b           	move.l a3,d0
     7b6:	0800 000e      	btst #14,d0
     7ba:	66f4           	bne.s 7b0 <main+0x7aa>
     7bc:	200e           	move.l a6,d0
  hw->bltapt = (UWORD *) source;
     7be:	2141 0050      	move.l d1,80(a0)
  hw->bltdpt = (UWORD *) destination;
     7c2:	2147 0054      	move.l d7,84(a0)
  hw->bltsize = height*64+2;
     7c6:	317c 0142 0058 	move.w #322,88(a0)
          
          Zoom_CopyWord( tmpsource, tmpdest, planes);
          //Source doesn't change. Only forward dest
          //pos4dest += ZMLINESIZE/2;
          linesleft--;
     7cc:	5345           	subq.w #1,d5
     7ce:	3239 0000 4828 	move.w 4828 <ZoomHorizontal>,d1
        }
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     7d4:	2e2f 0038      	move.l 56(sp),d7
     7d8:	de82           	add.l d2,d7
  *bp = 0;
     7da:	4278 0200      	clr.w 200 <main+0x1fa>
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     7de:	3668 0002      	movea.w 2(a0),a3
     7e2:	2c40           	movea.l d0,a6
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     7e4:	3668 0002      	movea.w 2(a0),a3
     7e8:	200b           	move.l a3,d0
     7ea:	0800 000e      	btst #14,d0
     7ee:	66f4           	bne.s 7e4 <main+0x7de>
  hw->bltapt = (UWORD *) source;
     7f0:	2147 0050      	move.l d7,80(a0)
  hw->bltdpt = (UWORD *) destination;
     7f4:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
     7f8:	c3fc 0140      	muls.w #320,d1
     7fc:	5441           	addq.w #2,d1
     7fe:	3141 0058      	move.w d1,88(a0)
        pos4source += size4blit;
     802:	d489           	add.l a1,d2
        pos4dest += size4blit + onestep; 
     804:	327c 0078      	movea.w #120,a1
     808:	d3ce           	adda.l a6,a1
     80a:	2009           	move.l a1,d0
     80c:	d089           	add.l a1,d0
     80e:	d680           	add.l d0,d3
        
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     810:	33fc 0012 0000 	move.w #18,4828 <ZoomHorizontal>
     816:	4828 
     818:	7212           	moveq #18,d1
      while(linesleft > 0) {
     81a:	4a45           	tst.w d5
     81c:	6e00 ff60      	bgt.w 77e <main+0x778>
      if(shiftright < 0) {
        shiftright += 16;
        shifttoleft = 1;
      }
    }
    startofword -= 16;
     820:	0646 fff0      	addi.w #-16,d6
     824:	55af 0030      	subq.l #2,48(sp)
     828:	55af 0034      	subq.l #2,52(sp)
  for(int i=0;i<22;i++) {
     82c:	0c46 fff0      	cmpi.w #-16,d6
     830:	6600 fef0      	bne.w 722 <main+0x71c>
     834:	286f 0042      	movea.l 66(sp),a4
     838:	246f 0046      	movea.l 70(sp),a2
  }
               UWORD *bp = 0x202; 
  *bp = 0;
     83c:	4278 0202      	clr.w 202 <main+0x1fc>
  Zoom_ZoomIntoPicture( source, destination, 0, 5);
  RemIntServer(INTB_VERTB, vbint);
     840:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
     846:	7005           	moveq #5,d0
     848:	224c           	movea.l a4,a1
     84a:	4eae ff52      	jsr -174(a6)
  if( Counter4Frames > 7)
     84e:	7007           	moveq #7,d0
     850:	b0b9 0000 4832 	cmp.l 4832 <Counter4Frames>,d0
     856:	6c1e           	bge.s 876 <main+0x870>
    Write( Output(), "TestSpeed4Zoom: Takes too long\n", 31);
     858:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     85e:	4eae ffc4      	jsr -60(a6)
     862:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     868:	2200           	move.l d0,d1
     86a:	243c 0000 266f 	move.l #9839,d2
     870:	761f           	moveq #31,d3
     872:	4eae ffd0      	jsr -48(a6)
  FreeMem( source, ( ZMLINESIZE+4)*272*5);
     876:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
     87c:	226f 002c      	movea.l 44(sp),a1
     880:	203c 0001 1440 	move.l #70720,d0
     886:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, ( ZMLINESIZE+4)*272*5);
     88a:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
     890:	226f 003c      	movea.l 60(sp),a1
     894:	203c 0001 1440 	move.l #70720,d0
     89a:	4eae ff2e      	jsr -210(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
     89e:	267c 00f0 ff60 	movea.l #15794016,a3
     8a4:	4a93           	tst.l (a3)
     8a6:	6718           	beq.s 8c0 <main+0x8ba>
     8a8:	4878 0001      	pea 1 <_start+0x1>
     8ac:	49f9 0000 0e3e 	lea e3e <warpmode.part.0>,a4
     8b2:	4e94           	jsr (a4)
     8b4:	588f           	addq.l #4,sp
     8b6:	4a93           	tst.l (a3)
     8b8:	6706           	beq.s 8c0 <main+0x8ba>
     8ba:	42a7           	clr.l -(sp)
     8bc:	4e94           	jsr (a4)
     8be:	588f           	addq.l #4,sp
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
     8c0:	2c79 0000 4820 	movea.l 4820 <GfxBase>,a6
     8c6:	23ee 0022 0000 	move.l 34(a6),480e <ActiView>
     8cc:	480e 
	OwnBlitter();
     8ce:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     8d2:	2c79 0000 4820 	movea.l 4820 <GfxBase>,a6
     8d8:	4eae ff1c      	jsr -228(a6)
	Disable();
     8dc:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
     8e2:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
     8e6:	2679 0000 4824 	movea.l 4824 <hw>,a3
     8ec:	302b 0010      	move.w 16(a3),d0
     8f0:	33c0 0000 4812 	move.w d0,4812 <SystemADKCON>
	SystemInts=hw->intenar;
     8f6:	302b 001c      	move.w 28(a3),d0
     8fa:	33c0 0000 4816 	move.w d0,4816 <SystemInts>
	SystemDMA=hw->dmaconr;
     900:	302b 0002      	move.w 2(a3),d0
     904:	33c0 0000 4814 	move.w d0,4814 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
     90a:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     910:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
     916:	4e92           	jsr (a2)
	WaitVbl();
     918:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
     91a:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
     920:	2c79 0000 4820 	movea.l 4820 <GfxBase>,a6
     926:	93c9           	suba.l a1,a1
     928:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     92c:	2c79 0000 4820 	movea.l 4820 <GfxBase>,a6
     932:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     936:	2c79 0000 4820 	movea.l 4820 <GfxBase>,a6
     93c:	4eae fef2      	jsr -270(a6)

	WaitVbl();
     940:	4e92           	jsr (a2)
	WaitVbl();
     942:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     944:	3f7c 4e7a 004a 	move.w #20090,74(sp)
     94a:	3f7c 0801 004c 	move.w #2049,76(sp)
     950:	3f7c 4e73 004e 	move.w #20083,78(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     956:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
     95c:	082e 0000 0129 	btst #0,297(a6)
     962:	6700 03c2      	beq.w d26 <main+0xd20>
		vbr = (APTR)Supervisor((void*)getvbr);
     966:	7e4a           	moveq #74,d7
     968:	de8f           	add.l sp,d7
     96a:	cf8d           	exg d7,a5
     96c:	4eae ffe2      	jsr -30(a6)
     970:	cf8d           	exg d7,a5

	VBR=GetVBR();
     972:	23c0 0000 4818 	move.l d0,4818 <VBR.lto_priv.3>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     978:	2079 0000 4818 	movea.l 4818 <VBR.lto_priv.3>,a0
     97e:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
     982:	23c2 0000 481c 	move.l d2,481c <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
     988:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
     98a:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     98c:	2079 0000 4824 	movea.l 4824 <hw>,a0
     992:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     996:	3028 0002      	move.w 2(a0),d0
     99a:	0800 000e      	btst #14,d0
     99e:	66f6           	bne.s 996 <main+0x990>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
     9a0:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     9a6:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
     9ac:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     9b2:	2279 0000 4818 	movea.l 4818 <VBR.lto_priv.3>,a1
     9b8:	2342 006c      	move.l d2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
     9bc:	2c79 0000 4820 	movea.l 4820 <GfxBase>,a6
     9c2:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
     9c8:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
     9ce:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
     9d4:	3039 0000 4816 	move.w 4816 <SystemInts>,d0
     9da:	0040 8000      	ori.w #-32768,d0
     9de:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
     9e2:	3039 0000 4814 	move.w 4814 <SystemDMA>,d0
     9e8:	0040 8000      	ori.w #-32768,d0
     9ec:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
     9f0:	3039 0000 4812 	move.w 4812 <SystemADKCON>,d0
     9f6:	0040 8000      	ori.w #-32768,d0
     9fa:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
     9fe:	2279 0000 480e 	movea.l 480e <ActiView>,a1
     a04:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     a08:	2c79 0000 4820 	movea.l 4820 <GfxBase>,a6
     a0e:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     a12:	2c79 0000 4820 	movea.l 4820 <GfxBase>,a6
     a18:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     a1c:	2c79 0000 4820 	movea.l 4820 <GfxBase>,a6
     a22:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     a26:	2c79 0000 4820 	movea.l 4820 <GfxBase>,a6
     a2c:	4eae fe32      	jsr -462(a6)
	Enable();
     a30:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
     a36:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
     a3a:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
     a40:	2279 0000 482e 	movea.l 482e <DOSBase>,a1
     a46:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     a4a:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
     a50:	2279 0000 4820 	movea.l 4820 <GfxBase>,a1
     a56:	4eae fe62      	jsr -414(a6)
}
     a5a:	7000           	moveq #0,d0
     a5c:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
     a60:	4fef 0024      	lea 36(sp),sp
     a64:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     a66:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     a6c:	4eae ffc4      	jsr -60(a6)
     a70:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     a76:	2200           	move.l d0,d1
     a78:	243c 0000 26c6 	move.l #9926,d2
     a7e:	762c           	moveq #44,d3
     a80:	4eae ffd0      	jsr -48(a6)
     a84:	6000 f734      	bra.w 1ba <main+0x1b4>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     a88:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     a8e:	4eae ffc4      	jsr -60(a6)
     a92:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     a98:	2200           	move.l d0,d1
     a9a:	243c 0000 23d1 	move.l #9169,d2
     aa0:	7621           	moveq #33,d3
     aa2:	4eae ffd0      	jsr -48(a6)
     aa6:	2079 0000 4852 	movea.l 4852 <Copperlist1>,a0
     aac:	6000 f880      	bra.w 32e <main+0x328>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
     ab0:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     ab6:	4eae ffc4      	jsr -60(a6)
     aba:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     ac0:	2200           	move.l d0,d1
     ac2:	243c 0000 268f 	move.l #9871,d2
     ac8:	7636           	moveq #54,d3
     aca:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
     ace:	23fc 0004 0000 	move.l #262144,483e <DrawBuffer>
     ad4:	0000 483e 
  ViewBuffer = (ULONG *)0x50000;
     ad8:	23fc 0005 0000 	move.l #327680,4836 <ViewBuffer>
     ade:	0000 4836 
  SetBplPointers( 1, 0); //Sizeofplane irrevelant if only one plane
     ae2:	45f9 0000 0e12 	lea e12 <SetBplPointers.constprop.1>,a2
     ae8:	4e92           	jsr (a2)
  if( DrawBuffer != (ULONG *) 0x50000 || ViewBuffer != (ULONG *)0x40000)
     aea:	0cb9 0005 0000 	cmpi.l #327680,483e <DrawBuffer>
     af0:	0000 483e 
     af4:	6600 f79c      	bne.w 292 <main+0x28c>
     af8:	6000 01fc      	bra.w cf6 <main+0xcf0>
        UWORD size4blit = ZoomHorizontal*onestep; 
     afc:	3005           	move.w d5,d0
     afe:	c1fc 0078      	muls.w #120,d0
     b02:	0280 0000 ffff 	andi.l #65535,d0
     b08:	2240           	movea.l d0,a1
     b0a:	d3c0           	adda.l d0,a1
     b0c:	3205           	move.w d5,d1
          linesleft = 0;
     b0e:	4245           	clr.w d5
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     b10:	2e2f 0038      	move.l 56(sp),d7
     b14:	de82           	add.l d2,d7
  *bp = 0;
     b16:	4278 0200      	clr.w 200 <main+0x1fa>
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     b1a:	3668 0002      	movea.w 2(a0),a3
     b1e:	2c40           	movea.l d0,a6
     b20:	6000 fcc2      	bra.w 7e4 <main+0x7de>
  UWORD colnr = nextzoom - startofword - 1;                                                                          
     b24:	3a0a           	move.w a2,d5
     b26:	9a46           	sub.w d6,d5
     b28:	5345           	subq.w #1,d5
  if( shiftright == 0) {
     b2a:	5344           	subq.w #1,d4
     b2c:	320d           	move.w a5,d1
     b2e:	6600 014a      	bne.w c7a <main+0xc74>
    ZoomBlit_Increment4SrcA = 1;
     b32:	33fc 0001 0000 	move.w #1,480c <ZoomBlit_Increment4SrcA>
     b38:	480c 
     b3a:	3e3c fde4      	move.w #-540,d7
  WaitBlit(); 
     b3e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     b42:	2079 0000 4824 	movea.l 4824 <hw>,a0
     b48:	314b 0042      	move.w a3,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
     b4c:	3147 0040      	move.w d7,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     b50:	0285 0000 ffff 	andi.l #65535,d5
     b56:	7210           	moveq #16,d1
     b58:	9285           	sub.l d5,d1
     b5a:	7000           	moveq #0,d0
     b5c:	4640           	not.w d0
     b5e:	e3a8           	lsl.l d1,d0
     b60:	3140 0070      	move.w d0,112(a0)
      nextzoom -= (19 + zoomnr);
     b64:	45ea ffed      	lea -19(a2),a2
     b68:	3239 0000 4828 	move.w 4828 <ZoomHorizontal>,d1
    WORD linesleft = 272;
     b6e:	3a3c 0110      	move.w #272,d5
        if( linesleft >= ZoomHorizontal+1) {
     b72:	ba41           	cmp.w d1,d5
     b74:	6f00 00de      	ble.w c54 <main+0xc4e>
          linesleft -= ZoomHorizontal;
     b78:	9a41           	sub.w d1,d5
        UWORD size4blit = ZoomHorizontal*onestep;
     b7a:	3001           	move.w d1,d0
     b7c:	c1fc 0078      	muls.w #120,d0
     b80:	0280 0000 ffff 	andi.l #65535,d0
     b86:	2240           	movea.l d0,a1
     b88:	d3c0           	adda.l d0,a1
        if( linesleft>0) {
     b8a:	4a45           	tst.w d5
     b8c:	6f44           	ble.s bd2 <main+0xbcc>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
     b8e:	220c           	move.l a4,d1
     b90:	d280           	add.l d0,d1
     b92:	d281           	add.l d1,d1
     b94:	d282           	add.l d2,d1
          UWORD *tmpdest = pos4dest + size4blit;
     b96:	47f1 3800      	lea (0,a1,d3.l),a3
  *bp = 0;
     b9a:	4278 0200      	clr.w 200 <main+0x1fa>
     b9e:	3e28 0002      	move.w 2(a0),d7
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     ba2:	3e28 0002      	move.w 2(a0),d7
     ba6:	0807 000e      	btst #14,d7
     baa:	66f6           	bne.s ba2 <main+0xb9c>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
     bac:	7e00           	moveq #0,d7
     bae:	3e39 0000 480c 	move.w 480c <ZoomBlit_Increment4SrcA>,d7
     bb4:	de87           	add.l d7,d7
     bb6:	de81           	add.l d1,d7
     bb8:	2147 0050      	move.l d7,80(a0)
  hw->bltbpt = source;
     bbc:	2141 004c      	move.l d1,76(a0)
  hw->bltdpt = destination;
     bc0:	214b 0054      	move.l a3,84(a0)
  hw->bltsize = height*64+2;
     bc4:	317c 0142 0058 	move.w #322,88(a0)
          linesleft--;
     bca:	5345           	subq.w #1,d5
     bcc:	3239 0000 4828 	move.w 4828 <ZoomHorizontal>,d1
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     bd2:	266f 0038      	movea.l 56(sp),a3
     bd6:	d7c2           	adda.l d2,a3
  *bp = 0;
     bd8:	4278 0200      	clr.w 200 <main+0x1fa>
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     bdc:	3e28 0002      	move.w 2(a0),d7
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     be0:	3e28 0002      	move.w 2(a0),d7
     be4:	0807 000e      	btst #14,d7
     be8:	66f6           	bne.s be0 <main+0xbda>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
     bea:	7e00           	moveq #0,d7
     bec:	3e39 0000 480c 	move.w 480c <ZoomBlit_Increment4SrcA>,d7
     bf2:	de87           	add.l d7,d7
     bf4:	de8b           	add.l a3,d7
     bf6:	2147 0050      	move.l d7,80(a0)
  hw->bltbpt = source;
     bfa:	214b 004c      	move.l a3,76(a0)
  hw->bltdpt = destination;
     bfe:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
     c02:	c3fc 0140      	muls.w #320,d1
     c06:	5441           	addq.w #2,d1
     c08:	3141 0058      	move.w d1,88(a0)
        pos4source += size4blit;
     c0c:	d489           	add.l a1,d2
        pos4dest += size4blit + onestep;   
     c0e:	327c 0078      	movea.w #120,a1
     c12:	d3c0           	adda.l d0,a1
     c14:	2009           	move.l a1,d0
     c16:	d089           	add.l a1,d0
     c18:	d680           	add.l d0,d3
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     c1a:	33fc 0012 0000 	move.w #18,4828 <ZoomHorizontal>
     c20:	4828 
     c22:	7212           	moveq #18,d1
      while( linesleft > 0) {
     c24:	4a45           	tst.w d5
     c26:	6e00 ff4a      	bgt.w b72 <main+0xb6c>
      if(shiftright < 0) {
     c2a:	4a44           	tst.w d4
     c2c:	6c00 fbf2      	bge.w 820 <main+0x81a>
        shiftright += 16;
     c30:	380d           	move.w a5,d4
     c32:	0644 000f      	addi.w #15,d4
        shifttoleft = 1;
     c36:	3f7c 0001 0040 	move.w #1,64(sp)
    startofword -= 16;
     c3c:	0646 fff0      	addi.w #-16,d6
     c40:	55af 0030      	subq.l #2,48(sp)
     c44:	55af 0034      	subq.l #2,52(sp)
  for(int i=0;i<22;i++) {
     c48:	0c46 fff0      	cmpi.w #-16,d6
     c4c:	6600 fad4      	bne.w 722 <main+0x71c>
     c50:	6000 fbe2      	bra.w 834 <main+0x82e>
        UWORD size4blit = ZoomHorizontal*onestep;
     c54:	3005           	move.w d5,d0
     c56:	c1fc 0078      	muls.w #120,d0
     c5a:	0280 0000 ffff 	andi.l #65535,d0
     c60:	2240           	movea.l d0,a1
     c62:	d3c0           	adda.l d0,a1
     c64:	3205           	move.w d5,d1
          linesleft = 0;
     c66:	4245           	clr.w d5
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     c68:	266f 0038      	movea.l 56(sp),a3
     c6c:	d7c2           	adda.l d2,a3
  *bp = 0;
     c6e:	4278 0200      	clr.w 200 <main+0x1fa>
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     c72:	3e28 0002      	move.w 2(a0),d7
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     c76:	6000 ff68      	bra.w be0 <main+0xbda>
  ZoomBlit_Increment4SrcA = 0;
     c7a:	4279 0000 480c 	clr.w 480c <ZoomBlit_Increment4SrcA>
    shifta = (shiftright - 1) << 12;
     c80:	3e04           	move.w d4,d7
     c82:	700c           	moveq #12,d0
     c84:	e16f           	lsl.w d0,d7
     c86:	0647 0de4      	addi.w #3556,d7
  WaitBlit(); 
     c8a:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     c8e:	2079 0000 4824 	movea.l 4824 <hw>,a0
     c94:	314b 0042      	move.w a3,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
     c98:	3147 0040      	move.w d7,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     c9c:	0285 0000 ffff 	andi.l #65535,d5
     ca2:	7210           	moveq #16,d1
     ca4:	9285           	sub.l d5,d1
     ca6:	7000           	moveq #0,d0
     ca8:	4640           	not.w d0
     caa:	e3a8           	lsl.l d1,d0
     cac:	3140 0070      	move.w d0,112(a0)
      nextzoom -= (19 + zoomnr);
     cb0:	45ea ffed      	lea -19(a2),a2
     cb4:	3239 0000 4828 	move.w 4828 <ZoomHorizontal>,d1
    WORD linesleft = 272;
     cba:	3a3c 0110      	move.w #272,d5
     cbe:	6000 feb2      	bra.w b72 <main+0xb6c>
		Exit(0);
     cc2:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     cc8:	7200           	moveq #0,d1
     cca:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     cce:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
     cd4:	43f9 0000 22e0 	lea 22e0 <incbin_swfont_end+0xce>,a1
     cda:	7000           	moveq #0,d0
     cdc:	4eae fdd8      	jsr -552(a6)
     ce0:	23c0 0000 482e 	move.l d0,482e <DOSBase>
	if (!DOSBase)
     ce6:	6600 f36c      	bne.w 54 <main+0x4e>
		Exit(0);
     cea:	9dce           	suba.l a6,a6
     cec:	7200           	moveq #0,d1
     cee:	4eae ff70      	jsr -144(a6)
     cf2:	6000 f360      	bra.w 54 <main+0x4e>
     cf6:	0cb9 0004 0000 	cmpi.l #262144,4836 <ViewBuffer>
     cfc:	0000 4836 
     d00:	6700 f5ae      	beq.w 2b0 <main+0x2aa>
    Write( Output(), 
     d04:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     d0a:	4eae ffc4      	jsr -60(a6)
     d0e:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     d14:	2200           	move.l d0,d1
     d16:	243c 0000 231b 	move.l #8987,d2
     d1c:	763b           	moveq #59,d3
     d1e:	4eae ffd0      	jsr -48(a6)
     d22:	6000 f58c      	bra.w 2b0 <main+0x2aa>
	APTR vbr = 0;
     d26:	7000           	moveq #0,d0
	VBR=GetVBR();
     d28:	23c0 0000 4818 	move.l d0,4818 <VBR.lto_priv.3>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     d2e:	2079 0000 4818 	movea.l 4818 <VBR.lto_priv.3>,a0
     d34:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
     d38:	23c2 0000 481c 	move.l d2,481c <SystemIrq>
	WaitVbl();
     d3e:	4e92           	jsr (a2)
	WaitVbl();
     d40:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     d42:	2079 0000 4824 	movea.l 4824 <hw>,a0
     d48:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     d4c:	6000 fc48      	bra.w 996 <main+0x990>
    Write(  Output(), 
     d50:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     d56:	4eae ffc4      	jsr -60(a6)
     d5a:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     d60:	2200           	move.l d0,d1
     d62:	243c 0000 25fc 	move.l #9724,d2
     d68:	7639           	moveq #57,d3
     d6a:	4eae ffd0      	jsr -48(a6)
    return;
     d6e:	45f9 0000 1788 	lea 1788 <WaitVbl>,a2
     d74:	6000 fb28      	bra.w 89e <main+0x898>
    Write(  Output(), 
     d78:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     d7e:	4eae ffc4      	jsr -60(a6)
     d82:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
     d88:	2200           	move.l d0,d1
     d8a:	243c 0000 2633 	move.l #9779,d2
     d90:	763d           	moveq #61,d3
     d92:	4eae ffd0      	jsr -48(a6)
    return;
     d96:	45f9 0000 1788 	lea 1788 <WaitVbl>,a2
     d9c:	6000 fb00      	bra.w 89e <main+0x898>

00000da0 <FreeDisplay.constprop.2>:
void FreeDisplay( int clsize, int bplsize) {
     da0:	2f0e           	move.l a6,-(sp)
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
     da2:	2279 0000 4852 	movea.l 4852 <Copperlist1>,a1
     da8:	b2fc 0000      	cmpa.w #0,a1
     dac:	670e           	beq.s dbc <FreeDisplay.constprop.2+0x1c>
     dae:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
     db4:	707b           	moveq #123,d0
     db6:	4600           	not.b d0
     db8:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
     dbc:	2279 0000 484a 	movea.l 484a <Copperlist2>,a1
     dc2:	b2fc 0000      	cmpa.w #0,a1
     dc6:	670e           	beq.s dd6 <FreeDisplay.constprop.2+0x36>
     dc8:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
     dce:	707b           	moveq #123,d0
     dd0:	4600           	not.b d0
     dd2:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
     dd6:	2279 0000 4846 	movea.l 4846 <Bitplane1>,a1
     ddc:	b2fc 0000      	cmpa.w #0,a1
     de0:	6710           	beq.s df2 <FreeDisplay.constprop.2+0x52>
     de2:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
     de8:	203c 0000 c800 	move.l #51200,d0
     dee:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
     df2:	2279 0000 4842 	movea.l 4842 <Bitplane2>,a1
     df8:	b2fc 0000      	cmpa.w #0,a1
     dfc:	6710           	beq.s e0e <FreeDisplay.constprop.2+0x6e>
     dfe:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
     e04:	203c 0000 c800 	move.l #51200,d0
     e0a:	4eae ff2e      	jsr -210(a6)
}
     e0e:	2c5f           	movea.l (sp)+,a6
     e10:	4e75           	rts

00000e12 <SetBplPointers.constprop.1>:
  ULONG startofplane = DrawBuffer;
     e12:	2039 0000 483e 	move.l 483e <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper + COPBPL1HIGH;
     e18:	2079 0000 483a 	movea.l 483a <DrawCopper>,a0
    UWORD highword = startofplane >> 16;
     e1e:	2200           	move.l d0,d1
     e20:	4241           	clr.w d1
     e22:	4841           	swap d1
     e24:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = startofplane & 0xffff;
     e28:	3140 0076      	move.w d0,118(a0)
  DrawBuffer = ViewBuffer;
     e2c:	23f9 0000 4836 	move.l 4836 <ViewBuffer>,483e <DrawBuffer>
     e32:	0000 483e 
  ViewBuffer = (ULONG *) tmp;
     e36:	23c0 0000 4836 	move.l d0,4836 <ViewBuffer>
}
     e3c:	4e75           	rts

00000e3e <warpmode.part.0>:
void warpmode(int on) 
     e3e:	598f           	subq.l #4,sp
     e40:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     e42:	4aaf 000c      	tst.l 12(sp)
     e46:	674c           	beq.s e94 <warpmode.part.0+0x56>
     e48:	4878 0001      	pea 1 <_start+0x1>
     e4c:	740b           	moveq #11,d2
     e4e:	d48f           	add.l sp,d2
     e50:	2f02           	move.l d2,-(sp)
     e52:	42a7           	clr.l -(sp)
     e54:	4879 0000 2246 	pea 2246 <incbin_swfont_end+0x34>
     e5a:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc324>
     e5e:	4878 0052      	pea 52 <main+0x4c>
     e62:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec285>
     e68:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     e6c:	203c 0000 222c 	move.l #8748,d0
     e72:	4878 0001      	pea 1 <_start+0x1>
     e76:	2f02           	move.l d2,-(sp)
     e78:	42a7           	clr.l -(sp)
     e7a:	2f00           	move.l d0,-(sp)
     e7c:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc324>
     e80:	4878 0052      	pea 52 <main+0x4c>
     e84:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec285>
	}
}
     e8a:	4fef 0018      	lea 24(sp),sp
     e8e:	241f           	move.l (sp)+,d2
     e90:	588f           	addq.l #4,sp
     e92:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     e94:	4878 0001      	pea 1 <_start+0x1>
     e98:	740b           	moveq #11,d2
     e9a:	d48f           	add.l sp,d2
     e9c:	2f02           	move.l d2,-(sp)
     e9e:	42a7           	clr.l -(sp)
     ea0:	4879 0000 2250 	pea 2250 <incbin_swfont_end+0x3e>
     ea6:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc324>
     eaa:	4878 0052      	pea 52 <main+0x4c>
     eae:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec285>
     eb4:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     eb8:	203c 0000 2213 	move.l #8723,d0
     ebe:	4878 0001      	pea 1 <_start+0x1>
     ec2:	2f02           	move.l d2,-(sp)
     ec4:	42a7           	clr.l -(sp)
     ec6:	2f00           	move.l d0,-(sp)
     ec8:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc324>
     ecc:	4878 0052      	pea 52 <main+0x4c>
     ed0:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec285>
}
     ed6:	4fef 0018      	lea 24(sp),sp
     eda:	241f           	move.l (sp)+,d2
     edc:	588f           	addq.l #4,sp
     ede:	4e75           	rts

00000ee0 <KPrintF>:
{
     ee0:	4fef ff80      	lea -128(sp),sp
     ee4:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
     ee8:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeec285>
     eee:	6734           	beq.s f24 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
     ef0:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
     ef6:	206f 0090      	movea.l 144(sp),a0
     efa:	43ef 0094      	lea 148(sp),a1
     efe:	45f9 0000 1a4c 	lea 1a4c <PutChar>,a2
     f04:	47ef 000c      	lea 12(sp),a3
     f08:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
     f0c:	2f0b           	move.l a3,-(sp)
     f0e:	4878 0056      	pea 56 <main+0x50>
     f12:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec285>
     f18:	508f           	addq.l #8,sp
}
     f1a:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     f1e:	4fef 0080      	lea 128(sp),sp
     f22:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
     f24:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
     f2a:	206f 0090      	movea.l 144(sp),a0
     f2e:	43ef 0094      	lea 148(sp),a1
     f32:	45f9 0000 1a3e 	lea 1a3e <KPutCharX>,a2
     f38:	97cb           	suba.l a3,a3
     f3a:	4eae fdf6      	jsr -522(a6)
}
     f3e:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     f42:	4fef 0080      	lea 128(sp),sp
     f46:	4e75           	rts

00000f48 <Vblankcounter>:
  Counter4Frames++;
     f48:	52b9 0000 4832 	addq.l #1,4832 <Counter4Frames>
}
     f4e:	4e75           	rts

00000f50 <ClBuild>:
ULONG * ClBuild() {
     f50:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
     f54:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
     f5a:	707b           	moveq #123,d0
     f5c:	4600           	not.b d0
     f5e:	7202           	moveq #2,d1
     f60:	4eae ff3a      	jsr -198(a6)
     f64:	2440           	movea.l d0,a2
  if( retval == 0) {
     f66:	4a80           	tst.l d0
     f68:	6700 010e      	beq.w 1078 <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
     f6c:	24b9 0000 47ac 	move.l 47ac <ClsSprites>,(a2)
     f72:	2579 0000 47b0 	move.l 47b0 <ClsSprites+0x4>,4(a2)
     f78:	0004 
     f7a:	2579 0000 47b4 	move.l 47b4 <ClsSprites+0x8>,8(a2)
     f80:	0008 
     f82:	2579 0000 47b8 	move.l 47b8 <ClsSprites+0xc>,12(a2)
     f88:	000c 
     f8a:	2579 0000 47bc 	move.l 47bc <ClsSprites+0x10>,16(a2)
     f90:	0010 
     f92:	2579 0000 47c0 	move.l 47c0 <ClsSprites+0x14>,20(a2)
     f98:	0014 
     f9a:	2579 0000 47c4 	move.l 47c4 <ClsSprites+0x18>,24(a2)
     fa0:	0018 
     fa2:	2579 0000 47c8 	move.l 47c8 <ClsSprites+0x1c>,28(a2)
     fa8:	001c 
     faa:	2579 0000 47cc 	move.l 47cc <ClsSprites+0x20>,32(a2)
     fb0:	0020 
     fb2:	2579 0000 47d0 	move.l 47d0 <ClsSprites+0x24>,36(a2)
     fb8:	0024 
     fba:	2579 0000 47d4 	move.l 47d4 <ClsSprites+0x28>,40(a2)
     fc0:	0028 
     fc2:	2579 0000 47d8 	move.l 47d8 <ClsSprites+0x2c>,44(a2)
     fc8:	002c 
     fca:	2579 0000 47dc 	move.l 47dc <ClsSprites+0x30>,48(a2)
     fd0:	0030 
     fd2:	2579 0000 47e0 	move.l 47e0 <ClsSprites+0x34>,52(a2)
     fd8:	0034 
     fda:	2579 0000 47e4 	move.l 47e4 <ClsSprites+0x38>,56(a2)
     fe0:	0038 
     fe2:	2579 0000 47e8 	move.l 47e8 <ClsSprites+0x3c>,60(a2)
     fe8:	003c 
    *cl++ = *clpartinstruction++;
     fea:	2579 0000 477c 	move.l 477c <ClScreen>,64(a2)
     ff0:	0040 
     ff2:	2579 0000 4780 	move.l 4780 <ClScreen+0x4>,68(a2)
     ff8:	0044 
     ffa:	2579 0000 4784 	move.l 4784 <ClScreen+0x8>,72(a2)
    1000:	0048 
    1002:	2579 0000 4788 	move.l 4788 <ClScreen+0xc>,76(a2)
    1008:	004c 
    100a:	2579 0000 478c 	move.l 478c <ClScreen+0x10>,80(a2)
    1010:	0050 
    1012:	2579 0000 4790 	move.l 4790 <ClScreen+0x14>,84(a2)
    1018:	0054 
    101a:	2579 0000 4794 	move.l 4794 <ClScreen+0x18>,88(a2)
    1020:	0058 
    1022:	2579 0000 4798 	move.l 4798 <ClScreen+0x1c>,92(a2)
    1028:	005c 
    102a:	2579 0000 479c 	move.l 479c <ClScreen+0x20>,96(a2)
    1030:	0060 
    1032:	2579 0000 47a0 	move.l 47a0 <ClScreen+0x24>,100(a2)
    1038:	0064 
    103a:	2579 0000 47a4 	move.l 47a4 <ClScreen+0x28>,104(a2)
    1040:	0068 
    1042:	2579 0000 47a8 	move.l 47a8 <ClScreen+0x2c>,108(a2)
    1048:	006c 
  *cl++ = 0x00e00000;
    104a:	257c 00e0 0000 	move.l #14680064,112(a2)
    1050:	0070 
  *cl++ = 0x00e20000;
    1052:	257c 00e2 0000 	move.l #14811136,116(a2)
    1058:	0074 
    *cl++ = *clpartinstruction++;
    105a:	2579 0000 46fc 	move.l 46fc <ClColor>,120(a2)
    1060:	0078 
    1062:	2579 0000 4700 	move.l 4700 <ClColor+0x4>,124(a2)
    1068:	007c 
  *cl = 0xfffffffe;
    106a:	70fe           	moveq #-2,d0
    106c:	2540 0080      	move.l d0,128(a2)
}
    1070:	200a           	move.l a2,d0
    1072:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1076:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1078:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
    107e:	4eae ffc4      	jsr -60(a6)
    1082:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
    1088:	2200           	move.l d0,d1
    108a:	243c 0000 225b 	move.l #8795,d2
    1090:	7628           	moveq #40,d3
    1092:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1096:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
    109c:	7201           	moveq #1,d1
    109e:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    10a2:	24b9 0000 47ac 	move.l 47ac <ClsSprites>,(a2)
    10a8:	2579 0000 47b0 	move.l 47b0 <ClsSprites+0x4>,4(a2)
    10ae:	0004 
    10b0:	2579 0000 47b4 	move.l 47b4 <ClsSprites+0x8>,8(a2)
    10b6:	0008 
    10b8:	2579 0000 47b8 	move.l 47b8 <ClsSprites+0xc>,12(a2)
    10be:	000c 
    10c0:	2579 0000 47bc 	move.l 47bc <ClsSprites+0x10>,16(a2)
    10c6:	0010 
    10c8:	2579 0000 47c0 	move.l 47c0 <ClsSprites+0x14>,20(a2)
    10ce:	0014 
    10d0:	2579 0000 47c4 	move.l 47c4 <ClsSprites+0x18>,24(a2)
    10d6:	0018 
    10d8:	2579 0000 47c8 	move.l 47c8 <ClsSprites+0x1c>,28(a2)
    10de:	001c 
    10e0:	2579 0000 47cc 	move.l 47cc <ClsSprites+0x20>,32(a2)
    10e6:	0020 
    10e8:	2579 0000 47d0 	move.l 47d0 <ClsSprites+0x24>,36(a2)
    10ee:	0024 
    10f0:	2579 0000 47d4 	move.l 47d4 <ClsSprites+0x28>,40(a2)
    10f6:	0028 
    10f8:	2579 0000 47d8 	move.l 47d8 <ClsSprites+0x2c>,44(a2)
    10fe:	002c 
    1100:	2579 0000 47dc 	move.l 47dc <ClsSprites+0x30>,48(a2)
    1106:	0030 
    1108:	2579 0000 47e0 	move.l 47e0 <ClsSprites+0x34>,52(a2)
    110e:	0034 
    1110:	2579 0000 47e4 	move.l 47e4 <ClsSprites+0x38>,56(a2)
    1116:	0038 
    1118:	2579 0000 47e8 	move.l 47e8 <ClsSprites+0x3c>,60(a2)
    111e:	003c 
    *cl++ = *clpartinstruction++;
    1120:	2579 0000 477c 	move.l 477c <ClScreen>,64(a2)
    1126:	0040 
    1128:	2579 0000 4780 	move.l 4780 <ClScreen+0x4>,68(a2)
    112e:	0044 
    1130:	2579 0000 4784 	move.l 4784 <ClScreen+0x8>,72(a2)
    1136:	0048 
    1138:	2579 0000 4788 	move.l 4788 <ClScreen+0xc>,76(a2)
    113e:	004c 
    1140:	2579 0000 478c 	move.l 478c <ClScreen+0x10>,80(a2)
    1146:	0050 
    1148:	2579 0000 4790 	move.l 4790 <ClScreen+0x14>,84(a2)
    114e:	0054 
    1150:	2579 0000 4794 	move.l 4794 <ClScreen+0x18>,88(a2)
    1156:	0058 
    1158:	2579 0000 4798 	move.l 4798 <ClScreen+0x1c>,92(a2)
    115e:	005c 
    1160:	2579 0000 479c 	move.l 479c <ClScreen+0x20>,96(a2)
    1166:	0060 
    1168:	2579 0000 47a0 	move.l 47a0 <ClScreen+0x24>,100(a2)
    116e:	0064 
    1170:	2579 0000 47a4 	move.l 47a4 <ClScreen+0x28>,104(a2)
    1176:	0068 
    1178:	2579 0000 47a8 	move.l 47a8 <ClScreen+0x2c>,108(a2)
    117e:	006c 
  *cl++ = 0x00e00000;
    1180:	257c 00e0 0000 	move.l #14680064,112(a2)
    1186:	0070 
  *cl++ = 0x00e20000;
    1188:	257c 00e2 0000 	move.l #14811136,116(a2)
    118e:	0074 
    *cl++ = *clpartinstruction++;
    1190:	2579 0000 46fc 	move.l 46fc <ClColor>,120(a2)
    1196:	0078 
    1198:	2579 0000 4700 	move.l 4700 <ClColor+0x4>,124(a2)
    119e:	007c 
  *cl = 0xfffffffe;
    11a0:	70fe           	moveq #-2,d0
    11a2:	2540 0080      	move.l d0,128(a2)
}
    11a6:	200a           	move.l a2,d0
    11a8:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    11ac:	4e75           	rts

000011ae <ClbuildZoom>:
ULONG * ClbuildZoom() {
    11ae:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    11b2:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
    11b8:	203c 0000 a48c 	move.l #42124,d0
    11be:	7202           	moveq #2,d1
    11c0:	4eae ff3a      	jsr -198(a6)
    11c4:	2440           	movea.l d0,a2
  if( retval == 0) {
    11c6:	4a80           	tst.l d0
    11c8:	6700 0152      	beq.w 131c <ClbuildZoom+0x16e>
    *cl++ = *clpartinstruction++;
    11cc:	24b9 0000 47ac 	move.l 47ac <ClsSprites>,(a2)
    11d2:	2579 0000 47b0 	move.l 47b0 <ClsSprites+0x4>,4(a2)
    11d8:	0004 
    11da:	2579 0000 47b4 	move.l 47b4 <ClsSprites+0x8>,8(a2)
    11e0:	0008 
    11e2:	2579 0000 47b8 	move.l 47b8 <ClsSprites+0xc>,12(a2)
    11e8:	000c 
    11ea:	2579 0000 47bc 	move.l 47bc <ClsSprites+0x10>,16(a2)
    11f0:	0010 
    11f2:	2579 0000 47c0 	move.l 47c0 <ClsSprites+0x14>,20(a2)
    11f8:	0014 
    11fa:	2579 0000 47c4 	move.l 47c4 <ClsSprites+0x18>,24(a2)
    1200:	0018 
    1202:	2579 0000 47c8 	move.l 47c8 <ClsSprites+0x1c>,28(a2)
    1208:	001c 
    120a:	2579 0000 47cc 	move.l 47cc <ClsSprites+0x20>,32(a2)
    1210:	0020 
    1212:	2579 0000 47d0 	move.l 47d0 <ClsSprites+0x24>,36(a2)
    1218:	0024 
    121a:	2579 0000 47d4 	move.l 47d4 <ClsSprites+0x28>,40(a2)
    1220:	0028 
    1222:	2579 0000 47d8 	move.l 47d8 <ClsSprites+0x2c>,44(a2)
    1228:	002c 
    122a:	2579 0000 47dc 	move.l 47dc <ClsSprites+0x30>,48(a2)
    1230:	0030 
    1232:	2579 0000 47e0 	move.l 47e0 <ClsSprites+0x34>,52(a2)
    1238:	0034 
    123a:	2579 0000 47e4 	move.l 47e4 <ClsSprites+0x38>,56(a2)
    1240:	0038 
    1242:	2579 0000 47e8 	move.l 47e8 <ClsSprites+0x3c>,60(a2)
    1248:	003c 
    *cl++ = *clpartinstruction++;
    124a:	2579 0000 477c 	move.l 477c <ClScreen>,64(a2)
    1250:	0040 
    1252:	2579 0000 4780 	move.l 4780 <ClScreen+0x4>,68(a2)
    1258:	0044 
    125a:	2579 0000 4784 	move.l 4784 <ClScreen+0x8>,72(a2)
    1260:	0048 
    1262:	2579 0000 4788 	move.l 4788 <ClScreen+0xc>,76(a2)
    1268:	004c 
    126a:	2579 0000 478c 	move.l 478c <ClScreen+0x10>,80(a2)
    1270:	0050 
    1272:	2579 0000 4790 	move.l 4790 <ClScreen+0x14>,84(a2)
    1278:	0054 
    127a:	2579 0000 4794 	move.l 4794 <ClScreen+0x18>,88(a2)
    1280:	0058 
    1282:	2579 0000 4798 	move.l 4798 <ClScreen+0x1c>,92(a2)
    1288:	005c 
    128a:	2579 0000 479c 	move.l 479c <ClScreen+0x20>,96(a2)
    1290:	0060 
    1292:	2579 0000 47a0 	move.l 47a0 <ClScreen+0x24>,100(a2)
    1298:	0064 
    129a:	2579 0000 47a4 	move.l 47a4 <ClScreen+0x28>,104(a2)
    12a0:	0068 
    12a2:	2579 0000 47a8 	move.l 47a8 <ClScreen+0x2c>,108(a2)
    12a8:	006c 
  *cl++ = 0x00e00000;
    12aa:	257c 00e0 0000 	move.l #14680064,112(a2)
    12b0:	0070 
  *cl++ = 0x00e20000;
    12b2:	257c 00e2 0000 	move.l #14811136,116(a2)
    12b8:	0074 
  *cl++ = 0x00e40000;
    12ba:	257c 00e4 0000 	move.l #14942208,120(a2)
    12c0:	0078 
  *cl++ = 0x00e60000;
    12c2:	257c 00e6 0000 	move.l #15073280,124(a2)
    12c8:	007c 
  *cl++ = 0x00e80000;
    12ca:	257c 00e8 0000 	move.l #15204352,128(a2)
    12d0:	0080 
  *cl++ = 0x00ea0000;
    12d2:	257c 00ea 0000 	move.l #15335424,132(a2)
    12d8:	0084 
  *cl++ = 0x00ec0000;
    12da:	257c 00ec 0000 	move.l #15466496,136(a2)
    12e0:	0088 
  *cl++ = 0x00ee0000;
    12e2:	257c 00ee 0000 	move.l #15597568,140(a2)
    12e8:	008c 
  *cl++ = 0x00f00000;
    12ea:	257c 00f0 0000 	move.l #15728640,144(a2)
    12f0:	0090 
  *cl++ = 0x00f20000;
    12f2:	257c 00f2 0000 	move.l #15859712,148(a2)
    12f8:	0094 
  for(int i=0; i<32;i++)
    12fa:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
    12fe:	41f9 0000 46fc 	lea 46fc <ClColor>,a0
    *cl++ = *clpartinstruction++;
    1304:	22d8           	move.l (a0)+,(a1)+
  for(int i=0; i<32;i++)
    1306:	b1fc 0000 477c 	cmpa.l #18300,a0
    130c:	66f6           	bne.s 1304 <ClbuildZoom+0x156>
   *cl = 0xfffffffe;
    130e:	70fe           	moveq #-2,d0
    1310:	2540 0118      	move.l d0,280(a2)
}
    1314:	200a           	move.l a2,d0
    1316:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    131a:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    131c:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
    1322:	4eae ffc4      	jsr -60(a6)
    1326:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
    132c:	2200           	move.l d0,d1
    132e:	243c 0000 225b 	move.l #8795,d2
    1334:	7628           	moveq #40,d3
    1336:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    133a:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
    1340:	7201           	moveq #1,d1
    1342:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1346:	24b9 0000 47ac 	move.l 47ac <ClsSprites>,(a2)
    134c:	2579 0000 47b0 	move.l 47b0 <ClsSprites+0x4>,4(a2)
    1352:	0004 
    1354:	2579 0000 47b4 	move.l 47b4 <ClsSprites+0x8>,8(a2)
    135a:	0008 
    135c:	2579 0000 47b8 	move.l 47b8 <ClsSprites+0xc>,12(a2)
    1362:	000c 
    1364:	2579 0000 47bc 	move.l 47bc <ClsSprites+0x10>,16(a2)
    136a:	0010 
    136c:	2579 0000 47c0 	move.l 47c0 <ClsSprites+0x14>,20(a2)
    1372:	0014 
    1374:	2579 0000 47c4 	move.l 47c4 <ClsSprites+0x18>,24(a2)
    137a:	0018 
    137c:	2579 0000 47c8 	move.l 47c8 <ClsSprites+0x1c>,28(a2)
    1382:	001c 
    1384:	2579 0000 47cc 	move.l 47cc <ClsSprites+0x20>,32(a2)
    138a:	0020 
    138c:	2579 0000 47d0 	move.l 47d0 <ClsSprites+0x24>,36(a2)
    1392:	0024 
    1394:	2579 0000 47d4 	move.l 47d4 <ClsSprites+0x28>,40(a2)
    139a:	0028 
    139c:	2579 0000 47d8 	move.l 47d8 <ClsSprites+0x2c>,44(a2)
    13a2:	002c 
    13a4:	2579 0000 47dc 	move.l 47dc <ClsSprites+0x30>,48(a2)
    13aa:	0030 
    13ac:	2579 0000 47e0 	move.l 47e0 <ClsSprites+0x34>,52(a2)
    13b2:	0034 
    13b4:	2579 0000 47e4 	move.l 47e4 <ClsSprites+0x38>,56(a2)
    13ba:	0038 
    13bc:	2579 0000 47e8 	move.l 47e8 <ClsSprites+0x3c>,60(a2)
    13c2:	003c 
    *cl++ = *clpartinstruction++;
    13c4:	2579 0000 477c 	move.l 477c <ClScreen>,64(a2)
    13ca:	0040 
    13cc:	2579 0000 4780 	move.l 4780 <ClScreen+0x4>,68(a2)
    13d2:	0044 
    13d4:	2579 0000 4784 	move.l 4784 <ClScreen+0x8>,72(a2)
    13da:	0048 
    13dc:	2579 0000 4788 	move.l 4788 <ClScreen+0xc>,76(a2)
    13e2:	004c 
    13e4:	2579 0000 478c 	move.l 478c <ClScreen+0x10>,80(a2)
    13ea:	0050 
    13ec:	2579 0000 4790 	move.l 4790 <ClScreen+0x14>,84(a2)
    13f2:	0054 
    13f4:	2579 0000 4794 	move.l 4794 <ClScreen+0x18>,88(a2)
    13fa:	0058 
    13fc:	2579 0000 4798 	move.l 4798 <ClScreen+0x1c>,92(a2)
    1402:	005c 
    1404:	2579 0000 479c 	move.l 479c <ClScreen+0x20>,96(a2)
    140a:	0060 
    140c:	2579 0000 47a0 	move.l 47a0 <ClScreen+0x24>,100(a2)
    1412:	0064 
    1414:	2579 0000 47a4 	move.l 47a4 <ClScreen+0x28>,104(a2)
    141a:	0068 
    141c:	2579 0000 47a8 	move.l 47a8 <ClScreen+0x2c>,108(a2)
    1422:	006c 
  *cl++ = 0x00e00000;
    1424:	257c 00e0 0000 	move.l #14680064,112(a2)
    142a:	0070 
  *cl++ = 0x00e20000;
    142c:	257c 00e2 0000 	move.l #14811136,116(a2)
    1432:	0074 
  *cl++ = 0x00e40000;
    1434:	257c 00e4 0000 	move.l #14942208,120(a2)
    143a:	0078 
  *cl++ = 0x00e60000;
    143c:	257c 00e6 0000 	move.l #15073280,124(a2)
    1442:	007c 
  *cl++ = 0x00e80000;
    1444:	257c 00e8 0000 	move.l #15204352,128(a2)
    144a:	0080 
  *cl++ = 0x00ea0000;
    144c:	257c 00ea 0000 	move.l #15335424,132(a2)
    1452:	0084 
  *cl++ = 0x00ec0000;
    1454:	257c 00ec 0000 	move.l #15466496,136(a2)
    145a:	0088 
  *cl++ = 0x00ee0000;
    145c:	257c 00ee 0000 	move.l #15597568,140(a2)
    1462:	008c 
  *cl++ = 0x00f00000;
    1464:	257c 00f0 0000 	move.l #15728640,144(a2)
    146a:	0090 
  *cl++ = 0x00f20000;
    146c:	257c 00f2 0000 	move.l #15859712,148(a2)
    1472:	0094 
  for(int i=0; i<32;i++)
    1474:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
    1478:	41f9 0000 46fc 	lea 46fc <ClColor>,a0
    147e:	6000 fe84      	bra.w 1304 <ClbuildZoom+0x156>

00001482 <Zoom_InitRun>:
void Zoom_InitRun() {
    1482:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    1486:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
    148c:	7004           	moveq #4,d0
    148e:	7202           	moveq #2,d1
    1490:	4eae ff3a      	jsr -198(a6)
  ZoomHorizontal = 16;
    1494:	33fc 0010 0000 	move.w #16,4828 <ZoomHorizontal>
    149a:	4828 
  Copperlist1 = ClbuildZoom( );
    149c:	45fa fd10      	lea 11ae <ClbuildZoom>(pc),a2
    14a0:	4e92           	jsr (a2)
    14a2:	23c0 0000 4852 	move.l d0,4852 <Copperlist1>
  Copperlist2 = ClbuildZoom( );
    14a8:	4e92           	jsr (a2)
    14aa:	23c0 0000 484a 	move.l d0,484a <Copperlist2>
  Bitplane1 = AllocMem(ZMLINESIZE*270, MEMF_CHIP);
    14b0:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
    14b6:	203c 0000 32a0 	move.l #12960,d0
    14bc:	7202           	moveq #2,d1
    14be:	4eae ff3a      	jsr -198(a6)
    14c2:	23c0 0000 4846 	move.l d0,4846 <Bitplane1>
  if(Bitplane1 == 0) {
    14c8:	6700 00b0      	beq.w 157a <Zoom_InitRun+0xf8>
  DrawBuffer = Bitplane1+2;
    14cc:	5080           	addq.l #8,d0
    14ce:	23c0 0000 483e 	move.l d0,483e <DrawBuffer>
  DrawCopper = Copperlist1;
    14d4:	23f9 0000 4852 	move.l 4852 <Copperlist1>,483a <DrawCopper>
    14da:	0000 483a 
  Bitplane2 = AllocMem(ZMLINESIZE*270, MEMF_CHIP);
    14de:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
    14e4:	203c 0000 32a0 	move.l #12960,d0
    14ea:	7202           	moveq #2,d1
    14ec:	4eae ff3a      	jsr -198(a6)
    14f0:	23c0 0000 4842 	move.l d0,4842 <Bitplane2>
  if(Bitplane2 == 0) {
    14f6:	6700 00e0      	beq.w 15d8 <Zoom_InitRun+0x156>
  ViewBuffer = Bitplane2+2;
    14fa:	2440           	movea.l d0,a2
    14fc:	508a           	addq.l #8,a2
    14fe:	23ca 0000 4836 	move.l a2,4836 <ViewBuffer>
  ViewCopper = Copperlist2;
    1504:	23f9 0000 484a 	move.l 484a <Copperlist2>,482a <ViewCopper>
    150a:	0000 482a 
  for(int i=0;i<128+8;i++) {
    150e:	2400           	move.l d0,d2
    1510:	0682 0000 ff08 	addi.l #65288,d2
    1516:	47fa 0348      	lea 1860 <memset>(pc),a3
    151a:	4878 00f0      	pea f0 <main+0xea>
    151e:	4878 0055      	pea 55 <main+0x4f>
    1522:	2f0a           	move.l a2,-(sp)
    1524:	4e93           	jsr (a3)
    1526:	4878 00f0      	pea f0 <main+0xea>
    152a:	4878 00aa      	pea aa <main+0xa4>
    152e:	486a 00f0      	pea 240(a2)
    1532:	4e93           	jsr (a3)
    1534:	45ea 01e0      	lea 480(a2),a2
    1538:	4fef 0018      	lea 24(sp),sp
    153c:	b5c2           	cmpa.l d2,a2
    153e:	66da           	bne.s 151a <Zoom_InitRun+0x98>
  Zoom_LoadImage( DrawBuffer);
    1540:	2479 0000 483e 	movea.l 483e <DrawBuffer>,a2
    1546:	240a           	move.l a2,d2
    1548:	0682 0000 ff00 	addi.l #65280,d2
    154e:	4878 00f0      	pea f0 <main+0xea>
    1552:	4878 0055      	pea 55 <main+0x4f>
    1556:	2f0a           	move.l a2,-(sp)
    1558:	4e93           	jsr (a3)
    155a:	4878 00f0      	pea f0 <main+0xea>
    155e:	4878 00aa      	pea aa <main+0xa4>
    1562:	486a 00f0      	pea 240(a2)
    1566:	4e93           	jsr (a3)
    1568:	45ea 01e0      	lea 480(a2),a2
  for(int i=0;i<128+8;i++) {
    156c:	4fef 0018      	lea 24(sp),sp
    1570:	b5c2           	cmpa.l d2,a2
    1572:	66da           	bne.s 154e <Zoom_InitRun+0xcc>
}
    1574:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    1578:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    157a:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
    1580:	4eae ffc4      	jsr -60(a6)
    1584:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
    158a:	2200           	move.l d0,d1
    158c:	243c 0000 2281 	move.l #8833,d2
    1592:	7626           	moveq #38,d3
    1594:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1598:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
    159e:	7201           	moveq #1,d1
    15a0:	4eae ff70      	jsr -144(a6)
    15a4:	2039 0000 4846 	move.l 4846 <Bitplane1>,d0
  DrawBuffer = Bitplane1+2;
    15aa:	5080           	addq.l #8,d0
    15ac:	23c0 0000 483e 	move.l d0,483e <DrawBuffer>
  DrawCopper = Copperlist1;
    15b2:	23f9 0000 4852 	move.l 4852 <Copperlist1>,483a <DrawCopper>
    15b8:	0000 483a 
  Bitplane2 = AllocMem(ZMLINESIZE*270, MEMF_CHIP);
    15bc:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
    15c2:	203c 0000 32a0 	move.l #12960,d0
    15c8:	7202           	moveq #2,d1
    15ca:	4eae ff3a      	jsr -198(a6)
    15ce:	23c0 0000 4842 	move.l d0,4842 <Bitplane2>
  if(Bitplane2 == 0) {
    15d4:	6600 ff24      	bne.w 14fa <Zoom_InitRun+0x78>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    15d8:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
    15de:	4eae ffc4      	jsr -60(a6)
    15e2:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
    15e8:	2200           	move.l d0,d1
    15ea:	243c 0000 22a8 	move.l #8872,d2
    15f0:	7626           	moveq #38,d3
    15f2:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    15f6:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
    15fc:	7201           	moveq #1,d1
    15fe:	4eae ff70      	jsr -144(a6)
    1602:	2039 0000 4842 	move.l 4842 <Bitplane2>,d0
  ViewBuffer = Bitplane2+2;
    1608:	2440           	movea.l d0,a2
    160a:	508a           	addq.l #8,a2
    160c:	23ca 0000 4836 	move.l a2,4836 <ViewBuffer>
  ViewCopper = Copperlist2;
    1612:	23f9 0000 484a 	move.l 484a <Copperlist2>,482a <ViewCopper>
    1618:	0000 482a 
  for(int i=0;i<128+8;i++) {
    161c:	2400           	move.l d0,d2
    161e:	0682 0000 ff08 	addi.l #65288,d2
    1624:	47fa 023a      	lea 1860 <memset>(pc),a3
    1628:	6000 fef0      	bra.w 151a <Zoom_InitRun+0x98>

0000162c <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    162c:	2039 0000 483a 	move.l 483a <DrawCopper>,d0
  DrawCopper = ViewCopper;
    1632:	23f9 0000 482a 	move.l 482a <ViewCopper>,483a <DrawCopper>
    1638:	0000 483a 
  ViewCopper = (ULONG *)tmp;
    163c:	23c0 0000 482a 	move.l d0,482a <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    1642:	2079 0000 4824 	movea.l 4824 <hw>,a0
    1648:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    164c:	3140 0088      	move.w d0,136(a0)
}
    1650:	4e75           	rts

00001652 <PrepareDisplay>:
void PrepareDisplay() {
    1652:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClBuild( );
    1656:	45fa f8f8      	lea f50 <ClBuild>(pc),a2
    165a:	4e92           	jsr (a2)
    165c:	23c0 0000 4852 	move.l d0,4852 <Copperlist1>
  Copperlist2 = ClBuild( );
    1662:	4e92           	jsr (a2)
    1664:	23c0 0000 484a 	move.l d0,484a <Copperlist2>
  Bitplane1 = AllocMem(48*272*5, MEMF_CHIP);
    166a:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
    1670:	203c 0000 ff00 	move.l #65280,d0
    1676:	7202           	moveq #2,d1
    1678:	4eae ff3a      	jsr -198(a6)
    167c:	23c0 0000 4846 	move.l d0,4846 <Bitplane1>
  if(Bitplane1 == 0) {
    1682:	6700 00a4      	beq.w 1728 <PrepareDisplay+0xd6>
  ViewBuffer = Bitplane1;
    1686:	23c0 0000 4836 	move.l d0,4836 <ViewBuffer>
  ViewCopper = Copperlist1;
    168c:	23f9 0000 4852 	move.l 4852 <Copperlist1>,482a <ViewCopper>
    1692:	0000 482a 
  Bitplane2 = AllocMem(48*272*5, MEMF_CHIP);
    1696:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
    169c:	203c 0000 ff00 	move.l #65280,d0
    16a2:	7202           	moveq #2,d1
    16a4:	4eae ff3a      	jsr -198(a6)
    16a8:	23c0 0000 4842 	move.l d0,4842 <Bitplane2>
  if(Bitplane2 == 0) {
    16ae:	6724           	beq.s 16d4 <PrepareDisplay+0x82>
  DrawBuffer = Bitplane2;
    16b0:	23c0 0000 483e 	move.l d0,483e <DrawBuffer>
  DrawCopper = Copperlist2;
    16b6:	23f9 0000 484a 	move.l 484a <Copperlist2>,483a <DrawCopper>
    16bc:	0000 483a 
  SetBplPointers( 1, 0);
    16c0:	45fa f750      	lea e12 <SetBplPointers.constprop.1>(pc),a2
    16c4:	4e92           	jsr (a2)
  SwapCl();
    16c6:	4eba ff64      	jsr 162c <SwapCl>(pc)
  SetBplPointers( 1, 0);
    16ca:	4e92           	jsr (a2)
}
    16cc:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
  SwapCl();
    16d0:	6000 ff5a      	bra.w 162c <SwapCl>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    16d4:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
    16da:	4eae ffc4      	jsr -60(a6)
    16de:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
    16e4:	2200           	move.l d0,d1
    16e6:	243c 0000 22a8 	move.l #8872,d2
    16ec:	7626           	moveq #38,d3
    16ee:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    16f2:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
    16f8:	7201           	moveq #1,d1
    16fa:	4eae ff70      	jsr -144(a6)
    16fe:	2039 0000 4842 	move.l 4842 <Bitplane2>,d0
  DrawBuffer = Bitplane2;
    1704:	23c0 0000 483e 	move.l d0,483e <DrawBuffer>
  DrawCopper = Copperlist2;
    170a:	23f9 0000 484a 	move.l 484a <Copperlist2>,483a <DrawCopper>
    1710:	0000 483a 
  SetBplPointers( 1, 0);
    1714:	45fa f6fc      	lea e12 <SetBplPointers.constprop.1>(pc),a2
    1718:	4e92           	jsr (a2)
  SwapCl();
    171a:	4eba ff10      	jsr 162c <SwapCl>(pc)
  SetBplPointers( 1, 0);
    171e:	4e92           	jsr (a2)
}
    1720:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
  SwapCl();
    1724:	6000 ff06      	bra.w 162c <SwapCl>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    1728:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
    172e:	4eae ffc4      	jsr -60(a6)
    1732:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
    1738:	2200           	move.l d0,d1
    173a:	243c 0000 2281 	move.l #8833,d2
    1740:	7626           	moveq #38,d3
    1742:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1746:	2c79 0000 482e 	movea.l 482e <DOSBase>,a6
    174c:	7201           	moveq #1,d1
    174e:	4eae ff70      	jsr -144(a6)
    1752:	2039 0000 4846 	move.l 4846 <Bitplane1>,d0
  ViewBuffer = Bitplane1;
    1758:	23c0 0000 4836 	move.l d0,4836 <ViewBuffer>
  ViewCopper = Copperlist1;
    175e:	23f9 0000 4852 	move.l 4852 <Copperlist1>,482a <ViewCopper>
    1764:	0000 482a 
  Bitplane2 = AllocMem(48*272*5, MEMF_CHIP);
    1768:	2c79 0000 484e 	movea.l 484e <SysBase>,a6
    176e:	203c 0000 ff00 	move.l #65280,d0
    1774:	7202           	moveq #2,d1
    1776:	4eae ff3a      	jsr -198(a6)
    177a:	23c0 0000 4842 	move.l d0,4842 <Bitplane2>
  if(Bitplane2 == 0) {
    1780:	6600 ff2e      	bne.w 16b0 <PrepareDisplay+0x5e>
    1784:	6000 ff4e      	bra.w 16d4 <PrepareDisplay+0x82>

00001788 <WaitVbl>:
void WaitVbl() {
    1788:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    178a:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddb329>,d0
    1790:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    1792:	2017           	move.l (sp),d0
    1794:	0280 0001 ff00 	andi.l #130816,d0
    179a:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    179c:	2017           	move.l (sp),d0
    179e:	0c80 0001 3700 	cmpi.l #79616,d0
    17a4:	67e4           	beq.s 178a <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    17a6:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddb329>,d0
    17ac:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    17b0:	202f 0004      	move.l 4(sp),d0
    17b4:	0280 0001 ff00 	andi.l #130816,d0
    17ba:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    17be:	202f 0004      	move.l 4(sp),d0
    17c2:	0c80 0001 3700 	cmpi.l #79616,d0
    17c8:	66dc           	bne.s 17a6 <WaitVbl+0x1e>
}
    17ca:	508f           	addq.l #8,sp
    17cc:	4e75           	rts

000017ce <memcpy>:
{
    17ce:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    17d2:	202f 0014      	move.l 20(sp),d0
    17d6:	226f 0018      	movea.l 24(sp),a1
    17da:	222f 001c      	move.l 28(sp),d1
	while(len--)
    17de:	2601           	move.l d1,d3
    17e0:	5383           	subq.l #1,d3
    17e2:	4a81           	tst.l d1
    17e4:	6762           	beq.s 1848 <memcpy+0x7a>
    17e6:	2040           	movea.l d0,a0
    17e8:	5888           	addq.l #4,a0
    17ea:	b1c9           	cmpa.l a1,a0
    17ec:	53c2           	sl.s d2
    17ee:	4402           	neg.b d2
    17f0:	41e9 0004      	lea 4(a1),a0
    17f4:	b1c0           	cmpa.l d0,a0
    17f6:	53c4           	sl.s d4
    17f8:	4404           	neg.b d4
    17fa:	8404           	or.b d4,d2
    17fc:	7808           	moveq #8,d4
    17fe:	b883           	cmp.l d3,d4
    1800:	55c4           	sc.s d4
    1802:	4404           	neg.b d4
    1804:	c404           	and.b d4,d2
    1806:	6746           	beq.s 184e <memcpy+0x80>
    1808:	2409           	move.l a1,d2
    180a:	8480           	or.l d0,d2
    180c:	7803           	moveq #3,d4
    180e:	c484           	and.l d4,d2
    1810:	663c           	bne.s 184e <memcpy+0x80>
    1812:	2049           	movea.l a1,a0
    1814:	2440           	movea.l d0,a2
    1816:	74fc           	moveq #-4,d2
    1818:	c481           	and.l d1,d2
    181a:	d489           	add.l a1,d2
		*d++ = *s++;
    181c:	24d8           	move.l (a0)+,(a2)+
    181e:	b488           	cmp.l a0,d2
    1820:	66fa           	bne.s 181c <memcpy+0x4e>
    1822:	74fc           	moveq #-4,d2
    1824:	c481           	and.l d1,d2
    1826:	2040           	movea.l d0,a0
    1828:	d1c2           	adda.l d2,a0
    182a:	d3c2           	adda.l d2,a1
    182c:	9682           	sub.l d2,d3
    182e:	b481           	cmp.l d1,d2
    1830:	6716           	beq.s 1848 <memcpy+0x7a>
    1832:	1091           	move.b (a1),(a0)
	while(len--)
    1834:	4a83           	tst.l d3
    1836:	6710           	beq.s 1848 <memcpy+0x7a>
		*d++ = *s++;
    1838:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    183e:	5383           	subq.l #1,d3
    1840:	6706           	beq.s 1848 <memcpy+0x7a>
		*d++ = *s++;
    1842:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    1848:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    184c:	4e75           	rts
    184e:	2040           	movea.l d0,a0
    1850:	d289           	add.l a1,d1
		*d++ = *s++;
    1852:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    1854:	b289           	cmp.l a1,d1
    1856:	67f0           	beq.s 1848 <memcpy+0x7a>
		*d++ = *s++;
    1858:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    185a:	b289           	cmp.l a1,d1
    185c:	66f4           	bne.s 1852 <memcpy+0x84>
    185e:	60e8           	bra.s 1848 <memcpy+0x7a>

00001860 <memset>:
{
    1860:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    1864:	202f 0024      	move.l 36(sp),d0
    1868:	2a2f 0028      	move.l 40(sp),d5
    186c:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    1870:	2809           	move.l a1,d4
    1872:	5384           	subq.l #1,d4
    1874:	b2fc 0000      	cmpa.w #0,a1
    1878:	6f00 00b0      	ble.w 192a <memset+0xca>
    187c:	1e05           	move.b d5,d7
    187e:	2200           	move.l d0,d1
    1880:	4481           	neg.l d1
    1882:	7403           	moveq #3,d2
    1884:	c282           	and.l d2,d1
    1886:	7c05           	moveq #5,d6
		*ptr++ = val;
    1888:	2440           	movea.l d0,a2
    188a:	bc84           	cmp.l d4,d6
    188c:	646a           	bcc.s 18f8 <memset+0x98>
    188e:	4a81           	tst.l d1
    1890:	6724           	beq.s 18b6 <memset+0x56>
    1892:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    1894:	5384           	subq.l #1,d4
    1896:	7401           	moveq #1,d2
    1898:	b481           	cmp.l d1,d2
    189a:	671a           	beq.s 18b6 <memset+0x56>
		*ptr++ = val;
    189c:	2440           	movea.l d0,a2
    189e:	548a           	addq.l #2,a2
    18a0:	2040           	movea.l d0,a0
    18a2:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    18a6:	5384           	subq.l #1,d4
    18a8:	7403           	moveq #3,d2
    18aa:	b481           	cmp.l d1,d2
    18ac:	6608           	bne.s 18b6 <memset+0x56>
		*ptr++ = val;
    18ae:	528a           	addq.l #1,a2
    18b0:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    18b4:	5384           	subq.l #1,d4
    18b6:	2609           	move.l a1,d3
    18b8:	9681           	sub.l d1,d3
    18ba:	7c00           	moveq #0,d6
    18bc:	1c05           	move.b d5,d6
    18be:	2406           	move.l d6,d2
    18c0:	4842           	swap d2
    18c2:	4242           	clr.w d2
    18c4:	2042           	movea.l d2,a0
    18c6:	2406           	move.l d6,d2
    18c8:	e14a           	lsl.w #8,d2
    18ca:	4842           	swap d2
    18cc:	4242           	clr.w d2
    18ce:	e18e           	lsl.l #8,d6
    18d0:	2646           	movea.l d6,a3
    18d2:	2c08           	move.l a0,d6
    18d4:	8486           	or.l d6,d2
    18d6:	2c0b           	move.l a3,d6
    18d8:	8486           	or.l d6,d2
    18da:	1407           	move.b d7,d2
    18dc:	2040           	movea.l d0,a0
    18de:	d1c1           	adda.l d1,a0
    18e0:	72fc           	moveq #-4,d1
    18e2:	c283           	and.l d3,d1
    18e4:	d288           	add.l a0,d1
		*ptr++ = val;
    18e6:	20c2           	move.l d2,(a0)+
    18e8:	b1c1           	cmpa.l d1,a0
    18ea:	66fa           	bne.s 18e6 <memset+0x86>
    18ec:	72fc           	moveq #-4,d1
    18ee:	c283           	and.l d3,d1
    18f0:	d5c1           	adda.l d1,a2
    18f2:	9881           	sub.l d1,d4
    18f4:	b283           	cmp.l d3,d1
    18f6:	6732           	beq.s 192a <memset+0xca>
    18f8:	1485           	move.b d5,(a2)
	while(len-- > 0)
    18fa:	4a84           	tst.l d4
    18fc:	6f2c           	ble.s 192a <memset+0xca>
		*ptr++ = val;
    18fe:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    1902:	7201           	moveq #1,d1
    1904:	b284           	cmp.l d4,d1
    1906:	6c22           	bge.s 192a <memset+0xca>
		*ptr++ = val;
    1908:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    190c:	7402           	moveq #2,d2
    190e:	b484           	cmp.l d4,d2
    1910:	6c18           	bge.s 192a <memset+0xca>
		*ptr++ = val;
    1912:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    1916:	7c03           	moveq #3,d6
    1918:	bc84           	cmp.l d4,d6
    191a:	6c0e           	bge.s 192a <memset+0xca>
		*ptr++ = val;
    191c:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    1920:	7204           	moveq #4,d1
    1922:	b284           	cmp.l d4,d1
    1924:	6c04           	bge.s 192a <memset+0xca>
		*ptr++ = val;
    1926:	1545 0005      	move.b d5,5(a2)
}
    192a:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    192e:	4e75           	rts

00001930 <strlen>:
{
    1930:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    1934:	7000           	moveq #0,d0
	while(*s++)
    1936:	4a10           	tst.b (a0)
    1938:	6708           	beq.s 1942 <strlen+0x12>
		t++;
    193a:	5280           	addq.l #1,d0
	while(*s++)
    193c:	4a30 0800      	tst.b (0,a0,d0.l)
    1940:	66f8           	bne.s 193a <strlen+0xa>
}
    1942:	4e75           	rts

00001944 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    1944:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    1948:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    194c:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    1950:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    1954:	d041           	add.w d1,d0
	swap	d0
    1956:	4840           	swap d0
	clrw	d0
    1958:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    195a:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    195e:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    1962:	d081           	add.l d1,d0

	rts
    1964:	4e75           	rts

00001966 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    1966:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    1968:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    196c:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    1970:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    1976:	6416           	bcc.s 198e <__udivsi3+0x28>
	movel	d0, d2
    1978:	2400           	move.l d0,d2
	clrw	d2
    197a:	4242           	clr.w d2
	swap	d2
    197c:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    197e:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    1980:	3002           	move.w d2,d0
	swap	d0
    1982:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    1984:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    1988:	84c1           	divu.w d1,d2
	movew	d2, d0
    198a:	3002           	move.w d2,d0
	jra	6f
    198c:	6030           	bra.s 19be <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    198e:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    1990:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    1992:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    1994:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    199a:	64f4           	bcc.s 1990 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    199c:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    199e:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    19a4:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    19a6:	c2c0           	mulu.w d0,d1
	swap	d2
    19a8:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    19aa:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    19ac:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    19ae:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    19b0:	660a           	bne.s 19bc <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    19b2:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    19b4:	6506           	bcs.s 19bc <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    19b6:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    19ba:	6302           	bls.s 19be <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    19bc:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    19be:	241f           	move.l (sp)+,d2
	rts
    19c0:	4e75           	rts

000019c2 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    19c2:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    19c4:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    19c6:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    19ca:	6a04           	bpl.s 19d0 <__divsi3+0xe>
	negl	d1
    19cc:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    19ce:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    19d0:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    19d4:	6a04           	bpl.s 19da <__divsi3+0x18>
	negl	d0
    19d6:	4480           	neg.l d0
	negb	d2
    19d8:	4402           	neg.b d2

2:	movel	d1, sp@-
    19da:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    19dc:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    19de:	6186           	bsr.s 1966 <__udivsi3>
	addql	IMM (8), sp
    19e0:	508f           	addq.l #8,sp

	tstb	d2
    19e2:	4a02           	tst.b d2
	jpl	3f
    19e4:	6a02           	bpl.s 19e8 <__divsi3+0x26>
	negl	d0
    19e6:	4480           	neg.l d0

3:	movel	sp@+, d2
    19e8:	241f           	move.l (sp)+,d2
	rts
    19ea:	4e75           	rts

000019ec <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    19ec:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    19f0:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    19f4:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    19f6:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    19f8:	61c8           	bsr.s 19c2 <__divsi3>
	addql	IMM (8), sp
    19fa:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    19fc:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    1a00:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1a02:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    1a04:	6100 ff3e      	bsr.w 1944 <__mulsi3>
	addql	IMM (8), sp
    1a08:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    1a0a:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    1a0e:	9280           	sub.l d0,d1
	movel	d1, d0
    1a10:	2001           	move.l d1,d0
	rts
    1a12:	4e75           	rts

00001a14 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    1a14:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    1a18:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    1a1c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1a1e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    1a20:	6100 ff44      	bsr.w 1966 <__udivsi3>
	addql	IMM (8), sp
    1a24:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    1a26:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    1a2a:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1a2c:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    1a2e:	6100 ff14      	bsr.w 1944 <__mulsi3>
	addql	IMM (8), sp
    1a32:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    1a34:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    1a38:	9280           	sub.l d0,d1
	movel	d1, d0
    1a3a:	2001           	move.l d1,d0
	rts
    1a3c:	4e75           	rts

00001a3e <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    1a3e:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    1a40:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    1a44:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    1a48:	2c5f           	movea.l (sp)+,a6
    rts
    1a4a:	4e75           	rts

00001a4c <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    1a4c:	16c0           	move.b d0,(a3)+
	rts
    1a4e:	4e75           	rts

00001a50 <saveregs>:
	...

00001a8c <font2distance>:
    1a8c:	0505           	btst d2,d5
    1a8e:	0505           	btst d2,d5
    1a90:	0505           	btst d2,d5
    1a92:	0505           	btst d2,d5
    1a94:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    1a96:	0505           	btst d2,d5
    1a98:	0505           	btst d2,d5
    1a9a:	0005 0505      	ori.b #5,d5
    1a9e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    1aa0:	0505           	btst d2,d5
    1aa2:	0505           	btst d2,d5
    1aa4:	0505           	btst d2,d5
    1aa6:	0505           	btst d2,d5
    1aa8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    1aaa:	0505           	btst d2,d5
    1aac:	0505           	btst d2,d5
    1aae:	0505           	btst d2,d5
    1ab0:	0505           	btst d2,d5
    1ab2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    1ab4:	0500           	btst d2,d0
    1ab6:	0505           	btst d2,d5
    1ab8:	0505           	btst d2,d5
    1aba:	0505           	btst d2,d5
    1abc:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    1abe:	0505           	btst d2,d5
    1ac0:	0505           	btst d2,d5
    1ac2:	0505           	btst d2,d5
    1ac4:	0505           	btst d2,d5
    1ac6:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    1ac8:	0505           	btst d2,d5
    1aca:	0505           	btst d2,d5
    1acc:	0503           	btst d2,d3
    1ace:	0505           	btst d2,d5
    1ad0:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    1ad2:	0505           	btst d2,d5
    1ad4:	0500           	btst d2,d0
    1ad6:	0505           	btst d2,d5
    1ad8:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    1adc:	0505           	btst d2,d5
    1ade:	0503           	btst d2,d3
    1ae0:	0205 0507      	andi.b #7,d5
    1ae4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    1ae6:	0505           	btst d2,d5
    1ae8:	0505           	btst d2,d5
    1aea:	0505           	btst d2,d5
    1aec:	0505           	btst d2,d5
    1aee:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1af0:	0505           	btst d2,d5
    1af2:	0505           	btst d2,d5
    1af4:	0505           	btst d2,d5
    1af6:	0505           	btst d2,d5
    1af8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1afa:	0505           	btst d2,d5
    1afc:	0505           	btst d2,d5
    1afe:	0505           	btst d2,d5
    1b00:	0505           	btst d2,d5
    1b02:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1b04:	0505           	btst d2,d5
    1b06:	0505           	btst d2,d5
    1b08:	0505           	btst d2,d5
    1b0a:	0505           	btst d2,d5
    1b0c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1b0e:	0505           	btst d2,d5
    1b10:	0505           	btst d2,d5
    1b12:	0505           	btst d2,d5
    1b14:	0505           	btst d2,d5
    1b16:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1b18:	0505           	btst d2,d5
    1b1a:	0505           	btst d2,d5
    1b1c:	0505           	btst d2,d5
    1b1e:	0505           	btst d2,d5
    1b20:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1b22:	0505           	btst d2,d5
    1b24:	0505           	btst d2,d5
    1b26:	0505           	btst d2,d5
    1b28:	0505           	btst d2,d5
    1b2a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1b2c:	0505           	btst d2,d5
    1b2e:	0505           	btst d2,d5
    1b30:	0505           	btst d2,d5
    1b32:	0505           	btst d2,d5
    1b34:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1b36:	0505           	btst d2,d5
    1b38:	0505           	btst d2,d5
    1b3a:	0505           	btst d2,d5
    1b3c:	0505           	btst d2,d5
    1b3e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1b40:	0505           	btst d2,d5
    1b42:	0505           	btst d2,d5
    1b44:	0505           	btst d2,d5
    1b46:	0505           	btst d2,d5
    1b48:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1b4a:	0505           	btst d2,d5
    1b4c:	0505           	btst d2,d5
    1b4e:	0505           	btst d2,d5
    1b50:	0505           	btst d2,d5
    1b52:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1b54:	0505           	btst d2,d5
    1b56:	0505           	btst d2,d5
    1b58:	0505           	btst d2,d5
    1b5a:	0505           	btst d2,d5
    1b5c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1b5e:	0505           	btst d2,d5
    1b60:	0505           	btst d2,d5
    1b62:	0505           	btst d2,d5
    1b64:	0505           	btst d2,d5
    1b66:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1b68:	0505           	btst d2,d5
    1b6a:	0505           	btst d2,d5
    1b6c:	0505           	btst d2,d5
    1b6e:	0505           	btst d2,d5
    1b70:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1b72:	0505           	btst d2,d5
    1b74:	0505           	btst d2,d5
    1b76:	0505           	btst d2,d5
    1b78:	0505           	btst d2,d5
    1b7a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1b7c:	0505           	btst d2,d5
    1b7e:	0505           	btst d2,d5
    1b80:	0505           	btst d2,d5
    1b82:	0505           	btst d2,d5
    1b84:	0505           	btst d2,d5

00001b86 <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    1b86:	16c0           	move.b d0,(a3)+
  RTS
    1b88:	4e75           	rts

00001b8a <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    1b8a:	48f9 7fff 0000 	movem.l d0-a6,1a50 <saveregs>
    1b90:	1a50 
  lea 0xdff000,a5
    1b92:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddb325>,a5
  move.l sp@(4),a0  //Fontlocation
    1b98:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    1b9c:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    1ba0:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    1ba4:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    1ba6:	082d 0006 0002 	btst #6,2(a5)

00001bac <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    1bac:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    1bb2:	66f8           	bne.s 1bac <st2wblit>

00001bb4 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    1bb4:	7019           	moveq #25,d0
	sub.l d5,d5      
    1bb6:	9a85           	sub.l d5,d5

00001bb8 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    1bb8:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    1bba:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    1bbc:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    1bc0:	9dce           	suba.l a6,a6
	move.l d2, a6
    1bc2:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    1bc4:	ddfc 0000 1a8c 	adda.l #6796,a6

	LSL  	#4,d2 	    //Fetch next char
    1bca:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    1bcc:	2842           	movea.l d2,a4


	move.l  #0,d4
    1bce:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    1bd0:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    1bd2:	3814           	move.w (a4),d4
	swap	d4
    1bd4:	4844           	swap d4
	lsr.l	d5, d4
    1bd6:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    1bd8:	8993           	or.l d4,(a3)
	clr.l	d4
    1bda:	4284           	clr.l d4
	move.w  2(a4), d4
    1bdc:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    1be0:	4844           	swap d4
	lsr.l	d5, d4
    1be2:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    1be4:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    1be8:	4284           	clr.l d4
	move.w  4(a4), d4
    1bea:	382c 0004      	move.w 4(a4),d4
	swap	d4
    1bee:	4844           	swap d4
	lsr.l	d5, d4
    1bf0:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    1bf2:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    1bf6:	4284           	clr.l d4
	move.w  6(a4), d4
    1bf8:	382c 0006      	move.w 6(a4),d4
	swap	d4
    1bfc:	4844           	swap d4
	lsr.l	d5, d4
    1bfe:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    1c00:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    1c04:	4284           	clr.l d4
	move.w  8(a4), d4
    1c06:	382c 0008      	move.w 8(a4),d4
	swap	d4
    1c0a:	4844           	swap d4
	lsr.l	d5, d4
    1c0c:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    1c0e:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    1c12:	4284           	clr.l d4
	move.w  10(a4), d4
    1c14:	382c 000a      	move.w 10(a4),d4
	swap	d4
    1c18:	4844           	swap d4
	lsr.l	d5, d4
    1c1a:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    1c1c:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    1c20:	4284           	clr.l d4
	move.w  12(a4), d4
    1c22:	382c 000c      	move.w 12(a4),d4
	swap	d4
    1c26:	4844           	swap d4
	lsr.l	d5, d4
    1c28:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    1c2a:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    1c2e:	4284           	clr.l d4
	move.w  14(a4), d4
    1c30:	382c 000e      	move.w 14(a4),d4
	swap	d4
    1c34:	4844           	swap d4
	lsr.l	d5, d4
    1c36:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    1c38:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    1c3c:	4284           	clr.l d4

	add.b   (a6), d5
    1c3e:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    1c40:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    1c44:	6500 0006      	bcs.w 1c4c <noadditionalchar>
	addq.w  #1, a3
    1c48:	524b           	addq.w #1,a3
	sub.w   #8,d5
    1c4a:	5145           	subq.w #8,d5

00001c4c <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    1c4c:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    1c4e:	51c8 ff68      	dbf d0,1bb8 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    1c52:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    1c56:	51cb ff5c      	dbf d3,1bb4 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    1c5a:	4cfa 7fff fdf2 	movem.l 1a50 <saveregs>(pc),d0-a6

	RTS
    1c60:	4e75           	rts
