
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
       6:	4e55 ff70      	link.w a5,#-144
       a:	48e7 3f3a      	movem.l d2-d7/a2-a4/a6,-(sp)

  SysBase = *((struct ExecBase**)4UL);
       e:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      12:	23ce 0000 70a0 	move.l a6,70a0 <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,7072 <hw>
      1e:	0000 7072 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 4615 	lea 4615 <incbin_swfont_end+0x113>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 7076 	move.l d0,7076 <GfxBase>
	if (!GfxBase)
      34:	6700 2752      	beq.w 2788 <main+0x2782>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
      3e:	43f9 0000 4626 	lea 4626 <incbin_swfont_end+0x124>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 709c 	move.l d0,709c <DOSBase>
	if (!DOSBase)
      50:	6700 272a      	beq.w 277c <main+0x2776>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 4632 	pea 4632 <incbin_swfont_end+0x130>
      5a:	4eb9 0000 29bc 	jsr 29bc <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 464e 	move.l #17998,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      7e:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
      84:	4eae ffc4      	jsr -60(a6)
      88:	2079 0000 7072 	movea.l 7072 <hw>,a0
      8e:	2628 0080      	move.l 128(a0),d3
      92:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
      98:	2200           	move.l d0,d1
      9a:	243c 0000 465e 	move.l #18014,d2
      a0:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      a4:	47f9 0000 2d2e 	lea 2d2e <ClBuild>,a3
      aa:	4e93           	jsr (a3)
      ac:	2440           	movea.l d0,a2
      ae:	23c0 0000 7098 	move.l d0,7098 <Copperlist1>
  DrawCopper = Copperlist1;
      b4:	23c0 0000 7088 	move.l d0,7088 <DrawCopper>
  Copperlist2 = ClBuild();
      ba:	4e93           	jsr (a3)
      bc:	23c0 0000 7094 	move.l d0,7094 <Copperlist2>
  ViewCopper = Copperlist2;
      c2:	23c0 0000 707c 	move.l d0,707c <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      c8:	588f           	addq.l #4,sp
      ca:	2012           	move.l (a2),d0
      cc:	b0b9 0000 6fdc 	cmp.l 6fdc <ClsSprites>,d0
      d2:	6600 25dc      	bne.w 26b0 <main+0x26aa>
      d6:	2079 0000 6fe0 	movea.l 6fe0 <ClsSprites+0x4>,a0
      dc:	b1ea 0004      	cmpa.l 4(a2),a0
      e0:	6600 25ce      	bne.w 26b0 <main+0x26aa>
      e4:	2039 0000 6fe4 	move.l 6fe4 <ClsSprites+0x8>,d0
      ea:	b0aa 0008      	cmp.l 8(a2),d0
      ee:	6600 25c0      	bne.w 26b0 <main+0x26aa>
      f2:	2079 0000 6fe8 	movea.l 6fe8 <ClsSprites+0xc>,a0
      f8:	b1ea 000c      	cmpa.l 12(a2),a0
      fc:	6600 25b2      	bne.w 26b0 <main+0x26aa>
     100:	2039 0000 6fec 	move.l 6fec <ClsSprites+0x10>,d0
     106:	b0aa 0010      	cmp.l 16(a2),d0
     10a:	6600 25a4      	bne.w 26b0 <main+0x26aa>
     10e:	2079 0000 6ff0 	movea.l 6ff0 <ClsSprites+0x14>,a0
     114:	b1ea 0014      	cmpa.l 20(a2),a0
     118:	6600 2596      	bne.w 26b0 <main+0x26aa>
     11c:	2039 0000 6ff4 	move.l 6ff4 <ClsSprites+0x18>,d0
     122:	b0aa 0018      	cmp.l 24(a2),d0
     126:	6600 2588      	bne.w 26b0 <main+0x26aa>
     12a:	2079 0000 6ff8 	movea.l 6ff8 <ClsSprites+0x1c>,a0
     130:	b1ea 001c      	cmpa.l 28(a2),a0
     134:	6600 257a      	bne.w 26b0 <main+0x26aa>
     138:	2039 0000 6ffc 	move.l 6ffc <ClsSprites+0x20>,d0
     13e:	b0aa 0020      	cmp.l 32(a2),d0
     142:	6600 256c      	bne.w 26b0 <main+0x26aa>
     146:	2079 0000 7000 	movea.l 7000 <ClsSprites+0x24>,a0
     14c:	b1ea 0024      	cmpa.l 36(a2),a0
     150:	6600 255e      	bne.w 26b0 <main+0x26aa>
     154:	2039 0000 7004 	move.l 7004 <ClsSprites+0x28>,d0
     15a:	b0aa 0028      	cmp.l 40(a2),d0
     15e:	6600 2550      	bne.w 26b0 <main+0x26aa>
     162:	2079 0000 7008 	movea.l 7008 <ClsSprites+0x2c>,a0
     168:	b1ea 002c      	cmpa.l 44(a2),a0
     16c:	6600 2542      	bne.w 26b0 <main+0x26aa>
     170:	202a 0030      	move.l 48(a2),d0
     174:	b0b9 0000 700c 	cmp.l 700c <ClsSprites+0x30>,d0
     17a:	6600 2534      	bne.w 26b0 <main+0x26aa>
     17e:	2079 0000 7010 	movea.l 7010 <ClsSprites+0x34>,a0
     184:	b1ea 0034      	cmpa.l 52(a2),a0
     188:	6600 2526      	bne.w 26b0 <main+0x26aa>
     18c:	2039 0000 7014 	move.l 7014 <ClsSprites+0x38>,d0
     192:	b0aa 0038      	cmp.l 56(a2),d0
     196:	6600 2518      	bne.w 26b0 <main+0x26aa>
     19a:	246a 003c      	movea.l 60(a2),a2
     19e:	b5f9 0000 7018 	cmpa.l 7018 <ClsSprites+0x3c>,a2
     1a4:	6600 250a      	bne.w 26b0 <main+0x26aa>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1a8:	2079 0000 7098 	movea.l 7098 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ae:	2039 0000 6fac 	move.l 6fac <ClScreen>,d0
     1b4:	b0a8 0040      	cmp.l 64(a0),d0
     1b8:	6600 2540      	bne.w 26fa <main+0x26f4>
     1bc:	2039 0000 6fb0 	move.l 6fb0 <ClScreen+0x4>,d0
     1c2:	b0a8 0044      	cmp.l 68(a0),d0
     1c6:	6600 2532      	bne.w 26fa <main+0x26f4>
     1ca:	2039 0000 6fb4 	move.l 6fb4 <ClScreen+0x8>,d0
     1d0:	b0a8 0048      	cmp.l 72(a0),d0
     1d4:	6600 2524      	bne.w 26fa <main+0x26f4>
     1d8:	2039 0000 6fb8 	move.l 6fb8 <ClScreen+0xc>,d0
     1de:	b0a8 004c      	cmp.l 76(a0),d0
     1e2:	6600 2516      	bne.w 26fa <main+0x26f4>
     1e6:	2039 0000 6fbc 	move.l 6fbc <ClScreen+0x10>,d0
     1ec:	b0a8 0050      	cmp.l 80(a0),d0
     1f0:	6600 2508      	bne.w 26fa <main+0x26f4>
     1f4:	2039 0000 6fc0 	move.l 6fc0 <ClScreen+0x14>,d0
     1fa:	b0a8 0054      	cmp.l 84(a0),d0
     1fe:	6600 24fa      	bne.w 26fa <main+0x26f4>
     202:	2039 0000 6fc4 	move.l 6fc4 <ClScreen+0x18>,d0
     208:	b0a8 0058      	cmp.l 88(a0),d0
     20c:	6600 24ec      	bne.w 26fa <main+0x26f4>
     210:	2039 0000 6fc8 	move.l 6fc8 <ClScreen+0x1c>,d0
     216:	b0a8 005c      	cmp.l 92(a0),d0
     21a:	6600 24de      	bne.w 26fa <main+0x26f4>
     21e:	2028 0060      	move.l 96(a0),d0
     222:	b0b9 0000 6fcc 	cmp.l 6fcc <ClScreen+0x20>,d0
     228:	6600 24d0      	bne.w 26fa <main+0x26f4>
     22c:	2039 0000 6fd0 	move.l 6fd0 <ClScreen+0x24>,d0
     232:	b0a8 0064      	cmp.l 100(a0),d0
     236:	6600 24c2      	bne.w 26fa <main+0x26f4>
     23a:	2039 0000 6fd4 	move.l 6fd4 <ClScreen+0x28>,d0
     240:	b0a8 0068      	cmp.l 104(a0),d0
     244:	6600 24b4      	bne.w 26fa <main+0x26f4>
     248:	2068 006c      	movea.l 108(a0),a0
     24c:	b1f9 0000 6fd8 	cmpa.l 6fd8 <ClScreen+0x2c>,a0
     252:	6600 24a6      	bne.w 26fa <main+0x26f4>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     256:	23fc 0004 0000 	move.l #262144,708c <DrawBuffer>
     25c:	0000 708c 
  ViewBuffer = (ULONG *)0x50000;
     260:	23fc 0005 0000 	move.l #327680,7080 <ViewBuffer>
     266:	0000 7080 
  SetBplPointers();
     26a:	45f9 0000 389a 	lea 389a <SetBplPointers>,a2
     270:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     272:	0cb9 0005 0000 	cmpi.l #327680,708c <DrawBuffer>
     278:	0000 708c 
     27c:	6700 24ce      	beq.w 274c <main+0x2746>
    Write( Output(), 
     280:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     286:	4eae ffc4      	jsr -60(a6)
     28a:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     290:	2200           	move.l d0,d1
     292:	243c 0000 4661 	move.l #18017,d2
     298:	763b           	moveq #59,d3
     29a:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     29e:	2079 0000 7098 	movea.l 7098 <Copperlist1>,a0
     2a4:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2aa:	0070 
     2ac:	6724           	beq.s 2d2 <main+0x2cc>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ae:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     2b4:	4eae ffc4      	jsr -60(a6)
     2b8:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     2be:	2200           	move.l d0,d1
     2c0:	243c 0000 469d 	move.l #18077,d2
     2c6:	763c           	moveq #60,d3
     2c8:	4eae ffd0      	jsr -48(a6)
     2cc:	2079 0000 7098 	movea.l 7098 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2d2:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2d8:	0074 
     2da:	6724           	beq.s 300 <main+0x2fa>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2dc:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     2e2:	4eae ffc4      	jsr -60(a6)
     2e6:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     2ec:	2200           	move.l d0,d1
     2ee:	243c 0000 46da 	move.l #18138,d2
     2f4:	763c           	moveq #60,d3
     2f6:	4eae ffd0      	jsr -48(a6)
     2fa:	2079 0000 7098 	movea.l 7098 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     300:	2028 0078      	move.l 120(a0),d0
     304:	b0b9 0000 6fa4 	cmp.l 6fa4 <ClColor>,d0
     30a:	6600 23c6      	bne.w 26d2 <main+0x26cc>
     30e:	2028 007c      	move.l 124(a0),d0
     312:	b0b9 0000 6fa8 	cmp.l 6fa8 <ClColor+0x4>,d0
     318:	6600 23b8      	bne.w 26d2 <main+0x26cc>
  if( instructions[pos] == value ) 
     31c:	70fe           	moveq #-2,d0
     31e:	b0a8 0080      	cmp.l 128(a0),d0
     322:	671e           	beq.s 342 <main+0x33c>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     324:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     32a:	4eae ffc4      	jsr -60(a6)
     32e:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     334:	2200           	move.l d0,d1
     336:	243c 0000 4739 	move.l #18233,d2
     33c:	7622           	moveq #34,d3
     33e:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     342:	47f9 0000 3692 	lea 3692 <SwapCl>,a3
     348:	4e93           	jsr (a3)
  if( DrawCopper != Copperlist2)
     34a:	2079 0000 7088 	movea.l 7088 <DrawCopper>,a0
     350:	b1f9 0000 7094 	cmpa.l 7094 <Copperlist2>,a0
     356:	671e           	beq.s 376 <main+0x370>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     358:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     35e:	4eae ffc4      	jsr -60(a6)
     362:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     368:	2200           	move.l d0,d1
     36a:	243c 0000 475c 	move.l #18268,d2
     370:	7615           	moveq #21,d3
     372:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     376:	49f9 0000 38c6 	lea 38c6 <PrepareDisplay>,a4
     37c:	4e94           	jsr (a4)
  if( DrawBuffer != Bitplane1) 
     37e:	2039 0000 708c 	move.l 708c <DrawBuffer>,d0
     384:	b0b9 0000 7090 	cmp.l 7090 <Bitplane1>,d0
     38a:	671e           	beq.s 3aa <main+0x3a4>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     38c:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     392:	4eae ffc4      	jsr -60(a6)
     396:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     39c:	2200           	move.l d0,d1
     39e:	243c 0000 4772 	move.l #18290,d2
     3a4:	7637           	moveq #55,d3
     3a6:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3aa:	2079 0000 7088 	movea.l 7088 <DrawCopper>,a0
     3b0:	b1f9 0000 7098 	cmpa.l 7098 <Copperlist1>,a0
     3b6:	671e           	beq.s 3d6 <main+0x3d0>
    Write( Output(), 
     3b8:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     3be:	4eae ffc4      	jsr -60(a6)
     3c2:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     3c8:	2200           	move.l d0,d1
     3ca:	243c 0000 47aa 	move.l #18346,d2
     3d0:	7639           	moveq #57,d3
     3d2:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3d6:	4e94           	jsr (a4)

  if( ViewBuffer != Bitplane2) 
     3d8:	2039 0000 7080 	move.l 7080 <ViewBuffer>,d0
     3de:	b0b9 0000 7084 	cmp.l 7084 <Bitplane2>,d0
     3e4:	671e           	beq.s 404 <main+0x3fe>
    Write( Output(), 
     3e6:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     3ec:	4eae ffc4      	jsr -60(a6)
     3f0:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     3f6:	2200           	move.l d0,d1
     3f8:	243c 0000 47e4 	move.l #18404,d2
     3fe:	7638           	moveq #56,d3
     400:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     404:	2079 0000 707c 	movea.l 707c <ViewCopper>,a0
     40a:	b1f9 0000 7094 	cmpa.l 7094 <Copperlist2>,a0
     410:	671e           	beq.s 430 <main+0x42a>
    Write( Output(), 
     412:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     418:	4eae ffc4      	jsr -60(a6)
     41c:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     422:	2200           	move.l d0,d1
     424:	243c 0000 481d 	move.l #18461,d2
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
     434:	2079 0000 707c 	movea.l 707c <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     43a:	7000           	moveq #0,d0
     43c:	3028 0072      	move.w 114(a0),d0
     440:	4840           	swap d0
     442:	4240           	clr.w d0
     444:	7200           	moveq #0,d1
     446:	3228 0076      	move.w 118(a0),d1
     44a:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     44c:	b0b9 0000 7084 	cmp.l 7084 <Bitplane2>,d0
     452:	671e           	beq.s 472 <main+0x46c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     454:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     45a:	4eae ffc4      	jsr -60(a6)
     45e:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     464:	2200           	move.l d0,d1
     466:	243c 0000 4858 	move.l #18520,d2
     46c:	7648           	moveq #72,d3
     46e:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     472:	4e93           	jsr (a3)
  SetBplPointers();
     474:	4e92           	jsr (a2)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     476:	2079 0000 707c 	movea.l 707c <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     47c:	7000           	moveq #0,d0
     47e:	3028 0072      	move.w 114(a0),d0
     482:	4840           	swap d0
     484:	4240           	clr.w d0
     486:	7200           	moveq #0,d1
     488:	3228 0076      	move.w 118(a0),d1
     48c:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     48e:	b0b9 0000 7090 	cmp.l 7090 <Bitplane1>,d0
     494:	671e           	beq.s 4b4 <main+0x4ae>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     496:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     49c:	4eae ffc4      	jsr -60(a6)
     4a0:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     4a6:	2200           	move.l d0,d1
     4a8:	243c 0000 48a1 	move.l #18593,d2
     4ae:	7649           	moveq #73,d3
     4b0:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4b4:	4e93           	jsr (a3)
  SetBplPointers();
     4b6:	4e92           	jsr (a2)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     4b8:	2079 0000 707c 	movea.l 707c <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4be:	7000           	moveq #0,d0
     4c0:	3028 0072      	move.w 114(a0),d0
     4c4:	4840           	swap d0
     4c6:	4240           	clr.w d0
     4c8:	7200           	moveq #0,d1
     4ca:	3228 0076      	move.w 118(a0),d1
     4ce:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4d0:	b0b9 0000 7084 	cmp.l 7084 <Bitplane2>,d0
     4d6:	671e           	beq.s 4f6 <main+0x4f0>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4d8:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     4de:	4eae ffc4      	jsr -60(a6)
     4e2:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     4e8:	2200           	move.l d0,d1
     4ea:	243c 0000 48eb 	move.l #18667,d2
     4f0:	7648           	moveq #72,d3
     4f2:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     4f6:	2f3c 0000 c800 	move.l #51200,-(sp)
     4fc:	4878 0084      	pea 84 <main+0x7e>
     500:	4eb9 0000 3a04 	jsr 3a04 <FreeDisplay>
  TestZoom4Picture();
}

void ZoomTestDisplay() {

  PrepareDisplayZoom();
     506:	47f9 0000 36b8 	lea 36b8 <PrepareDisplayZoom>,a3
     50c:	4e93           	jsr (a3)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     50e:	4878 0010      	pea 10 <main+0xa>
     512:	4879 0000 6fdc 	pea 6fdc <ClsSprites>
     518:	42a7           	clr.l -(sp)
     51a:	2f39 0000 7098 	move.l 7098 <Copperlist1>,-(sp)
     520:	4eb9 0000 2b58 	jsr 2b58 <TestCopperlistBatch>
     526:	4fef 0018      	lea 24(sp),sp
     52a:	4a80           	tst.l d0
     52c:	661e           	bne.s 54c <main+0x546>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     52e:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     534:	4eae ffc4      	jsr -60(a6)
     538:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     53e:	2200           	move.l d0,d1
     540:	243c 0000 4934 	move.l #18740,d2
     546:	762c           	moveq #44,d3
     548:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
     54c:	4878 000c      	pea c <main+0x6>
     550:	4879 0000 6f74 	pea 6f74 <ClScreenZoom>
     556:	4878 0010      	pea 10 <main+0xa>
     55a:	2f39 0000 7098 	move.l 7098 <Copperlist1>,-(sp)
     560:	4eb9 0000 2b58 	jsr 2b58 <TestCopperlistBatch>
     566:	4fef 0010      	lea 16(sp),sp
     56a:	4a80           	tst.l d0
     56c:	661e           	bne.s 58c <main+0x586>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     56e:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     574:	4eae ffc4      	jsr -60(a6)
     578:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     57e:	2200           	move.l d0,d1
     580:	243c 0000 496a 	move.l #18794,d2
     586:	7636           	moveq #54,d3
     588:	4eae ffd0      	jsr -48(a6)
  //ZoomHorizontal = 10;
}

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
  UWORD *copword = (UWORD *) DrawCopper;
     58c:	2079 0000 7088 	movea.l 7088 <DrawCopper>,a0
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
     5a8:	23fc 0005 0000 	move.l #327680,708c <DrawBuffer>
     5ae:	0000 708c 
  ViewBuffer = (ULONG *) tmp;
     5b2:	23fc 0004 0000 	move.l #262144,7080 <ViewBuffer>
     5b8:	0000 7080 
  Zoom_SetBplPointers();
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
     5bc:	2f3c 00e0 0004 	move.l #14680068,-(sp)
     5c2:	4878 001c      	pea 1c <main+0x16>
     5c6:	2f39 0000 7098 	move.l 7098 <Copperlist1>,-(sp)
     5cc:	4eb9 0000 2b3a 	jsr 2b3a <TestCopperlistPos>
     5d2:	4fef 000c      	lea 12(sp),sp
     5d6:	4a80           	tst.l d0
     5d8:	661e           	bne.s 5f8 <main+0x5f2>
    Write(Output(), 
     5da:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     5e0:	4eae ffc4      	jsr -60(a6)
     5e4:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     5ea:	2200           	move.l d0,d1
     5ec:	243c 0000 469d 	move.l #18077,d2
     5f2:	763c           	moveq #60,d3
     5f4:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
     5f8:	2f3c 00e2 0000 	move.l #14811136,-(sp)
     5fe:	4878 001d      	pea 1d <main+0x17>
     602:	2f39 0000 7098 	move.l 7098 <Copperlist1>,-(sp)
     608:	4eb9 0000 2b3a 	jsr 2b3a <TestCopperlistPos>
     60e:	4fef 000c      	lea 12(sp),sp
     612:	4a80           	tst.l d0
     614:	661e           	bne.s 634 <main+0x62e>
    Write(Output(), 
     616:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     61c:	4eae ffc4      	jsr -60(a6)
     620:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     626:	2200           	move.l d0,d1
     628:	243c 0000 46da 	move.l #18138,d2
     62e:	763c           	moveq #60,d3
     630:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
     634:	2f3c 00e4 0004 	move.l #14942212,-(sp)
     63a:	4878 001e      	pea 1e <main+0x18>
     63e:	2f39 0000 7098 	move.l 7098 <Copperlist1>,-(sp)
     644:	4eb9 0000 2b3a 	jsr 2b3a <TestCopperlistPos>
     64a:	4fef 000c      	lea 12(sp),sp
     64e:	4a80           	tst.l d0
     650:	661e           	bne.s 670 <main+0x66a>
    Write(Output(), 
     652:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     658:	4eae ffc4      	jsr -60(a6)
     65c:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     662:	2200           	move.l d0,d1
     664:	243c 0000 49a1 	move.l #18849,d2
     66a:	763c           	moveq #60,d3
     66c:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
     670:	2f3c 00e6 2800 	move.l #15083520,-(sp)
     676:	4878 001f      	pea 1f <main+0x19>
     67a:	2f39 0000 7098 	move.l 7098 <Copperlist1>,-(sp)
     680:	4eb9 0000 2b3a 	jsr 2b3a <TestCopperlistPos>
     686:	4fef 000c      	lea 12(sp),sp
     68a:	4a80           	tst.l d0
     68c:	661e           	bne.s 6ac <main+0x6a6>
    Write(Output(), 
     68e:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     694:	4eae ffc4      	jsr -60(a6)
     698:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     69e:	2200           	move.l d0,d1
     6a0:	243c 0000 49de 	move.l #18910,d2
     6a6:	763c           	moveq #60,d3
     6a8:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl2pl should be 2800\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
     6ac:	4878 0002      	pea 2 <_start+0x2>
     6b0:	4879 0000 6fa4 	pea 6fa4 <ClColor>
     6b6:	4878 0020      	pea 20 <main+0x1a>
     6ba:	2f39 0000 7098 	move.l 7098 <Copperlist1>,-(sp)
     6c0:	4eb9 0000 2b58 	jsr 2b58 <TestCopperlistBatch>
     6c6:	4fef 0010      	lea 16(sp),sp
     6ca:	4a80           	tst.l d0
     6cc:	661e           	bne.s 6ec <main+0x6e6>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     6ce:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     6d4:	4eae ffc4      	jsr -60(a6)
     6d8:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     6de:	2200           	move.l d0,d1
     6e0:	243c 0000 4717 	move.l #18199,d2
     6e6:	7621           	moveq #33,d3
     6e8:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     6ec:	4878 0040      	pea 40 <main+0x3a>
     6f0:	4879 0000 4d24 	pea 4d24 <incbin_swfont_end+0x822>
     6f6:	486d ffc0      	pea -64(a5)
     6fa:	4eb9 0000 3abc 	jsr 3abc <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
     700:	4878 0010      	pea 10 <main+0xa>
     704:	486d ffc0      	pea -64(a5)
     708:	4878 0022      	pea 22 <main+0x1c>
     70c:	2f39 0000 7098 	move.l 7098 <Copperlist1>,-(sp)
     712:	4eb9 0000 2b58 	jsr 2b58 <TestCopperlistBatch>
     718:	4fef 001c      	lea 28(sp),sp
     71c:	4a80           	tst.l d0
     71e:	661e           	bne.s 73e <main+0x738>
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);
     720:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     726:	4eae ffc4      	jsr -60(a6)
     72a:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     730:	2200           	move.l d0,d1
     732:	243c 0000 4a1b 	move.l #18971,d2
     738:	7621           	moveq #33,d3
     73a:	4eae ffd0      	jsr -48(a6)

  ULONG clpart2[] = { 0x2d07fffe, 0x018200f0, 0x01820f00 };
     73e:	2b7c 2d07 fffe 	move.l #755499006,-76(a5)
     744:	ffb4 
     746:	2b7c 0182 00f0 	move.l #25297136,-72(a5)
     74c:	ffb8 
     74e:	2b7c 0182 0f00 	move.l #25300736,-68(a5)
     754:	ffbc 

  if( TestCopperlistBatch( Copperlist1, 75, clpart2, 3) == 0)
     756:	4878 0003      	pea 3 <_start+0x3>
     75a:	486d ffb4      	pea -76(a5)
     75e:	4878 004b      	pea 4b <main+0x45>
     762:	2f39 0000 7098 	move.l 7098 <Copperlist1>,-(sp)
     768:	4eb9 0000 2b58 	jsr 2b58 <TestCopperlistBatch>
     76e:	4fef 0010      	lea 16(sp),sp
     772:	4a80           	tst.l d0
     774:	661e           	bne.s 794 <main+0x78e>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     776:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     77c:	4eae ffc4      	jsr -60(a6)
     780:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     786:	2200           	move.l d0,d1
     788:	243c 0000 4a3d 	move.l #19005,d2
     78e:	762c           	moveq #44,d3
     790:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
     794:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdc7a4>
     798:	4878 2922      	pea 2922 <warpmode.part.0+0x8>
     79c:	2f39 0000 7098 	move.l 7098 <Copperlist1>,-(sp)
     7a2:	4eb9 0000 2b3a 	jsr 2b3a <TestCopperlistPos>
     7a8:	4fef 000c      	lea 12(sp),sp
     7ac:	4a80           	tst.l d0
     7ae:	661e           	bne.s 7ce <main+0x7c8>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     7b0:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     7b6:	4eae ffc4      	jsr -60(a6)
     7ba:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     7c0:	2200           	move.l d0,d1
     7c2:	243c 0000 4739 	move.l #18233,d2
     7c8:	7622           	moveq #34,d3
     7ca:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     7ce:	2f3c 0001 6800 	move.l #92160,-(sp)
     7d4:	2f3c 0000 a48c 	move.l #42124,-(sp)
     7da:	4eb9 0000 3a04 	jsr 3a04 <FreeDisplay>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     7e0:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
     7e6:	7004           	moveq #4,d0
     7e8:	7202           	moveq #2,d1
     7ea:	4eae ff3a      	jsr -198(a6)
  ZoomHorizontal = 16;
     7ee:	33fc 0010 0000 	move.w #16,707a <ZoomHorizontal>
     7f4:	707a 

}

void TestBlitleftOfZoom() {
  Zoom_Init();
  PrepareDisplayZoom();
     7f6:	4e93           	jsr (a3)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     7f8:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
     7fe:	203c 0000 c800 	move.l #51200,d0
     804:	7202           	moveq #2,d1
     806:	4eae ff3a      	jsr -198(a6)
     80a:	2440           	movea.l d0,a2
     80c:	23c0 0000 705c 	move.l d0,705c <Zoom_Source>
  if( Zoom_Source == 0) {
     812:	508f           	addq.l #8,sp
     814:	6700 1ff6      	beq.w 280c <main+0x2806>
    return;
  }

  
  UWORD *tstsource = Zoom_Source;
  *tstsource++ = 0x0000;
     818:	4252           	clr.w (a2)
  *tstsource = 0x0080;
     81a:	357c 0080 0002 	move.w #128,2(a2)
  tstsource += ZMLINESIZE/2-1;
  *tstsource = 0x1000;
     820:	357c 1000 0030 	move.w #4096,48(a2)
  tstsource++;
  *tstsource = 0x8e88;
     826:	357c 8e88 0032 	move.w #-29048,50(a2)
  tstsource += ZMLINESIZE/2-1;

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
  *tstsource++ = 0x0000;
     82c:	426a 17d0      	clr.w 6096(a2)
  *tstsource = 0x00ff;
     830:	357c 00ff 17d2 	move.w #255,6098(a2)

  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 0, 8, 128);
     836:	2439 0000 708c 	move.l 708c <DrawBuffer>,d2
    srca = source + 1;
     83c:	2600           	move.l d0,d3
     83e:	5483           	addq.l #2,d3
  WaitBlit();
     840:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
     846:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     84a:	2079 0000 7072 	movea.l 7072 <hw>,a0
     850:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
     856:	317c fde4 0040 	move.w #-540,64(a0)
  hw->bltafwm = 0xffff;
     85c:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     862:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     868:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     86e:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     874:	317c ff00 0070 	move.w #-256,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     87a:	317c 002c 0066 	move.w #44,102(a0)
  *bp = 0;
     880:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltapt = srca;
     884:	2143 0050      	move.l d3,80(a0)
  hw->bltbpt = srcb;
     888:	214a 004c      	move.l a2,76(a0)
  hw->bltdpt = destination;
     88c:	2142 0054      	move.l d2,84(a0)
  hw->bltsize = height*64+2;
     890:	317c 2002 0058 	move.w #8194,88(a0)
  WaitBlit();
     896:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
     89c:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
     8a0:	2479 0000 708c 	movea.l 708c <DrawBuffer>,a2
  if( *destination != 0x0180) {
     8a6:	0c6a 0180 0002 	cmpi.w #384,2(a2)
     8ac:	671e           	beq.s 8cc <main+0x8c6>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
     8ae:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     8b4:	4eae ffc4      	jsr -60(a6)
     8b8:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     8be:	2200           	move.l d0,d1
     8c0:	243c 0000 4aa2 	move.l #19106,d2
     8c6:	761c           	moveq #28,d3
     8c8:	4eae ffd0      	jsr -48(a6)
  }
  destination += ZMLINESIZE/2;
  if( *destination != 0x1d88)
     8cc:	0c6a 1d88 0032 	cmpi.w #7560,50(a2)
     8d2:	671e           	beq.s 8f2 <main+0x8ec>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
     8d4:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     8da:	4eae ffc4      	jsr -60(a6)
     8de:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     8e4:	2200           	move.l d0,d1
     8e6:	243c 0000 4abf 	move.l #19135,d2
     8ec:	761c           	moveq #28,d3
     8ee:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
  destination++;
  if( *destination != 0x01ff) {
     8f2:	2079 0000 708c 	movea.l 708c <DrawBuffer>,a0
     8f8:	0c68 01ff 17d2 	cmpi.w #511,6098(a0)
     8fe:	671e           	beq.s 91e <main+0x918>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
     900:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     906:	4eae ffc4      	jsr -60(a6)
     90a:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     910:	2200           	move.l d0,d1
     912:	243c 0000 4adc 	move.l #19164,d2
     918:	761a           	moveq #26,d3
     91a:	4eae ffd0      	jsr -48(a6)
  }
  FreeMem( Zoom_Source, 40*256*5);
     91e:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
     924:	2279 0000 705c 	movea.l 705c <Zoom_Source>,a1
     92a:	203c 0000 c800 	move.l #51200,d0
     930:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     934:	2f3c 0001 6800 	move.l #92160,-(sp)
     93a:	2f3c 0000 a48c 	move.l #42124,-(sp)
     940:	4eb9 0000 3a04 	jsr 3a04 <FreeDisplay>
     946:	508f           	addq.l #8,sp
}

void TestCopyColumnOfZoom() {

  PrepareDisplayZoom();
     948:	4e93           	jsr (a3)

  UWORD *destination = (UWORD *)DrawBuffer;
     94a:	2079 0000 708c 	movea.l 708c <DrawBuffer>,a0
  *destination= 0x0000;
     950:	4250           	clr.w (a0)
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
     952:	317c 000f 0030 	move.w #15,48(a0)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     958:	317c 000f 47d0 	move.w #15,18384(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     95e:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
     964:	203c 0000 c800 	move.l #51200,d0
     96a:	7202           	moveq #2,d1
     96c:	4eae ff3a      	jsr -198(a6)
     970:	2440           	movea.l d0,a2
     972:	23c0 0000 705c 	move.l d0,705c <Zoom_Source>
  if( Zoom_Source == 0) {
     978:	6700 1ee4      	beq.w 285e <main+0x2858>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }

  UWORD *tstsource = Zoom_Source;
  *tstsource = 0xffff;
     97c:	34bc ffff      	move.w #-1,(a2)
  tstsource += ZMLINESIZE/2;
  *tstsource = 0xffff;
     980:	357c ffff 0030 	move.w #-1,48(a2)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0xc000;
     986:	357c c000 47d0 	move.w #-16384,18384(a2)
  Zoom_CopyColumn( Zoom_Source, (UWORD *)DrawBuffer, 1, 1);
     98c:	2439 0000 708c 	move.l 708c <DrawBuffer>,d2
  WaitBlit();
     992:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
     998:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     99c:	2079 0000 7072 	movea.l 7072 <hw>,a0
     9a2:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4;
     9a8:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltafwm = 0xffff;
     9ae:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     9b4:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 2;
     9ba:	317c 002e 0064 	move.w #46,100(a0)
  hw->bltbmod = ZMLINESIZE - 2;
     9c0:	317c 002e 0062 	move.w #46,98(a0)
  hw->bltdmod = ZMLINESIZE - 2;
     9c6:	317c 002e 0066 	move.w #46,102(a0)
  hw->bltcdat = bltmask;
     9cc:	317c 4000 0070 	move.w #16384,112(a0)
  hw->bltapt = (UWORD *) sourcepos;
     9d2:	214a 0050      	move.l a2,80(a0)
  hw->bltbpt = (UWORD *) destpos;
     9d6:	2142 004c      	move.l d2,76(a0)
  hw->bltdpt = (UWORD *) destpos;
     9da:	2142 0054      	move.l d2,84(a0)
  hw->bltsize = ZMCOLHEIGHT*64+1;
     9de:	317c 6001 0058 	move.w #24577,88(a0)
  
  WaitBlit();
     9e4:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
     9ea:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     9ee:	2479 0000 708c 	movea.l 708c <DrawBuffer>,a2
  if( *destination != 0x4000)
     9f4:	0c52 4000      	cmpi.w #16384,(a2)
     9f8:	671e           	beq.s a18 <main+0xa12>
    Write(  Output(), "Zoomtest: CopyColumn2 - First row wrong.\n",41);
     9fa:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     a00:	4eae ffc4      	jsr -60(a6)
     a04:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     a0a:	2200           	move.l d0,d1
     a0c:	243c 0000 4af7 	move.l #19191,d2
     a12:	7629           	moveq #41,d3
     a14:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x400f)
     a18:	0c6a 400f 0030 	cmpi.w #16399,48(a2)
     a1e:	671e           	beq.s a3e <main+0xa38>
    Write(  Output(), "Zoomtest: CopyColumn2 - Second row wrong.\n",42);
     a20:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     a26:	4eae ffc4      	jsr -60(a6)
     a2a:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     a30:	2200           	move.l d0,d1
     a32:	243c 0000 4b21 	move.l #19233,d2
     a38:	762a           	moveq #42,d3
     a3a:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x400f)
     a3e:	2479 0000 708c 	movea.l 708c <DrawBuffer>,a2
     a44:	0c6a 400f 47d0 	cmpi.w #16399,18384(a2)
     a4a:	6724           	beq.s a70 <main+0xa6a>
    Write(  Output(), "Zoomtest: CopyColumn2 - Last row wrong.\n",40);
     a4c:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     a52:	4eae ffc4      	jsr -60(a6)
     a56:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     a5c:	2200           	move.l d0,d1
     a5e:	243c 0000 4b4c 	move.l #19276,d2
     a64:	7628           	moveq #40,d3
     a66:	4eae ffd0      	jsr -48(a6)
     a6a:	2479 0000 708c 	movea.l 708c <DrawBuffer>,a2

  destination = (UWORD *)DrawBuffer;
  *destination= 0x0000;
     a70:	4252           	clr.w (a2)
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
     a72:	357c 000f 0030 	move.w #15,48(a2)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     a78:	357c 000f 47d0 	move.w #15,18384(a2)

  tstsource = Zoom_Source;
     a7e:	2679 0000 705c 	movea.l 705c <Zoom_Source>,a3
  *tstsource = 0xffff;
     a84:	36bc ffff      	move.w #-1,(a3)
  tstsource += ZMLINESIZE/2;
  *tstsource = 0xffff;
     a88:	377c ffff 0030 	move.w #-1,48(a3)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0x8000;
     a8e:	377c 8000 47d0 	move.w #-32768,18384(a3)
  WaitBlit();
     a94:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
     a9a:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     a9e:	2079 0000 7072 	movea.l 7072 <hw>,a0
     aa4:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4;
     aaa:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltafwm = 0xffff;
     ab0:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     ab6:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 2;
     abc:	317c 002e 0064 	move.w #46,100(a0)
  hw->bltbmod = ZMLINESIZE - 2;
     ac2:	317c 002e 0062 	move.w #46,98(a0)
  hw->bltdmod = ZMLINESIZE - 2;
     ac8:	317c 002e 0066 	move.w #46,102(a0)
  hw->bltcdat = bltmask;
     ace:	317c 8000 0070 	move.w #-32768,112(a0)
  hw->bltapt = (UWORD *) sourcepos;
     ad4:	214b 0050      	move.l a3,80(a0)
  hw->bltbpt = (UWORD *) destpos;
     ad8:	214a 004c      	move.l a2,76(a0)
  hw->bltdpt = (UWORD *) destpos;
     adc:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = ZMCOLHEIGHT*64+1;
     ae0:	317c 6001 0058 	move.w #24577,88(a0)
  Zoom_CopyColumn( Zoom_Source, (UWORD *)DrawBuffer, 0, 0);
  
  WaitBlit();
     ae6:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
     aec:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     af0:	2479 0000 708c 	movea.l 708c <DrawBuffer>,a2
  if( *destination != 0x8000)
     af6:	0c52 8000      	cmpi.w #-32768,(a2)
     afa:	671e           	beq.s b1a <main+0xb14>
    Write(  Output(), "Zoomtest: CopyColumn - First row wrong.\n",40);
     afc:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     b02:	4eae ffc4      	jsr -60(a6)
     b06:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     b0c:	2200           	move.l d0,d1
     b0e:	243c 0000 4b75 	move.l #19317,d2
     b14:	7628           	moveq #40,d3
     b16:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x800f)
     b1a:	0c6a 800f 0030 	cmpi.w #-32753,48(a2)
     b20:	671e           	beq.s b40 <main+0xb3a>
    Write(  Output(), "Zoomtest: CopyColumn - Second row wrong.\n",41);
     b22:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     b28:	4eae ffc4      	jsr -60(a6)
     b2c:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     b32:	2200           	move.l d0,d1
     b34:	243c 0000 4b9e 	move.l #19358,d2
     b3a:	7629           	moveq #41,d3
     b3c:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x800f)
     b40:	2079 0000 708c 	movea.l 708c <DrawBuffer>,a0
     b46:	0c68 800f 47d0 	cmpi.w #-32753,18384(a0)
     b4c:	671e           	beq.s b6c <main+0xb66>
    Write(  Output(), "Zoomtest: CopyColumn - Last row wrong.\n",39);
     b4e:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     b54:	4eae ffc4      	jsr -60(a6)
     b58:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     b5e:	2200           	move.l d0,d1
     b60:	243c 0000 4bc8 	move.l #19400,d2
     b66:	7627           	moveq #39,d3
     b68:	4eae ffd0      	jsr -48(a6)

  FreeMem( Zoom_Source, 40*256*5);
     b6c:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
     b72:	2279 0000 705c 	movea.l 705c <Zoom_Source>,a1
     b78:	203c 0000 c800 	move.l #51200,d0
     b7e:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     b82:	2f3c 0001 6800 	move.l #92160,-(sp)
     b88:	2f3c 0000 a48c 	move.l #42124,-(sp)
     b8e:	4eb9 0000 3a04 	jsr 3a04 <FreeDisplay>
     b94:	508f           	addq.l #8,sp
}

