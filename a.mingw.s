
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
      12:	23ce 0000 5716 	move.l a6,5716 <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,56ee <hw>
      1e:	0000 56ee 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 2e3b 	lea 2e3b <incbin_swfont_end+0xbd>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 56ea 	move.l d0,56ea <GfxBase>
	if (!GfxBase)
      34:	6700 14d4      	beq.w 150a <main+0x1504>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
      3e:	43f9 0000 2e4c 	lea 2e4c <incbin_swfont_end+0xce>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 5706 	move.l d0,5706 <DOSBase>
	if (!DOSBase)
      50:	6700 14ac      	beq.w 14fe <main+0x14f8>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 2e58 	pea 2e58 <incbin_swfont_end+0xda>
      5a:	4eb9 0000 178c 	jsr 178c <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 2e74 	move.l #11892,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      7e:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
      84:	4eae ffc4      	jsr -60(a6)
      88:	2079 0000 56ee 	movea.l 56ee <hw>,a0
      8e:	2628 0080      	move.l 128(a0),d3
      92:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
      98:	2200           	move.l d0,d1
      9a:	243c 0000 2e84 	move.l #11908,d2
      a0:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      a4:	45f9 0000 19e8 	lea 19e8 <ClBuild>,a2
      aa:	4e92           	jsr (a2)
      ac:	2840           	movea.l d0,a4
      ae:	23c0 0000 5712 	move.l d0,5712 <Copperlist1>
  DrawCopper = Copperlist1;
      b4:	23c0 0000 56fe 	move.l d0,56fe <DrawCopper>
  Copperlist2 = ClBuild();
      ba:	4e92           	jsr (a2)
      bc:	23c0 0000 570e 	move.l d0,570e <Copperlist2>
  ViewCopper = Copperlist2;
      c2:	23c0 0000 56f2 	move.l d0,56f2 <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      c8:	588f           	addq.l #4,sp
      ca:	2014           	move.l (a4),d0
      cc:	b0b9 0000 5654 	cmp.l 5654 <ClsSprites>,d0
      d2:	6600 130c      	bne.w 13e0 <main+0x13da>
      d6:	206c 0004      	movea.l 4(a4),a0
      da:	b1f9 0000 5658 	cmpa.l 5658 <ClsSprites+0x4>,a0
      e0:	6600 12fe      	bne.w 13e0 <main+0x13da>
      e4:	202c 0008      	move.l 8(a4),d0
      e8:	b0b9 0000 565c 	cmp.l 565c <ClsSprites+0x8>,d0
      ee:	6600 12f0      	bne.w 13e0 <main+0x13da>
      f2:	206c 000c      	movea.l 12(a4),a0
      f6:	b1f9 0000 5660 	cmpa.l 5660 <ClsSprites+0xc>,a0
      fc:	6600 12e2      	bne.w 13e0 <main+0x13da>
     100:	202c 0010      	move.l 16(a4),d0
     104:	b0b9 0000 5664 	cmp.l 5664 <ClsSprites+0x10>,d0
     10a:	6600 12d4      	bne.w 13e0 <main+0x13da>
     10e:	206c 0014      	movea.l 20(a4),a0
     112:	b1f9 0000 5668 	cmpa.l 5668 <ClsSprites+0x14>,a0
     118:	6600 12c6      	bne.w 13e0 <main+0x13da>
     11c:	202c 0018      	move.l 24(a4),d0
     120:	b0b9 0000 566c 	cmp.l 566c <ClsSprites+0x18>,d0
     126:	6600 12b8      	bne.w 13e0 <main+0x13da>
     12a:	206c 001c      	movea.l 28(a4),a0
     12e:	b1f9 0000 5670 	cmpa.l 5670 <ClsSprites+0x1c>,a0
     134:	6600 12aa      	bne.w 13e0 <main+0x13da>
     138:	202c 0020      	move.l 32(a4),d0
     13c:	b0b9 0000 5674 	cmp.l 5674 <ClsSprites+0x20>,d0
     142:	6600 129c      	bne.w 13e0 <main+0x13da>
     146:	206c 0024      	movea.l 36(a4),a0
     14a:	b1f9 0000 5678 	cmpa.l 5678 <ClsSprites+0x24>,a0
     150:	6600 128e      	bne.w 13e0 <main+0x13da>
     154:	202c 0028      	move.l 40(a4),d0
     158:	b0b9 0000 567c 	cmp.l 567c <ClsSprites+0x28>,d0
     15e:	6600 1280      	bne.w 13e0 <main+0x13da>
     162:	206c 002c      	movea.l 44(a4),a0
     166:	b1f9 0000 5680 	cmpa.l 5680 <ClsSprites+0x2c>,a0
     16c:	6600 1272      	bne.w 13e0 <main+0x13da>
     170:	202c 0030      	move.l 48(a4),d0
     174:	b0b9 0000 5684 	cmp.l 5684 <ClsSprites+0x30>,d0
     17a:	6600 1264      	bne.w 13e0 <main+0x13da>
     17e:	206c 0034      	movea.l 52(a4),a0
     182:	b1f9 0000 5688 	cmpa.l 5688 <ClsSprites+0x34>,a0
     188:	6600 1256      	bne.w 13e0 <main+0x13da>
     18c:	202c 0038      	move.l 56(a4),d0
     190:	b0b9 0000 568c 	cmp.l 568c <ClsSprites+0x38>,d0
     196:	6600 1248      	bne.w 13e0 <main+0x13da>
     19a:	286c 003c      	movea.l 60(a4),a4
     19e:	b9f9 0000 5690 	cmpa.l 5690 <ClsSprites+0x3c>,a4
     1a4:	6600 123a      	bne.w 13e0 <main+0x13da>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1a8:	2079 0000 5712 	movea.l 5712 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ae:	2039 0000 5624 	move.l 5624 <ClScreen>,d0
     1b4:	b0a8 0040      	cmp.l 64(a0),d0
     1b8:	6600 1292      	bne.w 144c <main+0x1446>
     1bc:	2028 0044      	move.l 68(a0),d0
     1c0:	b0b9 0000 5628 	cmp.l 5628 <ClScreen+0x4>,d0
     1c6:	6600 1284      	bne.w 144c <main+0x1446>
     1ca:	2028 0048      	move.l 72(a0),d0
     1ce:	b0b9 0000 562c 	cmp.l 562c <ClScreen+0x8>,d0
     1d4:	6600 1276      	bne.w 144c <main+0x1446>
     1d8:	2028 004c      	move.l 76(a0),d0
     1dc:	b0b9 0000 5630 	cmp.l 5630 <ClScreen+0xc>,d0
     1e2:	6600 1268      	bne.w 144c <main+0x1446>
     1e6:	2028 0050      	move.l 80(a0),d0
     1ea:	b0b9 0000 5634 	cmp.l 5634 <ClScreen+0x10>,d0
     1f0:	6600 125a      	bne.w 144c <main+0x1446>
     1f4:	2028 0054      	move.l 84(a0),d0
     1f8:	b0b9 0000 5638 	cmp.l 5638 <ClScreen+0x14>,d0
     1fe:	6600 124c      	bne.w 144c <main+0x1446>
     202:	2039 0000 563c 	move.l 563c <ClScreen+0x18>,d0
     208:	b0a8 0058      	cmp.l 88(a0),d0
     20c:	6600 123e      	bne.w 144c <main+0x1446>
     210:	2039 0000 5640 	move.l 5640 <ClScreen+0x1c>,d0
     216:	b0a8 005c      	cmp.l 92(a0),d0
     21a:	6600 1230      	bne.w 144c <main+0x1446>
     21e:	2039 0000 5644 	move.l 5644 <ClScreen+0x20>,d0
     224:	b0a8 0060      	cmp.l 96(a0),d0
     228:	6600 1222      	bne.w 144c <main+0x1446>
     22c:	2028 0064      	move.l 100(a0),d0
     230:	b0b9 0000 5648 	cmp.l 5648 <ClScreen+0x24>,d0
     236:	6600 1214      	bne.w 144c <main+0x1446>
     23a:	2028 0068      	move.l 104(a0),d0
     23e:	b0b9 0000 564c 	cmp.l 564c <ClScreen+0x28>,d0
     244:	6600 1206      	bne.w 144c <main+0x1446>
     248:	2068 006c      	movea.l 108(a0),a0
     24c:	b1f9 0000 5650 	cmpa.l 5650 <ClScreen+0x2c>,a0
     252:	6600 11f8      	bne.w 144c <main+0x1446>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     256:	23fc 0004 0000 	move.l #262144,5702 <DrawBuffer>
     25c:	0000 5702 
  ViewBuffer = (ULONG *)0x50000;
     260:	23fc 0005 0000 	move.l #327680,56f6 <ViewBuffer>
     266:	0000 56f6 
  SetBplPointers();
     26a:	49f9 0000 2118 	lea 2118 <SetBplPointers>,a4
     270:	4e94           	jsr (a4)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     272:	0cb9 0005 0000 	cmpi.l #327680,5702 <DrawBuffer>
     278:	0000 5702 
     27c:	6700 1250      	beq.w 14ce <main+0x14c8>
    Write( Output(), 
     280:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     286:	4eae ffc4      	jsr -60(a6)
     28a:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     290:	2200           	move.l d0,d1
     292:	243c 0000 2e87 	move.l #11911,d2
     298:	763b           	moveq #59,d3
     29a:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     29e:	2079 0000 5712 	movea.l 5712 <Copperlist1>,a0
     2a4:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2aa:	0070 
     2ac:	6724           	beq.s 2d2 <main+0x2cc>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ae:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     2b4:	4eae ffc4      	jsr -60(a6)
     2b8:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     2be:	2200           	move.l d0,d1
     2c0:	243c 0000 2ec3 	move.l #11971,d2
     2c6:	763c           	moveq #60,d3
     2c8:	4eae ffd0      	jsr -48(a6)
     2cc:	2079 0000 5712 	movea.l 5712 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2d2:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2d8:	0074 
     2da:	6724           	beq.s 300 <main+0x2fa>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2dc:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     2e2:	4eae ffc4      	jsr -60(a6)
     2e6:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     2ec:	2200           	move.l d0,d1
     2ee:	243c 0000 2f00 	move.l #12032,d2
     2f4:	763c           	moveq #60,d3
     2f6:	4eae ffd0      	jsr -48(a6)
     2fa:	2079 0000 5712 	movea.l 5712 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     300:	2028 0078      	move.l 120(a0),d0
     304:	b0b9 0000 561c 	cmp.l 561c <ClColor>,d0
     30a:	6600 1118      	bne.w 1424 <main+0x141e>
     30e:	2028 007c      	move.l 124(a0),d0
     312:	b0b9 0000 5620 	cmp.l 5620 <ClColor+0x4>,d0
     318:	6600 110a      	bne.w 1424 <main+0x141e>
  if( instructions[pos] == value ) 
     31c:	70fe           	moveq #-2,d0
     31e:	b0a8 0080      	cmp.l 128(a0),d0
     322:	671e           	beq.s 342 <main+0x33c>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     324:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     32a:	4eae ffc4      	jsr -60(a6)
     32e:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     334:	2200           	move.l d0,d1
     336:	243c 0000 2f5f 	move.l #12127,d2
     33c:	7622           	moveq #34,d3
     33e:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     342:	45f9 0000 1f10 	lea 1f10 <SwapCl>,a2
     348:	4e92           	jsr (a2)
  if( DrawCopper != Copperlist2)
     34a:	2079 0000 56fe 	movea.l 56fe <DrawCopper>,a0
     350:	b1f9 0000 570e 	cmpa.l 570e <Copperlist2>,a0
     356:	671e           	beq.s 376 <main+0x370>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     358:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     35e:	4eae ffc4      	jsr -60(a6)
     362:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     368:	2200           	move.l d0,d1
     36a:	243c 0000 2f82 	move.l #12162,d2
     370:	7615           	moveq #21,d3
     372:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     376:	4eb9 0000 2144 	jsr 2144 <PrepareDisplay>
  if( DrawBuffer != Bitplane1) 
     37c:	2039 0000 5702 	move.l 5702 <DrawBuffer>,d0
     382:	b0b9 0000 570a 	cmp.l 570a <Bitplane1>,d0
     388:	671e           	beq.s 3a8 <main+0x3a2>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     38a:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     390:	4eae ffc4      	jsr -60(a6)
     394:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     39a:	2200           	move.l d0,d1
     39c:	243c 0000 2f98 	move.l #12184,d2
     3a2:	7637           	moveq #55,d3
     3a4:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3a8:	2079 0000 56fe 	movea.l 56fe <DrawCopper>,a0
     3ae:	b1f9 0000 5712 	cmpa.l 5712 <Copperlist1>,a0
     3b4:	671e           	beq.s 3d4 <main+0x3ce>
    Write( Output(), 
     3b6:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     3bc:	4eae ffc4      	jsr -60(a6)
     3c0:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     3c6:	2200           	move.l d0,d1
     3c8:	243c 0000 2fd0 	move.l #12240,d2
     3ce:	7639           	moveq #57,d3
     3d0:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3d4:	4eb9 0000 2144 	jsr 2144 <PrepareDisplay>

  if( ViewBuffer != Bitplane2) 
     3da:	2039 0000 56f6 	move.l 56f6 <ViewBuffer>,d0
     3e0:	b0b9 0000 56fa 	cmp.l 56fa <Bitplane2>,d0
     3e6:	671e           	beq.s 406 <main+0x400>
    Write( Output(), 
     3e8:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     3ee:	4eae ffc4      	jsr -60(a6)
     3f2:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     3f8:	2200           	move.l d0,d1
     3fa:	243c 0000 300a 	move.l #12298,d2
     400:	7638           	moveq #56,d3
     402:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     406:	2079 0000 56f2 	movea.l 56f2 <ViewCopper>,a0
     40c:	b1f9 0000 570e 	cmpa.l 570e <Copperlist2>,a0
     412:	671e           	beq.s 432 <main+0x42c>
    Write( Output(), 
     414:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     41a:	4eae ffc4      	jsr -60(a6)
     41e:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     424:	2200           	move.l d0,d1
     426:	243c 0000 3043 	move.l #12355,d2
     42c:	763a           	moveq #58,d3
     42e:	4eae ffd0      	jsr -48(a6)
	}
	SetInterruptHandler((APTR)interruptHandler);
}

void RunFrame() {
  SwapCl();
     432:	4e92           	jsr (a2)
  SetBplPointers();
     434:	4e94           	jsr (a4)
             "PrepareDisplay: ViewCopper should be set to Copperlist 2.\n", 58);

  RunFrame();
  UWORD *copword = ViewCopper;
     436:	2079 0000 56f2 	movea.l 56f2 <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     43c:	7000           	moveq #0,d0
     43e:	3028 0072      	move.w 114(a0),d0
     442:	4840           	swap d0
     444:	4240           	clr.w d0
     446:	7200           	moveq #0,d1
     448:	3228 0076      	move.w 118(a0),d1
     44c:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     44e:	b0b9 0000 56fa 	cmp.l 56fa <Bitplane2>,d0
     454:	671e           	beq.s 474 <main+0x46e>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     456:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     45c:	4eae ffc4      	jsr -60(a6)
     460:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     466:	2200           	move.l d0,d1
     468:	243c 0000 307e 	move.l #12414,d2
     46e:	7648           	moveq #72,d3
     470:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     474:	4e92           	jsr (a2)
  SetBplPointers();
     476:	4e94           	jsr (a4)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     478:	2079 0000 56f2 	movea.l 56f2 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     47e:	7000           	moveq #0,d0
     480:	3028 0072      	move.w 114(a0),d0
     484:	4840           	swap d0
     486:	4240           	clr.w d0
     488:	7200           	moveq #0,d1
     48a:	3228 0076      	move.w 118(a0),d1
     48e:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     490:	b0b9 0000 570a 	cmp.l 570a <Bitplane1>,d0
     496:	671e           	beq.s 4b6 <main+0x4b0>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     498:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     49e:	4eae ffc4      	jsr -60(a6)
     4a2:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     4a8:	2200           	move.l d0,d1
     4aa:	243c 0000 30c7 	move.l #12487,d2
     4b0:	7649           	moveq #73,d3
     4b2:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4b6:	4e92           	jsr (a2)
  SetBplPointers();
     4b8:	4e94           	jsr (a4)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     4ba:	2079 0000 56f2 	movea.l 56f2 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4c0:	7000           	moveq #0,d0
     4c2:	3028 0072      	move.w 114(a0),d0
     4c6:	4840           	swap d0
     4c8:	4240           	clr.w d0
     4ca:	7200           	moveq #0,d1
     4cc:	3228 0076      	move.w 118(a0),d1
     4d0:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4d2:	b0b9 0000 56fa 	cmp.l 56fa <Bitplane2>,d0
     4d8:	671e           	beq.s 4f8 <main+0x4f2>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4da:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     4e0:	4eae ffc4      	jsr -60(a6)
     4e4:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     4ea:	2200           	move.l d0,d1
     4ec:	243c 0000 3111 	move.l #12561,d2
     4f2:	7648           	moveq #72,d3
     4f4:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     4f8:	2f3c 0000 c800 	move.l #51200,-(sp)
     4fe:	4878 0084      	pea 84 <main+0x7e>
     502:	4eb9 0000 2282 	jsr 2282 <FreeDisplay>
  TestZoom4Picture();
}

void ZoomTestDisplay() {

  PrepareDisplayZoom();
     508:	45f9 0000 1f36 	lea 1f36 <PrepareDisplayZoom>,a2
     50e:	4e92           	jsr (a2)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     510:	4878 0010      	pea 10 <main+0xa>
     514:	4879 0000 5654 	pea 5654 <ClsSprites>
     51a:	42a7           	clr.l -(sp)
     51c:	2f39 0000 5712 	move.l 5712 <Copperlist1>,-(sp)
     522:	4eb9 0000 1812 	jsr 1812 <TestCopperlistBatch>
     528:	4fef 0018      	lea 24(sp),sp
     52c:	4a80           	tst.l d0
     52e:	661e           	bne.s 54e <main+0x548>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     530:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     536:	4eae ffc4      	jsr -60(a6)
     53a:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     540:	2200           	move.l d0,d1
     542:	243c 0000 315a 	move.l #12634,d2
     548:	762c           	moveq #44,d3
     54a:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
     54e:	4878 000c      	pea c <main+0x6>
     552:	4879 0000 55ec 	pea 55ec <ClScreenZoom>
     558:	4878 0010      	pea 10 <main+0xa>
     55c:	2f39 0000 5712 	move.l 5712 <Copperlist1>,-(sp)
     562:	4eb9 0000 1812 	jsr 1812 <TestCopperlistBatch>
     568:	4fef 0010      	lea 16(sp),sp
     56c:	4a80           	tst.l d0
     56e:	661e           	bne.s 58e <main+0x588>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     570:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     576:	4eae ffc4      	jsr -60(a6)
     57a:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     580:	2200           	move.l d0,d1
     582:	243c 0000 3190 	move.l #12688,d2
     588:	7636           	moveq #54,d3
     58a:	4eae ffd0      	jsr -48(a6)
  }
}

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
  UWORD *copword = (UWORD *) DrawCopper;
     58e:	2079 0000 56fe 	movea.l 56fe <DrawCopper>,a0
  copword += ZMBPLPTRS+1;
  for(int i=1;i<=2;i++) {
    UWORD highword = ptr >> 16;
    UWORD lowword = ptr & 0xffff;
    *copword = highword;
     594:	317c 0004 0072 	move.w #4,114(a0)
    copword += 2;
    *copword = lowword;
     59a:	4268 0076      	clr.w 118(a0)
    *copword = highword;
     59e:	317c 0004 007a 	move.w #4,122(a0)
    *copword = lowword;
     5a4:	317c 2800 007e 	move.w #10240,126(a0)
    copword += 2;
    ptr += 40*256;
  }
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
     5aa:	23fc 0005 0000 	move.l #327680,5702 <DrawBuffer>
     5b0:	0000 5702 
  ViewBuffer = (ULONG *) tmp;
     5b4:	23fc 0004 0000 	move.l #262144,56f6 <ViewBuffer>
     5ba:	0000 56f6 
  Zoom_SetBplPointers();
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
     5be:	2f3c 00e0 0004 	move.l #14680068,-(sp)
     5c4:	4878 001c      	pea 1c <main+0x16>
     5c8:	2f39 0000 5712 	move.l 5712 <Copperlist1>,-(sp)
     5ce:	4eb9 0000 17f4 	jsr 17f4 <TestCopperlistPos>
     5d4:	4fef 000c      	lea 12(sp),sp
     5d8:	4a80           	tst.l d0
     5da:	661e           	bne.s 5fa <main+0x5f4>
    Write(Output(), 
     5dc:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     5e2:	4eae ffc4      	jsr -60(a6)
     5e6:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     5ec:	2200           	move.l d0,d1
     5ee:	243c 0000 2ec3 	move.l #11971,d2
     5f4:	763c           	moveq #60,d3
     5f6:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
     5fa:	2f3c 00e2 0000 	move.l #14811136,-(sp)
     600:	4878 001d      	pea 1d <main+0x17>
     604:	2f39 0000 5712 	move.l 5712 <Copperlist1>,-(sp)
     60a:	4eb9 0000 17f4 	jsr 17f4 <TestCopperlistPos>
     610:	4fef 000c      	lea 12(sp),sp
     614:	4a80           	tst.l d0
     616:	661e           	bne.s 636 <main+0x630>
    Write(Output(), 
     618:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     61e:	4eae ffc4      	jsr -60(a6)
     622:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     628:	2200           	move.l d0,d1
     62a:	243c 0000 2f00 	move.l #12032,d2
     630:	763c           	moveq #60,d3
     632:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
     636:	2f3c 00e4 0004 	move.l #14942212,-(sp)
     63c:	4878 001e      	pea 1e <main+0x18>
     640:	2f39 0000 5712 	move.l 5712 <Copperlist1>,-(sp)
     646:	4eb9 0000 17f4 	jsr 17f4 <TestCopperlistPos>
     64c:	4fef 000c      	lea 12(sp),sp
     650:	4a80           	tst.l d0
     652:	661e           	bne.s 672 <main+0x66c>
    Write(Output(), 
     654:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     65a:	4eae ffc4      	jsr -60(a6)
     65e:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     664:	2200           	move.l d0,d1
     666:	243c 0000 31c7 	move.l #12743,d2
     66c:	763c           	moveq #60,d3
     66e:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
     672:	2f3c 00e6 2800 	move.l #15083520,-(sp)
     678:	4878 001f      	pea 1f <main+0x19>
     67c:	2f39 0000 5712 	move.l 5712 <Copperlist1>,-(sp)
     682:	4eb9 0000 17f4 	jsr 17f4 <TestCopperlistPos>
     688:	4fef 000c      	lea 12(sp),sp
     68c:	4a80           	tst.l d0
     68e:	661e           	bne.s 6ae <main+0x6a8>
    Write(Output(), 
     690:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     696:	4eae ffc4      	jsr -60(a6)
     69a:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     6a0:	2200           	move.l d0,d1
     6a2:	243c 0000 3204 	move.l #12804,d2
     6a8:	763c           	moveq #60,d3
     6aa:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl2pl should be 2800\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
     6ae:	4878 0002      	pea 2 <_start+0x2>
     6b2:	4879 0000 561c 	pea 561c <ClColor>
     6b8:	4878 0020      	pea 20 <main+0x1a>
     6bc:	2f39 0000 5712 	move.l 5712 <Copperlist1>,-(sp)
     6c2:	4eb9 0000 1812 	jsr 1812 <TestCopperlistBatch>
     6c8:	4fef 0010      	lea 16(sp),sp
     6cc:	4a80           	tst.l d0
     6ce:	661e           	bne.s 6ee <main+0x6e8>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     6d0:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     6d6:	4eae ffc4      	jsr -60(a6)
     6da:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     6e0:	2200           	move.l d0,d1
     6e2:	243c 0000 2f3d 	move.l #12093,d2
     6e8:	7621           	moveq #33,d3
     6ea:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     6ee:	7e9c           	moveq #-100,d7
     6f0:	de8d           	add.l a5,d7
     6f2:	4878 0040      	pea 40 <main+0x3a>
     6f6:	4879 0000 357e 	pea 357e <incbin_swfont_end+0x800>
     6fc:	2f07           	move.l d7,-(sp)
     6fe:	4eb9 0000 233a 	jsr 233a <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
     704:	4878 0010      	pea 10 <main+0xa>
     708:	2f07           	move.l d7,-(sp)
     70a:	4878 0022      	pea 22 <main+0x1c>
     70e:	2f39 0000 5712 	move.l 5712 <Copperlist1>,-(sp)
     714:	4eb9 0000 1812 	jsr 1812 <TestCopperlistBatch>
     71a:	4fef 001c      	lea 28(sp),sp
     71e:	4a80           	tst.l d0
     720:	661e           	bne.s 740 <main+0x73a>
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);
     722:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     728:	4eae ffc4      	jsr -60(a6)
     72c:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     732:	2200           	move.l d0,d1
     734:	243c 0000 3241 	move.l #12865,d2
     73a:	7621           	moveq #33,d3
     73c:	4eae ffd0      	jsr -48(a6)

  ULONG clpart2[] = { 0x2d07fffe, 0x018200f0, 0x01820f00 };
     740:	2b7c 2d07 fffe 	move.l #755499006,-112(a5)
     746:	ff90 
     748:	2b7c 0182 00f0 	move.l #25297136,-108(a5)
     74e:	ff94 
     750:	2b7c 0182 0f00 	move.l #25300736,-104(a5)
     756:	ff98 

  if( TestCopperlistBatch( Copperlist1, 75, clpart2, 3) == 0)
     758:	4878 0003      	pea 3 <_start+0x3>
     75c:	486d ff90      	pea -112(a5)
     760:	4878 004b      	pea 4b <main+0x45>
     764:	2f39 0000 5712 	move.l 5712 <Copperlist1>,-(sp)
     76a:	4eb9 0000 1812 	jsr 1812 <TestCopperlistBatch>
     770:	4fef 0010      	lea 16(sp),sp
     774:	4a80           	tst.l d0
     776:	661e           	bne.s 796 <main+0x790>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     778:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     77e:	4eae ffc4      	jsr -60(a6)
     782:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     788:	2200           	move.l d0,d1
     78a:	243c 0000 3263 	move.l #12899,d2
     790:	762c           	moveq #44,d3
     792:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
     796:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdd22c>
     79a:	4878 2922      	pea 2922 <incbin_swfont_start+0x154>
     79e:	2f39 0000 5712 	move.l 5712 <Copperlist1>,-(sp)
     7a4:	4eb9 0000 17f4 	jsr 17f4 <TestCopperlistPos>
     7aa:	4fef 000c      	lea 12(sp),sp
     7ae:	4a80           	tst.l d0
     7b0:	661e           	bne.s 7d0 <main+0x7ca>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     7b2:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     7b8:	4eae ffc4      	jsr -60(a6)
     7bc:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     7c2:	2200           	move.l d0,d1
     7c4:	243c 0000 2f5f 	move.l #12127,d2
     7ca:	7622           	moveq #34,d3
     7cc:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     7d0:	2f3c 0001 4a00 	move.l #84480,-(sp)
     7d6:	2f3c 0000 a48c 	move.l #42124,-(sp)
     7dc:	4eb9 0000 2282 	jsr 2282 <FreeDisplay>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     7e2:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
     7e8:	7004           	moveq #4,d0
     7ea:	7202           	moveq #2,d1
     7ec:	4eae ff3a      	jsr -198(a6)

}

void TestBlitleftOfZoom() {
  Zoom_Init();
  PrepareDisplayZoom();
     7f0:	4e92           	jsr (a2)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     7f2:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
     7f8:	203c 0000 c800 	move.l #51200,d0
     7fe:	7202           	moveq #2,d1
     800:	4eae ff3a      	jsr -198(a6)
     804:	2840           	movea.l d0,a4
     806:	23c0 0000 56d4 	move.l d0,56d4 <Zoom_Source>
  if( Zoom_Source == 0) {
     80c:	508f           	addq.l #8,sp
     80e:	6700 0da4      	beq.w 15b4 <main+0x15ae>
    return;
  }

  
  UWORD *tstsource = Zoom_Source;
  *tstsource++ = 0x0000;
     812:	2640           	movea.l d0,a3
     814:	425b           	clr.w (a3)+
  *tstsource = 0x0080;
     816:	397c 0080 0002 	move.w #128,2(a4)
  tstsource += ZMLINESIZE/2-1;
  *tstsource = 0x1000;
     81c:	397c 1000 002c 	move.w #4096,44(a4)
  tstsource++;
  *tstsource = 0x8e88;
     822:	397c 8e88 002e 	move.w #-29048,46(a4)
  tstsource += ZMLINESIZE/2-1;

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
  *tstsource++ = 0x0000;
     828:	426c 15d4      	clr.w 5588(a4)
  *tstsource = 0x00ff;
     82c:	397c 00ff 15d6 	move.w #255,5590(a4)

  Zoom_ZoomBlitLeft( Zoom_Source+1, (UWORD *)DrawBuffer, 8, 128);
     832:	2439 0000 5702 	move.l 5702 <DrawBuffer>,d2
  WaitBlit();
     838:	2c79 0000 56ea 	movea.l 56ea <GfxBase>,a6
     83e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     842:	2079 0000 56ee 	movea.l 56ee <hw>,a0
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
     878:	214b 0050      	move.l a3,80(a0)
  hw->bltbpt = srcb;
     87c:	214c 004c      	move.l a4,76(a0)
  hw->bltdpt = destination;
     880:	2142 0054      	move.l d2,84(a0)
  hw->bltsize = height*64+2;
     884:	317c 2002 0058 	move.w #8194,88(a0)
  WaitBlit();
     88a:	2c79 0000 56ea 	movea.l 56ea <GfxBase>,a6
     890:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
     894:	2679 0000 5702 	movea.l 5702 <DrawBuffer>,a3
  if( *destination != 0x0180) {
     89a:	0c6b 0180 0002 	cmpi.w #384,2(a3)
     8a0:	671e           	beq.s 8c0 <main+0x8ba>
    Write(  Output(), "Zoomblitleft - First row wrong.\n",32);
     8a2:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     8a8:	4eae ffc4      	jsr -60(a6)
     8ac:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     8b2:	2200           	move.l d0,d1
     8b4:	243c 0000 32c8 	move.l #13000,d2
     8ba:	7620           	moveq #32,d3
     8bc:	4eae ffd0      	jsr -48(a6)
  }
  destination += ZMLINESIZE/2;
  if( *destination != 0x1d88)
     8c0:	0c6b 1d88 002e 	cmpi.w #7560,46(a3)
     8c6:	671e           	beq.s 8e6 <main+0x8e0>
    Write(  Output(), "Zoomblitleft: Second row wrong.\n",32);
     8c8:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     8ce:	4eae ffc4      	jsr -60(a6)
     8d2:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     8d8:	2200           	move.l d0,d1
     8da:	243c 0000 32e9 	move.l #13033,d2
     8e0:	7620           	moveq #32,d3
     8e2:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
  destination++;
  if( *destination != 0x01ff) {
     8e6:	2079 0000 5702 	movea.l 5702 <DrawBuffer>,a0
     8ec:	0c68 01ff 15d6 	cmpi.w #511,5590(a0)
     8f2:	671e           	beq.s 912 <main+0x90c>
    Write(  Output(), "Zoomblitleft: Last row wrong.\n",40);
     8f4:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     8fa:	4eae ffc4      	jsr -60(a6)
     8fe:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     904:	2200           	move.l d0,d1
     906:	243c 0000 330a 	move.l #13066,d2
     90c:	7628           	moveq #40,d3
     90e:	4eae ffd0      	jsr -48(a6)
  }
  FreeMem( Zoom_Source, 40*256*5);
     912:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
     918:	2279 0000 56d4 	movea.l 56d4 <Zoom_Source>,a1
     91e:	203c 0000 c800 	move.l #51200,d0
     924:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     928:	2f3c 0001 4a00 	move.l #84480,-(sp)
     92e:	2f3c 0000 a48c 	move.l #42124,-(sp)
     934:	4eb9 0000 2282 	jsr 2282 <FreeDisplay>
     93a:	508f           	addq.l #8,sp
}

void TestCopyColumnOfZoom() {

  PrepareDisplayZoom();
     93c:	4e92           	jsr (a2)

  UWORD *destination = (UWORD *)DrawBuffer;
     93e:	2079 0000 5702 	movea.l 5702 <DrawBuffer>,a0
  *destination= 0x0000;
     944:	4250           	clr.w (a0)
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
     946:	317c 000f 002c 	move.w #15,44(a0)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     94c:	317c 000f 41d4 	move.w #15,16852(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     952:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
     958:	203c 0000 c800 	move.l #51200,d0
     95e:	7202           	moveq #2,d1
     960:	4eae ff3a      	jsr -198(a6)
     964:	2840           	movea.l d0,a4
     966:	23c0 0000 56d4 	move.l d0,56d4 <Zoom_Source>
  if( Zoom_Source == 0) {
     96c:	6700 0c98      	beq.w 1606 <main+0x1600>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }

  UWORD *tstsource = Zoom_Source;
  *tstsource = 0xffff;
     970:	38bc ffff      	move.w #-1,(a4)
  tstsource += ZMLINESIZE/2;
  *tstsource = 0xffff;
     974:	397c ffff 002c 	move.w #-1,44(a4)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0xc000;
     97a:	397c c000 41d4 	move.w #-16384,16852(a4)
  Zoom_CopyColumn( Zoom_Source, (UWORD *)DrawBuffer, 1, 1);
     980:	2439 0000 5702 	move.l 5702 <DrawBuffer>,d2
  WaitBlit();
     986:	2c79 0000 56ea 	movea.l 56ea <GfxBase>,a6
     98c:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     990:	2079 0000 56ee 	movea.l 56ee <hw>,a0
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
     9c6:	214c 0050      	move.l a4,80(a0)
  hw->bltbpt = (UWORD *) destpos;
     9ca:	2142 004c      	move.l d2,76(a0)
  hw->bltdpt = (UWORD *) destpos;
     9ce:	2142 0054      	move.l d2,84(a0)
  hw->bltsize = ZMCOLHEIGHT*64+1;
     9d2:	317c 6001 0058 	move.w #24577,88(a0)
  
  WaitBlit();
     9d8:	2c79 0000 56ea 	movea.l 56ea <GfxBase>,a6
     9de:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     9e2:	2479 0000 5702 	movea.l 5702 <DrawBuffer>,a2
  if( *destination != 0x4000)
     9e8:	0c52 4000      	cmpi.w #16384,(a2)
     9ec:	671e           	beq.s a0c <main+0xa06>
    Write(  Output(), "Zoomtest: CopyColumn2 - First row wrong.\n",41);
     9ee:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     9f4:	4eae ffc4      	jsr -60(a6)
     9f8:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     9fe:	2200           	move.l d0,d1
     a00:	243c 0000 3329 	move.l #13097,d2
     a06:	7629           	moveq #41,d3
     a08:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x400f)
     a0c:	0c6a 400f 002c 	cmpi.w #16399,44(a2)
     a12:	671e           	beq.s a32 <main+0xa2c>
    Write(  Output(), "Zoomtest: CopyColumn2 - Second row wrong.\n",42);
     a14:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     a1a:	4eae ffc4      	jsr -60(a6)
     a1e:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     a24:	2200           	move.l d0,d1
     a26:	243c 0000 3353 	move.l #13139,d2
     a2c:	762a           	moveq #42,d3
     a2e:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x400f)
     a32:	2479 0000 5702 	movea.l 5702 <DrawBuffer>,a2
     a38:	0c6a 400f 41d4 	cmpi.w #16399,16852(a2)
     a3e:	6724           	beq.s a64 <main+0xa5e>
    Write(  Output(), "Zoomtest: CopyColumn2 - Last row wrong.\n",40);
     a40:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     a46:	4eae ffc4      	jsr -60(a6)
     a4a:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     a50:	2200           	move.l d0,d1
     a52:	243c 0000 337e 	move.l #13182,d2
     a58:	7628           	moveq #40,d3
     a5a:	4eae ffd0      	jsr -48(a6)
     a5e:	2479 0000 5702 	movea.l 5702 <DrawBuffer>,a2

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
     a72:	2879 0000 56d4 	movea.l 56d4 <Zoom_Source>,a4
  *tstsource = 0xffff;
     a78:	38bc ffff      	move.w #-1,(a4)
  tstsource += ZMLINESIZE/2;
  *tstsource = 0xffff;
     a7c:	397c ffff 002c 	move.w #-1,44(a4)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0x8000;
     a82:	397c 8000 41d4 	move.w #-32768,16852(a4)
  WaitBlit();
     a88:	2c79 0000 56ea 	movea.l 56ea <GfxBase>,a6
     a8e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     a92:	2079 0000 56ee 	movea.l 56ee <hw>,a0
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
     ac8:	214c 0050      	move.l a4,80(a0)
  hw->bltbpt = (UWORD *) destpos;
     acc:	214a 004c      	move.l a2,76(a0)
  hw->bltdpt = (UWORD *) destpos;
     ad0:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = ZMCOLHEIGHT*64+1;
     ad4:	317c 6001 0058 	move.w #24577,88(a0)
  Zoom_CopyColumn( Zoom_Source, (UWORD *)DrawBuffer, 0, 0);
  
  WaitBlit();
     ada:	2c79 0000 56ea 	movea.l 56ea <GfxBase>,a6
     ae0:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     ae4:	2479 0000 5702 	movea.l 5702 <DrawBuffer>,a2
  if( *destination != 0x8000)
     aea:	0c52 8000      	cmpi.w #-32768,(a2)
     aee:	671e           	beq.s b0e <main+0xb08>
    Write(  Output(), "Zoomtest: CopyColumn - First row wrong.\n",40);
     af0:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     af6:	4eae ffc4      	jsr -60(a6)
     afa:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     b00:	2200           	move.l d0,d1
     b02:	243c 0000 33a7 	move.l #13223,d2
     b08:	7628           	moveq #40,d3
     b0a:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x800f)
     b0e:	0c6a 800f 002c 	cmpi.w #-32753,44(a2)
     b14:	671e           	beq.s b34 <main+0xb2e>
    Write(  Output(), "Zoomtest: CopyColumn - Second row wrong.\n",41);
     b16:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     b1c:	4eae ffc4      	jsr -60(a6)
     b20:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     b26:	2200           	move.l d0,d1
     b28:	243c 0000 33d0 	move.l #13264,d2
     b2e:	7629           	moveq #41,d3
     b30:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x800f)
     b34:	2079 0000 5702 	movea.l 5702 <DrawBuffer>,a0
     b3a:	0c68 800f 41d4 	cmpi.w #-32753,16852(a0)
     b40:	671e           	beq.s b60 <main+0xb5a>
    Write(  Output(), "Zoomtest: CopyColumn - Last row wrong.\n",39);
     b42:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     b48:	4eae ffc4      	jsr -60(a6)
     b4c:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     b52:	2200           	move.l d0,d1
     b54:	243c 0000 33fa 	move.l #13306,d2
     b5a:	7627           	moveq #39,d3
     b5c:	4eae ffd0      	jsr -48(a6)

  FreeMem( Zoom_Source, 40*256*5);
     b60:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
     b66:	2279 0000 56d4 	movea.l 56d4 <Zoom_Source>,a1
     b6c:	203c 0000 c800 	move.l #51200,d0
     b72:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     b76:	2f3c 0001 4a00 	move.l #84480,-(sp)
     b7c:	2f3c 0000 a48c 	move.l #42124,-(sp)
     b82:	4eb9 0000 2282 	jsr 2282 <FreeDisplay>
     b88:	508f           	addq.l #8,sp
}

