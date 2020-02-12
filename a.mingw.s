
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
      12:	23ce 0000 563e 	move.l a6,563e <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,5616 <hw>
      1e:	0000 5616 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 2d63 	lea 2d63 <incbin_swfont_end+0xbd>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 5612 	move.l d0,5612 <GfxBase>
	if (!GfxBase)
      34:	6700 13fa      	beq.w 1430 <main+0x142a>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
      3e:	43f9 0000 2d74 	lea 2d74 <incbin_swfont_end+0xce>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 562e 	move.l d0,562e <DOSBase>
	if (!DOSBase)
      50:	6700 13d2      	beq.w 1424 <main+0x141e>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 2d80 	pea 2d80 <incbin_swfont_end+0xda>
      5a:	4eb9 0000 16b4 	jsr 16b4 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 2d9c 	move.l #11676,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      7e:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
      84:	4eae ffc4      	jsr -60(a6)
      88:	2079 0000 5616 	movea.l 5616 <hw>,a0
      8e:	2628 0080      	move.l 128(a0),d3
      92:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
      98:	2200           	move.l d0,d1
      9a:	243c 0000 2dac 	move.l #11692,d2
      a0:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      a4:	45f9 0000 1910 	lea 1910 <ClBuild>,a2
      aa:	4e92           	jsr (a2)
      ac:	2840           	movea.l d0,a4
      ae:	23c0 0000 563a 	move.l d0,563a <Copperlist1>
  DrawCopper = Copperlist1;
      b4:	23c0 0000 5626 	move.l d0,5626 <DrawCopper>
  Copperlist2 = ClBuild();
      ba:	4e92           	jsr (a2)
      bc:	23c0 0000 5636 	move.l d0,5636 <Copperlist2>
  ViewCopper = Copperlist2;
      c2:	23c0 0000 561a 	move.l d0,561a <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      c8:	588f           	addq.l #4,sp
      ca:	2014           	move.l (a4),d0
      cc:	b0b9 0000 557c 	cmp.l 557c <ClsSprites>,d0
      d2:	6600 1230      	bne.w 1304 <main+0x12fe>
      d6:	222c 0004      	move.l 4(a4),d1
      da:	b2b9 0000 5580 	cmp.l 5580 <ClsSprites+0x4>,d1
      e0:	6600 1222      	bne.w 1304 <main+0x12fe>
      e4:	206c 0008      	movea.l 8(a4),a0
      e8:	b1f9 0000 5584 	cmpa.l 5584 <ClsSprites+0x8>,a0
      ee:	6600 1214      	bne.w 1304 <main+0x12fe>
      f2:	202c 000c      	move.l 12(a4),d0
      f6:	b0b9 0000 5588 	cmp.l 5588 <ClsSprites+0xc>,d0
      fc:	6600 1206      	bne.w 1304 <main+0x12fe>
     100:	222c 0010      	move.l 16(a4),d1
     104:	b2b9 0000 558c 	cmp.l 558c <ClsSprites+0x10>,d1
     10a:	6600 11f8      	bne.w 1304 <main+0x12fe>
     10e:	206c 0014      	movea.l 20(a4),a0
     112:	b1f9 0000 5590 	cmpa.l 5590 <ClsSprites+0x14>,a0
     118:	6600 11ea      	bne.w 1304 <main+0x12fe>
     11c:	202c 0018      	move.l 24(a4),d0
     120:	b0b9 0000 5594 	cmp.l 5594 <ClsSprites+0x18>,d0
     126:	6600 11dc      	bne.w 1304 <main+0x12fe>
     12a:	222c 001c      	move.l 28(a4),d1
     12e:	b2b9 0000 5598 	cmp.l 5598 <ClsSprites+0x1c>,d1
     134:	6600 11ce      	bne.w 1304 <main+0x12fe>
     138:	206c 0020      	movea.l 32(a4),a0
     13c:	b1f9 0000 559c 	cmpa.l 559c <ClsSprites+0x20>,a0
     142:	6600 11c0      	bne.w 1304 <main+0x12fe>
     146:	202c 0024      	move.l 36(a4),d0
     14a:	b0b9 0000 55a0 	cmp.l 55a0 <ClsSprites+0x24>,d0
     150:	6600 11b2      	bne.w 1304 <main+0x12fe>
     154:	222c 0028      	move.l 40(a4),d1
     158:	b2b9 0000 55a4 	cmp.l 55a4 <ClsSprites+0x28>,d1
     15e:	6600 11a4      	bne.w 1304 <main+0x12fe>
     162:	206c 002c      	movea.l 44(a4),a0
     166:	b1f9 0000 55a8 	cmpa.l 55a8 <ClsSprites+0x2c>,a0
     16c:	6600 1196      	bne.w 1304 <main+0x12fe>
     170:	202c 0030      	move.l 48(a4),d0
     174:	b0b9 0000 55ac 	cmp.l 55ac <ClsSprites+0x30>,d0
     17a:	6600 1188      	bne.w 1304 <main+0x12fe>
     17e:	222c 0034      	move.l 52(a4),d1
     182:	b2b9 0000 55b0 	cmp.l 55b0 <ClsSprites+0x34>,d1
     188:	6600 117a      	bne.w 1304 <main+0x12fe>
     18c:	206c 0038      	movea.l 56(a4),a0
     190:	b1f9 0000 55b4 	cmpa.l 55b4 <ClsSprites+0x38>,a0
     196:	6600 116c      	bne.w 1304 <main+0x12fe>
     19a:	286c 003c      	movea.l 60(a4),a4
     19e:	b9f9 0000 55b8 	cmpa.l 55b8 <ClsSprites+0x3c>,a4
     1a4:	6600 115e      	bne.w 1304 <main+0x12fe>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1a8:	2079 0000 563a 	movea.l 563a <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ae:	2039 0000 554c 	move.l 554c <ClScreen>,d0
     1b4:	b0a8 0040      	cmp.l 64(a0),d0
     1b8:	6600 11b6      	bne.w 1370 <main+0x136a>
     1bc:	2228 0044      	move.l 68(a0),d1
     1c0:	b2b9 0000 5550 	cmp.l 5550 <ClScreen+0x4>,d1
     1c6:	6600 11a8      	bne.w 1370 <main+0x136a>
     1ca:	2039 0000 5554 	move.l 5554 <ClScreen+0x8>,d0
     1d0:	b0a8 0048      	cmp.l 72(a0),d0
     1d4:	6600 119a      	bne.w 1370 <main+0x136a>
     1d8:	2228 004c      	move.l 76(a0),d1
     1dc:	b2b9 0000 5558 	cmp.l 5558 <ClScreen+0xc>,d1
     1e2:	6600 118c      	bne.w 1370 <main+0x136a>
     1e6:	2039 0000 555c 	move.l 555c <ClScreen+0x10>,d0
     1ec:	b0a8 0050      	cmp.l 80(a0),d0
     1f0:	6600 117e      	bne.w 1370 <main+0x136a>
     1f4:	2239 0000 5560 	move.l 5560 <ClScreen+0x14>,d1
     1fa:	b2a8 0054      	cmp.l 84(a0),d1
     1fe:	6600 1170      	bne.w 1370 <main+0x136a>
     202:	2028 0058      	move.l 88(a0),d0
     206:	b0b9 0000 5564 	cmp.l 5564 <ClScreen+0x18>,d0
     20c:	6600 1162      	bne.w 1370 <main+0x136a>
     210:	2239 0000 5568 	move.l 5568 <ClScreen+0x1c>,d1
     216:	b2a8 005c      	cmp.l 92(a0),d1
     21a:	6600 1154      	bne.w 1370 <main+0x136a>
     21e:	2039 0000 556c 	move.l 556c <ClScreen+0x20>,d0
     224:	b0a8 0060      	cmp.l 96(a0),d0
     228:	6600 1146      	bne.w 1370 <main+0x136a>
     22c:	2239 0000 5570 	move.l 5570 <ClScreen+0x24>,d1
     232:	b2a8 0064      	cmp.l 100(a0),d1
     236:	6600 1138      	bne.w 1370 <main+0x136a>
     23a:	2028 0068      	move.l 104(a0),d0
     23e:	b0b9 0000 5574 	cmp.l 5574 <ClScreen+0x28>,d0
     244:	6600 112a      	bne.w 1370 <main+0x136a>
     248:	2068 006c      	movea.l 108(a0),a0
     24c:	b1f9 0000 5578 	cmpa.l 5578 <ClScreen+0x2c>,a0
     252:	6600 111c      	bne.w 1370 <main+0x136a>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     256:	23fc 0004 0000 	move.l #262144,562a <DrawBuffer>
     25c:	0000 562a 
  ViewBuffer = (ULONG *)0x50000;
     260:	23fc 0005 0000 	move.l #327680,561e <ViewBuffer>
     266:	0000 561e 
  SetBplPointers();
     26a:	49f9 0000 2040 	lea 2040 <SetBplPointers>,a4
     270:	4e94           	jsr (a4)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     272:	0cb9 0005 0000 	cmpi.l #327680,562a <DrawBuffer>
     278:	0000 562a 
     27c:	6700 1176      	beq.w 13f4 <main+0x13ee>
    Write( Output(), 
     280:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     286:	4eae ffc4      	jsr -60(a6)
     28a:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     290:	2200           	move.l d0,d1
     292:	243c 0000 2daf 	move.l #11695,d2
     298:	763b           	moveq #59,d3
     29a:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     29e:	2079 0000 563a 	movea.l 563a <Copperlist1>,a0
     2a4:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2aa:	0070 
     2ac:	6724           	beq.s 2d2 <main+0x2cc>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ae:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     2b4:	4eae ffc4      	jsr -60(a6)
     2b8:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     2be:	2200           	move.l d0,d1
     2c0:	243c 0000 2deb 	move.l #11755,d2
     2c6:	763c           	moveq #60,d3
     2c8:	4eae ffd0      	jsr -48(a6)
     2cc:	2079 0000 563a 	movea.l 563a <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2d2:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2d8:	0074 
     2da:	6724           	beq.s 300 <main+0x2fa>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2dc:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     2e2:	4eae ffc4      	jsr -60(a6)
     2e6:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     2ec:	2200           	move.l d0,d1
     2ee:	243c 0000 2e28 	move.l #11816,d2
     2f4:	763c           	moveq #60,d3
     2f6:	4eae ffd0      	jsr -48(a6)
     2fa:	2079 0000 563a 	movea.l 563a <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     300:	2228 0078      	move.l 120(a0),d1
     304:	b2b9 0000 5544 	cmp.l 5544 <ClColor>,d1
     30a:	6600 103c      	bne.w 1348 <main+0x1342>
     30e:	2028 007c      	move.l 124(a0),d0
     312:	b0b9 0000 5548 	cmp.l 5548 <ClColor+0x4>,d0
     318:	6600 102e      	bne.w 1348 <main+0x1342>
  if( instructions[pos] == value ) 
     31c:	72fe           	moveq #-2,d1
     31e:	b2a8 0080      	cmp.l 128(a0),d1
     322:	671e           	beq.s 342 <main+0x33c>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     324:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     32a:	4eae ffc4      	jsr -60(a6)
     32e:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     334:	2200           	move.l d0,d1
     336:	243c 0000 2e87 	move.l #11911,d2
     33c:	7622           	moveq #34,d3
     33e:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     342:	4eb9 0000 1e38 	jsr 1e38 <SwapCl>
  if( DrawCopper != Copperlist2)
     348:	2079 0000 5626 	movea.l 5626 <DrawCopper>,a0
     34e:	b1f9 0000 5636 	cmpa.l 5636 <Copperlist2>,a0
     354:	671e           	beq.s 374 <main+0x36e>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     356:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     35c:	4eae ffc4      	jsr -60(a6)
     360:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     366:	2200           	move.l d0,d1
     368:	243c 0000 2eaa 	move.l #11946,d2
     36e:	7615           	moveq #21,d3
     370:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     374:	45f9 0000 206c 	lea 206c <PrepareDisplay>,a2
     37a:	4e92           	jsr (a2)
  if( DrawBuffer != Bitplane1) 
     37c:	2039 0000 562a 	move.l 562a <DrawBuffer>,d0
     382:	b0b9 0000 5632 	cmp.l 5632 <Bitplane1>,d0
     388:	671e           	beq.s 3a8 <main+0x3a2>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     38a:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     390:	4eae ffc4      	jsr -60(a6)
     394:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     39a:	2200           	move.l d0,d1
     39c:	243c 0000 2ec0 	move.l #11968,d2
     3a2:	7637           	moveq #55,d3
     3a4:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3a8:	2239 0000 5626 	move.l 5626 <DrawCopper>,d1
     3ae:	b2b9 0000 563a 	cmp.l 563a <Copperlist1>,d1
     3b4:	671e           	beq.s 3d4 <main+0x3ce>
    Write( Output(), 
     3b6:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     3bc:	4eae ffc4      	jsr -60(a6)
     3c0:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     3c6:	2200           	move.l d0,d1
     3c8:	243c 0000 2ef8 	move.l #12024,d2
     3ce:	7639           	moveq #57,d3
     3d0:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3d4:	4e92           	jsr (a2)

  if( ViewBuffer != Bitplane2) 
     3d6:	2079 0000 561e 	movea.l 561e <ViewBuffer>,a0
     3dc:	b1f9 0000 5622 	cmpa.l 5622 <Bitplane2>,a0
     3e2:	671e           	beq.s 402 <main+0x3fc>
    Write( Output(), 
     3e4:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     3ea:	4eae ffc4      	jsr -60(a6)
     3ee:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     3f4:	2200           	move.l d0,d1
     3f6:	243c 0000 2f32 	move.l #12082,d2
     3fc:	7638           	moveq #56,d3
     3fe:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     402:	2039 0000 561a 	move.l 561a <ViewCopper>,d0
     408:	b0b9 0000 5636 	cmp.l 5636 <Copperlist2>,d0
     40e:	671e           	beq.s 42e <main+0x428>
    Write( Output(), 
     410:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     416:	4eae ffc4      	jsr -60(a6)
     41a:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     420:	2200           	move.l d0,d1
     422:	243c 0000 2f6b 	move.l #12139,d2
     428:	763a           	moveq #58,d3
     42a:	4eae ffd0      	jsr -48(a6)
	}
	SetInterruptHandler((APTR)interruptHandler);
}

void RunFrame() {
  SwapCl();
     42e:	4eb9 0000 1e38 	jsr 1e38 <SwapCl>
  SetBplPointers();
     434:	4e94           	jsr (a4)
             "PrepareDisplay: ViewCopper should be set to Copperlist 2.\n", 58);

  RunFrame();
  UWORD *copword = ViewCopper;
     436:	2079 0000 561a 	movea.l 561a <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     43c:	7000           	moveq #0,d0
     43e:	3028 0072      	move.w 114(a0),d0
     442:	4840           	swap d0
     444:	4240           	clr.w d0
     446:	7200           	moveq #0,d1
     448:	3228 0076      	move.w 118(a0),d1
     44c:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     44e:	b0b9 0000 5622 	cmp.l 5622 <Bitplane2>,d0
     454:	671e           	beq.s 474 <main+0x46e>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     456:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     45c:	4eae ffc4      	jsr -60(a6)
     460:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     466:	2200           	move.l d0,d1
     468:	243c 0000 2fa6 	move.l #12198,d2
     46e:	7648           	moveq #72,d3
     470:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     474:	4eb9 0000 1e38 	jsr 1e38 <SwapCl>
  SetBplPointers();
     47a:	4e94           	jsr (a4)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     47c:	2079 0000 561a 	movea.l 561a <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     482:	7000           	moveq #0,d0
     484:	3028 0072      	move.w 114(a0),d0
     488:	4840           	swap d0
     48a:	4240           	clr.w d0
     48c:	7200           	moveq #0,d1
     48e:	3228 0076      	move.w 118(a0),d1
     492:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     494:	b0b9 0000 5632 	cmp.l 5632 <Bitplane1>,d0
     49a:	671e           	beq.s 4ba <main+0x4b4>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     49c:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     4a2:	4eae ffc4      	jsr -60(a6)
     4a6:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     4ac:	2200           	move.l d0,d1
     4ae:	243c 0000 2fef 	move.l #12271,d2
     4b4:	7649           	moveq #73,d3
     4b6:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4ba:	4eb9 0000 1e38 	jsr 1e38 <SwapCl>
  SetBplPointers();
     4c0:	4e94           	jsr (a4)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     4c2:	2079 0000 561a 	movea.l 561a <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4c8:	7000           	moveq #0,d0
     4ca:	3028 0072      	move.w 114(a0),d0
     4ce:	4840           	swap d0
     4d0:	4240           	clr.w d0
     4d2:	7200           	moveq #0,d1
     4d4:	3228 0076      	move.w 118(a0),d1
     4d8:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4da:	b0b9 0000 5622 	cmp.l 5622 <Bitplane2>,d0
     4e0:	671e           	beq.s 500 <main+0x4fa>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4e2:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     4e8:	4eae ffc4      	jsr -60(a6)
     4ec:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     4f2:	2200           	move.l d0,d1
     4f4:	243c 0000 3039 	move.l #12345,d2
     4fa:	7648           	moveq #72,d3
     4fc:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     500:	2f3c 0000 c800 	move.l #51200,-(sp)
     506:	4878 0084      	pea 84 <main+0x7e>
     50a:	2c3c 0000 21aa 	move.l #8618,d6
     510:	2046           	movea.l d6,a0
     512:	4e90           	jsr (a0)
  TestZoom4Picture();
}

void ZoomTestDisplay() {

  PrepareDisplayZoom();
     514:	45f9 0000 1e5e 	lea 1e5e <PrepareDisplayZoom>,a2
     51a:	4e92           	jsr (a2)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     51c:	4878 0010      	pea 10 <main+0xa>
     520:	4879 0000 557c 	pea 557c <ClsSprites>
     526:	42a7           	clr.l -(sp)
     528:	2f39 0000 563a 	move.l 563a <Copperlist1>,-(sp)
     52e:	4eb9 0000 173a 	jsr 173a <TestCopperlistBatch>
     534:	4fef 0018      	lea 24(sp),sp
     538:	4a80           	tst.l d0
     53a:	661e           	bne.s 55a <main+0x554>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     53c:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     542:	4eae ffc4      	jsr -60(a6)
     546:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     54c:	2200           	move.l d0,d1
     54e:	243c 0000 3082 	move.l #12418,d2
     554:	762c           	moveq #44,d3
     556:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
     55a:	4878 000c      	pea c <main+0x6>
     55e:	4879 0000 5514 	pea 5514 <ClScreenZoom>
     564:	4878 0010      	pea 10 <main+0xa>
     568:	2f39 0000 563a 	move.l 563a <Copperlist1>,-(sp)
     56e:	4eb9 0000 173a 	jsr 173a <TestCopperlistBatch>
     574:	4fef 0010      	lea 16(sp),sp
     578:	4a80           	tst.l d0
     57a:	661e           	bne.s 59a <main+0x594>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     57c:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     582:	4eae ffc4      	jsr -60(a6)
     586:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     58c:	2200           	move.l d0,d1
     58e:	243c 0000 30b8 	move.l #12472,d2
     594:	7636           	moveq #54,d3
     596:	4eae ffd0      	jsr -48(a6)
  Zoom_CopyWord( pos4source, pos4dest, shiftright, 16);
}

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
  UWORD *copword = (UWORD *) DrawCopper;
     59a:	2079 0000 5626 	movea.l 5626 <DrawCopper>,a0
  copword += ZMBPLPTRS+1;
  for(int i=1;i<=2;i++) {
    UWORD highword = ptr >> 16;
    UWORD lowword = ptr & 0xffff;
    *copword = highword;
     5a0:	317c 0004 0072 	move.w #4,114(a0)
    copword += 2;
    *copword = lowword;
     5a6:	4268 0076      	clr.w 118(a0)
    *copword = highword;
     5aa:	317c 0004 007a 	move.w #4,122(a0)
    *copword = lowword;
     5b0:	317c 2800 007e 	move.w #10240,126(a0)
    copword += 2;
    ptr += 40*256;
  }
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
     5b6:	23fc 0005 0000 	move.l #327680,562a <DrawBuffer>
     5bc:	0000 562a 
  ViewBuffer = (ULONG *) tmp;
     5c0:	23fc 0004 0000 	move.l #262144,561e <ViewBuffer>
     5c6:	0000 561e 
  Zoom_SetBplPointers();
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
     5ca:	2f3c 00e0 0004 	move.l #14680068,-(sp)
     5d0:	4878 001c      	pea 1c <main+0x16>
     5d4:	2f39 0000 563a 	move.l 563a <Copperlist1>,-(sp)
     5da:	2a3c 0000 171c 	move.l #5916,d5
     5e0:	2045           	movea.l d5,a0
     5e2:	4e90           	jsr (a0)
     5e4:	4fef 000c      	lea 12(sp),sp
     5e8:	4a80           	tst.l d0
     5ea:	661e           	bne.s 60a <main+0x604>
    Write(Output(), 
     5ec:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     5f2:	4eae ffc4      	jsr -60(a6)
     5f6:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     5fc:	2200           	move.l d0,d1
     5fe:	243c 0000 2deb 	move.l #11755,d2
     604:	763c           	moveq #60,d3
     606:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
     60a:	2f3c 00e2 0000 	move.l #14811136,-(sp)
     610:	4878 001d      	pea 1d <main+0x17>
     614:	2f39 0000 563a 	move.l 563a <Copperlist1>,-(sp)
     61a:	2045           	movea.l d5,a0
     61c:	4e90           	jsr (a0)
     61e:	4fef 000c      	lea 12(sp),sp
     622:	4a80           	tst.l d0
     624:	661e           	bne.s 644 <main+0x63e>
    Write(Output(), 
     626:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     62c:	4eae ffc4      	jsr -60(a6)
     630:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     636:	2200           	move.l d0,d1
     638:	243c 0000 2e28 	move.l #11816,d2
     63e:	763c           	moveq #60,d3
     640:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
     644:	2f3c 00e4 0004 	move.l #14942212,-(sp)
     64a:	4878 001e      	pea 1e <main+0x18>
     64e:	2f39 0000 563a 	move.l 563a <Copperlist1>,-(sp)
     654:	2045           	movea.l d5,a0
     656:	4e90           	jsr (a0)
     658:	4fef 000c      	lea 12(sp),sp
     65c:	4a80           	tst.l d0
     65e:	661e           	bne.s 67e <main+0x678>
    Write(Output(), 
     660:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     666:	4eae ffc4      	jsr -60(a6)
     66a:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     670:	2200           	move.l d0,d1
     672:	243c 0000 30ef 	move.l #12527,d2
     678:	763c           	moveq #60,d3
     67a:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
     67e:	2f3c 00e6 2800 	move.l #15083520,-(sp)
     684:	4878 001f      	pea 1f <main+0x19>
     688:	2f39 0000 563a 	move.l 563a <Copperlist1>,-(sp)
     68e:	2045           	movea.l d5,a0
     690:	4e90           	jsr (a0)
     692:	4fef 000c      	lea 12(sp),sp
     696:	4a80           	tst.l d0
     698:	661e           	bne.s 6b8 <main+0x6b2>
    Write(Output(), 
     69a:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     6a0:	4eae ffc4      	jsr -60(a6)
     6a4:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     6aa:	2200           	move.l d0,d1
     6ac:	243c 0000 312c 	move.l #12588,d2
     6b2:	763c           	moveq #60,d3
     6b4:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl2pl should be 2800\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
     6b8:	4878 0002      	pea 2 <_start+0x2>
     6bc:	4879 0000 5544 	pea 5544 <ClColor>
     6c2:	4878 0020      	pea 20 <main+0x1a>
     6c6:	2f39 0000 563a 	move.l 563a <Copperlist1>,-(sp)
     6cc:	4eb9 0000 173a 	jsr 173a <TestCopperlistBatch>
     6d2:	4fef 0010      	lea 16(sp),sp
     6d6:	4a80           	tst.l d0
     6d8:	661e           	bne.s 6f8 <main+0x6f2>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     6da:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     6e0:	4eae ffc4      	jsr -60(a6)
     6e4:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     6ea:	2200           	move.l d0,d1
     6ec:	243c 0000 2e65 	move.l #11877,d2
     6f2:	7621           	moveq #33,d3
     6f4:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     6f8:	7e9c           	moveq #-100,d7
     6fa:	de8d           	add.l a5,d7
     6fc:	4878 0040      	pea 40 <main+0x3a>
     700:	4879 0000 34a6 	pea 34a6 <incbin_swfont_end+0x800>
     706:	2f07           	move.l d7,-(sp)
     708:	4eb9 0000 2262 	jsr 2262 <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
     70e:	4878 0010      	pea 10 <main+0xa>
     712:	2f07           	move.l d7,-(sp)
     714:	4878 0022      	pea 22 <main+0x1c>
     718:	2f39 0000 563a 	move.l 563a <Copperlist1>,-(sp)
     71e:	4eb9 0000 173a 	jsr 173a <TestCopperlistBatch>
     724:	4fef 001c      	lea 28(sp),sp
     728:	4a80           	tst.l d0
     72a:	661e           	bne.s 74a <main+0x744>
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);
     72c:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     732:	4eae ffc4      	jsr -60(a6)
     736:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     73c:	2200           	move.l d0,d1
     73e:	243c 0000 3169 	move.l #12649,d2
     744:	7621           	moveq #33,d3
     746:	4eae ffd0      	jsr -48(a6)

  ULONG clpart2[] = { 0x2d07fffe, 0x018200f0, 0x01820f00 };
     74a:	2b7c 2d07 fffe 	move.l #755499006,-112(a5)
     750:	ff90 
     752:	2b7c 0182 00f0 	move.l #25297136,-108(a5)
     758:	ff94 
     75a:	2b7c 0182 0f00 	move.l #25300736,-104(a5)
     760:	ff98 

  if( TestCopperlistBatch( Copperlist1, 75, clpart2, 3) == 0)
     762:	4878 0003      	pea 3 <_start+0x3>
     766:	486d ff90      	pea -112(a5)
     76a:	4878 004b      	pea 4b <main+0x45>
     76e:	2f39 0000 563a 	move.l 563a <Copperlist1>,-(sp)
     774:	4eb9 0000 173a 	jsr 173a <TestCopperlistBatch>
     77a:	4fef 0010      	lea 16(sp),sp
     77e:	4a80           	tst.l d0
     780:	661e           	bne.s 7a0 <main+0x79a>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     782:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     788:	4eae ffc4      	jsr -60(a6)
     78c:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     792:	2200           	move.l d0,d1
     794:	243c 0000 318b 	move.l #12683,d2
     79a:	762c           	moveq #44,d3
     79c:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
     7a0:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdd246>
     7a4:	4878 2922      	pea 2922 <incbin_swfont_start+0x22c>
     7a8:	2f39 0000 563a 	move.l 563a <Copperlist1>,-(sp)
     7ae:	2045           	movea.l d5,a0
     7b0:	4e90           	jsr (a0)
     7b2:	4fef 000c      	lea 12(sp),sp
     7b6:	4a80           	tst.l d0
     7b8:	661e           	bne.s 7d8 <main+0x7d2>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     7ba:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     7c0:	4eae ffc4      	jsr -60(a6)
     7c4:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     7ca:	2200           	move.l d0,d1
     7cc:	243c 0000 2e87 	move.l #11911,d2
     7d2:	7622           	moveq #34,d3
     7d4:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     7d8:	2f3c 0001 4a00 	move.l #84480,-(sp)
     7de:	2f3c 0000 a48c 	move.l #42124,-(sp)
     7e4:	2046           	movea.l d6,a0
     7e6:	4e90           	jsr (a0)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     7e8:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
     7ee:	7004           	moveq #4,d0
     7f0:	7202           	moveq #2,d1
     7f2:	4eae ff3a      	jsr -198(a6)

}

void TestBlitleftOfZoom() {
  Zoom_Init();
  PrepareDisplayZoom();
     7f6:	4e92           	jsr (a2)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     7f8:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
     7fe:	203c 0000 c800 	move.l #51200,d0
     804:	7202           	moveq #2,d1
     806:	4eae ff3a      	jsr -198(a6)
     80a:	2840           	movea.l d0,a4
     80c:	23c0 0000 55fc 	move.l d0,55fc <Zoom_Source>
  if( Zoom_Source == 0) {
     812:	508f           	addq.l #8,sp
     814:	6700 0cc4      	beq.w 14da <main+0x14d4>
    return;
  }

  
  UWORD *tstsource = Zoom_Source;
  *tstsource++ = 0x0000;
     818:	2640           	movea.l d0,a3
     81a:	425b           	clr.w (a3)+
  *tstsource = 0x0080;
     81c:	397c 0080 0002 	move.w #128,2(a4)
  tstsource += ZMLINESIZE/2-1;
  *tstsource = 0x1000;
     822:	397c 1000 002c 	move.w #4096,44(a4)
  tstsource++;
  *tstsource = 0x8e88;
     828:	397c 8e88 002e 	move.w #-29048,46(a4)
  tstsource += ZMLINESIZE/2-1;

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
  *tstsource++ = 0x0000;
     82e:	426c 15d4      	clr.w 5588(a4)
  *tstsource = 0x00ff;
     832:	397c 00ff 15d6 	move.w #255,5590(a4)

  Zoom_ZoomBlitLeft( Zoom_Source+1, (UWORD *)DrawBuffer, 8, 128);
     838:	2639 0000 562a 	move.l 562a <DrawBuffer>,d3
  WaitBlit();
     83e:	2c79 0000 5612 	movea.l 5612 <GfxBase>,a6
     844:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     848:	2079 0000 5616 	movea.l 5616 <hw>,a0
     84e:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
     854:	317c fde4 0040 	move.w #-540,64(a0)
  hw->bltafwm = 0xffff;
     85a:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     860:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     866:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     86c:	317c 0028 0062 	move.w #40,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     872:	317c ff00 0070 	move.w #-256,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     878:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = srca;
     87e:	214b 0050      	move.l a3,80(a0)
  hw->bltbpt = srcb;
     882:	214c 004c      	move.l a4,76(a0)
  hw->bltdpt = destination;
     886:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
     88a:	317c 2002 0058 	move.w #8194,88(a0)
  WaitBlit();
     890:	2c79 0000 5612 	movea.l 5612 <GfxBase>,a6
     896:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
     89a:	2679 0000 562a 	movea.l 562a <DrawBuffer>,a3
  if( *destination != 0x0180) {
     8a0:	0c6b 0180 0002 	cmpi.w #384,2(a3)
     8a6:	671e           	beq.s 8c6 <main+0x8c0>
    Write(  Output(), "Zoomblitleft - First row wrong.\n",32);
     8a8:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     8ae:	4eae ffc4      	jsr -60(a6)
     8b2:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     8b8:	2200           	move.l d0,d1
     8ba:	243c 0000 31f0 	move.l #12784,d2
     8c0:	7620           	moveq #32,d3
     8c2:	4eae ffd0      	jsr -48(a6)
  }
  destination += ZMLINESIZE/2;
  if( *destination != 0x1d88)
     8c6:	0c6b 1d88 002e 	cmpi.w #7560,46(a3)
     8cc:	671e           	beq.s 8ec <main+0x8e6>
    Write(  Output(), "Zoomblitleft: Second row wrong.\n",32);
     8ce:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     8d4:	4eae ffc4      	jsr -60(a6)
     8d8:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     8de:	2200           	move.l d0,d1
     8e0:	243c 0000 3211 	move.l #12817,d2
     8e6:	7620           	moveq #32,d3
     8e8:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
  destination++;
  if( *destination != 0x01ff) {
     8ec:	2079 0000 562a 	movea.l 562a <DrawBuffer>,a0
     8f2:	0c68 01ff 15d6 	cmpi.w #511,5590(a0)
     8f8:	671e           	beq.s 918 <main+0x912>
    Write(  Output(), "Zoomblitleft: Last row wrong.\n",40);
     8fa:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     900:	4eae ffc4      	jsr -60(a6)
     904:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     90a:	2200           	move.l d0,d1
     90c:	243c 0000 3232 	move.l #12850,d2
     912:	7628           	moveq #40,d3
     914:	4eae ffd0      	jsr -48(a6)
  }
  FreeMem( Zoom_Source, 40*256*5);
     918:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
     91e:	2279 0000 55fc 	movea.l 55fc <Zoom_Source>,a1
     924:	203c 0000 c800 	move.l #51200,d0
     92a:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     92e:	2f3c 0001 4a00 	move.l #84480,-(sp)
     934:	2f3c 0000 a48c 	move.l #42124,-(sp)
     93a:	2046           	movea.l d6,a0
     93c:	4e90           	jsr (a0)
     93e:	508f           	addq.l #8,sp
}

void TestCopyColumnOfZoom() {

  PrepareDisplayZoom();
     940:	4e92           	jsr (a2)

  UWORD *destination = (UWORD *)DrawBuffer;
     942:	2079 0000 562a 	movea.l 562a <DrawBuffer>,a0
  *destination= 0x0000;
     948:	4250           	clr.w (a0)
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
     94a:	317c 000f 002c 	move.w #15,44(a0)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     950:	317c 000f 41d4 	move.w #15,16852(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     956:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
     95c:	203c 0000 c800 	move.l #51200,d0
     962:	7202           	moveq #2,d1
     964:	4eae ff3a      	jsr -198(a6)
     968:	2840           	movea.l d0,a4
     96a:	23c0 0000 55fc 	move.l d0,55fc <Zoom_Source>
  if( Zoom_Source == 0) {
     970:	6700 0bba      	beq.w 152c <main+0x1526>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }

  UWORD *tstsource = Zoom_Source;
  *tstsource = 0xffff;
     974:	38bc ffff      	move.w #-1,(a4)
  tstsource += ZMLINESIZE/2;
  *tstsource = 0xffff;
     978:	397c ffff 002c 	move.w #-1,44(a4)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0xc000;
     97e:	397c c000 41d4 	move.w #-16384,16852(a4)
  Zoom_CopyColumn( Zoom_Source, (UWORD *)DrawBuffer, 1, 1);
     984:	2839 0000 562a 	move.l 562a <DrawBuffer>,d4
  WaitBlit();
     98a:	2c79 0000 5612 	movea.l 5612 <GfxBase>,a6
     990:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     994:	2079 0000 5616 	movea.l 5616 <hw>,a0
     99a:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4;
     9a0:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltafwm = 0xffff;
     9a6:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     9ac:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 2;
     9b2:	317c 002a 0064 	move.w #42,100(a0)
  hw->bltbmod = ZMLINESIZE - 2;
     9b8:	317c 002a 0062 	move.w #42,98(a0)
  hw->bltdmod = ZMLINESIZE - 2;
     9be:	317c 002a 0066 	move.w #42,102(a0)
  hw->bltcdat = bltmask;
     9c4:	317c 4000 0070 	move.w #16384,112(a0)
  hw->bltapt = (UWORD *) sourcepos;
     9ca:	214c 0050      	move.l a4,80(a0)
  hw->bltbpt = (UWORD *) destpos;
     9ce:	2144 004c      	move.l d4,76(a0)
  hw->bltdpt = (UWORD *) destpos;
     9d2:	2144 0054      	move.l d4,84(a0)
  hw->bltsize = ZMCOLHEIGHT*64+1;
     9d6:	317c 6001 0058 	move.w #24577,88(a0)
  
  WaitBlit();
     9dc:	2c79 0000 5612 	movea.l 5612 <GfxBase>,a6
     9e2:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     9e6:	2479 0000 562a 	movea.l 562a <DrawBuffer>,a2
  if( *destination != 0x4000)
     9ec:	0c52 4000      	cmpi.w #16384,(a2)
     9f0:	671e           	beq.s a10 <main+0xa0a>
    Write(  Output(), "Zoomtest: CopyColumn2 - First row wrong.\n",41);
     9f2:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     9f8:	4eae ffc4      	jsr -60(a6)
     9fc:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     a02:	2200           	move.l d0,d1
     a04:	243c 0000 3251 	move.l #12881,d2
     a0a:	7629           	moveq #41,d3
     a0c:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x400f)
     a10:	0c6a 400f 002c 	cmpi.w #16399,44(a2)
     a16:	671e           	beq.s a36 <main+0xa30>
    Write(  Output(), "Zoomtest: CopyColumn2 - Second row wrong.\n",42);
     a18:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     a1e:	4eae ffc4      	jsr -60(a6)
     a22:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     a28:	2200           	move.l d0,d1
     a2a:	243c 0000 327b 	move.l #12923,d2
     a30:	762a           	moveq #42,d3
     a32:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x400f)
     a36:	2879 0000 562a 	movea.l 562a <DrawBuffer>,a4
     a3c:	0c6c 400f 41d4 	cmpi.w #16399,16852(a4)
     a42:	6724           	beq.s a68 <main+0xa62>
    Write(  Output(), "Zoomtest: CopyColumn2 - Last row wrong.\n",40);
     a44:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     a4a:	4eae ffc4      	jsr -60(a6)
     a4e:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     a54:	2200           	move.l d0,d1
     a56:	243c 0000 32a6 	move.l #12966,d2
     a5c:	7628           	moveq #40,d3
     a5e:	4eae ffd0      	jsr -48(a6)
     a62:	2879 0000 562a 	movea.l 562a <DrawBuffer>,a4

  destination = (UWORD *)DrawBuffer;
  *destination= 0x0000;
     a68:	4254           	clr.w (a4)
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
     a6a:	397c 000f 002c 	move.w #15,44(a4)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     a70:	397c 000f 41d4 	move.w #15,16852(a4)

  tstsource = Zoom_Source;
     a76:	2479 0000 55fc 	movea.l 55fc <Zoom_Source>,a2
  *tstsource = 0xffff;
     a7c:	34bc ffff      	move.w #-1,(a2)
  tstsource += ZMLINESIZE/2;
  *tstsource = 0xffff;
     a80:	357c ffff 002c 	move.w #-1,44(a2)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0x8000;
     a86:	357c 8000 41d4 	move.w #-32768,16852(a2)
  WaitBlit();
     a8c:	2c79 0000 5612 	movea.l 5612 <GfxBase>,a6
     a92:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     a96:	2079 0000 5616 	movea.l 5616 <hw>,a0
     a9c:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4;
     aa2:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltafwm = 0xffff;
     aa8:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     aae:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 2;
     ab4:	317c 002a 0064 	move.w #42,100(a0)
  hw->bltbmod = ZMLINESIZE - 2;
     aba:	317c 002a 0062 	move.w #42,98(a0)
  hw->bltdmod = ZMLINESIZE - 2;
     ac0:	317c 002a 0066 	move.w #42,102(a0)
  hw->bltcdat = bltmask;
     ac6:	317c 8000 0070 	move.w #-32768,112(a0)
  hw->bltapt = (UWORD *) sourcepos;
     acc:	214a 0050      	move.l a2,80(a0)
  hw->bltbpt = (UWORD *) destpos;
     ad0:	214c 004c      	move.l a4,76(a0)
  hw->bltdpt = (UWORD *) destpos;
     ad4:	214c 0054      	move.l a4,84(a0)
  hw->bltsize = ZMCOLHEIGHT*64+1;
     ad8:	317c 6001 0058 	move.w #24577,88(a0)
  Zoom_CopyColumn( Zoom_Source, (UWORD *)DrawBuffer, 0, 0);
  
  WaitBlit();
     ade:	2c79 0000 5612 	movea.l 5612 <GfxBase>,a6
     ae4:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     ae8:	2479 0000 562a 	movea.l 562a <DrawBuffer>,a2
  if( *destination != 0x8000)
     aee:	0c52 8000      	cmpi.w #-32768,(a2)
     af2:	671e           	beq.s b12 <main+0xb0c>
    Write(  Output(), "Zoomtest: CopyColumn - First row wrong.\n",40);
     af4:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     afa:	4eae ffc4      	jsr -60(a6)
     afe:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     b04:	2200           	move.l d0,d1
     b06:	243c 0000 32cf 	move.l #13007,d2
     b0c:	7628           	moveq #40,d3
     b0e:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x800f)
     b12:	0c6a 800f 002c 	cmpi.w #-32753,44(a2)
     b18:	671e           	beq.s b38 <main+0xb32>
    Write(  Output(), "Zoomtest: CopyColumn - Second row wrong.\n",41);
     b1a:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     b20:	4eae ffc4      	jsr -60(a6)
     b24:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     b2a:	2200           	move.l d0,d1
     b2c:	243c 0000 32f8 	move.l #13048,d2
     b32:	7629           	moveq #41,d3
     b34:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x800f)
     b38:	2079 0000 562a 	movea.l 562a <DrawBuffer>,a0
     b3e:	0c68 800f 41d4 	cmpi.w #-32753,16852(a0)
     b44:	671e           	beq.s b64 <main+0xb5e>
    Write(  Output(), "Zoomtest: CopyColumn - Last row wrong.\n",39);
     b46:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     b4c:	4eae ffc4      	jsr -60(a6)
     b50:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     b56:	2200           	move.l d0,d1
     b58:	243c 0000 3322 	move.l #13090,d2
     b5e:	7627           	moveq #39,d3
     b60:	4eae ffd0      	jsr -48(a6)

  FreeMem( Zoom_Source, 40*256*5);
     b64:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
     b6a:	2279 0000 55fc 	movea.l 55fc <Zoom_Source>,a1
     b70:	203c 0000 c800 	move.l #51200,d0
     b76:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     b7a:	2f3c 0001 4a00 	move.l #84480,-(sp)
     b80:	2f3c 0000 a48c 	move.l #42124,-(sp)
     b86:	2046           	movea.l d6,a0
     b88:	4e90           	jsr (a0)
     b8a:	508f           	addq.l #8,sp
}