void TestCopyWord() {
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
     b96:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
     b9c:	203c 0000 05a0 	move.l #1440,d0
     ba2:	7202           	moveq #2,d1
     ba4:	4eae ff3a      	jsr -198(a6)
     ba8:	2440           	movea.l d0,a2
  if( source == 0) {
     baa:	4a80           	tst.l d0
     bac:	6700 1c04      	beq.w 27b2 <main+0x27ac>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
     bb0:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
     bb6:	203c 0000 05a0 	move.l #1440,d0
     bbc:	7202           	moveq #2,d1
     bbe:	4eae ff3a      	jsr -198(a6)
     bc2:	2640           	movea.l d0,a3
  if( destination == 0) {
     bc4:	4a80           	tst.l d0
     bc6:	6700 1bea      	beq.w 27b2 <main+0x27ac>
    return;
  }
  
  UWORD *tmp = source;
  for( int i=0; i<8;i++) {
    *tmp++ = 0;
     bca:	4252           	clr.w (a2)
    *tmp++ = 0xaaaa;
     bcc:	357c aaaa 0002 	move.w #-21846,2(a2)
    *tmp++ = 0xaaaa;
     bd2:	357c aaaa 0004 	move.w #-21846,4(a2)
    *tmp = 0;
     bd8:	426a 0006      	clr.w 6(a2)
    tmp += ZMLINESIZE/2-3;
    *tmp++ = 0;
     bdc:	426a 0030      	clr.w 48(a2)
    *tmp++ = 0x5555;
     be0:	357c 5555 0032 	move.w #21845,50(a2)
    *tmp++ = 0x5555;
     be6:	357c 5555 0034 	move.w #21845,52(a2)
    *tmp = 0;
     bec:	426a 0036      	clr.w 54(a2)
    *tmp++ = 0;
     bf0:	426a 0060      	clr.w 96(a2)
    *tmp++ = 0xaaaa;
     bf4:	357c aaaa 0062 	move.w #-21846,98(a2)
    *tmp++ = 0xaaaa;
     bfa:	357c aaaa 0064 	move.w #-21846,100(a2)
    *tmp = 0;
     c00:	426a 0066      	clr.w 102(a2)
    *tmp++ = 0;
     c04:	426a 0090      	clr.w 144(a2)
    *tmp++ = 0x5555;
     c08:	357c 5555 0092 	move.w #21845,146(a2)
    *tmp++ = 0x5555;
     c0e:	357c 5555 0094 	move.w #21845,148(a2)
    *tmp = 0;
     c14:	426a 0096      	clr.w 150(a2)
    *tmp++ = 0;
     c18:	426a 00c0      	clr.w 192(a2)
    *tmp++ = 0xaaaa;
     c1c:	357c aaaa 00c2 	move.w #-21846,194(a2)
    *tmp++ = 0xaaaa;
     c22:	357c aaaa 00c4 	move.w #-21846,196(a2)
    *tmp = 0;
     c28:	426a 00c6      	clr.w 198(a2)
    *tmp++ = 0;
     c2c:	426a 00f0      	clr.w 240(a2)
    *tmp++ = 0x5555;
     c30:	357c 5555 00f2 	move.w #21845,242(a2)
    *tmp++ = 0x5555;
     c36:	357c 5555 00f4 	move.w #21845,244(a2)
    *tmp = 0;
     c3c:	426a 00f6      	clr.w 246(a2)
    *tmp++ = 0;
     c40:	426a 0120      	clr.w 288(a2)
    *tmp++ = 0xaaaa;
     c44:	357c aaaa 0122 	move.w #-21846,290(a2)
    *tmp++ = 0xaaaa;
     c4a:	357c aaaa 0124 	move.w #-21846,292(a2)
    *tmp = 0;
     c50:	426a 0126      	clr.w 294(a2)
    *tmp++ = 0;
     c54:	426a 0150      	clr.w 336(a2)
    *tmp++ = 0x5555;
     c58:	357c 5555 0152 	move.w #21845,338(a2)
    *tmp++ = 0x5555;
     c5e:	357c 5555 0154 	move.w #21845,340(a2)
    *tmp = 0;
     c64:	426a 0156      	clr.w 342(a2)
    *tmp++ = 0;
     c68:	426a 0180      	clr.w 384(a2)
    *tmp++ = 0xaaaa;
     c6c:	357c aaaa 0182 	move.w #-21846,386(a2)
    *tmp++ = 0xaaaa;
     c72:	357c aaaa 0184 	move.w #-21846,388(a2)
    *tmp = 0;
     c78:	426a 0186      	clr.w 390(a2)
    *tmp++ = 0;
     c7c:	426a 01b0      	clr.w 432(a2)
    *tmp++ = 0x5555;
     c80:	357c 5555 01b2 	move.w #21845,434(a2)
    *tmp++ = 0x5555;
     c86:	357c 5555 01b4 	move.w #21845,436(a2)
    *tmp = 0;
     c8c:	426a 01b6      	clr.w 438(a2)
    *tmp++ = 0;
     c90:	426a 01e0      	clr.w 480(a2)
    *tmp++ = 0xaaaa;
     c94:	357c aaaa 01e2 	move.w #-21846,482(a2)
    *tmp++ = 0xaaaa;
     c9a:	357c aaaa 01e4 	move.w #-21846,484(a2)
    *tmp = 0;
     ca0:	426a 01e6      	clr.w 486(a2)
    *tmp++ = 0;
     ca4:	426a 0210      	clr.w 528(a2)
    *tmp++ = 0x5555;
     ca8:	357c 5555 0212 	move.w #21845,530(a2)
    *tmp++ = 0x5555;
     cae:	357c 5555 0214 	move.w #21845,532(a2)
    *tmp = 0;
     cb4:	426a 0216      	clr.w 534(a2)
    *tmp++ = 0;
     cb8:	426a 0240      	clr.w 576(a2)
    *tmp++ = 0xaaaa;
     cbc:	357c aaaa 0242 	move.w #-21846,578(a2)
    *tmp++ = 0xaaaa;
     cc2:	357c aaaa 0244 	move.w #-21846,580(a2)
    *tmp = 0;
     cc8:	426a 0246      	clr.w 582(a2)
    *tmp++ = 0;
     ccc:	426a 0270      	clr.w 624(a2)
    *tmp++ = 0x5555;
     cd0:	357c 5555 0272 	move.w #21845,626(a2)
    *tmp++ = 0x5555;
     cd6:	357c 5555 0274 	move.w #21845,628(a2)
    *tmp = 0;
     cdc:	426a 0276      	clr.w 630(a2)
    *tmp++ = 0;
     ce0:	426a 02a0      	clr.w 672(a2)
    *tmp++ = 0xaaaa;
     ce4:	357c aaaa 02a2 	move.w #-21846,674(a2)
    *tmp++ = 0xaaaa;
     cea:	357c aaaa 02a4 	move.w #-21846,676(a2)
    *tmp = 0;
     cf0:	426a 02a6      	clr.w 678(a2)
    *tmp++ = 0;
     cf4:	426a 02d0      	clr.w 720(a2)
    *tmp++ = 0x5555;
     cf8:	357c 5555 02d2 	move.w #21845,722(a2)
    *tmp++ = 0x5555;
     cfe:	357c 5555 02d4 	move.w #21845,724(a2)
    *tmp = 0;
     d04:	426a 02d6      	clr.w 726(a2)
    tmp += ZMLINESIZE/2-3;
     d08:	4878 05a0      	pea 5a0 <main+0x59a>
     d0c:	42a7           	clr.l -(sp)
     d0e:	2f00           	move.l d0,-(sp)
     d10:	4eb9 0000 3b4e 	jsr 3b4e <memset>
  WaitBlit();
     d16:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
     d1c:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     d20:	2079 0000 7072 	movea.l 7072 <hw>,a0
     d26:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
     d2c:	317c 39f0 0040 	move.w #14832,64(a0)
  hw->bltafwm = 0xffff;
     d32:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     d38:	317c ffff 0046 	move.w #-1,70(a0)
  *bp = 0;
     d3e:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltamod = ZMLINESIZE - 4;
     d42:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     d48:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
     d4e:	200a           	move.l a2,d0
     d50:	5480           	addq.l #2,d0
     d52:	2140 0050      	move.l d0,80(a0)
  hw->bltdpt = (UWORD *) destination;
     d56:	214b 0054      	move.l a3,84(a0)
  hw->bltsize = height*64+2;
     d5a:	317c 0402 0058 	move.w #1026,88(a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    *tmp++ = 0;
  }

  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 3, 16);
  WaitBlit();
     d60:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
     d66:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
  if( *tmp != 0x5555) 
     d6a:	4fef 000c      	lea 12(sp),sp
     d6e:	0c6b 5555 0002 	cmpi.w #21845,2(a3)
     d74:	671e           	beq.s d94 <main+0xd8e>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
     d76:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     d7c:	4eae ffc4      	jsr -60(a6)
     d80:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     d86:	2200           	move.l d0,d1
     d88:	243c 0000 4c26 	move.l #19494,d2
     d8e:	761f           	moveq #31,d3
     d90:	4eae ffd0      	jsr -48(a6)
  tmp += ZMLINESIZE/2;
  if( *tmp != 0xaaaa)
     d94:	0c6b aaaa 0032 	cmpi.w #-21846,50(a3)
     d9a:	671e           	beq.s dba <main+0xdb4>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
     d9c:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     da2:	4eae ffc4      	jsr -60(a6)
     da6:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
     dac:	2200           	move.l d0,d1
     dae:	243c 0000 4c46 	move.l #19526,d2
     db4:	7620           	moveq #32,d3
     db6:	4eae ffd0      	jsr -48(a6)
  
  FreeMem( source,ZMLINESIZE*30);
     dba:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
     dc0:	224a           	movea.l a2,a1
     dc2:	203c 0000 05a0 	move.l #1440,d0
     dc8:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
     dcc:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
     dd2:	224b           	movea.l a3,a1
     dd4:	203c 0000 05a0 	move.l #1440,d0
     dda:	4eae ff2e      	jsr -210(a6)
   hi11 ...
   0100
   4 */

void TestZoom4Picture() {
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     dde:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
     de4:	203c 0000 3740 	move.l #14144,d0
     dea:	7202           	moveq #2,d1
     dec:	4eae ff3a      	jsr -198(a6)
     df0:	2840           	movea.l d0,a4
  if( source == 0) {
     df2:	4a80           	tst.l d0
     df4:	6700 19f4      	beq.w 27ea <main+0x27e4>
    Write(  Output(), 
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     df8:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
     dfe:	203c 0000 3740 	move.l #14144,d0
     e04:	7202           	moveq #2,d1
     e06:	4eae ff3a      	jsr -198(a6)
     e0a:	2640           	movea.l d0,a3
  if( destination == 0) {
     e0c:	4a80           	tst.l d0
     e0e:	6700 1a9a      	beq.w 28aa <main+0x28a4>
     e12:	200c           	move.l a4,d0
     e14:	0680 0000 3300 	addi.l #13056,d0
     e1a:	204c           	movea.l a4,a0
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
  for(int i=0;i<128+8;i++) {
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0x55555555;
     e1c:	20bc 5555 5555 	move.l #1431655765,(a0)
     e22:	217c 5555 5555 	move.l #1431655765,4(a0)
     e28:	0004 
     e2a:	217c 5555 5555 	move.l #1431655765,8(a0)
     e30:	0008 
     e32:	217c 5555 5555 	move.l #1431655765,12(a0)
     e38:	000c 
     e3a:	217c 5555 5555 	move.l #1431655765,16(a0)
     e40:	0010 
     e42:	217c 5555 5555 	move.l #1431655765,20(a0)
     e48:	0014 
     e4a:	217c 5555 5555 	move.l #1431655765,24(a0)
     e50:	0018 
     e52:	217c 5555 5555 	move.l #1431655765,28(a0)
     e58:	001c 
     e5a:	217c 5555 5555 	move.l #1431655765,32(a0)
     e60:	0020 
     e62:	217c 5555 5555 	move.l #1431655765,36(a0)
     e68:	0024 
     e6a:	217c 5555 5555 	move.l #1431655765,40(a0)
     e70:	0028 
     e72:	217c 5555 5555 	move.l #1431655765,44(a0)
     e78:	002c 
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0xaaaaaaaa;
     e7a:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
     e80:	0030 
     e82:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
     e88:	0034 
     e8a:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
     e90:	0038 
     e92:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
     e98:	003c 
     e9a:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
     ea0:	0040 
     ea2:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
     ea8:	0044 
     eaa:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
     eb0:	0048 
     eb2:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
     eb8:	004c 
     eba:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
     ec0:	0050 
     ec2:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
     ec8:	0054 
     eca:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
     ed0:	0058 
     ed2:	41e8 0060      	lea 96(a0),a0
     ed6:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
     edc:	fffc 
  for(int i=0;i<128+8;i++) {
     ede:	b1c0           	cmpa.l d0,a0
     ee0:	6600 ff3a      	bne.w e1c <main+0xe16>
  }

  Zoom_ZoomIntoPicture( source, destination, 0);
     ee4:	42a7           	clr.l -(sp)
     ee6:	2f0b           	move.l a3,-(sp)
     ee8:	2f0c           	move.l a4,-(sp)
     eea:	4eb9 0000 2f8c 	jsr 2f8c <Zoom_ZoomIntoPicture>
  WaitBlit();
     ef0:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
     ef6:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
     efa:	41eb 0004      	lea 4(a3),a0
     efe:	2b48 ff84      	move.l a0,-124(a5)
  UWORD *valsupposed = destlinezoom1;
  UWORD mask = 0xffff;
  for(int i=0;i<14;i++) {
     f02:	41eb 0364      	lea 868(a3),a0
     f06:	2b48 ff78      	move.l a0,-136(a5)
     f0a:	2a08           	move.l a0,d5
     f0c:	4fef 000c      	lea 12(sp),sp
  UWORD *valactual = destination+2; 
     f10:	3c7c 0012      	movea.w #18,a6
  UWORD mask = 0xffff;
     f14:	74ff           	moveq #-1,d2
     f16:	7600           	moveq #0,d3
     f18:	4643           	not.w d3
     f1a:	45f9 0000 2a24 	lea 2a24 <TestRow>,a2
     f20:	280b           	move.l a3,d4
     f22:	2045           	movea.l d5,a0
     f24:	41e8 fca0      	lea -864(a0),a0
     f28:	2b48 ff74      	move.l a0,-140(a5)
     f2c:	47ee ffee      	lea -18(a6),a3
    for(int i2=0;i2<18;i2++) { 
      TestRow( valsupposed, valactual, mask, i2+i*19);
     f30:	2f0b           	move.l a3,-(sp)
     f32:	2f03           	move.l d3,-(sp)
     f34:	2f2d ff74      	move.l -140(a5),-(sp)
     f38:	4879 0000 6f48 	pea 6f48 <destlinezoom1>
     f3e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
     f40:	7030           	moveq #48,d0
     f42:	d1ad ff74      	add.l d0,-140(a5)
      mask = mask ^ 0xffff;
     f46:	4642           	not.w d2
     f48:	528b           	addq.l #1,a3
    for(int i2=0;i2<18;i2++) { 
     f4a:	4fef 0010      	lea 16(sp),sp
     f4e:	baad ff74      	cmp.l -140(a5),d5
     f52:	6600 17f0      	bne.w 2744 <main+0x273e>
    }
    TestRow( valsupposed, valactual, mask, 18+i*19);
     f56:	2f0e           	move.l a6,-(sp)
     f58:	7600           	moveq #0,d3
     f5a:	3602           	move.w d2,d3
     f5c:	2f03           	move.l d3,-(sp)
     f5e:	2f2d ff74      	move.l -140(a5),-(sp)
     f62:	4879 0000 6f48 	pea 6f48 <destlinezoom1>
     f68:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
     f6a:	2a2d ff74      	move.l -140(a5),d5
     f6e:	0685 0000 0390 	addi.l #912,d5
     f74:	4dee 0013      	lea 19(a6),a6
  for(int i=0;i<14;i++) {
     f78:	4fef 0010      	lea 16(sp),sp
     f7c:	bcfc 011c      	cmpa.w #284,a6
     f80:	66a0           	bne.s f22 <main+0xf1c>
     f82:	2644           	movea.l d4,a3
     f84:	41eb 31e4      	lea 12772(a3),a0
     f88:	2b48 ff80      	move.l a0,-128(a5)
     f8c:	2b48 ff74      	move.l a0,-140(a5)
     f90:	283c 0000 0109 	move.l #265,d4
  }

  for(int i2=0;i2<4;i2++) { 
    TestRow( valsupposed, valactual, mask, i2+265);
     f96:	2f04           	move.l d4,-(sp)
     f98:	2f03           	move.l d3,-(sp)
     f9a:	2f2d ff74      	move.l -140(a5),-(sp)
     f9e:	4879 0000 6f48 	pea 6f48 <destlinezoom1>
     fa4:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
     fa6:	7030           	moveq #48,d0
     fa8:	d1ad ff74      	add.l d0,-140(a5)
    mask = mask ^ 0xffff;
     fac:	4642           	not.w d2
     fae:	5284           	addq.l #1,d4
  for(int i2=0;i2<4;i2++) { 
     fb0:	4fef 0010      	lea 16(sp),sp
     fb4:	0c84 0000 010d 	cmpi.l #269,d4
     fba:	672a           	beq.s fe6 <main+0xfe0>
     fbc:	7600           	moveq #0,d3
     fbe:	3602           	move.w d2,d3
    TestRow( valsupposed, valactual, mask, i2+265);
     fc0:	2f04           	move.l d4,-(sp)
     fc2:	2f03           	move.l d3,-(sp)
     fc4:	2f2d ff74      	move.l -140(a5),-(sp)
     fc8:	4879 0000 6f48 	pea 6f48 <destlinezoom1>
     fce:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
     fd0:	7030           	moveq #48,d0
     fd2:	d1ad ff74      	add.l d0,-140(a5)
    mask = mask ^ 0xffff;
     fd6:	4642           	not.w d2
     fd8:	5284           	addq.l #1,d4
  for(int i2=0;i2<4;i2++) { 
     fda:	4fef 0010      	lea 16(sp),sp
     fde:	0c84 0000 010d 	cmpi.l #269,d4
     fe4:	66d6           	bne.s fbc <main+0xfb6>
  
  UWORD *tmp = source;
  source = destination;
  destination = tmp;
  
  Zoom_ZoomIntoPicture( source, destination, 1);
     fe6:	4878 0001      	pea 1 <_start+0x1>
     fea:	2f0c           	move.l a4,-(sp)
     fec:	2f0b           	move.l a3,-(sp)
     fee:	4eb9 0000 2f8c 	jsr 2f8c <Zoom_ZoomIntoPicture>
  WaitBlit();
     ff4:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
     ffa:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
     ffe:	41ec 0004      	lea 4(a4),a0
    1002:	2b48 ff74      	move.l a0,-140(a5)
    1006:	4fef 000c      	lea 12(sp),sp
    100a:	2b48 ff7c      	move.l a0,-132(a5)
  valsupposed = destlinezoom2;
  mask = 0x0000;
  for(int i2=0;i2<11;i2++) { 
    100e:	7600           	moveq #0,d3
  mask = 0x0000;
    1010:	4242           	clr.w d2
    TestRow( valsupposed, valactual, mask, i2);
    1012:	2f03           	move.l d3,-(sp)
    1014:	3f02           	move.w d2,-(sp)
    1016:	4267           	clr.w -(sp)
    1018:	2f2d ff7c      	move.l -132(a5),-(sp)
    101c:	4879 0000 6f1c 	pea 6f1c <destlinezoom2>
    1022:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1024:	7030           	moveq #48,d0
    1026:	d1ad ff7c      	add.l d0,-132(a5)
    mask = mask ^ 0xffff;
    102a:	4642           	not.w d2
  for(int i2=0;i2<11;i2++) { 
    102c:	5283           	addq.l #1,d3
    102e:	4fef 0010      	lea 16(sp),sp
    1032:	700b           	moveq #11,d0
    1034:	b083           	cmp.l d3,d0
    1036:	66da           	bne.s 1012 <main+0x100c>
  }
  TestRow( valsupposed, valactual, 0xffff, 8);
    1038:	4878 0008      	pea 8 <main+0x2>
    103c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1042:	41ec 0214      	lea 532(a4),a0
    1046:	2b48 ffa0      	move.l a0,-96(a5)
    104a:	2f08           	move.l a0,-(sp)
    104c:	4879 0000 6f1c 	pea 6f1c <destlinezoom2>
    1052:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 9);
    1054:	4878 0009      	pea 9 <main+0x3>
    1058:	2f3c 0000 ffff 	move.l #65535,-(sp)
    105e:	486c 0244      	pea 580(a4)
    1062:	4879 0000 6f1c 	pea 6f1c <destlinezoom2>
    1068:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 10);
    106a:	4fef 0020      	lea 32(sp),sp
    106e:	4878 000a      	pea a <main+0x4>
    1072:	42a7           	clr.l -(sp)
    1074:	486c 0274      	pea 628(a4)
    1078:	4879 0000 6f1c 	pea 6f1c <destlinezoom2>
    107e:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 11);
    1080:	4878 000b      	pea b <main+0x5>
    1084:	42a7           	clr.l -(sp)
    1086:	486c 02a4      	pea 676(a4)
    108a:	4879 0000 6f1c 	pea 6f1c <destlinezoom2>
    1090:	4e92           	jsr (a2)

  valactual += ZMLINESIZE/2;
  for(int i=0;i<12;i++) {
    1092:	2a0c           	move.l a4,d5
    1094:	0685 0000 05d4 	addi.l #1492,d5
    109a:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0x0000, 11);
    109e:	2c05           	move.l d5,d6
    10a0:	3c7c 0018      	movea.w #24,a6
    10a4:	7800           	moveq #0,d4
    10a6:	3802           	move.w d2,d4
    10a8:	2e0b           	move.l a3,d7
    10aa:	2046           	movea.l d6,a0
    10ac:	41e8 fd00      	lea -768(a0),a0
    10b0:	2b48 ff7c      	move.l a0,-132(a5)
    10b4:	47ee fff3      	lea -13(a6),a3
    10b8:	2604           	move.l d4,d3
    for(int i2=0;i2<16;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    10ba:	2f0b           	move.l a3,-(sp)
    10bc:	2f03           	move.l d3,-(sp)
    10be:	2f2d ff7c      	move.l -132(a5),-(sp)
    10c2:	4879 0000 6f1c 	pea 6f1c <destlinezoom2>
    10c8:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    10ca:	7030           	moveq #48,d0
    10cc:	d1ad ff7c      	add.l d0,-132(a5)
      mask = mask ^ 0xffff;
    10d0:	4642           	not.w d2
    10d2:	528b           	addq.l #1,a3
    for(int i2=0;i2<16;i2++) {  
    10d4:	4fef 0010      	lea 16(sp),sp
    10d8:	bcad ff7c      	cmp.l -132(a5),d6
    10dc:	6728           	beq.s 1106 <main+0x1100>
    10de:	7600           	moveq #0,d3
    10e0:	3602           	move.w d2,d3
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    10e2:	2f0b           	move.l a3,-(sp)
    10e4:	2f03           	move.l d3,-(sp)
    10e6:	2f2d ff7c      	move.l -132(a5),-(sp)
    10ea:	4879 0000 6f1c 	pea 6f1c <destlinezoom2>
    10f0:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    10f2:	7030           	moveq #48,d0
    10f4:	d1ad ff7c      	add.l d0,-132(a5)
      mask = mask ^ 0xffff;
    10f8:	4642           	not.w d2
    10fa:	528b           	addq.l #1,a3
    for(int i2=0;i2<16;i2++) {  
    10fc:	4fef 0010      	lea 16(sp),sp
    1100:	bcad ff7c      	cmp.l -132(a5),d6
    1104:	66d8           	bne.s 10de <main+0x10d8>
    }
  
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    1106:	7800           	moveq #0,d4
    1108:	3802           	move.w d2,d4
    110a:	2f0e           	move.l a6,-(sp)
    110c:	2f04           	move.l d4,-(sp)
    110e:	2f2d ff7c      	move.l -132(a5),-(sp)
    1112:	4879 0000 6f1c 	pea 6f1c <destlinezoom2>
    1118:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    111a:	486e 0001      	pea 1(a6)
    111e:	2f04           	move.l d4,-(sp)
    1120:	206d ff7c      	movea.l -132(a5),a0
    1124:	4868 0030      	pea 48(a0)
    1128:	4879 0000 6f1c 	pea 6f1c <destlinezoom2>
    112e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    1130:	4fef 0020      	lea 32(sp),sp
    1134:	486e 0002      	pea 2(a6)
    1138:	2f03           	move.l d3,-(sp)
    113a:	206d ff7c      	movea.l -132(a5),a0
    113e:	4868 0060      	pea 96(a0)
    1142:	4879 0000 6f1c 	pea 6f1c <destlinezoom2>
    1148:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    114a:	486e 0003      	pea 3(a6)
    114e:	2f03           	move.l d3,-(sp)
    1150:	206d ff7c      	movea.l -132(a5),a0
    1154:	4868 0090      	pea 144(a0)
    1158:	4879 0000 6f1c 	pea 6f1c <destlinezoom2>
    115e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1160:	2c2d ff7c      	move.l -132(a5),d6
    1164:	0686 0000 03c0 	addi.l #960,d6
    116a:	4dee 0011      	lea 17(a6),a6
  for(int i=0;i<12;i++) {
    116e:	4fef 0020      	lea 32(sp),sp
    1172:	bcfc 00e4      	cmpa.w #228,a6
    1176:	6600 ff32      	bne.w 10aa <main+0x10a4>
    117a:	2647           	movea.l d7,a3
    117c:	41ec 2fd4      	lea 12244(a4),a0
    1180:	2b48 ff98      	move.l a0,-104(a5)
    1184:	2b48 ff7c      	move.l a0,-132(a5)
    
  }

  for(int i2=0;i2<15;i2++) { 
    1188:	7600           	moveq #0,d3
    TestRow( valsupposed, valactual, mask, i2);
    118a:	2f03           	move.l d3,-(sp)
    118c:	2f04           	move.l d4,-(sp)
    118e:	2f2d ff7c      	move.l -132(a5),-(sp)
    1192:	4879 0000 6f1c 	pea 6f1c <destlinezoom2>
    1198:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    119a:	7030           	moveq #48,d0
    119c:	d1ad ff7c      	add.l d0,-132(a5)
    mask = mask ^ 0xffff;
    11a0:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    11a2:	5283           	addq.l #1,d3
    11a4:	4fef 0010      	lea 16(sp),sp
    11a8:	700f           	moveq #15,d0
    11aa:	b083           	cmp.l d3,d0
    11ac:	6728           	beq.s 11d6 <main+0x11d0>
    11ae:	7800           	moveq #0,d4
    11b0:	3802           	move.w d2,d4
    TestRow( valsupposed, valactual, mask, i2);
    11b2:	2f03           	move.l d3,-(sp)
    11b4:	2f04           	move.l d4,-(sp)
    11b6:	2f2d ff7c      	move.l -132(a5),-(sp)
    11ba:	4879 0000 6f1c 	pea 6f1c <destlinezoom2>
    11c0:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    11c2:	7030           	moveq #48,d0
    11c4:	d1ad ff7c      	add.l d0,-132(a5)
    mask = mask ^ 0xffff;
    11c8:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    11ca:	5283           	addq.l #1,d3
    11cc:	4fef 0010      	lea 16(sp),sp
    11d0:	700f           	moveq #15,d0
    11d2:	b083           	cmp.l d3,d0
    11d4:	66d8           	bne.s 11ae <main+0x11a8>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 2);
    11d6:	4878 0002      	pea 2 <_start+0x2>
    11da:	2f0b           	move.l a3,-(sp)
    11dc:	2f0c           	move.l a4,-(sp)
    11de:	4eb9 0000 2f8c 	jsr 2f8c <Zoom_ZoomIntoPicture>
  WaitBlit();
    11e4:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    11ea:	4eae ff1c      	jsr -228(a6)
    11ee:	4fef 000c      	lea 12(sp),sp
  valactual = destination+2; 
    11f2:	2b6d ff84 ff7c 	move.l -124(a5),-132(a5)
  valsupposed = destlinezoom3;
  mask = 0xffff;

  for(int i2=0;i2<4;i2++) { 
    11f8:	7400           	moveq #0,d2
  mask = 0xffff;
    11fa:	76ff           	moveq #-1,d3
    TestRow( valsupposed, valactual, mask, i2);
    11fc:	2f02           	move.l d2,-(sp)
    11fe:	3f03           	move.w d3,-(sp)
    1200:	4267           	clr.w -(sp)
    1202:	2f2d ff7c      	move.l -132(a5),-(sp)
    1206:	4879 0000 6ef0 	pea 6ef0 <destlinezoom3>
    120c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    120e:	7030           	moveq #48,d0
    1210:	d1ad ff7c      	add.l d0,-132(a5)
    mask = mask ^ 0xffff;
    1214:	4643           	not.w d3
  for(int i2=0;i2<4;i2++) { 
    1216:	5282           	addq.l #1,d2
    1218:	4fef 0010      	lea 16(sp),sp
    121c:	7004           	moveq #4,d0
    121e:	b082           	cmp.l d2,d0
    1220:	66da           	bne.s 11fc <main+0x11f6>
  }

  TestRow( valsupposed, valactual, 0xffff, 0+4);
    1222:	4878 0004      	pea 4 <_start+0x4>
    1226:	2f3c 0000 ffff 	move.l #65535,-(sp)
    122c:	486b 00c4      	pea 196(a3)
    1230:	4879 0000 6ef0 	pea 6ef0 <destlinezoom3>
    1236:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    1238:	4878 0005      	pea 5 <_start+0x5>
    123c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1242:	486b 00f4      	pea 244(a3)
    1246:	4879 0000 6ef0 	pea 6ef0 <destlinezoom3>
    124c:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    124e:	4fef 0020      	lea 32(sp),sp
    1252:	4878 0006      	pea 6 <main>
    1256:	42a7           	clr.l -(sp)
  valactual += ZMLINESIZE/2;
    1258:	41eb 0124      	lea 292(a3),a0
    125c:	2b48 ff9c      	move.l a0,-100(a5)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    1260:	2f08           	move.l a0,-(sp)
    1262:	4879 0000 6ef0 	pea 6ef0 <destlinezoom3>
    1268:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    126a:	4878 0007      	pea 7 <main+0x1>
    126e:	42a7           	clr.l -(sp)
    1270:	486b 0154      	pea 340(a3)
    1274:	4879 0000 6ef0 	pea 6ef0 <destlinezoom3>
    127a:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    127c:	4fef 0020      	lea 32(sp),sp
    1280:	4878 0008      	pea 8 <main+0x2>
    1284:	2f3c 0000 ffff 	move.l #65535,-(sp)
    128a:	486b 0184      	pea 388(a3)
    128e:	4879 0000 6ef0 	pea 6ef0 <destlinezoom3>
    1294:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    1296:	4878 0009      	pea 9 <main+0x3>
    129a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    12a0:	486b 01b4      	pea 436(a3)
    12a4:	4879 0000 6ef0 	pea 6ef0 <destlinezoom3>
    12aa:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;

  mask = 0x0000;
  for(int i=0;i<12;i++) {
    12ac:	2c0b           	move.l a3,d6
    12ae:	0686 0000 04b4 	addi.l #1204,d6
    12b4:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    12b8:	3c7c 0018      	movea.w #24,a6
    12bc:	7800           	moveq #0,d4
    12be:	74ff           	moveq #-1,d2
    12c0:	2e0b           	move.l a3,d7
    12c2:	2046           	movea.l d6,a0
    12c4:	41e8 fd30      	lea -720(a0),a0
    12c8:	2b48 ff7c      	move.l a0,-132(a5)
    12cc:	47ee fff1      	lea -15(a6),a3
    for(int i2=0;i2<15;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    12d0:	2f0b           	move.l a3,-(sp)
    12d2:	2f04           	move.l d4,-(sp)
    12d4:	2f2d ff7c      	move.l -132(a5),-(sp)
    12d8:	4879 0000 6ef0 	pea 6ef0 <destlinezoom3>
    12de:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    12e0:	7030           	moveq #48,d0
    12e2:	d1ad ff7c      	add.l d0,-132(a5)
      mask = mask ^ 0xffff;
    12e6:	528b           	addq.l #1,a3
    for(int i2=0;i2<15;i2++) {  
    12e8:	4fef 0010      	lea 16(sp),sp
    12ec:	bcad ff7c      	cmp.l -132(a5),d6
    12f0:	6728           	beq.s 131a <main+0x1314>
    12f2:	7800           	moveq #0,d4
    12f4:	3802           	move.w d2,d4
    12f6:	4642           	not.w d2
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    12f8:	2f0b           	move.l a3,-(sp)
    12fa:	2f04           	move.l d4,-(sp)
    12fc:	2f2d ff7c      	move.l -132(a5),-(sp)
    1300:	4879 0000 6ef0 	pea 6ef0 <destlinezoom3>
    1306:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1308:	7030           	moveq #48,d0
    130a:	d1ad ff7c      	add.l d0,-132(a5)
      mask = mask ^ 0xffff;
    130e:	528b           	addq.l #1,a3
    for(int i2=0;i2<15;i2++) {  
    1310:	4fef 0010      	lea 16(sp),sp
    1314:	bcad ff7c      	cmp.l -132(a5),d6
    1318:	66d8           	bne.s 12f2 <main+0x12ec>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    131a:	7600           	moveq #0,d3
    131c:	3602           	move.w d2,d3
    131e:	2f0e           	move.l a6,-(sp)
    1320:	2f03           	move.l d3,-(sp)
    1322:	2f2d ff7c      	move.l -132(a5),-(sp)
    1326:	4879 0000 6ef0 	pea 6ef0 <destlinezoom3>
    132c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    132e:	486e 0001      	pea 1(a6)
    1332:	2f03           	move.l d3,-(sp)
    1334:	206d ff7c      	movea.l -132(a5),a0
    1338:	4868 0030      	pea 48(a0)
    133c:	4879 0000 6ef0 	pea 6ef0 <destlinezoom3>
    1342:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    1344:	4fef 0020      	lea 32(sp),sp
    1348:	486e 0002      	pea 2(a6)
    134c:	2f04           	move.l d4,-(sp)
    134e:	206d ff7c      	movea.l -132(a5),a0
    1352:	4868 0060      	pea 96(a0)
    1356:	4879 0000 6ef0 	pea 6ef0 <destlinezoom3>
    135c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    135e:	486e 0003      	pea 3(a6)
    1362:	2f04           	move.l d4,-(sp)
    1364:	206d ff7c      	movea.l -132(a5),a0
    1368:	4868 0090      	pea 144(a0)
    136c:	4879 0000 6ef0 	pea 6ef0 <destlinezoom3>
    1372:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    1374:	4fef 0020      	lea 32(sp),sp
    1378:	486e 0004      	pea 4(a6)
    137c:	2f03           	move.l d3,-(sp)
    137e:	206d ff7c      	movea.l -132(a5),a0
    1382:	4868 00c0      	pea 192(a0)
    1386:	4879 0000 6ef0 	pea 6ef0 <destlinezoom3>
    138c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    138e:	486e 0005      	pea 5(a6)
    1392:	2f03           	move.l d3,-(sp)
    1394:	206d ff7c      	movea.l -132(a5),a0
    1398:	4868 00f0      	pea 240(a0)
    139c:	4879 0000 6ef0 	pea 6ef0 <destlinezoom3>
    13a2:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    13a4:	2c2d ff7c      	move.l -132(a5),d6
    13a8:	0686 0000 03f0 	addi.l #1008,d6
    13ae:	4dee 0015      	lea 21(a6),a6
  for(int i=0;i<12;i++) {
    13b2:	4fef 0020      	lea 32(sp),sp
    13b6:	bcfc 0114      	cmpa.w #276,a6
    13ba:	6600 ff06      	bne.w 12c2 <main+0x12bc>
    13be:	2647           	movea.l d7,a3
    13c0:	41eb 3124      	lea 12580(a3),a0
    13c4:	2b48 ff7c      	move.l a0,-132(a5)
    13c8:	263c 0000 0105 	move.l #261,d3
  }

  for(int i2=0;i2<8;i2++) {  
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    13ce:	2f03           	move.l d3,-(sp)
    13d0:	2f04           	move.l d4,-(sp)
    13d2:	2f2d ff7c      	move.l -132(a5),-(sp)
    13d6:	4879 0000 6ef0 	pea 6ef0 <destlinezoom3>
    13dc:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    13de:	7030           	moveq #48,d0
    13e0:	d1ad ff7c      	add.l d0,-132(a5)
    mask = mask ^ 0xffff;
    13e4:	5283           	addq.l #1,d3
  for(int i2=0;i2<8;i2++) {  
    13e6:	4fef 0010      	lea 16(sp),sp
    13ea:	0c83 0000 010d 	cmpi.l #269,d3
    13f0:	672a           	beq.s 141c <main+0x1416>
    13f2:	7800           	moveq #0,d4
    13f4:	3802           	move.w d2,d4
    13f6:	4642           	not.w d2
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    13f8:	2f03           	move.l d3,-(sp)
    13fa:	2f04           	move.l d4,-(sp)
    13fc:	2f2d ff7c      	move.l -132(a5),-(sp)
    1400:	4879 0000 6ef0 	pea 6ef0 <destlinezoom3>
    1406:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1408:	7030           	moveq #48,d0
    140a:	d1ad ff7c      	add.l d0,-132(a5)
    mask = mask ^ 0xffff;
    140e:	5283           	addq.l #1,d3
  for(int i2=0;i2<8;i2++) {  
    1410:	4fef 0010      	lea 16(sp),sp
    1414:	0c83 0000 010d 	cmpi.l #269,d3
    141a:	66d6           	bne.s 13f2 <main+0x13ec>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 3);
    141c:	4878 0003      	pea 3 <_start+0x3>
    1420:	2f0c           	move.l a4,-(sp)
    1422:	2f0b           	move.l a3,-(sp)
    1424:	4eb9 0000 2f8c 	jsr 2f8c <Zoom_ZoomIntoPicture>
  WaitBlit();
    142a:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    1430:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom4;
  mask = 0x0000;
  
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    1434:	4878 0007      	pea 7 <main+0x1>
    1438:	42a7           	clr.l -(sp)
    143a:	2f2d ff74      	move.l -140(a5),-(sp)
    143e:	4879 0000 6ec4 	pea 6ec4 <destlinezoom4>
    1444:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    1446:	41ec 0034      	lea 52(a4),a0
    144a:	2b48 ff88      	move.l a0,-120(a5)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    144e:	4878 0008      	pea 8 <main+0x2>
    1452:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1458:	2f08           	move.l a0,-(sp)
    145a:	4879 0000 6ec4 	pea 6ec4 <destlinezoom4>
    1460:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    1462:	41ec 0064      	lea 100(a4),a0
    1466:	2b48 ff94      	move.l a0,-108(a5)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    146a:	4fef 002c      	lea 44(sp),sp
    146e:	4878 0009      	pea 9 <main+0x3>
    1472:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1478:	2f08           	move.l a0,-(sp)
    147a:	4879 0000 6ec4 	pea 6ec4 <destlinezoom4>
    1480:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    1482:	41ec 0094      	lea 148(a4),a0
    1486:	2b48 ff7c      	move.l a0,-132(a5)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    148a:	4878 0008      	pea 8 <main+0x2>
    148e:	42a7           	clr.l -(sp)
    1490:	2f08           	move.l a0,-(sp)
    1492:	4879 0000 6ec4 	pea 6ec4 <destlinezoom4>
    1498:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    149a:	4fef 0020      	lea 32(sp),sp
    149e:	4878 0009      	pea 9 <main+0x3>
    14a2:	42a7           	clr.l -(sp)
    14a4:	486c 00c4      	pea 196(a4)
    14a8:	4879 0000 6ec4 	pea 6ec4 <destlinezoom4>
    14ae:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;

  mask = 0xffff;
  for(int i=0;i<12;i++) {
    14b0:	2c0c           	move.l a4,d6
    14b2:	0686 0000 0394 	addi.l #916,d6
    14b8:	4fef 0010      	lea 16(sp),sp
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    14bc:	3c7c 0018      	movea.w #24,a6
  mask = 0xffff;
    14c0:	78ff           	moveq #-1,d4
    14c2:	7400           	moveq #0,d2
    14c4:	4642           	not.w d2
    14c6:	2e0b           	move.l a3,d7
    14c8:	2046           	movea.l d6,a0
    14ca:	41e8 fd60      	lea -672(a0),a0
    14ce:	2b48 ff8c      	move.l a0,-116(a5)
    14d2:	47ee fff1      	lea -15(a6),a3
    14d6:	2602           	move.l d2,d3
    for(int i2=0;i2<14;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    14d8:	2f0b           	move.l a3,-(sp)
    14da:	2f03           	move.l d3,-(sp)
    14dc:	2f2d ff8c      	move.l -116(a5),-(sp)
    14e0:	4879 0000 6ec4 	pea 6ec4 <destlinezoom4>
    14e6:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    14e8:	7030           	moveq #48,d0
    14ea:	d1ad ff8c      	add.l d0,-116(a5)
      mask = mask ^ 0xffff;
    14ee:	4644           	not.w d4
    14f0:	528b           	addq.l #1,a3
    for(int i2=0;i2<14;i2++) {  
    14f2:	4fef 0010      	lea 16(sp),sp
    14f6:	bcad ff8c      	cmp.l -116(a5),d6
    14fa:	6728           	beq.s 1524 <main+0x151e>
    14fc:	7600           	moveq #0,d3
    14fe:	3604           	move.w d4,d3
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    1500:	2f0b           	move.l a3,-(sp)
    1502:	2f03           	move.l d3,-(sp)
    1504:	2f2d ff8c      	move.l -116(a5),-(sp)
    1508:	4879 0000 6ec4 	pea 6ec4 <destlinezoom4>
    150e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1510:	7030           	moveq #48,d0
    1512:	d1ad ff8c      	add.l d0,-116(a5)
      mask = mask ^ 0xffff;
    1516:	4644           	not.w d4
    1518:	528b           	addq.l #1,a3
    for(int i2=0;i2<14;i2++) {  
    151a:	4fef 0010      	lea 16(sp),sp
    151e:	bcad ff8c      	cmp.l -116(a5),d6
    1522:	66d8           	bne.s 14fc <main+0x14f6>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    1524:	7400           	moveq #0,d2
    1526:	3404           	move.w d4,d2
    1528:	2f0e           	move.l a6,-(sp)
    152a:	2f02           	move.l d2,-(sp)
    152c:	2f2d ff8c      	move.l -116(a5),-(sp)
    1530:	4879 0000 6ec4 	pea 6ec4 <destlinezoom4>
    1536:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    1538:	486e 0001      	pea 1(a6)
    153c:	2f02           	move.l d2,-(sp)
    153e:	206d ff8c      	movea.l -116(a5),a0
    1542:	4868 0030      	pea 48(a0)
    1546:	4879 0000 6ec4 	pea 6ec4 <destlinezoom4>
    154c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    154e:	4fef 0020      	lea 32(sp),sp
    1552:	486e 0002      	pea 2(a6)
    1556:	2f03           	move.l d3,-(sp)
    1558:	206d ff8c      	movea.l -116(a5),a0
    155c:	4868 0060      	pea 96(a0)
    1560:	4879 0000 6ec4 	pea 6ec4 <destlinezoom4>
    1566:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    1568:	486e 0003      	pea 3(a6)
    156c:	2f03           	move.l d3,-(sp)
    156e:	206d ff8c      	movea.l -116(a5),a0
    1572:	4868 0090      	pea 144(a0)
    1576:	4879 0000 6ec4 	pea 6ec4 <destlinezoom4>
    157c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    157e:	47ee 0004      	lea 4(a6),a3
    1582:	4fef 001c      	lea 28(sp),sp
    1586:	2e8b           	move.l a3,(sp)
    1588:	2f02           	move.l d2,-(sp)
    158a:	206d ff8c      	movea.l -116(a5),a0
    158e:	4868 00c0      	pea 192(a0)
    1592:	4879 0000 6ec4 	pea 6ec4 <destlinezoom4>
    1598:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    159a:	2c0e           	move.l a6,d6
    159c:	5a86           	addq.l #5,d6
    159e:	2f06           	move.l d6,-(sp)
    15a0:	2f02           	move.l d2,-(sp)
    15a2:	206d ff8c      	movea.l -116(a5),a0
    15a6:	4868 00f0      	pea 240(a0)
    15aa:	4879 0000 6ec4 	pea 6ec4 <destlinezoom4>
    15b0:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    15b2:	4fef 001c      	lea 28(sp),sp
    15b6:	2e8b           	move.l a3,(sp)
    15b8:	2f03           	move.l d3,-(sp)
    15ba:	206d ff8c      	movea.l -116(a5),a0
    15be:	4868 0120      	pea 288(a0)
    15c2:	4879 0000 6ec4 	pea 6ec4 <destlinezoom4>
    15c8:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    15ca:	2f06           	move.l d6,-(sp)
    15cc:	2f03           	move.l d3,-(sp)
    15ce:	206d ff8c      	movea.l -116(a5),a0
    15d2:	4868 0150      	pea 336(a0)
    15d6:	4879 0000 6ec4 	pea 6ec4 <destlinezoom4>
    15dc:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    15de:	2c2d ff8c      	move.l -116(a5),d6
    15e2:	0686 0000 0420 	addi.l #1056,d6
    15e8:	4dee 0015      	lea 21(a6),a6
  for(int i=0;i<12;i++) {
    15ec:	4fef 0020      	lea 32(sp),sp
    15f0:	bcfc 0114      	cmpa.w #276,a6
    15f4:	6600 fed2      	bne.w 14c8 <main+0x14c2>
    15f8:	2647           	movea.l d7,a3
  }

  TestRow( valsupposed, valactual, mask, 269);
    15fa:	4878 010d      	pea 10d <main+0x107>
    15fe:	2f02           	move.l d2,-(sp)
    1600:	486c 3274      	pea 12916(a4)
    1604:	4879 0000 6ec4 	pea 6ec4 <destlinezoom4>
    160a:	4e92           	jsr (a2)
  
  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 4);
    160c:	4878 0004      	pea 4 <_start+0x4>
    1610:	2f07           	move.l d7,-(sp)
    1612:	2f0c           	move.l a4,-(sp)
    1614:	4eb9 0000 2f8c 	jsr 2f8c <Zoom_ZoomIntoPicture>
  WaitBlit();
    161a:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    1620:	4eae ff1c      	jsr -228(a6)
    1624:	4fef 001c      	lea 28(sp),sp

  valactual = destination+2; 
    1628:	2b6d ff84 ff8c 	move.l -124(a5),-116(a5)
  valsupposed = destlinezoom5;
  mask = 0x0000;

  for(int i2=0;i2<13;i2++) {  
    162e:	7600           	moveq #0,d3
  mask = 0x0000;
    1630:	4244           	clr.w d4
    TestRow( valsupposed, valactual, mask, i2);
    1632:	7400           	moveq #0,d2
    1634:	3404           	move.w d4,d2
    1636:	2f03           	move.l d3,-(sp)
    1638:	2f02           	move.l d2,-(sp)
    163a:	2f2d ff8c      	move.l -116(a5),-(sp)
    163e:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    1644:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1646:	7030           	moveq #48,d0
    1648:	d1ad ff8c      	add.l d0,-116(a5)
    mask = mask ^ 0xffff;
    164c:	4644           	not.w d4
  for(int i2=0;i2<13;i2++) {  
    164e:	5283           	addq.l #1,d3
    1650:	4fef 0010      	lea 16(sp),sp
    1654:	700d           	moveq #13,d0
    1656:	b083           	cmp.l d3,d0
    1658:	66d8           	bne.s 1632 <main+0x162c>
    165a:	7600           	moveq #0,d3
    165c:	3604           	move.w d4,d3
  }

  TestRow( valsupposed, valactual, mask, 12);   
    165e:	4878 000c      	pea c <main+0x6>
    1662:	2f03           	move.l d3,-(sp)
    1664:	486b 0274      	pea 628(a3)
    1668:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    166e:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 13);
    1670:	4878 000d      	pea d <main+0x7>
    1674:	2f03           	move.l d3,-(sp)
    1676:	486b 02a4      	pea 676(a3)
    167a:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    1680:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 14);
    1682:	4fef 0020      	lea 32(sp),sp
    1686:	4878 000e      	pea e <main+0x8>
    168a:	2f02           	move.l d2,-(sp)
    168c:	486b 02d4      	pea 724(a3)
    1690:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    1696:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 15);
    1698:	4878 000f      	pea f <main+0x9>
    169c:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    169e:	41eb 0304      	lea 772(a3),a0
    16a2:	2b48 ff90      	move.l a0,-112(a5)
  TestRow( valsupposed, valactual, mask, 15);
    16a6:	2f08           	move.l a0,-(sp)
    16a8:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    16ae:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 16);
    16b0:	4fef 0020      	lea 32(sp),sp
    16b4:	4878 0010      	pea 10 <main+0xa>
    16b8:	2f03           	move.l d3,-(sp)
    16ba:	486b 0334      	pea 820(a3)
    16be:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    16c4:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 17);
    16c6:	4878 0011      	pea 11 <main+0xb>
    16ca:	2f03           	move.l d3,-(sp)
    16cc:	2f2d ff78      	move.l -136(a5),-(sp)
    16d0:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    16d6:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 18);
    16d8:	4fef 0020      	lea 32(sp),sp
    16dc:	4878 0012      	pea 12 <main+0xc>
    16e0:	2f02           	move.l d2,-(sp)
    16e2:	486b 0394      	pea 916(a3)
    16e6:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    16ec:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 19);
    16ee:	4878 0013      	pea 13 <main+0xd>
    16f2:	2f02           	move.l d2,-(sp)
    16f4:	486b 03c4      	pea 964(a3)
    16f8:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    16fe:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 20);
    1700:	4fef 0020      	lea 32(sp),sp
    1704:	4878 0014      	pea 14 <main+0xe>
    1708:	2f03           	move.l d3,-(sp)
    170a:	486b 03f4      	pea 1012(a3)
    170e:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    1714:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 21);
    1716:	4878 0015      	pea 15 <main+0xf>
    171a:	2f03           	move.l d3,-(sp)
    171c:	486b 0424      	pea 1060(a3)
    1720:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    1726:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;


  for(int i=0;i<10;i++) {
    1728:	2c0b           	move.l a3,d6
    172a:	0686 0000 06c4 	addi.l #1732,d6
    1730:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, mask, 21);
    1734:	307c 0023      	movea.w #35,a0
    1738:	2b48 ff70      	move.l a0,-144(a5)
    173c:	2e0b           	move.l a3,d7
    173e:	2c46           	movea.l d6,a6
    1740:	4dee fd90      	lea -624(a6),a6
    1744:	367c fff3      	movea.w #-13,a3
    1748:	d7ed ff70      	adda.l -144(a5),a3
    for(int i2=0;i2<13;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    174c:	2f0b           	move.l a3,-(sp)
    174e:	2f02           	move.l d2,-(sp)
    1750:	2f0e           	move.l a6,-(sp)
    1752:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    1758:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    175a:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    175e:	528b           	addq.l #1,a3
    for(int i2=0;i2<13;i2++) {  
    1760:	4fef 0010      	lea 16(sp),sp
    1764:	bc8e           	cmp.l a6,d6
    1766:	6722           	beq.s 178a <main+0x1784>
    1768:	7400           	moveq #0,d2
    176a:	3404           	move.w d4,d2
    176c:	4644           	not.w d4
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    176e:	2f0b           	move.l a3,-(sp)
    1770:	2f02           	move.l d2,-(sp)
    1772:	2f0e           	move.l a6,-(sp)
    1774:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    177a:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    177c:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    1780:	528b           	addq.l #1,a3
    for(int i2=0;i2<13;i2++) {  
    1782:	4fef 0010      	lea 16(sp),sp
    1786:	bc8e           	cmp.l a6,d6
    1788:	66de           	bne.s 1768 <main+0x1762>
    }

    TestRow( valsupposed, valactual, mask, i*21+22+13);
    178a:	7600           	moveq #0,d3
    178c:	3604           	move.w d4,d3
    178e:	2f2d ff70      	move.l -144(a5),-(sp)
    1792:	2f03           	move.l d3,-(sp)
    1794:	2f0e           	move.l a6,-(sp)
    1796:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    179c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    179e:	206d ff70      	movea.l -144(a5),a0
    17a2:	4868 0001      	pea 1(a0)
    17a6:	2f03           	move.l d3,-(sp)
    17a8:	486e 0030      	pea 48(a6)
    17ac:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    17b2:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    17b4:	4fef 0020      	lea 32(sp),sp
    17b8:	206d ff70      	movea.l -144(a5),a0
    17bc:	4868 0002      	pea 2(a0)
    17c0:	2f02           	move.l d2,-(sp)
    17c2:	486e 0060      	pea 96(a6)
    17c6:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    17cc:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    17ce:	206d ff70      	movea.l -144(a5),a0
    17d2:	4868 0003      	pea 3(a0)
    17d6:	2f02           	move.l d2,-(sp)
    17d8:	486e 0090      	pea 144(a6)
    17dc:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    17e2:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    17e4:	4fef 0020      	lea 32(sp),sp
    17e8:	206d ff70      	movea.l -144(a5),a0
    17ec:	4868 0004      	pea 4(a0)
    17f0:	2f03           	move.l d3,-(sp)
    17f2:	486e 00c0      	pea 192(a6)
    17f6:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    17fc:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    17fe:	206d ff70      	movea.l -144(a5),a0
    1802:	4868 0005      	pea 5(a0)
    1806:	2f03           	move.l d3,-(sp)
    1808:	486e 00f0      	pea 240(a6)
    180c:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    1812:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    1814:	4fef 0020      	lea 32(sp),sp
    1818:	206d ff70      	movea.l -144(a5),a0
    181c:	4868 0006      	pea 6(a0)
    1820:	2f02           	move.l d2,-(sp)
    1822:	486e 0120      	pea 288(a6)
    1826:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    182c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    182e:	206d ff70      	movea.l -144(a5),a0
    1832:	4868 0007      	pea 7(a0)
    1836:	2f02           	move.l d2,-(sp)
    1838:	486e 0150      	pea 336(a6)
    183c:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    1842:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    1844:	4fef 0020      	lea 32(sp),sp
    1848:	206d ff70      	movea.l -144(a5),a0
    184c:	4868 0008      	pea 8(a0)
    1850:	2f03           	move.l d3,-(sp)
    1852:	486e 0180      	pea 384(a6)
    1856:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    185c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    185e:	206d ff70      	movea.l -144(a5),a0
    1862:	4868 0009      	pea 9(a0)
    1866:	2f03           	move.l d3,-(sp)
    1868:	486e 01b0      	pea 432(a6)
    186c:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    1872:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1874:	2c0e           	move.l a6,d6
    1876:	0686 0000 0450 	addi.l #1104,d6
    187c:	7015           	moveq #21,d0
    187e:	d1ad ff70      	add.l d0,-144(a5)
  for(int i=0;i<10;i++) {
    1882:	4fef 0020      	lea 32(sp),sp
    1886:	0cad 0000 00f5 	cmpi.l #245,-144(a5)
    188c:	ff70 
    188e:	6600 feae      	bne.w 173e <main+0x1738>
    1892:	2647           	movea.l d7,a3
    1894:	4deb 2f74      	lea 12148(a3),a6
    1898:	7602           	moveq #2,d3
    189a:	4603           	not.b d3
  }

  for(int i2=0;i2<13;i2++) {  
    TestRow( valsupposed, valactual, mask, i2+253);
    189c:	2f03           	move.l d3,-(sp)
    189e:	2f02           	move.l d2,-(sp)
    18a0:	2f0e           	move.l a6,-(sp)
    18a2:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    18a8:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    18aa:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    18ae:	5283           	addq.l #1,d3
  for(int i2=0;i2<13;i2++) {  
    18b0:	4fef 0010      	lea 16(sp),sp
    18b4:	0c83 0000 010a 	cmpi.l #266,d3
    18ba:	6726           	beq.s 18e2 <main+0x18dc>
    18bc:	7400           	moveq #0,d2
    18be:	3404           	move.w d4,d2
    18c0:	4644           	not.w d4
    TestRow( valsupposed, valactual, mask, i2+253);
    18c2:	2f03           	move.l d3,-(sp)
    18c4:	2f02           	move.l d2,-(sp)
    18c6:	2f0e           	move.l a6,-(sp)
    18c8:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    18ce:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    18d0:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    18d4:	5283           	addq.l #1,d3
  for(int i2=0;i2<13;i2++) {  
    18d6:	4fef 0010      	lea 16(sp),sp
    18da:	0c83 0000 010a 	cmpi.l #266,d3
    18e0:	66da           	bne.s 18bc <main+0x18b6>
    18e2:	0284 0000 ffff 	andi.l #65535,d4
  }

  TestRow( valsupposed, valactual, mask, 266);
    18e8:	2f03           	move.l d3,-(sp)
    18ea:	2f04           	move.l d4,-(sp)
    18ec:	2f2d ff80      	move.l -128(a5),-(sp)
    18f0:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    18f6:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 267);
    18f8:	4878 010b      	pea 10b <main+0x105>
    18fc:	2f04           	move.l d4,-(sp)
  valactual += ZMLINESIZE/2;
    18fe:	41eb 3214      	lea 12820(a3),a0
    1902:	2b48 ffa4      	move.l a0,-92(a5)
  TestRow( valsupposed, valactual, mask, 267);
    1906:	2f08           	move.l a0,-(sp)
    1908:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    190e:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 268);
    1910:	4fef 0020      	lea 32(sp),sp
    1914:	4878 010c      	pea 10c <main+0x106>
    1918:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    191a:	41eb 3244      	lea 12868(a3),a0
    191e:	2b48 ffa8      	move.l a0,-88(a5)
  TestRow( valsupposed, valactual, mask, 268);
    1922:	2f08           	move.l a0,-(sp)
    1924:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    192a:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 269);
    192c:	4878 010d      	pea 10d <main+0x107>
    1930:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    1932:	41eb 3274      	lea 12916(a3),a0
    1936:	2b48 ff80      	move.l a0,-128(a5)
  TestRow( valsupposed, valactual, mask, 269);
    193a:	2f08           	move.l a0,-(sp)
    193c:	4879 0000 6e98 	pea 6e98 <destlinezoom5>
    1942:	4e92           	jsr (a2)

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 5);
    1944:	4fef 0020      	lea 32(sp),sp
    1948:	4878 0005      	pea 5 <_start+0x5>
    194c:	2f0c           	move.l a4,-(sp)
    194e:	2f0b           	move.l a3,-(sp)
    1950:	4eb9 0000 2f8c 	jsr 2f8c <Zoom_ZoomIntoPicture>
  WaitBlit();
    1956:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    195c:	4eae ff1c      	jsr -228(a6)
    1960:	4fef 000c      	lea 12(sp),sp
  valactual = destination+2; 
    1964:	2c6d ff74      	movea.l -140(a5),a6
  valsupposed = destlinezoom6;
  mask = 0x0000;
 
  for(int i2=0;i2<7;i2++) {  
    1968:	7400           	moveq #0,d2
  mask = 0x0000;
    196a:	4243           	clr.w d3
    TestRow( valsupposed, valactual, mask, i2);
    196c:	2f02           	move.l d2,-(sp)
    196e:	3f03           	move.w d3,-(sp)
    1970:	4267           	clr.w -(sp)
    1972:	2f0e           	move.l a6,-(sp)
    1974:	4879 0000 6e6c 	pea 6e6c <destlinezoom6>
    197a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    197c:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1980:	4643           	not.w d3
  for(int i2=0;i2<7;i2++) {  
    1982:	5282           	addq.l #1,d2
    1984:	4fef 0010      	lea 16(sp),sp
    1988:	7007           	moveq #7,d0
    198a:	b082           	cmp.l d2,d0
    198c:	66de           	bne.s 196c <main+0x1966>
    198e:	4dec 0154      	lea 340(a4),a6
    1992:	7407           	moveq #7,d2
    1994:	280b           	move.l a3,d4
    1996:	264e           	movea.l a6,a3
    1998:	2c42           	movea.l d2,a6
  }

  for(int i=0;i<6;i++) {
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    199a:	7400           	moveq #0,d2
    199c:	3403           	move.w d3,d2
    199e:	2f0e           	move.l a6,-(sp)
    19a0:	2f02           	move.l d2,-(sp)
    19a2:	2f0b           	move.l a3,-(sp)
    19a4:	4879 0000 6e6c 	pea 6e6c <destlinezoom6>
    19aa:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    19ac:	486e 0001      	pea 1(a6)
    19b0:	2f02           	move.l d2,-(sp)
    19b2:	486b 0030      	pea 48(a3)
    19b6:	4879 0000 6e6c 	pea 6e6c <destlinezoom6>
    19bc:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    19be:	4643           	not.w d3
    19c0:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    19c2:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<6;i++) {
    19c6:	4fef 0020      	lea 32(sp),sp
    19ca:	7013           	moveq #19,d0
    19cc:	b08e           	cmp.l a6,d0
    19ce:	66ca           	bne.s 199a <main+0x1994>
    19d0:	240e           	move.l a6,d2
    19d2:	2c04           	move.l d4,d6
    19d4:	2c45           	movea.l d5,a6
    19d6:	4dee fdc0      	lea -576(a6),a6
  for(int i2=0;i2<7;i2++) {  
    19da:	2802           	move.l d2,d4
  }

  for(int i=0;i<10;i++) {
    for(int i2=0;i2<12;i2++) {  
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    19dc:	2f04           	move.l d4,-(sp)
    19de:	3f03           	move.w d3,-(sp)
    19e0:	4267           	clr.w -(sp)
    19e2:	2f0e           	move.l a6,-(sp)
    19e4:	4879 0000 6e6c 	pea 6e6c <destlinezoom6>
    19ea:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    19ec:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    19f0:	4643           	not.w d3
    19f2:	5284           	addq.l #1,d4
    for(int i2=0;i2<12;i2++) {  
    19f4:	4fef 0010      	lea 16(sp),sp
    19f8:	ba8e           	cmp.l a6,d5
    19fa:	66e0           	bne.s 19dc <main+0x19d6>
    19fc:	367c 001f      	movea.w #31,a3
    }
    for(int i=0;i<6;i++) {
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    1a00:	7800           	moveq #0,d4
    1a02:	3803           	move.w d3,d4
    1a04:	2f0b           	move.l a3,-(sp)
    1a06:	2f04           	move.l d4,-(sp)
    1a08:	2f0e           	move.l a6,-(sp)
    1a0a:	4879 0000 6e6c 	pea 6e6c <destlinezoom6>
    1a10:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 32+i*24);
    1a12:	486b 0001      	pea 1(a3)
    1a16:	2f04           	move.l d4,-(sp)
    1a18:	486e 0030      	pea 48(a6)
    1a1c:	4879 0000 6e6c 	pea 6e6c <destlinezoom6>
    1a22:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    1a24:	4643           	not.w d3
    1a26:	47eb 0018      	lea 24(a3),a3
      valactual += ZMLINESIZE/2;
    1a2a:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<6;i++) {
    1a2e:	4fef 0020      	lea 32(sp),sp
    1a32:	b6fc 00af      	cmpa.w #175,a3
    1a36:	66c8           	bne.s 1a00 <main+0x19fa>
    1a38:	0685 0000 0480 	addi.l #1152,d5
    1a3e:	7018           	moveq #24,d0
    1a40:	d480           	add.l d0,d2
  for(int i=0;i<10;i++) {
    1a42:	0c82 0000 0103 	cmpi.l #259,d2
    1a48:	668a           	bne.s 19d4 <main+0x19ce>
    1a4a:	2646           	movea.l d6,a3
    1a4c:	4dec 3094      	lea 12436(a4),a6
    1a50:	283c 0000 0102 	move.l #258,d4
    }
  }

  for(int i2=0;i2<11;i2++) {  
    TestRow( valsupposed, valactual, mask, 258+i2);
    1a56:	2f04           	move.l d4,-(sp)
    1a58:	3f03           	move.w d3,-(sp)
    1a5a:	4267           	clr.w -(sp)
    1a5c:	2f0e           	move.l a6,-(sp)
    1a5e:	4879 0000 6e6c 	pea 6e6c <destlinezoom6>
    1a64:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1a66:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1a6a:	4643           	not.w d3
    1a6c:	5284           	addq.l #1,d4
  for(int i2=0;i2<11;i2++) {  
    1a6e:	4fef 0010      	lea 16(sp),sp
    1a72:	0c84 0000 010d 	cmpi.l #269,d4
    1a78:	66dc           	bne.s 1a56 <main+0x1a50>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 6);
    1a7a:	4878 0006      	pea 6 <main>
    1a7e:	2f0b           	move.l a3,-(sp)
    1a80:	2f0c           	move.l a4,-(sp)
    1a82:	4eb9 0000 2f8c 	jsr 2f8c <Zoom_ZoomIntoPicture>
  WaitBlit();
    1a88:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    1a8e:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom7;
  mask = 0x0000;
 
  TestRow( valsupposed, valactual, mask, 0);
    1a92:	42a7           	clr.l -(sp)
    1a94:	42a7           	clr.l -(sp)
    1a96:	2f2d ff84      	move.l -124(a5),-(sp)
    1a9a:	4879 0000 6e40 	pea 6e40 <destlinezoom7>
    1aa0:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    1aa2:	41eb 0034      	lea 52(a3),a0
    1aa6:	2b48 ff8c      	move.l a0,-116(a5)
    1aaa:	4fef 001c      	lea 28(sp),sp
    1aae:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    1ab2:	7eff           	moveq #-1,d7
    1ab4:	280b           	move.l a3,d4
    1ab6:	2648           	movea.l a0,a3
  for(int i=0;i<7;i++) {
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    1ab8:	7600           	moveq #0,d3
    1aba:	3607           	move.w d7,d3
    1abc:	2f0e           	move.l a6,-(sp)
    1abe:	2f03           	move.l d3,-(sp)
    1ac0:	2f0b           	move.l a3,-(sp)
    1ac2:	4879 0000 6e40 	pea 6e40 <destlinezoom7>
    1ac8:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    1aca:	486e 0001      	pea 1(a6)
    1ace:	2f03           	move.l d3,-(sp)
    1ad0:	486b 0030      	pea 48(a3)
    1ad4:	4879 0000 6e40 	pea 6e40 <destlinezoom7>
    1ada:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1adc:	4647           	not.w d7
    1ade:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    1ae0:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<7;i++) {
    1ae4:	4fef 0020      	lea 32(sp),sp
    1ae8:	700f           	moveq #15,d0
    1aea:	b08e           	cmp.l a6,d0
    1aec:	66ca           	bne.s 1ab8 <main+0x1ab2>
    1aee:	2604           	move.l d4,d3
    1af0:	0683 0000 04e4 	addi.l #1252,d3
    1af6:	2a0c           	move.l a4,d5
    1af8:	2c04           	move.l d4,d6
    1afa:	284e           	movea.l a6,a4
    1afc:	2c43           	movea.l d3,a6
    1afe:	4dee fdf0      	lea -528(a6),a6
  mask = mask ^ 0xffff;
    1b02:	280c           	move.l a4,d4
  }

  for(int i=0;i<10;i++) {
    for(int i2=0;i2<11;i2++) {  
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    1b04:	2f04           	move.l d4,-(sp)
    1b06:	3f07           	move.w d7,-(sp)
    1b08:	4267           	clr.w -(sp)
    1b0a:	2f0e           	move.l a6,-(sp)
    1b0c:	4879 0000 6e40 	pea 6e40 <destlinezoom7>
    1b12:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1b14:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    1b18:	4647           	not.w d7
    1b1a:	5284           	addq.l #1,d4
    for(int i2=0;i2<11;i2++) {  
    1b1c:	4fef 0010      	lea 16(sp),sp
    1b20:	b68e           	cmp.l a6,d3
    1b22:	66e0           	bne.s 1b04 <main+0x1afe>
    1b24:	367c 001a      	movea.w #26,a3
    }
    for(int i=0;i<7;i++) {
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    1b28:	7800           	moveq #0,d4
    1b2a:	3807           	move.w d7,d4
    1b2c:	2f0b           	move.l a3,-(sp)
    1b2e:	2f04           	move.l d4,-(sp)
    1b30:	2f0e           	move.l a6,-(sp)
    1b32:	4879 0000 6e40 	pea 6e40 <destlinezoom7>
    1b38:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 26+i*25);
    1b3a:	2f0b           	move.l a3,-(sp)
    1b3c:	2f04           	move.l d4,-(sp)
    1b3e:	486e 0030      	pea 48(a6)
    1b42:	4879 0000 6e40 	pea 6e40 <destlinezoom7>
    1b48:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    1b4a:	4647           	not.w d7
    1b4c:	47eb 0019      	lea 25(a3),a3
      valactual += ZMLINESIZE/2;
    1b50:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<7;i++) {
    1b54:	4fef 0020      	lea 32(sp),sp
    1b58:	b6fc 00c9      	cmpa.w #201,a3
    1b5c:	66ca           	bne.s 1b28 <main+0x1b22>
    1b5e:	0683 0000 04b0 	addi.l #1200,d3
    1b64:	49ec 0019      	lea 25(a4),a4
  for(int i=0;i<10;i++) {
    1b68:	b8fc 0109      	cmpa.w #265,a4
    1b6c:	668e           	bne.s 1afc <main+0x1af6>
    1b6e:	2845           	movea.l d5,a4
    1b70:	2646           	movea.l d6,a3
    1b72:	4deb 31b4      	lea 12724(a3),a6
    1b76:	263c 0000 0100 	move.l #256,d3
    }
  }

  for(int i2=0;i2<5;i2++) {  
    TestRow( valsupposed, valactual, mask, 256+i2);
    1b7c:	2f03           	move.l d3,-(sp)
    1b7e:	3f07           	move.w d7,-(sp)
    1b80:	4267           	clr.w -(sp)
    1b82:	2f0e           	move.l a6,-(sp)
    1b84:	4879 0000 6e40 	pea 6e40 <destlinezoom7>
    1b8a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1b8c:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1b90:	4647           	not.w d7
    1b92:	5283           	addq.l #1,d3
  for(int i2=0;i2<5;i2++) {  
    1b94:	4fef 0010      	lea 16(sp),sp
    1b98:	0c83 0000 0105 	cmpi.l #261,d3
    1b9e:	66dc           	bne.s 1b7c <main+0x1b76>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 7);
    1ba0:	4878 0007      	pea 7 <main+0x1>
    1ba4:	2f0c           	move.l a4,-(sp)
    1ba6:	2f0b           	move.l a3,-(sp)
    1ba8:	4eb9 0000 2f8c 	jsr 2f8c <Zoom_ZoomIntoPicture>
  WaitBlit();
    1bae:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    1bb4:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom8;
  mask = 0xffff;
 
  TestRow( valsupposed, valactual, mask, 0);
    1bb8:	42a7           	clr.l -(sp)
    1bba:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1bc0:	2f2d ff74      	move.l -140(a5),-(sp)
    1bc4:	4879 0000 6e14 	pea 6e14 <destlinezoom8>
    1bca:	4e92           	jsr (a2)
    1bcc:	4fef 001c      	lea 28(sp),sp
    1bd0:	2b6d ff7c ff78 	move.l -132(a5),-136(a5)
  valactual += ZMLINESIZE/2;
    1bd6:	2a2d ff88      	move.l -120(a5),d5
  TestRow( valsupposed, valactual, mask, 0);
    1bda:	7601           	moveq #1,d3
  mask = mask ^ 0xffff;
    1bdc:	4244           	clr.w d4
    1bde:	2c43           	movea.l d3,a6
    1be0:	2c2d ff78      	move.l -136(a5),d6
  for(int i=0;i<5;i++) {
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    1be4:	7600           	moveq #0,d3
    1be6:	3604           	move.w d4,d3
    1be8:	2f0e           	move.l a6,-(sp)
    1bea:	2f03           	move.l d3,-(sp)
    1bec:	2f05           	move.l d5,-(sp)
    1bee:	4879 0000 6e14 	pea 6e14 <destlinezoom8>
    1bf4:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    1bf6:	486e 0001      	pea 1(a6)
    1bfa:	2f03           	move.l d3,-(sp)
    1bfc:	2045           	movea.l d5,a0
    1bfe:	4868 0030      	pea 48(a0)
    1c02:	4879 0000 6e14 	pea 6e14 <destlinezoom8>
    1c08:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1c0a:	4644           	not.w d4
    1c0c:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    1c0e:	4fef 0020      	lea 32(sp),sp
    1c12:	700b           	moveq #11,d0
    1c14:	b08e           	cmp.l a6,d0
    1c16:	6740           	beq.s 1c58 <main+0x1c52>
    1c18:	2005           	move.l d5,d0
    1c1a:	0680 0000 00c0 	addi.l #192,d0
    1c20:	2a06           	move.l d6,d5
    1c22:	2c00           	move.l d0,d6
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    1c24:	7600           	moveq #0,d3
    1c26:	3604           	move.w d4,d3
    1c28:	2f0e           	move.l a6,-(sp)
    1c2a:	2f03           	move.l d3,-(sp)
    1c2c:	2f05           	move.l d5,-(sp)
    1c2e:	4879 0000 6e14 	pea 6e14 <destlinezoom8>
    1c34:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    1c36:	486e 0001      	pea 1(a6)
    1c3a:	2f03           	move.l d3,-(sp)
    1c3c:	2045           	movea.l d5,a0
    1c3e:	4868 0030      	pea 48(a0)
    1c42:	4879 0000 6e14 	pea 6e14 <destlinezoom8>
    1c48:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    1c4a:	4644           	not.w d4
    1c4c:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    1c4e:	4fef 0020      	lea 32(sp),sp
    1c52:	700b           	moveq #11,d0
    1c54:	b08e           	cmp.l a6,d0
    1c56:	66c0           	bne.s 1c18 <main+0x1c12>
    1c58:	260e           	move.l a6,d3
    1c5a:	2b46 ff78      	move.l d6,-136(a5)
    1c5e:	0686 0000 01e0 	addi.l #480,d6
    1c64:	7e15           	moveq #21,d7
    1c66:	2b4c ffac      	move.l a4,-84(a5)
    1c6a:	2b4b ffb0      	move.l a3,-80(a5)
    1c6e:	2647           	movea.l d7,a3
    1c70:	2c46           	movea.l d6,a6
    1c72:	4dee fe20      	lea -480(a6),a6
    1c76:	49eb fff6      	lea -10(a3),a4
  }

  for(int i=0;i<9;i++) {
    for(int i2=0;i2<10;i2++) {  
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    1c7a:	2f0c           	move.l a4,-(sp)
    1c7c:	3f04           	move.w d4,-(sp)
    1c7e:	4267           	clr.w -(sp)
    1c80:	2f0e           	move.l a6,-(sp)
    1c82:	4879 0000 6e14 	pea 6e14 <destlinezoom8>
    1c88:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1c8a:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    1c8e:	4644           	not.w d4
    1c90:	528c           	addq.l #1,a4
    for(int i2=0;i2<10;i2++) {  
    1c92:	4fef 0010      	lea 16(sp),sp
    1c96:	bc8e           	cmp.l a6,d6
    1c98:	66e0           	bne.s 1c7a <main+0x1c74>
    1c9a:	2a0b           	move.l a3,d5
    1c9c:	2e0e           	move.l a6,d7
    1c9e:	0687 0000 0300 	addi.l #768,d7
    }
    for(int i2=0;i2<8;i2++) {
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    1ca4:	7000           	moveq #0,d0
    1ca6:	3004           	move.w d4,d0
    1ca8:	2840           	movea.l d0,a4
    1caa:	2f05           	move.l d5,-(sp)
    1cac:	2f0c           	move.l a4,-(sp)
    1cae:	2f0e           	move.l a6,-(sp)
    1cb0:	4879 0000 6e14 	pea 6e14 <destlinezoom8>
    1cb6:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    1cb8:	2f05           	move.l d5,-(sp)
    1cba:	2f0c           	move.l a4,-(sp)
    1cbc:	486e 0030      	pea 48(a6)
    1cc0:	4879 0000 6e14 	pea 6e14 <destlinezoom8>
    1cc6:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1cc8:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    1ccc:	4644           	not.w d4
    1cce:	5285           	addq.l #1,d5
    for(int i2=0;i2<8;i2++) {
    1cd0:	4fef 0020      	lea 32(sp),sp
    1cd4:	be8e           	cmp.l a6,d7
    1cd6:	66cc           	bne.s 1ca4 <main+0x1c9e>
    1cd8:	0686 0000 04e0 	addi.l #1248,d6
    1cde:	47eb 001a      	lea 26(a3),a3
  for(int i=0;i<9;i++) {
    1ce2:	b6fc 00ff      	cmpa.w #255,a3
    1ce6:	6688           	bne.s 1c70 <main+0x1c6a>
    1ce8:	286d ffac      	movea.l -84(a5),a4
    1cec:	266d ffb0      	movea.l -80(a5),a3
    1cf0:	2c2d ff78      	move.l -136(a5),d6
    1cf4:	0686 0000 2be0 	addi.l #11232,d6
    1cfa:	2a2d ff70      	move.l -144(a5),d5
    1cfe:	2c46           	movea.l d6,a6
    }
  }

  for(int i2=0;i2<10;i2++) {  
    TestRow( valsupposed, valactual, mask, 245+i2);
    1d00:	2f05           	move.l d5,-(sp)
    1d02:	3f04           	move.w d4,-(sp)
    1d04:	4267           	clr.w -(sp)
    1d06:	2f0e           	move.l a6,-(sp)
    1d08:	4879 0000 6e14 	pea 6e14 <destlinezoom8>
    1d0e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1d10:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1d14:	4644           	not.w d4
    1d16:	5285           	addq.l #1,d5
  for(int i2=0;i2<10;i2++) {  
    1d18:	4fef 0010      	lea 16(sp),sp
    1d1c:	0c85 0000 00ff 	cmpi.l #255,d5
    1d22:	66dc           	bne.s 1d00 <main+0x1cfa>
    1d24:	2c2d ff78      	move.l -136(a5),d6
    1d28:	0686 0000 2dc0 	addi.l #11712,d6
    1d2e:	2c45           	movea.l d5,a6
    1d30:	2e0b           	move.l a3,d7
    1d32:	2646           	movea.l d6,a3
  }
  for(int i=0;i<7;i++) {
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    1d34:	7c00           	moveq #0,d6
    1d36:	3c04           	move.w d4,d6
    1d38:	2f0e           	move.l a6,-(sp)
    1d3a:	2f06           	move.l d6,-(sp)
    1d3c:	2f0b           	move.l a3,-(sp)
    1d3e:	4879 0000 6e14 	pea 6e14 <destlinezoom8>
    1d44:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 256+i*2);
    1d46:	486e 0001      	pea 1(a6)
    1d4a:	2f06           	move.l d6,-(sp)
    1d4c:	486b 0030      	pea 48(a3)
    1d50:	4879 0000 6e14 	pea 6e14 <destlinezoom8>
    1d56:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1d58:	4644           	not.w d4
    1d5a:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    1d5c:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<7;i++) {
    1d60:	4fef 0020      	lea 32(sp),sp
    1d64:	bcfc 010d      	cmpa.w #269,a6
    1d68:	66ca           	bne.s 1d34 <main+0x1d2e>
    1d6a:	2647           	movea.l d7,a3
  }
  TestRow( valsupposed, valactual, mask, 269);
    1d6c:	2f0e           	move.l a6,-(sp)
    1d6e:	3f04           	move.w d4,-(sp)
    1d70:	4267           	clr.w -(sp)
    1d72:	206d ff78      	movea.l -136(a5),a0
    1d76:	4868 3060      	pea 12384(a0)
    1d7a:	4879 0000 6e14 	pea 6e14 <destlinezoom8>
    1d80:	4e92           	jsr (a2)
 
  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 8);
    1d82:	4878 0008      	pea 8 <main+0x2>
    1d86:	2f0b           	move.l a3,-(sp)
    1d88:	2f0c           	move.l a4,-(sp)
    1d8a:	4eb9 0000 2f8c 	jsr 2f8c <Zoom_ZoomIntoPicture>
  WaitBlit();
    1d90:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    1d96:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom9;
  mask = 0x0000;
 
  TestRow( valsupposed, valactual, mask, 0);
    1d9a:	42a7           	clr.l -(sp)
    1d9c:	42a7           	clr.l -(sp)
    1d9e:	2f2d ff84      	move.l -124(a5),-(sp)
    1da2:	4879 0000 6de8 	pea 6de8 <destlinezoom9>
    1da8:	4e92           	jsr (a2)
    1daa:	4fef 002c      	lea 44(sp),sp
    1dae:	3c7c 0001      	movea.w #1,a6
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
    1db2:	7cff           	moveq #-1,d6
    1db4:	2e0b           	move.l a3,d7
    1db6:	266d ff8c      	movea.l -116(a5),a3
  
  for(int i=0;i<3;i++) {
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    1dba:	7800           	moveq #0,d4
    1dbc:	3806           	move.w d6,d4
    1dbe:	2f0e           	move.l a6,-(sp)
    1dc0:	2f04           	move.l d4,-(sp)
    1dc2:	2f0b           	move.l a3,-(sp)
    1dc4:	4879 0000 6de8 	pea 6de8 <destlinezoom9>
    1dca:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    1dcc:	486e 0001      	pea 1(a6)
    1dd0:	2f04           	move.l d4,-(sp)
    1dd2:	486b 0030      	pea 48(a3)
    1dd6:	4879 0000 6de8 	pea 6de8 <destlinezoom9>
    1ddc:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1dde:	4646           	not.w d6
    1de0:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    1de2:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<3;i++) {
    1de6:	4fef 0020      	lea 32(sp),sp
    1dea:	7007           	moveq #7,d0
    1dec:	b08e           	cmp.l a6,d0
    1dee:	66ca           	bne.s 1dba <main+0x1db4>
    1df0:	282d ff90      	move.l -112(a5),d4
    1df4:	307c 0014      	movea.w #20,a0
    1df8:	2b4c ff78      	move.l a4,-136(a5)
    1dfc:	2b47 ff8c      	move.l d7,-116(a5)
    1e00:	2648           	movea.l a0,a3
    1e02:	2b43 ff90      	move.l d3,-112(a5)
    1e06:	2002           	move.l d2,d0
    1e08:	3406           	move.w d6,d2
    1e0a:	2c00           	move.l d0,d6
    1e0c:	2c44           	movea.l d4,a6
    1e0e:	4dee fe50      	lea -432(a6),a6
    1e12:	49eb fff7      	lea -9(a3),a4
  }

  for(int i=0;i<9;i++) {
    for(int i2=0;i2<9;i2++) {  
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    1e16:	2f0c           	move.l a4,-(sp)
    1e18:	3f02           	move.w d2,-(sp)
    1e1a:	4267           	clr.w -(sp)
    1e1c:	2f0e           	move.l a6,-(sp)
    1e1e:	4879 0000 6de8 	pea 6de8 <destlinezoom9>
    1e24:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1e26:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    1e2a:	4642           	not.w d2
    1e2c:	528c           	addq.l #1,a4
    for(int i2=0;i2<9;i2++) {  
    1e2e:	4fef 0010      	lea 16(sp),sp
    1e32:	b88e           	cmp.l a6,d4
    1e34:	66e0           	bne.s 1e16 <main+0x1e10>
    1e36:	2e0b           	move.l a3,d7
    1e38:	49eb 0009      	lea 9(a3),a4
    }
    
    for(int i2=0;i2<9;i2++) {
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    1e3c:	7600           	moveq #0,d3
    1e3e:	3602           	move.w d2,d3
    1e40:	2f07           	move.l d7,-(sp)
    1e42:	2f03           	move.l d3,-(sp)
    1e44:	2f0e           	move.l a6,-(sp)
    1e46:	4879 0000 6de8 	pea 6de8 <destlinezoom9>
    1e4c:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    1e4e:	5287           	addq.l #1,d7
    1e50:	2f07           	move.l d7,-(sp)
    1e52:	2f03           	move.l d3,-(sp)
    1e54:	486e 0030      	pea 48(a6)
    1e58:	4879 0000 6de8 	pea 6de8 <destlinezoom9>
    1e5e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    1e60:	4642           	not.w d2
      valactual += ZMLINESIZE/2;
    1e62:	4dee 0060      	lea 96(a6),a6
    for(int i2=0;i2<9;i2++) {
    1e66:	4fef 0020      	lea 32(sp),sp
    1e6a:	be8c           	cmp.l a4,d7
    1e6c:	66ce           	bne.s 1e3c <main+0x1e36>
    1e6e:	0684 0000 0510 	addi.l #1296,d4
    1e74:	47eb 001b      	lea 27(a3),a3
  for(int i=0;i<9;i++) {
    1e78:	b6fc 0107      	cmpa.w #263,a3
    1e7c:	668e           	bne.s 1e0c <main+0x1e06>
    1e7e:	286d ff78      	movea.l -136(a5),a4
    1e82:	266d ff8c      	movea.l -116(a5),a3
    1e86:	262d ff90      	move.l -112(a5),d3
    1e8a:	2006           	move.l d6,d0
    1e8c:	3c02           	move.w d2,d6
    1e8e:	2400           	move.l d0,d2
    1e90:	4deb 2ee4      	lea 12004(a3),a6
    }
  }

  for(int i2=0;i2<9;i2++) {  
    TestRow( valsupposed, valactual, mask, 245+i2);
    1e94:	2f2d ff70      	move.l -144(a5),-(sp)
    1e98:	3f06           	move.w d6,-(sp)
    1e9a:	4267           	clr.w -(sp)
    1e9c:	2f0e           	move.l a6,-(sp)
    1e9e:	4879 0000 6de8 	pea 6de8 <destlinezoom9>
    1ea4:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1ea6:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1eaa:	4646           	not.w d6
    1eac:	52ad ff70      	addq.l #1,-144(a5)
  for(int i2=0;i2<9;i2++) {  
    1eb0:	4fef 0010      	lea 16(sp),sp
    1eb4:	0cad 0000 00fe 	cmpi.l #254,-144(a5)
    1eba:	ff70 
    1ebc:	66d6           	bne.s 1e94 <main+0x1e8e>
    1ebe:	41eb 3094      	lea 12436(a3),a0
    1ec2:	2b48 ff78      	move.l a0,-136(a5)
    1ec6:	2c42           	movea.l d2,a6
  }
  for(int i=0;i<5;i++) {
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    1ec8:	7400           	moveq #0,d2
    1eca:	3406           	move.w d6,d2
    1ecc:	2f0e           	move.l a6,-(sp)
    1ece:	2f02           	move.l d2,-(sp)
    1ed0:	2f2d ff78      	move.l -136(a5),-(sp)
    1ed4:	4879 0000 6de8 	pea 6de8 <destlinezoom9>
    1eda:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 260+i*2);
    1edc:	486e 0001      	pea 1(a6)
    1ee0:	2f02           	move.l d2,-(sp)
    1ee2:	206d ff78      	movea.l -136(a5),a0
    1ee6:	4868 0030      	pea 48(a0)
    1eea:	4879 0000 6de8 	pea 6de8 <destlinezoom9>
    1ef0:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1ef2:	4646           	not.w d6
    1ef4:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    1ef6:	7060           	moveq #96,d0
    1ef8:	d1ad ff78      	add.l d0,-136(a5)
  for(int i=0;i<5;i++) {
    1efc:	4fef 0020      	lea 32(sp),sp
    1f00:	bcfc 010d      	cmpa.w #269,a6
    1f04:	66c2           	bne.s 1ec8 <main+0x1ec2>
  }
  TestRow( valsupposed, valactual, mask, 269);
    1f06:	2f0e           	move.l a6,-(sp)
    1f08:	3f06           	move.w d6,-(sp)
    1f0a:	4267           	clr.w -(sp)
    1f0c:	2f2d ff80      	move.l -128(a5),-(sp)
    1f10:	4879 0000 6de8 	pea 6de8 <destlinezoom9>
    1f16:	4e92           	jsr (a2)

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 9);
    1f18:	4878 0009      	pea 9 <main+0x3>
    1f1c:	2f0c           	move.l a4,-(sp)
    1f1e:	2f0b           	move.l a3,-(sp)
    1f20:	4eb9 0000 2f8c 	jsr 2f8c <Zoom_ZoomIntoPicture>
  WaitBlit();
    1f26:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    1f2c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom10;

  mask = 0xffff;
  TestRow( valsupposed, valactual, mask, 0);
    1f30:	42a7           	clr.l -(sp)
    1f32:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1f38:	2f2d ff74      	move.l -140(a5),-(sp)
    1f3c:	4879 0000 6dbc 	pea 6dbc <destlinezoom10>
    1f42:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 1);   
    1f44:	4fef 002c      	lea 44(sp),sp
    1f48:	4878 0001      	pea 1 <_start+0x1>
    1f4c:	42a7           	clr.l -(sp)
    1f4e:	2f2d ff88      	move.l -120(a5),-(sp)
    1f52:	4879 0000 6dbc 	pea 6dbc <destlinezoom10>
    1f58:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 2);
    1f5a:	4878 0002      	pea 2 <_start+0x2>
    1f5e:	42a7           	clr.l -(sp)
    1f60:	2f2d ff94      	move.l -108(a5),-(sp)
    1f64:	4879 0000 6dbc 	pea 6dbc <destlinezoom10>
    1f6a:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;

  for(int i=0;i<9;i++) {
    1f6c:	242d ffa0      	move.l -96(a5),d2
    1f70:	4fef 0020      	lea 32(sp),sp
  mask = mask ^ 0xffff;
    1f74:	7eff           	moveq #-1,d7
    1f76:	2c43           	movea.l d3,a6
    1f78:	2042           	movea.l d2,a0
    1f7a:	41e8 fe80      	lea -384(a0),a0
    1f7e:	2b48 ff78      	move.l a0,-136(a5)
    1f82:	260e           	move.l a6,d3
    1f84:	5183           	subq.l #8,d3
    for(int i2=0;i2<8;i2++) {  
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    1f86:	2f03           	move.l d3,-(sp)
    1f88:	3f07           	move.w d7,-(sp)
    1f8a:	4267           	clr.w -(sp)
    1f8c:	2f2d ff78      	move.l -136(a5),-(sp)
    1f90:	4879 0000 6dbc 	pea 6dbc <destlinezoom10>
    1f96:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1f98:	7030           	moveq #48,d0
    1f9a:	d1ad ff78      	add.l d0,-136(a5)
      mask = mask ^ 0xffff;
    1f9e:	4647           	not.w d7
    1fa0:	5283           	addq.l #1,d3
    for(int i2=0;i2<8;i2++) {  
    1fa2:	4fef 0010      	lea 16(sp),sp
    1fa6:	b4ad ff78      	cmp.l -136(a5),d2
    1faa:	66da           	bne.s 1f86 <main+0x1f80>
    1fac:	260e           	move.l a6,d3
    1fae:	2c2d ff78      	move.l -136(a5),d6
    1fb2:	0686 0000 03c0 	addi.l #960,d6
    }
    
    for(int i2=0;i2<10;i2++) {
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    1fb8:	7800           	moveq #0,d4
    1fba:	3807           	move.w d7,d4
    1fbc:	2f03           	move.l d3,-(sp)
    1fbe:	2f04           	move.l d4,-(sp)
    1fc0:	2f2d ff78      	move.l -136(a5),-(sp)
    1fc4:	4879 0000 6dbc 	pea 6dbc <destlinezoom10>
    1fca:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    1fcc:	2f03           	move.l d3,-(sp)
    1fce:	2f04           	move.l d4,-(sp)
    1fd0:	206d ff78      	movea.l -136(a5),a0
    1fd4:	4868 0030      	pea 48(a0)
    1fd8:	4879 0000 6dbc 	pea 6dbc <destlinezoom10>
    1fde:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1fe0:	7060           	moveq #96,d0
    1fe2:	d1ad ff78      	add.l d0,-136(a5)
      mask = mask ^ 0xffff;
    1fe6:	4647           	not.w d7
    1fe8:	5283           	addq.l #1,d3
    for(int i2=0;i2<10;i2++) {
    1fea:	4fef 0020      	lea 32(sp),sp
    1fee:	bcad ff78      	cmp.l -136(a5),d6
    1ff2:	66c4           	bne.s 1fb8 <main+0x1fb2>
    1ff4:	0682 0000 0540 	addi.l #1344,d2
    1ffa:	4dee 001c      	lea 28(a6),a6
  for(int i=0;i<9;i++) {
    1ffe:	bcfc 0107      	cmpa.w #263,a6
    2002:	6600 ff74      	bne.w 1f78 <main+0x1f72>
    }
  }

  for(int i2=0;i2<8;i2++) {  
    TestRow( valsupposed, valactual, mask, 255+i2);
    2006:	2f05           	move.l d5,-(sp)
    2008:	3f07           	move.w d7,-(sp)
    200a:	4267           	clr.w -(sp)
    200c:	2f2d ff98      	move.l -104(a5),-(sp)
    2010:	4879 0000 6dbc 	pea 6dbc <destlinezoom10>
    2016:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2018:	7030           	moveq #48,d0
    201a:	d1ad ff98      	add.l d0,-104(a5)
    mask = mask ^ 0xffff;
    201e:	4647           	not.w d7
    2020:	5285           	addq.l #1,d5
  for(int i2=0;i2<8;i2++) {  
    2022:	4fef 0010      	lea 16(sp),sp
    2026:	0c85 0000 0107 	cmpi.l #263,d5
    202c:	66d8           	bne.s 2006 <main+0x2000>
    202e:	4dec 3154      	lea 12628(a4),a6
    2032:	2b7c 0000 0108 	move.l #264,-136(a5)
    2038:	ff78 
  }
  for(int i=0;i<3;i++) {
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    203a:	7400           	moveq #0,d2
    203c:	3407           	move.w d7,d2
    203e:	206d ff78      	movea.l -136(a5),a0
    2042:	4868 ffff      	pea -1(a0)
    2046:	2f02           	move.l d2,-(sp)
    2048:	2f0e           	move.l a6,-(sp)
    204a:	4879 0000 6dbc 	pea 6dbc <destlinezoom10>
    2050:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 264+i*2);
    2052:	2f2d ff78      	move.l -136(a5),-(sp)
    2056:	2f02           	move.l d2,-(sp)
    2058:	486e 0030      	pea 48(a6)
    205c:	4879 0000 6dbc 	pea 6dbc <destlinezoom10>
    2062:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    2064:	4647           	not.w d7
    2066:	54ad ff78      	addq.l #2,-136(a5)
    valactual += ZMLINESIZE/2;
    206a:	4dee 0060      	lea 96(a6),a6
  for(int i=0;i<3;i++) {
    206e:	4fef 0020      	lea 32(sp),sp
    2072:	0cad 0000 010e 	cmpi.l #270,-136(a5)
    2078:	ff78 
    207a:	66be           	bne.s 203a <main+0x2034>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 10);
    207c:	4878 000a      	pea a <main+0x4>
    2080:	2f0b           	move.l a3,-(sp)
    2082:	2f0c           	move.l a4,-(sp)
    2084:	4eb9 0000 2f8c 	jsr 2f8c <Zoom_ZoomIntoPicture>
  WaitBlit();
    208a:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    2090:	4eae ff1c      	jsr -228(a6)
    2094:	4fef 000c      	lea 12(sp),sp
  valactual = destination+2; 
  valsupposed = destlinezoom11;

  mask = 0xffff;
 
  for(int i2=0;i2<6;i2++) {  
    2098:	7600           	moveq #0,d3
  mask = 0xffff;
    209a:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, i2);
    209c:	2f03           	move.l d3,-(sp)
    209e:	3f02           	move.w d2,-(sp)
    20a0:	4267           	clr.w -(sp)
    20a2:	2f2d ff84      	move.l -124(a5),-(sp)
    20a6:	4879 0000 6d90 	pea 6d90 <destlinezoom11>
    20ac:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    20ae:	7030           	moveq #48,d0
    20b0:	d1ad ff84      	add.l d0,-124(a5)
    mask = mask ^ 0xffff;
    20b4:	4642           	not.w d2
  for(int i2=0;i2<6;i2++) {  
    20b6:	5283           	addq.l #1,d3
    20b8:	4fef 0010      	lea 16(sp),sp
    20bc:	7006           	moveq #6,d0
    20be:	b083           	cmp.l d3,d0
    20c0:	66da           	bne.s 209c <main+0x2096>
    20c2:	2c6d ff9c      	movea.l -100(a5),a6
    20c6:	307c 0006      	movea.w #6,a0
    20ca:	2b48 ff78      	move.l a0,-136(a5)
  }

  for(int i2=0;i2<11;i2++) {
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    20ce:	7600           	moveq #0,d3
    20d0:	3602           	move.w d2,d3
    20d2:	2f2d ff78      	move.l -136(a5),-(sp)
    20d6:	2f03           	move.l d3,-(sp)
    20d8:	2f0e           	move.l a6,-(sp)
    20da:	4879 0000 6d90 	pea 6d90 <destlinezoom11>
    20e0:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    20e2:	206d ff78      	movea.l -136(a5),a0
    20e6:	4868 0001      	pea 1(a0)
    20ea:	2f03           	move.l d3,-(sp)
    20ec:	486e 0030      	pea 48(a6)
    20f0:	4879 0000 6d90 	pea 6d90 <destlinezoom11>
    20f6:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    20f8:	4642           	not.w d2
    20fa:	54ad ff78      	addq.l #2,-136(a5)
    valactual += ZMLINESIZE/2;
    20fe:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<11;i2++) {
    2102:	4fef 0020      	lea 32(sp),sp
    2106:	701c           	moveq #28,d0
    2108:	b0ad ff78      	cmp.l -136(a5),d0
    210c:	66c0           	bne.s 20ce <main+0x20c8>
    210e:	260b           	move.l a3,d3
    2110:	0683 0000 0694 	addi.l #1684,d3
    2116:	307c 0023      	movea.w #35,a0
    211a:	2b48 ff78      	move.l a0,-136(a5)
    211e:	2c0b           	move.l a3,d6
    2120:	2c43           	movea.l d3,a6
    2122:	4dee feb0      	lea -336(a6),a6
    2126:	282d ff78      	move.l -136(a5),d4
    212a:	5f84           	subq.l #7,d4
  }

  for(int i=0;i<8;i++) {
    for(int i2=0;i2<7;i2++) {  
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    212c:	2f04           	move.l d4,-(sp)
    212e:	3f02           	move.w d2,-(sp)
    2130:	4267           	clr.w -(sp)
    2132:	2f0e           	move.l a6,-(sp)
    2134:	4879 0000 6d90 	pea 6d90 <destlinezoom11>
    213a:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    213c:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2140:	4642           	not.w d2
    2142:	5284           	addq.l #1,d4
    for(int i2=0;i2<7;i2++) {  
    2144:	4fef 0010      	lea 16(sp),sp
    2148:	b68e           	cmp.l a6,d3
    214a:	66e0           	bne.s 212c <main+0x2126>
    214c:	266d ff78      	movea.l -136(a5),a3
    2150:	2a0e           	move.l a6,d5
    2152:	0685 0000 0420 	addi.l #1056,d5
    }
    
    for(int i2=0;i2<11;i2++) {
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    2158:	7800           	moveq #0,d4
    215a:	3802           	move.w d2,d4
    215c:	2f0b           	move.l a3,-(sp)
    215e:	2f04           	move.l d4,-(sp)
    2160:	2f0e           	move.l a6,-(sp)
    2162:	4879 0000 6d90 	pea 6d90 <destlinezoom11>
    2168:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    216a:	486b ffe8      	pea -24(a3)
    216e:	2f04           	move.l d4,-(sp)
    2170:	486e 0030      	pea 48(a6)
    2174:	4879 0000 6d90 	pea 6d90 <destlinezoom11>
    217a:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    217c:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    2180:	4642           	not.w d2
    2182:	548b           	addq.l #2,a3
    for(int i2=0;i2<11;i2++) {
    2184:	4fef 0020      	lea 32(sp),sp
    2188:	ba8e           	cmp.l a6,d5
    218a:	66cc           	bne.s 2158 <main+0x2152>
    218c:	0683 0000 0570 	addi.l #1392,d3
    2192:	701d           	moveq #29,d0
    2194:	d1ad ff78      	add.l d0,-136(a5)
  for(int i=0;i<8;i++) {
    2198:	0cad 0000 010b 	cmpi.l #267,-136(a5)
    219e:	ff78 
    21a0:	6600 ff7e      	bne.w 2120 <main+0x211a>
    21a4:	2646           	movea.l d6,a3
    21a6:	41eb 30c4      	lea 12484(a3),a0
    21aa:	2b48 ff78      	move.l a0,-136(a5)
    21ae:	283c 0000 0104 	move.l #260,d4
    }
  } 

  for(int i2=0;i2<7;i2++) {  
    TestRow( valsupposed, valactual, mask, 260+i2);
    21b4:	7600           	moveq #0,d3
    21b6:	3602           	move.w d2,d3
    21b8:	2f04           	move.l d4,-(sp)
    21ba:	2f03           	move.l d3,-(sp)
    21bc:	2f2d ff78      	move.l -136(a5),-(sp)
    21c0:	4879 0000 6d90 	pea 6d90 <destlinezoom11>
    21c6:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    21c8:	7030           	moveq #48,d0
    21ca:	d1ad ff78      	add.l d0,-136(a5)
    mask = mask ^ 0xffff;
    21ce:	4642           	not.w d2
    21d0:	5284           	addq.l #1,d4
  for(int i2=0;i2<7;i2++) {  
    21d2:	4fef 0010      	lea 16(sp),sp
    21d6:	0c84 0000 010b 	cmpi.l #267,d4
    21dc:	66d6           	bne.s 21b4 <main+0x21ae>
    21de:	0282 0000 ffff 	andi.l #65535,d2
  }
  TestRow( valsupposed, valactual, mask, 267);   
    21e4:	2f04           	move.l d4,-(sp)
    21e6:	2f02           	move.l d2,-(sp)
    21e8:	2f2d ffa4      	move.l -92(a5),-(sp)
    21ec:	4879 0000 6d90 	pea 6d90 <destlinezoom11>
    21f2:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 268);
    21f4:	4878 010c      	pea 10c <main+0x106>
    21f8:	2f02           	move.l d2,-(sp)
    21fa:	2f2d ffa8      	move.l -88(a5),-(sp)
    21fe:	4879 0000 6d90 	pea 6d90 <destlinezoom11>
    2204:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 269);
    2206:	4fef 0020      	lea 32(sp),sp
    220a:	4878 010d      	pea 10d <main+0x107>
    220e:	2f03           	move.l d3,-(sp)
    2210:	2f2d ff80      	move.l -128(a5),-(sp)
    2214:	4879 0000 6d90 	pea 6d90 <destlinezoom11>
    221a:	4e92           	jsr (a2)
  
  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 11);
    221c:	4878 000b      	pea b <main+0x5>
    2220:	2f0c           	move.l a4,-(sp)
    2222:	2f0b           	move.l a3,-(sp)
    2224:	4eb9 0000 2f8c 	jsr 2f8c <Zoom_ZoomIntoPicture>
  WaitBlit();
    222a:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    2230:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom12;

  mask = 0x0;
   
  TestRow( valsupposed, valactual, mask, 0);
    2234:	42a7           	clr.l -(sp)
    2236:	42a7           	clr.l -(sp)
    2238:	2f2d ff74      	move.l -140(a5),-(sp)
    223c:	4879 0000 6d64 	pea 6d64 <destlinezoom12>
    2242:	4e92           	jsr (a2)
    2244:	4fef 002c      	lea 44(sp),sp
    2248:	367c 0001      	movea.w #1,a3
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
    224c:	74ff           	moveq #-1,d2
    224e:	282d ff7c      	move.l -132(a5),d4
    2252:	286d ff88      	movea.l -120(a5),a4

  for(int i2=0;i2<12;i2++) {
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    2256:	7600           	moveq #0,d3
    2258:	3602           	move.w d2,d3
    225a:	2f0b           	move.l a3,-(sp)
    225c:	2f03           	move.l d3,-(sp)
    225e:	2f0c           	move.l a4,-(sp)
    2260:	4879 0000 6d64 	pea 6d64 <destlinezoom12>
    2266:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    2268:	486b 0001      	pea 1(a3)
    226c:	2f03           	move.l d3,-(sp)
    226e:	486c 0030      	pea 48(a4)
    2272:	4879 0000 6d64 	pea 6d64 <destlinezoom12>
    2278:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    227a:	4642           	not.w d2
    227c:	548b           	addq.l #2,a3
  for(int i2=0;i2<12;i2++) {
    227e:	4fef 0020      	lea 32(sp),sp
    2282:	7019           	moveq #25,d0
    2284:	b08b           	cmp.l a3,d0
    2286:	673e           	beq.s 22c6 <main+0x22c0>
    2288:	200c           	move.l a4,d0
    228a:	0680 0000 00c0 	addi.l #192,d0
    2290:	2844           	movea.l d4,a4
    2292:	2800           	move.l d0,d4
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    2294:	7600           	moveq #0,d3
    2296:	3602           	move.w d2,d3
    2298:	2f0b           	move.l a3,-(sp)
    229a:	2f03           	move.l d3,-(sp)
    229c:	2f0c           	move.l a4,-(sp)
    229e:	4879 0000 6d64 	pea 6d64 <destlinezoom12>
    22a4:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    22a6:	486b 0001      	pea 1(a3)
    22aa:	2f03           	move.l d3,-(sp)
    22ac:	486c 0030      	pea 48(a4)
    22b0:	4879 0000 6d64 	pea 6d64 <destlinezoom12>
    22b6:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    22b8:	4642           	not.w d2
    22ba:	548b           	addq.l #2,a3
  for(int i2=0;i2<12;i2++) {
    22bc:	4fef 0020      	lea 32(sp),sp
    22c0:	7019           	moveq #25,d0
    22c2:	b08b           	cmp.l a3,d0
    22c4:	66c2           	bne.s 2288 <main+0x2282>
    22c6:	2b44 ff7c      	move.l d4,-132(a5)
    22ca:	2604           	move.l d4,d3
    22cc:	0683 0000 0120 	addi.l #288,d3
    22d2:	387c 001f      	movea.w #31,a4
    22d6:	2643           	movea.l d3,a3
    22d8:	47eb fee0      	lea -288(a3),a3
    22dc:	280c           	move.l a4,d4
    22de:	5d84           	subq.l #6,d4
  } 

  for(int i=0;i<8;i++) {
    for(int i2=0;i2<6;i2++) {  
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    22e0:	2f04           	move.l d4,-(sp)
    22e2:	3f02           	move.w d2,-(sp)
    22e4:	4267           	clr.w -(sp)
    22e6:	2f0b           	move.l a3,-(sp)
    22e8:	4879 0000 6d64 	pea 6d64 <destlinezoom12>
    22ee:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    22f0:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    22f4:	4642           	not.w d2
    22f6:	5284           	addq.l #1,d4
    for(int i2=0;i2<6;i2++) {  
    22f8:	4fef 0010      	lea 16(sp),sp
    22fc:	b68b           	cmp.l a3,d3
    22fe:	66e0           	bne.s 22e0 <main+0x22da>
    2300:	2b4c ff74      	move.l a4,-140(a5)
    2304:	2a0b           	move.l a3,d5
    2306:	0685 0000 0480 	addi.l #1152,d5
    }
    
    for(int i2=0;i2<12;i2++) {
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    230c:	7800           	moveq #0,d4
    230e:	3802           	move.w d2,d4
    2310:	2f2d ff74      	move.l -140(a5),-(sp)
    2314:	2f04           	move.l d4,-(sp)
    2316:	2f0b           	move.l a3,-(sp)
    2318:	4879 0000 6d64 	pea 6d64 <destlinezoom12>
    231e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    2320:	206d ff74      	movea.l -140(a5),a0
    2324:	4868 0001      	pea 1(a0)
    2328:	2f04           	move.l d4,-(sp)
    232a:	486b 0030      	pea 48(a3)
    232e:	4879 0000 6d64 	pea 6d64 <destlinezoom12>
    2334:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2336:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    233a:	4642           	not.w d2
    233c:	54ad ff74      	addq.l #2,-140(a5)
    for(int i2=0;i2<12;i2++) {
    2340:	4fef 0020      	lea 32(sp),sp
    2344:	ba8b           	cmp.l a3,d5
    2346:	66c4           	bne.s 230c <main+0x2306>
    2348:	0683 0000 05a0 	addi.l #1440,d3
    234e:	49ec 001e      	lea 30(a4),a4
  for(int i=0;i<8;i++) {
    2352:	b8fc 010f      	cmpa.w #271,a4
    2356:	6600 ff7e      	bne.w 22d6 <main+0x22d0>
    235a:	266d ff7c      	movea.l -132(a5),a3
    235e:	47eb 2d00      	lea 11520(a3),a3
    2362:	263c 0000 0104 	move.l #260,d3
    }
  } 

  for(int i2=0;i2<5;i2++) {  
    TestRow( valsupposed, valactual, mask, 260+i2);
    2368:	2f03           	move.l d3,-(sp)
    236a:	3f02           	move.w d2,-(sp)
    236c:	4267           	clr.w -(sp)
    236e:	2f0b           	move.l a3,-(sp)
    2370:	4879 0000 6d64 	pea 6d64 <destlinezoom12>
    2376:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2378:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    237c:	4642           	not.w d2
    237e:	5283           	addq.l #1,d3
  for(int i2=0;i2<5;i2++) {  
    2380:	4fef 0010      	lea 16(sp),sp
    2384:	0c83 0000 0109 	cmpi.l #265,d3
    238a:	66dc           	bne.s 2368 <main+0x2362>
char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
  PrepareDisplaySW();
    238c:	4eb9 0000 38c6 	jsr 38c6 <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    2392:	4878 0010      	pea 10 <main+0xa>
    2396:	4879 0000 6fdc 	pea 6fdc <ClsSprites>
    239c:	42a7           	clr.l -(sp)
    239e:	2f39 0000 7098 	move.l 7098 <Copperlist1>,-(sp)
    23a4:	4eb9 0000 2b58 	jsr 2b58 <TestCopperlistBatch>
    23aa:	4fef 0010      	lea 16(sp),sp
    23ae:	4a80           	tst.l d0
    23b0:	661e           	bne.s 23d0 <main+0x23ca>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    23b2:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    23b8:	4eae ffc4      	jsr -60(a6)
    23bc:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    23c2:	2200           	move.l d0,d1
    23c4:	243c 0000 4934 	move.l #18740,d2
    23ca:	762c           	moveq #44,d3
    23cc:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    23d0:	4878 000c      	pea c <main+0x6>
    23d4:	4879 0000 6fac 	pea 6fac <ClScreen>
    23da:	4878 0010      	pea 10 <main+0xa>
    23de:	2f39 0000 7098 	move.l 7098 <Copperlist1>,-(sp)
    23e4:	4eb9 0000 2b58 	jsr 2b58 <TestCopperlistBatch>
    23ea:	4fef 0010      	lea 16(sp),sp
    23ee:	4a80           	tst.l d0
    23f0:	661e           	bne.s 2410 <main+0x240a>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
    23f2:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    23f8:	4eae ffc4      	jsr -60(a6)
    23fc:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    2402:	2200           	move.l d0,d1
    2404:	243c 0000 496a 	move.l #18794,d2
    240a:	7636           	moveq #54,d3
    240c:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    2410:	4878 0002      	pea 2 <_start+0x2>
    2414:	4879 0000 6fa4 	pea 6fa4 <ClColor>
    241a:	4878 001e      	pea 1e <main+0x18>
    241e:	2f39 0000 7098 	move.l 7098 <Copperlist1>,-(sp)
    2424:	4eb9 0000 2b58 	jsr 2b58 <TestCopperlistBatch>
    242a:	4fef 0010      	lea 16(sp),sp
    242e:	4a80           	tst.l d0
    2430:	661e           	bne.s 2450 <main+0x244a>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    2432:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    2438:	4eae ffc4      	jsr -60(a6)
    243c:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    2442:	2200           	move.l d0,d1
    2444:	243c 0000 4717 	move.l #18199,d2
    244a:	7621           	moveq #33,d3
    244c:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    2450:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdc7a4>
    2454:	4878 0020      	pea 20 <main+0x1a>
    2458:	2f39 0000 7098 	move.l 7098 <Copperlist1>,-(sp)
    245e:	4eb9 0000 2b3a 	jsr 2b3a <TestCopperlistPos>
    2464:	4fef 000c      	lea 12(sp),sp
    2468:	4a80           	tst.l d0
    246a:	661e           	bne.s 248a <main+0x2484>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
    246c:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    2472:	4eae ffc4      	jsr -60(a6)
    2476:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    247c:	2200           	move.l d0,d1
    247e:	243c 0000 4739 	move.l #18233,d2
    2484:	7622           	moveq #34,d3
    2486:	4eae ffd0      	jsr -48(a6)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
    248a:	2479 0000 708c 	movea.l 708c <DrawBuffer>,a2
    2490:	4879 0000 4ce0 	pea 4ce0 <incbin_swfont_end+0x7de>
    2496:	2f0a           	move.l a2,-(sp)
    2498:	4eb9 0000 28cc 	jsr 28cc <WriteFont.constprop.2>

  UWORD *tstpointer = DrawBuffer;
  if( *tstpointer != 0xff00)
    249e:	508f           	addq.l #8,sp
    24a0:	0c52 ff00      	cmpi.w #-256,(a2)
    24a4:	671e           	beq.s 24c4 <main+0x24be>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
    24a6:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    24ac:	4eae ffc4      	jsr -60(a6)
    24b0:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    24b6:	2200           	move.l d0,d1
    24b8:	243c 0000 4cf1 	move.l #19697,d2
    24be:	7631           	moveq #49,d3
    24c0:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
    24c4:	2f3c 0000 c800 	move.l #51200,-(sp)
    24ca:	4878 0084      	pea 84 <main+0x7e>
    24ce:	4eb9 0000 3a04 	jsr 3a04 <FreeDisplay>
  RunTests();
	Delay(50);
    24d4:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    24da:	7232           	moveq #50,d1
    24dc:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
    24e0:	247c 00f0 ff60 	movea.l #15794016,a2
    24e6:	508f           	addq.l #8,sp
    24e8:	4a92           	tst.l (a2)
    24ea:	6718           	beq.s 2504 <main+0x24fe>
    24ec:	4878 0001      	pea 1 <_start+0x1>
    24f0:	47f9 0000 291a 	lea 291a <warpmode.part.0>,a3
    24f6:	4e93           	jsr (a3)
    24f8:	588f           	addq.l #4,sp
    24fa:	4a92           	tst.l (a2)
    24fc:	6706           	beq.s 2504 <main+0x24fe>
    24fe:	42a7           	clr.l -(sp)
    2500:	4e93           	jsr (a3)
    2502:	588f           	addq.l #4,sp
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
    2504:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    250a:	23ee 0022 0000 	move.l 34(a6),7060 <ActiView>
    2510:	7060 
	OwnBlitter();
    2512:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
    2516:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    251c:	4eae ff1c      	jsr -228(a6)
	Disable();
    2520:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    2526:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
    252a:	2679 0000 7072 	movea.l 7072 <hw>,a3
    2530:	302b 0010      	move.w 16(a3),d0
    2534:	33c0 0000 7064 	move.w d0,7064 <SystemADKCON>
	SystemInts=hw->intenar;
    253a:	302b 001c      	move.w 28(a3),d0
    253e:	33c0 0000 7068 	move.w d0,7068 <SystemInts>
	SystemDMA=hw->dmaconr;
    2544:	302b 0002      	move.w 2(a3),d0
    2548:	33c0 0000 7066 	move.w d0,7066 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
    254e:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    2554:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
    255a:	45f9 0000 3a76 	lea 3a76 <WaitVbl>,a2
    2560:	4e92           	jsr (a2)
	WaitVbl();
    2562:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
    2564:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
    256a:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    2570:	93c9           	suba.l a1,a1
    2572:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    2576:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    257c:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    2580:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    2586:	4eae fef2      	jsr -270(a6)

	WaitVbl();
    258a:	4e92           	jsr (a2)
	WaitVbl();
    258c:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
    258e:	3b7c 4e7a ffc0 	move.w #20090,-64(a5)
    2594:	3b7c 0801 ffc2 	move.w #2049,-62(a5)
    259a:	3b7c 4e73 ffc4 	move.w #20083,-60(a5)
	if (SysBase->AttnFlags & AFF_68010) 
    25a0:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    25a6:	082e 0000 0129 	btst #0,297(a6)
    25ac:	6700 02d2      	beq.w 2880 <main+0x287a>
		vbr = (APTR)Supervisor((void*)getvbr);
    25b0:	7ec0           	moveq #-64,d7
    25b2:	de8d           	add.l a5,d7
    25b4:	cf8d           	exg d7,a5
    25b6:	4eae ffe2      	jsr -30(a6)
    25ba:	cf8d           	exg d7,a5

	VBR=GetVBR();
    25bc:	23c0 0000 706a 	move.l d0,706a <VBR.lto_priv.3>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    25c2:	2079 0000 706a 	movea.l 706a <VBR.lto_priv.3>,a0
    25c8:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    25cc:	23c2 0000 706e 	move.l d2,706e <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
    25d2:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
    25d4:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    25d6:	2079 0000 7072 	movea.l 7072 <hw>,a0
    25dc:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    25e0:	3028 0002      	move.w 2(a0),d0
    25e4:	0800 000e      	btst #14,d0
    25e8:	66f6           	bne.s 25e0 <main+0x25da>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
    25ea:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    25f0:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
    25f6:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
    25fc:	2279 0000 706a 	movea.l 706a <VBR.lto_priv.3>,a1
    2602:	2342 006c      	move.l d2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
    2606:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    260c:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
    2612:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
    2618:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
    261e:	3039 0000 7068 	move.w 7068 <SystemInts>,d0
    2624:	0040 8000      	ori.w #-32768,d0
    2628:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
    262c:	3039 0000 7066 	move.w 7066 <SystemDMA>,d0
    2632:	0040 8000      	ori.w #-32768,d0
    2636:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
    263a:	3039 0000 7064 	move.w 7064 <SystemADKCON>,d0
    2640:	0040 8000      	ori.w #-32768,d0
    2644:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
    2648:	2279 0000 7060 	movea.l 7060 <ActiView>,a1
    264e:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    2652:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    2658:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    265c:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    2662:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
    2666:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    266c:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
    2670:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    2676:	4eae fe32      	jsr -462(a6)
	Enable();
    267a:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    2680:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
    2684:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    268a:	2279 0000 709c 	movea.l 709c <DOSBase>,a1
    2690:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
    2694:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    269a:	2279 0000 7076 	movea.l 7076 <GfxBase>,a1
    26a0:	4eae fe62      	jsr -414(a6)
}
    26a4:	7000           	moveq #0,d0
    26a6:	4ced 5cfc ff48 	movem.l -184(a5),d2-d7/a2-a4/a6
    26ac:	4e5d           	unlk a5
    26ae:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    26b0:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    26b6:	4eae ffc4      	jsr -60(a6)
    26ba:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    26c0:	2200           	move.l d0,d1
    26c2:	243c 0000 4934 	move.l #18740,d2
    26c8:	762c           	moveq #44,d3
    26ca:	4eae ffd0      	jsr -48(a6)
    26ce:	6000 dad8      	bra.w 1a8 <main+0x1a2>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    26d2:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    26d8:	4eae ffc4      	jsr -60(a6)
    26dc:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    26e2:	2200           	move.l d0,d1
    26e4:	243c 0000 4717 	move.l #18199,d2
    26ea:	7621           	moveq #33,d3
    26ec:	4eae ffd0      	jsr -48(a6)
    26f0:	2079 0000 7098 	movea.l 7098 <Copperlist1>,a0
    26f6:	6000 dc24      	bra.w 31c <main+0x316>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    26fa:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    2700:	4eae ffc4      	jsr -60(a6)
    2704:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    270a:	2200           	move.l d0,d1
    270c:	243c 0000 496a 	move.l #18794,d2
    2712:	7636           	moveq #54,d3
    2714:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
    2718:	23fc 0004 0000 	move.l #262144,708c <DrawBuffer>
    271e:	0000 708c 
  ViewBuffer = (ULONG *)0x50000;
    2722:	23fc 0005 0000 	move.l #327680,7080 <ViewBuffer>
    2728:	0000 7080 
  SetBplPointers();
    272c:	45f9 0000 389a 	lea 389a <SetBplPointers>,a2
    2732:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    2734:	0cb9 0005 0000 	cmpi.l #327680,708c <DrawBuffer>
    273a:	0000 708c 
    273e:	6600 db40      	bne.w 280 <main+0x27a>
    2742:	6008           	bra.s 274c <main+0x2746>
    2744:	7600           	moveq #0,d3
    2746:	3602           	move.w d2,d3
    2748:	6000 e7e6      	bra.w f30 <main+0xf2a>
    274c:	0cb9 0004 0000 	cmpi.l #262144,7080 <ViewBuffer>
    2752:	0000 7080 
    2756:	6700 db46      	beq.w 29e <main+0x298>
    Write( Output(), 
    275a:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    2760:	4eae ffc4      	jsr -60(a6)
    2764:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    276a:	2200           	move.l d0,d1
    276c:	243c 0000 4661 	move.l #18017,d2
    2772:	763b           	moveq #59,d3
    2774:	4eae ffd0      	jsr -48(a6)
    2778:	6000 db24      	bra.w 29e <main+0x298>
		Exit(0);
    277c:	9dce           	suba.l a6,a6
    277e:	7200           	moveq #0,d1
    2780:	4eae ff70      	jsr -144(a6)
    2784:	6000 d8ce      	bra.w 54 <main+0x4e>
		Exit(0);
    2788:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    278e:	7200           	moveq #0,d1
    2790:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
    2794:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    279a:	43f9 0000 4626 	lea 4626 <incbin_swfont_end+0x124>,a1
    27a0:	7000           	moveq #0,d0
    27a2:	4eae fdd8      	jsr -552(a6)
    27a6:	23c0 0000 709c 	move.l d0,709c <DOSBase>
	if (!DOSBase)
    27ac:	6600 d8a6      	bne.w 54 <main+0x4e>
    27b0:	60ca           	bra.s 277c <main+0x2776>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    27b2:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    27b8:	4eae ffc4      	jsr -60(a6)
    27bc:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    27c2:	2200           	move.l d0,d1
    27c4:	243c 0000 4bf0 	move.l #19440,d2
    27ca:	7635           	moveq #53,d3
    27cc:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    27d0:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    27d6:	203c 0000 3740 	move.l #14144,d0
    27dc:	7202           	moveq #2,d1
    27de:	4eae ff3a      	jsr -198(a6)
    27e2:	2840           	movea.l d0,a4
  if( source == 0) {
    27e4:	4a80           	tst.l d0
    27e6:	6600 e610      	bne.w df8 <main+0xdf2>
    Write(  Output(), 
    27ea:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    27f0:	4eae ffc4      	jsr -60(a6)
    27f4:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    27fa:	2200           	move.l d0,d1
    27fc:	243c 0000 4c67 	move.l #19559,d2
    2802:	7639           	moveq #57,d3
    2804:	4eae ffd0      	jsr -48(a6)
    return;
    2808:	6000 fb82      	bra.w 238c <main+0x2386>
    Write(  Output(), 
    280c:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    2812:	4eae ffc4      	jsr -60(a6)
    2816:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    281c:	2200           	move.l d0,d1
    281e:	243c 0000 4a6a 	move.l #19050,d2
    2824:	7636           	moveq #54,d3
    2826:	4eae ffd0      	jsr -48(a6)
  PrepareDisplayZoom();
    282a:	4e93           	jsr (a3)
  UWORD *destination = (UWORD *)DrawBuffer;
    282c:	2079 0000 708c 	movea.l 708c <DrawBuffer>,a0
  *destination= 0x0000;
    2832:	4250           	clr.w (a0)
  *destination= 0x000f;
    2834:	317c 000f 0030 	move.w #15,48(a0)
  *destination = 0x000f;
    283a:	317c 000f 47d0 	move.w #15,18384(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    2840:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    2846:	203c 0000 c800 	move.l #51200,d0
    284c:	7202           	moveq #2,d1
    284e:	4eae ff3a      	jsr -198(a6)
    2852:	2440           	movea.l d0,a2
    2854:	23c0 0000 705c 	move.l d0,705c <Zoom_Source>
  if( Zoom_Source == 0) {
    285a:	6600 e120      	bne.w 97c <main+0x976>
    Write(  Output(), 
    285e:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    2864:	4eae ffc4      	jsr -60(a6)
    2868:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    286e:	2200           	move.l d0,d1
    2870:	243c 0000 4a6a 	move.l #19050,d2
    2876:	7636           	moveq #54,d3
    2878:	4eae ffd0      	jsr -48(a6)
    return;
    287c:	6000 e318      	bra.w b96 <main+0xb90>
	APTR vbr = 0;
    2880:	7000           	moveq #0,d0
	VBR=GetVBR();
    2882:	23c0 0000 706a 	move.l d0,706a <VBR.lto_priv.3>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    2888:	2079 0000 706a 	movea.l 706a <VBR.lto_priv.3>,a0
    288e:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    2892:	23c2 0000 706e 	move.l d2,706e <SystemIrq>
	WaitVbl();
    2898:	4e92           	jsr (a2)
	WaitVbl();
    289a:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    289c:	2079 0000 7072 	movea.l 7072 <hw>,a0
    28a2:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    28a6:	6000 fd38      	bra.w 25e0 <main+0x25da>
    Write(  Output(), 
    28aa:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    28b0:	4eae ffc4      	jsr -60(a6)
    28b4:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    28ba:	2200           	move.l d0,d1
    28bc:	243c 0000 4ca1 	move.l #19617,d2
    28c2:	763d           	moveq #61,d3
    28c4:	4eae ffd0      	jsr -48(a6)
    return;
    28c8:	6000 fac2      	bra.w 238c <main+0x2386>

000028cc <WriteFont.constprop.2>:
  *cl = 0xfffffffe;

  return retval;
}

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
    28cc:	226f 0004      	movea.l 4(sp),a1
  UWORD *bmpptr = Destination;
  UWORD *fntptr = font;

  char charpos = *text;
  charpos -= 0x20;
    28d0:	206f 0008      	movea.l 8(sp),a0
    28d4:	1010           	move.b (a0),d0
    28d6:	0600 ffe0      	addi.b #-32,d0
  charpos = charpos<<3;
    28da:	4880           	ext.w d0
    28dc:	48c0           	ext.l d0
    28de:	e788           	lsl.l #3,d0
  fntptr += charpos;
    28e0:	4880           	ext.w d0
    28e2:	3040           	movea.w d0,a0
    28e4:	d1c8           	adda.l a0,a0
    28e6:	d1fc 0000 701c 	adda.l #28700,a0
  for(int i=1;i<=8;i++) {
    *bmpptr = *fntptr++;
    28ec:	3290           	move.w (a0),(a1)
    28ee:	3368 0002 0050 	move.w 2(a0),80(a1)
    28f4:	3368 0004 00a0 	move.w 4(a0),160(a1)
    28fa:	3368 0006 00f0 	move.w 6(a0),240(a1)
    2900:	3368 0008 0140 	move.w 8(a0),320(a1)
    2906:	3368 000a 0190 	move.w 10(a0),400(a1)
    290c:	3368 000c 01e0 	move.w 12(a0),480(a1)
    2912:	3368 000e 0230 	move.w 14(a0),560(a1)
    bmpptr += 40;
  }

}
    2918:	4e75           	rts

0000291a <warpmode.part.0>:
void warpmode(int on) 
    291a:	598f           	subq.l #4,sp
    291c:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    291e:	4aaf 000c      	tst.l 12(sp)
    2922:	674c           	beq.s 2970 <warpmode.part.0+0x56>
    2924:	4878 0001      	pea 1 <_start+0x1>
    2928:	740b           	moveq #11,d2
    292a:	d48f           	add.l sp,d2
    292c:	2f02           	move.l d2,-(sp)
    292e:	42a7           	clr.l -(sp)
    2930:	4879 0000 4536 	pea 4536 <incbin_swfont_end+0x34>
    2936:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc7a5>
    293a:	4878 0052      	pea 52 <main+0x4c>
    293e:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec706>
    2944:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    2948:	203c 0000 451c 	move.l #17692,d0
    294e:	4878 0001      	pea 1 <_start+0x1>
    2952:	2f02           	move.l d2,-(sp)
    2954:	42a7           	clr.l -(sp)
    2956:	2f00           	move.l d0,-(sp)
    2958:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc7a5>
    295c:	4878 0052      	pea 52 <main+0x4c>
    2960:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec706>
	}
}
    2966:	4fef 0018      	lea 24(sp),sp
    296a:	241f           	move.l (sp)+,d2
    296c:	588f           	addq.l #4,sp
    296e:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    2970:	4878 0001      	pea 1 <_start+0x1>
    2974:	740b           	moveq #11,d2
    2976:	d48f           	add.l sp,d2
    2978:	2f02           	move.l d2,-(sp)
    297a:	42a7           	clr.l -(sp)
    297c:	4879 0000 4540 	pea 4540 <incbin_swfont_end+0x3e>
    2982:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc7a5>
    2986:	4878 0052      	pea 52 <main+0x4c>
    298a:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec706>
    2990:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    2994:	203c 0000 4503 	move.l #17667,d0
    299a:	4878 0001      	pea 1 <_start+0x1>
    299e:	2f02           	move.l d2,-(sp)
    29a0:	42a7           	clr.l -(sp)
    29a2:	2f00           	move.l d0,-(sp)
    29a4:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc7a5>
    29a8:	4878 0052      	pea 52 <main+0x4c>
    29ac:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec706>
}
    29b2:	4fef 0018      	lea 24(sp),sp
    29b6:	241f           	move.l (sp)+,d2
    29b8:	588f           	addq.l #4,sp
    29ba:	4e75           	rts

000029bc <KPrintF>:
{
    29bc:	4fef ff80      	lea -128(sp),sp
    29c0:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
    29c4:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeec706>
    29ca:	6734           	beq.s 2a00 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
    29cc:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    29d2:	206f 0090      	movea.l 144(sp),a0
    29d6:	43ef 0094      	lea 148(sp),a1
    29da:	45f9 0000 3d3c 	lea 3d3c <PutChar>,a2
    29e0:	47ef 000c      	lea 12(sp),a3
    29e4:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    29e8:	2f0b           	move.l a3,-(sp)
    29ea:	4878 0056      	pea 56 <main+0x50>
    29ee:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec706>
    29f4:	508f           	addq.l #8,sp
}
    29f6:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    29fa:	4fef 0080      	lea 128(sp),sp
    29fe:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
    2a00:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    2a06:	206f 0090      	movea.l 144(sp),a0
    2a0a:	43ef 0094      	lea 148(sp),a1
    2a0e:	45f9 0000 3d2e 	lea 3d2e <KPutCharX>,a2
    2a14:	97cb           	suba.l a3,a3
    2a16:	4eae fdf6      	jsr -522(a6)
}
    2a1a:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    2a1e:	4fef 0080      	lea 128(sp),sp
    2a22:	4e75           	rts

00002a24 <TestRow>:

  return;
}

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
    2a24:	4fef ff94      	lea -108(sp),sp
    2a28:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    2a2c:	2f6f 00a4 002c 	move.l 164(sp),44(sp)
    2a32:	3c2f 002e      	move.w 46(sp),d6
  
  char str[ 100] = { 0 };
    2a36:	7a34           	moveq #52,d5
    2a38:	da8f           	add.l sp,d5
    2a3a:	4878 0064      	pea 64 <main+0x5e>
    2a3e:	42a7           	clr.l -(sp)
    2a40:	2f05           	move.l d5,-(sp)
    2a42:	4eba 110a      	jsr 3b4e <memset>(pc)
  UWORD data[2];
  data[1] = numberofline;
    2a46:	3f6f 00b6 003e 	move.w 182(sp),62(sp)
    2a4c:	4fef 000c      	lea 12(sp),sp

  testpattern += 0;
  destination += 0;
    2a50:	2a6f 00a0      	movea.l 160(sp),a5
  testpattern += 0;
    2a54:	286f 009c      	movea.l 156(sp),a4

  for(int i=0;i<21;i++) {
    2a58:	7800           	moveq #0,d4
    if( (*testpattern++ ^ xormask) != *destination++) {
      data[0] = i;
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    2a5a:	2e3c 0000 454b 	move.l #17739,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
    2a60:	301c           	move.w (a4)+,d0
    2a62:	bd40           	eor.w d6,d0
    2a64:	b05d           	cmp.w (a5)+,d0
    2a66:	6736           	beq.s 2a9e <TestRow+0x7a>
      data[0] = i;
    2a68:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    2a6c:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    2a72:	2047           	movea.l d7,a0
    2a74:	43ef 0030      	lea 48(sp),a1
    2a78:	45f9 0000 3d3c 	lea 3d3c <PutChar>,a2
    2a7e:	2645           	movea.l d5,a3
    2a80:	4eae fdf6      	jsr -522(a6)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    2a84:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    2a8a:	4eae ffc4      	jsr -60(a6)
    2a8e:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    2a94:	2200           	move.l d0,d1
    2a96:	2405           	move.l d5,d2
    2a98:	7664           	moveq #100,d3
    2a9a:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    2a9e:	5284           	addq.l #1,d4
    2aa0:	7015           	moveq #21,d0
    2aa2:	b084           	cmp.l d4,d0
    2aa4:	66ba           	bne.s 2a60 <TestRow+0x3c>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    2aa6:	206f 00a0      	movea.l 160(sp),a0
    2aaa:	3028 002a      	move.w 42(a0),d0
    2aae:	322f 002e      	move.w 46(sp),d1
    2ab2:	b340           	eor.w d1,d0
    2ab4:	206f 009c      	movea.l 156(sp),a0
    2ab8:	3228 002a      	move.w 42(a0),d1
    2abc:	b340           	eor.w d1,d0
    2abe:	0240 ff00      	andi.w #-256,d0
    2ac2:	660a           	bne.s 2ace <TestRow+0xaa>
    Write(  Output(), str, 100);
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
     
  }
}
    2ac4:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    2ac8:	4fef 006c      	lea 108(sp),sp
    2acc:	4e75           	rts
    data[0] = 21;
    2ace:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    2ad4:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    2ada:	41f9 0000 454b 	lea 454b <incbin_swfont_end+0x49>,a0
    2ae0:	43ef 0030      	lea 48(sp),a1
    2ae4:	45f9 0000 3d3c 	lea 3d3c <PutChar>,a2
    2aea:	47ef 0034      	lea 52(sp),a3
    2aee:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    2af2:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    2af8:	4eae ffc4      	jsr -60(a6)
    2afc:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    2b02:	2200           	move.l d0,d1
    2b04:	240b           	move.l a3,d2
    2b06:	7664           	moveq #100,d3
    2b08:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    2b0c:	206f 00a0      	movea.l 160(sp),a0
    2b10:	7000           	moveq #0,d0
    2b12:	3028 002a      	move.w 42(a0),d0
    2b16:	2f00           	move.l d0,-(sp)
    2b18:	206f 00a0      	movea.l 160(sp),a0
    2b1c:	3028 002a      	move.w 42(a0),d0
    2b20:	2f00           	move.l d0,-(sp)
    2b22:	4879 0000 457b 	pea 457b <incbin_swfont_end+0x79>
    2b28:	4eba fe92      	jsr 29bc <KPrintF>(pc)
    2b2c:	4fef 000c      	lea 12(sp),sp
}
    2b30:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    2b34:	4fef 006c      	lea 108(sp),sp
    2b38:	4e75           	rts

00002b3a <TestCopperlistPos>:
  if( instructions[pos] == value ) 
    2b3a:	202f 0008      	move.l 8(sp),d0
    2b3e:	d080           	add.l d0,d0
    2b40:	d080           	add.l d0,d0
    2b42:	206f 0004      	movea.l 4(sp),a0
    2b46:	2030 0800      	move.l (0,a0,d0.l),d0
    2b4a:	b0af 000c      	cmp.l 12(sp),d0
    2b4e:	57c0           	seq d0
    2b50:	4880           	ext.w d0
    2b52:	48c0           	ext.l d0
}
    2b54:	4480           	neg.l d0
    2b56:	4e75           	rts

00002b58 <TestCopperlistBatch>:
                                                                  long length) {
    2b58:	48e7 2030      	movem.l d2/a2-a3,-(sp)
    2b5c:	246f 0010      	movea.l 16(sp),a2
    2b60:	206f 0014      	movea.l 20(sp),a0
    2b64:	226f 0018      	movea.l 24(sp),a1
    2b68:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
    2b6c:	2008           	move.l a0,d0
    2b6e:	d088           	add.l a0,d0
    2b70:	d080           	add.l d0,d0
    2b72:	2411           	move.l (a1),d2
    2b74:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
    2b78:	6600 01ac      	bne.w 2d26 <TestCopperlistBatch+0x1ce>
    2b7c:	2008           	move.l a0,d0
    2b7e:	5280           	addq.l #1,d0
    2b80:	d080           	add.l d0,d0
    2b82:	d080           	add.l d0,d0
    2b84:	2032 0800      	move.l (0,a2,d0.l),d0
    2b88:	b0a9 0004      	cmp.l 4(a1),d0
    2b8c:	6600 0198      	bne.w 2d26 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2b90:	7002           	moveq #2,d0
    2b92:	b081           	cmp.l d1,d0
    2b94:	6700 0188      	beq.w 2d1e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2b98:	2008           	move.l a0,d0
    2b9a:	5480           	addq.l #2,d0
    2b9c:	d080           	add.l d0,d0
    2b9e:	d080           	add.l d0,d0
    2ba0:	2032 0800      	move.l (0,a2,d0.l),d0
    2ba4:	b0a9 0008      	cmp.l 8(a1),d0
    2ba8:	6600 017c      	bne.w 2d26 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2bac:	7403           	moveq #3,d2
    2bae:	b481           	cmp.l d1,d2
    2bb0:	6700 016c      	beq.w 2d1e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2bb4:	2008           	move.l a0,d0
    2bb6:	5680           	addq.l #3,d0
    2bb8:	d080           	add.l d0,d0
    2bba:	d080           	add.l d0,d0
    2bbc:	2032 0800      	move.l (0,a2,d0.l),d0
    2bc0:	b0a9 000c      	cmp.l 12(a1),d0
    2bc4:	6600 0160      	bne.w 2d26 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2bc8:	7004           	moveq #4,d0
    2bca:	b081           	cmp.l d1,d0
    2bcc:	6700 0150      	beq.w 2d1e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2bd0:	2008           	move.l a0,d0
    2bd2:	5880           	addq.l #4,d0
    2bd4:	d080           	add.l d0,d0
    2bd6:	d080           	add.l d0,d0
    2bd8:	2032 0800      	move.l (0,a2,d0.l),d0
    2bdc:	b0a9 0010      	cmp.l 16(a1),d0
    2be0:	6600 0144      	bne.w 2d26 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2be4:	7405           	moveq #5,d2
    2be6:	b481           	cmp.l d1,d2
    2be8:	6700 0134      	beq.w 2d1e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2bec:	2008           	move.l a0,d0
    2bee:	5a80           	addq.l #5,d0
    2bf0:	d080           	add.l d0,d0
    2bf2:	d080           	add.l d0,d0
    2bf4:	2032 0800      	move.l (0,a2,d0.l),d0
    2bf8:	b0a9 0014      	cmp.l 20(a1),d0
    2bfc:	6600 0128      	bne.w 2d26 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2c00:	7006           	moveq #6,d0
    2c02:	b081           	cmp.l d1,d0
    2c04:	6700 0118      	beq.w 2d1e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2c08:	2008           	move.l a0,d0
    2c0a:	5c80           	addq.l #6,d0
    2c0c:	d080           	add.l d0,d0
    2c0e:	d080           	add.l d0,d0
    2c10:	2032 0800      	move.l (0,a2,d0.l),d0
    2c14:	b0a9 0018      	cmp.l 24(a1),d0
    2c18:	6600 010c      	bne.w 2d26 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2c1c:	7407           	moveq #7,d2
    2c1e:	b481           	cmp.l d1,d2
    2c20:	6700 00fc      	beq.w 2d1e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2c24:	2008           	move.l a0,d0
    2c26:	5e80           	addq.l #7,d0
    2c28:	d080           	add.l d0,d0
    2c2a:	d080           	add.l d0,d0
    2c2c:	2032 0800      	move.l (0,a2,d0.l),d0
    2c30:	b0a9 001c      	cmp.l 28(a1),d0
    2c34:	6600 00f0      	bne.w 2d26 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2c38:	7008           	moveq #8,d0
    2c3a:	b081           	cmp.l d1,d0
    2c3c:	6700 00e0      	beq.w 2d1e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2c40:	2008           	move.l a0,d0
    2c42:	5080           	addq.l #8,d0
    2c44:	d080           	add.l d0,d0
    2c46:	d080           	add.l d0,d0
    2c48:	2032 0800      	move.l (0,a2,d0.l),d0
    2c4c:	b0a9 0020      	cmp.l 32(a1),d0
    2c50:	6600 00d4      	bne.w 2d26 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2c54:	7409           	moveq #9,d2
    2c56:	b481           	cmp.l d1,d2
    2c58:	6700 00c4      	beq.w 2d1e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2c5c:	47e8 0009      	lea 9(a0),a3
    2c60:	200b           	move.l a3,d0
    2c62:	d08b           	add.l a3,d0
    2c64:	d080           	add.l d0,d0
    2c66:	2032 0800      	move.l (0,a2,d0.l),d0
    2c6a:	b0a9 0024      	cmp.l 36(a1),d0
    2c6e:	6600 00b6      	bne.w 2d26 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2c72:	700a           	moveq #10,d0
    2c74:	b081           	cmp.l d1,d0
    2c76:	6700 00a6      	beq.w 2d1e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2c7a:	47e8 000a      	lea 10(a0),a3
    2c7e:	200b           	move.l a3,d0
    2c80:	d08b           	add.l a3,d0
    2c82:	d080           	add.l d0,d0
    2c84:	2032 0800      	move.l (0,a2,d0.l),d0
    2c88:	b0a9 0028      	cmp.l 40(a1),d0
    2c8c:	6600 0098      	bne.w 2d26 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2c90:	740b           	moveq #11,d2
    2c92:	b481           	cmp.l d1,d2
    2c94:	6700 0088      	beq.w 2d1e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2c98:	47e8 000b      	lea 11(a0),a3
    2c9c:	200b           	move.l a3,d0
    2c9e:	d08b           	add.l a3,d0
    2ca0:	d080           	add.l d0,d0
    2ca2:	2032 0800      	move.l (0,a2,d0.l),d0
    2ca6:	b0a9 002c      	cmp.l 44(a1),d0
    2caa:	667a           	bne.s 2d26 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2cac:	700c           	moveq #12,d0
    2cae:	b081           	cmp.l d1,d0
    2cb0:	676c           	beq.s 2d1e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2cb2:	47e8 000c      	lea 12(a0),a3
    2cb6:	200b           	move.l a3,d0
    2cb8:	d08b           	add.l a3,d0
    2cba:	d080           	add.l d0,d0
    2cbc:	2032 0800      	move.l (0,a2,d0.l),d0
    2cc0:	b0a9 0030      	cmp.l 48(a1),d0
    2cc4:	6660           	bne.s 2d26 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2cc6:	740d           	moveq #13,d2
    2cc8:	b481           	cmp.l d1,d2
    2cca:	6752           	beq.s 2d1e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2ccc:	47e8 000d      	lea 13(a0),a3
    2cd0:	200b           	move.l a3,d0
    2cd2:	d08b           	add.l a3,d0
    2cd4:	d080           	add.l d0,d0
    2cd6:	2032 0800      	move.l (0,a2,d0.l),d0
    2cda:	b0a9 0034      	cmp.l 52(a1),d0
    2cde:	6646           	bne.s 2d26 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2ce0:	700e           	moveq #14,d0
    2ce2:	b081           	cmp.l d1,d0
    2ce4:	6738           	beq.s 2d1e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2ce6:	47e8 000e      	lea 14(a0),a3
    2cea:	200b           	move.l a3,d0
    2cec:	d08b           	add.l a3,d0
    2cee:	d080           	add.l d0,d0
    2cf0:	2032 0800      	move.l (0,a2,d0.l),d0
    2cf4:	b0a9 0038      	cmp.l 56(a1),d0
    2cf8:	662c           	bne.s 2d26 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    2cfa:	7410           	moveq #16,d2
    2cfc:	b481           	cmp.l d1,d2
    2cfe:	661e           	bne.s 2d1e <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    2d00:	41e8 000f      	lea 15(a0),a0
    2d04:	d1c8           	adda.l a0,a0
    2d06:	d1c8           	adda.l a0,a0
    2d08:	2070 a800      	movea.l (0,a0,a2.l),a0
    2d0c:	b1e9 003c      	cmpa.l 60(a1),a0
    2d10:	57c0           	seq d0
    2d12:	4880           	ext.w d0
    2d14:	48c0           	ext.l d0
    2d16:	4480           	neg.l d0
}
    2d18:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    2d1c:	4e75           	rts
  return 1;
    2d1e:	7001           	moveq #1,d0
}
    2d20:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    2d24:	4e75           	rts
      return 0;
    2d26:	7000           	moveq #0,d0
}
    2d28:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    2d2c:	4e75           	rts

00002d2e <ClBuild>:
ULONG * ClbuildSW() {
    2d2e:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
    2d32:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    2d38:	707b           	moveq #123,d0
    2d3a:	4600           	not.b d0
    2d3c:	7202           	moveq #2,d1
    2d3e:	4eae ff3a      	jsr -198(a6)
    2d42:	2440           	movea.l d0,a2
  if( retval == 0) {
    2d44:	4a80           	tst.l d0
    2d46:	6700 010e      	beq.w 2e56 <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
    2d4a:	24b9 0000 6fdc 	move.l 6fdc <ClsSprites>,(a2)
    2d50:	2579 0000 6fe0 	move.l 6fe0 <ClsSprites+0x4>,4(a2)
    2d56:	0004 
    2d58:	2579 0000 6fe4 	move.l 6fe4 <ClsSprites+0x8>,8(a2)
    2d5e:	0008 
    2d60:	2579 0000 6fe8 	move.l 6fe8 <ClsSprites+0xc>,12(a2)
    2d66:	000c 
    2d68:	2579 0000 6fec 	move.l 6fec <ClsSprites+0x10>,16(a2)
    2d6e:	0010 
    2d70:	2579 0000 6ff0 	move.l 6ff0 <ClsSprites+0x14>,20(a2)
    2d76:	0014 
    2d78:	2579 0000 6ff4 	move.l 6ff4 <ClsSprites+0x18>,24(a2)
    2d7e:	0018 
    2d80:	2579 0000 6ff8 	move.l 6ff8 <ClsSprites+0x1c>,28(a2)
    2d86:	001c 
    2d88:	2579 0000 6ffc 	move.l 6ffc <ClsSprites+0x20>,32(a2)
    2d8e:	0020 
    2d90:	2579 0000 7000 	move.l 7000 <ClsSprites+0x24>,36(a2)
    2d96:	0024 
    2d98:	2579 0000 7004 	move.l 7004 <ClsSprites+0x28>,40(a2)
    2d9e:	0028 
    2da0:	2579 0000 7008 	move.l 7008 <ClsSprites+0x2c>,44(a2)
    2da6:	002c 
    2da8:	2579 0000 700c 	move.l 700c <ClsSprites+0x30>,48(a2)
    2dae:	0030 
    2db0:	2579 0000 7010 	move.l 7010 <ClsSprites+0x34>,52(a2)
    2db6:	0034 
    2db8:	2579 0000 7014 	move.l 7014 <ClsSprites+0x38>,56(a2)
    2dbe:	0038 
    2dc0:	2579 0000 7018 	move.l 7018 <ClsSprites+0x3c>,60(a2)
    2dc6:	003c 
    *cl++ = *clpartinstruction++;
    2dc8:	2579 0000 6fac 	move.l 6fac <ClScreen>,64(a2)
    2dce:	0040 
    2dd0:	2579 0000 6fb0 	move.l 6fb0 <ClScreen+0x4>,68(a2)
    2dd6:	0044 
    2dd8:	2579 0000 6fb4 	move.l 6fb4 <ClScreen+0x8>,72(a2)
    2dde:	0048 
    2de0:	2579 0000 6fb8 	move.l 6fb8 <ClScreen+0xc>,76(a2)
    2de6:	004c 
    2de8:	2579 0000 6fbc 	move.l 6fbc <ClScreen+0x10>,80(a2)
    2dee:	0050 
    2df0:	2579 0000 6fc0 	move.l 6fc0 <ClScreen+0x14>,84(a2)
    2df6:	0054 
    2df8:	2579 0000 6fc4 	move.l 6fc4 <ClScreen+0x18>,88(a2)
    2dfe:	0058 
    2e00:	2579 0000 6fc8 	move.l 6fc8 <ClScreen+0x1c>,92(a2)
    2e06:	005c 
    2e08:	2579 0000 6fcc 	move.l 6fcc <ClScreen+0x20>,96(a2)
    2e0e:	0060 
    2e10:	2579 0000 6fd0 	move.l 6fd0 <ClScreen+0x24>,100(a2)
    2e16:	0064 
    2e18:	2579 0000 6fd4 	move.l 6fd4 <ClScreen+0x28>,104(a2)
    2e1e:	0068 
    2e20:	2579 0000 6fd8 	move.l 6fd8 <ClScreen+0x2c>,108(a2)
    2e26:	006c 
  *cl++ = 0x00e00000;
    2e28:	257c 00e0 0000 	move.l #14680064,112(a2)
    2e2e:	0070 
  *cl++ = 0x00e20000;
    2e30:	257c 00e2 0000 	move.l #14811136,116(a2)
    2e36:	0074 
    *cl++ = *clpartinstruction++;
    2e38:	2579 0000 6fa4 	move.l 6fa4 <ClColor>,120(a2)
    2e3e:	0078 
    2e40:	2579 0000 6fa8 	move.l 6fa8 <ClColor+0x4>,124(a2)
    2e46:	007c 
  *cl = 0xfffffffe;
    2e48:	70fe           	moveq #-2,d0
    2e4a:	2540 0080      	move.l d0,128(a2)
}
    2e4e:	200a           	move.l a2,d0
    2e50:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    2e54:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    2e56:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    2e5c:	4eae ffc4      	jsr -60(a6)
    2e60:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    2e66:	2200           	move.l d0,d1
    2e68:	243c 0000 45a1 	move.l #17825,d2
    2e6e:	7628           	moveq #40,d3
    2e70:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2e74:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    2e7a:	7201           	moveq #1,d1
    2e7c:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    2e80:	24b9 0000 6fdc 	move.l 6fdc <ClsSprites>,(a2)
    2e86:	2579 0000 6fe0 	move.l 6fe0 <ClsSprites+0x4>,4(a2)
    2e8c:	0004 
    2e8e:	2579 0000 6fe4 	move.l 6fe4 <ClsSprites+0x8>,8(a2)
    2e94:	0008 
    2e96:	2579 0000 6fe8 	move.l 6fe8 <ClsSprites+0xc>,12(a2)
    2e9c:	000c 
    2e9e:	2579 0000 6fec 	move.l 6fec <ClsSprites+0x10>,16(a2)
    2ea4:	0010 
    2ea6:	2579 0000 6ff0 	move.l 6ff0 <ClsSprites+0x14>,20(a2)
    2eac:	0014 
    2eae:	2579 0000 6ff4 	move.l 6ff4 <ClsSprites+0x18>,24(a2)
    2eb4:	0018 
    2eb6:	2579 0000 6ff8 	move.l 6ff8 <ClsSprites+0x1c>,28(a2)
    2ebc:	001c 
    2ebe:	2579 0000 6ffc 	move.l 6ffc <ClsSprites+0x20>,32(a2)
    2ec4:	0020 
    2ec6:	2579 0000 7000 	move.l 7000 <ClsSprites+0x24>,36(a2)
    2ecc:	0024 
    2ece:	2579 0000 7004 	move.l 7004 <ClsSprites+0x28>,40(a2)
    2ed4:	0028 
    2ed6:	2579 0000 7008 	move.l 7008 <ClsSprites+0x2c>,44(a2)
    2edc:	002c 
    2ede:	2579 0000 700c 	move.l 700c <ClsSprites+0x30>,48(a2)
    2ee4:	0030 
    2ee6:	2579 0000 7010 	move.l 7010 <ClsSprites+0x34>,52(a2)
    2eec:	0034 
    2eee:	2579 0000 7014 	move.l 7014 <ClsSprites+0x38>,56(a2)
    2ef4:	0038 
    2ef6:	2579 0000 7018 	move.l 7018 <ClsSprites+0x3c>,60(a2)
    2efc:	003c 
    *cl++ = *clpartinstruction++;
    2efe:	2579 0000 6fac 	move.l 6fac <ClScreen>,64(a2)
    2f04:	0040 
    2f06:	2579 0000 6fb0 	move.l 6fb0 <ClScreen+0x4>,68(a2)
    2f0c:	0044 
    2f0e:	2579 0000 6fb4 	move.l 6fb4 <ClScreen+0x8>,72(a2)
    2f14:	0048 
    2f16:	2579 0000 6fb8 	move.l 6fb8 <ClScreen+0xc>,76(a2)
    2f1c:	004c 
    2f1e:	2579 0000 6fbc 	move.l 6fbc <ClScreen+0x10>,80(a2)
    2f24:	0050 
    2f26:	2579 0000 6fc0 	move.l 6fc0 <ClScreen+0x14>,84(a2)
    2f2c:	0054 
    2f2e:	2579 0000 6fc4 	move.l 6fc4 <ClScreen+0x18>,88(a2)
    2f34:	0058 
    2f36:	2579 0000 6fc8 	move.l 6fc8 <ClScreen+0x1c>,92(a2)
    2f3c:	005c 
    2f3e:	2579 0000 6fcc 	move.l 6fcc <ClScreen+0x20>,96(a2)
    2f44:	0060 
    2f46:	2579 0000 6fd0 	move.l 6fd0 <ClScreen+0x24>,100(a2)
    2f4c:	0064 
    2f4e:	2579 0000 6fd4 	move.l 6fd4 <ClScreen+0x28>,104(a2)
    2f54:	0068 
    2f56:	2579 0000 6fd8 	move.l 6fd8 <ClScreen+0x2c>,108(a2)
    2f5c:	006c 
  *cl++ = 0x00e00000;
    2f5e:	257c 00e0 0000 	move.l #14680064,112(a2)
    2f64:	0070 
  *cl++ = 0x00e20000;
    2f66:	257c 00e2 0000 	move.l #14811136,116(a2)
    2f6c:	0074 
    *cl++ = *clpartinstruction++;
    2f6e:	2579 0000 6fa4 	move.l 6fa4 <ClColor>,120(a2)
    2f74:	0078 
    2f76:	2579 0000 6fa8 	move.l 6fa8 <ClColor+0x4>,124(a2)
    2f7c:	007c 
  *cl = 0xfffffffe;
    2f7e:	70fe           	moveq #-2,d0
    2f80:	2540 0080      	move.l d0,128(a2)
}
    2f84:	200a           	move.l a2,d0
    2f86:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    2f8a:	4e75           	rts

00002f8c <Zoom_ZoomIntoPicture>:
void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr) {
    2f8c:	4fef ffe4      	lea -28(sp),sp
    2f90:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    2f94:	226f 0054      	movea.l 84(sp),a1
    2f98:	3049           	movea.w a1,a0
  UWORD nextzoom = 22*16 - 20 + zoomnr * 10;
    2f9a:	3409           	move.w a1,d2
    2f9c:	d449           	add.w a1,d2
    2f9e:	3202           	move.w d2,d1
    2fa0:	d242           	add.w d2,d1
    2fa2:	d249           	add.w a1,d1
    2fa4:	3001           	move.w d1,d0
    2fa6:	d041           	add.w d1,d0
    2fa8:	0640 014c      	addi.w #332,d0
    2fac:	3f40 003c      	move.w d0,60(sp)
  while( nextzoom > 22 * 16) {
    2fb0:	0c40 0160      	cmpi.w #352,d0
    2fb4:	6300 03b6      	bls.w 336c <Zoom_ZoomIntoPicture+0x3e0>
    2fb8:	3600           	move.w d0,d3
    2fba:	70ed           	moveq #-19,d0
    2fbc:	9049           	sub.w a1,d0
  WORD shiftright = 9;
    2fbe:	7e09           	moveq #9,d7
    nextzoom -= (19 + zoomnr);
    2fc0:	d640           	add.w d0,d3
    shiftright--;
    2fc2:	5347           	subq.w #1,d7
  while( nextzoom > 22 * 16) {
    2fc4:	0c43 0160      	cmpi.w #352,d3
    2fc8:	62f6           	bhi.s 2fc0 <Zoom_ZoomIntoPicture+0x34>
    2fca:	3f43 003c      	move.w d3,60(sp)
  *bp2 = 0;
    2fce:	4278 0206      	clr.w 206 <main+0x200>
  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
    2fd2:	7012           	moveq #18,d0
    2fd4:	9041           	sub.w d1,d0
    2fd6:	3f40 003e      	move.w d0,62(sp)
  while( ZoomHorizontalStart < 0) {
    2fda:	6c00 03a2      	bge.w 337e <Zoom_ZoomIntoPicture+0x3f2>
    2fde:	3200           	move.w d0,d1
  UWORD shifthoriz = 7;
    2fe0:	7007           	moveq #7,d0
      ZoomHorizontalStart += 1 + 18 + zoomnr;
    2fe2:	0641 0013      	addi.w #19,d1
    2fe6:	d248           	add.w a0,d1
      shifthoriz--;
    2fe8:	5340           	subq.w #1,d0
  while( ZoomHorizontalStart < 0) {
    2fea:	4a41           	tst.w d1
    2fec:	6df4           	blt.s 2fe2 <Zoom_ZoomIntoPicture+0x56>
    2fee:	3f41 003e      	move.w d1,62(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    2ff2:	9449           	sub.w a1,d2
    2ff4:	3a42           	movea.w d2,a5
    2ff6:	4bed 0012      	lea 18(a5),a5
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz-2-i;
    2ffa:	0280 0000 ffff 	andi.l #65535,d0
    3000:	5280           	addq.l #1,d0
    3002:	2200           	move.l d0,d1
    3004:	d280           	add.l d0,d1
    3006:	d081           	add.l d1,d0
    3008:	e988           	lsl.l #4,d0
    300a:	226f 004c      	movea.l 76(sp),a1
    300e:	43f1 08fc      	lea (-4,a1,d0.l),a1
    3012:	2f49 0034      	move.l a1,52(sp)
    3016:	742c           	moveq #44,d2
    3018:	d4af 0050      	add.l 80(sp),d2
    301c:	2f42 0038      	move.l d2,56(sp)
  UWORD shifttoleft = 0;
    3020:	426f 0042      	clr.w 66(sp)
  UWORD startofword = 21*16;
    3024:	3f7c 0150 002e 	move.w #336,46(sp)
      nextzoom -= (19 + zoomnr);
    302a:	74ed           	moveq #-19,d2
    302c:	9448           	sub.w a0,d2
    302e:	3f42 0046      	move.w d2,70(sp)
    WORD linesleft = 272;
    3032:	3f47 002c      	move.w d7,44(sp)
    ZoomHorizontal = ZoomHorizontalStart;
    3036:	33ef 003e 0000 	move.w 62(sp),707a <ZoomHorizontal>
    303c:	707a 
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz-2-i;
    303e:	2a2f 0034      	move.l 52(sp),d5
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    3042:	246f 0038      	movea.l 56(sp),a2
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    3046:	7000           	moveq #0,d0
    3048:	302f 0042      	move.w 66(sp),d0
    304c:	d080           	add.l d0,d0
    304e:	2f40 0030      	move.l d0,48(sp)
    3052:	3f6f 002c 0044 	move.w 44(sp),68(sp)
    3058:	3c2f 002c      	move.w 44(sp),d6
    305c:	700c           	moveq #12,d0
    305e:	e16e           	lsl.w d0,d6
    3060:	342f 003c      	move.w 60(sp),d2
    3064:	b46f 002e      	cmp.w 46(sp),d2
    3068:	6200 0172      	bhi.w 31dc <Zoom_ZoomIntoPicture+0x250>
  hw->bltcon0 = 0x9f0 + shiftright;
    306c:	0646 09f0      	addi.w #2544,d6
    3070:	342f 003e      	move.w 62(sp),d2
    WORD linesleft = 272;
    3074:	363c 0110      	move.w #272,d3
    3078:	282f 0030      	move.l 48(sp),d4
    307c:	d885           	add.l d5,d4
    307e:	266f 0030      	movea.l 48(sp),a3
        if( linesleft >= ZoomHorizontal+1) {
    3082:	b443           	cmp.w d3,d2
    3084:	6c00 00c4      	bge.w 314a <Zoom_ZoomIntoPicture+0x1be>
          linesleft -= ZoomHorizontal;
    3088:	9642           	sub.w d2,d3
    308a:	3e03           	move.w d3,d7
  WaitBlit();
    308c:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    3092:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    3096:	2079 0000 7072 	movea.l 7072 <hw>,a0
    309c:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    30a2:	3146 0040      	move.w d6,64(a0)
  hw->bltafwm = 0xffff;
    30a6:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    30ac:	317c ffff 0046 	move.w #-1,70(a0)
  *bp = 0;
    30b2:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltamod = ZMLINESIZE - 4;
    30b6:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    30bc:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
    30c2:	2144 0050      	move.l d4,80(a0)
  hw->bltdpt = (UWORD *) destination;
    30c6:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    30ca:	ed4a           	lsl.w #6,d2
    30cc:	5442           	addq.w #2,d2
    30ce:	3142 0058      	move.w d2,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    30d2:	3079 0000 707a 	movea.w 707a <ZoomHorizontal>,a0
    30d8:	2008           	move.l a0,d0
    30da:	d088           	add.l a0,d0
    30dc:	d088           	add.l a0,d0
    30de:	e988           	lsl.l #4,d0
    30e0:	da80           	add.l d0,d5
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    30e2:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    30e4:	4a47           	tst.w d7
    30e6:	6f00 00cc      	ble.w 31b4 <Zoom_ZoomIntoPicture+0x228>
          Zoom_CopyWord( pos4source+shifttoleft, pos4dest, shiftright, 1);
    30ea:	2805           	move.l d5,d4
    30ec:	d88b           	add.l a3,d4
  WaitBlit();
    30ee:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    30f4:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    30f8:	2079 0000 7072 	movea.l 7072 <hw>,a0
    30fe:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    3104:	3146 0040      	move.w d6,64(a0)
  hw->bltafwm = 0xffff;
    3108:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    310e:	317c ffff 0046 	move.w #-1,70(a0)
  *bp = 0;
    3114:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltamod = ZMLINESIZE - 4;
    3118:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    311e:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
    3124:	2144 0050      	move.l d4,80(a0)
  hw->bltdpt = (UWORD *) destination;
    3128:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    312c:	317c 0042 0058 	move.w #66,88(a0)
          linesleft--;
    3132:	5343           	subq.w #1,d3
          pos4dest += ZMLINESIZE/2;
    3134:	45ea 0030      	lea 48(a2),a2
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    3138:	33cd 0000 707a 	move.w a5,707a <ZoomHorizontal>
      while(linesleft > 0) {
    313e:	4a43           	tst.w d3
    3140:	6778           	beq.s 31ba <Zoom_ZoomIntoPicture+0x22e>
    3142:	340d           	move.w a5,d2
        if( linesleft >= ZoomHorizontal+1) {
    3144:	b443           	cmp.w d3,d2
    3146:	6d00 ff40      	blt.w 3088 <Zoom_ZoomIntoPicture+0xfc>
          ZoomHorizontal = linesleft;
    314a:	33c3 0000 707a 	move.w d3,707a <ZoomHorizontal>
    3150:	3403           	move.w d3,d2
    3152:	4243           	clr.w d3
          linesleft = 0;
    3154:	4247           	clr.w d7
  WaitBlit();
    3156:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    315c:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
    3160:	2079 0000 7072 	movea.l 7072 <hw>,a0
    3166:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    316c:	3146 0040      	move.w d6,64(a0)
  hw->bltafwm = 0xffff;
    3170:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    3176:	317c ffff 0046 	move.w #-1,70(a0)
  *bp = 0;
    317c:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltamod = ZMLINESIZE - 4;
    3180:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    3186:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
    318c:	2144 0050      	move.l d4,80(a0)
  hw->bltdpt = (UWORD *) destination;
    3190:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    3194:	ed4a           	lsl.w #6,d2
    3196:	5442           	addq.w #2,d2
    3198:	3142 0058      	move.w d2,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    319c:	3079 0000 707a 	movea.w 707a <ZoomHorizontal>,a0
    31a2:	2008           	move.l a0,d0
    31a4:	d088           	add.l a0,d0
    31a6:	d088           	add.l a0,d0
    31a8:	e988           	lsl.l #4,d0
    31aa:	da80           	add.l d0,d5
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    31ac:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    31ae:	4a47           	tst.w d7
    31b0:	6e00 ff38      	bgt.w 30ea <Zoom_ZoomIntoPicture+0x15e>
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    31b4:	33cd 0000 707a 	move.w a5,707a <ZoomHorizontal>
    startofword -= 16;
    31ba:	066f fff0 002e 	addi.w #-16,46(sp)
    31c0:	55af 0034      	subq.l #2,52(sp)
    31c4:	55af 0038      	subq.l #2,56(sp)
  for(int i=0;i<22;i++) {
    31c8:	0c6f fff0 002e 	cmpi.w #-16,46(sp)
    31ce:	6600 fe66      	bne.w 3036 <Zoom_ZoomIntoPicture+0xaa>
}
    31d2:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    31d6:	4fef 001c      	lea 28(sp),sp
    31da:	4e75           	rts
    31dc:	3002           	move.w d2,d0
      UWORD colnr = nextzoom - startofword - 1; 
    31de:	5340           	subq.w #1,d0
    31e0:	906f 002e      	sub.w 46(sp),d0
      nextzoom -= (19 + zoomnr);
    31e4:	342f 0046      	move.w 70(sp),d2
    31e8:	d56f 003c      	add.w d2,60(sp)
    shifta = (shift - 1) << 12;
    31ec:	342f 002c      	move.w 44(sp),d2
    31f0:	5342           	subq.w #1,d2
    31f2:	3f42 0040      	move.w d2,64(sp)
    31f6:	3202           	move.w d2,d1
    31f8:	740c           	moveq #12,d2
    31fa:	e569           	lsl.w d2,d1
  hw->bltcon0 = 0xde4 + shifta;
    31fc:	3e3c f000      	move.w #-4096,d7
    3200:	4a6f 002c      	tst.w 44(sp)
    3204:	6702           	beq.s 3208 <Zoom_ZoomIntoPicture+0x27c>
    3206:	3e01           	move.w d1,d7
    3208:	0647 0de4      	addi.w #3556,d7
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, shiftright, colnr, 
    320c:	0280 0000 ffff 	andi.l #65535,d0
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    3212:	7210           	moveq #16,d1
    3214:	9280           	sub.l d0,d1
    3216:	7400           	moveq #0,d2
    3218:	4642           	not.w d2
    321a:	e3aa           	lsl.l d1,d2
    321c:	2642           	movea.l d2,a3
    321e:	342f 003e      	move.w 62(sp),d2
    WORD linesleft = 272;
    3222:	363c 0110      	move.w #272,d3
    3226:	282f 0030      	move.l 48(sp),d4
    322a:	d8af 0034      	add.l 52(sp),d4
        if( linesleft >= ZoomHorizontal+1) {
    322e:	b443           	cmp.w d3,d2
    3230:	6c00 00b2      	bge.w 32e4 <Zoom_ZoomIntoPicture+0x358>
          linesleft -= ZoomHorizontal;
    3234:	9642           	sub.w d2,d3
    srca = source + 1;
    3236:	2844           	movea.l d4,a4
  if( shift == 0) {
    3238:	4a6f 002c      	tst.w 44(sp)
    323c:	6602           	bne.s 3240 <Zoom_ZoomIntoPicture+0x2b4>
    srca = source + 1;
    323e:	548c           	addq.l #2,a4
  WaitBlit();
    3240:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    3246:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    324a:	2079 0000 7072 	movea.l 7072 <hw>,a0
    3250:	3146 0042      	move.w d6,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    3254:	3147 0040      	move.w d7,64(a0)
  hw->bltafwm = 0xffff;
    3258:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    325e:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    3264:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    326a:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    3270:	314b 0070      	move.w a3,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    3274:	317c 002c 0066 	move.w #44,102(a0)
  *bp = 0;
    327a:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltapt = srca;
    327e:	214c 0050      	move.l a4,80(a0)
  hw->bltbpt = srcb;
    3282:	2144 004c      	move.l d4,76(a0)
  hw->bltdpt = destination;
    3286:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    328a:	ed4a           	lsl.w #6,d2
    328c:	5442           	addq.w #2,d2
    328e:	3142 0058      	move.w d2,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    3292:	3079 0000 707a 	movea.w 707a <ZoomHorizontal>,a0
    3298:	2008           	move.l a0,d0
    329a:	d088           	add.l a0,d0
    329c:	d088           	add.l a0,d0
    329e:	e988           	lsl.l #4,d0
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    32a0:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    32a2:	4a43           	tst.w d3
    32a4:	6e4c           	bgt.s 32f2 <Zoom_ZoomIntoPicture+0x366>
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    32a6:	33cd 0000 707a 	move.w a5,707a <ZoomHorizontal>
      shiftright--;  
    32ac:	3f6f 0040 002c 	move.w 64(sp),44(sp)
      if(shiftright < 0) {
    32b2:	6c00 ff06      	bge.w 31ba <Zoom_ZoomIntoPicture+0x22e>
        shiftright += 16;
    32b6:	342f 0044      	move.w 68(sp),d2
    32ba:	0642 000f      	addi.w #15,d2
    32be:	3f42 002c      	move.w d2,44(sp)
        shifttoleft = 1;
    32c2:	3f7c 0001 0042 	move.w #1,66(sp)
    startofword -= 16;
    32c8:	066f fff0 002e 	addi.w #-16,46(sp)
    32ce:	55af 0034      	subq.l #2,52(sp)
    32d2:	55af 0038      	subq.l #2,56(sp)
  for(int i=0;i<22;i++) {
    32d6:	0c6f fff0 002e 	cmpi.w #-16,46(sp)
    32dc:	6600 fd58      	bne.w 3036 <Zoom_ZoomIntoPicture+0xaa>
    32e0:	6000 fef0      	bra.w 31d2 <Zoom_ZoomIntoPicture+0x246>
          ZoomHorizontal = linesleft;
    32e4:	33c3 0000 707a 	move.w d3,707a <ZoomHorizontal>
    32ea:	3403           	move.w d3,d2
          linesleft = 0;
    32ec:	4243           	clr.w d3
    32ee:	6000 ff46      	bra.w 3236 <Zoom_ZoomIntoPicture+0x2aa>
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    32f2:	da80           	add.l d0,d5
          Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, shiftright, colnr, 
    32f4:	282f 0030      	move.l 48(sp),d4
    32f8:	d885           	add.l d5,d4
    srca = source + 1;
    32fa:	2404           	move.l d4,d2
  if( shift == 0) {
    32fc:	4a6f 002c      	tst.w 44(sp)
    3300:	6602           	bne.s 3304 <Zoom_ZoomIntoPicture+0x378>
    srca = source + 1;
    3302:	5482           	addq.l #2,d2
  WaitBlit();
    3304:	2c79 0000 7076 	movea.l 7076 <GfxBase>,a6
    330a:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    330e:	2079 0000 7072 	movea.l 7072 <hw>,a0
    3314:	3146 0042      	move.w d6,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    3318:	3147 0040      	move.w d7,64(a0)
  hw->bltafwm = 0xffff;
    331c:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    3322:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    3328:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    332e:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    3334:	314b 0070      	move.w a3,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    3338:	317c 002c 0066 	move.w #44,102(a0)
  *bp = 0;
    333e:	4278 0202      	clr.w 202 <main+0x1fc>
  hw->bltapt = srca;
    3342:	2142 0050      	move.l d2,80(a0)
  hw->bltbpt = srcb;
    3346:	2144 004c      	move.l d4,76(a0)
  hw->bltdpt = destination;
    334a:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    334e:	317c 0042 0058 	move.w #66,88(a0)
          pos4dest += ZMLINESIZE/2;
    3354:	45ea 0030      	lea 48(a2),a2
          linesleft--;
    3358:	5343           	subq.w #1,d3
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    335a:	33cd 0000 707a 	move.w a5,707a <ZoomHorizontal>
      while( linesleft > 0)
    3360:	4a43           	tst.w d3
    3362:	6700 ff48      	beq.w 32ac <Zoom_ZoomIntoPicture+0x320>
    3366:	340d           	move.w a5,d2
    3368:	6000 fec4      	bra.w 322e <Zoom_ZoomIntoPicture+0x2a2>
  WORD shiftright = 9;
    336c:	7e09           	moveq #9,d7
  *bp2 = 0;
    336e:	4278 0206      	clr.w 206 <main+0x200>
  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
    3372:	7012           	moveq #18,d0
    3374:	9041           	sub.w d1,d0
    3376:	3f40 003e      	move.w d0,62(sp)
  while( ZoomHorizontalStart < 0) {
    337a:	6d00 fc62      	blt.w 2fde <Zoom_ZoomIntoPicture+0x52>
  UWORD shifthoriz = 7;
    337e:	7007           	moveq #7,d0
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    3380:	9449           	sub.w a1,d2
    3382:	3a42           	movea.w d2,a5
    3384:	4bed 0012      	lea 18(a5),a5
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz-2-i;
    3388:	0280 0000 ffff 	andi.l #65535,d0
    338e:	5280           	addq.l #1,d0
    3390:	2200           	move.l d0,d1
    3392:	d280           	add.l d0,d1
    3394:	d081           	add.l d1,d0
    3396:	e988           	lsl.l #4,d0
    3398:	226f 004c      	movea.l 76(sp),a1
    339c:	43f1 08fc      	lea (-4,a1,d0.l),a1
    33a0:	2f49 0034      	move.l a1,52(sp)
    33a4:	742c           	moveq #44,d2
    33a6:	d4af 0050      	add.l 80(sp),d2
    33aa:	2f42 0038      	move.l d2,56(sp)
  UWORD shifttoleft = 0;
    33ae:	426f 0042      	clr.w 66(sp)
  UWORD startofword = 21*16;
    33b2:	3f7c 0150 002e 	move.w #336,46(sp)
      nextzoom -= (19 + zoomnr);
    33b8:	74ed           	moveq #-19,d2
    33ba:	9448           	sub.w a0,d2
    33bc:	3f42 0046      	move.w d2,70(sp)
    WORD linesleft = 272;
    33c0:	3f47 002c      	move.w d7,44(sp)
    33c4:	6000 fc70      	bra.w 3036 <Zoom_ZoomIntoPicture+0xaa>

000033c8 <ClbuildZoom>:
ULONG * ClbuildZoom() {
    33c8:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    33cc:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    33d2:	203c 0000 a48c 	move.l #42124,d0
    33d8:	7202           	moveq #2,d1
    33da:	4eae ff3a      	jsr -198(a6)
    33de:	2440           	movea.l d0,a2
  if( retval == 0) {
    33e0:	4a80           	tst.l d0
    33e2:	6700 0160      	beq.w 3544 <ClbuildZoom+0x17c>
    *cl++ = *clpartinstruction++;
    33e6:	24b9 0000 6fdc 	move.l 6fdc <ClsSprites>,(a2)
    33ec:	2579 0000 6fe0 	move.l 6fe0 <ClsSprites+0x4>,4(a2)
    33f2:	0004 
    33f4:	2579 0000 6fe4 	move.l 6fe4 <ClsSprites+0x8>,8(a2)
    33fa:	0008 
    33fc:	2579 0000 6fe8 	move.l 6fe8 <ClsSprites+0xc>,12(a2)
    3402:	000c 
    3404:	2579 0000 6fec 	move.l 6fec <ClsSprites+0x10>,16(a2)
    340a:	0010 
    340c:	2579 0000 6ff0 	move.l 6ff0 <ClsSprites+0x14>,20(a2)
    3412:	0014 
    3414:	2579 0000 6ff4 	move.l 6ff4 <ClsSprites+0x18>,24(a2)
    341a:	0018 
    341c:	2579 0000 6ff8 	move.l 6ff8 <ClsSprites+0x1c>,28(a2)
    3422:	001c 
    3424:	2579 0000 6ffc 	move.l 6ffc <ClsSprites+0x20>,32(a2)
    342a:	0020 
    342c:	2579 0000 7000 	move.l 7000 <ClsSprites+0x24>,36(a2)
    3432:	0024 
    3434:	2579 0000 7004 	move.l 7004 <ClsSprites+0x28>,40(a2)
    343a:	0028 
    343c:	2579 0000 7008 	move.l 7008 <ClsSprites+0x2c>,44(a2)
    3442:	002c 
    3444:	2579 0000 700c 	move.l 700c <ClsSprites+0x30>,48(a2)
    344a:	0030 
    344c:	2579 0000 7010 	move.l 7010 <ClsSprites+0x34>,52(a2)
    3452:	0034 
    3454:	2579 0000 7014 	move.l 7014 <ClsSprites+0x38>,56(a2)
    345a:	0038 
    345c:	2579 0000 7018 	move.l 7018 <ClsSprites+0x3c>,60(a2)
    3462:	003c 
    *cl++ = *clpartinstruction++;
    3464:	2579 0000 6f74 	move.l 6f74 <ClScreenZoom>,64(a2)
    346a:	0040 
    346c:	2579 0000 6f78 	move.l 6f78 <ClScreenZoom+0x4>,68(a2)
    3472:	0044 
    3474:	2579 0000 6f7c 	move.l 6f7c <ClScreenZoom+0x8>,72(a2)
    347a:	0048 
    347c:	2579 0000 6f80 	move.l 6f80 <ClScreenZoom+0xc>,76(a2)
    3482:	004c 
    3484:	2579 0000 6f84 	move.l 6f84 <ClScreenZoom+0x10>,80(a2)
    348a:	0050 
    348c:	2579 0000 6f88 	move.l 6f88 <ClScreenZoom+0x14>,84(a2)
    3492:	0054 
    3494:	2579 0000 6f8c 	move.l 6f8c <ClScreenZoom+0x18>,88(a2)
    349a:	0058 
    349c:	2579 0000 6f90 	move.l 6f90 <ClScreenZoom+0x1c>,92(a2)
    34a2:	005c 
    34a4:	2579 0000 6f94 	move.l 6f94 <ClScreenZoom+0x20>,96(a2)
    34aa:	0060 
    34ac:	2579 0000 6f98 	move.l 6f98 <ClScreenZoom+0x24>,100(a2)
    34b2:	0064 
    34b4:	2579 0000 6f9c 	move.l 6f9c <ClScreenZoom+0x28>,104(a2)
    34ba:	0068 
    34bc:	2579 0000 6fa0 	move.l 6fa0 <ClScreenZoom+0x2c>,108(a2)
    34c2:	006c 
  *cl++ = 0x00e00000;
    34c4:	257c 00e0 0000 	move.l #14680064,112(a2)
    34ca:	0070 
  *cl++ = 0x00e20000;
    34cc:	257c 00e2 0000 	move.l #14811136,116(a2)
    34d2:	0074 
  *cl++ = 0x00e40000;
    34d4:	257c 00e4 0000 	move.l #14942208,120(a2)
    34da:	0078 
  *cl++ = 0x00e60000;
    34dc:	257c 00e6 0000 	move.l #15073280,124(a2)
    34e2:	007c 
    *cl++ = *clpartinstruction++;
    34e4:	2579 0000 6fa4 	move.l 6fa4 <ClColor>,128(a2)
    34ea:	0080 
    34ec:	2579 0000 6fa8 	move.l 6fa8 <ClColor+0x4>,132(a2)
    34f2:	0084 
    34f4:	43ea 012c      	lea 300(a2),a1
    34f8:	220a           	move.l a2,d1
    34fa:	0681 0000 a52c 	addi.l #42284,d1
    3500:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    3506:	41e9 ff60      	lea -160(a1),a0
    350a:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    350e:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    3514:	5088           	addq.l #8,a0
    3516:	217c 0182 0f00 	move.l #25300736,-4(a0)
    351c:	fffc 
    for(int i2=0;i2<20;i2++) {
    351e:	b3c8           	cmpa.l a0,a1
    3520:	66ec           	bne.s 350e <ClbuildZoom+0x146>
    3522:	43e8 00a4      	lea 164(a0),a1
    3526:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    352c:	b3c1           	cmpa.l d1,a1
    352e:	66d6           	bne.s 3506 <ClbuildZoom+0x13e>
   *cl = 0xfffffffe;
    3530:	203c 0000 a488 	move.l #42120,d0
    3536:	72fe           	moveq #-2,d1
    3538:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    353c:	200a           	move.l a2,d0
    353e:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    3542:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    3544:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    354a:	4eae ffc4      	jsr -60(a6)
    354e:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    3554:	2200           	move.l d0,d1
    3556:	243c 0000 45a1 	move.l #17825,d2
    355c:	7628           	moveq #40,d3
    355e:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    3562:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    3568:	7201           	moveq #1,d1
    356a:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    356e:	24b9 0000 6fdc 	move.l 6fdc <ClsSprites>,(a2)
    3574:	2579 0000 6fe0 	move.l 6fe0 <ClsSprites+0x4>,4(a2)
    357a:	0004 
    357c:	2579 0000 6fe4 	move.l 6fe4 <ClsSprites+0x8>,8(a2)
    3582:	0008 
    3584:	2579 0000 6fe8 	move.l 6fe8 <ClsSprites+0xc>,12(a2)
    358a:	000c 
    358c:	2579 0000 6fec 	move.l 6fec <ClsSprites+0x10>,16(a2)
    3592:	0010 
    3594:	2579 0000 6ff0 	move.l 6ff0 <ClsSprites+0x14>,20(a2)
    359a:	0014 
    359c:	2579 0000 6ff4 	move.l 6ff4 <ClsSprites+0x18>,24(a2)
    35a2:	0018 
    35a4:	2579 0000 6ff8 	move.l 6ff8 <ClsSprites+0x1c>,28(a2)
    35aa:	001c 
    35ac:	2579 0000 6ffc 	move.l 6ffc <ClsSprites+0x20>,32(a2)
    35b2:	0020 
    35b4:	2579 0000 7000 	move.l 7000 <ClsSprites+0x24>,36(a2)
    35ba:	0024 
    35bc:	2579 0000 7004 	move.l 7004 <ClsSprites+0x28>,40(a2)
    35c2:	0028 
    35c4:	2579 0000 7008 	move.l 7008 <ClsSprites+0x2c>,44(a2)
    35ca:	002c 
    35cc:	2579 0000 700c 	move.l 700c <ClsSprites+0x30>,48(a2)
    35d2:	0030 
    35d4:	2579 0000 7010 	move.l 7010 <ClsSprites+0x34>,52(a2)
    35da:	0034 
    35dc:	2579 0000 7014 	move.l 7014 <ClsSprites+0x38>,56(a2)
    35e2:	0038 
    35e4:	2579 0000 7018 	move.l 7018 <ClsSprites+0x3c>,60(a2)
    35ea:	003c 
    *cl++ = *clpartinstruction++;
    35ec:	2579 0000 6f74 	move.l 6f74 <ClScreenZoom>,64(a2)
    35f2:	0040 
    35f4:	2579 0000 6f78 	move.l 6f78 <ClScreenZoom+0x4>,68(a2)
    35fa:	0044 
    35fc:	2579 0000 6f7c 	move.l 6f7c <ClScreenZoom+0x8>,72(a2)
    3602:	0048 
    3604:	2579 0000 6f80 	move.l 6f80 <ClScreenZoom+0xc>,76(a2)
    360a:	004c 
    360c:	2579 0000 6f84 	move.l 6f84 <ClScreenZoom+0x10>,80(a2)
    3612:	0050 
    3614:	2579 0000 6f88 	move.l 6f88 <ClScreenZoom+0x14>,84(a2)
    361a:	0054 
    361c:	2579 0000 6f8c 	move.l 6f8c <ClScreenZoom+0x18>,88(a2)
    3622:	0058 
    3624:	2579 0000 6f90 	move.l 6f90 <ClScreenZoom+0x1c>,92(a2)
    362a:	005c 
    362c:	2579 0000 6f94 	move.l 6f94 <ClScreenZoom+0x20>,96(a2)
    3632:	0060 
    3634:	2579 0000 6f98 	move.l 6f98 <ClScreenZoom+0x24>,100(a2)
    363a:	0064 
    363c:	2579 0000 6f9c 	move.l 6f9c <ClScreenZoom+0x28>,104(a2)
    3642:	0068 
    3644:	2579 0000 6fa0 	move.l 6fa0 <ClScreenZoom+0x2c>,108(a2)
    364a:	006c 
  *cl++ = 0x00e00000;
    364c:	257c 00e0 0000 	move.l #14680064,112(a2)
    3652:	0070 
  *cl++ = 0x00e20000;
    3654:	257c 00e2 0000 	move.l #14811136,116(a2)
    365a:	0074 
  *cl++ = 0x00e40000;
    365c:	257c 00e4 0000 	move.l #14942208,120(a2)
    3662:	0078 
  *cl++ = 0x00e60000;
    3664:	257c 00e6 0000 	move.l #15073280,124(a2)
    366a:	007c 
    *cl++ = *clpartinstruction++;
    366c:	2579 0000 6fa4 	move.l 6fa4 <ClColor>,128(a2)
    3672:	0080 
    3674:	2579 0000 6fa8 	move.l 6fa8 <ClColor+0x4>,132(a2)
    367a:	0084 
    367c:	43ea 012c      	lea 300(a2),a1
    3680:	220a           	move.l a2,d1
    3682:	0681 0000 a52c 	addi.l #42284,d1
    3688:	203c 2c07 fffe 	move.l #738721790,d0
    368e:	6000 fe76      	bra.w 3506 <ClbuildZoom+0x13e>

00003692 <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    3692:	2039 0000 7088 	move.l 7088 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    3698:	23f9 0000 707c 	move.l 707c <ViewCopper>,7088 <DrawCopper>
    369e:	0000 7088 
  ViewCopper = (ULONG *)tmp;
    36a2:	23c0 0000 707c 	move.l d0,707c <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    36a8:	2079 0000 7072 	movea.l 7072 <hw>,a0
    36ae:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    36b2:	3140 0088      	move.w d0,136(a0)
}
    36b6:	4e75           	rts

000036b8 <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    36b8:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    36bc:	45fa fd0a      	lea 33c8 <ClbuildZoom>(pc),a2
    36c0:	4e92           	jsr (a2)
    36c2:	23c0 0000 7098 	move.l d0,7098 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    36c8:	4e92           	jsr (a2)
    36ca:	23c0 0000 7094 	move.l d0,7094 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    36d0:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    36d6:	203c 0001 6800 	move.l #92160,d0
    36dc:	7202           	moveq #2,d1
    36de:	4eae ff3a      	jsr -198(a6)
    36e2:	23c0 0000 7090 	move.l d0,7090 <Bitplane1>
  if(Bitplane1 == 0) {
    36e8:	6700 014e      	beq.w 3838 <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    36ec:	23c0 0000 708c 	move.l d0,708c <DrawBuffer>
  DrawCopper = Copperlist1;
    36f2:	23f9 0000 7098 	move.l 7098 <Copperlist1>,7088 <DrawCopper>
    36f8:	0000 7088 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    36fc:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    3702:	203c 0001 6800 	move.l #92160,d0
    3708:	7202           	moveq #2,d1
    370a:	4eae ff3a      	jsr -198(a6)
    370e:	2400           	move.l d0,d2
    3710:	23c0 0000 7084 	move.l d0,7084 <Bitplane2>
  if(Bitplane2 == 0) {
    3716:	6778           	beq.s 3790 <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    3718:	23f9 0000 7094 	move.l 7094 <Copperlist2>,707c <ViewCopper>
    371e:	0000 707c 
  SwapCl();
    3722:	45fa ff6e      	lea 3692 <SwapCl>(pc),a2
    3726:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    3728:	2039 0000 708c 	move.l 708c <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    372e:	2079 0000 7088 	movea.l 7088 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    3734:	2200           	move.l d0,d1
    3736:	4241           	clr.w d1
    3738:	4841           	swap d1
    373a:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    373e:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    3742:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    3748:	2200           	move.l d0,d1
    374a:	4241           	clr.w d1
    374c:	4841           	swap d1
    374e:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    3752:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    3756:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    3758:	2079 0000 7088 	movea.l 7088 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    375e:	2002           	move.l d2,d0
    3760:	4240           	clr.w d0
    3762:	4840           	swap d0
    3764:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    3768:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    376c:	2002           	move.l d2,d0
    376e:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    3774:	2200           	move.l d0,d1
    3776:	4241           	clr.w d1
    3778:	4841           	swap d1
    377a:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    377e:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    3782:	23c2 0000 7080 	move.l d2,7080 <ViewBuffer>
}
    3788:	7000           	moveq #0,d0
    378a:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    378e:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    3790:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    3796:	4eae ffc4      	jsr -60(a6)
    379a:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    37a0:	2200           	move.l d0,d1
    37a2:	243c 0000 45ee 	move.l #17902,d2
    37a8:	7626           	moveq #38,d3
    37aa:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    37ae:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    37b4:	7201           	moveq #1,d1
    37b6:	4eae ff70      	jsr -144(a6)
    37ba:	2439 0000 7084 	move.l 7084 <Bitplane2>,d2
  ViewCopper = Copperlist2;
    37c0:	23f9 0000 7094 	move.l 7094 <Copperlist2>,707c <ViewCopper>
    37c6:	0000 707c 
  SwapCl();
    37ca:	45fa fec6      	lea 3692 <SwapCl>(pc),a2
    37ce:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    37d0:	2039 0000 708c 	move.l 708c <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    37d6:	2079 0000 7088 	movea.l 7088 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    37dc:	2200           	move.l d0,d1
    37de:	4241           	clr.w d1
    37e0:	4841           	swap d1
    37e2:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    37e6:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    37ea:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    37f0:	2200           	move.l d0,d1
    37f2:	4241           	clr.w d1
    37f4:	4841           	swap d1
    37f6:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    37fa:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    37fe:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    3800:	2079 0000 7088 	movea.l 7088 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    3806:	2002           	move.l d2,d0
    3808:	4240           	clr.w d0
    380a:	4840           	swap d0
    380c:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    3810:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    3814:	2002           	move.l d2,d0
    3816:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    381c:	2200           	move.l d0,d1
    381e:	4241           	clr.w d1
    3820:	4841           	swap d1
    3822:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    3826:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    382a:	23c2 0000 7080 	move.l d2,7080 <ViewBuffer>
}
    3830:	7000           	moveq #0,d0
    3832:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    3836:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    3838:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    383e:	4eae ffc4      	jsr -60(a6)
    3842:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    3848:	2200           	move.l d0,d1
    384a:	243c 0000 45c7 	move.l #17863,d2
    3850:	7626           	moveq #38,d3
    3852:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    3856:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    385c:	7201           	moveq #1,d1
    385e:	4eae ff70      	jsr -144(a6)
    3862:	2039 0000 7090 	move.l 7090 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    3868:	23c0 0000 708c 	move.l d0,708c <DrawBuffer>
  DrawCopper = Copperlist1;
    386e:	23f9 0000 7098 	move.l 7098 <Copperlist1>,7088 <DrawCopper>
    3874:	0000 7088 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    3878:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    387e:	203c 0001 6800 	move.l #92160,d0
    3884:	7202           	moveq #2,d1
    3886:	4eae ff3a      	jsr -198(a6)
    388a:	2400           	move.l d0,d2
    388c:	23c0 0000 7084 	move.l d0,7084 <Bitplane2>
  if(Bitplane2 == 0) {
    3892:	6600 fe84      	bne.w 3718 <PrepareDisplayZoom+0x60>
    3896:	6000 fef8      	bra.w 3790 <PrepareDisplayZoom+0xd8>

0000389a <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    389a:	2039 0000 708c 	move.l 708c <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    38a0:	2079 0000 7088 	movea.l 7088 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    38a6:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    38aa:	2200           	move.l d0,d1
    38ac:	4241           	clr.w d1
    38ae:	4841           	swap d1
    38b0:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    38b4:	23f9 0000 7080 	move.l 7080 <ViewBuffer>,708c <DrawBuffer>
    38ba:	0000 708c 
  ViewBuffer = (ULONG *) tmp;
    38be:	23c0 0000 7080 	move.l d0,7080 <ViewBuffer>
}
    38c4:	4e75           	rts

000038c6 <PrepareDisplay>:
 int PrepareDisplaySW() {
    38c6:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClbuildSW();
    38ca:	45fa f462      	lea 2d2e <ClBuild>(pc),a2
    38ce:	4e92           	jsr (a2)
    38d0:	23c0 0000 7098 	move.l d0,7098 <Copperlist1>
  Copperlist2 = ClbuildSW();
    38d6:	4e92           	jsr (a2)
    38d8:	23c0 0000 7094 	move.l d0,7094 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    38de:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    38e4:	203c 0000 c800 	move.l #51200,d0
    38ea:	7202           	moveq #2,d1
    38ec:	4eae ff3a      	jsr -198(a6)
    38f0:	23c0 0000 7090 	move.l d0,7090 <Bitplane1>
  if(Bitplane1 == 0) {
    38f6:	6700 00ac      	beq.w 39a4 <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    38fa:	23c0 0000 708c 	move.l d0,708c <DrawBuffer>
  DrawCopper = Copperlist1;
    3900:	23f9 0000 7098 	move.l 7098 <Copperlist1>,7088 <DrawCopper>
    3906:	0000 7088 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    390a:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    3910:	203c 0000 c800 	move.l #51200,d0
    3916:	7202           	moveq #2,d1
    3918:	4eae ff3a      	jsr -198(a6)
    391c:	23c0 0000 7084 	move.l d0,7084 <Bitplane2>
  if(Bitplane2 == 0) {
    3922:	6728           	beq.s 394c <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    3924:	23c0 0000 7080 	move.l d0,7080 <ViewBuffer>
  ViewCopper = Copperlist2;
    392a:	23f9 0000 7094 	move.l 7094 <Copperlist2>,707c <ViewCopper>
    3930:	0000 707c 
  SwapCl();
    3934:	47fa fd5c      	lea 3692 <SwapCl>(pc),a3
    3938:	4e93           	jsr (a3)
  SetBplPointers();
    393a:	45fa ff5e      	lea 389a <SetBplPointers>(pc),a2
    393e:	4e92           	jsr (a2)
  SwapCl();
    3940:	4e93           	jsr (a3)
  SetBplPointers();
    3942:	4e92           	jsr (a2)
}
    3944:	7000           	moveq #0,d0
    3946:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    394a:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    394c:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    3952:	4eae ffc4      	jsr -60(a6)
    3956:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    395c:	2200           	move.l d0,d1
    395e:	243c 0000 45ee 	move.l #17902,d2
    3964:	7626           	moveq #38,d3
    3966:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    396a:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    3970:	7201           	moveq #1,d1
    3972:	4eae ff70      	jsr -144(a6)
    3976:	2039 0000 7084 	move.l 7084 <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    397c:	23c0 0000 7080 	move.l d0,7080 <ViewBuffer>
  ViewCopper = Copperlist2;
    3982:	23f9 0000 7094 	move.l 7094 <Copperlist2>,707c <ViewCopper>
    3988:	0000 707c 
  SwapCl();
    398c:	47fa fd04      	lea 3692 <SwapCl>(pc),a3
    3990:	4e93           	jsr (a3)
  SetBplPointers();
    3992:	45fa ff06      	lea 389a <SetBplPointers>(pc),a2
    3996:	4e92           	jsr (a2)
  SwapCl();
    3998:	4e93           	jsr (a3)
  SetBplPointers();
    399a:	4e92           	jsr (a2)
}
    399c:	7000           	moveq #0,d0
    399e:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    39a2:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    39a4:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    39aa:	4eae ffc4      	jsr -60(a6)
    39ae:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    39b4:	2200           	move.l d0,d1
    39b6:	243c 0000 45c7 	move.l #17863,d2
    39bc:	7626           	moveq #38,d3
    39be:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    39c2:	2c79 0000 709c 	movea.l 709c <DOSBase>,a6
    39c8:	7201           	moveq #1,d1
    39ca:	4eae ff70      	jsr -144(a6)
    39ce:	2039 0000 7090 	move.l 7090 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    39d4:	23c0 0000 708c 	move.l d0,708c <DrawBuffer>
  DrawCopper = Copperlist1;
    39da:	23f9 0000 7098 	move.l 7098 <Copperlist1>,7088 <DrawCopper>
    39e0:	0000 7088 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    39e4:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    39ea:	203c 0000 c800 	move.l #51200,d0
    39f0:	7202           	moveq #2,d1
    39f2:	4eae ff3a      	jsr -198(a6)
    39f6:	23c0 0000 7084 	move.l d0,7084 <Bitplane2>
  if(Bitplane2 == 0) {
    39fc:	6600 ff26      	bne.w 3924 <PrepareDisplay+0x5e>
    3a00:	6000 ff4a      	bra.w 394c <PrepareDisplay+0x86>

00003a04 <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    3a04:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    3a08:	262f 0010      	move.l 16(sp),d3
    3a0c:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    3a10:	2279 0000 7098 	movea.l 7098 <Copperlist1>,a1
    3a16:	b2fc 0000      	cmpa.w #0,a1
    3a1a:	670c           	beq.s 3a28 <FreeDisplay+0x24>
    3a1c:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    3a22:	2003           	move.l d3,d0
    3a24:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    3a28:	2279 0000 7094 	movea.l 7094 <Copperlist2>,a1
    3a2e:	b2fc 0000      	cmpa.w #0,a1
    3a32:	670c           	beq.s 3a40 <FreeDisplay+0x3c>
    3a34:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    3a3a:	2003           	move.l d3,d0
    3a3c:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    3a40:	2279 0000 7090 	movea.l 7090 <Bitplane1>,a1
    3a46:	b2fc 0000      	cmpa.w #0,a1
    3a4a:	670c           	beq.s 3a58 <FreeDisplay+0x54>
    3a4c:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    3a52:	2002           	move.l d2,d0
    3a54:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    3a58:	2279 0000 7084 	movea.l 7084 <Bitplane2>,a1
    3a5e:	b2fc 0000      	cmpa.w #0,a1
    3a62:	670c           	beq.s 3a70 <FreeDisplay+0x6c>
    3a64:	2c79 0000 70a0 	movea.l 70a0 <SysBase>,a6
    3a6a:	2002           	move.l d2,d0
    3a6c:	4eae ff2e      	jsr -210(a6)
}
    3a70:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3a74:	4e75           	rts

00003a76 <WaitVbl>:
void WaitVbl() {
    3a76:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    3a78:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddb7aa>,d0
    3a7e:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    3a80:	2017           	move.l (sp),d0
    3a82:	0280 0001 ff00 	andi.l #130816,d0
    3a88:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    3a8a:	2017           	move.l (sp),d0
    3a8c:	0c80 0001 3700 	cmpi.l #79616,d0
    3a92:	67e4           	beq.s 3a78 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    3a94:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddb7aa>,d0
    3a9a:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    3a9e:	202f 0004      	move.l 4(sp),d0
    3aa2:	0280 0001 ff00 	andi.l #130816,d0
    3aa8:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    3aac:	202f 0004      	move.l 4(sp),d0
    3ab0:	0c80 0001 3700 	cmpi.l #79616,d0
    3ab6:	66dc           	bne.s 3a94 <WaitVbl+0x1e>
}
    3ab8:	508f           	addq.l #8,sp
    3aba:	4e75           	rts

00003abc <memcpy>:
{
    3abc:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    3ac0:	202f 0014      	move.l 20(sp),d0
    3ac4:	226f 0018      	movea.l 24(sp),a1
    3ac8:	222f 001c      	move.l 28(sp),d1
	while(len--)
    3acc:	2601           	move.l d1,d3
    3ace:	5383           	subq.l #1,d3
    3ad0:	4a81           	tst.l d1
    3ad2:	6762           	beq.s 3b36 <memcpy+0x7a>
    3ad4:	2040           	movea.l d0,a0
    3ad6:	5888           	addq.l #4,a0
    3ad8:	b1c9           	cmpa.l a1,a0
    3ada:	53c2           	sl.s d2
    3adc:	4402           	neg.b d2
    3ade:	41e9 0004      	lea 4(a1),a0
    3ae2:	b1c0           	cmpa.l d0,a0
    3ae4:	53c4           	sl.s d4
    3ae6:	4404           	neg.b d4
    3ae8:	8404           	or.b d4,d2
    3aea:	7808           	moveq #8,d4
    3aec:	b883           	cmp.l d3,d4
    3aee:	55c4           	sc.s d4
    3af0:	4404           	neg.b d4
    3af2:	c404           	and.b d4,d2
    3af4:	6746           	beq.s 3b3c <memcpy+0x80>
    3af6:	2409           	move.l a1,d2
    3af8:	8480           	or.l d0,d2
    3afa:	7803           	moveq #3,d4
    3afc:	c484           	and.l d4,d2
    3afe:	663c           	bne.s 3b3c <memcpy+0x80>
    3b00:	2049           	movea.l a1,a0
    3b02:	2440           	movea.l d0,a2
    3b04:	74fc           	moveq #-4,d2
    3b06:	c481           	and.l d1,d2
    3b08:	d489           	add.l a1,d2
		*d++ = *s++;
    3b0a:	24d8           	move.l (a0)+,(a2)+
    3b0c:	b488           	cmp.l a0,d2
    3b0e:	66fa           	bne.s 3b0a <memcpy+0x4e>
    3b10:	74fc           	moveq #-4,d2
    3b12:	c481           	and.l d1,d2
    3b14:	2040           	movea.l d0,a0
    3b16:	d1c2           	adda.l d2,a0
    3b18:	d3c2           	adda.l d2,a1
    3b1a:	9682           	sub.l d2,d3
    3b1c:	b481           	cmp.l d1,d2
    3b1e:	6716           	beq.s 3b36 <memcpy+0x7a>
    3b20:	1091           	move.b (a1),(a0)
	while(len--)
    3b22:	4a83           	tst.l d3
    3b24:	6710           	beq.s 3b36 <memcpy+0x7a>
		*d++ = *s++;
    3b26:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    3b2c:	5383           	subq.l #1,d3
    3b2e:	6706           	beq.s 3b36 <memcpy+0x7a>
		*d++ = *s++;
    3b30:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    3b36:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    3b3a:	4e75           	rts
    3b3c:	2040           	movea.l d0,a0
    3b3e:	d289           	add.l a1,d1
		*d++ = *s++;
    3b40:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    3b42:	b289           	cmp.l a1,d1
    3b44:	67f0           	beq.s 3b36 <memcpy+0x7a>
		*d++ = *s++;
    3b46:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    3b48:	b289           	cmp.l a1,d1
    3b4a:	66f4           	bne.s 3b40 <memcpy+0x84>
    3b4c:	60e8           	bra.s 3b36 <memcpy+0x7a>

00003b4e <memset>:
{
    3b4e:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    3b52:	202f 0024      	move.l 36(sp),d0
    3b56:	2a2f 0028      	move.l 40(sp),d5
    3b5a:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    3b5e:	2809           	move.l a1,d4
    3b60:	5384           	subq.l #1,d4
    3b62:	b2fc 0000      	cmpa.w #0,a1
    3b66:	6f00 00b0      	ble.w 3c18 <memset+0xca>
    3b6a:	1e05           	move.b d5,d7
    3b6c:	2200           	move.l d0,d1
    3b6e:	4481           	neg.l d1
    3b70:	7403           	moveq #3,d2
    3b72:	c282           	and.l d2,d1
    3b74:	7c05           	moveq #5,d6
		*ptr++ = val;
    3b76:	2440           	movea.l d0,a2
    3b78:	bc84           	cmp.l d4,d6
    3b7a:	646a           	bcc.s 3be6 <memset+0x98>
    3b7c:	4a81           	tst.l d1
    3b7e:	6724           	beq.s 3ba4 <memset+0x56>
    3b80:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    3b82:	5384           	subq.l #1,d4
    3b84:	7401           	moveq #1,d2
    3b86:	b481           	cmp.l d1,d2
    3b88:	671a           	beq.s 3ba4 <memset+0x56>
		*ptr++ = val;
    3b8a:	2440           	movea.l d0,a2
    3b8c:	548a           	addq.l #2,a2
    3b8e:	2040           	movea.l d0,a0
    3b90:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    3b94:	5384           	subq.l #1,d4
    3b96:	7403           	moveq #3,d2
    3b98:	b481           	cmp.l d1,d2
    3b9a:	6608           	bne.s 3ba4 <memset+0x56>
		*ptr++ = val;
    3b9c:	528a           	addq.l #1,a2
    3b9e:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    3ba2:	5384           	subq.l #1,d4
    3ba4:	2609           	move.l a1,d3
    3ba6:	9681           	sub.l d1,d3
    3ba8:	7c00           	moveq #0,d6
    3baa:	1c05           	move.b d5,d6
    3bac:	2406           	move.l d6,d2
    3bae:	4842           	swap d2
    3bb0:	4242           	clr.w d2
    3bb2:	2042           	movea.l d2,a0
    3bb4:	2406           	move.l d6,d2
    3bb6:	e14a           	lsl.w #8,d2
    3bb8:	4842           	swap d2
    3bba:	4242           	clr.w d2
    3bbc:	e18e           	lsl.l #8,d6
    3bbe:	2646           	movea.l d6,a3
    3bc0:	2c08           	move.l a0,d6
    3bc2:	8486           	or.l d6,d2
    3bc4:	2c0b           	move.l a3,d6
    3bc6:	8486           	or.l d6,d2
    3bc8:	1407           	move.b d7,d2
    3bca:	2040           	movea.l d0,a0
    3bcc:	d1c1           	adda.l d1,a0
    3bce:	72fc           	moveq #-4,d1
    3bd0:	c283           	and.l d3,d1
    3bd2:	d288           	add.l a0,d1
		*ptr++ = val;
    3bd4:	20c2           	move.l d2,(a0)+
    3bd6:	b1c1           	cmpa.l d1,a0
    3bd8:	66fa           	bne.s 3bd4 <memset+0x86>
    3bda:	72fc           	moveq #-4,d1
    3bdc:	c283           	and.l d3,d1
    3bde:	d5c1           	adda.l d1,a2
    3be0:	9881           	sub.l d1,d4
    3be2:	b283           	cmp.l d3,d1
    3be4:	6732           	beq.s 3c18 <memset+0xca>
    3be6:	1485           	move.b d5,(a2)
	while(len-- > 0)
    3be8:	4a84           	tst.l d4
    3bea:	6f2c           	ble.s 3c18 <memset+0xca>
		*ptr++ = val;
    3bec:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    3bf0:	7201           	moveq #1,d1
    3bf2:	b284           	cmp.l d4,d1
    3bf4:	6c22           	bge.s 3c18 <memset+0xca>
		*ptr++ = val;
    3bf6:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    3bfa:	7402           	moveq #2,d2
    3bfc:	b484           	cmp.l d4,d2
    3bfe:	6c18           	bge.s 3c18 <memset+0xca>
		*ptr++ = val;
    3c00:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    3c04:	7c03           	moveq #3,d6
    3c06:	bc84           	cmp.l d4,d6
    3c08:	6c0e           	bge.s 3c18 <memset+0xca>
		*ptr++ = val;
    3c0a:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    3c0e:	7204           	moveq #4,d1
    3c10:	b284           	cmp.l d4,d1
    3c12:	6c04           	bge.s 3c18 <memset+0xca>
		*ptr++ = val;
    3c14:	1545 0005      	move.b d5,5(a2)
}
    3c18:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    3c1c:	4e75           	rts

00003c1e <strlen>:
{
    3c1e:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    3c22:	7000           	moveq #0,d0
	while(*s++)
    3c24:	4a10           	tst.b (a0)
    3c26:	6708           	beq.s 3c30 <strlen+0x12>
		t++;
    3c28:	5280           	addq.l #1,d0
	while(*s++)
    3c2a:	4a30 0800      	tst.b (0,a0,d0.l)
    3c2e:	66f8           	bne.s 3c28 <strlen+0xa>
}
    3c30:	4e75           	rts
    3c32:	4e71           	nop

00003c34 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    3c34:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    3c38:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    3c3c:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    3c40:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    3c44:	d041           	add.w d1,d0
	swap	d0
    3c46:	4840           	swap d0
	clrw	d0
    3c48:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    3c4a:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    3c4e:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    3c52:	d081           	add.l d1,d0

	rts
    3c54:	4e75           	rts

00003c56 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    3c56:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    3c58:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    3c5c:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    3c60:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    3c66:	6416           	bcc.s 3c7e <__udivsi3+0x28>
	movel	d0, d2
    3c68:	2400           	move.l d0,d2
	clrw	d2
    3c6a:	4242           	clr.w d2
	swap	d2
    3c6c:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    3c6e:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    3c70:	3002           	move.w d2,d0
	swap	d0
    3c72:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    3c74:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    3c78:	84c1           	divu.w d1,d2
	movew	d2, d0
    3c7a:	3002           	move.w d2,d0
	jra	6f
    3c7c:	6030           	bra.s 3cae <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    3c7e:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    3c80:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    3c82:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    3c84:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    3c8a:	64f4           	bcc.s 3c80 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    3c8c:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    3c8e:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    3c94:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    3c96:	c2c0           	mulu.w d0,d1
	swap	d2
    3c98:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    3c9a:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    3c9c:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    3c9e:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    3ca0:	660a           	bne.s 3cac <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    3ca2:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    3ca4:	6506           	bcs.s 3cac <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    3ca6:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    3caa:	6302           	bls.s 3cae <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    3cac:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    3cae:	241f           	move.l (sp)+,d2
	rts
    3cb0:	4e75           	rts

00003cb2 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    3cb2:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    3cb4:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    3cb6:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    3cba:	6a04           	bpl.s 3cc0 <__divsi3+0xe>
	negl	d1
    3cbc:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    3cbe:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    3cc0:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    3cc4:	6a04           	bpl.s 3cca <__divsi3+0x18>
	negl	d0
    3cc6:	4480           	neg.l d0
	negb	d2
    3cc8:	4402           	neg.b d2

2:	movel	d1, sp@-
    3cca:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    3ccc:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    3cce:	6186           	bsr.s 3c56 <__udivsi3>
	addql	IMM (8), sp
    3cd0:	508f           	addq.l #8,sp

	tstb	d2
    3cd2:	4a02           	tst.b d2
	jpl	3f
    3cd4:	6a02           	bpl.s 3cd8 <__divsi3+0x26>
	negl	d0
    3cd6:	4480           	neg.l d0

3:	movel	sp@+, d2
    3cd8:	241f           	move.l (sp)+,d2
	rts
    3cda:	4e75           	rts

00003cdc <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    3cdc:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    3ce0:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    3ce4:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    3ce6:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    3ce8:	61c8           	bsr.s 3cb2 <__divsi3>
	addql	IMM (8), sp
    3cea:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    3cec:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    3cf0:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    3cf2:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    3cf4:	6100 ff3e      	bsr.w 3c34 <__mulsi3>
	addql	IMM (8), sp
    3cf8:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    3cfa:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    3cfe:	9280           	sub.l d0,d1
	movel	d1, d0
    3d00:	2001           	move.l d1,d0
	rts
    3d02:	4e75           	rts

00003d04 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    3d04:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    3d08:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    3d0c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    3d0e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    3d10:	6100 ff44      	bsr.w 3c56 <__udivsi3>
	addql	IMM (8), sp
    3d14:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    3d16:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    3d1a:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    3d1c:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    3d1e:	6100 ff14      	bsr.w 3c34 <__mulsi3>
	addql	IMM (8), sp
    3d22:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    3d24:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    3d28:	9280           	sub.l d0,d1
	movel	d1, d0
    3d2a:	2001           	move.l d1,d0
	rts
    3d2c:	4e75           	rts

00003d2e <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    3d2e:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    3d30:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    3d34:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    3d38:	2c5f           	movea.l (sp)+,a6
    rts
    3d3a:	4e75           	rts

00003d3c <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    3d3c:	16c0           	move.b d0,(a3)+
	rts
    3d3e:	4e75           	rts

00003d40 <saveregs>:
	...

00003d7c <font2distance>:
    3d7c:	0505           	btst d2,d5
    3d7e:	0505           	btst d2,d5
    3d80:	0505           	btst d2,d5
    3d82:	0505           	btst d2,d5
    3d84:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    3d86:	0505           	btst d2,d5
    3d88:	0505           	btst d2,d5
    3d8a:	0005 0505      	ori.b #5,d5
    3d8e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    3d90:	0505           	btst d2,d5
    3d92:	0505           	btst d2,d5
    3d94:	0505           	btst d2,d5
    3d96:	0505           	btst d2,d5
    3d98:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    3d9a:	0505           	btst d2,d5
    3d9c:	0505           	btst d2,d5
    3d9e:	0505           	btst d2,d5
    3da0:	0505           	btst d2,d5
    3da2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    3da4:	0500           	btst d2,d0
    3da6:	0505           	btst d2,d5
    3da8:	0505           	btst d2,d5
    3daa:	0505           	btst d2,d5
    3dac:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    3dae:	0505           	btst d2,d5
    3db0:	0505           	btst d2,d5
    3db2:	0505           	btst d2,d5
    3db4:	0505           	btst d2,d5
    3db6:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    3db8:	0505           	btst d2,d5
    3dba:	0505           	btst d2,d5
    3dbc:	0503           	btst d2,d3
    3dbe:	0505           	btst d2,d5
    3dc0:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    3dc2:	0505           	btst d2,d5
    3dc4:	0500           	btst d2,d0
    3dc6:	0505           	btst d2,d5
    3dc8:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    3dcc:	0505           	btst d2,d5
    3dce:	0503           	btst d2,d3
    3dd0:	0205 0507      	andi.b #7,d5
    3dd4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    3dd6:	0505           	btst d2,d5
    3dd8:	0505           	btst d2,d5
    3dda:	0505           	btst d2,d5
    3ddc:	0505           	btst d2,d5
    3dde:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3de0:	0505           	btst d2,d5
    3de2:	0505           	btst d2,d5
    3de4:	0505           	btst d2,d5
    3de6:	0505           	btst d2,d5
    3de8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3dea:	0505           	btst d2,d5
    3dec:	0505           	btst d2,d5
    3dee:	0505           	btst d2,d5
    3df0:	0505           	btst d2,d5
    3df2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3df4:	0505           	btst d2,d5
    3df6:	0505           	btst d2,d5
    3df8:	0505           	btst d2,d5
    3dfa:	0505           	btst d2,d5
    3dfc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3dfe:	0505           	btst d2,d5
    3e00:	0505           	btst d2,d5
    3e02:	0505           	btst d2,d5
    3e04:	0505           	btst d2,d5
    3e06:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3e08:	0505           	btst d2,d5
    3e0a:	0505           	btst d2,d5
    3e0c:	0505           	btst d2,d5
    3e0e:	0505           	btst d2,d5
    3e10:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3e12:	0505           	btst d2,d5
    3e14:	0505           	btst d2,d5
    3e16:	0505           	btst d2,d5
    3e18:	0505           	btst d2,d5
    3e1a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3e1c:	0505           	btst d2,d5
    3e1e:	0505           	btst d2,d5
    3e20:	0505           	btst d2,d5
    3e22:	0505           	btst d2,d5
    3e24:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3e26:	0505           	btst d2,d5
    3e28:	0505           	btst d2,d5
    3e2a:	0505           	btst d2,d5
    3e2c:	0505           	btst d2,d5
    3e2e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3e30:	0505           	btst d2,d5
    3e32:	0505           	btst d2,d5
    3e34:	0505           	btst d2,d5
    3e36:	0505           	btst d2,d5
    3e38:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3e3a:	0505           	btst d2,d5
    3e3c:	0505           	btst d2,d5
    3e3e:	0505           	btst d2,d5
    3e40:	0505           	btst d2,d5
    3e42:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3e44:	0505           	btst d2,d5
    3e46:	0505           	btst d2,d5
    3e48:	0505           	btst d2,d5
    3e4a:	0505           	btst d2,d5
    3e4c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3e4e:	0505           	btst d2,d5
    3e50:	0505           	btst d2,d5
    3e52:	0505           	btst d2,d5
    3e54:	0505           	btst d2,d5
    3e56:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3e58:	0505           	btst d2,d5
    3e5a:	0505           	btst d2,d5
    3e5c:	0505           	btst d2,d5
    3e5e:	0505           	btst d2,d5
    3e60:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3e62:	0505           	btst d2,d5
    3e64:	0505           	btst d2,d5
    3e66:	0505           	btst d2,d5
    3e68:	0505           	btst d2,d5
    3e6a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    3e6c:	0505           	btst d2,d5
    3e6e:	0505           	btst d2,d5
    3e70:	0505           	btst d2,d5
    3e72:	0505           	btst d2,d5
    3e74:	0505           	btst d2,d5

00003e76 <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    3e76:	16c0           	move.b d0,(a3)+
  RTS
    3e78:	4e75           	rts

00003e7a <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    3e7a:	48f9 7fff 0000 	movem.l d0-a6,3d40 <saveregs>
    3e80:	3d40 
  lea 0xdff000,a5
    3e82:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddb7a6>,a5
  move.l sp@(4),a0  //Fontlocation
    3e88:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    3e8c:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    3e90:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    3e94:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    3e96:	082d 0006 0002 	btst #6,2(a5)

00003e9c <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    3e9c:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    3ea2:	66f8           	bne.s 3e9c <st2wblit>

00003ea4 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    3ea4:	7019           	moveq #25,d0
	sub.l d5,d5      
    3ea6:	9a85           	sub.l d5,d5

00003ea8 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    3ea8:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    3eaa:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    3eac:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    3eb0:	9dce           	suba.l a6,a6
	move.l d2, a6
    3eb2:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    3eb4:	ddfc 0000 3d7c 	adda.l #15740,a6

	LSL  	#4,d2 	    //Fetch next char
    3eba:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    3ebc:	2842           	movea.l d2,a4


	move.l  #0,d4
    3ebe:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    3ec0:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    3ec2:	3814           	move.w (a4),d4
	swap	d4
    3ec4:	4844           	swap d4
	lsr.l	d5, d4
    3ec6:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    3ec8:	8993           	or.l d4,(a3)
	clr.l	d4
    3eca:	4284           	clr.l d4
	move.w  2(a4), d4
    3ecc:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    3ed0:	4844           	swap d4
	lsr.l	d5, d4
    3ed2:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    3ed4:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    3ed8:	4284           	clr.l d4
	move.w  4(a4), d4
    3eda:	382c 0004      	move.w 4(a4),d4
	swap	d4
    3ede:	4844           	swap d4
	lsr.l	d5, d4
    3ee0:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    3ee2:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    3ee6:	4284           	clr.l d4
	move.w  6(a4), d4
    3ee8:	382c 0006      	move.w 6(a4),d4
	swap	d4
    3eec:	4844           	swap d4
	lsr.l	d5, d4
    3eee:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    3ef0:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    3ef4:	4284           	clr.l d4
	move.w  8(a4), d4
    3ef6:	382c 0008      	move.w 8(a4),d4
	swap	d4
    3efa:	4844           	swap d4
	lsr.l	d5, d4
    3efc:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    3efe:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    3f02:	4284           	clr.l d4
	move.w  10(a4), d4
    3f04:	382c 000a      	move.w 10(a4),d4
	swap	d4
    3f08:	4844           	swap d4
	lsr.l	d5, d4
    3f0a:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    3f0c:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    3f10:	4284           	clr.l d4
	move.w  12(a4), d4
    3f12:	382c 000c      	move.w 12(a4),d4
	swap	d4
    3f16:	4844           	swap d4
	lsr.l	d5, d4
    3f18:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    3f1a:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    3f1e:	4284           	clr.l d4
	move.w  14(a4), d4
    3f20:	382c 000e      	move.w 14(a4),d4
	swap	d4
    3f24:	4844           	swap d4
	lsr.l	d5, d4
    3f26:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    3f28:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    3f2c:	4284           	clr.l d4

	add.b   (a6), d5
    3f2e:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    3f30:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    3f34:	6500 0006      	bcs.w 3f3c <noadditionalchar>
	addq.w  #1, a3
    3f38:	524b           	addq.w #1,a3
	sub.w   #8,d5
    3f3a:	5145           	subq.w #8,d5

00003f3c <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    3f3c:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    3f3e:	51c8 ff68      	dbf d0,3ea8 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    3f42:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    3f46:	51cb ff5c      	dbf d3,3ea4 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    3f4a:	4cfa 7fff fdf2 	movem.l 3d40 <saveregs>(pc),d0-a6

	RTS
    3f50:	4e75           	rts