void TestCopyWord() {
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
     b8a:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
     b90:	203c 0000 0528 	move.l #1320,d0
     b96:	7202           	moveq #2,d1
     b98:	4eae ff3a      	jsr -198(a6)
     b9c:	2840           	movea.l d0,a4
  if( source == 0) {
     b9e:	4a80           	tst.l d0
     ba0:	6700 0992      	beq.w 1534 <main+0x152e>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
     ba4:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
     baa:	203c 0000 0528 	move.l #1320,d0
     bb0:	7202           	moveq #2,d1
     bb2:	4eae ff3a      	jsr -198(a6)
     bb6:	2440           	movea.l d0,a2
  if( destination == 0) {
     bb8:	4a80           	tst.l d0
     bba:	6700 0978      	beq.w 1534 <main+0x152e>
    return;
  }
  
  UWORD *tmp = source;
  for( int i=0; i<8;i++) {
    *tmp++ = 0;
     bbe:	4254           	clr.w (a4)
    *tmp++ = 0xaaaa;
     bc0:	397c aaaa 0002 	move.w #-21846,2(a4)
    *tmp++ = 0xaaaa;
     bc6:	397c aaaa 0004 	move.w #-21846,4(a4)
    *tmp = 0;
     bcc:	426c 0006      	clr.w 6(a4)
    tmp += ZMLINESIZE/2-3;
    *tmp++ = 0;
     bd0:	426c 002c      	clr.w 44(a4)
    *tmp++ = 0x5555;
     bd4:	397c 5555 002e 	move.w #21845,46(a4)
    *tmp++ = 0x5555;
     bda:	397c 5555 0030 	move.w #21845,48(a4)
    *tmp = 0;
     be0:	426c 0032      	clr.w 50(a4)
    *tmp++ = 0;
     be4:	426c 0058      	clr.w 88(a4)
    *tmp++ = 0xaaaa;
     be8:	397c aaaa 005a 	move.w #-21846,90(a4)
    *tmp++ = 0xaaaa;
     bee:	397c aaaa 005c 	move.w #-21846,92(a4)
    *tmp = 0;
     bf4:	426c 005e      	clr.w 94(a4)
    *tmp++ = 0;
     bf8:	426c 0084      	clr.w 132(a4)
    *tmp++ = 0x5555;
     bfc:	397c 5555 0086 	move.w #21845,134(a4)
    *tmp++ = 0x5555;
     c02:	397c 5555 0088 	move.w #21845,136(a4)
    *tmp = 0;
     c08:	426c 008a      	clr.w 138(a4)
    *tmp++ = 0;
     c0c:	426c 00b0      	clr.w 176(a4)
    *tmp++ = 0xaaaa;
     c10:	397c aaaa 00b2 	move.w #-21846,178(a4)
    *tmp++ = 0xaaaa;
     c16:	397c aaaa 00b4 	move.w #-21846,180(a4)
    *tmp = 0;
     c1c:	426c 00b6      	clr.w 182(a4)
    *tmp++ = 0;
     c20:	426c 00dc      	clr.w 220(a4)
    *tmp++ = 0x5555;
     c24:	397c 5555 00de 	move.w #21845,222(a4)
    *tmp++ = 0x5555;
     c2a:	397c 5555 00e0 	move.w #21845,224(a4)
    *tmp = 0;
     c30:	426c 00e2      	clr.w 226(a4)
    *tmp++ = 0;
     c34:	426c 0108      	clr.w 264(a4)
    *tmp++ = 0xaaaa;
     c38:	397c aaaa 010a 	move.w #-21846,266(a4)
    *tmp++ = 0xaaaa;
     c3e:	397c aaaa 010c 	move.w #-21846,268(a4)
    *tmp = 0;
     c44:	426c 010e      	clr.w 270(a4)
    *tmp++ = 0;
     c48:	426c 0134      	clr.w 308(a4)
    *tmp++ = 0x5555;
     c4c:	397c 5555 0136 	move.w #21845,310(a4)
    *tmp++ = 0x5555;
     c52:	397c 5555 0138 	move.w #21845,312(a4)
    *tmp = 0;
     c58:	426c 013a      	clr.w 314(a4)
    *tmp++ = 0;
     c5c:	426c 0160      	clr.w 352(a4)
    *tmp++ = 0xaaaa;
     c60:	397c aaaa 0162 	move.w #-21846,354(a4)
    *tmp++ = 0xaaaa;
     c66:	397c aaaa 0164 	move.w #-21846,356(a4)
    *tmp = 0;
     c6c:	426c 0166      	clr.w 358(a4)
    *tmp++ = 0;
     c70:	426c 018c      	clr.w 396(a4)
    *tmp++ = 0x5555;
     c74:	397c 5555 018e 	move.w #21845,398(a4)
    *tmp++ = 0x5555;
     c7a:	397c 5555 0190 	move.w #21845,400(a4)
    *tmp = 0;
     c80:	426c 0192      	clr.w 402(a4)
    *tmp++ = 0;
     c84:	426c 01b8      	clr.w 440(a4)
    *tmp++ = 0xaaaa;
     c88:	397c aaaa 01ba 	move.w #-21846,442(a4)
    *tmp++ = 0xaaaa;
     c8e:	397c aaaa 01bc 	move.w #-21846,444(a4)
    *tmp = 0;
     c94:	426c 01be      	clr.w 446(a4)
    *tmp++ = 0;
     c98:	426c 01e4      	clr.w 484(a4)
    *tmp++ = 0x5555;
     c9c:	397c 5555 01e6 	move.w #21845,486(a4)
    *tmp++ = 0x5555;
     ca2:	397c 5555 01e8 	move.w #21845,488(a4)
    *tmp = 0;
     ca8:	426c 01ea      	clr.w 490(a4)
    *tmp++ = 0;
     cac:	426c 0210      	clr.w 528(a4)
    *tmp++ = 0xaaaa;
     cb0:	397c aaaa 0212 	move.w #-21846,530(a4)
    *tmp++ = 0xaaaa;
     cb6:	397c aaaa 0214 	move.w #-21846,532(a4)
    *tmp = 0;
     cbc:	426c 0216      	clr.w 534(a4)
    *tmp++ = 0;
     cc0:	426c 023c      	clr.w 572(a4)
    *tmp++ = 0x5555;
     cc4:	397c 5555 023e 	move.w #21845,574(a4)
    *tmp++ = 0x5555;
     cca:	397c 5555 0240 	move.w #21845,576(a4)
    *tmp = 0;
     cd0:	426c 0242      	clr.w 578(a4)
    *tmp++ = 0;
     cd4:	426c 0268      	clr.w 616(a4)
    *tmp++ = 0xaaaa;
     cd8:	397c aaaa 026a 	move.w #-21846,618(a4)
    *tmp++ = 0xaaaa;
     cde:	397c aaaa 026c 	move.w #-21846,620(a4)
    *tmp = 0;
     ce4:	426c 026e      	clr.w 622(a4)
    *tmp++ = 0;
     ce8:	426c 0294      	clr.w 660(a4)
    *tmp++ = 0x5555;
     cec:	397c 5555 0296 	move.w #21845,662(a4)
    *tmp++ = 0x5555;
     cf2:	397c 5555 0298 	move.w #21845,664(a4)
    *tmp = 0;
     cf8:	426c 029a      	clr.w 666(a4)
    tmp += ZMLINESIZE/2-3;
     cfc:	4878 0528      	pea 528 <main+0x522>
     d00:	42a7           	clr.l -(sp)
     d02:	2f00           	move.l d0,-(sp)
     d04:	4eb9 0000 23cc 	jsr 23cc <memset>
  WaitBlit();
     d0a:	2c79 0000 56ea 	movea.l 56ea <GfxBase>,a6
     d10:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     d14:	2079 0000 56ee 	movea.l 56ee <hw>,a0
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
     d3e:	200c           	move.l a4,d0
     d40:	5480           	addq.l #2,d0
     d42:	2140 0050      	move.l d0,80(a0)
  hw->bltdpt = (UWORD *) destination;
     d46:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
     d4a:	317c 0402 0058 	move.w #1026,88(a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    *tmp++ = 0;
  }

  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 3, 16);
  WaitBlit();
     d50:	2c79 0000 56ea 	movea.l 56ea <GfxBase>,a6
     d56:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
  if( *tmp != 0x5555) 
     d5a:	4fef 000c      	lea 12(sp),sp
     d5e:	0c6a 5555 0002 	cmpi.w #21845,2(a2)
     d64:	671e           	beq.s d84 <main+0xd7e>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
     d66:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     d6c:	4eae ffc4      	jsr -60(a6)
     d70:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     d76:	2200           	move.l d0,d1
     d78:	243c 0000 3458 	move.l #13400,d2
     d7e:	761f           	moveq #31,d3
     d80:	4eae ffd0      	jsr -48(a6)
  tmp += ZMLINESIZE/2;
  if( *tmp != 0xaaaa)
     d84:	0c6a aaaa 002e 	cmpi.w #-21846,46(a2)
     d8a:	671e           	beq.s daa <main+0xda4>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
     d8c:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     d92:	4eae ffc4      	jsr -60(a6)
     d96:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     d9c:	2200           	move.l d0,d1
     d9e:	243c 0000 3478 	move.l #13432,d2
     da4:	7620           	moveq #32,d3
     da6:	4eae ffd0      	jsr -48(a6)
  
  FreeMem( source,ZMLINESIZE*30);
     daa:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
     db0:	224c           	movea.l a4,a1
     db2:	203c 0000 0528 	move.l #1320,d0
     db8:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
     dbc:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
     dc2:	224a           	movea.l a2,a1
     dc4:	203c 0000 0528 	move.l #1320,d0
     dca:	4eae ff2e      	jsr -210(a6)
5    5    5    2    a    a    a    a    9    5    5    5    5    8    a    a
abcd efgh ijkl 1234 5678 9abc defg hijk l123 4567 89ab cdef ghij kl12 3456 789a
1010 1010 1010 0101 0101 0101 0101 0101 0010 1010 1010 1010 1010 1001 0101 0101
a    a    a    5    5    5    5    5    2    a    a    a    a    9    5    5*/ 
void TestZoom4Picture() {
  UWORD *source =AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     dce:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
     dd4:	203c 0000 3300 	move.l #13056,d0
     dda:	7202           	moveq #2,d1
     ddc:	4eae ff3a      	jsr -198(a6)
     de0:	2400           	move.l d0,d2
  if( source == 0) {
     de2:	6700 0786      	beq.w 156a <main+0x1564>
    Write(  Output(), 
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     de6:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
     dec:	203c 0000 3300 	move.l #13056,d0
     df2:	7202           	moveq #2,d1
     df4:	4eae ff3a      	jsr -198(a6)
     df8:	2840           	movea.l d0,a4
  if( destination == 0) {
     dfa:	4a80           	tst.l d0
     dfc:	6700 0854      	beq.w 1652 <main+0x164c>
     e00:	2002           	move.l d2,d0
     e02:	0680 0000 2ec0 	addi.l #11968,d0
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
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0xaaaaaaaa;
     e60:	217c aaaa aaaa 	move.l #-1431655766,44(a0)
     e66:	002c 
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
     eb0:	41e8 0058      	lea 88(a0),a0
     eb4:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
     eba:	fffc 
  for(int i=0;i<128+8;i++) {
     ebc:	b088           	cmp.l a0,d0
     ebe:	6600 ff4a      	bne.w e0a <main+0xe04>
  UWORD *pos4source = source+ZMLINESIZE/2-2+ZMLINESIZE/2*8;
     ec2:	0682 0000 0188 	addi.l #392,d2
  UWORD *pos4dest = destination+ZMLINESIZE/2-2;
     ec8:	45ec 0028      	lea 40(a4),a2
  for(int i=0;i<16;i++) {
     ecc:	260c           	move.l a4,d3
     ece:	0683 0000 2ee8 	addi.l #12008,d3
  WaitBlit();
     ed4:	2c79 0000 56ea 	movea.l 56ea <GfxBase>,a6
     eda:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     ede:	2079 0000 56ee 	movea.l 56ee <hw>,a0
     ee4:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
     eea:	317c 79f0 0040 	move.w #31216,64(a0)
  hw->bltafwm = 0xffff;
     ef0:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     ef6:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     efc:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     f02:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = (UWORD *) source;
     f08:	2142 0050      	move.l d2,80(a0)
  hw->bltdpt = (UWORD *) destination;
     f0c:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
     f10:	317c 0402 0058 	move.w #1026,88(a0)
    pos4source += ZMLINESIZE/2*16;
     f16:	0682 0000 02c0 	addi.l #704,d2
    pos4dest += ZMLINESIZE/2*16;
     f1c:	280a           	move.l a2,d4
     f1e:	0684 0000 02c0 	addi.l #704,d4
  WaitBlit();
     f24:	2c79 0000 56ea 	movea.l 56ea <GfxBase>,a6
     f2a:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     f2e:	2079 0000 56ee 	movea.l 56ee <hw>,a0
     f34:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
     f3a:	317c 79f0 0040 	move.w #31216,64(a0)
  hw->bltafwm = 0xffff;
     f40:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     f46:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     f4c:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     f52:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = (UWORD *) source;
     f58:	2142 0050      	move.l d2,80(a0)
  hw->bltdpt = (UWORD *) destination;
     f5c:	2144 0054      	move.l d4,84(a0)
  hw->bltsize = height*64+2;
     f60:	317c 0042 0058 	move.w #66,88(a0)
    pos4dest += ZMLINESIZE/2;
     f66:	45ea 02ec      	lea 748(a2),a2
  for(int i=0;i<16;i++) {
     f6a:	b68a           	cmp.l a2,d3
     f6c:	6600 ff66      	bne.w ed4 <main+0xece>
  }
  
  Zoom_ZoomIntoPicture( source, destination);
  WaitBlit();
     f70:	2c79 0000 56ea 	movea.l 56ea <GfxBase>,a6
     f76:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+ZMLINESIZE/2-1; 
  UWORD *valsupposed = destline+ZMLINESIZE/2-1;
  for(int i=0;i<16;i++) {
     f7a:	49ec 02ea      	lea 746(a4),a4
  WaitBlit();
     f7e:	7a10           	moveq #16,d5
     f80:	280c           	move.l a4,d4
     f82:	2844           	movea.l d4,a4
     f84:	49ec fd40      	lea -704(a4),a4
     f88:	3439 0000 55ea 	move.w 55ea <destline+0x2a>,d2
     f8e:	3c05           	move.w d5,d6
     f90:	0646 fff0      	addi.w #-16,d6
  }
}

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
  char str[ 100] = { 0 };
     f94:	4878 0064      	pea 64 <main+0x5e>
     f98:	42a7           	clr.l -(sp)
     f9a:	2f07           	move.l d7,-(sp)
     f9c:	4eb9 0000 23cc 	jsr 23cc <memset>
  UWORD data[2];
  data[0] = numberofline;
     fa2:	3b46 ff90      	move.w d6,-112(a5)

  if( ( (*testpattern++ ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
     fa6:	3014           	move.w (a4),d0
     fa8:	b142           	eor.w d0,d2
     faa:	0242 ff00      	andi.w #-256,d2
     fae:	4fef 000c      	lea 12(sp),sp
     fb2:	6736           	beq.s fea <main+0xfe4>
    RawDoFmt( "TestZoom4Picture: Word 0 Row %d wrong.\n", data, PutChar, str);
     fb4:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
     fba:	41f9 0000 3512 	lea 3512 <incbin_swfont_end+0x794>,a0
     fc0:	43ed ff90      	lea -112(a5),a1
     fc4:	45f9 0000 25b8 	lea 25b8 <PutChar>,a2
     fca:	2647           	movea.l d7,a3
     fcc:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
     fd0:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     fd6:	4eae ffc4      	jsr -60(a6)
     fda:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
     fe0:	2200           	move.l d0,d1
     fe2:	2407           	move.l d7,d2
     fe4:	7664           	moveq #100,d3
     fe6:	4eae ffd0      	jsr -48(a6)
      *bp = 0;
     fea:	4278 0200      	clr.w 200 <main+0x1fa>
  char str[ 100] = { 0 };
     fee:	4878 0064      	pea 64 <main+0x5e>
     ff2:	42a7           	clr.l -(sp)
     ff4:	2f07           	move.l d7,-(sp)
     ff6:	4eb9 0000 23cc 	jsr 23cc <memset>
  data[0] = numberofline;
     ffc:	3046           	movea.w d6,a0
     ffe:	5248           	addq.w #1,a0
    1000:	3b48 ff90      	move.w a0,-112(a5)
  if( ( (*testpattern++ ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    1004:	3439 0000 55ea 	move.w 55ea <destline+0x2a>,d2
    100a:	302c 002c      	move.w 44(a4),d0
    100e:	b540           	eor.w d2,d0
    1010:	4640           	not.w d0
    1012:	0240 ff00      	andi.w #-256,d0
    1016:	4fef 000c      	lea 12(sp),sp
    101a:	6700 04a2      	beq.w 14be <main+0x14b8>
    RawDoFmt( "TestZoom4Picture: Word 0 Row %d wrong.\n", data, PutChar, str);
    101e:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    1024:	41f9 0000 3512 	lea 3512 <incbin_swfont_end+0x794>,a0
    102a:	43ed ff90      	lea -112(a5),a1
    102e:	45f9 0000 25b8 	lea 25b8 <PutChar>,a2
    1034:	2647           	movea.l d7,a3
    1036:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    103a:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    1040:	4eae ffc4      	jsr -60(a6)
    1044:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    104a:	2200           	move.l d0,d1
    104c:	2407           	move.l d7,d2
    104e:	7664           	moveq #100,d3
    1050:	4eae ffd0      	jsr -48(a6)
    1054:	3439 0000 55ea 	move.w 55ea <destline+0x2a>,d2
      valactual += ZMLINESIZE/2;
    105a:	49ec 0058      	lea 88(a4),a4
    105e:	5446           	addq.w #2,d6
    for(int i2=0;i2<16;i2+=2) {
    1060:	b88c           	cmp.l a4,d4
    1062:	6600 ff30      	bne.w f94 <main+0xf8e>
  char str[ 100] = { 0 };
    1066:	4878 0064      	pea 64 <main+0x5e>
    106a:	42a7           	clr.l -(sp)
    106c:	2f07           	move.l d7,-(sp)
    106e:	4eb9 0000 23cc 	jsr 23cc <memset>
  data[0] = numberofline;
    1074:	3b45 ff90      	move.w d5,-112(a5)
  if( ( (*testpattern++ ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    1078:	2044           	movea.l d4,a0
    107a:	3010           	move.w (a0),d0
    107c:	b142           	eor.w d0,d2
    107e:	0242 ff00      	andi.w #-256,d2
    1082:	4fef 000c      	lea 12(sp),sp
    1086:	6700 040e      	beq.w 1496 <main+0x1490>
    RawDoFmt( "TestZoom4Picture: Word 0 Row %d wrong.\n", data, PutChar, str);
    108a:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    1090:	41f9 0000 3512 	lea 3512 <incbin_swfont_end+0x794>,a0
    1096:	43ed ff90      	lea -112(a5),a1
    109a:	45f9 0000 25b8 	lea 25b8 <PutChar>,a2
    10a0:	2647           	movea.l d7,a3
    10a2:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    10a6:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    10ac:	4eae ffc4      	jsr -60(a6)
    10b0:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    10b6:	2200           	move.l d0,d1
    10b8:	2407           	move.l d7,d2
    10ba:	7664           	moveq #100,d3
    10bc:	4eae ffd0      	jsr -48(a6)
    valactual += ZMLINESIZE/2;
    10c0:	0645 0011      	addi.w #17,d5
    10c4:	0684 0000 02ec 	addi.l #748,d4
  for(int i=0;i<16;i++) {
    10ca:	0c45 0120      	cmpi.w #288,d5
    10ce:	6600 feb2      	bne.w f82 <main+0xf7c>
char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
  PrepareDisplaySW();
    10d2:	4eb9 0000 2144 	jsr 2144 <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    10d8:	4878 0010      	pea 10 <main+0xa>
    10dc:	4879 0000 5654 	pea 5654 <ClsSprites>
    10e2:	42a7           	clr.l -(sp)
    10e4:	2f39 0000 5712 	move.l 5712 <Copperlist1>,-(sp)
    10ea:	4eb9 0000 1812 	jsr 1812 <TestCopperlistBatch>
    10f0:	4fef 0010      	lea 16(sp),sp
    10f4:	4a80           	tst.l d0
    10f6:	661e           	bne.s 1116 <main+0x1110>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    10f8:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    10fe:	4eae ffc4      	jsr -60(a6)
    1102:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    1108:	2200           	move.l d0,d1
    110a:	243c 0000 315a 	move.l #12634,d2
    1110:	762c           	moveq #44,d3
    1112:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    1116:	4878 000c      	pea c <main+0x6>
    111a:	4879 0000 5624 	pea 5624 <ClScreen>
    1120:	4878 0010      	pea 10 <main+0xa>
    1124:	2f39 0000 5712 	move.l 5712 <Copperlist1>,-(sp)
    112a:	4eb9 0000 1812 	jsr 1812 <TestCopperlistBatch>
    1130:	4fef 0010      	lea 16(sp),sp
    1134:	4a80           	tst.l d0
    1136:	661e           	bne.s 1156 <main+0x1150>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
    1138:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    113e:	4eae ffc4      	jsr -60(a6)
    1142:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    1148:	2200           	move.l d0,d1
    114a:	243c 0000 3190 	move.l #12688,d2
    1150:	7636           	moveq #54,d3
    1152:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    1156:	4878 0002      	pea 2 <_start+0x2>
    115a:	4879 0000 561c 	pea 561c <ClColor>
    1160:	4878 001e      	pea 1e <main+0x18>
    1164:	2f39 0000 5712 	move.l 5712 <Copperlist1>,-(sp)
    116a:	4eb9 0000 1812 	jsr 1812 <TestCopperlistBatch>
    1170:	4fef 0010      	lea 16(sp),sp
    1174:	4a80           	tst.l d0
    1176:	661e           	bne.s 1196 <main+0x1190>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    1178:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    117e:	4eae ffc4      	jsr -60(a6)
    1182:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    1188:	2200           	move.l d0,d1
    118a:	243c 0000 2f3d 	move.l #12093,d2
    1190:	7621           	moveq #33,d3
    1192:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    1196:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdd22c>
    119a:	4878 0020      	pea 20 <main+0x1a>
    119e:	2f39 0000 5712 	move.l 5712 <Copperlist1>,-(sp)
    11a4:	4eb9 0000 17f4 	jsr 17f4 <TestCopperlistPos>
    11aa:	4fef 000c      	lea 12(sp),sp
    11ae:	4a80           	tst.l d0
    11b0:	6700 0250      	beq.w 1402 <main+0x13fc>
    Write( Output(), "Copperlist End not correctly set.\n", 34);

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
    11b4:	2479 0000 5702 	movea.l 5702 <DrawBuffer>,a2
    11ba:	4879 0000 353a 	pea 353a <incbin_swfont_end+0x7bc>
    11c0:	2f0a           	move.l a2,-(sp)
    11c2:	4eb9 0000 169c 	jsr 169c <WriteFont.constprop.5>

  UWORD *tstpointer = DrawBuffer;
  if( *tstpointer != 0xff00)
    11c8:	508f           	addq.l #8,sp
    11ca:	0c52 ff00      	cmpi.w #-256,(a2)
    11ce:	671e           	beq.s 11ee <main+0x11e8>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
    11d0:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    11d6:	4eae ffc4      	jsr -60(a6)
    11da:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    11e0:	2200           	move.l d0,d1
    11e2:	243c 0000 354b 	move.l #13643,d2
    11e8:	7631           	moveq #49,d3
    11ea:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
    11ee:	2f3c 0000 c800 	move.l #51200,-(sp)
    11f4:	4878 0084      	pea 84 <main+0x7e>
    11f8:	4eb9 0000 2282 	jsr 2282 <FreeDisplay>
  RunTests();
	Delay(50);
    11fe:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    1204:	7232           	moveq #50,d1
    1206:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
    120a:	247c 00f0 ff60 	movea.l #15794016,a2
    1210:	508f           	addq.l #8,sp
    1212:	4a92           	tst.l (a2)
    1214:	6718           	beq.s 122e <main+0x1228>
    1216:	4878 0001      	pea 1 <_start+0x1>
    121a:	47f9 0000 16ea 	lea 16ea <warpmode.part.0>,a3
    1220:	4e93           	jsr (a3)
    1222:	588f           	addq.l #4,sp
    1224:	4a92           	tst.l (a2)
    1226:	6706           	beq.s 122e <main+0x1228>
    1228:	42a7           	clr.l -(sp)
    122a:	4e93           	jsr (a3)
    122c:	588f           	addq.l #4,sp
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
    122e:	2c79 0000 56ea 	movea.l 56ea <GfxBase>,a6
    1234:	23ee 0022 0000 	move.l 34(a6),56d8 <ActiView>
    123a:	56d8 
	OwnBlitter();
    123c:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
    1240:	2c79 0000 56ea 	movea.l 56ea <GfxBase>,a6
    1246:	4eae ff1c      	jsr -228(a6)
	Disable();
    124a:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    1250:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
    1254:	2b79 0000 56ee 	move.l 56ee <hw>,-116(a5)
    125a:	ff8c 
    125c:	206d ff8c      	movea.l -116(a5),a0
    1260:	3028 0010      	move.w 16(a0),d0
    1264:	33c0 0000 56dc 	move.w d0,56dc <SystemADKCON>
	SystemInts=hw->intenar;
    126a:	3028 001c      	move.w 28(a0),d0
    126e:	33c0 0000 56e0 	move.w d0,56e0 <SystemInts>
	SystemDMA=hw->dmaconr;
    1274:	3028 0002      	move.w 2(a0),d0
    1278:	33c0 0000 56de 	move.w d0,56de <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
    127e:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    1284:	317c 7fff 009c 	move.w #32767,156(a0)
	
	WaitVbl();
    128a:	49f9 0000 22f4 	lea 22f4 <WaitVbl>,a4
    1290:	4e94           	jsr (a4)
	WaitVbl();
    1292:	4e94           	jsr (a4)
	hw->dmacon=0x7fff;//Clear all DMA channels
    1294:	206d ff8c      	movea.l -116(a5),a0
    1298:	317c 7fff 0096 	move.w #32767,150(a0)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
    129e:	2c79 0000 56ea 	movea.l 56ea <GfxBase>,a6
    12a4:	93c9           	suba.l a1,a1
    12a6:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    12aa:	2c79 0000 56ea 	movea.l 56ea <GfxBase>,a6
    12b0:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    12b4:	2c79 0000 56ea 	movea.l 56ea <GfxBase>,a6
    12ba:	4eae fef2      	jsr -270(a6)

	WaitVbl();
    12be:	4e94           	jsr (a4)
	WaitVbl();
    12c0:	4e94           	jsr (a4)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
    12c2:	3b7c 4e7a ff9c 	move.w #20090,-100(a5)
    12c8:	3b7c 0801 ff9e 	move.w #2049,-98(a5)
    12ce:	3b7c 4e73 ffa0 	move.w #20083,-96(a5)
	if (SysBase->AttnFlags & AFF_68010) 
    12d4:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    12da:	082e 0000 0129 	btst #0,297(a6)
    12e0:	6700 0346      	beq.w 1628 <main+0x1622>
		vbr = (APTR)Supervisor((void*)getvbr);
    12e4:	cf8d           	exg d7,a5
    12e6:	4eae ffe2      	jsr -30(a6)
    12ea:	cf8d           	exg d7,a5

	VBR=GetVBR();
    12ec:	23c0 0000 56e2 	move.l d0,56e2 <VBR.lto_priv.6>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    12f2:	2079 0000 56e2 	movea.l 56e2 <VBR.lto_priv.6>,a0
    12f8:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    12fc:	23c2 0000 56e6 	move.l d2,56e6 <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
    1302:	4e94           	jsr (a4)
}

void FreeSystem() { 
	WaitVbl();
    1304:	4e94           	jsr (a4)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1306:	2079 0000 56ee 	movea.l 56ee <hw>,a0
    130c:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    1310:	3028 0002      	move.w 2(a0),d0
    1314:	0800 000e      	btst #14,d0
    1318:	66f6           	bne.s 1310 <main+0x130a>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
    131a:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    1320:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
    1326:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
    132c:	2279 0000 56e2 	movea.l 56e2 <VBR.lto_priv.6>,a1
    1332:	2342 006c      	move.l d2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
    1336:	2c79 0000 56ea 	movea.l 56ea <GfxBase>,a6
    133c:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
    1342:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
    1348:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
    134e:	3039 0000 56e0 	move.w 56e0 <SystemInts>,d0
    1354:	0040 8000      	ori.w #-32768,d0
    1358:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
    135c:	3039 0000 56de 	move.w 56de <SystemDMA>,d0
    1362:	0040 8000      	ori.w #-32768,d0
    1366:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
    136a:	3039 0000 56dc 	move.w 56dc <SystemADKCON>,d0
    1370:	0040 8000      	ori.w #-32768,d0
    1374:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
    1378:	2279 0000 56d8 	movea.l 56d8 <ActiView>,a1
    137e:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    1382:	2c79 0000 56ea 	movea.l 56ea <GfxBase>,a6
    1388:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    138c:	2c79 0000 56ea 	movea.l 56ea <GfxBase>,a6
    1392:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
    1396:	2c79 0000 56ea 	movea.l 56ea <GfxBase>,a6
    139c:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
    13a0:	2c79 0000 56ea 	movea.l 56ea <GfxBase>,a6
    13a6:	4eae fe32      	jsr -462(a6)
	Enable();
    13aa:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    13b0:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
    13b4:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    13ba:	2279 0000 5706 	movea.l 5706 <DOSBase>,a1
    13c0:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
    13c4:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    13ca:	2279 0000 56ea 	movea.l 56ea <GfxBase>,a1
    13d0:	4eae fe62      	jsr -414(a6)
}
    13d4:	7000           	moveq #0,d0
    13d6:	4ced 5cfc ff64 	movem.l -156(a5),d2-d7/a2-a4/a6
    13dc:	4e5d           	unlk a5
    13de:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    13e0:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    13e6:	4eae ffc4      	jsr -60(a6)
    13ea:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    13f0:	2200           	move.l d0,d1
    13f2:	243c 0000 315a 	move.l #12634,d2
    13f8:	762c           	moveq #44,d3
    13fa:	4eae ffd0      	jsr -48(a6)
    13fe:	6000 eda8      	bra.w 1a8 <main+0x1a2>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
    1402:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    1408:	4eae ffc4      	jsr -60(a6)
    140c:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    1412:	2200           	move.l d0,d1
    1414:	243c 0000 2f5f 	move.l #12127,d2
    141a:	7622           	moveq #34,d3
    141c:	4eae ffd0      	jsr -48(a6)
    1420:	6000 fd92      	bra.w 11b4 <main+0x11ae>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    1424:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    142a:	4eae ffc4      	jsr -60(a6)
    142e:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    1434:	2200           	move.l d0,d1
    1436:	243c 0000 2f3d 	move.l #12093,d2
    143c:	7621           	moveq #33,d3
    143e:	4eae ffd0      	jsr -48(a6)
    1442:	2079 0000 5712 	movea.l 5712 <Copperlist1>,a0
    1448:	6000 eed2      	bra.w 31c <main+0x316>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    144c:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    1452:	4eae ffc4      	jsr -60(a6)
    1456:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    145c:	2200           	move.l d0,d1
    145e:	243c 0000 3190 	move.l #12688,d2
    1464:	7636           	moveq #54,d3
    1466:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
    146a:	23fc 0004 0000 	move.l #262144,5702 <DrawBuffer>
    1470:	0000 5702 
  ViewBuffer = (ULONG *)0x50000;
    1474:	23fc 0005 0000 	move.l #327680,56f6 <ViewBuffer>
    147a:	0000 56f6 
  SetBplPointers();
    147e:	49f9 0000 2118 	lea 2118 <SetBplPointers>,a4
    1484:	4e94           	jsr (a4)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    1486:	0cb9 0005 0000 	cmpi.l #327680,5702 <DrawBuffer>
    148c:	0000 5702 
    1490:	6600 edee      	bne.w 280 <main+0x27a>
    1494:	6038           	bra.s 14ce <main+0x14c8>
    valactual += ZMLINESIZE/2;
    1496:	0645 0011      	addi.w #17,d5
    149a:	0684 0000 02ec 	addi.l #748,d4
  for(int i=0;i<16;i++) {
    14a0:	0c45 0120      	cmpi.w #288,d5
    14a4:	6700 fc2c      	beq.w 10d2 <main+0x10cc>
    14a8:	2844           	movea.l d4,a4
    14aa:	49ec fd40      	lea -704(a4),a4
    14ae:	3439 0000 55ea 	move.w 55ea <destline+0x2a>,d2
    14b4:	3c05           	move.w d5,d6
    14b6:	0646 fff0      	addi.w #-16,d6
    14ba:	6000 fad8      	bra.w f94 <main+0xf8e>
      valactual += ZMLINESIZE/2;
    14be:	49ec 0058      	lea 88(a4),a4
    14c2:	5446           	addq.w #2,d6
    for(int i2=0;i2<16;i2+=2) {
    14c4:	b88c           	cmp.l a4,d4
    14c6:	6600 facc      	bne.w f94 <main+0xf8e>
    14ca:	6000 fb9a      	bra.w 1066 <main+0x1060>
    14ce:	0cb9 0004 0000 	cmpi.l #262144,56f6 <ViewBuffer>
    14d4:	0000 56f6 
    14d8:	6700 edc4      	beq.w 29e <main+0x298>
    Write( Output(), 
    14dc:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    14e2:	4eae ffc4      	jsr -60(a6)
    14e6:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    14ec:	2200           	move.l d0,d1
    14ee:	243c 0000 2e87 	move.l #11911,d2
    14f4:	763b           	moveq #59,d3
    14f6:	4eae ffd0      	jsr -48(a6)
    14fa:	6000 eda2      	bra.w 29e <main+0x298>
		Exit(0);
    14fe:	9dce           	suba.l a6,a6
    1500:	7200           	moveq #0,d1
    1502:	4eae ff70      	jsr -144(a6)
    1506:	6000 eb4c      	bra.w 54 <main+0x4e>
		Exit(0);
    150a:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    1510:	7200           	moveq #0,d1
    1512:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
    1516:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    151c:	43f9 0000 2e4c 	lea 2e4c <incbin_swfont_end+0xce>,a1
    1522:	7000           	moveq #0,d0
    1524:	4eae fdd8      	jsr -552(a6)
    1528:	23c0 0000 5706 	move.l d0,5706 <DOSBase>
	if (!DOSBase)
    152e:	6600 eb24      	bne.w 54 <main+0x4e>
    1532:	60ca           	bra.s 14fe <main+0x14f8>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    1534:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    153a:	4eae ffc4      	jsr -60(a6)
    153e:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    1544:	2200           	move.l d0,d1
    1546:	243c 0000 3422 	move.l #13346,d2
    154c:	7635           	moveq #53,d3
    154e:	4eae ffd0      	jsr -48(a6)
  UWORD *source =AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    1552:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    1558:	203c 0000 3300 	move.l #13056,d0
    155e:	7202           	moveq #2,d1
    1560:	4eae ff3a      	jsr -198(a6)
    1564:	2400           	move.l d0,d2
  if( source == 0) {
    1566:	6600 f87e      	bne.w de6 <main+0xde0>
    Write(  Output(), 
    156a:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    1570:	4eae ffc4      	jsr -60(a6)
    1574:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    157a:	2200           	move.l d0,d1
    157c:	243c 0000 3499 	move.l #13465,d2
    1582:	7639           	moveq #57,d3
    1584:	4eae ffd0      	jsr -48(a6)
  PrepareDisplaySW();
    1588:	4eb9 0000 2144 	jsr 2144 <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    158e:	4878 0010      	pea 10 <main+0xa>
    1592:	4879 0000 5654 	pea 5654 <ClsSprites>
    1598:	42a7           	clr.l -(sp)
    159a:	2f39 0000 5712 	move.l 5712 <Copperlist1>,-(sp)
    15a0:	4eb9 0000 1812 	jsr 1812 <TestCopperlistBatch>
    15a6:	4fef 0010      	lea 16(sp),sp
    15aa:	4a80           	tst.l d0
    15ac:	6600 fb68      	bne.w 1116 <main+0x1110>
    15b0:	6000 fb46      	bra.w 10f8 <main+0x10f2>
    Write(  Output(), 
    15b4:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    15ba:	4eae ffc4      	jsr -60(a6)
    15be:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    15c4:	2200           	move.l d0,d1
    15c6:	243c 0000 3290 	move.l #12944,d2
    15cc:	7636           	moveq #54,d3
    15ce:	4eae ffd0      	jsr -48(a6)
  PrepareDisplayZoom();
    15d2:	4e92           	jsr (a2)
  UWORD *destination = (UWORD *)DrawBuffer;
    15d4:	2079 0000 5702 	movea.l 5702 <DrawBuffer>,a0
  *destination= 0x0000;
    15da:	4250           	clr.w (a0)
  *destination= 0x000f;
    15dc:	317c 000f 002c 	move.w #15,44(a0)
  *destination = 0x000f;
    15e2:	317c 000f 41d4 	move.w #15,16852(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    15e8:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    15ee:	203c 0000 c800 	move.l #51200,d0
    15f4:	7202           	moveq #2,d1
    15f6:	4eae ff3a      	jsr -198(a6)
    15fa:	2840           	movea.l d0,a4
    15fc:	23c0 0000 56d4 	move.l d0,56d4 <Zoom_Source>
  if( Zoom_Source == 0) {
    1602:	6600 f36c      	bne.w 970 <main+0x96a>
    Write(  Output(), 
    1606:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    160c:	4eae ffc4      	jsr -60(a6)
    1610:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    1616:	2200           	move.l d0,d1
    1618:	243c 0000 3290 	move.l #12944,d2
    161e:	7636           	moveq #54,d3
    1620:	4eae ffd0      	jsr -48(a6)
    return;
    1624:	6000 f564      	bra.w b8a <main+0xb84>
	APTR vbr = 0;
    1628:	7000           	moveq #0,d0
	VBR=GetVBR();
    162a:	23c0 0000 56e2 	move.l d0,56e2 <VBR.lto_priv.6>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    1630:	2079 0000 56e2 	movea.l 56e2 <VBR.lto_priv.6>,a0
    1636:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    163a:	23c2 0000 56e6 	move.l d2,56e6 <SystemIrq>
	WaitVbl();
    1640:	4e94           	jsr (a4)
	WaitVbl();
    1642:	4e94           	jsr (a4)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1644:	2079 0000 56ee 	movea.l 56ee <hw>,a0
    164a:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    164e:	6000 fcc0      	bra.w 1310 <main+0x130a>
    Write(  Output(), 
    1652:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    1658:	4eae ffc4      	jsr -60(a6)
    165c:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    1662:	2200           	move.l d0,d1
    1664:	243c 0000 34d3 	move.l #13523,d2
    166a:	763d           	moveq #61,d3
    166c:	4eae ffd0      	jsr -48(a6)
  PrepareDisplaySW();
    1670:	4eb9 0000 2144 	jsr 2144 <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    1676:	4878 0010      	pea 10 <main+0xa>
    167a:	4879 0000 5654 	pea 5654 <ClsSprites>
    1680:	42a7           	clr.l -(sp)
    1682:	2f39 0000 5712 	move.l 5712 <Copperlist1>,-(sp)
    1688:	4eb9 0000 1812 	jsr 1812 <TestCopperlistBatch>
    168e:	4fef 0010      	lea 16(sp),sp
    1692:	4a80           	tst.l d0
    1694:	6600 fa80      	bne.w 1116 <main+0x1110>
    1698:	6000 fa5e      	bra.w 10f8 <main+0x10f2>

0000169c <WriteFont.constprop.5>:
  *cl = 0xfffffffe;

  return retval;
}

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
    169c:	226f 0004      	movea.l 4(sp),a1
  UWORD *bmpptr = Destination;
  UWORD *fntptr = font;

  char charpos = *text;
  charpos -= 0x20;
    16a0:	206f 0008      	movea.l 8(sp),a0
    16a4:	1010           	move.b (a0),d0
    16a6:	0600 ffe0      	addi.b #-32,d0
  charpos = charpos<<3;
    16aa:	4880           	ext.w d0
    16ac:	48c0           	ext.l d0
    16ae:	e788           	lsl.l #3,d0
  fntptr += charpos;
    16b0:	4880           	ext.w d0
    16b2:	3040           	movea.w d0,a0
    16b4:	d1c8           	adda.l a0,a0
    16b6:	d1fc 0000 5694 	adda.l #22164,a0
  for(int i=1;i<=8;i++) {
    *bmpptr = *fntptr++;
    16bc:	3290           	move.w (a0),(a1)
    16be:	3368 0002 0050 	move.w 2(a0),80(a1)
    16c4:	3368 0004 00a0 	move.w 4(a0),160(a1)
    16ca:	3368 0006 00f0 	move.w 6(a0),240(a1)
    16d0:	3368 0008 0140 	move.w 8(a0),320(a1)
    16d6:	3368 000a 0190 	move.w 10(a0),400(a1)
    16dc:	3368 000c 01e0 	move.w 12(a0),480(a1)
    16e2:	3368 000e 0230 	move.w 14(a0),560(a1)
    bmpptr += 40;
  }

}
    16e8:	4e75           	rts

000016ea <warpmode.part.0>:
void warpmode(int on) 
    16ea:	598f           	subq.l #4,sp
    16ec:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    16ee:	4aaf 000c      	tst.l 12(sp)
    16f2:	674c           	beq.s 1740 <warpmode.part.0+0x56>
    16f4:	4878 0001      	pea 1 <_start+0x1>
    16f8:	740b           	moveq #11,d2
    16fa:	d48f           	add.l sp,d2
    16fc:	2f02           	move.l d2,-(sp)
    16fe:	42a7           	clr.l -(sp)
    1700:	4879 0000 2db2 	pea 2db2 <incbin_swfont_end+0x34>
    1706:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd22d>
    170a:	4878 0052      	pea 52 <main+0x4c>
    170e:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeed18e>
    1714:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    1718:	203c 0000 2d98 	move.l #11672,d0
    171e:	4878 0001      	pea 1 <_start+0x1>
    1722:	2f02           	move.l d2,-(sp)
    1724:	42a7           	clr.l -(sp)
    1726:	2f00           	move.l d0,-(sp)
    1728:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd22d>
    172c:	4878 0052      	pea 52 <main+0x4c>
    1730:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeed18e>
	}
}
    1736:	4fef 0018      	lea 24(sp),sp
    173a:	241f           	move.l (sp)+,d2
    173c:	588f           	addq.l #4,sp
    173e:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    1740:	4878 0001      	pea 1 <_start+0x1>
    1744:	740b           	moveq #11,d2
    1746:	d48f           	add.l sp,d2
    1748:	2f02           	move.l d2,-(sp)
    174a:	42a7           	clr.l -(sp)
    174c:	4879 0000 2dbc 	pea 2dbc <incbin_swfont_end+0x3e>
    1752:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd22d>
    1756:	4878 0052      	pea 52 <main+0x4c>
    175a:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeed18e>
    1760:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    1764:	203c 0000 2d7f 	move.l #11647,d0
    176a:	4878 0001      	pea 1 <_start+0x1>
    176e:	2f02           	move.l d2,-(sp)
    1770:	42a7           	clr.l -(sp)
    1772:	2f00           	move.l d0,-(sp)
    1774:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd22d>
    1778:	4878 0052      	pea 52 <main+0x4c>
    177c:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeed18e>
}
    1782:	4fef 0018      	lea 24(sp),sp
    1786:	241f           	move.l (sp)+,d2
    1788:	588f           	addq.l #4,sp
    178a:	4e75           	rts

0000178c <KPrintF>:
{
    178c:	4fef ff80      	lea -128(sp),sp
    1790:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
    1794:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeed18e>
    179a:	6734           	beq.s 17d0 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
    179c:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    17a2:	206f 0090      	movea.l 144(sp),a0
    17a6:	43ef 0094      	lea 148(sp),a1
    17aa:	45f9 0000 25b8 	lea 25b8 <PutChar>,a2
    17b0:	47ef 000c      	lea 12(sp),a3
    17b4:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    17b8:	2f0b           	move.l a3,-(sp)
    17ba:	4878 0056      	pea 56 <main+0x50>
    17be:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeed18e>
    17c4:	508f           	addq.l #8,sp
}
    17c6:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    17ca:	4fef 0080      	lea 128(sp),sp
    17ce:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
    17d0:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    17d6:	206f 0090      	movea.l 144(sp),a0
    17da:	43ef 0094      	lea 148(sp),a1
    17de:	45f9 0000 25aa 	lea 25aa <KPutCharX>,a2
    17e4:	97cb           	suba.l a3,a3
    17e6:	4eae fdf6      	jsr -522(a6)
}
    17ea:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    17ee:	4fef 0080      	lea 128(sp),sp
    17f2:	4e75           	rts

000017f4 <TestCopperlistPos>:
  if( instructions[pos] == value ) 
    17f4:	202f 0008      	move.l 8(sp),d0
    17f8:	d080           	add.l d0,d0
    17fa:	d080           	add.l d0,d0
    17fc:	206f 0004      	movea.l 4(sp),a0
    1800:	2030 0800      	move.l (0,a0,d0.l),d0
    1804:	b0af 000c      	cmp.l 12(sp),d0
    1808:	57c0           	seq d0
    180a:	4880           	ext.w d0
    180c:	48c0           	ext.l d0
}
    180e:	4480           	neg.l d0
    1810:	4e75           	rts

00001812 <TestCopperlistBatch>:
                                                                  long length) {
    1812:	48e7 2030      	movem.l d2/a2-a3,-(sp)
    1816:	246f 0010      	movea.l 16(sp),a2
    181a:	206f 0014      	movea.l 20(sp),a0
    181e:	226f 0018      	movea.l 24(sp),a1
    1822:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
    1826:	2008           	move.l a0,d0
    1828:	d088           	add.l a0,d0
    182a:	d080           	add.l d0,d0
    182c:	2411           	move.l (a1),d2
    182e:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
    1832:	6600 01ac      	bne.w 19e0 <TestCopperlistBatch+0x1ce>
    1836:	2008           	move.l a0,d0
    1838:	5280           	addq.l #1,d0
    183a:	d080           	add.l d0,d0
    183c:	d080           	add.l d0,d0
    183e:	2032 0800      	move.l (0,a2,d0.l),d0
    1842:	b0a9 0004      	cmp.l 4(a1),d0
    1846:	6600 0198      	bne.w 19e0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    184a:	7002           	moveq #2,d0
    184c:	b081           	cmp.l d1,d0
    184e:	6700 0188      	beq.w 19d8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1852:	2008           	move.l a0,d0
    1854:	5480           	addq.l #2,d0
    1856:	d080           	add.l d0,d0
    1858:	d080           	add.l d0,d0
    185a:	2032 0800      	move.l (0,a2,d0.l),d0
    185e:	b0a9 0008      	cmp.l 8(a1),d0
    1862:	6600 017c      	bne.w 19e0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1866:	7403           	moveq #3,d2
    1868:	b481           	cmp.l d1,d2
    186a:	6700 016c      	beq.w 19d8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    186e:	2008           	move.l a0,d0
    1870:	5680           	addq.l #3,d0
    1872:	d080           	add.l d0,d0
    1874:	d080           	add.l d0,d0
    1876:	2032 0800      	move.l (0,a2,d0.l),d0
    187a:	b0a9 000c      	cmp.l 12(a1),d0
    187e:	6600 0160      	bne.w 19e0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1882:	7004           	moveq #4,d0
    1884:	b081           	cmp.l d1,d0
    1886:	6700 0150      	beq.w 19d8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    188a:	2008           	move.l a0,d0
    188c:	5880           	addq.l #4,d0
    188e:	d080           	add.l d0,d0
    1890:	d080           	add.l d0,d0
    1892:	2032 0800      	move.l (0,a2,d0.l),d0
    1896:	b0a9 0010      	cmp.l 16(a1),d0
    189a:	6600 0144      	bne.w 19e0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    189e:	7405           	moveq #5,d2
    18a0:	b481           	cmp.l d1,d2
    18a2:	6700 0134      	beq.w 19d8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    18a6:	2008           	move.l a0,d0
    18a8:	5a80           	addq.l #5,d0
    18aa:	d080           	add.l d0,d0
    18ac:	d080           	add.l d0,d0
    18ae:	2032 0800      	move.l (0,a2,d0.l),d0
    18b2:	b0a9 0014      	cmp.l 20(a1),d0
    18b6:	6600 0128      	bne.w 19e0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    18ba:	7006           	moveq #6,d0
    18bc:	b081           	cmp.l d1,d0
    18be:	6700 0118      	beq.w 19d8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    18c2:	2008           	move.l a0,d0
    18c4:	5c80           	addq.l #6,d0
    18c6:	d080           	add.l d0,d0
    18c8:	d080           	add.l d0,d0
    18ca:	2032 0800      	move.l (0,a2,d0.l),d0
    18ce:	b0a9 0018      	cmp.l 24(a1),d0
    18d2:	6600 010c      	bne.w 19e0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    18d6:	7407           	moveq #7,d2
    18d8:	b481           	cmp.l d1,d2
    18da:	6700 00fc      	beq.w 19d8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    18de:	2008           	move.l a0,d0
    18e0:	5e80           	addq.l #7,d0
    18e2:	d080           	add.l d0,d0
    18e4:	d080           	add.l d0,d0
    18e6:	2032 0800      	move.l (0,a2,d0.l),d0
    18ea:	b0a9 001c      	cmp.l 28(a1),d0
    18ee:	6600 00f0      	bne.w 19e0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    18f2:	7008           	moveq #8,d0
    18f4:	b081           	cmp.l d1,d0
    18f6:	6700 00e0      	beq.w 19d8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    18fa:	2008           	move.l a0,d0
    18fc:	5080           	addq.l #8,d0
    18fe:	d080           	add.l d0,d0
    1900:	d080           	add.l d0,d0
    1902:	2032 0800      	move.l (0,a2,d0.l),d0
    1906:	b0a9 0020      	cmp.l 32(a1),d0
    190a:	6600 00d4      	bne.w 19e0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    190e:	7409           	moveq #9,d2
    1910:	b481           	cmp.l d1,d2
    1912:	6700 00c4      	beq.w 19d8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1916:	47e8 0009      	lea 9(a0),a3
    191a:	200b           	move.l a3,d0
    191c:	d08b           	add.l a3,d0
    191e:	d080           	add.l d0,d0
    1920:	2032 0800      	move.l (0,a2,d0.l),d0
    1924:	b0a9 0024      	cmp.l 36(a1),d0
    1928:	6600 00b6      	bne.w 19e0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    192c:	700a           	moveq #10,d0
    192e:	b081           	cmp.l d1,d0
    1930:	6700 00a6      	beq.w 19d8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1934:	47e8 000a      	lea 10(a0),a3
    1938:	200b           	move.l a3,d0
    193a:	d08b           	add.l a3,d0
    193c:	d080           	add.l d0,d0
    193e:	2032 0800      	move.l (0,a2,d0.l),d0
    1942:	b0a9 0028      	cmp.l 40(a1),d0
    1946:	6600 0098      	bne.w 19e0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    194a:	740b           	moveq #11,d2
    194c:	b481           	cmp.l d1,d2
    194e:	6700 0088      	beq.w 19d8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1952:	47e8 000b      	lea 11(a0),a3
    1956:	200b           	move.l a3,d0
    1958:	d08b           	add.l a3,d0
    195a:	d080           	add.l d0,d0
    195c:	2032 0800      	move.l (0,a2,d0.l),d0
    1960:	b0a9 002c      	cmp.l 44(a1),d0
    1964:	667a           	bne.s 19e0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1966:	700c           	moveq #12,d0
    1968:	b081           	cmp.l d1,d0
    196a:	676c           	beq.s 19d8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    196c:	47e8 000c      	lea 12(a0),a3
    1970:	200b           	move.l a3,d0
    1972:	d08b           	add.l a3,d0
    1974:	d080           	add.l d0,d0
    1976:	2032 0800      	move.l (0,a2,d0.l),d0
    197a:	b0a9 0030      	cmp.l 48(a1),d0
    197e:	6660           	bne.s 19e0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1980:	740d           	moveq #13,d2
    1982:	b481           	cmp.l d1,d2
    1984:	6752           	beq.s 19d8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1986:	47e8 000d      	lea 13(a0),a3
    198a:	200b           	move.l a3,d0
    198c:	d08b           	add.l a3,d0
    198e:	d080           	add.l d0,d0
    1990:	2032 0800      	move.l (0,a2,d0.l),d0
    1994:	b0a9 0034      	cmp.l 52(a1),d0
    1998:	6646           	bne.s 19e0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    199a:	700e           	moveq #14,d0
    199c:	b081           	cmp.l d1,d0
    199e:	6738           	beq.s 19d8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    19a0:	47e8 000e      	lea 14(a0),a3
    19a4:	200b           	move.l a3,d0
    19a6:	d08b           	add.l a3,d0
    19a8:	d080           	add.l d0,d0
    19aa:	2032 0800      	move.l (0,a2,d0.l),d0
    19ae:	b0a9 0038      	cmp.l 56(a1),d0
    19b2:	662c           	bne.s 19e0 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    19b4:	7410           	moveq #16,d2
    19b6:	b481           	cmp.l d1,d2
    19b8:	661e           	bne.s 19d8 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    19ba:	41e8 000f      	lea 15(a0),a0
    19be:	d1c8           	adda.l a0,a0
    19c0:	d1c8           	adda.l a0,a0
    19c2:	2070 a800      	movea.l (0,a0,a2.l),a0
    19c6:	b1e9 003c      	cmpa.l 60(a1),a0
    19ca:	57c0           	seq d0
    19cc:	4880           	ext.w d0
    19ce:	48c0           	ext.l d0
    19d0:	4480           	neg.l d0
}
    19d2:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    19d6:	4e75           	rts
  return 1;
    19d8:	7001           	moveq #1,d0
}
    19da:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    19de:	4e75           	rts
      return 0;
    19e0:	7000           	moveq #0,d0
}
    19e2:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    19e6:	4e75           	rts

000019e8 <ClBuild>:
ULONG * ClbuildSW() {
    19e8:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
    19ec:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    19f2:	707b           	moveq #123,d0
    19f4:	4600           	not.b d0
    19f6:	7202           	moveq #2,d1
    19f8:	4eae ff3a      	jsr -198(a6)
    19fc:	2440           	movea.l d0,a2
  if( retval == 0) {
    19fe:	4a80           	tst.l d0
    1a00:	6700 010e      	beq.w 1b10 <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
    1a04:	24b9 0000 5654 	move.l 5654 <ClsSprites>,(a2)
    1a0a:	2579 0000 5658 	move.l 5658 <ClsSprites+0x4>,4(a2)
    1a10:	0004 
    1a12:	2579 0000 565c 	move.l 565c <ClsSprites+0x8>,8(a2)
    1a18:	0008 
    1a1a:	2579 0000 5660 	move.l 5660 <ClsSprites+0xc>,12(a2)
    1a20:	000c 
    1a22:	2579 0000 5664 	move.l 5664 <ClsSprites+0x10>,16(a2)
    1a28:	0010 
    1a2a:	2579 0000 5668 	move.l 5668 <ClsSprites+0x14>,20(a2)
    1a30:	0014 
    1a32:	2579 0000 566c 	move.l 566c <ClsSprites+0x18>,24(a2)
    1a38:	0018 
    1a3a:	2579 0000 5670 	move.l 5670 <ClsSprites+0x1c>,28(a2)
    1a40:	001c 
    1a42:	2579 0000 5674 	move.l 5674 <ClsSprites+0x20>,32(a2)
    1a48:	0020 
    1a4a:	2579 0000 5678 	move.l 5678 <ClsSprites+0x24>,36(a2)
    1a50:	0024 
    1a52:	2579 0000 567c 	move.l 567c <ClsSprites+0x28>,40(a2)
    1a58:	0028 
    1a5a:	2579 0000 5680 	move.l 5680 <ClsSprites+0x2c>,44(a2)
    1a60:	002c 
    1a62:	2579 0000 5684 	move.l 5684 <ClsSprites+0x30>,48(a2)
    1a68:	0030 
    1a6a:	2579 0000 5688 	move.l 5688 <ClsSprites+0x34>,52(a2)
    1a70:	0034 
    1a72:	2579 0000 568c 	move.l 568c <ClsSprites+0x38>,56(a2)
    1a78:	0038 
    1a7a:	2579 0000 5690 	move.l 5690 <ClsSprites+0x3c>,60(a2)
    1a80:	003c 
    *cl++ = *clpartinstruction++;
    1a82:	2579 0000 5624 	move.l 5624 <ClScreen>,64(a2)
    1a88:	0040 
    1a8a:	2579 0000 5628 	move.l 5628 <ClScreen+0x4>,68(a2)
    1a90:	0044 
    1a92:	2579 0000 562c 	move.l 562c <ClScreen+0x8>,72(a2)
    1a98:	0048 
    1a9a:	2579 0000 5630 	move.l 5630 <ClScreen+0xc>,76(a2)
    1aa0:	004c 
    1aa2:	2579 0000 5634 	move.l 5634 <ClScreen+0x10>,80(a2)
    1aa8:	0050 
    1aaa:	2579 0000 5638 	move.l 5638 <ClScreen+0x14>,84(a2)
    1ab0:	0054 
    1ab2:	2579 0000 563c 	move.l 563c <ClScreen+0x18>,88(a2)
    1ab8:	0058 
    1aba:	2579 0000 5640 	move.l 5640 <ClScreen+0x1c>,92(a2)
    1ac0:	005c 
    1ac2:	2579 0000 5644 	move.l 5644 <ClScreen+0x20>,96(a2)
    1ac8:	0060 
    1aca:	2579 0000 5648 	move.l 5648 <ClScreen+0x24>,100(a2)
    1ad0:	0064 
    1ad2:	2579 0000 564c 	move.l 564c <ClScreen+0x28>,104(a2)
    1ad8:	0068 
    1ada:	2579 0000 5650 	move.l 5650 <ClScreen+0x2c>,108(a2)
    1ae0:	006c 
  *cl++ = 0x00e00000;
    1ae2:	257c 00e0 0000 	move.l #14680064,112(a2)
    1ae8:	0070 
  *cl++ = 0x00e20000;
    1aea:	257c 00e2 0000 	move.l #14811136,116(a2)
    1af0:	0074 
    *cl++ = *clpartinstruction++;
    1af2:	2579 0000 561c 	move.l 561c <ClColor>,120(a2)
    1af8:	0078 
    1afa:	2579 0000 5620 	move.l 5620 <ClColor+0x4>,124(a2)
    1b00:	007c 
  *cl = 0xfffffffe;
    1b02:	70fe           	moveq #-2,d0
    1b04:	2540 0080      	move.l d0,128(a2)
}
    1b08:	200a           	move.l a2,d0
    1b0a:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1b0e:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1b10:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    1b16:	4eae ffc4      	jsr -60(a6)
    1b1a:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    1b20:	2200           	move.l d0,d1
    1b22:	243c 0000 2dc7 	move.l #11719,d2
    1b28:	7628           	moveq #40,d3
    1b2a:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1b2e:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    1b34:	7201           	moveq #1,d1
    1b36:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1b3a:	24b9 0000 5654 	move.l 5654 <ClsSprites>,(a2)
    1b40:	2579 0000 5658 	move.l 5658 <ClsSprites+0x4>,4(a2)
    1b46:	0004 
    1b48:	2579 0000 565c 	move.l 565c <ClsSprites+0x8>,8(a2)
    1b4e:	0008 
    1b50:	2579 0000 5660 	move.l 5660 <ClsSprites+0xc>,12(a2)
    1b56:	000c 
    1b58:	2579 0000 5664 	move.l 5664 <ClsSprites+0x10>,16(a2)
    1b5e:	0010 
    1b60:	2579 0000 5668 	move.l 5668 <ClsSprites+0x14>,20(a2)
    1b66:	0014 
    1b68:	2579 0000 566c 	move.l 566c <ClsSprites+0x18>,24(a2)
    1b6e:	0018 
    1b70:	2579 0000 5670 	move.l 5670 <ClsSprites+0x1c>,28(a2)
    1b76:	001c 
    1b78:	2579 0000 5674 	move.l 5674 <ClsSprites+0x20>,32(a2)
    1b7e:	0020 
    1b80:	2579 0000 5678 	move.l 5678 <ClsSprites+0x24>,36(a2)
    1b86:	0024 
    1b88:	2579 0000 567c 	move.l 567c <ClsSprites+0x28>,40(a2)
    1b8e:	0028 
    1b90:	2579 0000 5680 	move.l 5680 <ClsSprites+0x2c>,44(a2)
    1b96:	002c 
    1b98:	2579 0000 5684 	move.l 5684 <ClsSprites+0x30>,48(a2)
    1b9e:	0030 
    1ba0:	2579 0000 5688 	move.l 5688 <ClsSprites+0x34>,52(a2)
    1ba6:	0034 
    1ba8:	2579 0000 568c 	move.l 568c <ClsSprites+0x38>,56(a2)
    1bae:	0038 
    1bb0:	2579 0000 5690 	move.l 5690 <ClsSprites+0x3c>,60(a2)
    1bb6:	003c 
    *cl++ = *clpartinstruction++;
    1bb8:	2579 0000 5624 	move.l 5624 <ClScreen>,64(a2)
    1bbe:	0040 
    1bc0:	2579 0000 5628 	move.l 5628 <ClScreen+0x4>,68(a2)
    1bc6:	0044 
    1bc8:	2579 0000 562c 	move.l 562c <ClScreen+0x8>,72(a2)
    1bce:	0048 
    1bd0:	2579 0000 5630 	move.l 5630 <ClScreen+0xc>,76(a2)
    1bd6:	004c 
    1bd8:	2579 0000 5634 	move.l 5634 <ClScreen+0x10>,80(a2)
    1bde:	0050 
    1be0:	2579 0000 5638 	move.l 5638 <ClScreen+0x14>,84(a2)
    1be6:	0054 
    1be8:	2579 0000 563c 	move.l 563c <ClScreen+0x18>,88(a2)
    1bee:	0058 
    1bf0:	2579 0000 5640 	move.l 5640 <ClScreen+0x1c>,92(a2)
    1bf6:	005c 
    1bf8:	2579 0000 5644 	move.l 5644 <ClScreen+0x20>,96(a2)
    1bfe:	0060 
    1c00:	2579 0000 5648 	move.l 5648 <ClScreen+0x24>,100(a2)
    1c06:	0064 
    1c08:	2579 0000 564c 	move.l 564c <ClScreen+0x28>,104(a2)
    1c0e:	0068 
    1c10:	2579 0000 5650 	move.l 5650 <ClScreen+0x2c>,108(a2)
    1c16:	006c 
  *cl++ = 0x00e00000;
    1c18:	257c 00e0 0000 	move.l #14680064,112(a2)
    1c1e:	0070 
  *cl++ = 0x00e20000;
    1c20:	257c 00e2 0000 	move.l #14811136,116(a2)
    1c26:	0074 
    *cl++ = *clpartinstruction++;
    1c28:	2579 0000 561c 	move.l 561c <ClColor>,120(a2)
    1c2e:	0078 
    1c30:	2579 0000 5620 	move.l 5620 <ClColor+0x4>,124(a2)
    1c36:	007c 
  *cl = 0xfffffffe;
    1c38:	70fe           	moveq #-2,d0
    1c3a:	2540 0080      	move.l d0,128(a2)
}
    1c3e:	200a           	move.l a2,d0
    1c40:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1c44:	4e75           	rts

00001c46 <ClbuildZoom>:
ULONG * ClbuildZoom() {
    1c46:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    1c4a:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    1c50:	203c 0000 a48c 	move.l #42124,d0
    1c56:	7202           	moveq #2,d1
    1c58:	4eae ff3a      	jsr -198(a6)
    1c5c:	2440           	movea.l d0,a2
  if( retval == 0) {
    1c5e:	4a80           	tst.l d0
    1c60:	6700 0160      	beq.w 1dc2 <ClbuildZoom+0x17c>
    *cl++ = *clpartinstruction++;
    1c64:	24b9 0000 5654 	move.l 5654 <ClsSprites>,(a2)
    1c6a:	2579 0000 5658 	move.l 5658 <ClsSprites+0x4>,4(a2)
    1c70:	0004 
    1c72:	2579 0000 565c 	move.l 565c <ClsSprites+0x8>,8(a2)
    1c78:	0008 
    1c7a:	2579 0000 5660 	move.l 5660 <ClsSprites+0xc>,12(a2)
    1c80:	000c 
    1c82:	2579 0000 5664 	move.l 5664 <ClsSprites+0x10>,16(a2)
    1c88:	0010 
    1c8a:	2579 0000 5668 	move.l 5668 <ClsSprites+0x14>,20(a2)
    1c90:	0014 
    1c92:	2579 0000 566c 	move.l 566c <ClsSprites+0x18>,24(a2)
    1c98:	0018 
    1c9a:	2579 0000 5670 	move.l 5670 <ClsSprites+0x1c>,28(a2)
    1ca0:	001c 
    1ca2:	2579 0000 5674 	move.l 5674 <ClsSprites+0x20>,32(a2)
    1ca8:	0020 
    1caa:	2579 0000 5678 	move.l 5678 <ClsSprites+0x24>,36(a2)
    1cb0:	0024 
    1cb2:	2579 0000 567c 	move.l 567c <ClsSprites+0x28>,40(a2)
    1cb8:	0028 
    1cba:	2579 0000 5680 	move.l 5680 <ClsSprites+0x2c>,44(a2)
    1cc0:	002c 
    1cc2:	2579 0000 5684 	move.l 5684 <ClsSprites+0x30>,48(a2)
    1cc8:	0030 
    1cca:	2579 0000 5688 	move.l 5688 <ClsSprites+0x34>,52(a2)
    1cd0:	0034 
    1cd2:	2579 0000 568c 	move.l 568c <ClsSprites+0x38>,56(a2)
    1cd8:	0038 
    1cda:	2579 0000 5690 	move.l 5690 <ClsSprites+0x3c>,60(a2)
    1ce0:	003c 
    *cl++ = *clpartinstruction++;
    1ce2:	2579 0000 55ec 	move.l 55ec <ClScreenZoom>,64(a2)
    1ce8:	0040 
    1cea:	2579 0000 55f0 	move.l 55f0 <ClScreenZoom+0x4>,68(a2)
    1cf0:	0044 
    1cf2:	2579 0000 55f4 	move.l 55f4 <ClScreenZoom+0x8>,72(a2)
    1cf8:	0048 
    1cfa:	2579 0000 55f8 	move.l 55f8 <ClScreenZoom+0xc>,76(a2)
    1d00:	004c 
    1d02:	2579 0000 55fc 	move.l 55fc <ClScreenZoom+0x10>,80(a2)
    1d08:	0050 
    1d0a:	2579 0000 5600 	move.l 5600 <ClScreenZoom+0x14>,84(a2)
    1d10:	0054 
    1d12:	2579 0000 5604 	move.l 5604 <ClScreenZoom+0x18>,88(a2)
    1d18:	0058 
    1d1a:	2579 0000 5608 	move.l 5608 <ClScreenZoom+0x1c>,92(a2)
    1d20:	005c 
    1d22:	2579 0000 560c 	move.l 560c <ClScreenZoom+0x20>,96(a2)
    1d28:	0060 
    1d2a:	2579 0000 5610 	move.l 5610 <ClScreenZoom+0x24>,100(a2)
    1d30:	0064 
    1d32:	2579 0000 5614 	move.l 5614 <ClScreenZoom+0x28>,104(a2)
    1d38:	0068 
    1d3a:	2579 0000 5618 	move.l 5618 <ClScreenZoom+0x2c>,108(a2)
    1d40:	006c 
  *cl++ = 0x00e00000;
    1d42:	257c 00e0 0000 	move.l #14680064,112(a2)
    1d48:	0070 
  *cl++ = 0x00e20000;
    1d4a:	257c 00e2 0000 	move.l #14811136,116(a2)
    1d50:	0074 
  *cl++ = 0x00e40000;
    1d52:	257c 00e4 0000 	move.l #14942208,120(a2)
    1d58:	0078 
  *cl++ = 0x00e60000;
    1d5a:	257c 00e6 0000 	move.l #15073280,124(a2)
    1d60:	007c 
    *cl++ = *clpartinstruction++;
    1d62:	2579 0000 561c 	move.l 561c <ClColor>,128(a2)
    1d68:	0080 
    1d6a:	2579 0000 5620 	move.l 5620 <ClColor+0x4>,132(a2)
    1d70:	0084 
    1d72:	43ea 012c      	lea 300(a2),a1
    1d76:	220a           	move.l a2,d1
    1d78:	0681 0000 a52c 	addi.l #42284,d1
    1d7e:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    1d84:	41e9 ff60      	lea -160(a1),a0
    1d88:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    1d8c:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    1d92:	5088           	addq.l #8,a0
    1d94:	217c 0182 0f00 	move.l #25300736,-4(a0)
    1d9a:	fffc 
    for(int i2=0;i2<20;i2++) {
    1d9c:	b3c8           	cmpa.l a0,a1
    1d9e:	66ec           	bne.s 1d8c <ClbuildZoom+0x146>
    1da0:	43e8 00a4      	lea 164(a0),a1
    1da4:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    1daa:	b3c1           	cmpa.l d1,a1
    1dac:	66d6           	bne.s 1d84 <ClbuildZoom+0x13e>
   *cl = 0xfffffffe;
    1dae:	203c 0000 a488 	move.l #42120,d0
    1db4:	72fe           	moveq #-2,d1
    1db6:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    1dba:	200a           	move.l a2,d0
    1dbc:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1dc0:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1dc2:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    1dc8:	4eae ffc4      	jsr -60(a6)
    1dcc:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    1dd2:	2200           	move.l d0,d1
    1dd4:	243c 0000 2dc7 	move.l #11719,d2
    1dda:	7628           	moveq #40,d3
    1ddc:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1de0:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    1de6:	7201           	moveq #1,d1
    1de8:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1dec:	24b9 0000 5654 	move.l 5654 <ClsSprites>,(a2)
    1df2:	2579 0000 5658 	move.l 5658 <ClsSprites+0x4>,4(a2)
    1df8:	0004 
    1dfa:	2579 0000 565c 	move.l 565c <ClsSprites+0x8>,8(a2)
    1e00:	0008 
    1e02:	2579 0000 5660 	move.l 5660 <ClsSprites+0xc>,12(a2)
    1e08:	000c 
    1e0a:	2579 0000 5664 	move.l 5664 <ClsSprites+0x10>,16(a2)
    1e10:	0010 
    1e12:	2579 0000 5668 	move.l 5668 <ClsSprites+0x14>,20(a2)
    1e18:	0014 
    1e1a:	2579 0000 566c 	move.l 566c <ClsSprites+0x18>,24(a2)
    1e20:	0018 
    1e22:	2579 0000 5670 	move.l 5670 <ClsSprites+0x1c>,28(a2)
    1e28:	001c 
    1e2a:	2579 0000 5674 	move.l 5674 <ClsSprites+0x20>,32(a2)
    1e30:	0020 
    1e32:	2579 0000 5678 	move.l 5678 <ClsSprites+0x24>,36(a2)
    1e38:	0024 
    1e3a:	2579 0000 567c 	move.l 567c <ClsSprites+0x28>,40(a2)
    1e40:	0028 
    1e42:	2579 0000 5680 	move.l 5680 <ClsSprites+0x2c>,44(a2)
    1e48:	002c 
    1e4a:	2579 0000 5684 	move.l 5684 <ClsSprites+0x30>,48(a2)
    1e50:	0030 
    1e52:	2579 0000 5688 	move.l 5688 <ClsSprites+0x34>,52(a2)
    1e58:	0034 
    1e5a:	2579 0000 568c 	move.l 568c <ClsSprites+0x38>,56(a2)
    1e60:	0038 
    1e62:	2579 0000 5690 	move.l 5690 <ClsSprites+0x3c>,60(a2)
    1e68:	003c 
    *cl++ = *clpartinstruction++;
    1e6a:	2579 0000 55ec 	move.l 55ec <ClScreenZoom>,64(a2)
    1e70:	0040 
    1e72:	2579 0000 55f0 	move.l 55f0 <ClScreenZoom+0x4>,68(a2)
    1e78:	0044 
    1e7a:	2579 0000 55f4 	move.l 55f4 <ClScreenZoom+0x8>,72(a2)
    1e80:	0048 
    1e82:	2579 0000 55f8 	move.l 55f8 <ClScreenZoom+0xc>,76(a2)
    1e88:	004c 
    1e8a:	2579 0000 55fc 	move.l 55fc <ClScreenZoom+0x10>,80(a2)
    1e90:	0050 
    1e92:	2579 0000 5600 	move.l 5600 <ClScreenZoom+0x14>,84(a2)
    1e98:	0054 
    1e9a:	2579 0000 5604 	move.l 5604 <ClScreenZoom+0x18>,88(a2)
    1ea0:	0058 
    1ea2:	2579 0000 5608 	move.l 5608 <ClScreenZoom+0x1c>,92(a2)
    1ea8:	005c 
    1eaa:	2579 0000 560c 	move.l 560c <ClScreenZoom+0x20>,96(a2)
    1eb0:	0060 
    1eb2:	2579 0000 5610 	move.l 5610 <ClScreenZoom+0x24>,100(a2)
    1eb8:	0064 
    1eba:	2579 0000 5614 	move.l 5614 <ClScreenZoom+0x28>,104(a2)
    1ec0:	0068 
    1ec2:	2579 0000 5618 	move.l 5618 <ClScreenZoom+0x2c>,108(a2)
    1ec8:	006c 
  *cl++ = 0x00e00000;
    1eca:	257c 00e0 0000 	move.l #14680064,112(a2)
    1ed0:	0070 
  *cl++ = 0x00e20000;
    1ed2:	257c 00e2 0000 	move.l #14811136,116(a2)
    1ed8:	0074 
  *cl++ = 0x00e40000;
    1eda:	257c 00e4 0000 	move.l #14942208,120(a2)
    1ee0:	0078 
  *cl++ = 0x00e60000;
    1ee2:	257c 00e6 0000 	move.l #15073280,124(a2)
    1ee8:	007c 
    *cl++ = *clpartinstruction++;
    1eea:	2579 0000 561c 	move.l 561c <ClColor>,128(a2)
    1ef0:	0080 
    1ef2:	2579 0000 5620 	move.l 5620 <ClColor+0x4>,132(a2)
    1ef8:	0084 
    1efa:	43ea 012c      	lea 300(a2),a1
    1efe:	220a           	move.l a2,d1
    1f00:	0681 0000 a52c 	addi.l #42284,d1
    1f06:	203c 2c07 fffe 	move.l #738721790,d0
    1f0c:	6000 fe76      	bra.w 1d84 <ClbuildZoom+0x13e>

00001f10 <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    1f10:	2039 0000 56fe 	move.l 56fe <DrawCopper>,d0
  DrawCopper = ViewCopper;
    1f16:	23f9 0000 56f2 	move.l 56f2 <ViewCopper>,56fe <DrawCopper>
    1f1c:	0000 56fe 
  ViewCopper = (ULONG *)tmp;
    1f20:	23c0 0000 56f2 	move.l d0,56f2 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    1f26:	2079 0000 56ee 	movea.l 56ee <hw>,a0
    1f2c:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    1f30:	3140 0088      	move.w d0,136(a0)
}
    1f34:	4e75           	rts

00001f36 <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    1f36:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    1f3a:	45fa fd0a      	lea 1c46 <ClbuildZoom>(pc),a2
    1f3e:	4e92           	jsr (a2)
    1f40:	23c0 0000 5712 	move.l d0,5712 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    1f46:	4e92           	jsr (a2)
    1f48:	23c0 0000 570e 	move.l d0,570e <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1f4e:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    1f54:	203c 0001 4a00 	move.l #84480,d0
    1f5a:	7202           	moveq #2,d1
    1f5c:	4eae ff3a      	jsr -198(a6)
    1f60:	23c0 0000 570a 	move.l d0,570a <Bitplane1>
  if(Bitplane1 == 0) {
    1f66:	6700 014e      	beq.w 20b6 <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    1f6a:	23c0 0000 5702 	move.l d0,5702 <DrawBuffer>
  DrawCopper = Copperlist1;
    1f70:	23f9 0000 5712 	move.l 5712 <Copperlist1>,56fe <DrawCopper>
    1f76:	0000 56fe 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1f7a:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    1f80:	203c 0001 4a00 	move.l #84480,d0
    1f86:	7202           	moveq #2,d1
    1f88:	4eae ff3a      	jsr -198(a6)
    1f8c:	2400           	move.l d0,d2
    1f8e:	23c0 0000 56fa 	move.l d0,56fa <Bitplane2>
  if(Bitplane2 == 0) {
    1f94:	6778           	beq.s 200e <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    1f96:	23f9 0000 570e 	move.l 570e <Copperlist2>,56f2 <ViewCopper>
    1f9c:	0000 56f2 
  SwapCl();
    1fa0:	45fa ff6e      	lea 1f10 <SwapCl>(pc),a2
    1fa4:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    1fa6:	2039 0000 5702 	move.l 5702 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    1fac:	2079 0000 56fe 	movea.l 56fe <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    1fb2:	2200           	move.l d0,d1
    1fb4:	4241           	clr.w d1
    1fb6:	4841           	swap d1
    1fb8:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    1fbc:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    1fc0:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    1fc6:	2200           	move.l d0,d1
    1fc8:	4241           	clr.w d1
    1fca:	4841           	swap d1
    1fcc:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    1fd0:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    1fd4:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    1fd6:	2079 0000 56fe 	movea.l 56fe <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    1fdc:	2002           	move.l d2,d0
    1fde:	4240           	clr.w d0
    1fe0:	4840           	swap d0
    1fe2:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    1fe6:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    1fea:	2002           	move.l d2,d0
    1fec:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    1ff2:	2200           	move.l d0,d1
    1ff4:	4241           	clr.w d1
    1ff6:	4841           	swap d1
    1ff8:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    1ffc:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    2000:	23c2 0000 56f6 	move.l d2,56f6 <ViewBuffer>
}
    2006:	7000           	moveq #0,d0
    2008:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    200c:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    200e:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    2014:	4eae ffc4      	jsr -60(a6)
    2018:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    201e:	2200           	move.l d0,d1
    2020:	243c 0000 2e14 	move.l #11796,d2
    2026:	7626           	moveq #38,d3
    2028:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    202c:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    2032:	7201           	moveq #1,d1
    2034:	4eae ff70      	jsr -144(a6)
    2038:	2439 0000 56fa 	move.l 56fa <Bitplane2>,d2
  ViewCopper = Copperlist2;
    203e:	23f9 0000 570e 	move.l 570e <Copperlist2>,56f2 <ViewCopper>
    2044:	0000 56f2 
  SwapCl();
    2048:	45fa fec6      	lea 1f10 <SwapCl>(pc),a2
    204c:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    204e:	2039 0000 5702 	move.l 5702 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    2054:	2079 0000 56fe 	movea.l 56fe <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    205a:	2200           	move.l d0,d1
    205c:	4241           	clr.w d1
    205e:	4841           	swap d1
    2060:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    2064:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    2068:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    206e:	2200           	move.l d0,d1
    2070:	4241           	clr.w d1
    2072:	4841           	swap d1
    2074:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2078:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    207c:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    207e:	2079 0000 56fe 	movea.l 56fe <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    2084:	2002           	move.l d2,d0
    2086:	4240           	clr.w d0
    2088:	4840           	swap d0
    208a:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    208e:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    2092:	2002           	move.l d2,d0
    2094:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    209a:	2200           	move.l d0,d1
    209c:	4241           	clr.w d1
    209e:	4841           	swap d1
    20a0:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    20a4:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    20a8:	23c2 0000 56f6 	move.l d2,56f6 <ViewBuffer>
}
    20ae:	7000           	moveq #0,d0
    20b0:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    20b4:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    20b6:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    20bc:	4eae ffc4      	jsr -60(a6)
    20c0:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    20c6:	2200           	move.l d0,d1
    20c8:	243c 0000 2ded 	move.l #11757,d2
    20ce:	7626           	moveq #38,d3
    20d0:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    20d4:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    20da:	7201           	moveq #1,d1
    20dc:	4eae ff70      	jsr -144(a6)
    20e0:	2039 0000 570a 	move.l 570a <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    20e6:	23c0 0000 5702 	move.l d0,5702 <DrawBuffer>
  DrawCopper = Copperlist1;
    20ec:	23f9 0000 5712 	move.l 5712 <Copperlist1>,56fe <DrawCopper>
    20f2:	0000 56fe 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    20f6:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    20fc:	203c 0001 4a00 	move.l #84480,d0
    2102:	7202           	moveq #2,d1
    2104:	4eae ff3a      	jsr -198(a6)
    2108:	2400           	move.l d0,d2
    210a:	23c0 0000 56fa 	move.l d0,56fa <Bitplane2>
  if(Bitplane2 == 0) {
    2110:	6600 fe84      	bne.w 1f96 <PrepareDisplayZoom+0x60>
    2114:	6000 fef8      	bra.w 200e <PrepareDisplayZoom+0xd8>

00002118 <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    2118:	2039 0000 5702 	move.l 5702 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    211e:	2079 0000 56fe 	movea.l 56fe <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    2124:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    2128:	2200           	move.l d0,d1
    212a:	4241           	clr.w d1
    212c:	4841           	swap d1
    212e:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    2132:	23f9 0000 56f6 	move.l 56f6 <ViewBuffer>,5702 <DrawBuffer>
    2138:	0000 5702 
  ViewBuffer = (ULONG *) tmp;
    213c:	23c0 0000 56f6 	move.l d0,56f6 <ViewBuffer>
}
    2142:	4e75           	rts

00002144 <PrepareDisplay>:
 int PrepareDisplaySW() {
    2144:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClbuildSW();
    2148:	45fa f89e      	lea 19e8 <ClBuild>(pc),a2
    214c:	4e92           	jsr (a2)
    214e:	23c0 0000 5712 	move.l d0,5712 <Copperlist1>
  Copperlist2 = ClbuildSW();
    2154:	4e92           	jsr (a2)
    2156:	23c0 0000 570e 	move.l d0,570e <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    215c:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    2162:	203c 0000 c800 	move.l #51200,d0
    2168:	7202           	moveq #2,d1
    216a:	4eae ff3a      	jsr -198(a6)
    216e:	23c0 0000 570a 	move.l d0,570a <Bitplane1>
  if(Bitplane1 == 0) {
    2174:	6700 00ac      	beq.w 2222 <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    2178:	23c0 0000 5702 	move.l d0,5702 <DrawBuffer>
  DrawCopper = Copperlist1;
    217e:	23f9 0000 5712 	move.l 5712 <Copperlist1>,56fe <DrawCopper>
    2184:	0000 56fe 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    2188:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    218e:	203c 0000 c800 	move.l #51200,d0
    2194:	7202           	moveq #2,d1
    2196:	4eae ff3a      	jsr -198(a6)
    219a:	23c0 0000 56fa 	move.l d0,56fa <Bitplane2>
  if(Bitplane2 == 0) {
    21a0:	6728           	beq.s 21ca <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    21a2:	23c0 0000 56f6 	move.l d0,56f6 <ViewBuffer>
  ViewCopper = Copperlist2;
    21a8:	23f9 0000 570e 	move.l 570e <Copperlist2>,56f2 <ViewCopper>
    21ae:	0000 56f2 
  SwapCl();
    21b2:	47fa fd5c      	lea 1f10 <SwapCl>(pc),a3
    21b6:	4e93           	jsr (a3)
  SetBplPointers();
    21b8:	45fa ff5e      	lea 2118 <SetBplPointers>(pc),a2
    21bc:	4e92           	jsr (a2)
  SwapCl();
    21be:	4e93           	jsr (a3)
  SetBplPointers();
    21c0:	4e92           	jsr (a2)
}
    21c2:	7000           	moveq #0,d0
    21c4:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    21c8:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    21ca:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    21d0:	4eae ffc4      	jsr -60(a6)
    21d4:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    21da:	2200           	move.l d0,d1
    21dc:	243c 0000 2e14 	move.l #11796,d2
    21e2:	7626           	moveq #38,d3
    21e4:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    21e8:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    21ee:	7201           	moveq #1,d1
    21f0:	4eae ff70      	jsr -144(a6)
    21f4:	2039 0000 56fa 	move.l 56fa <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    21fa:	23c0 0000 56f6 	move.l d0,56f6 <ViewBuffer>
  ViewCopper = Copperlist2;
    2200:	23f9 0000 570e 	move.l 570e <Copperlist2>,56f2 <ViewCopper>
    2206:	0000 56f2 
  SwapCl();
    220a:	47fa fd04      	lea 1f10 <SwapCl>(pc),a3
    220e:	4e93           	jsr (a3)
  SetBplPointers();
    2210:	45fa ff06      	lea 2118 <SetBplPointers>(pc),a2
    2214:	4e92           	jsr (a2)
  SwapCl();
    2216:	4e93           	jsr (a3)
  SetBplPointers();
    2218:	4e92           	jsr (a2)
}
    221a:	7000           	moveq #0,d0
    221c:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    2220:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    2222:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    2228:	4eae ffc4      	jsr -60(a6)
    222c:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    2232:	2200           	move.l d0,d1
    2234:	243c 0000 2ded 	move.l #11757,d2
    223a:	7626           	moveq #38,d3
    223c:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2240:	2c79 0000 5706 	movea.l 5706 <DOSBase>,a6
    2246:	7201           	moveq #1,d1
    2248:	4eae ff70      	jsr -144(a6)
    224c:	2039 0000 570a 	move.l 570a <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    2252:	23c0 0000 5702 	move.l d0,5702 <DrawBuffer>
  DrawCopper = Copperlist1;
    2258:	23f9 0000 5712 	move.l 5712 <Copperlist1>,56fe <DrawCopper>
    225e:	0000 56fe 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    2262:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    2268:	203c 0000 c800 	move.l #51200,d0
    226e:	7202           	moveq #2,d1
    2270:	4eae ff3a      	jsr -198(a6)
    2274:	23c0 0000 56fa 	move.l d0,56fa <Bitplane2>
  if(Bitplane2 == 0) {
    227a:	6600 ff26      	bne.w 21a2 <PrepareDisplay+0x5e>
    227e:	6000 ff4a      	bra.w 21ca <PrepareDisplay+0x86>

00002282 <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    2282:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    2286:	262f 0010      	move.l 16(sp),d3
    228a:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    228e:	2279 0000 5712 	movea.l 5712 <Copperlist1>,a1
    2294:	b2fc 0000      	cmpa.w #0,a1
    2298:	670c           	beq.s 22a6 <FreeDisplay+0x24>
    229a:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    22a0:	2003           	move.l d3,d0
    22a2:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    22a6:	2279 0000 570e 	movea.l 570e <Copperlist2>,a1
    22ac:	b2fc 0000      	cmpa.w #0,a1
    22b0:	670c           	beq.s 22be <FreeDisplay+0x3c>
    22b2:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    22b8:	2003           	move.l d3,d0
    22ba:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    22be:	2279 0000 570a 	movea.l 570a <Bitplane1>,a1
    22c4:	b2fc 0000      	cmpa.w #0,a1
    22c8:	670c           	beq.s 22d6 <FreeDisplay+0x54>
    22ca:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    22d0:	2002           	move.l d2,d0
    22d2:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    22d6:	2279 0000 56fa 	movea.l 56fa <Bitplane2>,a1
    22dc:	b2fc 0000      	cmpa.w #0,a1
    22e0:	670c           	beq.s 22ee <FreeDisplay+0x6c>
    22e2:	2c79 0000 5716 	movea.l 5716 <SysBase>,a6
    22e8:	2002           	move.l d2,d0
    22ea:	4eae ff2e      	jsr -210(a6)
}
    22ee:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    22f2:	4e75           	rts

000022f4 <WaitVbl>:
void WaitVbl() {
    22f4:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    22f6:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddc232>,d0
    22fc:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    22fe:	2017           	move.l (sp),d0
    2300:	0280 0001 ff00 	andi.l #130816,d0
    2306:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    2308:	2017           	move.l (sp),d0
    230a:	0c80 0001 3700 	cmpi.l #79616,d0
    2310:	67e4           	beq.s 22f6 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    2312:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddc232>,d0
    2318:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    231c:	202f 0004      	move.l 4(sp),d0
    2320:	0280 0001 ff00 	andi.l #130816,d0
    2326:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    232a:	202f 0004      	move.l 4(sp),d0
    232e:	0c80 0001 3700 	cmpi.l #79616,d0
    2334:	66dc           	bne.s 2312 <WaitVbl+0x1e>
}
    2336:	508f           	addq.l #8,sp
    2338:	4e75           	rts

0000233a <memcpy>:
{
    233a:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    233e:	202f 0014      	move.l 20(sp),d0
    2342:	226f 0018      	movea.l 24(sp),a1
    2346:	222f 001c      	move.l 28(sp),d1
	while(len--)
    234a:	2601           	move.l d1,d3
    234c:	5383           	subq.l #1,d3
    234e:	4a81           	tst.l d1
    2350:	6762           	beq.s 23b4 <memcpy+0x7a>
    2352:	2040           	movea.l d0,a0
    2354:	5888           	addq.l #4,a0
    2356:	b1c9           	cmpa.l a1,a0
    2358:	53c2           	sl.s d2
    235a:	4402           	neg.b d2
    235c:	41e9 0004      	lea 4(a1),a0
    2360:	b1c0           	cmpa.l d0,a0
    2362:	53c4           	sl.s d4
    2364:	4404           	neg.b d4
    2366:	8404           	or.b d4,d2
    2368:	7808           	moveq #8,d4
    236a:	b883           	cmp.l d3,d4
    236c:	55c4           	sc.s d4
    236e:	4404           	neg.b d4
    2370:	c404           	and.b d4,d2
    2372:	6746           	beq.s 23ba <memcpy+0x80>
    2374:	2409           	move.l a1,d2
    2376:	8480           	or.l d0,d2
    2378:	7803           	moveq #3,d4
    237a:	c484           	and.l d4,d2
    237c:	663c           	bne.s 23ba <memcpy+0x80>
    237e:	2049           	movea.l a1,a0
    2380:	2440           	movea.l d0,a2
    2382:	74fc           	moveq #-4,d2
    2384:	c481           	and.l d1,d2
    2386:	d489           	add.l a1,d2
		*d++ = *s++;
    2388:	24d8           	move.l (a0)+,(a2)+
    238a:	b488           	cmp.l a0,d2
    238c:	66fa           	bne.s 2388 <memcpy+0x4e>
    238e:	74fc           	moveq #-4,d2
    2390:	c481           	and.l d1,d2
    2392:	2040           	movea.l d0,a0
    2394:	d1c2           	adda.l d2,a0
    2396:	d3c2           	adda.l d2,a1
    2398:	9682           	sub.l d2,d3
    239a:	b481           	cmp.l d1,d2
    239c:	6716           	beq.s 23b4 <memcpy+0x7a>
    239e:	1091           	move.b (a1),(a0)
	while(len--)
    23a0:	4a83           	tst.l d3
    23a2:	6710           	beq.s 23b4 <memcpy+0x7a>
		*d++ = *s++;
    23a4:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    23aa:	5383           	subq.l #1,d3
    23ac:	6706           	beq.s 23b4 <memcpy+0x7a>
		*d++ = *s++;
    23ae:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    23b4:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    23b8:	4e75           	rts
    23ba:	2040           	movea.l d0,a0
    23bc:	d289           	add.l a1,d1
		*d++ = *s++;
    23be:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    23c0:	b289           	cmp.l a1,d1
    23c2:	67f0           	beq.s 23b4 <memcpy+0x7a>
		*d++ = *s++;
    23c4:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    23c6:	b289           	cmp.l a1,d1
    23c8:	66f4           	bne.s 23be <memcpy+0x84>
    23ca:	60e8           	bra.s 23b4 <memcpy+0x7a>

000023cc <memset>:
{
    23cc:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    23d0:	202f 0024      	move.l 36(sp),d0
    23d4:	2a2f 0028      	move.l 40(sp),d5
    23d8:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    23dc:	2809           	move.l a1,d4
    23de:	5384           	subq.l #1,d4
    23e0:	b2fc 0000      	cmpa.w #0,a1
    23e4:	6f00 00b0      	ble.w 2496 <memset+0xca>
    23e8:	1e05           	move.b d5,d7
    23ea:	2200           	move.l d0,d1
    23ec:	4481           	neg.l d1
    23ee:	7403           	moveq #3,d2
    23f0:	c282           	and.l d2,d1
    23f2:	7c05           	moveq #5,d6
		*ptr++ = val;
    23f4:	2440           	movea.l d0,a2
    23f6:	bc84           	cmp.l d4,d6
    23f8:	646a           	bcc.s 2464 <memset+0x98>
    23fa:	4a81           	tst.l d1
    23fc:	6724           	beq.s 2422 <memset+0x56>
    23fe:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    2400:	5384           	subq.l #1,d4
    2402:	7401           	moveq #1,d2
    2404:	b481           	cmp.l d1,d2
    2406:	671a           	beq.s 2422 <memset+0x56>
		*ptr++ = val;
    2408:	2440           	movea.l d0,a2
    240a:	548a           	addq.l #2,a2
    240c:	2040           	movea.l d0,a0
    240e:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    2412:	5384           	subq.l #1,d4
    2414:	7403           	moveq #3,d2
    2416:	b481           	cmp.l d1,d2
    2418:	6608           	bne.s 2422 <memset+0x56>
		*ptr++ = val;
    241a:	528a           	addq.l #1,a2
    241c:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    2420:	5384           	subq.l #1,d4
    2422:	2609           	move.l a1,d3
    2424:	9681           	sub.l d1,d3
    2426:	7c00           	moveq #0,d6
    2428:	1c05           	move.b d5,d6
    242a:	2406           	move.l d6,d2
    242c:	4842           	swap d2
    242e:	4242           	clr.w d2
    2430:	2042           	movea.l d2,a0
    2432:	2406           	move.l d6,d2
    2434:	e14a           	lsl.w #8,d2
    2436:	4842           	swap d2
    2438:	4242           	clr.w d2
    243a:	e18e           	lsl.l #8,d6
    243c:	2646           	movea.l d6,a3
    243e:	2c08           	move.l a0,d6
    2440:	8486           	or.l d6,d2
    2442:	2c0b           	move.l a3,d6
    2444:	8486           	or.l d6,d2
    2446:	1407           	move.b d7,d2
    2448:	2040           	movea.l d0,a0
    244a:	d1c1           	adda.l d1,a0
    244c:	72fc           	moveq #-4,d1
    244e:	c283           	and.l d3,d1
    2450:	d288           	add.l a0,d1
		*ptr++ = val;
    2452:	20c2           	move.l d2,(a0)+
    2454:	b1c1           	cmpa.l d1,a0
    2456:	66fa           	bne.s 2452 <memset+0x86>
    2458:	72fc           	moveq #-4,d1
    245a:	c283           	and.l d3,d1
    245c:	d5c1           	adda.l d1,a2
    245e:	9881           	sub.l d1,d4
    2460:	b283           	cmp.l d3,d1
    2462:	6732           	beq.s 2496 <memset+0xca>
    2464:	1485           	move.b d5,(a2)
	while(len-- > 0)
    2466:	4a84           	tst.l d4
    2468:	6f2c           	ble.s 2496 <memset+0xca>
		*ptr++ = val;
    246a:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    246e:	7201           	moveq #1,d1
    2470:	b284           	cmp.l d4,d1
    2472:	6c22           	bge.s 2496 <memset+0xca>
		*ptr++ = val;
    2474:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    2478:	7402           	moveq #2,d2
    247a:	b484           	cmp.l d4,d2
    247c:	6c18           	bge.s 2496 <memset+0xca>
		*ptr++ = val;
    247e:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    2482:	7c03           	moveq #3,d6
    2484:	bc84           	cmp.l d4,d6
    2486:	6c0e           	bge.s 2496 <memset+0xca>
		*ptr++ = val;
    2488:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    248c:	7204           	moveq #4,d1
    248e:	b284           	cmp.l d4,d1
    2490:	6c04           	bge.s 2496 <memset+0xca>
		*ptr++ = val;
    2492:	1545 0005      	move.b d5,5(a2)
}
    2496:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    249a:	4e75           	rts

0000249c <strlen>:
{
    249c:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    24a0:	7000           	moveq #0,d0
	while(*s++)
    24a2:	4a10           	tst.b (a0)
    24a4:	6708           	beq.s 24ae <strlen+0x12>
		t++;
    24a6:	5280           	addq.l #1,d0
	while(*s++)
    24a8:	4a30 0800      	tst.b (0,a0,d0.l)
    24ac:	66f8           	bne.s 24a6 <strlen+0xa>
}
    24ae:	4e75           	rts

000024b0 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    24b0:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    24b4:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    24b8:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    24bc:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    24c0:	d041           	add.w d1,d0
	swap	d0
    24c2:	4840           	swap d0
	clrw	d0
    24c4:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    24c6:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    24ca:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    24ce:	d081           	add.l d1,d0

	rts
    24d0:	4e75           	rts

000024d2 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    24d2:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    24d4:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    24d8:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    24dc:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    24e2:	6416           	bcc.s 24fa <__udivsi3+0x28>
	movel	d0, d2
    24e4:	2400           	move.l d0,d2
	clrw	d2
    24e6:	4242           	clr.w d2
	swap	d2
    24e8:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    24ea:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    24ec:	3002           	move.w d2,d0
	swap	d0
    24ee:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    24f0:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    24f4:	84c1           	divu.w d1,d2
	movew	d2, d0
    24f6:	3002           	move.w d2,d0
	jra	6f
    24f8:	6030           	bra.s 252a <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    24fa:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    24fc:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    24fe:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    2500:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    2506:	64f4           	bcc.s 24fc <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    2508:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    250a:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    2510:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    2512:	c2c0           	mulu.w d0,d1
	swap	d2
    2514:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    2516:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    2518:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    251a:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    251c:	660a           	bne.s 2528 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    251e:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    2520:	6506           	bcs.s 2528 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    2522:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    2526:	6302           	bls.s 252a <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    2528:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    252a:	241f           	move.l (sp)+,d2
	rts
    252c:	4e75           	rts

0000252e <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    252e:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    2530:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    2532:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    2536:	6a04           	bpl.s 253c <__divsi3+0xe>
	negl	d1
    2538:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    253a:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    253c:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    2540:	6a04           	bpl.s 2546 <__divsi3+0x18>
	negl	d0
    2542:	4480           	neg.l d0
	negb	d2
    2544:	4402           	neg.b d2

2:	movel	d1, sp@-
    2546:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2548:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    254a:	6186           	bsr.s 24d2 <__udivsi3>
	addql	IMM (8), sp
    254c:	508f           	addq.l #8,sp

	tstb	d2
    254e:	4a02           	tst.b d2
	jpl	3f
    2550:	6a02           	bpl.s 2554 <__divsi3+0x26>
	negl	d0
    2552:	4480           	neg.l d0

3:	movel	sp@+, d2
    2554:	241f           	move.l (sp)+,d2
	rts
    2556:	4e75           	rts

00002558 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    2558:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    255c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    2560:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2562:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    2564:	61c8           	bsr.s 252e <__divsi3>
	addql	IMM (8), sp
    2566:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    2568:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    256c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    256e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    2570:	6100 ff3e      	bsr.w 24b0 <__mulsi3>
	addql	IMM (8), sp
    2574:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    2576:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    257a:	9280           	sub.l d0,d1
	movel	d1, d0
    257c:	2001           	move.l d1,d0
	rts
    257e:	4e75           	rts

00002580 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    2580:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    2584:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    2588:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    258a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    258c:	6100 ff44      	bsr.w 24d2 <__udivsi3>
	addql	IMM (8), sp
    2590:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    2592:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    2596:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2598:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    259a:	6100 ff14      	bsr.w 24b0 <__mulsi3>
	addql	IMM (8), sp
    259e:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    25a0:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    25a4:	9280           	sub.l d0,d1
	movel	d1, d0
    25a6:	2001           	move.l d1,d0
	rts
    25a8:	4e75           	rts

000025aa <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    25aa:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    25ac:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    25b0:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    25b4:	2c5f           	movea.l (sp)+,a6
    rts
    25b6:	4e75           	rts

000025b8 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    25b8:	16c0           	move.b d0,(a3)+
	rts
    25ba:	4e75           	rts

000025bc <saveregs>:
	...

000025f8 <font2distance>:
    25f8:	0505           	btst d2,d5
    25fa:	0505           	btst d2,d5
    25fc:	0505           	btst d2,d5
    25fe:	0505           	btst d2,d5
    2600:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    2602:	0505           	btst d2,d5
    2604:	0505           	btst d2,d5
    2606:	0005 0505      	ori.b #5,d5
    260a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    260c:	0505           	btst d2,d5
    260e:	0505           	btst d2,d5
    2610:	0505           	btst d2,d5
    2612:	0505           	btst d2,d5
    2614:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    2616:	0505           	btst d2,d5
    2618:	0505           	btst d2,d5
    261a:	0505           	btst d2,d5
    261c:	0505           	btst d2,d5
    261e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    2620:	0500           	btst d2,d0
    2622:	0505           	btst d2,d5
    2624:	0505           	btst d2,d5
    2626:	0505           	btst d2,d5
    2628:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    262a:	0505           	btst d2,d5
    262c:	0505           	btst d2,d5
    262e:	0505           	btst d2,d5
    2630:	0505           	btst d2,d5
    2632:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    2634:	0505           	btst d2,d5
    2636:	0505           	btst d2,d5
    2638:	0503           	btst d2,d3
    263a:	0505           	btst d2,d5
    263c:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    263e:	0505           	btst d2,d5
    2640:	0500           	btst d2,d0
    2642:	0505           	btst d2,d5
    2644:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    2648:	0505           	btst d2,d5
    264a:	0503           	btst d2,d3
    264c:	0205 0507      	andi.b #7,d5
    2650:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    2652:	0505           	btst d2,d5
    2654:	0505           	btst d2,d5
    2656:	0505           	btst d2,d5
    2658:	0505           	btst d2,d5
    265a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    265c:	0505           	btst d2,d5
    265e:	0505           	btst d2,d5
    2660:	0505           	btst d2,d5
    2662:	0505           	btst d2,d5
    2664:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2666:	0505           	btst d2,d5
    2668:	0505           	btst d2,d5
    266a:	0505           	btst d2,d5
    266c:	0505           	btst d2,d5
    266e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2670:	0505           	btst d2,d5
    2672:	0505           	btst d2,d5
    2674:	0505           	btst d2,d5
    2676:	0505           	btst d2,d5
    2678:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    267a:	0505           	btst d2,d5
    267c:	0505           	btst d2,d5
    267e:	0505           	btst d2,d5
    2680:	0505           	btst d2,d5
    2682:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2684:	0505           	btst d2,d5
    2686:	0505           	btst d2,d5
    2688:	0505           	btst d2,d5
    268a:	0505           	btst d2,d5
    268c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    268e:	0505           	btst d2,d5
    2690:	0505           	btst d2,d5
    2692:	0505           	btst d2,d5
    2694:	0505           	btst d2,d5
    2696:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2698:	0505           	btst d2,d5
    269a:	0505           	btst d2,d5
    269c:	0505           	btst d2,d5
    269e:	0505           	btst d2,d5
    26a0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    26a2:	0505           	btst d2,d5
    26a4:	0505           	btst d2,d5
    26a6:	0505           	btst d2,d5
    26a8:	0505           	btst d2,d5
    26aa:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    26ac:	0505           	btst d2,d5
    26ae:	0505           	btst d2,d5
    26b0:	0505           	btst d2,d5
    26b2:	0505           	btst d2,d5
    26b4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    26b6:	0505           	btst d2,d5
    26b8:	0505           	btst d2,d5
    26ba:	0505           	btst d2,d5
    26bc:	0505           	btst d2,d5
    26be:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    26c0:	0505           	btst d2,d5
    26c2:	0505           	btst d2,d5
    26c4:	0505           	btst d2,d5
    26c6:	0505           	btst d2,d5
    26c8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    26ca:	0505           	btst d2,d5
    26cc:	0505           	btst d2,d5
    26ce:	0505           	btst d2,d5
    26d0:	0505           	btst d2,d5
    26d2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    26d4:	0505           	btst d2,d5
    26d6:	0505           	btst d2,d5
    26d8:	0505           	btst d2,d5
    26da:	0505           	btst d2,d5
    26dc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    26de:	0505           	btst d2,d5
    26e0:	0505           	btst d2,d5
    26e2:	0505           	btst d2,d5
    26e4:	0505           	btst d2,d5
    26e6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    26e8:	0505           	btst d2,d5
    26ea:	0505           	btst d2,d5
    26ec:	0505           	btst d2,d5
    26ee:	0505           	btst d2,d5
    26f0:	0505           	btst d2,d5

000026f2 <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    26f2:	16c0           	move.b d0,(a3)+
  RTS
    26f4:	4e75           	rts

000026f6 <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    26f6:	48f9 7fff 0000 	movem.l d0-a6,25bc <saveregs>
    26fc:	25bc 
  lea 0xdff000,a5
    26fe:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddc22e>,a5
  move.l sp@(4),a0  //Fontlocation
    2704:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    2708:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    270c:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    2710:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    2712:	082d 0006 0002 	btst #6,2(a5)

00002718 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    2718:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    271e:	66f8           	bne.s 2718 <st2wblit>

00002720 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    2720:	7019           	moveq #25,d0
	sub.l d5,d5      
    2722:	9a85           	sub.l d5,d5

00002724 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    2724:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    2726:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    2728:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    272c:	9dce           	suba.l a6,a6
	move.l d2, a6
    272e:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    2730:	ddfc 0000 25f8 	adda.l #9720,a6

	LSL  	#4,d2 	    //Fetch next char
    2736:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    2738:	2842           	movea.l d2,a4


	move.l  #0,d4
    273a:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    273c:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    273e:	3814           	move.w (a4),d4
	swap	d4
    2740:	4844           	swap d4
	lsr.l	d5, d4
    2742:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    2744:	8993           	or.l d4,(a3)
	clr.l	d4
    2746:	4284           	clr.l d4
	move.w  2(a4), d4
    2748:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    274c:	4844           	swap d4
	lsr.l	d5, d4
    274e:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    2750:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    2754:	4284           	clr.l d4
	move.w  4(a4), d4
    2756:	382c 0004      	move.w 4(a4),d4
	swap	d4
    275a:	4844           	swap d4
	lsr.l	d5, d4
    275c:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    275e:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    2762:	4284           	clr.l d4
	move.w  6(a4), d4
    2764:	382c 0006      	move.w 6(a4),d4
	swap	d4
    2768:	4844           	swap d4
	lsr.l	d5, d4
    276a:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    276c:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    2770:	4284           	clr.l d4
	move.w  8(a4), d4
    2772:	382c 0008      	move.w 8(a4),d4
	swap	d4
    2776:	4844           	swap d4
	lsr.l	d5, d4
    2778:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    277a:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    277e:	4284           	clr.l d4
	move.w  10(a4), d4
    2780:	382c 000a      	move.w 10(a4),d4
	swap	d4
    2784:	4844           	swap d4
	lsr.l	d5, d4
    2786:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    2788:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    278c:	4284           	clr.l d4
	move.w  12(a4), d4
    278e:	382c 000c      	move.w 12(a4),d4
	swap	d4
    2792:	4844           	swap d4
	lsr.l	d5, d4
    2794:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    2796:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    279a:	4284           	clr.l d4
	move.w  14(a4), d4
    279c:	382c 000e      	move.w 14(a4),d4
	swap	d4
    27a0:	4844           	swap d4
	lsr.l	d5, d4
    27a2:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    27a4:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    27a8:	4284           	clr.l d4

	add.b   (a6), d5
    27aa:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    27ac:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    27b0:	6500 0006      	bcs.w 27b8 <noadditionalchar>
	addq.w  #1, a3
    27b4:	524b           	addq.w #1,a3
	sub.w   #8,d5
    27b6:	5145           	subq.w #8,d5

000027b8 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    27b8:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    27ba:	51c8 ff68      	dbf d0,2724 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    27be:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    27c2:	51cb ff5c      	dbf d3,2720 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    27c6:	4cfa 7fff fdf2 	movem.l 25bc <saveregs>(pc),d0-a6

	RTS
    27cc:	4e75           	rts