void TestCopyWord() {
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
     b8c:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
     b92:	203c 0000 0528 	move.l #1320,d0
     b98:	7202           	moveq #2,d1
     b9a:	4eae ff3a      	jsr -198(a6)
     b9e:	2840           	movea.l d0,a4
  if( source == 0) {
     ba0:	4a80           	tst.l d0
     ba2:	6700 08b6      	beq.w 145a <main+0x1454>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
     ba6:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
     bac:	203c 0000 0528 	move.l #1320,d0
     bb2:	7202           	moveq #2,d1
     bb4:	4eae ff3a      	jsr -198(a6)
     bb8:	2440           	movea.l d0,a2
  if( destination == 0) {
     bba:	4a80           	tst.l d0
     bbc:	6700 089c      	beq.w 145a <main+0x1454>
    return;
  }
  
  UWORD *tmp = source;
  for( int i=0; i<8;i++) {
    *tmp++ = 0;
     bc0:	4254           	clr.w (a4)
    *tmp++ = 0xaaaa;
     bc2:	397c aaaa 0002 	move.w #-21846,2(a4)
    *tmp++ = 0xaaaa;
     bc8:	397c aaaa 0004 	move.w #-21846,4(a4)
    *tmp = 0;
     bce:	426c 0006      	clr.w 6(a4)
    tmp += ZMLINESIZE/2-3;
    *tmp++ = 0;
     bd2:	426c 002c      	clr.w 44(a4)
    *tmp++ = 0x5555;
     bd6:	397c 5555 002e 	move.w #21845,46(a4)
    *tmp++ = 0x5555;
     bdc:	397c 5555 0030 	move.w #21845,48(a4)
    *tmp = 0;
     be2:	426c 0032      	clr.w 50(a4)
    *tmp++ = 0;
     be6:	426c 0058      	clr.w 88(a4)
    *tmp++ = 0xaaaa;
     bea:	397c aaaa 005a 	move.w #-21846,90(a4)
    *tmp++ = 0xaaaa;
     bf0:	397c aaaa 005c 	move.w #-21846,92(a4)
    *tmp = 0;
     bf6:	426c 005e      	clr.w 94(a4)
    *tmp++ = 0;
     bfa:	426c 0084      	clr.w 132(a4)
    *tmp++ = 0x5555;
     bfe:	397c 5555 0086 	move.w #21845,134(a4)
    *tmp++ = 0x5555;
     c04:	397c 5555 0088 	move.w #21845,136(a4)
    *tmp = 0;
     c0a:	426c 008a      	clr.w 138(a4)
    *tmp++ = 0;
     c0e:	426c 00b0      	clr.w 176(a4)
    *tmp++ = 0xaaaa;
     c12:	397c aaaa 00b2 	move.w #-21846,178(a4)
    *tmp++ = 0xaaaa;
     c18:	397c aaaa 00b4 	move.w #-21846,180(a4)
    *tmp = 0;
     c1e:	426c 00b6      	clr.w 182(a4)
    *tmp++ = 0;
     c22:	426c 00dc      	clr.w 220(a4)
    *tmp++ = 0x5555;
     c26:	397c 5555 00de 	move.w #21845,222(a4)
    *tmp++ = 0x5555;
     c2c:	397c 5555 00e0 	move.w #21845,224(a4)
    *tmp = 0;
     c32:	426c 00e2      	clr.w 226(a4)
    *tmp++ = 0;
     c36:	426c 0108      	clr.w 264(a4)
    *tmp++ = 0xaaaa;
     c3a:	397c aaaa 010a 	move.w #-21846,266(a4)
    *tmp++ = 0xaaaa;
     c40:	397c aaaa 010c 	move.w #-21846,268(a4)
    *tmp = 0;
     c46:	426c 010e      	clr.w 270(a4)
    *tmp++ = 0;
     c4a:	426c 0134      	clr.w 308(a4)
    *tmp++ = 0x5555;
     c4e:	397c 5555 0136 	move.w #21845,310(a4)
    *tmp++ = 0x5555;
     c54:	397c 5555 0138 	move.w #21845,312(a4)
    *tmp = 0;
     c5a:	426c 013a      	clr.w 314(a4)
    *tmp++ = 0;
     c5e:	426c 0160      	clr.w 352(a4)
    *tmp++ = 0xaaaa;
     c62:	397c aaaa 0162 	move.w #-21846,354(a4)
    *tmp++ = 0xaaaa;
     c68:	397c aaaa 0164 	move.w #-21846,356(a4)
    *tmp = 0;
     c6e:	426c 0166      	clr.w 358(a4)
    *tmp++ = 0;
     c72:	426c 018c      	clr.w 396(a4)
    *tmp++ = 0x5555;
     c76:	397c 5555 018e 	move.w #21845,398(a4)
    *tmp++ = 0x5555;
     c7c:	397c 5555 0190 	move.w #21845,400(a4)
    *tmp = 0;
     c82:	426c 0192      	clr.w 402(a4)
    *tmp++ = 0;
     c86:	426c 01b8      	clr.w 440(a4)
    *tmp++ = 0xaaaa;
     c8a:	397c aaaa 01ba 	move.w #-21846,442(a4)
    *tmp++ = 0xaaaa;
     c90:	397c aaaa 01bc 	move.w #-21846,444(a4)
    *tmp = 0;
     c96:	426c 01be      	clr.w 446(a4)
    *tmp++ = 0;
     c9a:	426c 01e4      	clr.w 484(a4)
    *tmp++ = 0x5555;
     c9e:	397c 5555 01e6 	move.w #21845,486(a4)
    *tmp++ = 0x5555;
     ca4:	397c 5555 01e8 	move.w #21845,488(a4)
    *tmp = 0;
     caa:	426c 01ea      	clr.w 490(a4)
    *tmp++ = 0;
     cae:	426c 0210      	clr.w 528(a4)
    *tmp++ = 0xaaaa;
     cb2:	397c aaaa 0212 	move.w #-21846,530(a4)
    *tmp++ = 0xaaaa;
     cb8:	397c aaaa 0214 	move.w #-21846,532(a4)
    *tmp = 0;
     cbe:	426c 0216      	clr.w 534(a4)
    *tmp++ = 0;
     cc2:	426c 023c      	clr.w 572(a4)
    *tmp++ = 0x5555;
     cc6:	397c 5555 023e 	move.w #21845,574(a4)
    *tmp++ = 0x5555;
     ccc:	397c 5555 0240 	move.w #21845,576(a4)
    *tmp = 0;
     cd2:	426c 0242      	clr.w 578(a4)
    *tmp++ = 0;
     cd6:	426c 0268      	clr.w 616(a4)
    *tmp++ = 0xaaaa;
     cda:	397c aaaa 026a 	move.w #-21846,618(a4)
    *tmp++ = 0xaaaa;
     ce0:	397c aaaa 026c 	move.w #-21846,620(a4)
    *tmp = 0;
     ce6:	426c 026e      	clr.w 622(a4)
    *tmp++ = 0;
     cea:	426c 0294      	clr.w 660(a4)
    *tmp++ = 0x5555;
     cee:	397c 5555 0296 	move.w #21845,662(a4)
    *tmp++ = 0x5555;
     cf4:	397c 5555 0298 	move.w #21845,664(a4)
    *tmp = 0;
     cfa:	426c 029a      	clr.w 666(a4)
    tmp += ZMLINESIZE/2-3;
     cfe:	4878 0528      	pea 528 <main+0x522>
     d02:	42a7           	clr.l -(sp)
     d04:	2f00           	move.l d0,-(sp)
     d06:	4eb9 0000 22f4 	jsr 22f4 <memset>
  WaitBlit();
     d0c:	2c79 0000 5612 	movea.l 5612 <GfxBase>,a6
     d12:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     d16:	2079 0000 5616 	movea.l 5616 <hw>,a0
     d1c:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
     d22:	317c 39f0 0040 	move.w #14832,64(a0)
  hw->bltafwm = 0xffff;
     d28:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     d2e:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     d34:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     d3a:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = (UWORD *) source;
     d40:	200c           	move.l a4,d0
     d42:	5480           	addq.l #2,d0
     d44:	2140 0050      	move.l d0,80(a0)
  hw->bltdpt = (UWORD *) destination;
     d48:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
     d4c:	317c 0402 0058 	move.w #1026,88(a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    *tmp++ = 0;
  }

  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 3, 16);
  WaitBlit();
     d52:	2c79 0000 5612 	movea.l 5612 <GfxBase>,a6
     d58:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
  if( *tmp != 0x5555) 
     d5c:	4fef 000c      	lea 12(sp),sp
     d60:	0c6a 5555 0002 	cmpi.w #21845,2(a2)
     d66:	671e           	beq.s d86 <main+0xd80>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
     d68:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     d6e:	4eae ffc4      	jsr -60(a6)
     d72:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     d78:	2200           	move.l d0,d1
     d7a:	243c 0000 3380 	move.l #13184,d2
     d80:	761f           	moveq #31,d3
     d82:	4eae ffd0      	jsr -48(a6)
  tmp += ZMLINESIZE/2;
  if( *tmp != 0xaaaa)
     d86:	0c6a aaaa 002e 	cmpi.w #-21846,46(a2)
     d8c:	671e           	beq.s dac <main+0xda6>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
     d8e:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     d94:	4eae ffc4      	jsr -60(a6)
     d98:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     d9e:	2200           	move.l d0,d1
     da0:	243c 0000 33a0 	move.l #13216,d2
     da6:	7620           	moveq #32,d3
     da8:	4eae ffd0      	jsr -48(a6)
  
  FreeMem( source,ZMLINESIZE*30);
     dac:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
     db2:	224c           	movea.l a4,a1
     db4:	203c 0000 0528 	move.l #1320,d0
     dba:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
     dbe:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
     dc4:	224a           	movea.l a2,a1
     dc6:	203c 0000 0528 	move.l #1320,d0
     dcc:	4eae ff2e      	jsr -210(a6)
5    5    5    2    a    a    a    a    9    5    5    5    5    8    a    a
abcd efgh ijkl 1234 5678 9abc defg hijk l123 4567 89ab cdef ghij kl12 3456 789a
1010 1010 1010 0101 0101 0101 0101 0101 0010 1010 1010 1010 1010 1001 0101 0101
a    a    a    5    5    5    5    5    2    a    a    a    a    9    5    5*/ 
void TestZoom4Picture() {
  UWORD *source =AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     dd0:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
     dd6:	203c 0000 3300 	move.l #13056,d0
     ddc:	7202           	moveq #2,d1
     dde:	4eae ff3a      	jsr -198(a6)
     de2:	2800           	move.l d0,d4
  if( source == 0) {
     de4:	6700 06aa      	beq.w 1490 <main+0x148a>
    Write(  Output(), 
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     de8:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
     dee:	203c 0000 3300 	move.l #13056,d0
     df4:	7202           	moveq #2,d1
     df6:	4eae ff3a      	jsr -198(a6)
     dfa:	2840           	movea.l d0,a4
  if( destination == 0) {
     dfc:	4a80           	tst.l d0
     dfe:	6700 0778      	beq.w 1578 <main+0x1572>
     e02:	2004           	move.l d4,d0
     e04:	0680 0000 2ec0 	addi.l #11968,d0
     e0a:	2044           	movea.l d4,a0
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
  UWORD *pos4source = source+ZMLINESIZE/2-2+ZMLINESIZE/2*8;
     ec4:	0684 0000 0188 	addi.l #392,d4
  UWORD *pos4dest = destination+ZMLINESIZE/2-2;
     eca:	45ec 0028      	lea 40(a4),a2
  WaitBlit();
     ece:	2c79 0000 5612 	movea.l 5612 <GfxBase>,a6
     ed4:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     ed8:	2079 0000 5616 	movea.l 5616 <hw>,a0
     ede:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
     ee4:	317c 79f0 0040 	move.w #31216,64(a0)
  hw->bltafwm = 0xffff;
     eea:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     ef0:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     ef6:	317c 0028 0064 	move.w #40,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     efc:	317c 0028 0066 	move.w #40,102(a0)
  hw->bltapt = (UWORD *) source;
     f02:	2144 0050      	move.l d4,80(a0)
  hw->bltdpt = (UWORD *) destination;
     f06:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
     f0a:	317c 0402 0058 	move.w #1026,88(a0)
  }
  
  Zoom_ZoomIntoPicture( source, destination);
  WaitBlit();
     f10:	2c79 0000 5612 	movea.l 5612 <GfxBase>,a6
     f16:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+ZMLINESIZE/2-1; 
     f1a:	49ec 002a      	lea 42(a4),a4
  UWORD *valsupposed = destline+ZMLINESIZE/2-1;
  for(int i=0;i<16;i+=2) {
     f1e:	7800           	moveq #0,d4
  }
}

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
  char str[ 100] = { 0 };
     f20:	4878 0064      	pea 64 <main+0x5e>
     f24:	42a7           	clr.l -(sp)
     f26:	2f07           	move.l d7,-(sp)
     f28:	4eb9 0000 22f4 	jsr 22f4 <memset>
     f2e:	3b44 ff8e      	move.w d4,-114(a5)
  UWORD data[2];
  data[0] = numberofline;
     f32:	3b44 ff90      	move.w d4,-112(a5)

  if( ( (*testpattern++ ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
     f36:	3039 0000 5512 	move.w 5512 <destline+0x2a>,d0
     f3c:	3214           	move.w (a4),d1
     f3e:	b340           	eor.w d1,d0
     f40:	0240 ff00      	andi.w #-256,d0
     f44:	4fef 000c      	lea 12(sp),sp
     f48:	6736           	beq.s f80 <main+0xf7a>
    RawDoFmt( "TestZoom4Picture: Word 0 Row %d wrong.\n", data, PutChar, str);
     f4a:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
     f50:	41f9 0000 343a 	lea 343a <incbin_swfont_end+0x794>,a0
     f56:	43ed ff90      	lea -112(a5),a1
     f5a:	45f9 0000 24e0 	lea 24e0 <PutChar>,a2
     f60:	2647           	movea.l d7,a3
     f62:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
     f66:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     f6c:	4eae ffc4      	jsr -60(a6)
     f70:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     f76:	2200           	move.l d0,d1
     f78:	2407           	move.l d7,d2
     f7a:	7664           	moveq #100,d3
     f7c:	4eae ffd0      	jsr -48(a6)
  *bp = 0;
     f80:	4278 0200      	clr.w 200 <main+0x1fa>
  char str[ 100] = { 0 };
     f84:	4878 0064      	pea 64 <main+0x5e>
     f88:	42a7           	clr.l -(sp)
     f8a:	2f07           	move.l d7,-(sp)
     f8c:	4eb9 0000 22f4 	jsr 22f4 <memset>
  data[0] = numberofline;
     f92:	306d ff8e      	movea.w -114(a5),a0
     f96:	5248           	addq.w #1,a0
     f98:	3b48 ff90      	move.w a0,-112(a5)
  if( ( (*testpattern++ ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
     f9c:	3039 0000 5512 	move.w 5512 <destline+0x2a>,d0
     fa2:	322c 002c      	move.w 44(a4),d1
     fa6:	b340           	eor.w d1,d0
     fa8:	4640           	not.w d0
     faa:	0240 ff00      	andi.w #-256,d0
     fae:	4fef 000c      	lea 12(sp),sp
     fb2:	6700 0406      	beq.w 13ba <main+0x13b4>
    RawDoFmt( "TestZoom4Picture: Word 0 Row %d wrong.\n", data, PutChar, str);
     fb6:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
     fbc:	41f9 0000 343a 	lea 343a <incbin_swfont_end+0x794>,a0
     fc2:	43ed ff90      	lea -112(a5),a1
     fc6:	45f9 0000 24e0 	lea 24e0 <PutChar>,a2
     fcc:	2647           	movea.l d7,a3
     fce:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
     fd2:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     fd8:	4eae ffc4      	jsr -60(a6)
     fdc:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
     fe2:	2200           	move.l d0,d1
     fe4:	2407           	move.l d7,d2
     fe6:	7664           	moveq #100,d3
     fe8:	4eae ffd0      	jsr -48(a6)
    valactual += ZMLINESIZE/2;
     fec:	49ec 0058      	lea 88(a4),a4
  for(int i=0;i<16;i+=2) {
     ff0:	5484           	addq.l #2,d4
     ff2:	7010           	moveq #16,d0
     ff4:	b084           	cmp.l d4,d0
     ff6:	6600 ff28      	bne.w f20 <main+0xf1a>
char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
  PrepareDisplaySW();
     ffa:	4eb9 0000 206c 	jsr 206c <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    1000:	4878 0010      	pea 10 <main+0xa>
    1004:	4879 0000 557c 	pea 557c <ClsSprites>
    100a:	42a7           	clr.l -(sp)
    100c:	2f39 0000 563a 	move.l 563a <Copperlist1>,-(sp)
    1012:	4eb9 0000 173a 	jsr 173a <TestCopperlistBatch>
    1018:	4fef 0010      	lea 16(sp),sp
    101c:	4a80           	tst.l d0
    101e:	661e           	bne.s 103e <main+0x1038>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    1020:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1026:	4eae ffc4      	jsr -60(a6)
    102a:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1030:	2200           	move.l d0,d1
    1032:	243c 0000 3082 	move.l #12418,d2
    1038:	762c           	moveq #44,d3
    103a:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    103e:	4878 000c      	pea c <main+0x6>
    1042:	4879 0000 554c 	pea 554c <ClScreen>
    1048:	4878 0010      	pea 10 <main+0xa>
    104c:	2f39 0000 563a 	move.l 563a <Copperlist1>,-(sp)
    1052:	4eb9 0000 173a 	jsr 173a <TestCopperlistBatch>
    1058:	4fef 0010      	lea 16(sp),sp
    105c:	4a80           	tst.l d0
    105e:	661e           	bne.s 107e <main+0x1078>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
    1060:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1066:	4eae ffc4      	jsr -60(a6)
    106a:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1070:	2200           	move.l d0,d1
    1072:	243c 0000 30b8 	move.l #12472,d2
    1078:	7636           	moveq #54,d3
    107a:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    107e:	4878 0002      	pea 2 <_start+0x2>
    1082:	4879 0000 5544 	pea 5544 <ClColor>
    1088:	4878 001e      	pea 1e <main+0x18>
    108c:	2f39 0000 563a 	move.l 563a <Copperlist1>,-(sp)
    1092:	4eb9 0000 173a 	jsr 173a <TestCopperlistBatch>
    1098:	4fef 0010      	lea 16(sp),sp
    109c:	4a80           	tst.l d0
    109e:	661e           	bne.s 10be <main+0x10b8>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    10a0:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    10a6:	4eae ffc4      	jsr -60(a6)
    10aa:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    10b0:	2200           	move.l d0,d1
    10b2:	243c 0000 2e65 	move.l #11877,d2
    10b8:	7621           	moveq #33,d3
    10ba:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    10be:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdd246>
    10c2:	4878 0020      	pea 20 <main+0x1a>
    10c6:	2f39 0000 563a 	move.l 563a <Copperlist1>,-(sp)
    10cc:	2045           	movea.l d5,a0
    10ce:	4e90           	jsr (a0)
    10d0:	4fef 000c      	lea 12(sp),sp
    10d4:	4a80           	tst.l d0
    10d6:	6700 024e      	beq.w 1326 <main+0x1320>
    Write( Output(), "Copperlist End not correctly set.\n", 34);

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
    10da:	2479 0000 562a 	movea.l 562a <DrawBuffer>,a2
    10e0:	4879 0000 3462 	pea 3462 <incbin_swfont_end+0x7bc>
    10e6:	2f0a           	move.l a2,-(sp)
    10e8:	4eb9 0000 15c4 	jsr 15c4 <WriteFont.constprop.3>

  UWORD *tstpointer = DrawBuffer;
  if( *tstpointer != 0xff00)
    10ee:	508f           	addq.l #8,sp
    10f0:	0c52 ff00      	cmpi.w #-256,(a2)
    10f4:	671e           	beq.s 1114 <main+0x110e>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
    10f6:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    10fc:	4eae ffc4      	jsr -60(a6)
    1100:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1106:	2200           	move.l d0,d1
    1108:	243c 0000 3473 	move.l #13427,d2
    110e:	7631           	moveq #49,d3
    1110:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
    1114:	2f3c 0000 c800 	move.l #51200,-(sp)
    111a:	4878 0084      	pea 84 <main+0x7e>
    111e:	2046           	movea.l d6,a0
    1120:	4e90           	jsr (a0)
  RunTests();
	Delay(50);
    1122:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1128:	7232           	moveq #50,d1
    112a:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
    112e:	247c 00f0 ff60 	movea.l #15794016,a2
    1134:	508f           	addq.l #8,sp
    1136:	4a92           	tst.l (a2)
    1138:	6718           	beq.s 1152 <main+0x114c>
    113a:	4878 0001      	pea 1 <_start+0x1>
    113e:	47f9 0000 1612 	lea 1612 <warpmode.part.0>,a3
    1144:	4e93           	jsr (a3)
    1146:	588f           	addq.l #4,sp
    1148:	4a92           	tst.l (a2)
    114a:	6706           	beq.s 1152 <main+0x114c>
    114c:	42a7           	clr.l -(sp)
    114e:	4e93           	jsr (a3)
    1150:	588f           	addq.l #4,sp
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
    1152:	2c79 0000 5612 	movea.l 5612 <GfxBase>,a6
    1158:	23ee 0022 0000 	move.l 34(a6),5600 <ActiView>
    115e:	5600 
	OwnBlitter();
    1160:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
    1164:	2c79 0000 5612 	movea.l 5612 <GfxBase>,a6
    116a:	4eae ff1c      	jsr -228(a6)
	Disable();
    116e:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
    1174:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
    1178:	2b79 0000 5616 	move.l 5616 <hw>,-118(a5)
    117e:	ff8a 
    1180:	206d ff8a      	movea.l -118(a5),a0
    1184:	3028 0010      	move.w 16(a0),d0
    1188:	33c0 0000 5604 	move.w d0,5604 <SystemADKCON>
	SystemInts=hw->intenar;
    118e:	3028 001c      	move.w 28(a0),d0
    1192:	33c0 0000 5608 	move.w d0,5608 <SystemInts>
	SystemDMA=hw->dmaconr;
    1198:	3028 0002      	move.w 2(a0),d0
    119c:	33c0 0000 5606 	move.w d0,5606 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
    11a2:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    11a8:	317c 7fff 009c 	move.w #32767,156(a0)
	
	WaitVbl();
    11ae:	49f9 0000 221c 	lea 221c <WaitVbl>,a4
    11b4:	4e94           	jsr (a4)
	WaitVbl();
    11b6:	4e94           	jsr (a4)
	hw->dmacon=0x7fff;//Clear all DMA channels
    11b8:	206d ff8a      	movea.l -118(a5),a0
    11bc:	317c 7fff 0096 	move.w #32767,150(a0)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
    11c2:	2c79 0000 5612 	movea.l 5612 <GfxBase>,a6
    11c8:	93c9           	suba.l a1,a1
    11ca:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    11ce:	2c79 0000 5612 	movea.l 5612 <GfxBase>,a6
    11d4:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    11d8:	2c79 0000 5612 	movea.l 5612 <GfxBase>,a6
    11de:	4eae fef2      	jsr -270(a6)

	WaitVbl();
    11e2:	4e94           	jsr (a4)
	WaitVbl();
    11e4:	4e94           	jsr (a4)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
    11e6:	3b7c 4e7a ff9c 	move.w #20090,-100(a5)
    11ec:	3b7c 0801 ff9e 	move.w #2049,-98(a5)
    11f2:	3b7c 4e73 ffa0 	move.w #20083,-96(a5)
	if (SysBase->AttnFlags & AFF_68010) 
    11f8:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
    11fe:	082e 0000 0129 	btst #0,297(a6)
    1204:	6700 0348      	beq.w 154e <main+0x1548>
		vbr = (APTR)Supervisor((void*)getvbr);
    1208:	cf8d           	exg d7,a5
    120a:	4eae ffe2      	jsr -30(a6)
    120e:	cf8d           	exg d7,a5

	VBR=GetVBR();
    1210:	23c0 0000 560a 	move.l d0,560a <VBR.lto_priv.4>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    1216:	2079 0000 560a 	movea.l 560a <VBR.lto_priv.4>,a0
    121c:	2828 006c      	move.l 108(a0),d4
	SystemIrq=GetInterruptHandler(); //store interrupt register
    1220:	23c4 0000 560e 	move.l d4,560e <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
    1226:	4e94           	jsr (a4)
}

void FreeSystem() { 
	WaitVbl();
    1228:	4e94           	jsr (a4)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    122a:	2079 0000 5616 	movea.l 5616 <hw>,a0
    1230:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    1234:	3028 0002      	move.w 2(a0),d0
    1238:	0800 000e      	btst #14,d0
    123c:	66f6           	bne.s 1234 <main+0x122e>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
    123e:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    1244:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
    124a:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
    1250:	2279 0000 560a 	movea.l 560a <VBR.lto_priv.4>,a1
    1256:	2344 006c      	move.l d4,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
    125a:	2c79 0000 5612 	movea.l 5612 <GfxBase>,a6
    1260:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
    1266:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
    126c:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
    1272:	3039 0000 5608 	move.w 5608 <SystemInts>,d0
    1278:	0040 8000      	ori.w #-32768,d0
    127c:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
    1280:	3039 0000 5606 	move.w 5606 <SystemDMA>,d0
    1286:	0040 8000      	ori.w #-32768,d0
    128a:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
    128e:	3039 0000 5604 	move.w 5604 <SystemADKCON>,d0
    1294:	0040 8000      	ori.w #-32768,d0
    1298:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
    129c:	2279 0000 5600 	movea.l 5600 <ActiView>,a1
    12a2:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    12a6:	2c79 0000 5612 	movea.l 5612 <GfxBase>,a6
    12ac:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    12b0:	2c79 0000 5612 	movea.l 5612 <GfxBase>,a6
    12b6:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
    12ba:	2c79 0000 5612 	movea.l 5612 <GfxBase>,a6
    12c0:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
    12c4:	2c79 0000 5612 	movea.l 5612 <GfxBase>,a6
    12ca:	4eae fe32      	jsr -462(a6)
	Enable();
    12ce:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
    12d4:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
    12d8:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
    12de:	2279 0000 562e 	movea.l 562e <DOSBase>,a1
    12e4:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
    12e8:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
    12ee:	2279 0000 5612 	movea.l 5612 <GfxBase>,a1
    12f4:	4eae fe62      	jsr -414(a6)
}
    12f8:	7000           	moveq #0,d0
    12fa:	4ced 5cfc ff60 	movem.l -160(a5),d2-d7/a2-a4/a6
    1300:	4e5d           	unlk a5
    1302:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    1304:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    130a:	4eae ffc4      	jsr -60(a6)
    130e:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1314:	2200           	move.l d0,d1
    1316:	243c 0000 3082 	move.l #12418,d2
    131c:	762c           	moveq #44,d3
    131e:	4eae ffd0      	jsr -48(a6)
    1322:	6000 ee84      	bra.w 1a8 <main+0x1a2>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
    1326:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    132c:	4eae ffc4      	jsr -60(a6)
    1330:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1336:	2200           	move.l d0,d1
    1338:	243c 0000 2e87 	move.l #11911,d2
    133e:	7622           	moveq #34,d3
    1340:	4eae ffd0      	jsr -48(a6)
    1344:	6000 fd94      	bra.w 10da <main+0x10d4>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    1348:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    134e:	4eae ffc4      	jsr -60(a6)
    1352:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1358:	2200           	move.l d0,d1
    135a:	243c 0000 2e65 	move.l #11877,d2
    1360:	7621           	moveq #33,d3
    1362:	4eae ffd0      	jsr -48(a6)
    1366:	2079 0000 563a 	movea.l 563a <Copperlist1>,a0
    136c:	6000 efae      	bra.w 31c <main+0x316>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    1370:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1376:	4eae ffc4      	jsr -60(a6)
    137a:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1380:	2200           	move.l d0,d1
    1382:	243c 0000 30b8 	move.l #12472,d2
    1388:	7636           	moveq #54,d3
    138a:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
    138e:	23fc 0004 0000 	move.l #262144,562a <DrawBuffer>
    1394:	0000 562a 
  ViewBuffer = (ULONG *)0x50000;
    1398:	23fc 0005 0000 	move.l #327680,561e <ViewBuffer>
    139e:	0000 561e 
  SetBplPointers();
    13a2:	49f9 0000 2040 	lea 2040 <SetBplPointers>,a4
    13a8:	4e94           	jsr (a4)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    13aa:	0cb9 0005 0000 	cmpi.l #327680,562a <DrawBuffer>
    13b0:	0000 562a 
    13b4:	6600 eeca      	bne.w 280 <main+0x27a>
    13b8:	603a           	bra.s 13f4 <main+0x13ee>
    valactual += ZMLINESIZE/2;
    13ba:	49ec 0058      	lea 88(a4),a4
  for(int i=0;i<16;i+=2) {
    13be:	5484           	addq.l #2,d4
    13c0:	7210           	moveq #16,d1
    13c2:	b284           	cmp.l d4,d1
    13c4:	6600 fb5a      	bne.w f20 <main+0xf1a>
  PrepareDisplaySW();
    13c8:	4eb9 0000 206c 	jsr 206c <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    13ce:	4878 0010      	pea 10 <main+0xa>
    13d2:	4879 0000 557c 	pea 557c <ClsSprites>
    13d8:	42a7           	clr.l -(sp)
    13da:	2f39 0000 563a 	move.l 563a <Copperlist1>,-(sp)
    13e0:	4eb9 0000 173a 	jsr 173a <TestCopperlistBatch>
    13e6:	4fef 0010      	lea 16(sp),sp
    13ea:	4a80           	tst.l d0
    13ec:	6600 fc50      	bne.w 103e <main+0x1038>
    13f0:	6000 fc2e      	bra.w 1020 <main+0x101a>
    13f4:	0cb9 0004 0000 	cmpi.l #262144,561e <ViewBuffer>
    13fa:	0000 561e 
    13fe:	6700 ee9e      	beq.w 29e <main+0x298>
    Write( Output(), 
    1402:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1408:	4eae ffc4      	jsr -60(a6)
    140c:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1412:	2200           	move.l d0,d1
    1414:	243c 0000 2daf 	move.l #11695,d2
    141a:	763b           	moveq #59,d3
    141c:	4eae ffd0      	jsr -48(a6)
    1420:	6000 ee7c      	bra.w 29e <main+0x298>
		Exit(0);
    1424:	9dce           	suba.l a6,a6
    1426:	7200           	moveq #0,d1
    1428:	4eae ff70      	jsr -144(a6)
    142c:	6000 ec26      	bra.w 54 <main+0x4e>
		Exit(0);
    1430:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1436:	7200           	moveq #0,d1
    1438:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
    143c:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
    1442:	43f9 0000 2d74 	lea 2d74 <incbin_swfont_end+0xce>,a1
    1448:	7000           	moveq #0,d0
    144a:	4eae fdd8      	jsr -552(a6)
    144e:	23c0 0000 562e 	move.l d0,562e <DOSBase>
	if (!DOSBase)
    1454:	6600 ebfe      	bne.w 54 <main+0x4e>
    1458:	60ca           	bra.s 1424 <main+0x141e>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    145a:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1460:	4eae ffc4      	jsr -60(a6)
    1464:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    146a:	2200           	move.l d0,d1
    146c:	243c 0000 334a 	move.l #13130,d2
    1472:	7635           	moveq #53,d3
    1474:	4eae ffd0      	jsr -48(a6)
  UWORD *source =AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    1478:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
    147e:	203c 0000 3300 	move.l #13056,d0
    1484:	7202           	moveq #2,d1
    1486:	4eae ff3a      	jsr -198(a6)
    148a:	2800           	move.l d0,d4
  if( source == 0) {
    148c:	6600 f95a      	bne.w de8 <main+0xde2>
    Write(  Output(), 
    1490:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1496:	4eae ffc4      	jsr -60(a6)
    149a:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    14a0:	2200           	move.l d0,d1
    14a2:	243c 0000 33c1 	move.l #13249,d2
    14a8:	7639           	moveq #57,d3
    14aa:	4eae ffd0      	jsr -48(a6)
  PrepareDisplaySW();
    14ae:	4eb9 0000 206c 	jsr 206c <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    14b4:	4878 0010      	pea 10 <main+0xa>
    14b8:	4879 0000 557c 	pea 557c <ClsSprites>
    14be:	42a7           	clr.l -(sp)
    14c0:	2f39 0000 563a 	move.l 563a <Copperlist1>,-(sp)
    14c6:	4eb9 0000 173a 	jsr 173a <TestCopperlistBatch>
    14cc:	4fef 0010      	lea 16(sp),sp
    14d0:	4a80           	tst.l d0
    14d2:	6600 fb6a      	bne.w 103e <main+0x1038>
    14d6:	6000 fb48      	bra.w 1020 <main+0x101a>
    Write(  Output(), 
    14da:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    14e0:	4eae ffc4      	jsr -60(a6)
    14e4:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    14ea:	2200           	move.l d0,d1
    14ec:	243c 0000 31b8 	move.l #12728,d2
    14f2:	7636           	moveq #54,d3
    14f4:	4eae ffd0      	jsr -48(a6)
  PrepareDisplayZoom();
    14f8:	4e92           	jsr (a2)
  UWORD *destination = (UWORD *)DrawBuffer;
    14fa:	2079 0000 562a 	movea.l 562a <DrawBuffer>,a0
  *destination= 0x0000;
    1500:	4250           	clr.w (a0)
  *destination= 0x000f;
    1502:	317c 000f 002c 	move.w #15,44(a0)
  *destination = 0x000f;
    1508:	317c 000f 41d4 	move.w #15,16852(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    150e:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
    1514:	203c 0000 c800 	move.l #51200,d0
    151a:	7202           	moveq #2,d1
    151c:	4eae ff3a      	jsr -198(a6)
    1520:	2840           	movea.l d0,a4
    1522:	23c0 0000 55fc 	move.l d0,55fc <Zoom_Source>
  if( Zoom_Source == 0) {
    1528:	6600 f44a      	bne.w 974 <main+0x96e>
    Write(  Output(), 
    152c:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1532:	4eae ffc4      	jsr -60(a6)
    1536:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    153c:	2200           	move.l d0,d1
    153e:	243c 0000 31b8 	move.l #12728,d2
    1544:	7636           	moveq #54,d3
    1546:	4eae ffd0      	jsr -48(a6)
    return;
    154a:	6000 f640      	bra.w b8c <main+0xb86>
	APTR vbr = 0;
    154e:	7000           	moveq #0,d0
	VBR=GetVBR();
    1550:	23c0 0000 560a 	move.l d0,560a <VBR.lto_priv.4>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    1556:	2079 0000 560a 	movea.l 560a <VBR.lto_priv.4>,a0
    155c:	2828 006c      	move.l 108(a0),d4
	SystemIrq=GetInterruptHandler(); //store interrupt register
    1560:	23c4 0000 560e 	move.l d4,560e <SystemIrq>
	WaitVbl();
    1566:	4e94           	jsr (a4)
	WaitVbl();
    1568:	4e94           	jsr (a4)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    156a:	2079 0000 5616 	movea.l 5616 <hw>,a0
    1570:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    1574:	6000 fcbe      	bra.w 1234 <main+0x122e>
    Write(  Output(), 
    1578:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    157e:	4eae ffc4      	jsr -60(a6)
    1582:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1588:	2200           	move.l d0,d1
    158a:	243c 0000 33fb 	move.l #13307,d2
    1590:	763d           	moveq #61,d3
    1592:	4eae ffd0      	jsr -48(a6)
  PrepareDisplaySW();
    1596:	4eb9 0000 206c 	jsr 206c <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    159c:	4878 0010      	pea 10 <main+0xa>
    15a0:	4879 0000 557c 	pea 557c <ClsSprites>
    15a6:	42a7           	clr.l -(sp)
    15a8:	2f39 0000 563a 	move.l 563a <Copperlist1>,-(sp)
    15ae:	4eb9 0000 173a 	jsr 173a <TestCopperlistBatch>
    15b4:	4fef 0010      	lea 16(sp),sp
    15b8:	4a80           	tst.l d0
    15ba:	6600 fa82      	bne.w 103e <main+0x1038>
    15be:	6000 fa60      	bra.w 1020 <main+0x101a>
    15c2:	4e71           	nop

000015c4 <WriteFont.constprop.3>:
  *cl = 0xfffffffe;

  return retval;
}

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
    15c4:	226f 0004      	movea.l 4(sp),a1
  UWORD *bmpptr = Destination;
  UWORD *fntptr = font;

  char charpos = *text;
  charpos -= 0x20;
    15c8:	206f 0008      	movea.l 8(sp),a0
    15cc:	1010           	move.b (a0),d0
    15ce:	0600 ffe0      	addi.b #-32,d0
  charpos = charpos<<3;
    15d2:	4880           	ext.w d0
    15d4:	48c0           	ext.l d0
    15d6:	e788           	lsl.l #3,d0
  fntptr += charpos;
    15d8:	4880           	ext.w d0
    15da:	3040           	movea.w d0,a0
    15dc:	d1c8           	adda.l a0,a0
    15de:	d1fc 0000 55bc 	adda.l #21948,a0
  for(int i=1;i<=8;i++) {
    *bmpptr = *fntptr++;
    15e4:	3290           	move.w (a0),(a1)
    15e6:	3368 0002 0050 	move.w 2(a0),80(a1)
    15ec:	3368 0004 00a0 	move.w 4(a0),160(a1)
    15f2:	3368 0006 00f0 	move.w 6(a0),240(a1)
    15f8:	3368 0008 0140 	move.w 8(a0),320(a1)
    15fe:	3368 000a 0190 	move.w 10(a0),400(a1)
    1604:	3368 000c 01e0 	move.w 12(a0),480(a1)
    160a:	3368 000e 0230 	move.w 14(a0),560(a1)
    bmpptr += 40;
  }

}
    1610:	4e75           	rts

00001612 <warpmode.part.0>:
void warpmode(int on) 
    1612:	598f           	subq.l #4,sp
    1614:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    1616:	4aaf 000c      	tst.l 12(sp)
    161a:	674c           	beq.s 1668 <warpmode.part.0+0x56>
    161c:	4878 0001      	pea 1 <_start+0x1>
    1620:	740b           	moveq #11,d2
    1622:	d48f           	add.l sp,d2
    1624:	2f02           	move.l d2,-(sp)
    1626:	42a7           	clr.l -(sp)
    1628:	4879 0000 2cda 	pea 2cda <incbin_swfont_end+0x34>
    162e:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd247>
    1632:	4878 0052      	pea 52 <main+0x4c>
    1636:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeed1a8>
    163c:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    1640:	203c 0000 2cc0 	move.l #11456,d0
    1646:	4878 0001      	pea 1 <_start+0x1>
    164a:	2f02           	move.l d2,-(sp)
    164c:	42a7           	clr.l -(sp)
    164e:	2f00           	move.l d0,-(sp)
    1650:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd247>
    1654:	4878 0052      	pea 52 <main+0x4c>
    1658:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeed1a8>
	}
}
    165e:	4fef 0018      	lea 24(sp),sp
    1662:	241f           	move.l (sp)+,d2
    1664:	588f           	addq.l #4,sp
    1666:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    1668:	4878 0001      	pea 1 <_start+0x1>
    166c:	740b           	moveq #11,d2
    166e:	d48f           	add.l sp,d2
    1670:	2f02           	move.l d2,-(sp)
    1672:	42a7           	clr.l -(sp)
    1674:	4879 0000 2ce4 	pea 2ce4 <incbin_swfont_end+0x3e>
    167a:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd247>
    167e:	4878 0052      	pea 52 <main+0x4c>
    1682:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeed1a8>
    1688:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    168c:	203c 0000 2ca7 	move.l #11431,d0
    1692:	4878 0001      	pea 1 <_start+0x1>
    1696:	2f02           	move.l d2,-(sp)
    1698:	42a7           	clr.l -(sp)
    169a:	2f00           	move.l d0,-(sp)
    169c:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdd247>
    16a0:	4878 0052      	pea 52 <main+0x4c>
    16a4:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeed1a8>
}
    16aa:	4fef 0018      	lea 24(sp),sp
    16ae:	241f           	move.l (sp)+,d2
    16b0:	588f           	addq.l #4,sp
    16b2:	4e75           	rts

000016b4 <KPrintF>:
{
    16b4:	4fef ff80      	lea -128(sp),sp
    16b8:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
    16bc:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeed1a8>
    16c2:	6734           	beq.s 16f8 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
    16c4:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
    16ca:	206f 0090      	movea.l 144(sp),a0
    16ce:	43ef 0094      	lea 148(sp),a1
    16d2:	45f9 0000 24e0 	lea 24e0 <PutChar>,a2
    16d8:	47ef 000c      	lea 12(sp),a3
    16dc:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    16e0:	2f0b           	move.l a3,-(sp)
    16e2:	4878 0056      	pea 56 <main+0x50>
    16e6:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeed1a8>
    16ec:	508f           	addq.l #8,sp
}
    16ee:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    16f2:	4fef 0080      	lea 128(sp),sp
    16f6:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
    16f8:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
    16fe:	206f 0090      	movea.l 144(sp),a0
    1702:	43ef 0094      	lea 148(sp),a1
    1706:	45f9 0000 24d2 	lea 24d2 <KPutCharX>,a2
    170c:	97cb           	suba.l a3,a3
    170e:	4eae fdf6      	jsr -522(a6)
}
    1712:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    1716:	4fef 0080      	lea 128(sp),sp
    171a:	4e75           	rts

0000171c <TestCopperlistPos>:
  if( instructions[pos] == value ) 
    171c:	202f 0008      	move.l 8(sp),d0
    1720:	d080           	add.l d0,d0
    1722:	d080           	add.l d0,d0
    1724:	206f 0004      	movea.l 4(sp),a0
    1728:	2030 0800      	move.l (0,a0,d0.l),d0
    172c:	b0af 000c      	cmp.l 12(sp),d0
    1730:	57c0           	seq d0
    1732:	4880           	ext.w d0
    1734:	48c0           	ext.l d0
}
    1736:	4480           	neg.l d0
    1738:	4e75           	rts

0000173a <TestCopperlistBatch>:
                                                                  long length) {
    173a:	48e7 2030      	movem.l d2/a2-a3,-(sp)
    173e:	246f 0010      	movea.l 16(sp),a2
    1742:	206f 0014      	movea.l 20(sp),a0
    1746:	226f 0018      	movea.l 24(sp),a1
    174a:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
    174e:	2008           	move.l a0,d0
    1750:	d088           	add.l a0,d0
    1752:	d080           	add.l d0,d0
    1754:	2411           	move.l (a1),d2
    1756:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
    175a:	6600 01ac      	bne.w 1908 <TestCopperlistBatch+0x1ce>
    175e:	2008           	move.l a0,d0
    1760:	5280           	addq.l #1,d0
    1762:	d080           	add.l d0,d0
    1764:	d080           	add.l d0,d0
    1766:	2032 0800      	move.l (0,a2,d0.l),d0
    176a:	b0a9 0004      	cmp.l 4(a1),d0
    176e:	6600 0198      	bne.w 1908 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1772:	7002           	moveq #2,d0
    1774:	b081           	cmp.l d1,d0
    1776:	6700 0188      	beq.w 1900 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    177a:	2008           	move.l a0,d0
    177c:	5480           	addq.l #2,d0
    177e:	d080           	add.l d0,d0
    1780:	d080           	add.l d0,d0
    1782:	2032 0800      	move.l (0,a2,d0.l),d0
    1786:	b0a9 0008      	cmp.l 8(a1),d0
    178a:	6600 017c      	bne.w 1908 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    178e:	7403           	moveq #3,d2
    1790:	b481           	cmp.l d1,d2
    1792:	6700 016c      	beq.w 1900 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1796:	2008           	move.l a0,d0
    1798:	5680           	addq.l #3,d0
    179a:	d080           	add.l d0,d0
    179c:	d080           	add.l d0,d0
    179e:	2032 0800      	move.l (0,a2,d0.l),d0
    17a2:	b0a9 000c      	cmp.l 12(a1),d0
    17a6:	6600 0160      	bne.w 1908 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    17aa:	7004           	moveq #4,d0
    17ac:	b081           	cmp.l d1,d0
    17ae:	6700 0150      	beq.w 1900 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    17b2:	2008           	move.l a0,d0
    17b4:	5880           	addq.l #4,d0
    17b6:	d080           	add.l d0,d0
    17b8:	d080           	add.l d0,d0
    17ba:	2032 0800      	move.l (0,a2,d0.l),d0
    17be:	b0a9 0010      	cmp.l 16(a1),d0
    17c2:	6600 0144      	bne.w 1908 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    17c6:	7405           	moveq #5,d2
    17c8:	b481           	cmp.l d1,d2
    17ca:	6700 0134      	beq.w 1900 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    17ce:	2008           	move.l a0,d0
    17d0:	5a80           	addq.l #5,d0
    17d2:	d080           	add.l d0,d0
    17d4:	d080           	add.l d0,d0
    17d6:	2032 0800      	move.l (0,a2,d0.l),d0
    17da:	b0a9 0014      	cmp.l 20(a1),d0
    17de:	6600 0128      	bne.w 1908 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    17e2:	7006           	moveq #6,d0
    17e4:	b081           	cmp.l d1,d0
    17e6:	6700 0118      	beq.w 1900 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    17ea:	2008           	move.l a0,d0
    17ec:	5c80           	addq.l #6,d0
    17ee:	d080           	add.l d0,d0
    17f0:	d080           	add.l d0,d0
    17f2:	2032 0800      	move.l (0,a2,d0.l),d0
    17f6:	b0a9 0018      	cmp.l 24(a1),d0
    17fa:	6600 010c      	bne.w 1908 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    17fe:	7407           	moveq #7,d2
    1800:	b481           	cmp.l d1,d2
    1802:	6700 00fc      	beq.w 1900 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1806:	2008           	move.l a0,d0
    1808:	5e80           	addq.l #7,d0
    180a:	d080           	add.l d0,d0
    180c:	d080           	add.l d0,d0
    180e:	2032 0800      	move.l (0,a2,d0.l),d0
    1812:	b0a9 001c      	cmp.l 28(a1),d0
    1816:	6600 00f0      	bne.w 1908 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    181a:	7008           	moveq #8,d0
    181c:	b081           	cmp.l d1,d0
    181e:	6700 00e0      	beq.w 1900 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1822:	2008           	move.l a0,d0
    1824:	5080           	addq.l #8,d0
    1826:	d080           	add.l d0,d0
    1828:	d080           	add.l d0,d0
    182a:	2032 0800      	move.l (0,a2,d0.l),d0
    182e:	b0a9 0020      	cmp.l 32(a1),d0
    1832:	6600 00d4      	bne.w 1908 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1836:	7409           	moveq #9,d2
    1838:	b481           	cmp.l d1,d2
    183a:	6700 00c4      	beq.w 1900 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    183e:	47e8 0009      	lea 9(a0),a3
    1842:	200b           	move.l a3,d0
    1844:	d08b           	add.l a3,d0
    1846:	d080           	add.l d0,d0
    1848:	2032 0800      	move.l (0,a2,d0.l),d0
    184c:	b0a9 0024      	cmp.l 36(a1),d0
    1850:	6600 00b6      	bne.w 1908 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1854:	700a           	moveq #10,d0
    1856:	b081           	cmp.l d1,d0
    1858:	6700 00a6      	beq.w 1900 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    185c:	47e8 000a      	lea 10(a0),a3
    1860:	200b           	move.l a3,d0
    1862:	d08b           	add.l a3,d0
    1864:	d080           	add.l d0,d0
    1866:	2032 0800      	move.l (0,a2,d0.l),d0
    186a:	b0a9 0028      	cmp.l 40(a1),d0
    186e:	6600 0098      	bne.w 1908 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1872:	740b           	moveq #11,d2
    1874:	b481           	cmp.l d1,d2
    1876:	6700 0088      	beq.w 1900 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    187a:	47e8 000b      	lea 11(a0),a3
    187e:	200b           	move.l a3,d0
    1880:	d08b           	add.l a3,d0
    1882:	d080           	add.l d0,d0
    1884:	2032 0800      	move.l (0,a2,d0.l),d0
    1888:	b0a9 002c      	cmp.l 44(a1),d0
    188c:	667a           	bne.s 1908 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    188e:	700c           	moveq #12,d0
    1890:	b081           	cmp.l d1,d0
    1892:	676c           	beq.s 1900 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1894:	47e8 000c      	lea 12(a0),a3
    1898:	200b           	move.l a3,d0
    189a:	d08b           	add.l a3,d0
    189c:	d080           	add.l d0,d0
    189e:	2032 0800      	move.l (0,a2,d0.l),d0
    18a2:	b0a9 0030      	cmp.l 48(a1),d0
    18a6:	6660           	bne.s 1908 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    18a8:	740d           	moveq #13,d2
    18aa:	b481           	cmp.l d1,d2
    18ac:	6752           	beq.s 1900 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    18ae:	47e8 000d      	lea 13(a0),a3
    18b2:	200b           	move.l a3,d0
    18b4:	d08b           	add.l a3,d0
    18b6:	d080           	add.l d0,d0
    18b8:	2032 0800      	move.l (0,a2,d0.l),d0
    18bc:	b0a9 0034      	cmp.l 52(a1),d0
    18c0:	6646           	bne.s 1908 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    18c2:	700e           	moveq #14,d0
    18c4:	b081           	cmp.l d1,d0
    18c6:	6738           	beq.s 1900 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    18c8:	47e8 000e      	lea 14(a0),a3
    18cc:	200b           	move.l a3,d0
    18ce:	d08b           	add.l a3,d0
    18d0:	d080           	add.l d0,d0
    18d2:	2032 0800      	move.l (0,a2,d0.l),d0
    18d6:	b0a9 0038      	cmp.l 56(a1),d0
    18da:	662c           	bne.s 1908 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    18dc:	7410           	moveq #16,d2
    18de:	b481           	cmp.l d1,d2
    18e0:	661e           	bne.s 1900 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    18e2:	41e8 000f      	lea 15(a0),a0
    18e6:	d1c8           	adda.l a0,a0
    18e8:	d1c8           	adda.l a0,a0
    18ea:	2070 a800      	movea.l (0,a0,a2.l),a0
    18ee:	b1e9 003c      	cmpa.l 60(a1),a0
    18f2:	57c0           	seq d0
    18f4:	4880           	ext.w d0
    18f6:	48c0           	ext.l d0
    18f8:	4480           	neg.l d0
}
    18fa:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    18fe:	4e75           	rts
  return 1;
    1900:	7001           	moveq #1,d0
}
    1902:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    1906:	4e75           	rts
      return 0;
    1908:	7000           	moveq #0,d0
}
    190a:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    190e:	4e75           	rts

00001910 <ClBuild>:
ULONG * ClbuildSW() {
    1910:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
    1914:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
    191a:	707b           	moveq #123,d0
    191c:	4600           	not.b d0
    191e:	7202           	moveq #2,d1
    1920:	4eae ff3a      	jsr -198(a6)
    1924:	2440           	movea.l d0,a2
  if( retval == 0) {
    1926:	4a80           	tst.l d0
    1928:	6700 010e      	beq.w 1a38 <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
    192c:	24b9 0000 557c 	move.l 557c <ClsSprites>,(a2)
    1932:	2579 0000 5580 	move.l 5580 <ClsSprites+0x4>,4(a2)
    1938:	0004 
    193a:	2579 0000 5584 	move.l 5584 <ClsSprites+0x8>,8(a2)
    1940:	0008 
    1942:	2579 0000 5588 	move.l 5588 <ClsSprites+0xc>,12(a2)
    1948:	000c 
    194a:	2579 0000 558c 	move.l 558c <ClsSprites+0x10>,16(a2)
    1950:	0010 
    1952:	2579 0000 5590 	move.l 5590 <ClsSprites+0x14>,20(a2)
    1958:	0014 
    195a:	2579 0000 5594 	move.l 5594 <ClsSprites+0x18>,24(a2)
    1960:	0018 
    1962:	2579 0000 5598 	move.l 5598 <ClsSprites+0x1c>,28(a2)
    1968:	001c 
    196a:	2579 0000 559c 	move.l 559c <ClsSprites+0x20>,32(a2)
    1970:	0020 
    1972:	2579 0000 55a0 	move.l 55a0 <ClsSprites+0x24>,36(a2)
    1978:	0024 
    197a:	2579 0000 55a4 	move.l 55a4 <ClsSprites+0x28>,40(a2)
    1980:	0028 
    1982:	2579 0000 55a8 	move.l 55a8 <ClsSprites+0x2c>,44(a2)
    1988:	002c 
    198a:	2579 0000 55ac 	move.l 55ac <ClsSprites+0x30>,48(a2)
    1990:	0030 
    1992:	2579 0000 55b0 	move.l 55b0 <ClsSprites+0x34>,52(a2)
    1998:	0034 
    199a:	2579 0000 55b4 	move.l 55b4 <ClsSprites+0x38>,56(a2)
    19a0:	0038 
    19a2:	2579 0000 55b8 	move.l 55b8 <ClsSprites+0x3c>,60(a2)
    19a8:	003c 
    *cl++ = *clpartinstruction++;
    19aa:	2579 0000 554c 	move.l 554c <ClScreen>,64(a2)
    19b0:	0040 
    19b2:	2579 0000 5550 	move.l 5550 <ClScreen+0x4>,68(a2)
    19b8:	0044 
    19ba:	2579 0000 5554 	move.l 5554 <ClScreen+0x8>,72(a2)
    19c0:	0048 
    19c2:	2579 0000 5558 	move.l 5558 <ClScreen+0xc>,76(a2)
    19c8:	004c 
    19ca:	2579 0000 555c 	move.l 555c <ClScreen+0x10>,80(a2)
    19d0:	0050 
    19d2:	2579 0000 5560 	move.l 5560 <ClScreen+0x14>,84(a2)
    19d8:	0054 
    19da:	2579 0000 5564 	move.l 5564 <ClScreen+0x18>,88(a2)
    19e0:	0058 
    19e2:	2579 0000 5568 	move.l 5568 <ClScreen+0x1c>,92(a2)
    19e8:	005c 
    19ea:	2579 0000 556c 	move.l 556c <ClScreen+0x20>,96(a2)
    19f0:	0060 
    19f2:	2579 0000 5570 	move.l 5570 <ClScreen+0x24>,100(a2)
    19f8:	0064 
    19fa:	2579 0000 5574 	move.l 5574 <ClScreen+0x28>,104(a2)
    1a00:	0068 
    1a02:	2579 0000 5578 	move.l 5578 <ClScreen+0x2c>,108(a2)
    1a08:	006c 
  *cl++ = 0x00e00000;
    1a0a:	257c 00e0 0000 	move.l #14680064,112(a2)
    1a10:	0070 
  *cl++ = 0x00e20000;
    1a12:	257c 00e2 0000 	move.l #14811136,116(a2)
    1a18:	0074 
    *cl++ = *clpartinstruction++;
    1a1a:	2579 0000 5544 	move.l 5544 <ClColor>,120(a2)
    1a20:	0078 
    1a22:	2579 0000 5548 	move.l 5548 <ClColor+0x4>,124(a2)
    1a28:	007c 
  *cl = 0xfffffffe;
    1a2a:	70fe           	moveq #-2,d0
    1a2c:	2540 0080      	move.l d0,128(a2)
}
    1a30:	200a           	move.l a2,d0
    1a32:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1a36:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1a38:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1a3e:	4eae ffc4      	jsr -60(a6)
    1a42:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1a48:	2200           	move.l d0,d1
    1a4a:	243c 0000 2cef 	move.l #11503,d2
    1a50:	7628           	moveq #40,d3
    1a52:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1a56:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1a5c:	7201           	moveq #1,d1
    1a5e:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1a62:	24b9 0000 557c 	move.l 557c <ClsSprites>,(a2)
    1a68:	2579 0000 5580 	move.l 5580 <ClsSprites+0x4>,4(a2)
    1a6e:	0004 
    1a70:	2579 0000 5584 	move.l 5584 <ClsSprites+0x8>,8(a2)
    1a76:	0008 
    1a78:	2579 0000 5588 	move.l 5588 <ClsSprites+0xc>,12(a2)
    1a7e:	000c 
    1a80:	2579 0000 558c 	move.l 558c <ClsSprites+0x10>,16(a2)
    1a86:	0010 
    1a88:	2579 0000 5590 	move.l 5590 <ClsSprites+0x14>,20(a2)
    1a8e:	0014 
    1a90:	2579 0000 5594 	move.l 5594 <ClsSprites+0x18>,24(a2)
    1a96:	0018 
    1a98:	2579 0000 5598 	move.l 5598 <ClsSprites+0x1c>,28(a2)
    1a9e:	001c 
    1aa0:	2579 0000 559c 	move.l 559c <ClsSprites+0x20>,32(a2)
    1aa6:	0020 
    1aa8:	2579 0000 55a0 	move.l 55a0 <ClsSprites+0x24>,36(a2)
    1aae:	0024 
    1ab0:	2579 0000 55a4 	move.l 55a4 <ClsSprites+0x28>,40(a2)
    1ab6:	0028 
    1ab8:	2579 0000 55a8 	move.l 55a8 <ClsSprites+0x2c>,44(a2)
    1abe:	002c 
    1ac0:	2579 0000 55ac 	move.l 55ac <ClsSprites+0x30>,48(a2)
    1ac6:	0030 
    1ac8:	2579 0000 55b0 	move.l 55b0 <ClsSprites+0x34>,52(a2)
    1ace:	0034 
    1ad0:	2579 0000 55b4 	move.l 55b4 <ClsSprites+0x38>,56(a2)
    1ad6:	0038 
    1ad8:	2579 0000 55b8 	move.l 55b8 <ClsSprites+0x3c>,60(a2)
    1ade:	003c 
    *cl++ = *clpartinstruction++;
    1ae0:	2579 0000 554c 	move.l 554c <ClScreen>,64(a2)
    1ae6:	0040 
    1ae8:	2579 0000 5550 	move.l 5550 <ClScreen+0x4>,68(a2)
    1aee:	0044 
    1af0:	2579 0000 5554 	move.l 5554 <ClScreen+0x8>,72(a2)
    1af6:	0048 
    1af8:	2579 0000 5558 	move.l 5558 <ClScreen+0xc>,76(a2)
    1afe:	004c 
    1b00:	2579 0000 555c 	move.l 555c <ClScreen+0x10>,80(a2)
    1b06:	0050 
    1b08:	2579 0000 5560 	move.l 5560 <ClScreen+0x14>,84(a2)
    1b0e:	0054 
    1b10:	2579 0000 5564 	move.l 5564 <ClScreen+0x18>,88(a2)
    1b16:	0058 
    1b18:	2579 0000 5568 	move.l 5568 <ClScreen+0x1c>,92(a2)
    1b1e:	005c 
    1b20:	2579 0000 556c 	move.l 556c <ClScreen+0x20>,96(a2)
    1b26:	0060 
    1b28:	2579 0000 5570 	move.l 5570 <ClScreen+0x24>,100(a2)
    1b2e:	0064 
    1b30:	2579 0000 5574 	move.l 5574 <ClScreen+0x28>,104(a2)
    1b36:	0068 
    1b38:	2579 0000 5578 	move.l 5578 <ClScreen+0x2c>,108(a2)
    1b3e:	006c 
  *cl++ = 0x00e00000;
    1b40:	257c 00e0 0000 	move.l #14680064,112(a2)
    1b46:	0070 
  *cl++ = 0x00e20000;
    1b48:	257c 00e2 0000 	move.l #14811136,116(a2)
    1b4e:	0074 
    *cl++ = *clpartinstruction++;
    1b50:	2579 0000 5544 	move.l 5544 <ClColor>,120(a2)
    1b56:	0078 
    1b58:	2579 0000 5548 	move.l 5548 <ClColor+0x4>,124(a2)
    1b5e:	007c 
  *cl = 0xfffffffe;
    1b60:	70fe           	moveq #-2,d0
    1b62:	2540 0080      	move.l d0,128(a2)
}
    1b66:	200a           	move.l a2,d0
    1b68:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1b6c:	4e75           	rts

00001b6e <ClbuildZoom>:
ULONG * ClbuildZoom() {
    1b6e:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    1b72:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
    1b78:	203c 0000 a48c 	move.l #42124,d0
    1b7e:	7202           	moveq #2,d1
    1b80:	4eae ff3a      	jsr -198(a6)
    1b84:	2440           	movea.l d0,a2
  if( retval == 0) {
    1b86:	4a80           	tst.l d0
    1b88:	6700 0160      	beq.w 1cea <ClbuildZoom+0x17c>
    *cl++ = *clpartinstruction++;
    1b8c:	24b9 0000 557c 	move.l 557c <ClsSprites>,(a2)
    1b92:	2579 0000 5580 	move.l 5580 <ClsSprites+0x4>,4(a2)
    1b98:	0004 
    1b9a:	2579 0000 5584 	move.l 5584 <ClsSprites+0x8>,8(a2)
    1ba0:	0008 
    1ba2:	2579 0000 5588 	move.l 5588 <ClsSprites+0xc>,12(a2)
    1ba8:	000c 
    1baa:	2579 0000 558c 	move.l 558c <ClsSprites+0x10>,16(a2)
    1bb0:	0010 
    1bb2:	2579 0000 5590 	move.l 5590 <ClsSprites+0x14>,20(a2)
    1bb8:	0014 
    1bba:	2579 0000 5594 	move.l 5594 <ClsSprites+0x18>,24(a2)
    1bc0:	0018 
    1bc2:	2579 0000 5598 	move.l 5598 <ClsSprites+0x1c>,28(a2)
    1bc8:	001c 
    1bca:	2579 0000 559c 	move.l 559c <ClsSprites+0x20>,32(a2)
    1bd0:	0020 
    1bd2:	2579 0000 55a0 	move.l 55a0 <ClsSprites+0x24>,36(a2)
    1bd8:	0024 
    1bda:	2579 0000 55a4 	move.l 55a4 <ClsSprites+0x28>,40(a2)
    1be0:	0028 
    1be2:	2579 0000 55a8 	move.l 55a8 <ClsSprites+0x2c>,44(a2)
    1be8:	002c 
    1bea:	2579 0000 55ac 	move.l 55ac <ClsSprites+0x30>,48(a2)
    1bf0:	0030 
    1bf2:	2579 0000 55b0 	move.l 55b0 <ClsSprites+0x34>,52(a2)
    1bf8:	0034 
    1bfa:	2579 0000 55b4 	move.l 55b4 <ClsSprites+0x38>,56(a2)
    1c00:	0038 
    1c02:	2579 0000 55b8 	move.l 55b8 <ClsSprites+0x3c>,60(a2)
    1c08:	003c 
    *cl++ = *clpartinstruction++;
    1c0a:	2579 0000 5514 	move.l 5514 <ClScreenZoom>,64(a2)
    1c10:	0040 
    1c12:	2579 0000 5518 	move.l 5518 <ClScreenZoom+0x4>,68(a2)
    1c18:	0044 
    1c1a:	2579 0000 551c 	move.l 551c <ClScreenZoom+0x8>,72(a2)
    1c20:	0048 
    1c22:	2579 0000 5520 	move.l 5520 <ClScreenZoom+0xc>,76(a2)
    1c28:	004c 
    1c2a:	2579 0000 5524 	move.l 5524 <ClScreenZoom+0x10>,80(a2)
    1c30:	0050 
    1c32:	2579 0000 5528 	move.l 5528 <ClScreenZoom+0x14>,84(a2)
    1c38:	0054 
    1c3a:	2579 0000 552c 	move.l 552c <ClScreenZoom+0x18>,88(a2)
    1c40:	0058 
    1c42:	2579 0000 5530 	move.l 5530 <ClScreenZoom+0x1c>,92(a2)
    1c48:	005c 
    1c4a:	2579 0000 5534 	move.l 5534 <ClScreenZoom+0x20>,96(a2)
    1c50:	0060 
    1c52:	2579 0000 5538 	move.l 5538 <ClScreenZoom+0x24>,100(a2)
    1c58:	0064 
    1c5a:	2579 0000 553c 	move.l 553c <ClScreenZoom+0x28>,104(a2)
    1c60:	0068 
    1c62:	2579 0000 5540 	move.l 5540 <ClScreenZoom+0x2c>,108(a2)
    1c68:	006c 
  *cl++ = 0x00e00000;
    1c6a:	257c 00e0 0000 	move.l #14680064,112(a2)
    1c70:	0070 
  *cl++ = 0x00e20000;
    1c72:	257c 00e2 0000 	move.l #14811136,116(a2)
    1c78:	0074 
  *cl++ = 0x00e40000;
    1c7a:	257c 00e4 0000 	move.l #14942208,120(a2)
    1c80:	0078 
  *cl++ = 0x00e60000;
    1c82:	257c 00e6 0000 	move.l #15073280,124(a2)
    1c88:	007c 
    *cl++ = *clpartinstruction++;
    1c8a:	2579 0000 5544 	move.l 5544 <ClColor>,128(a2)
    1c90:	0080 
    1c92:	2579 0000 5548 	move.l 5548 <ClColor+0x4>,132(a2)
    1c98:	0084 
    1c9a:	43ea 012c      	lea 300(a2),a1
    1c9e:	220a           	move.l a2,d1
    1ca0:	0681 0000 a52c 	addi.l #42284,d1
    1ca6:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    1cac:	41e9 ff60      	lea -160(a1),a0
    1cb0:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    1cb4:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    1cba:	5088           	addq.l #8,a0
    1cbc:	217c 0182 0f00 	move.l #25300736,-4(a0)
    1cc2:	fffc 
    for(int i2=0;i2<20;i2++) {
    1cc4:	b3c8           	cmpa.l a0,a1
    1cc6:	66ec           	bne.s 1cb4 <ClbuildZoom+0x146>
    1cc8:	43e8 00a4      	lea 164(a0),a1
    1ccc:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    1cd2:	b3c1           	cmpa.l d1,a1
    1cd4:	66d6           	bne.s 1cac <ClbuildZoom+0x13e>
   *cl = 0xfffffffe;
    1cd6:	203c 0000 a488 	move.l #42120,d0
    1cdc:	72fe           	moveq #-2,d1
    1cde:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    1ce2:	200a           	move.l a2,d0
    1ce4:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1ce8:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1cea:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1cf0:	4eae ffc4      	jsr -60(a6)
    1cf4:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1cfa:	2200           	move.l d0,d1
    1cfc:	243c 0000 2cef 	move.l #11503,d2
    1d02:	7628           	moveq #40,d3
    1d04:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1d08:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1d0e:	7201           	moveq #1,d1
    1d10:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1d14:	24b9 0000 557c 	move.l 557c <ClsSprites>,(a2)
    1d1a:	2579 0000 5580 	move.l 5580 <ClsSprites+0x4>,4(a2)
    1d20:	0004 
    1d22:	2579 0000 5584 	move.l 5584 <ClsSprites+0x8>,8(a2)
    1d28:	0008 
    1d2a:	2579 0000 5588 	move.l 5588 <ClsSprites+0xc>,12(a2)
    1d30:	000c 
    1d32:	2579 0000 558c 	move.l 558c <ClsSprites+0x10>,16(a2)
    1d38:	0010 
    1d3a:	2579 0000 5590 	move.l 5590 <ClsSprites+0x14>,20(a2)
    1d40:	0014 
    1d42:	2579 0000 5594 	move.l 5594 <ClsSprites+0x18>,24(a2)
    1d48:	0018 
    1d4a:	2579 0000 5598 	move.l 5598 <ClsSprites+0x1c>,28(a2)
    1d50:	001c 
    1d52:	2579 0000 559c 	move.l 559c <ClsSprites+0x20>,32(a2)
    1d58:	0020 
    1d5a:	2579 0000 55a0 	move.l 55a0 <ClsSprites+0x24>,36(a2)
    1d60:	0024 
    1d62:	2579 0000 55a4 	move.l 55a4 <ClsSprites+0x28>,40(a2)
    1d68:	0028 
    1d6a:	2579 0000 55a8 	move.l 55a8 <ClsSprites+0x2c>,44(a2)
    1d70:	002c 
    1d72:	2579 0000 55ac 	move.l 55ac <ClsSprites+0x30>,48(a2)
    1d78:	0030 
    1d7a:	2579 0000 55b0 	move.l 55b0 <ClsSprites+0x34>,52(a2)
    1d80:	0034 
    1d82:	2579 0000 55b4 	move.l 55b4 <ClsSprites+0x38>,56(a2)
    1d88:	0038 
    1d8a:	2579 0000 55b8 	move.l 55b8 <ClsSprites+0x3c>,60(a2)
    1d90:	003c 
    *cl++ = *clpartinstruction++;
    1d92:	2579 0000 5514 	move.l 5514 <ClScreenZoom>,64(a2)
    1d98:	0040 
    1d9a:	2579 0000 5518 	move.l 5518 <ClScreenZoom+0x4>,68(a2)
    1da0:	0044 
    1da2:	2579 0000 551c 	move.l 551c <ClScreenZoom+0x8>,72(a2)
    1da8:	0048 
    1daa:	2579 0000 5520 	move.l 5520 <ClScreenZoom+0xc>,76(a2)
    1db0:	004c 
    1db2:	2579 0000 5524 	move.l 5524 <ClScreenZoom+0x10>,80(a2)
    1db8:	0050 
    1dba:	2579 0000 5528 	move.l 5528 <ClScreenZoom+0x14>,84(a2)
    1dc0:	0054 
    1dc2:	2579 0000 552c 	move.l 552c <ClScreenZoom+0x18>,88(a2)
    1dc8:	0058 
    1dca:	2579 0000 5530 	move.l 5530 <ClScreenZoom+0x1c>,92(a2)
    1dd0:	005c 
    1dd2:	2579 0000 5534 	move.l 5534 <ClScreenZoom+0x20>,96(a2)
    1dd8:	0060 
    1dda:	2579 0000 5538 	move.l 5538 <ClScreenZoom+0x24>,100(a2)
    1de0:	0064 
    1de2:	2579 0000 553c 	move.l 553c <ClScreenZoom+0x28>,104(a2)
    1de8:	0068 
    1dea:	2579 0000 5540 	move.l 5540 <ClScreenZoom+0x2c>,108(a2)
    1df0:	006c 
  *cl++ = 0x00e00000;
    1df2:	257c 00e0 0000 	move.l #14680064,112(a2)
    1df8:	0070 
  *cl++ = 0x00e20000;
    1dfa:	257c 00e2 0000 	move.l #14811136,116(a2)
    1e00:	0074 
  *cl++ = 0x00e40000;
    1e02:	257c 00e4 0000 	move.l #14942208,120(a2)
    1e08:	0078 
  *cl++ = 0x00e60000;
    1e0a:	257c 00e6 0000 	move.l #15073280,124(a2)
    1e10:	007c 
    *cl++ = *clpartinstruction++;
    1e12:	2579 0000 5544 	move.l 5544 <ClColor>,128(a2)
    1e18:	0080 
    1e1a:	2579 0000 5548 	move.l 5548 <ClColor+0x4>,132(a2)
    1e20:	0084 
    1e22:	43ea 012c      	lea 300(a2),a1
    1e26:	220a           	move.l a2,d1
    1e28:	0681 0000 a52c 	addi.l #42284,d1
    1e2e:	203c 2c07 fffe 	move.l #738721790,d0
    1e34:	6000 fe76      	bra.w 1cac <ClbuildZoom+0x13e>

00001e38 <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    1e38:	2039 0000 5626 	move.l 5626 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    1e3e:	23f9 0000 561a 	move.l 561a <ViewCopper>,5626 <DrawCopper>
    1e44:	0000 5626 
  ViewCopper = (ULONG *)tmp;
    1e48:	23c0 0000 561a 	move.l d0,561a <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    1e4e:	2079 0000 5616 	movea.l 5616 <hw>,a0
    1e54:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    1e58:	3140 0088      	move.w d0,136(a0)
}
    1e5c:	4e75           	rts

00001e5e <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    1e5e:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    1e62:	45fa fd0a      	lea 1b6e <ClbuildZoom>(pc),a2
    1e66:	4e92           	jsr (a2)
    1e68:	23c0 0000 563a 	move.l d0,563a <Copperlist1>
  Copperlist2 = ClbuildZoom();
    1e6e:	4e92           	jsr (a2)
    1e70:	23c0 0000 5636 	move.l d0,5636 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1e76:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
    1e7c:	203c 0001 4a00 	move.l #84480,d0
    1e82:	7202           	moveq #2,d1
    1e84:	4eae ff3a      	jsr -198(a6)
    1e88:	23c0 0000 5632 	move.l d0,5632 <Bitplane1>
  if(Bitplane1 == 0) {
    1e8e:	6700 014e      	beq.w 1fde <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    1e92:	23c0 0000 562a 	move.l d0,562a <DrawBuffer>
  DrawCopper = Copperlist1;
    1e98:	23f9 0000 563a 	move.l 563a <Copperlist1>,5626 <DrawCopper>
    1e9e:	0000 5626 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1ea2:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
    1ea8:	203c 0001 4a00 	move.l #84480,d0
    1eae:	7202           	moveq #2,d1
    1eb0:	4eae ff3a      	jsr -198(a6)
    1eb4:	2400           	move.l d0,d2
    1eb6:	23c0 0000 5622 	move.l d0,5622 <Bitplane2>
  if(Bitplane2 == 0) {
    1ebc:	6778           	beq.s 1f36 <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    1ebe:	23f9 0000 5636 	move.l 5636 <Copperlist2>,561a <ViewCopper>
    1ec4:	0000 561a 
  SwapCl();
    1ec8:	45fa ff6e      	lea 1e38 <SwapCl>(pc),a2
    1ecc:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    1ece:	2039 0000 562a 	move.l 562a <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    1ed4:	2079 0000 5626 	movea.l 5626 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    1eda:	2200           	move.l d0,d1
    1edc:	4241           	clr.w d1
    1ede:	4841           	swap d1
    1ee0:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    1ee4:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    1ee8:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    1eee:	2200           	move.l d0,d1
    1ef0:	4241           	clr.w d1
    1ef2:	4841           	swap d1
    1ef4:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    1ef8:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    1efc:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    1efe:	2079 0000 5626 	movea.l 5626 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    1f04:	2002           	move.l d2,d0
    1f06:	4240           	clr.w d0
    1f08:	4840           	swap d0
    1f0a:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    1f0e:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    1f12:	2002           	move.l d2,d0
    1f14:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    1f1a:	2200           	move.l d0,d1
    1f1c:	4241           	clr.w d1
    1f1e:	4841           	swap d1
    1f20:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    1f24:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    1f28:	23c2 0000 561e 	move.l d2,561e <ViewBuffer>
}
    1f2e:	7000           	moveq #0,d0
    1f30:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1f34:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    1f36:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1f3c:	4eae ffc4      	jsr -60(a6)
    1f40:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1f46:	2200           	move.l d0,d1
    1f48:	243c 0000 2d3c 	move.l #11580,d2
    1f4e:	7626           	moveq #38,d3
    1f50:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1f54:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1f5a:	7201           	moveq #1,d1
    1f5c:	4eae ff70      	jsr -144(a6)
    1f60:	2439 0000 5622 	move.l 5622 <Bitplane2>,d2
  ViewCopper = Copperlist2;
    1f66:	23f9 0000 5636 	move.l 5636 <Copperlist2>,561a <ViewCopper>
    1f6c:	0000 561a 
  SwapCl();
    1f70:	45fa fec6      	lea 1e38 <SwapCl>(pc),a2
    1f74:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    1f76:	2039 0000 562a 	move.l 562a <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    1f7c:	2079 0000 5626 	movea.l 5626 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    1f82:	2200           	move.l d0,d1
    1f84:	4241           	clr.w d1
    1f86:	4841           	swap d1
    1f88:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    1f8c:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    1f90:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    1f96:	2200           	move.l d0,d1
    1f98:	4241           	clr.w d1
    1f9a:	4841           	swap d1
    1f9c:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    1fa0:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    1fa4:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    1fa6:	2079 0000 5626 	movea.l 5626 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    1fac:	2002           	move.l d2,d0
    1fae:	4240           	clr.w d0
    1fb0:	4840           	swap d0
    1fb2:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    1fb6:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    1fba:	2002           	move.l d2,d0
    1fbc:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    1fc2:	2200           	move.l d0,d1
    1fc4:	4241           	clr.w d1
    1fc6:	4841           	swap d1
    1fc8:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    1fcc:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    1fd0:	23c2 0000 561e 	move.l d2,561e <ViewBuffer>
}
    1fd6:	7000           	moveq #0,d0
    1fd8:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1fdc:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    1fde:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1fe4:	4eae ffc4      	jsr -60(a6)
    1fe8:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    1fee:	2200           	move.l d0,d1
    1ff0:	243c 0000 2d15 	move.l #11541,d2
    1ff6:	7626           	moveq #38,d3
    1ff8:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1ffc:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    2002:	7201           	moveq #1,d1
    2004:	4eae ff70      	jsr -144(a6)
    2008:	2039 0000 5632 	move.l 5632 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    200e:	23c0 0000 562a 	move.l d0,562a <DrawBuffer>
  DrawCopper = Copperlist1;
    2014:	23f9 0000 563a 	move.l 563a <Copperlist1>,5626 <DrawCopper>
    201a:	0000 5626 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    201e:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
    2024:	203c 0001 4a00 	move.l #84480,d0
    202a:	7202           	moveq #2,d1
    202c:	4eae ff3a      	jsr -198(a6)
    2030:	2400           	move.l d0,d2
    2032:	23c0 0000 5622 	move.l d0,5622 <Bitplane2>
  if(Bitplane2 == 0) {
    2038:	6600 fe84      	bne.w 1ebe <PrepareDisplayZoom+0x60>
    203c:	6000 fef8      	bra.w 1f36 <PrepareDisplayZoom+0xd8>

00002040 <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    2040:	2039 0000 562a 	move.l 562a <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    2046:	2079 0000 5626 	movea.l 5626 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    204c:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    2050:	2200           	move.l d0,d1
    2052:	4241           	clr.w d1
    2054:	4841           	swap d1
    2056:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    205a:	23f9 0000 561e 	move.l 561e <ViewBuffer>,562a <DrawBuffer>
    2060:	0000 562a 
  ViewBuffer = (ULONG *) tmp;
    2064:	23c0 0000 561e 	move.l d0,561e <ViewBuffer>
}
    206a:	4e75           	rts

0000206c <PrepareDisplay>:
 int PrepareDisplaySW() {
    206c:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClbuildSW();
    2070:	45fa f89e      	lea 1910 <ClBuild>(pc),a2
    2074:	4e92           	jsr (a2)
    2076:	23c0 0000 563a 	move.l d0,563a <Copperlist1>
  Copperlist2 = ClbuildSW();
    207c:	4e92           	jsr (a2)
    207e:	23c0 0000 5636 	move.l d0,5636 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    2084:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
    208a:	203c 0000 c800 	move.l #51200,d0
    2090:	7202           	moveq #2,d1
    2092:	4eae ff3a      	jsr -198(a6)
    2096:	23c0 0000 5632 	move.l d0,5632 <Bitplane1>
  if(Bitplane1 == 0) {
    209c:	6700 00ac      	beq.w 214a <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    20a0:	23c0 0000 562a 	move.l d0,562a <DrawBuffer>
  DrawCopper = Copperlist1;
    20a6:	23f9 0000 563a 	move.l 563a <Copperlist1>,5626 <DrawCopper>
    20ac:	0000 5626 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    20b0:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
    20b6:	203c 0000 c800 	move.l #51200,d0
    20bc:	7202           	moveq #2,d1
    20be:	4eae ff3a      	jsr -198(a6)
    20c2:	23c0 0000 5622 	move.l d0,5622 <Bitplane2>
  if(Bitplane2 == 0) {
    20c8:	6728           	beq.s 20f2 <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    20ca:	23c0 0000 561e 	move.l d0,561e <ViewBuffer>
  ViewCopper = Copperlist2;
    20d0:	23f9 0000 5636 	move.l 5636 <Copperlist2>,561a <ViewCopper>
    20d6:	0000 561a 
  SwapCl();
    20da:	47fa fd5c      	lea 1e38 <SwapCl>(pc),a3
    20de:	4e93           	jsr (a3)
  SetBplPointers();
    20e0:	45fa ff5e      	lea 2040 <SetBplPointers>(pc),a2
    20e4:	4e92           	jsr (a2)
  SwapCl();
    20e6:	4e93           	jsr (a3)
  SetBplPointers();
    20e8:	4e92           	jsr (a2)
}
    20ea:	7000           	moveq #0,d0
    20ec:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    20f0:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    20f2:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    20f8:	4eae ffc4      	jsr -60(a6)
    20fc:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    2102:	2200           	move.l d0,d1
    2104:	243c 0000 2d3c 	move.l #11580,d2
    210a:	7626           	moveq #38,d3
    210c:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2110:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    2116:	7201           	moveq #1,d1
    2118:	4eae ff70      	jsr -144(a6)
    211c:	2039 0000 5622 	move.l 5622 <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    2122:	23c0 0000 561e 	move.l d0,561e <ViewBuffer>
  ViewCopper = Copperlist2;
    2128:	23f9 0000 5636 	move.l 5636 <Copperlist2>,561a <ViewCopper>
    212e:	0000 561a 
  SwapCl();
    2132:	47fa fd04      	lea 1e38 <SwapCl>(pc),a3
    2136:	4e93           	jsr (a3)
  SetBplPointers();
    2138:	45fa ff06      	lea 2040 <SetBplPointers>(pc),a2
    213c:	4e92           	jsr (a2)
  SwapCl();
    213e:	4e93           	jsr (a3)
  SetBplPointers();
    2140:	4e92           	jsr (a2)
}
    2142:	7000           	moveq #0,d0
    2144:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    2148:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    214a:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    2150:	4eae ffc4      	jsr -60(a6)
    2154:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    215a:	2200           	move.l d0,d1
    215c:	243c 0000 2d15 	move.l #11541,d2
    2162:	7626           	moveq #38,d3
    2164:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2168:	2c79 0000 562e 	movea.l 562e <DOSBase>,a6
    216e:	7201           	moveq #1,d1
    2170:	4eae ff70      	jsr -144(a6)
    2174:	2039 0000 5632 	move.l 5632 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    217a:	23c0 0000 562a 	move.l d0,562a <DrawBuffer>
  DrawCopper = Copperlist1;
    2180:	23f9 0000 563a 	move.l 563a <Copperlist1>,5626 <DrawCopper>
    2186:	0000 5626 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    218a:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
    2190:	203c 0000 c800 	move.l #51200,d0
    2196:	7202           	moveq #2,d1
    2198:	4eae ff3a      	jsr -198(a6)
    219c:	23c0 0000 5622 	move.l d0,5622 <Bitplane2>
  if(Bitplane2 == 0) {
    21a2:	6600 ff26      	bne.w 20ca <PrepareDisplay+0x5e>
    21a6:	6000 ff4a      	bra.w 20f2 <PrepareDisplay+0x86>

000021aa <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    21aa:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    21ae:	262f 0010      	move.l 16(sp),d3
    21b2:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    21b6:	2279 0000 563a 	movea.l 563a <Copperlist1>,a1
    21bc:	b2fc 0000      	cmpa.w #0,a1
    21c0:	670c           	beq.s 21ce <FreeDisplay+0x24>
    21c2:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
    21c8:	2003           	move.l d3,d0
    21ca:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    21ce:	2279 0000 5636 	movea.l 5636 <Copperlist2>,a1
    21d4:	b2fc 0000      	cmpa.w #0,a1
    21d8:	670c           	beq.s 21e6 <FreeDisplay+0x3c>
    21da:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
    21e0:	2003           	move.l d3,d0
    21e2:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    21e6:	2279 0000 5632 	movea.l 5632 <Bitplane1>,a1
    21ec:	b2fc 0000      	cmpa.w #0,a1
    21f0:	670c           	beq.s 21fe <FreeDisplay+0x54>
    21f2:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
    21f8:	2002           	move.l d2,d0
    21fa:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    21fe:	2279 0000 5622 	movea.l 5622 <Bitplane2>,a1
    2204:	b2fc 0000      	cmpa.w #0,a1
    2208:	670c           	beq.s 2216 <FreeDisplay+0x6c>
    220a:	2c79 0000 563e 	movea.l 563e <SysBase>,a6
    2210:	2002           	move.l d2,d0
    2212:	4eae ff2e      	jsr -210(a6)
}
    2216:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    221a:	4e75           	rts

0000221c <WaitVbl>:
void WaitVbl() {
    221c:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    221e:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddc24c>,d0
    2224:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    2226:	2017           	move.l (sp),d0
    2228:	0280 0001 ff00 	andi.l #130816,d0
    222e:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    2230:	2017           	move.l (sp),d0
    2232:	0c80 0001 3700 	cmpi.l #79616,d0
    2238:	67e4           	beq.s 221e <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    223a:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddc24c>,d0
    2240:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    2244:	202f 0004      	move.l 4(sp),d0
    2248:	0280 0001 ff00 	andi.l #130816,d0
    224e:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    2252:	202f 0004      	move.l 4(sp),d0
    2256:	0c80 0001 3700 	cmpi.l #79616,d0
    225c:	66dc           	bne.s 223a <WaitVbl+0x1e>
}
    225e:	508f           	addq.l #8,sp
    2260:	4e75           	rts

00002262 <memcpy>:
{
    2262:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    2266:	202f 0014      	move.l 20(sp),d0
    226a:	226f 0018      	movea.l 24(sp),a1
    226e:	222f 001c      	move.l 28(sp),d1
	while(len--)
    2272:	2601           	move.l d1,d3
    2274:	5383           	subq.l #1,d3
    2276:	4a81           	tst.l d1
    2278:	6762           	beq.s 22dc <memcpy+0x7a>
    227a:	2040           	movea.l d0,a0
    227c:	5888           	addq.l #4,a0
    227e:	b1c9           	cmpa.l a1,a0
    2280:	53c2           	sl.s d2
    2282:	4402           	neg.b d2
    2284:	41e9 0004      	lea 4(a1),a0
    2288:	b1c0           	cmpa.l d0,a0
    228a:	53c4           	sl.s d4
    228c:	4404           	neg.b d4
    228e:	8404           	or.b d4,d2
    2290:	7808           	moveq #8,d4
    2292:	b883           	cmp.l d3,d4
    2294:	55c4           	sc.s d4
    2296:	4404           	neg.b d4
    2298:	c404           	and.b d4,d2
    229a:	6746           	beq.s 22e2 <memcpy+0x80>
    229c:	2409           	move.l a1,d2
    229e:	8480           	or.l d0,d2
    22a0:	7803           	moveq #3,d4
    22a2:	c484           	and.l d4,d2
    22a4:	663c           	bne.s 22e2 <memcpy+0x80>
    22a6:	2049           	movea.l a1,a0
    22a8:	2440           	movea.l d0,a2
    22aa:	74fc           	moveq #-4,d2
    22ac:	c481           	and.l d1,d2
    22ae:	d489           	add.l a1,d2
		*d++ = *s++;
    22b0:	24d8           	move.l (a0)+,(a2)+
    22b2:	b488           	cmp.l a0,d2
    22b4:	66fa           	bne.s 22b0 <memcpy+0x4e>
    22b6:	74fc           	moveq #-4,d2
    22b8:	c481           	and.l d1,d2
    22ba:	2040           	movea.l d0,a0
    22bc:	d1c2           	adda.l d2,a0
    22be:	d3c2           	adda.l d2,a1
    22c0:	9682           	sub.l d2,d3
    22c2:	b481           	cmp.l d1,d2
    22c4:	6716           	beq.s 22dc <memcpy+0x7a>
    22c6:	1091           	move.b (a1),(a0)
	while(len--)
    22c8:	4a83           	tst.l d3
    22ca:	6710           	beq.s 22dc <memcpy+0x7a>
		*d++ = *s++;
    22cc:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    22d2:	5383           	subq.l #1,d3
    22d4:	6706           	beq.s 22dc <memcpy+0x7a>
		*d++ = *s++;
    22d6:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    22dc:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    22e0:	4e75           	rts
    22e2:	2040           	movea.l d0,a0
    22e4:	d289           	add.l a1,d1
		*d++ = *s++;
    22e6:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    22e8:	b289           	cmp.l a1,d1
    22ea:	67f0           	beq.s 22dc <memcpy+0x7a>
		*d++ = *s++;
    22ec:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    22ee:	b289           	cmp.l a1,d1
    22f0:	66f4           	bne.s 22e6 <memcpy+0x84>
    22f2:	60e8           	bra.s 22dc <memcpy+0x7a>

000022f4 <memset>:
{
    22f4:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    22f8:	202f 0024      	move.l 36(sp),d0
    22fc:	2a2f 0028      	move.l 40(sp),d5
    2300:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    2304:	2809           	move.l a1,d4
    2306:	5384           	subq.l #1,d4
    2308:	b2fc 0000      	cmpa.w #0,a1
    230c:	6f00 00b0      	ble.w 23be <memset+0xca>
    2310:	1e05           	move.b d5,d7
    2312:	2200           	move.l d0,d1
    2314:	4481           	neg.l d1
    2316:	7403           	moveq #3,d2
    2318:	c282           	and.l d2,d1
    231a:	7c05           	moveq #5,d6
		*ptr++ = val;
    231c:	2440           	movea.l d0,a2
    231e:	bc84           	cmp.l d4,d6
    2320:	646a           	bcc.s 238c <memset+0x98>
    2322:	4a81           	tst.l d1
    2324:	6724           	beq.s 234a <memset+0x56>
    2326:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    2328:	5384           	subq.l #1,d4
    232a:	7401           	moveq #1,d2
    232c:	b481           	cmp.l d1,d2
    232e:	671a           	beq.s 234a <memset+0x56>
		*ptr++ = val;
    2330:	2440           	movea.l d0,a2
    2332:	548a           	addq.l #2,a2
    2334:	2040           	movea.l d0,a0
    2336:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    233a:	5384           	subq.l #1,d4
    233c:	7403           	moveq #3,d2
    233e:	b481           	cmp.l d1,d2
    2340:	6608           	bne.s 234a <memset+0x56>
		*ptr++ = val;
    2342:	528a           	addq.l #1,a2
    2344:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    2348:	5384           	subq.l #1,d4
    234a:	2609           	move.l a1,d3
    234c:	9681           	sub.l d1,d3
    234e:	7c00           	moveq #0,d6
    2350:	1c05           	move.b d5,d6
    2352:	2406           	move.l d6,d2
    2354:	4842           	swap d2
    2356:	4242           	clr.w d2
    2358:	2042           	movea.l d2,a0
    235a:	2406           	move.l d6,d2
    235c:	e14a           	lsl.w #8,d2
    235e:	4842           	swap d2
    2360:	4242           	clr.w d2
    2362:	e18e           	lsl.l #8,d6
    2364:	2646           	movea.l d6,a3
    2366:	2c08           	move.l a0,d6
    2368:	8486           	or.l d6,d2
    236a:	2c0b           	move.l a3,d6
    236c:	8486           	or.l d6,d2
    236e:	1407           	move.b d7,d2
    2370:	2040           	movea.l d0,a0
    2372:	d1c1           	adda.l d1,a0
    2374:	72fc           	moveq #-4,d1
    2376:	c283           	and.l d3,d1
    2378:	d288           	add.l a0,d1
		*ptr++ = val;
    237a:	20c2           	move.l d2,(a0)+
    237c:	b1c1           	cmpa.l d1,a0
    237e:	66fa           	bne.s 237a <memset+0x86>
    2380:	72fc           	moveq #-4,d1
    2382:	c283           	and.l d3,d1
    2384:	d5c1           	adda.l d1,a2
    2386:	9881           	sub.l d1,d4
    2388:	b283           	cmp.l d3,d1
    238a:	6732           	beq.s 23be <memset+0xca>
    238c:	1485           	move.b d5,(a2)
	while(len-- > 0)
    238e:	4a84           	tst.l d4
    2390:	6f2c           	ble.s 23be <memset+0xca>
		*ptr++ = val;
    2392:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    2396:	7201           	moveq #1,d1
    2398:	b284           	cmp.l d4,d1
    239a:	6c22           	bge.s 23be <memset+0xca>
		*ptr++ = val;
    239c:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    23a0:	7402           	moveq #2,d2
    23a2:	b484           	cmp.l d4,d2
    23a4:	6c18           	bge.s 23be <memset+0xca>
		*ptr++ = val;
    23a6:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    23aa:	7c03           	moveq #3,d6
    23ac:	bc84           	cmp.l d4,d6
    23ae:	6c0e           	bge.s 23be <memset+0xca>
		*ptr++ = val;
    23b0:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    23b4:	7204           	moveq #4,d1
    23b6:	b284           	cmp.l d4,d1
    23b8:	6c04           	bge.s 23be <memset+0xca>
		*ptr++ = val;
    23ba:	1545 0005      	move.b d5,5(a2)
}
    23be:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    23c2:	4e75           	rts

000023c4 <strlen>:
{
    23c4:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    23c8:	7000           	moveq #0,d0
	while(*s++)
    23ca:	4a10           	tst.b (a0)
    23cc:	6708           	beq.s 23d6 <strlen+0x12>
		t++;
    23ce:	5280           	addq.l #1,d0
	while(*s++)
    23d0:	4a30 0800      	tst.b (0,a0,d0.l)
    23d4:	66f8           	bne.s 23ce <strlen+0xa>
}
    23d6:	4e75           	rts

000023d8 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    23d8:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    23dc:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    23e0:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    23e4:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    23e8:	d041           	add.w d1,d0
	swap	d0
    23ea:	4840           	swap d0
	clrw	d0
    23ec:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    23ee:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    23f2:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    23f6:	d081           	add.l d1,d0

	rts
    23f8:	4e75           	rts

000023fa <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    23fa:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    23fc:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    2400:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    2404:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    240a:	6416           	bcc.s 2422 <__udivsi3+0x28>
	movel	d0, d2
    240c:	2400           	move.l d0,d2
	clrw	d2
    240e:	4242           	clr.w d2
	swap	d2
    2410:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    2412:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    2414:	3002           	move.w d2,d0
	swap	d0
    2416:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    2418:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    241c:	84c1           	divu.w d1,d2
	movew	d2, d0
    241e:	3002           	move.w d2,d0
	jra	6f
    2420:	6030           	bra.s 2452 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    2422:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    2424:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    2426:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    2428:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    242e:	64f4           	bcc.s 2424 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    2430:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    2432:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    2438:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    243a:	c2c0           	mulu.w d0,d1
	swap	d2
    243c:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    243e:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    2440:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    2442:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    2444:	660a           	bne.s 2450 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    2446:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    2448:	6506           	bcs.s 2450 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    244a:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    244e:	6302           	bls.s 2452 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    2450:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    2452:	241f           	move.l (sp)+,d2
	rts
    2454:	4e75           	rts

00002456 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    2456:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    2458:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    245a:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    245e:	6a04           	bpl.s 2464 <__divsi3+0xe>
	negl	d1
    2460:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    2462:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    2464:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    2468:	6a04           	bpl.s 246e <__divsi3+0x18>
	negl	d0
    246a:	4480           	neg.l d0
	negb	d2
    246c:	4402           	neg.b d2

2:	movel	d1, sp@-
    246e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2470:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    2472:	6186           	bsr.s 23fa <__udivsi3>
	addql	IMM (8), sp
    2474:	508f           	addq.l #8,sp

	tstb	d2
    2476:	4a02           	tst.b d2
	jpl	3f
    2478:	6a02           	bpl.s 247c <__divsi3+0x26>
	negl	d0
    247a:	4480           	neg.l d0

3:	movel	sp@+, d2
    247c:	241f           	move.l (sp)+,d2
	rts
    247e:	4e75           	rts

00002480 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    2480:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    2484:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    2488:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    248a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    248c:	61c8           	bsr.s 2456 <__divsi3>
	addql	IMM (8), sp
    248e:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    2490:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    2494:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    2496:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    2498:	6100 ff3e      	bsr.w 23d8 <__mulsi3>
	addql	IMM (8), sp
    249c:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    249e:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    24a2:	9280           	sub.l d0,d1
	movel	d1, d0
    24a4:	2001           	move.l d1,d0
	rts
    24a6:	4e75           	rts

000024a8 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    24a8:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    24ac:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    24b0:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    24b2:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    24b4:	6100 ff44      	bsr.w 23fa <__udivsi3>
	addql	IMM (8), sp
    24b8:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    24ba:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    24be:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    24c0:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    24c2:	6100 ff14      	bsr.w 23d8 <__mulsi3>
	addql	IMM (8), sp
    24c6:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    24c8:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    24cc:	9280           	sub.l d0,d1
	movel	d1, d0
    24ce:	2001           	move.l d1,d0
	rts
    24d0:	4e75           	rts

000024d2 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    24d2:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    24d4:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    24d8:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    24dc:	2c5f           	movea.l (sp)+,a6
    rts
    24de:	4e75           	rts

000024e0 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    24e0:	16c0           	move.b d0,(a3)+
	rts
    24e2:	4e75           	rts

000024e4 <saveregs>:
	...

00002520 <font2distance>:
    2520:	0505           	btst d2,d5
    2522:	0505           	btst d2,d5
    2524:	0505           	btst d2,d5
    2526:	0505           	btst d2,d5
    2528:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    252a:	0505           	btst d2,d5
    252c:	0505           	btst d2,d5
    252e:	0005 0505      	ori.b #5,d5
    2532:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    2534:	0505           	btst d2,d5
    2536:	0505           	btst d2,d5
    2538:	0505           	btst d2,d5
    253a:	0505           	btst d2,d5
    253c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    253e:	0505           	btst d2,d5
    2540:	0505           	btst d2,d5
    2542:	0505           	btst d2,d5
    2544:	0505           	btst d2,d5
    2546:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    2548:	0500           	btst d2,d0
    254a:	0505           	btst d2,d5
    254c:	0505           	btst d2,d5
    254e:	0505           	btst d2,d5
    2550:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    2552:	0505           	btst d2,d5
    2554:	0505           	btst d2,d5
    2556:	0505           	btst d2,d5
    2558:	0505           	btst d2,d5
    255a:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    255c:	0505           	btst d2,d5
    255e:	0505           	btst d2,d5
    2560:	0503           	btst d2,d3
    2562:	0505           	btst d2,d5
    2564:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    2566:	0505           	btst d2,d5
    2568:	0500           	btst d2,d0
    256a:	0505           	btst d2,d5
    256c:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    2570:	0505           	btst d2,d5
    2572:	0503           	btst d2,d3
    2574:	0205 0507      	andi.b #7,d5
    2578:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    257a:	0505           	btst d2,d5
    257c:	0505           	btst d2,d5
    257e:	0505           	btst d2,d5
    2580:	0505           	btst d2,d5
    2582:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2584:	0505           	btst d2,d5
    2586:	0505           	btst d2,d5
    2588:	0505           	btst d2,d5
    258a:	0505           	btst d2,d5
    258c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    258e:	0505           	btst d2,d5
    2590:	0505           	btst d2,d5
    2592:	0505           	btst d2,d5
    2594:	0505           	btst d2,d5
    2596:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2598:	0505           	btst d2,d5
    259a:	0505           	btst d2,d5
    259c:	0505           	btst d2,d5
    259e:	0505           	btst d2,d5
    25a0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    25a2:	0505           	btst d2,d5
    25a4:	0505           	btst d2,d5
    25a6:	0505           	btst d2,d5
    25a8:	0505           	btst d2,d5
    25aa:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    25ac:	0505           	btst d2,d5
    25ae:	0505           	btst d2,d5
    25b0:	0505           	btst d2,d5
    25b2:	0505           	btst d2,d5
    25b4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    25b6:	0505           	btst d2,d5
    25b8:	0505           	btst d2,d5
    25ba:	0505           	btst d2,d5
    25bc:	0505           	btst d2,d5
    25be:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    25c0:	0505           	btst d2,d5
    25c2:	0505           	btst d2,d5
    25c4:	0505           	btst d2,d5
    25c6:	0505           	btst d2,d5
    25c8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    25ca:	0505           	btst d2,d5
    25cc:	0505           	btst d2,d5
    25ce:	0505           	btst d2,d5
    25d0:	0505           	btst d2,d5
    25d2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    25d4:	0505           	btst d2,d5
    25d6:	0505           	btst d2,d5
    25d8:	0505           	btst d2,d5
    25da:	0505           	btst d2,d5
    25dc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    25de:	0505           	btst d2,d5
    25e0:	0505           	btst d2,d5
    25e2:	0505           	btst d2,d5
    25e4:	0505           	btst d2,d5
    25e6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    25e8:	0505           	btst d2,d5
    25ea:	0505           	btst d2,d5
    25ec:	0505           	btst d2,d5
    25ee:	0505           	btst d2,d5
    25f0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    25f2:	0505           	btst d2,d5
    25f4:	0505           	btst d2,d5
    25f6:	0505           	btst d2,d5
    25f8:	0505           	btst d2,d5
    25fa:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    25fc:	0505           	btst d2,d5
    25fe:	0505           	btst d2,d5
    2600:	0505           	btst d2,d5
    2602:	0505           	btst d2,d5
    2604:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2606:	0505           	btst d2,d5
    2608:	0505           	btst d2,d5
    260a:	0505           	btst d2,d5
    260c:	0505           	btst d2,d5
    260e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2610:	0505           	btst d2,d5
    2612:	0505           	btst d2,d5
    2614:	0505           	btst d2,d5
    2616:	0505           	btst d2,d5
    2618:	0505           	btst d2,d5

0000261a <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    261a:	16c0           	move.b d0,(a3)+
  RTS
    261c:	4e75           	rts

0000261e <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    261e:	48f9 7fff 0000 	movem.l d0-a6,24e4 <saveregs>
    2624:	24e4 
  lea 0xdff000,a5
    2626:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddc248>,a5
  move.l sp@(4),a0  //Fontlocation
    262c:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    2630:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    2634:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    2638:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    263a:	082d 0006 0002 	btst #6,2(a5)

00002640 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    2640:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    2646:	66f8           	bne.s 2640 <st2wblit>

00002648 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    2648:	7019           	moveq #25,d0
	sub.l d5,d5      
    264a:	9a85           	sub.l d5,d5

0000264c <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    264c:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    264e:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    2650:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    2654:	9dce           	suba.l a6,a6
	move.l d2, a6
    2656:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    2658:	ddfc 0000 2520 	adda.l #9504,a6

	LSL  	#4,d2 	    //Fetch next char
    265e:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    2660:	2842           	movea.l d2,a4


	move.l  #0,d4
    2662:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    2664:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    2666:	3814           	move.w (a4),d4
	swap	d4
    2668:	4844           	swap d4
	lsr.l	d5, d4
    266a:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    266c:	8993           	or.l d4,(a3)
	clr.l	d4
    266e:	4284           	clr.l d4
	move.w  2(a4), d4
    2670:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    2674:	4844           	swap d4
	lsr.l	d5, d4
    2676:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    2678:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    267c:	4284           	clr.l d4
	move.w  4(a4), d4
    267e:	382c 0004      	move.w 4(a4),d4
	swap	d4
    2682:	4844           	swap d4
	lsr.l	d5, d4
    2684:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    2686:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    268a:	4284           	clr.l d4
	move.w  6(a4), d4
    268c:	382c 0006      	move.w 6(a4),d4
	swap	d4
    2690:	4844           	swap d4
	lsr.l	d5, d4
    2692:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    2694:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    2698:	4284           	clr.l d4
	move.w  8(a4), d4
    269a:	382c 0008      	move.w 8(a4),d4
	swap	d4
    269e:	4844           	swap d4
	lsr.l	d5, d4
    26a0:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    26a2:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    26a6:	4284           	clr.l d4
	move.w  10(a4), d4
    26a8:	382c 000a      	move.w 10(a4),d4
	swap	d4
    26ac:	4844           	swap d4
	lsr.l	d5, d4
    26ae:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    26b0:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    26b4:	4284           	clr.l d4
	move.w  12(a4), d4
    26b6:	382c 000c      	move.w 12(a4),d4
	swap	d4
    26ba:	4844           	swap d4
	lsr.l	d5, d4
    26bc:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    26be:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    26c2:	4284           	clr.l d4
	move.w  14(a4), d4
    26c4:	382c 000e      	move.w 14(a4),d4
	swap	d4
    26c8:	4844           	swap d4
	lsr.l	d5, d4
    26ca:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    26cc:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    26d0:	4284           	clr.l d4

	add.b   (a6), d5
    26d2:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    26d4:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    26d8:	6500 0006      	bcs.w 26e0 <noadditionalchar>
	addq.w  #1, a3
    26dc:	524b           	addq.w #1,a3
	sub.w   #8,d5
    26de:	5145           	subq.w #8,d5

000026e0 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    26e0:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    26e2:	51c8 ff68      	dbf d0,264c <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    26e6:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    26ea:	51cb ff5c      	dbf d3,2648 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    26ee:	4cfa 7fff fdf2 	movem.l 24e4 <saveregs>(pc),d0-a6

	RTS
    26f4:	4e75           	rts
