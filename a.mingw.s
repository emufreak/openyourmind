
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
       6:	4e55 ffb0      	link.w a5,#-80
       a:	48e7 313a      	movem.l d2-d3/d7/a2-a4/a6,-(sp)

  SysBase = *((struct ExecBase**)4UL);
       e:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      12:	23ce 0000 4bae 	move.l a6,4bae <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,4b86 <hw>
      1e:	0000 4b86 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 2523 	lea 2523 <incbin_swfont_end+0xbd>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 4b82 	move.l d0,4b82 <GfxBase>
	if (!GfxBase)
      34:	6700 0c9a      	beq.w cd0 <main+0xcca>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 4bae 	movea.l 4bae <SysBase>,a6
      3e:	43f9 0000 2534 	lea 2534 <incbin_swfont_end+0xce>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 4b9e 	move.l d0,4b9e <DOSBase>
	if (!DOSBase)
      50:	6700 0ca6      	beq.w cf8 <main+0xcf2>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 2540 	pea 2540 <incbin_swfont_end+0xda>
      5a:	4eb9 0000 0e78 	jsr e78 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 255c 	move.l #9564,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      7e:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
      84:	4eae ffc4      	jsr -60(a6)
      88:	2079 0000 4b86 	movea.l 4b86 <hw>,a0
      8e:	2628 0080      	move.l 128(a0),d3
      92:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
      98:	2200           	move.l d0,d1
      9a:	243c 0000 256c 	move.l #9580,d2
      a0:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      a4:	47f9 0000 10d4 	lea 10d4 <ClBuild>,a3
      aa:	4e93           	jsr (a3)
      ac:	2440           	movea.l d0,a2
      ae:	23c0 0000 4baa 	move.l d0,4baa <Copperlist1>
  DrawCopper = Copperlist1;
      b4:	23c0 0000 4b96 	move.l d0,4b96 <DrawCopper>
  Copperlist2 = ClBuild();
      ba:	4e93           	jsr (a3)
      bc:	23c0 0000 4ba6 	move.l d0,4ba6 <Copperlist2>
  ViewCopper = Copperlist2;
      c2:	23c0 0000 4b8a 	move.l d0,4b8a <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      c8:	588f           	addq.l #4,sp
      ca:	2012           	move.l (a2),d0
      cc:	b0b9 0000 4af0 	cmp.l 4af0 <ClsSprites>,d0
      d2:	6600 0aca      	bne.w b9e <main+0xb98>
      d6:	206a 0004      	movea.l 4(a2),a0
      da:	b1f9 0000 4af4 	cmpa.l 4af4 <ClsSprites+0x4>,a0
      e0:	6600 0abc      	bne.w b9e <main+0xb98>
      e4:	202a 0008      	move.l 8(a2),d0
      e8:	b0b9 0000 4af8 	cmp.l 4af8 <ClsSprites+0x8>,d0
      ee:	6600 0aae      	bne.w b9e <main+0xb98>
      f2:	206a 000c      	movea.l 12(a2),a0
      f6:	b1f9 0000 4afc 	cmpa.l 4afc <ClsSprites+0xc>,a0
      fc:	6600 0aa0      	bne.w b9e <main+0xb98>
     100:	202a 0010      	move.l 16(a2),d0
     104:	b0b9 0000 4b00 	cmp.l 4b00 <ClsSprites+0x10>,d0
     10a:	6600 0a92      	bne.w b9e <main+0xb98>
     10e:	206a 0014      	movea.l 20(a2),a0
     112:	b1f9 0000 4b04 	cmpa.l 4b04 <ClsSprites+0x14>,a0
     118:	6600 0a84      	bne.w b9e <main+0xb98>
     11c:	202a 0018      	move.l 24(a2),d0
     120:	b0b9 0000 4b08 	cmp.l 4b08 <ClsSprites+0x18>,d0
     126:	6600 0a76      	bne.w b9e <main+0xb98>
     12a:	206a 001c      	movea.l 28(a2),a0
     12e:	b1f9 0000 4b0c 	cmpa.l 4b0c <ClsSprites+0x1c>,a0
     134:	6600 0a68      	bne.w b9e <main+0xb98>
     138:	202a 0020      	move.l 32(a2),d0
     13c:	b0b9 0000 4b10 	cmp.l 4b10 <ClsSprites+0x20>,d0
     142:	6600 0a5a      	bne.w b9e <main+0xb98>
     146:	206a 0024      	movea.l 36(a2),a0
     14a:	b1f9 0000 4b14 	cmpa.l 4b14 <ClsSprites+0x24>,a0
     150:	6600 0a4c      	bne.w b9e <main+0xb98>
     154:	202a 0028      	move.l 40(a2),d0
     158:	b0b9 0000 4b18 	cmp.l 4b18 <ClsSprites+0x28>,d0
     15e:	6600 0a3e      	bne.w b9e <main+0xb98>
     162:	206a 002c      	movea.l 44(a2),a0
     166:	b1f9 0000 4b1c 	cmpa.l 4b1c <ClsSprites+0x2c>,a0
     16c:	6600 0a30      	bne.w b9e <main+0xb98>
     170:	202a 0030      	move.l 48(a2),d0
     174:	b0b9 0000 4b20 	cmp.l 4b20 <ClsSprites+0x30>,d0
     17a:	6600 0a22      	bne.w b9e <main+0xb98>
     17e:	206a 0034      	movea.l 52(a2),a0
     182:	b1f9 0000 4b24 	cmpa.l 4b24 <ClsSprites+0x34>,a0
     188:	6600 0a14      	bne.w b9e <main+0xb98>
     18c:	202a 0038      	move.l 56(a2),d0
     190:	b0b9 0000 4b28 	cmp.l 4b28 <ClsSprites+0x38>,d0
     196:	6600 0a06      	bne.w b9e <main+0xb98>
     19a:	246a 003c      	movea.l 60(a2),a2
     19e:	b5f9 0000 4b2c 	cmpa.l 4b2c <ClsSprites+0x3c>,a2
     1a4:	6600 09f8      	bne.w b9e <main+0xb98>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1a8:	2079 0000 4baa 	movea.l 4baa <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ae:	2039 0000 4ac0 	move.l 4ac0 <ClScreen>,d0
     1b4:	b0a8 0040      	cmp.l 64(a0),d0
     1b8:	6600 0a06      	bne.w bc0 <main+0xbba>
     1bc:	2039 0000 4ac4 	move.l 4ac4 <ClScreen+0x4>,d0
     1c2:	b0a8 0044      	cmp.l 68(a0),d0
     1c6:	6600 09f8      	bne.w bc0 <main+0xbba>
     1ca:	2039 0000 4ac8 	move.l 4ac8 <ClScreen+0x8>,d0
     1d0:	b0a8 0048      	cmp.l 72(a0),d0
     1d4:	6600 09ea      	bne.w bc0 <main+0xbba>
     1d8:	2039 0000 4acc 	move.l 4acc <ClScreen+0xc>,d0
     1de:	b0a8 004c      	cmp.l 76(a0),d0
     1e2:	6600 09dc      	bne.w bc0 <main+0xbba>
     1e6:	2028 0050      	move.l 80(a0),d0
     1ea:	b0b9 0000 4ad0 	cmp.l 4ad0 <ClScreen+0x10>,d0
     1f0:	6600 09ce      	bne.w bc0 <main+0xbba>
     1f4:	2039 0000 4ad4 	move.l 4ad4 <ClScreen+0x14>,d0
     1fa:	b0a8 0054      	cmp.l 84(a0),d0
     1fe:	6600 09c0      	bne.w bc0 <main+0xbba>
     202:	2028 0058      	move.l 88(a0),d0
     206:	b0b9 0000 4ad8 	cmp.l 4ad8 <ClScreen+0x18>,d0
     20c:	6600 09b2      	bne.w bc0 <main+0xbba>
     210:	2028 005c      	move.l 92(a0),d0
     214:	b0b9 0000 4adc 	cmp.l 4adc <ClScreen+0x1c>,d0
     21a:	6600 09a4      	bne.w bc0 <main+0xbba>
     21e:	2028 0060      	move.l 96(a0),d0
     222:	b0b9 0000 4ae0 	cmp.l 4ae0 <ClScreen+0x20>,d0
     228:	6600 0996      	bne.w bc0 <main+0xbba>
     22c:	2028 0064      	move.l 100(a0),d0
     230:	b0b9 0000 4ae4 	cmp.l 4ae4 <ClScreen+0x24>,d0
     236:	6600 0988      	bne.w bc0 <main+0xbba>
     23a:	2028 0068      	move.l 104(a0),d0
     23e:	b0b9 0000 4ae8 	cmp.l 4ae8 <ClScreen+0x28>,d0
     244:	6600 097a      	bne.w bc0 <main+0xbba>
     248:	2068 006c      	movea.l 108(a0),a0
     24c:	b1f9 0000 4aec 	cmpa.l 4aec <ClScreen+0x2c>,a0
     252:	6600 096c      	bne.w bc0 <main+0xbba>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = 0x40000;
     256:	23fc 0004 0000 	move.l #262144,4b9a <DrawBuffer>
     25c:	0000 4b9a 
  ViewBuffer = 0x50000;
     260:	23fc 0005 0000 	move.l #327680,4b8e <ViewBuffer>
     266:	0000 4b8e 
  SetBplPointers();
     26a:	45f9 0000 1804 	lea 1804 <SetBplPointers>,a2
     270:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     272:	0cb9 0005 0000 	cmpi.l #327680,4b9a <DrawBuffer>
     278:	0000 4b9a 
     27c:	6700 0a86      	beq.w d04 <main+0xcfe>
    Write( Output(), 
     280:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     286:	4eae ffc4      	jsr -60(a6)
     28a:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     290:	2200           	move.l d0,d1
     292:	243c 0000 256f 	move.l #9583,d2
     298:	763b           	moveq #59,d3
     29a:	4eae ffd0      	jsr -48(a6)
  int test1 = instructions[pos];
     29e:	2079 0000 4baa 	movea.l 4baa <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2a4:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2aa:	0070 
     2ac:	6724           	beq.s 2d2 <main+0x2cc>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ae:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     2b4:	4eae ffc4      	jsr -60(a6)
     2b8:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     2be:	2200           	move.l d0,d1
     2c0:	243c 0000 25ab 	move.l #9643,d2
     2c6:	763c           	moveq #60,d3
     2c8:	4eae ffd0      	jsr -48(a6)
     2cc:	2079 0000 4baa 	movea.l 4baa <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2d2:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2d8:	0074 
     2da:	6724           	beq.s 300 <main+0x2fa>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2dc:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     2e2:	4eae ffc4      	jsr -60(a6)
     2e6:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     2ec:	2200           	move.l d0,d1
     2ee:	243c 0000 25e8 	move.l #9704,d2
     2f4:	763c           	moveq #60,d3
     2f6:	4eae ffd0      	jsr -48(a6)
     2fa:	2079 0000 4baa 	movea.l 4baa <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     300:	2039 0000 4ab8 	move.l 4ab8 <ClColor>,d0
     306:	b0a8 0078      	cmp.l 120(a0),d0
     30a:	6600 0a28      	bne.w d34 <main+0xd2e>
     30e:	2028 007c      	move.l 124(a0),d0
     312:	b0b9 0000 4abc 	cmp.l 4abc <ClColor+0x4>,d0
     318:	6600 0a1a      	bne.w d34 <main+0xd2e>
  if( instructions[pos] == value ) 
     31c:	70fe           	moveq #-2,d0
     31e:	b0a8 0080      	cmp.l 128(a0),d0
     322:	671e           	beq.s 342 <main+0x33c>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     324:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     32a:	4eae ffc4      	jsr -60(a6)
     32e:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     334:	2200           	move.l d0,d1
     336:	243c 0000 2647 	move.l #9799,d2
     33c:	7622           	moveq #34,d3
     33e:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     342:	47f9 0000 15fc 	lea 15fc <SwapCl>,a3
     348:	4e93           	jsr (a3)
  if( DrawCopper != Copperlist2)
     34a:	2079 0000 4b96 	movea.l 4b96 <DrawCopper>,a0
     350:	b1f9 0000 4ba6 	cmpa.l 4ba6 <Copperlist2>,a0
     356:	671e           	beq.s 376 <main+0x370>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     358:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     35e:	4eae ffc4      	jsr -60(a6)
     362:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     368:	2200           	move.l d0,d1
     36a:	243c 0000 266a 	move.l #9834,d2
     370:	7615           	moveq #21,d3
     372:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     376:	49f9 0000 1830 	lea 1830 <PrepareDisplay>,a4
     37c:	4e94           	jsr (a4)
  if( DrawBuffer != Bitplane1) 
     37e:	2039 0000 4b9a 	move.l 4b9a <DrawBuffer>,d0
     384:	b0b9 0000 4ba2 	cmp.l 4ba2 <Bitplane1>,d0
     38a:	671e           	beq.s 3aa <main+0x3a4>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     38c:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     392:	4eae ffc4      	jsr -60(a6)
     396:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     39c:	2200           	move.l d0,d1
     39e:	243c 0000 2680 	move.l #9856,d2
     3a4:	7637           	moveq #55,d3
     3a6:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3aa:	2079 0000 4b96 	movea.l 4b96 <DrawCopper>,a0
     3b0:	b1f9 0000 4baa 	cmpa.l 4baa <Copperlist1>,a0
     3b6:	671e           	beq.s 3d6 <main+0x3d0>
    Write( Output(), 
     3b8:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     3be:	4eae ffc4      	jsr -60(a6)
     3c2:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     3c8:	2200           	move.l d0,d1
     3ca:	243c 0000 26b8 	move.l #9912,d2
     3d0:	7639           	moveq #57,d3
     3d2:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3d6:	4e94           	jsr (a4)

  if( ViewBuffer != Bitplane2) 
     3d8:	2039 0000 4b8e 	move.l 4b8e <ViewBuffer>,d0
     3de:	b0b9 0000 4b92 	cmp.l 4b92 <Bitplane2>,d0
     3e4:	671e           	beq.s 404 <main+0x3fe>
    Write( Output(), 
     3e6:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     3ec:	4eae ffc4      	jsr -60(a6)
     3f0:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     3f6:	2200           	move.l d0,d1
     3f8:	243c 0000 26f2 	move.l #9970,d2
     3fe:	7638           	moveq #56,d3
     400:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     404:	2079 0000 4b8a 	movea.l 4b8a <ViewCopper>,a0
     40a:	b1f9 0000 4ba6 	cmpa.l 4ba6 <Copperlist2>,a0
     410:	671e           	beq.s 430 <main+0x42a>
    Write( Output(), 
     412:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     418:	4eae ffc4      	jsr -60(a6)
     41c:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     422:	2200           	move.l d0,d1
     424:	243c 0000 272b 	move.l #10027,d2
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
     434:	2079 0000 4b8a 	movea.l 4b8a <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     43a:	7000           	moveq #0,d0
     43c:	3028 0072      	move.w 114(a0),d0
     440:	4840           	swap d0
     442:	4240           	clr.w d0
     444:	7200           	moveq #0,d1
     446:	3228 0076      	move.w 118(a0),d1
     44a:	d081           	add.l d1,d0
  if( pointer != Bitplane2) 
     44c:	b0b9 0000 4b92 	cmp.l 4b92 <Bitplane2>,d0
     452:	671e           	beq.s 472 <main+0x46c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     454:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     45a:	4eae ffc4      	jsr -60(a6)
     45e:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     464:	2200           	move.l d0,d1
     466:	243c 0000 2766 	move.l #10086,d2
     46c:	7648           	moveq #72,d3
     46e:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     472:	4e93           	jsr (a3)
  SetBplPointers();
     474:	4e92           	jsr (a2)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = ViewCopper;
     476:	2079 0000 4b8a 	movea.l 4b8a <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     47c:	7000           	moveq #0,d0
     47e:	3028 0072      	move.w 114(a0),d0
     482:	4840           	swap d0
     484:	4240           	clr.w d0
     486:	7200           	moveq #0,d1
     488:	3228 0076      	move.w 118(a0),d1
     48c:	d081           	add.l d1,d0
  if( pointer != Bitplane1) 
     48e:	b0b9 0000 4ba2 	cmp.l 4ba2 <Bitplane1>,d0
     494:	671e           	beq.s 4b4 <main+0x4ae>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     496:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     49c:	4eae ffc4      	jsr -60(a6)
     4a0:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     4a6:	2200           	move.l d0,d1
     4a8:	243c 0000 27af 	move.l #10159,d2
     4ae:	7649           	moveq #73,d3
     4b0:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4b4:	4e93           	jsr (a3)
  SetBplPointers();
     4b6:	4e92           	jsr (a2)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = ViewCopper;
     4b8:	2079 0000 4b8a 	movea.l 4b8a <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4be:	7000           	moveq #0,d0
     4c0:	3028 0072      	move.w 114(a0),d0
     4c4:	4840           	swap d0
     4c6:	4240           	clr.w d0
     4c8:	7200           	moveq #0,d1
     4ca:	3228 0076      	move.w 118(a0),d1
     4ce:	d081           	add.l d1,d0
  if( pointer != Bitplane2) 
     4d0:	b0b9 0000 4b92 	cmp.l 4b92 <Bitplane2>,d0
     4d6:	671e           	beq.s 4f6 <main+0x4f0>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4d8:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     4de:	4eae ffc4      	jsr -60(a6)
     4e2:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     4e8:	2200           	move.l d0,d1
     4ea:	243c 0000 27f9 	move.l #10233,d2
     4f0:	7648           	moveq #72,d3
     4f2:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     4f6:	2f3c 0000 c800 	move.l #51200,-(sp)
     4fc:	4878 0084      	pea 84 <main+0x7e>
     500:	49f9 0000 196e 	lea 196e <FreeDisplay>,a4
     506:	4e94           	jsr (a4)
  ZoomTestRoutines();
}

void ZoomTestDisplay() {

  PrepareDisplayZoom();
     508:	4eb9 0000 1622 	jsr 1622 <PrepareDisplayZoom>

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     50e:	4878 0010      	pea 10 <main+0xa>
     512:	4879 0000 4af0 	pea 4af0 <ClsSprites>
     518:	42a7           	clr.l -(sp)
     51a:	2f39 0000 4baa 	move.l 4baa <Copperlist1>,-(sp)
     520:	45f9 0000 0efe 	lea efe <TestCopperlistBatch>,a2
     526:	4e92           	jsr (a2)
     528:	4fef 0018      	lea 24(sp),sp
     52c:	4a80           	tst.l d0
     52e:	661e           	bne.s 54e <main+0x548>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     530:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     536:	4eae ffc4      	jsr -60(a6)
     53a:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     540:	2200           	move.l d0,d1
     542:	243c 0000 2842 	move.l #10306,d2
     548:	762c           	moveq #44,d3
     54a:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
     54e:	4878 000c      	pea c <main+0x6>
     552:	4879 0000 4a88 	pea 4a88 <ClScreenZoom>
     558:	4878 0010      	pea 10 <main+0xa>
     55c:	2f39 0000 4baa 	move.l 4baa <Copperlist1>,-(sp)
     562:	4e92           	jsr (a2)
     564:	4fef 0010      	lea 16(sp),sp
     568:	4a80           	tst.l d0
     56a:	661e           	bne.s 58a <main+0x584>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     56c:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     572:	4eae ffc4      	jsr -60(a6)
     576:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     57c:	2200           	move.l d0,d1
     57e:	243c 0000 2878 	move.l #10360,d2
     584:	7636           	moveq #54,d3
     586:	4eae ffd0      	jsr -48(a6)
  return 0;
}

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
  UWORD *copword = (UWORD *) DrawCopper;
     58a:	2079 0000 4b96 	movea.l 4b96 <DrawCopper>,a0
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
     5a6:	23fc 0005 0000 	move.l #327680,4b9a <DrawBuffer>
     5ac:	0000 4b9a 
  ViewBuffer = (ULONG *) tmp;
     5b0:	23fc 0004 0000 	move.l #262144,4b8e <ViewBuffer>
     5b6:	0000 4b8e 
  Zoom_SetBplPointers();
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
     5ba:	2f3c 00e0 0004 	move.l #14680068,-(sp)
     5c0:	4878 001c      	pea 1c <main+0x16>
     5c4:	2f39 0000 4baa 	move.l 4baa <Copperlist1>,-(sp)
     5ca:	47f9 0000 0ee0 	lea ee0 <TestCopperlistPos>,a3
     5d0:	4e93           	jsr (a3)
     5d2:	4fef 000c      	lea 12(sp),sp
     5d6:	4a80           	tst.l d0
     5d8:	661e           	bne.s 5f8 <main+0x5f2>
    Write(Output(), 
     5da:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     5e0:	4eae ffc4      	jsr -60(a6)
     5e4:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     5ea:	2200           	move.l d0,d1
     5ec:	243c 0000 25ab 	move.l #9643,d2
     5f2:	763c           	moveq #60,d3
     5f4:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
     5f8:	2f3c 00e2 0000 	move.l #14811136,-(sp)
     5fe:	4878 001d      	pea 1d <main+0x17>
     602:	2f39 0000 4baa 	move.l 4baa <Copperlist1>,-(sp)
     608:	4e93           	jsr (a3)
     60a:	4fef 000c      	lea 12(sp),sp
     60e:	4a80           	tst.l d0
     610:	661e           	bne.s 630 <main+0x62a>
    Write(Output(), 
     612:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     618:	4eae ffc4      	jsr -60(a6)
     61c:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     622:	2200           	move.l d0,d1
     624:	243c 0000 25e8 	move.l #9704,d2
     62a:	763c           	moveq #60,d3
     62c:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
     630:	2f3c 00e4 0004 	move.l #14942212,-(sp)
     636:	4878 001e      	pea 1e <main+0x18>
     63a:	2f39 0000 4baa 	move.l 4baa <Copperlist1>,-(sp)
     640:	4e93           	jsr (a3)
     642:	4fef 000c      	lea 12(sp),sp
     646:	4a80           	tst.l d0
     648:	661e           	bne.s 668 <main+0x662>
    Write(Output(), 
     64a:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     650:	4eae ffc4      	jsr -60(a6)
     654:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     65a:	2200           	move.l d0,d1
     65c:	243c 0000 28af 	move.l #10415,d2
     662:	763c           	moveq #60,d3
     664:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
     668:	2f3c 00e6 2800 	move.l #15083520,-(sp)
     66e:	4878 001f      	pea 1f <main+0x19>
     672:	2f39 0000 4baa 	move.l 4baa <Copperlist1>,-(sp)
     678:	4e93           	jsr (a3)
     67a:	4fef 000c      	lea 12(sp),sp
     67e:	4a80           	tst.l d0
     680:	661e           	bne.s 6a0 <main+0x69a>
    Write(Output(), 
     682:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     688:	4eae ffc4      	jsr -60(a6)
     68c:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     692:	2200           	move.l d0,d1
     694:	243c 0000 28ec 	move.l #10476,d2
     69a:	763c           	moveq #60,d3
     69c:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl2pl should be 2800\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
     6a0:	4878 0002      	pea 2 <_start+0x2>
     6a4:	4879 0000 4ab8 	pea 4ab8 <ClColor>
     6aa:	4878 0020      	pea 20 <main+0x1a>
     6ae:	2f39 0000 4baa 	move.l 4baa <Copperlist1>,-(sp)
     6b4:	4e92           	jsr (a2)
     6b6:	4fef 0010      	lea 16(sp),sp
     6ba:	4a80           	tst.l d0
     6bc:	661e           	bne.s 6dc <main+0x6d6>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     6be:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     6c4:	4eae ffc4      	jsr -60(a6)
     6c8:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     6ce:	2200           	move.l d0,d1
     6d0:	243c 0000 2625 	move.l #9765,d2
     6d6:	7621           	moveq #33,d3
     6d8:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     6dc:	7ec0           	moveq #-64,d7
     6de:	de8d           	add.l a5,d7
     6e0:	4878 0040      	pea 40 <main+0x3a>
     6e4:	4879 0000 2a46 	pea 2a46 <incbin_swfont_end+0x5e0>
     6ea:	2f07           	move.l d7,-(sp)
     6ec:	4eb9 0000 1a26 	jsr 1a26 <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
     6f2:	4878 0010      	pea 10 <main+0xa>
     6f6:	2f07           	move.l d7,-(sp)
     6f8:	4878 0022      	pea 22 <main+0x1c>
     6fc:	2f39 0000 4baa 	move.l 4baa <Copperlist1>,-(sp)
     702:	4e92           	jsr (a2)
     704:	4fef 001c      	lea 28(sp),sp
     708:	4a80           	tst.l d0
     70a:	661e           	bne.s 72a <main+0x724>
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);
     70c:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     712:	4eae ffc4      	jsr -60(a6)
     716:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     71c:	2200           	move.l d0,d1
     71e:	243c 0000 2929 	move.l #10537,d2
     724:	7621           	moveq #33,d3
     726:	4eae ffd0      	jsr -48(a6)

  ULONG clpart2[] = { 0x2d07fffe, 0x018200f0, 0x01820f00 };
     72a:	2b7c 2d07 fffe 	move.l #755499006,-76(a5)
     730:	ffb4 
     732:	2b7c 0182 00f0 	move.l #25297136,-72(a5)
     738:	ffb8 
     73a:	2b7c 0182 0f00 	move.l #25300736,-68(a5)
     740:	ffbc 

  if( TestCopperlistBatch( Copperlist1, 75, clpart2, 3) == 0)
     742:	4878 0003      	pea 3 <_start+0x3>
     746:	486d ffb4      	pea -76(a5)
     74a:	4878 004b      	pea 4b <main+0x45>
     74e:	2f39 0000 4baa 	move.l 4baa <Copperlist1>,-(sp)
     754:	4e92           	jsr (a2)
     756:	4fef 0010      	lea 16(sp),sp
     75a:	4a80           	tst.l d0
     75c:	661e           	bne.s 77c <main+0x776>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     75e:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     764:	4eae ffc4      	jsr -60(a6)
     768:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     76e:	2200           	move.l d0,d1
     770:	243c 0000 294b 	move.l #10571,d2
     776:	762c           	moveq #44,d3
     778:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
     77c:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdea33>
     780:	4878 2922      	pea 2922 <incbin_swfont_end+0x4bc>
     784:	2f39 0000 4baa 	move.l 4baa <Copperlist1>,-(sp)
     78a:	4e93           	jsr (a3)
     78c:	4fef 000c      	lea 12(sp),sp
     790:	4a80           	tst.l d0
     792:	6700 049a      	beq.w c2e <main+0xc28>
  for( int i =0; i<256; i++) {
    tstcopycolumn[i] = rownr;
    rownr += 2;
  }

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     796:	2f3c 0000 fa00 	move.l #64000,-(sp)
     79c:	2f3c 0000 a48c 	move.l #42124,-(sp)
     7a2:	4e94           	jsr (a4)

}

void ZoomTestRoutines() {

  PrepareDisplayZoom();
     7a4:	4eb9 0000 1622 	jsr 1622 <PrepareDisplayZoom>

  UWORD *destination = DrawBuffer;
     7aa:	2079 0000 4b9a 	movea.l 4b9a <DrawBuffer>,a0
  *destination= 0x0000;
     7b0:	4250           	clr.w (a0)
  destination += 20;
  *destination= 0x000f;
     7b2:	317c 000f 0028 	move.w #15,40(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     7b8:	2c79 0000 4bae 	movea.l 4bae <SysBase>,a6
     7be:	203c 0000 c800 	move.l #51200,d0
     7c4:	7202           	moveq #2,d1
     7c6:	4eae ff3a      	jsr -198(a6)
     7ca:	2b40 ffb0      	move.l d0,-80(a5)
  if( Zoom_Source == 0) {
     7ce:	508f           	addq.l #8,sp
     7d0:	6700 04b8      	beq.w c8a <main+0xc84>
     7d4:	2040           	movea.l d0,a0
    Write(  Output(), 
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }
  UWORD *tstsource = Zoom_Source;
  *tstsource = 0xffff;
     7d6:	30bc ffff      	move.w #-1,(a0)
  tstsource += 20;
  *tstsource = 0x7fff;
     7da:	317c 7fff 0028 	move.w #32767,40(a0)
  Zoom_CopyColumn( Zoom_Source, DrawBuffer, 0, 0);
     7e0:	2439 0000 4b9a 	move.l 4b9a <DrawBuffer>,d2
  WaitBlit();
     7e6:	2c79 0000 4b82 	movea.l 4b82 <GfxBase>,a6
     7ec:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     7f0:	2079 0000 4b86 	movea.l 4b86 <hw>,a0
     7f6:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4;
     7fc:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltafwm = 0xffff;
     802:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     808:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     80e:	317c 0024 0064 	move.w #36,100(a0)
  hw->bltbmod = ZMLINESIZE - 2;
     814:	317c 0026 0062 	move.w #38,98(a0)
  hw->bltdmod = ZMLINESIZE - 2;
     81a:	317c 0026 0066 	move.w #38,102(a0)
  hw->bltcdat = bltmask;
     820:	317c 8000 0070 	move.w #-32768,112(a0)
  hw->bltapt = (UWORD *) sourcepos;
     826:	216d ffb0 0050 	move.l -80(a5),80(a0)
  hw->bltbpt = (UWORD *) destpos;
     82c:	2142 004c      	move.l d2,76(a0)
  hw->bltdpt = (UWORD *) destpos;
     830:	2142 0054      	move.l d2,84(a0)
  hw->bltsize = 256*64+1;
     834:	317c 4001 0058 	move.w #16385,88(a0)
  
  WaitBlit();
     83a:	2c79 0000 4b82 	movea.l 4b82 <GfxBase>,a6
     840:	4eae ff1c      	jsr -228(a6)
  destination = DrawBuffer;
     844:	2b79 0000 4b9a 	move.l 4b9a <DrawBuffer>,-80(a5)
     84a:	ffb0 
  if( *destination != 0x8000)
     84c:	206d ffb0      	movea.l -80(a5),a0
     850:	0c50 8000      	cmpi.w #-32768,(a0)
     854:	671e           	beq.s 874 <main+0x86e>
    Write(  Output(), "Zoomtest: CopyColumn - First row wrong.\n",40);
     856:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     85c:	4eae ffc4      	jsr -60(a6)
     860:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     866:	2200           	move.l d0,d1
     868:	243c 0000 29b0 	move.l #10672,d2
     86e:	7628           	moveq #40,d3
     870:	4eae ffd0      	jsr -48(a6)

  destination+= 20;
  if( *destination != 0x000f)
     874:	206d ffb0      	movea.l -80(a5),a0
     878:	0c68 000f 0028 	cmpi.w #15,40(a0)
     87e:	671e           	beq.s 89e <main+0x898>
    Write(  Output(), "Zoomtest: CopyColumn - Second row wrong.\n",41);
     880:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     886:	4eae ffc4      	jsr -60(a6)
     88a:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     890:	2200           	move.l d0,d1
     892:	243c 0000 29d9 	move.l #10713,d2
     898:	7629           	moveq #41,d3
     89a:	4eae ffd0      	jsr -48(a6)



  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     89e:	2f3c 0000 fa00 	move.l #64000,-(sp)
     8a4:	2f3c 0000 a48c 	move.l #42124,-(sp)
     8aa:	4e94           	jsr (a4)
     8ac:	508f           	addq.l #8,sp
char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
  PrepareDisplaySW();
     8ae:	4eb9 0000 1830 	jsr 1830 <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     8b4:	4878 0010      	pea 10 <main+0xa>
     8b8:	4879 0000 4af0 	pea 4af0 <ClsSprites>
     8be:	42a7           	clr.l -(sp)
     8c0:	2f39 0000 4baa 	move.l 4baa <Copperlist1>,-(sp)
     8c6:	4e92           	jsr (a2)
     8c8:	4fef 0010      	lea 16(sp),sp
     8cc:	4a80           	tst.l d0
     8ce:	661e           	bne.s 8ee <main+0x8e8>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     8d0:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     8d6:	4eae ffc4      	jsr -60(a6)
     8da:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     8e0:	2200           	move.l d0,d1
     8e2:	243c 0000 2842 	move.l #10306,d2
     8e8:	762c           	moveq #44,d3
     8ea:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     8ee:	4878 000c      	pea c <main+0x6>
     8f2:	4879 0000 4ac0 	pea 4ac0 <ClScreen>
     8f8:	4878 0010      	pea 10 <main+0xa>
     8fc:	2f39 0000 4baa 	move.l 4baa <Copperlist1>,-(sp)
     902:	4e92           	jsr (a2)
     904:	4fef 0010      	lea 16(sp),sp
     908:	4a80           	tst.l d0
     90a:	661e           	bne.s 92a <main+0x924>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     90c:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     912:	4eae ffc4      	jsr -60(a6)
     916:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     91c:	2200           	move.l d0,d1
     91e:	243c 0000 2878 	move.l #10360,d2
     924:	7636           	moveq #54,d3
     926:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
     92a:	4878 0002      	pea 2 <_start+0x2>
     92e:	4879 0000 4ab8 	pea 4ab8 <ClColor>
     934:	4878 001e      	pea 1e <main+0x18>
     938:	2f39 0000 4baa 	move.l 4baa <Copperlist1>,-(sp)
     93e:	4e92           	jsr (a2)
     940:	4fef 0010      	lea 16(sp),sp
     944:	4a80           	tst.l d0
     946:	661e           	bne.s 966 <main+0x960>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     948:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     94e:	4eae ffc4      	jsr -60(a6)
     952:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     958:	2200           	move.l d0,d1
     95a:	243c 0000 2625 	move.l #9765,d2
     960:	7621           	moveq #33,d3
     962:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
     966:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdea33>
     96a:	4878 0020      	pea 20 <main+0x1a>
     96e:	2f39 0000 4baa 	move.l 4baa <Copperlist1>,-(sp)
     974:	4e93           	jsr (a3)
     976:	4fef 000c      	lea 12(sp),sp
     97a:	4a80           	tst.l d0
     97c:	6700 028e      	beq.w c0c <main+0xc06>
    Write( Output(), "Copperlist End not correctly set.\n", 34);

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
     980:	2479 0000 4b9a 	movea.l 4b9a <DrawBuffer>,a2
     986:	4879 0000 2a03 	pea 2a03 <incbin_swfont_end+0x59d>
     98c:	2f0a           	move.l a2,-(sp)
     98e:	4eb9 0000 0d88 	jsr d88 <WriteFont.constprop.1>

  UWORD *tstpointer = DrawBuffer;
  if( *tstpointer != 0xff00)
     994:	508f           	addq.l #8,sp
     996:	0c52 ff00      	cmpi.w #-256,(a2)
     99a:	671e           	beq.s 9ba <main+0x9b4>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
     99c:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     9a2:	4eae ffc4      	jsr -60(a6)
     9a6:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     9ac:	2200           	move.l d0,d1
     9ae:	243c 0000 2a14 	move.l #10772,d2
     9b4:	7631           	moveq #49,d3
     9b6:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
     9ba:	2f3c 0000 c800 	move.l #51200,-(sp)
     9c0:	4878 0084      	pea 84 <main+0x7e>
     9c4:	4e94           	jsr (a4)
  RunTests();
	Delay(50);
     9c6:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     9cc:	7232           	moveq #50,d1
     9ce:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
     9d2:	247c 00f0 ff60 	movea.l #15794016,a2
     9d8:	508f           	addq.l #8,sp
     9da:	4a92           	tst.l (a2)
     9dc:	6718           	beq.s 9f6 <main+0x9f0>
     9de:	4878 0001      	pea 1 <_start+0x1>
     9e2:	47f9 0000 0dd6 	lea dd6 <warpmode.part.0>,a3
     9e8:	4e93           	jsr (a3)
     9ea:	588f           	addq.l #4,sp
     9ec:	4a92           	tst.l (a2)
     9ee:	6706           	beq.s 9f6 <main+0x9f0>
     9f0:	42a7           	clr.l -(sp)
     9f2:	4e93           	jsr (a3)
     9f4:	588f           	addq.l #4,sp
  ViewCopper = tmp;
  hw->cop1lc = ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
     9f6:	2c79 0000 4b82 	movea.l 4b82 <GfxBase>,a6
     9fc:	23ee 0022 0000 	move.l 34(a6),4b70 <ActiView>
     a02:	4b70 
	OwnBlitter();
     a04:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     a08:	2c79 0000 4b82 	movea.l 4b82 <GfxBase>,a6
     a0e:	4eae ff1c      	jsr -228(a6)
	Disable();
     a12:	2c79 0000 4bae 	movea.l 4bae <SysBase>,a6
     a18:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
     a1c:	2679 0000 4b86 	movea.l 4b86 <hw>,a3
     a22:	302b 0010      	move.w 16(a3),d0
     a26:	33c0 0000 4b74 	move.w d0,4b74 <SystemADKCON>
	SystemInts=hw->intenar;
     a2c:	302b 001c      	move.w 28(a3),d0
     a30:	33c0 0000 4b78 	move.w d0,4b78 <SystemInts>
	SystemDMA=hw->dmaconr;
     a36:	302b 0002      	move.w 2(a3),d0
     a3a:	33c0 0000 4b76 	move.w d0,4b76 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
     a40:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     a46:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
     a4c:	45f9 0000 19e0 	lea 19e0 <WaitVbl>,a2
     a52:	4e92           	jsr (a2)
	WaitVbl();
     a54:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
     a56:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
     a5c:	2c79 0000 4b82 	movea.l 4b82 <GfxBase>,a6
     a62:	93c9           	suba.l a1,a1
     a64:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     a68:	2c79 0000 4b82 	movea.l 4b82 <GfxBase>,a6
     a6e:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     a72:	2c79 0000 4b82 	movea.l 4b82 <GfxBase>,a6
     a78:	4eae fef2      	jsr -270(a6)

	WaitVbl();
     a7c:	4e92           	jsr (a2)
	WaitVbl();
     a7e:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     a80:	3b7c 4e7a ffc0 	move.w #20090,-64(a5)
     a86:	3b7c 0801 ffc2 	move.w #2049,-62(a5)
     a8c:	3b7c 4e73 ffc4 	move.w #20083,-60(a5)
	if (SysBase->AttnFlags & AFF_68010) 
     a92:	2c79 0000 4bae 	movea.l 4bae <SysBase>,a6
     a98:	082e 0000 0129 	btst #0,297(a6)
     a9e:	6700 02bc      	beq.w d5c <main+0xd56>
		vbr = (APTR)Supervisor((void*)getvbr);
     aa2:	cf8d           	exg d7,a5
     aa4:	4eae ffe2      	jsr -30(a6)
     aa8:	cf8d           	exg d7,a5

	VBR=GetVBR();
     aaa:	23c0 0000 4b7a 	move.l d0,4b7a <VBR.lto_priv.2>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     ab0:	2079 0000 4b7a 	movea.l 4b7a <VBR.lto_priv.2>,a0
     ab6:	2e28 006c      	move.l 108(a0),d7
	SystemIrq=GetInterruptHandler(); //store interrupt register
     aba:	23c7 0000 4b7e 	move.l d7,4b7e <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
     ac0:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
     ac2:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     ac4:	2079 0000 4b86 	movea.l 4b86 <hw>,a0
     aca:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     ace:	3028 0002      	move.w 2(a0),d0
     ad2:	0800 000e      	btst #14,d0
     ad6:	66f6           	bne.s ace <main+0xac8>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
     ad8:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     ade:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
     ae4:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     aea:	2279 0000 4b7a 	movea.l 4b7a <VBR.lto_priv.2>,a1
     af0:	2347 006c      	move.l d7,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
     af4:	2c79 0000 4b82 	movea.l 4b82 <GfxBase>,a6
     afa:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
     b00:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
     b06:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
     b0c:	3039 0000 4b78 	move.w 4b78 <SystemInts>,d0
     b12:	0040 8000      	ori.w #-32768,d0
     b16:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
     b1a:	3039 0000 4b76 	move.w 4b76 <SystemDMA>,d0
     b20:	0040 8000      	ori.w #-32768,d0
     b24:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
     b28:	3039 0000 4b74 	move.w 4b74 <SystemADKCON>,d0
     b2e:	0040 8000      	ori.w #-32768,d0
     b32:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
     b36:	2279 0000 4b70 	movea.l 4b70 <ActiView>,a1
     b3c:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     b40:	2c79 0000 4b82 	movea.l 4b82 <GfxBase>,a6
     b46:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     b4a:	2c79 0000 4b82 	movea.l 4b82 <GfxBase>,a6
     b50:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     b54:	2c79 0000 4b82 	movea.l 4b82 <GfxBase>,a6
     b5a:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     b5e:	2c79 0000 4b82 	movea.l 4b82 <GfxBase>,a6
     b64:	4eae fe32      	jsr -462(a6)
	Enable();
     b68:	2c79 0000 4bae 	movea.l 4bae <SysBase>,a6
     b6e:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
     b72:	2c79 0000 4bae 	movea.l 4bae <SysBase>,a6
     b78:	2279 0000 4b9e 	movea.l 4b9e <DOSBase>,a1
     b7e:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     b82:	2c79 0000 4bae 	movea.l 4bae <SysBase>,a6
     b88:	2279 0000 4b82 	movea.l 4b82 <GfxBase>,a1
     b8e:	4eae fe62      	jsr -414(a6)
}
     b92:	7000           	moveq #0,d0
     b94:	4ced 5c8c ff94 	movem.l -108(a5),d2-d3/d7/a2-a4/a6
     b9a:	4e5d           	unlk a5
     b9c:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     b9e:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     ba4:	4eae ffc4      	jsr -60(a6)
     ba8:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     bae:	2200           	move.l d0,d1
     bb0:	243c 0000 2842 	move.l #10306,d2
     bb6:	762c           	moveq #44,d3
     bb8:	4eae ffd0      	jsr -48(a6)
     bbc:	6000 f5ea      	bra.w 1a8 <main+0x1a2>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
     bc0:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     bc6:	4eae ffc4      	jsr -60(a6)
     bca:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     bd0:	2200           	move.l d0,d1
     bd2:	243c 0000 2878 	move.l #10360,d2
     bd8:	7636           	moveq #54,d3
     bda:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = 0x40000;
     bde:	23fc 0004 0000 	move.l #262144,4b9a <DrawBuffer>
     be4:	0000 4b9a 
  ViewBuffer = 0x50000;
     be8:	23fc 0005 0000 	move.l #327680,4b8e <ViewBuffer>
     bee:	0000 4b8e 
  SetBplPointers();
     bf2:	45f9 0000 1804 	lea 1804 <SetBplPointers>,a2
     bf8:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     bfa:	0cb9 0005 0000 	cmpi.l #327680,4b9a <DrawBuffer>
     c00:	0000 4b9a 
     c04:	6600 f67a      	bne.w 280 <main+0x27a>
     c08:	6000 00fa      	bra.w d04 <main+0xcfe>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     c0c:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     c12:	4eae ffc4      	jsr -60(a6)
     c16:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     c1c:	2200           	move.l d0,d1
     c1e:	243c 0000 2647 	move.l #9799,d2
     c24:	7622           	moveq #34,d3
     c26:	4eae ffd0      	jsr -48(a6)
     c2a:	6000 fd54      	bra.w 980 <main+0x97a>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     c2e:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     c34:	4eae ffc4      	jsr -60(a6)
     c38:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     c3e:	2200           	move.l d0,d1
     c40:	243c 0000 2647 	move.l #9799,d2
     c46:	7622           	moveq #34,d3
     c48:	4eae ffd0      	jsr -48(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     c4c:	2f3c 0000 fa00 	move.l #64000,-(sp)
     c52:	2f3c 0000 a48c 	move.l #42124,-(sp)
     c58:	4e94           	jsr (a4)
  PrepareDisplayZoom();
     c5a:	4eb9 0000 1622 	jsr 1622 <PrepareDisplayZoom>
  UWORD *destination = DrawBuffer;
     c60:	2079 0000 4b9a 	movea.l 4b9a <DrawBuffer>,a0
  *destination= 0x0000;
     c66:	4250           	clr.w (a0)
  *destination= 0x000f;
     c68:	317c 000f 0028 	move.w #15,40(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     c6e:	2c79 0000 4bae 	movea.l 4bae <SysBase>,a6
     c74:	203c 0000 c800 	move.l #51200,d0
     c7a:	7202           	moveq #2,d1
     c7c:	4eae ff3a      	jsr -198(a6)
     c80:	2b40 ffb0      	move.l d0,-80(a5)
  if( Zoom_Source == 0) {
     c84:	508f           	addq.l #8,sp
     c86:	6600 fb4c      	bne.w 7d4 <main+0x7ce>
    Write(  Output(), 
     c8a:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     c90:	4eae ffc4      	jsr -60(a6)
     c94:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     c9a:	2200           	move.l d0,d1
     c9c:	243c 0000 2978 	move.l #10616,d2
     ca2:	7636           	moveq #54,d3
     ca4:	4eae ffd0      	jsr -48(a6)
  PrepareDisplaySW();
     ca8:	4eb9 0000 1830 	jsr 1830 <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     cae:	4878 0010      	pea 10 <main+0xa>
     cb2:	4879 0000 4af0 	pea 4af0 <ClsSprites>
     cb8:	42a7           	clr.l -(sp)
     cba:	2f39 0000 4baa 	move.l 4baa <Copperlist1>,-(sp)
     cc0:	4e92           	jsr (a2)
     cc2:	4fef 0010      	lea 16(sp),sp
     cc6:	4a80           	tst.l d0
     cc8:	6600 fc24      	bne.w 8ee <main+0x8e8>
     ccc:	6000 fc02      	bra.w 8d0 <main+0x8ca>
		Exit(0);
     cd0:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     cd6:	7200           	moveq #0,d1
     cd8:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     cdc:	2c79 0000 4bae 	movea.l 4bae <SysBase>,a6
     ce2:	43f9 0000 2534 	lea 2534 <incbin_swfont_end+0xce>,a1
     ce8:	7000           	moveq #0,d0
     cea:	4eae fdd8      	jsr -552(a6)
     cee:	23c0 0000 4b9e 	move.l d0,4b9e <DOSBase>
	if (!DOSBase)
     cf4:	6600 f35e      	bne.w 54 <main+0x4e>
		Exit(0);
     cf8:	9dce           	suba.l a6,a6
     cfa:	7200           	moveq #0,d1
     cfc:	4eae ff70      	jsr -144(a6)
     d00:	6000 f352      	bra.w 54 <main+0x4e>
     d04:	0cb9 0004 0000 	cmpi.l #262144,4b8e <ViewBuffer>
     d0a:	0000 4b8e 
     d0e:	6700 f58e      	beq.w 29e <main+0x298>
    Write( Output(), 
     d12:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     d18:	4eae ffc4      	jsr -60(a6)
     d1c:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     d22:	2200           	move.l d0,d1
     d24:	243c 0000 256f 	move.l #9583,d2
     d2a:	763b           	moveq #59,d3
     d2c:	4eae ffd0      	jsr -48(a6)
     d30:	6000 f56c      	bra.w 29e <main+0x298>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     d34:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     d3a:	4eae ffc4      	jsr -60(a6)
     d3e:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
     d44:	2200           	move.l d0,d1
     d46:	243c 0000 2625 	move.l #9765,d2
     d4c:	7621           	moveq #33,d3
     d4e:	4eae ffd0      	jsr -48(a6)
     d52:	2079 0000 4baa 	movea.l 4baa <Copperlist1>,a0
     d58:	6000 f5c2      	bra.w 31c <main+0x316>
	APTR vbr = 0;
     d5c:	7000           	moveq #0,d0
	VBR=GetVBR();
     d5e:	23c0 0000 4b7a 	move.l d0,4b7a <VBR.lto_priv.2>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     d64:	2079 0000 4b7a 	movea.l 4b7a <VBR.lto_priv.2>,a0
     d6a:	2e28 006c      	move.l 108(a0),d7
	SystemIrq=GetInterruptHandler(); //store interrupt register
     d6e:	23c7 0000 4b7e 	move.l d7,4b7e <SystemIrq>
	WaitVbl();
     d74:	4e92           	jsr (a2)
	WaitVbl();
     d76:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     d78:	2079 0000 4b86 	movea.l 4b86 <hw>,a0
     d7e:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     d82:	6000 fd4a      	bra.w ace <main+0xac8>
     d86:	4e71           	nop

00000d88 <WriteFont.constprop.1>:
  *cl = 0xfffffffe;

  return retval;
}

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
     d88:	226f 0004      	movea.l 4(sp),a1
  UWORD *bmpptr = Destination;
  UWORD *fntptr = font;

  char charpos = *text;
  charpos -= 0x20;
     d8c:	206f 0008      	movea.l 8(sp),a0
     d90:	1010           	move.b (a0),d0
     d92:	0600 ffe0      	addi.b #-32,d0
  charpos = charpos<<3;
     d96:	4880           	ext.w d0
     d98:	48c0           	ext.l d0
     d9a:	e788           	lsl.l #3,d0
  fntptr += charpos;
     d9c:	4880           	ext.w d0
     d9e:	3040           	movea.w d0,a0
     da0:	d1c8           	adda.l a0,a0
     da2:	d1fc 0000 4b30 	adda.l #19248,a0
  for(int i=1;i<=8;i++) {
    *bmpptr = *fntptr++;
     da8:	3290           	move.w (a0),(a1)
     daa:	3368 0002 0050 	move.w 2(a0),80(a1)
     db0:	3368 0004 00a0 	move.w 4(a0),160(a1)
     db6:	3368 0006 00f0 	move.w 6(a0),240(a1)
     dbc:	3368 0008 0140 	move.w 8(a0),320(a1)
     dc2:	3368 000a 0190 	move.w 10(a0),400(a1)
     dc8:	3368 000c 01e0 	move.w 12(a0),480(a1)
     dce:	3368 000e 0230 	move.w 14(a0),560(a1)
    bmpptr += 40;
  }

}
     dd4:	4e75           	rts

00000dd6 <warpmode.part.0>:
void warpmode(int on) 
     dd6:	598f           	subq.l #4,sp
     dd8:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     dda:	4aaf 000c      	tst.l 12(sp)
     dde:	674c           	beq.s e2c <warpmode.part.0+0x56>
     de0:	4878 0001      	pea 1 <_start+0x1>
     de4:	740b           	moveq #11,d2
     de6:	d48f           	add.l sp,d2
     de8:	2f02           	move.l d2,-(sp)
     dea:	42a7           	clr.l -(sp)
     dec:	4879 0000 249a 	pea 249a <incbin_swfont_end+0x34>
     df2:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdea34>
     df6:	4878 0052      	pea 52 <main+0x4c>
     dfa:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeee995>
     e00:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     e04:	203c 0000 2480 	move.l #9344,d0
     e0a:	4878 0001      	pea 1 <_start+0x1>
     e0e:	2f02           	move.l d2,-(sp)
     e10:	42a7           	clr.l -(sp)
     e12:	2f00           	move.l d0,-(sp)
     e14:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdea34>
     e18:	4878 0052      	pea 52 <main+0x4c>
     e1c:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeee995>
	}
}
     e22:	4fef 0018      	lea 24(sp),sp
     e26:	241f           	move.l (sp)+,d2
     e28:	588f           	addq.l #4,sp
     e2a:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     e2c:	4878 0001      	pea 1 <_start+0x1>
     e30:	740b           	moveq #11,d2
     e32:	d48f           	add.l sp,d2
     e34:	2f02           	move.l d2,-(sp)
     e36:	42a7           	clr.l -(sp)
     e38:	4879 0000 24a4 	pea 24a4 <incbin_swfont_end+0x3e>
     e3e:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdea34>
     e42:	4878 0052      	pea 52 <main+0x4c>
     e46:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeee995>
     e4c:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     e50:	203c 0000 2467 	move.l #9319,d0
     e56:	4878 0001      	pea 1 <_start+0x1>
     e5a:	2f02           	move.l d2,-(sp)
     e5c:	42a7           	clr.l -(sp)
     e5e:	2f00           	move.l d0,-(sp)
     e60:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdea34>
     e64:	4878 0052      	pea 52 <main+0x4c>
     e68:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeee995>
}
     e6e:	4fef 0018      	lea 24(sp),sp
     e72:	241f           	move.l (sp)+,d2
     e74:	588f           	addq.l #4,sp
     e76:	4e75           	rts

00000e78 <KPrintF>:
{
     e78:	4fef ff80      	lea -128(sp),sp
     e7c:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
     e80:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeee995>
     e86:	6734           	beq.s ebc <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
     e88:	2c79 0000 4bae 	movea.l 4bae <SysBase>,a6
     e8e:	206f 0090      	movea.l 144(sp),a0
     e92:	43ef 0094      	lea 148(sp),a1
     e96:	45f9 0000 1ca4 	lea 1ca4 <PutChar>,a2
     e9c:	47ef 000c      	lea 12(sp),a3
     ea0:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
     ea4:	2f0b           	move.l a3,-(sp)
     ea6:	4878 0056      	pea 56 <main+0x50>
     eaa:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeee995>
     eb0:	508f           	addq.l #8,sp
}
     eb2:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     eb6:	4fef 0080      	lea 128(sp),sp
     eba:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
     ebc:	2c79 0000 4bae 	movea.l 4bae <SysBase>,a6
     ec2:	206f 0090      	movea.l 144(sp),a0
     ec6:	43ef 0094      	lea 148(sp),a1
     eca:	45f9 0000 1c96 	lea 1c96 <KPutCharX>,a2
     ed0:	97cb           	suba.l a3,a3
     ed2:	4eae fdf6      	jsr -522(a6)
}
     ed6:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     eda:	4fef 0080      	lea 128(sp),sp
     ede:	4e75           	rts

00000ee0 <TestCopperlistPos>:
  int test1 = instructions[pos];
     ee0:	202f 0008      	move.l 8(sp),d0
     ee4:	d080           	add.l d0,d0
     ee6:	d080           	add.l d0,d0
  if( instructions[pos] == value ) 
     ee8:	206f 0004      	movea.l 4(sp),a0
     eec:	2030 0800      	move.l (0,a0,d0.l),d0
     ef0:	b0af 000c      	cmp.l 12(sp),d0
     ef4:	57c0           	seq d0
     ef6:	4880           	ext.w d0
     ef8:	48c0           	ext.l d0
}
     efa:	4480           	neg.l d0
     efc:	4e75           	rts

00000efe <TestCopperlistBatch>:
                                                                  long length) {
     efe:	48e7 2030      	movem.l d2/a2-a3,-(sp)
     f02:	246f 0010      	movea.l 16(sp),a2
     f06:	206f 0014      	movea.l 20(sp),a0
     f0a:	226f 0018      	movea.l 24(sp),a1
     f0e:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
     f12:	2008           	move.l a0,d0
     f14:	d088           	add.l a0,d0
     f16:	d080           	add.l d0,d0
     f18:	2411           	move.l (a1),d2
     f1a:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
     f1e:	6600 01ac      	bne.w 10cc <TestCopperlistBatch+0x1ce>
     f22:	2008           	move.l a0,d0
     f24:	5280           	addq.l #1,d0
     f26:	d080           	add.l d0,d0
     f28:	d080           	add.l d0,d0
     f2a:	2032 0800      	move.l (0,a2,d0.l),d0
     f2e:	b0a9 0004      	cmp.l 4(a1),d0
     f32:	6600 0198      	bne.w 10cc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     f36:	7002           	moveq #2,d0
     f38:	b081           	cmp.l d1,d0
     f3a:	6700 0188      	beq.w 10c4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     f3e:	2008           	move.l a0,d0
     f40:	5480           	addq.l #2,d0
     f42:	d080           	add.l d0,d0
     f44:	d080           	add.l d0,d0
     f46:	2032 0800      	move.l (0,a2,d0.l),d0
     f4a:	b0a9 0008      	cmp.l 8(a1),d0
     f4e:	6600 017c      	bne.w 10cc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     f52:	7403           	moveq #3,d2
     f54:	b481           	cmp.l d1,d2
     f56:	6700 016c      	beq.w 10c4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     f5a:	2008           	move.l a0,d0
     f5c:	5680           	addq.l #3,d0
     f5e:	d080           	add.l d0,d0
     f60:	d080           	add.l d0,d0
     f62:	2032 0800      	move.l (0,a2,d0.l),d0
     f66:	b0a9 000c      	cmp.l 12(a1),d0
     f6a:	6600 0160      	bne.w 10cc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     f6e:	7004           	moveq #4,d0
     f70:	b081           	cmp.l d1,d0
     f72:	6700 0150      	beq.w 10c4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     f76:	2008           	move.l a0,d0
     f78:	5880           	addq.l #4,d0
     f7a:	d080           	add.l d0,d0
     f7c:	d080           	add.l d0,d0
     f7e:	2032 0800      	move.l (0,a2,d0.l),d0
     f82:	b0a9 0010      	cmp.l 16(a1),d0
     f86:	6600 0144      	bne.w 10cc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     f8a:	7405           	moveq #5,d2
     f8c:	b481           	cmp.l d1,d2
     f8e:	6700 0134      	beq.w 10c4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     f92:	2008           	move.l a0,d0
     f94:	5a80           	addq.l #5,d0
     f96:	d080           	add.l d0,d0
     f98:	d080           	add.l d0,d0
     f9a:	2032 0800      	move.l (0,a2,d0.l),d0
     f9e:	b0a9 0014      	cmp.l 20(a1),d0
     fa2:	6600 0128      	bne.w 10cc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     fa6:	7006           	moveq #6,d0
     fa8:	b081           	cmp.l d1,d0
     faa:	6700 0118      	beq.w 10c4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     fae:	2008           	move.l a0,d0
     fb0:	5c80           	addq.l #6,d0
     fb2:	d080           	add.l d0,d0
     fb4:	d080           	add.l d0,d0
     fb6:	2032 0800      	move.l (0,a2,d0.l),d0
     fba:	b0a9 0018      	cmp.l 24(a1),d0
     fbe:	6600 010c      	bne.w 10cc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     fc2:	7407           	moveq #7,d2
     fc4:	b481           	cmp.l d1,d2
     fc6:	6700 00fc      	beq.w 10c4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     fca:	2008           	move.l a0,d0
     fcc:	5e80           	addq.l #7,d0
     fce:	d080           	add.l d0,d0
     fd0:	d080           	add.l d0,d0
     fd2:	2032 0800      	move.l (0,a2,d0.l),d0
     fd6:	b0a9 001c      	cmp.l 28(a1),d0
     fda:	6600 00f0      	bne.w 10cc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     fde:	7008           	moveq #8,d0
     fe0:	b081           	cmp.l d1,d0
     fe2:	6700 00e0      	beq.w 10c4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     fe6:	2008           	move.l a0,d0
     fe8:	5080           	addq.l #8,d0
     fea:	d080           	add.l d0,d0
     fec:	d080           	add.l d0,d0
     fee:	2032 0800      	move.l (0,a2,d0.l),d0
     ff2:	b0a9 0020      	cmp.l 32(a1),d0
     ff6:	6600 00d4      	bne.w 10cc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     ffa:	7409           	moveq #9,d2
     ffc:	b481           	cmp.l d1,d2
     ffe:	6700 00c4      	beq.w 10c4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1002:	47e8 0009      	lea 9(a0),a3
    1006:	200b           	move.l a3,d0
    1008:	d08b           	add.l a3,d0
    100a:	d080           	add.l d0,d0
    100c:	2032 0800      	move.l (0,a2,d0.l),d0
    1010:	b0a9 0024      	cmp.l 36(a1),d0
    1014:	6600 00b6      	bne.w 10cc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1018:	700a           	moveq #10,d0
    101a:	b081           	cmp.l d1,d0
    101c:	6700 00a6      	beq.w 10c4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1020:	47e8 000a      	lea 10(a0),a3
    1024:	200b           	move.l a3,d0
    1026:	d08b           	add.l a3,d0
    1028:	d080           	add.l d0,d0
    102a:	2032 0800      	move.l (0,a2,d0.l),d0
    102e:	b0a9 0028      	cmp.l 40(a1),d0
    1032:	6600 0098      	bne.w 10cc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1036:	740b           	moveq #11,d2
    1038:	b481           	cmp.l d1,d2
    103a:	6700 0088      	beq.w 10c4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    103e:	47e8 000b      	lea 11(a0),a3
    1042:	200b           	move.l a3,d0
    1044:	d08b           	add.l a3,d0
    1046:	d080           	add.l d0,d0
    1048:	2032 0800      	move.l (0,a2,d0.l),d0
    104c:	b0a9 002c      	cmp.l 44(a1),d0
    1050:	667a           	bne.s 10cc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1052:	700c           	moveq #12,d0
    1054:	b081           	cmp.l d1,d0
    1056:	676c           	beq.s 10c4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1058:	47e8 000c      	lea 12(a0),a3
    105c:	200b           	move.l a3,d0
    105e:	d08b           	add.l a3,d0
    1060:	d080           	add.l d0,d0
    1062:	2032 0800      	move.l (0,a2,d0.l),d0
    1066:	b0a9 0030      	cmp.l 48(a1),d0
    106a:	6660           	bne.s 10cc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    106c:	740d           	moveq #13,d2
    106e:	b481           	cmp.l d1,d2
    1070:	6752           	beq.s 10c4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1072:	47e8 000d      	lea 13(a0),a3
    1076:	200b           	move.l a3,d0
    1078:	d08b           	add.l a3,d0
    107a:	d080           	add.l d0,d0
    107c:	2032 0800      	move.l (0,a2,d0.l),d0
    1080:	b0a9 0034      	cmp.l 52(a1),d0
    1084:	6646           	bne.s 10cc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1086:	700e           	moveq #14,d0
    1088:	b081           	cmp.l d1,d0
    108a:	6738           	beq.s 10c4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    108c:	47e8 000e      	lea 14(a0),a3
    1090:	200b           	move.l a3,d0
    1092:	d08b           	add.l a3,d0
    1094:	d080           	add.l d0,d0
    1096:	2032 0800      	move.l (0,a2,d0.l),d0
    109a:	b0a9 0038      	cmp.l 56(a1),d0
    109e:	662c           	bne.s 10cc <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    10a0:	7410           	moveq #16,d2
    10a2:	b481           	cmp.l d1,d2
    10a4:	661e           	bne.s 10c4 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    10a6:	41e8 000f      	lea 15(a0),a0
    10aa:	d1c8           	adda.l a0,a0
    10ac:	d1c8           	adda.l a0,a0
    10ae:	2070 a800      	movea.l (0,a0,a2.l),a0
    10b2:	b1e9 003c      	cmpa.l 60(a1),a0
    10b6:	57c0           	seq d0
    10b8:	4880           	ext.w d0
    10ba:	48c0           	ext.l d0
    10bc:	4480           	neg.l d0
}
    10be:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    10c2:	4e75           	rts
  return 1;
    10c4:	7001           	moveq #1,d0
}
    10c6:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    10ca:	4e75           	rts
      return 0;
    10cc:	7000           	moveq #0,d0
}
    10ce:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    10d2:	4e75           	rts

000010d4 <ClBuild>:
ULONG * ClbuildSW() {
    10d4:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
    10d8:	2c79 0000 4bae 	movea.l 4bae <SysBase>,a6
    10de:	707b           	moveq #123,d0
    10e0:	4600           	not.b d0
    10e2:	7202           	moveq #2,d1
    10e4:	4eae ff3a      	jsr -198(a6)
    10e8:	2440           	movea.l d0,a2
  if( retval == 0) {
    10ea:	4a80           	tst.l d0
    10ec:	6700 010e      	beq.w 11fc <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
    10f0:	24b9 0000 4af0 	move.l 4af0 <ClsSprites>,(a2)
    10f6:	2579 0000 4af4 	move.l 4af4 <ClsSprites+0x4>,4(a2)
    10fc:	0004 
    10fe:	2579 0000 4af8 	move.l 4af8 <ClsSprites+0x8>,8(a2)
    1104:	0008 
    1106:	2579 0000 4afc 	move.l 4afc <ClsSprites+0xc>,12(a2)
    110c:	000c 
    110e:	2579 0000 4b00 	move.l 4b00 <ClsSprites+0x10>,16(a2)
    1114:	0010 
    1116:	2579 0000 4b04 	move.l 4b04 <ClsSprites+0x14>,20(a2)
    111c:	0014 
    111e:	2579 0000 4b08 	move.l 4b08 <ClsSprites+0x18>,24(a2)
    1124:	0018 
    1126:	2579 0000 4b0c 	move.l 4b0c <ClsSprites+0x1c>,28(a2)
    112c:	001c 
    112e:	2579 0000 4b10 	move.l 4b10 <ClsSprites+0x20>,32(a2)
    1134:	0020 
    1136:	2579 0000 4b14 	move.l 4b14 <ClsSprites+0x24>,36(a2)
    113c:	0024 
    113e:	2579 0000 4b18 	move.l 4b18 <ClsSprites+0x28>,40(a2)
    1144:	0028 
    1146:	2579 0000 4b1c 	move.l 4b1c <ClsSprites+0x2c>,44(a2)
    114c:	002c 
    114e:	2579 0000 4b20 	move.l 4b20 <ClsSprites+0x30>,48(a2)
    1154:	0030 
    1156:	2579 0000 4b24 	move.l 4b24 <ClsSprites+0x34>,52(a2)
    115c:	0034 
    115e:	2579 0000 4b28 	move.l 4b28 <ClsSprites+0x38>,56(a2)
    1164:	0038 
    1166:	2579 0000 4b2c 	move.l 4b2c <ClsSprites+0x3c>,60(a2)
    116c:	003c 
    *cl++ = *clpartinstruction++;
    116e:	2579 0000 4ac0 	move.l 4ac0 <ClScreen>,64(a2)
    1174:	0040 
    1176:	2579 0000 4ac4 	move.l 4ac4 <ClScreen+0x4>,68(a2)
    117c:	0044 
    117e:	2579 0000 4ac8 	move.l 4ac8 <ClScreen+0x8>,72(a2)
    1184:	0048 
    1186:	2579 0000 4acc 	move.l 4acc <ClScreen+0xc>,76(a2)
    118c:	004c 
    118e:	2579 0000 4ad0 	move.l 4ad0 <ClScreen+0x10>,80(a2)
    1194:	0050 
    1196:	2579 0000 4ad4 	move.l 4ad4 <ClScreen+0x14>,84(a2)
    119c:	0054 
    119e:	2579 0000 4ad8 	move.l 4ad8 <ClScreen+0x18>,88(a2)
    11a4:	0058 
    11a6:	2579 0000 4adc 	move.l 4adc <ClScreen+0x1c>,92(a2)
    11ac:	005c 
    11ae:	2579 0000 4ae0 	move.l 4ae0 <ClScreen+0x20>,96(a2)
    11b4:	0060 
    11b6:	2579 0000 4ae4 	move.l 4ae4 <ClScreen+0x24>,100(a2)
    11bc:	0064 
    11be:	2579 0000 4ae8 	move.l 4ae8 <ClScreen+0x28>,104(a2)
    11c4:	0068 
    11c6:	2579 0000 4aec 	move.l 4aec <ClScreen+0x2c>,108(a2)
    11cc:	006c 
  *cl++ = 0x00e00000;
    11ce:	257c 00e0 0000 	move.l #14680064,112(a2)
    11d4:	0070 
  *cl++ = 0x00e20000;
    11d6:	257c 00e2 0000 	move.l #14811136,116(a2)
    11dc:	0074 
    *cl++ = *clpartinstruction++;
    11de:	2579 0000 4ab8 	move.l 4ab8 <ClColor>,120(a2)
    11e4:	0078 
    11e6:	2579 0000 4abc 	move.l 4abc <ClColor+0x4>,124(a2)
    11ec:	007c 
  *cl = 0xfffffffe;
    11ee:	70fe           	moveq #-2,d0
    11f0:	2540 0080      	move.l d0,128(a2)
}
    11f4:	200a           	move.l a2,d0
    11f6:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    11fa:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    11fc:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
    1202:	4eae ffc4      	jsr -60(a6)
    1206:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
    120c:	2200           	move.l d0,d1
    120e:	243c 0000 24af 	move.l #9391,d2
    1214:	7628           	moveq #40,d3
    1216:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    121a:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
    1220:	7201           	moveq #1,d1
    1222:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1226:	24b9 0000 4af0 	move.l 4af0 <ClsSprites>,(a2)
    122c:	2579 0000 4af4 	move.l 4af4 <ClsSprites+0x4>,4(a2)
    1232:	0004 
    1234:	2579 0000 4af8 	move.l 4af8 <ClsSprites+0x8>,8(a2)
    123a:	0008 
    123c:	2579 0000 4afc 	move.l 4afc <ClsSprites+0xc>,12(a2)
    1242:	000c 
    1244:	2579 0000 4b00 	move.l 4b00 <ClsSprites+0x10>,16(a2)
    124a:	0010 
    124c:	2579 0000 4b04 	move.l 4b04 <ClsSprites+0x14>,20(a2)
    1252:	0014 
    1254:	2579 0000 4b08 	move.l 4b08 <ClsSprites+0x18>,24(a2)
    125a:	0018 
    125c:	2579 0000 4b0c 	move.l 4b0c <ClsSprites+0x1c>,28(a2)
    1262:	001c 
    1264:	2579 0000 4b10 	move.l 4b10 <ClsSprites+0x20>,32(a2)
    126a:	0020 
    126c:	2579 0000 4b14 	move.l 4b14 <ClsSprites+0x24>,36(a2)
    1272:	0024 
    1274:	2579 0000 4b18 	move.l 4b18 <ClsSprites+0x28>,40(a2)
    127a:	0028 
    127c:	2579 0000 4b1c 	move.l 4b1c <ClsSprites+0x2c>,44(a2)
    1282:	002c 
    1284:	2579 0000 4b20 	move.l 4b20 <ClsSprites+0x30>,48(a2)
    128a:	0030 
    128c:	2579 0000 4b24 	move.l 4b24 <ClsSprites+0x34>,52(a2)
    1292:	0034 
    1294:	2579 0000 4b28 	move.l 4b28 <ClsSprites+0x38>,56(a2)
    129a:	0038 
    129c:	2579 0000 4b2c 	move.l 4b2c <ClsSprites+0x3c>,60(a2)
    12a2:	003c 
    *cl++ = *clpartinstruction++;
    12a4:	2579 0000 4ac0 	move.l 4ac0 <ClScreen>,64(a2)
    12aa:	0040 
    12ac:	2579 0000 4ac4 	move.l 4ac4 <ClScreen+0x4>,68(a2)
    12b2:	0044 
    12b4:	2579 0000 4ac8 	move.l 4ac8 <ClScreen+0x8>,72(a2)
    12ba:	0048 
    12bc:	2579 0000 4acc 	move.l 4acc <ClScreen+0xc>,76(a2)
    12c2:	004c 
    12c4:	2579 0000 4ad0 	move.l 4ad0 <ClScreen+0x10>,80(a2)
    12ca:	0050 
    12cc:	2579 0000 4ad4 	move.l 4ad4 <ClScreen+0x14>,84(a2)
    12d2:	0054 
    12d4:	2579 0000 4ad8 	move.l 4ad8 <ClScreen+0x18>,88(a2)
    12da:	0058 
    12dc:	2579 0000 4adc 	move.l 4adc <ClScreen+0x1c>,92(a2)
    12e2:	005c 
    12e4:	2579 0000 4ae0 	move.l 4ae0 <ClScreen+0x20>,96(a2)
    12ea:	0060 
    12ec:	2579 0000 4ae4 	move.l 4ae4 <ClScreen+0x24>,100(a2)
    12f2:	0064 
    12f4:	2579 0000 4ae8 	move.l 4ae8 <ClScreen+0x28>,104(a2)
    12fa:	0068 
    12fc:	2579 0000 4aec 	move.l 4aec <ClScreen+0x2c>,108(a2)
    1302:	006c 
  *cl++ = 0x00e00000;
    1304:	257c 00e0 0000 	move.l #14680064,112(a2)
    130a:	0070 
  *cl++ = 0x00e20000;
    130c:	257c 00e2 0000 	move.l #14811136,116(a2)
    1312:	0074 
    *cl++ = *clpartinstruction++;
    1314:	2579 0000 4ab8 	move.l 4ab8 <ClColor>,120(a2)
    131a:	0078 
    131c:	2579 0000 4abc 	move.l 4abc <ClColor+0x4>,124(a2)
    1322:	007c 
  *cl = 0xfffffffe;
    1324:	70fe           	moveq #-2,d0
    1326:	2540 0080      	move.l d0,128(a2)
}
    132a:	200a           	move.l a2,d0
    132c:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1330:	4e75           	rts

00001332 <ClbuildZoom>:
ULONG * ClbuildZoom() {
    1332:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    1336:	2c79 0000 4bae 	movea.l 4bae <SysBase>,a6
    133c:	203c 0000 a48c 	move.l #42124,d0
    1342:	7202           	moveq #2,d1
    1344:	4eae ff3a      	jsr -198(a6)
    1348:	2440           	movea.l d0,a2
  if( retval == 0) {
    134a:	4a80           	tst.l d0
    134c:	6700 0160      	beq.w 14ae <ClbuildZoom+0x17c>
    *cl++ = *clpartinstruction++;
    1350:	24b9 0000 4af0 	move.l 4af0 <ClsSprites>,(a2)
    1356:	2579 0000 4af4 	move.l 4af4 <ClsSprites+0x4>,4(a2)
    135c:	0004 
    135e:	2579 0000 4af8 	move.l 4af8 <ClsSprites+0x8>,8(a2)
    1364:	0008 
    1366:	2579 0000 4afc 	move.l 4afc <ClsSprites+0xc>,12(a2)
    136c:	000c 
    136e:	2579 0000 4b00 	move.l 4b00 <ClsSprites+0x10>,16(a2)
    1374:	0010 
    1376:	2579 0000 4b04 	move.l 4b04 <ClsSprites+0x14>,20(a2)
    137c:	0014 
    137e:	2579 0000 4b08 	move.l 4b08 <ClsSprites+0x18>,24(a2)
    1384:	0018 
    1386:	2579 0000 4b0c 	move.l 4b0c <ClsSprites+0x1c>,28(a2)
    138c:	001c 
    138e:	2579 0000 4b10 	move.l 4b10 <ClsSprites+0x20>,32(a2)
    1394:	0020 
    1396:	2579 0000 4b14 	move.l 4b14 <ClsSprites+0x24>,36(a2)
    139c:	0024 
    139e:	2579 0000 4b18 	move.l 4b18 <ClsSprites+0x28>,40(a2)
    13a4:	0028 
    13a6:	2579 0000 4b1c 	move.l 4b1c <ClsSprites+0x2c>,44(a2)
    13ac:	002c 
    13ae:	2579 0000 4b20 	move.l 4b20 <ClsSprites+0x30>,48(a2)
    13b4:	0030 
    13b6:	2579 0000 4b24 	move.l 4b24 <ClsSprites+0x34>,52(a2)
    13bc:	0034 
    13be:	2579 0000 4b28 	move.l 4b28 <ClsSprites+0x38>,56(a2)
    13c4:	0038 
    13c6:	2579 0000 4b2c 	move.l 4b2c <ClsSprites+0x3c>,60(a2)
    13cc:	003c 
    *cl++ = *clpartinstruction++;
    13ce:	2579 0000 4a88 	move.l 4a88 <ClScreenZoom>,64(a2)
    13d4:	0040 
    13d6:	2579 0000 4a8c 	move.l 4a8c <ClScreenZoom+0x4>,68(a2)
    13dc:	0044 
    13de:	2579 0000 4a90 	move.l 4a90 <ClScreenZoom+0x8>,72(a2)
    13e4:	0048 
    13e6:	2579 0000 4a94 	move.l 4a94 <ClScreenZoom+0xc>,76(a2)
    13ec:	004c 
    13ee:	2579 0000 4a98 	move.l 4a98 <ClScreenZoom+0x10>,80(a2)
    13f4:	0050 
    13f6:	2579 0000 4a9c 	move.l 4a9c <ClScreenZoom+0x14>,84(a2)
    13fc:	0054 
    13fe:	2579 0000 4aa0 	move.l 4aa0 <ClScreenZoom+0x18>,88(a2)
    1404:	0058 
    1406:	2579 0000 4aa4 	move.l 4aa4 <ClScreenZoom+0x1c>,92(a2)
    140c:	005c 
    140e:	2579 0000 4aa8 	move.l 4aa8 <ClScreenZoom+0x20>,96(a2)
    1414:	0060 
    1416:	2579 0000 4aac 	move.l 4aac <ClScreenZoom+0x24>,100(a2)
    141c:	0064 
    141e:	2579 0000 4ab0 	move.l 4ab0 <ClScreenZoom+0x28>,104(a2)
    1424:	0068 
    1426:	2579 0000 4ab4 	move.l 4ab4 <ClScreenZoom+0x2c>,108(a2)
    142c:	006c 
  *cl++ = 0x00e00000;
    142e:	257c 00e0 0000 	move.l #14680064,112(a2)
    1434:	0070 
  *cl++ = 0x00e20000;
    1436:	257c 00e2 0000 	move.l #14811136,116(a2)
    143c:	0074 
  *cl++ = 0x00e40000;
    143e:	257c 00e4 0000 	move.l #14942208,120(a2)
    1444:	0078 
  *cl++ = 0x00e60000;
    1446:	257c 00e6 0000 	move.l #15073280,124(a2)
    144c:	007c 
    *cl++ = *clpartinstruction++;
    144e:	2579 0000 4ab8 	move.l 4ab8 <ClColor>,128(a2)
    1454:	0080 
    1456:	2579 0000 4abc 	move.l 4abc <ClColor+0x4>,132(a2)
    145c:	0084 
    145e:	43ea 012c      	lea 300(a2),a1
    1462:	220a           	move.l a2,d1
    1464:	0681 0000 a52c 	addi.l #42284,d1
    146a:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    1470:	41e9 ff60      	lea -160(a1),a0
    1474:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    1478:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    147e:	5088           	addq.l #8,a0
    1480:	217c 0182 0f00 	move.l #25300736,-4(a0)
    1486:	fffc 
    for(int i2=0;i2<20;i2++) {
    1488:	b3c8           	cmpa.l a0,a1
    148a:	66ec           	bne.s 1478 <ClbuildZoom+0x146>
    148c:	43e8 00a4      	lea 164(a0),a1
    1490:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    1496:	b3c1           	cmpa.l d1,a1
    1498:	66d6           	bne.s 1470 <ClbuildZoom+0x13e>
   *cl = 0xfffffffe;
    149a:	203c 0000 a488 	move.l #42120,d0
    14a0:	72fe           	moveq #-2,d1
    14a2:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    14a6:	200a           	move.l a2,d0
    14a8:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    14ac:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    14ae:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
    14b4:	4eae ffc4      	jsr -60(a6)
    14b8:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
    14be:	2200           	move.l d0,d1
    14c0:	243c 0000 24af 	move.l #9391,d2
    14c6:	7628           	moveq #40,d3
    14c8:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    14cc:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
    14d2:	7201           	moveq #1,d1
    14d4:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    14d8:	24b9 0000 4af0 	move.l 4af0 <ClsSprites>,(a2)
    14de:	2579 0000 4af4 	move.l 4af4 <ClsSprites+0x4>,4(a2)
    14e4:	0004 
    14e6:	2579 0000 4af8 	move.l 4af8 <ClsSprites+0x8>,8(a2)
    14ec:	0008 
    14ee:	2579 0000 4afc 	move.l 4afc <ClsSprites+0xc>,12(a2)
    14f4:	000c 
    14f6:	2579 0000 4b00 	move.l 4b00 <ClsSprites+0x10>,16(a2)
    14fc:	0010 
    14fe:	2579 0000 4b04 	move.l 4b04 <ClsSprites+0x14>,20(a2)
    1504:	0014 
    1506:	2579 0000 4b08 	move.l 4b08 <ClsSprites+0x18>,24(a2)
    150c:	0018 
    150e:	2579 0000 4b0c 	move.l 4b0c <ClsSprites+0x1c>,28(a2)
    1514:	001c 
    1516:	2579 0000 4b10 	move.l 4b10 <ClsSprites+0x20>,32(a2)
    151c:	0020 
    151e:	2579 0000 4b14 	move.l 4b14 <ClsSprites+0x24>,36(a2)
    1524:	0024 
    1526:	2579 0000 4b18 	move.l 4b18 <ClsSprites+0x28>,40(a2)
    152c:	0028 
    152e:	2579 0000 4b1c 	move.l 4b1c <ClsSprites+0x2c>,44(a2)
    1534:	002c 
    1536:	2579 0000 4b20 	move.l 4b20 <ClsSprites+0x30>,48(a2)
    153c:	0030 
    153e:	2579 0000 4b24 	move.l 4b24 <ClsSprites+0x34>,52(a2)
    1544:	0034 
    1546:	2579 0000 4b28 	move.l 4b28 <ClsSprites+0x38>,56(a2)
    154c:	0038 
    154e:	2579 0000 4b2c 	move.l 4b2c <ClsSprites+0x3c>,60(a2)
    1554:	003c 
    *cl++ = *clpartinstruction++;
    1556:	2579 0000 4a88 	move.l 4a88 <ClScreenZoom>,64(a2)
    155c:	0040 
    155e:	2579 0000 4a8c 	move.l 4a8c <ClScreenZoom+0x4>,68(a2)
    1564:	0044 
    1566:	2579 0000 4a90 	move.l 4a90 <ClScreenZoom+0x8>,72(a2)
    156c:	0048 
    156e:	2579 0000 4a94 	move.l 4a94 <ClScreenZoom+0xc>,76(a2)
    1574:	004c 
    1576:	2579 0000 4a98 	move.l 4a98 <ClScreenZoom+0x10>,80(a2)
    157c:	0050 
    157e:	2579 0000 4a9c 	move.l 4a9c <ClScreenZoom+0x14>,84(a2)
    1584:	0054 
    1586:	2579 0000 4aa0 	move.l 4aa0 <ClScreenZoom+0x18>,88(a2)
    158c:	0058 
    158e:	2579 0000 4aa4 	move.l 4aa4 <ClScreenZoom+0x1c>,92(a2)
    1594:	005c 
    1596:	2579 0000 4aa8 	move.l 4aa8 <ClScreenZoom+0x20>,96(a2)
    159c:	0060 
    159e:	2579 0000 4aac 	move.l 4aac <ClScreenZoom+0x24>,100(a2)
    15a4:	0064 
    15a6:	2579 0000 4ab0 	move.l 4ab0 <ClScreenZoom+0x28>,104(a2)
    15ac:	0068 
    15ae:	2579 0000 4ab4 	move.l 4ab4 <ClScreenZoom+0x2c>,108(a2)
    15b4:	006c 
  *cl++ = 0x00e00000;
    15b6:	257c 00e0 0000 	move.l #14680064,112(a2)
    15bc:	0070 
  *cl++ = 0x00e20000;
    15be:	257c 00e2 0000 	move.l #14811136,116(a2)
    15c4:	0074 
  *cl++ = 0x00e40000;
    15c6:	257c 00e4 0000 	move.l #14942208,120(a2)
    15cc:	0078 
  *cl++ = 0x00e60000;
    15ce:	257c 00e6 0000 	move.l #15073280,124(a2)
    15d4:	007c 
    *cl++ = *clpartinstruction++;
    15d6:	2579 0000 4ab8 	move.l 4ab8 <ClColor>,128(a2)
    15dc:	0080 
    15de:	2579 0000 4abc 	move.l 4abc <ClColor+0x4>,132(a2)
    15e4:	0084 
    15e6:	43ea 012c      	lea 300(a2),a1
    15ea:	220a           	move.l a2,d1
    15ec:	0681 0000 a52c 	addi.l #42284,d1
    15f2:	203c 2c07 fffe 	move.l #738721790,d0
    15f8:	6000 fe76      	bra.w 1470 <ClbuildZoom+0x13e>

000015fc <SwapCl>:
  ULONG tmp = DrawCopper;
    15fc:	2039 0000 4b96 	move.l 4b96 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    1602:	23f9 0000 4b8a 	move.l 4b8a <ViewCopper>,4b96 <DrawCopper>
    1608:	0000 4b96 
  ViewCopper = tmp;
    160c:	23c0 0000 4b8a 	move.l d0,4b8a <ViewCopper>
  hw->cop1lc = ViewCopper;
    1612:	2079 0000 4b86 	movea.l 4b86 <hw>,a0
    1618:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    161c:	3140 0088      	move.w d0,136(a0)
}
    1620:	4e75           	rts

00001622 <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    1622:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    1626:	45fa fd0a      	lea 1332 <ClbuildZoom>(pc),a2
    162a:	4e92           	jsr (a2)
    162c:	23c0 0000 4baa 	move.l d0,4baa <Copperlist1>
  Copperlist2 = ClbuildZoom();
    1632:	4e92           	jsr (a2)
    1634:	23c0 0000 4ba6 	move.l d0,4ba6 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    163a:	2c79 0000 4bae 	movea.l 4bae <SysBase>,a6
    1640:	203c 0000 fa00 	move.l #64000,d0
    1646:	7202           	moveq #2,d1
    1648:	4eae ff3a      	jsr -198(a6)
    164c:	23c0 0000 4ba2 	move.l d0,4ba2 <Bitplane1>
  if(Bitplane1 == 0) {
    1652:	6700 014e      	beq.w 17a2 <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    1656:	23c0 0000 4b9a 	move.l d0,4b9a <DrawBuffer>
  DrawCopper = Copperlist1;
    165c:	23f9 0000 4baa 	move.l 4baa <Copperlist1>,4b96 <DrawCopper>
    1662:	0000 4b96 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1666:	2c79 0000 4bae 	movea.l 4bae <SysBase>,a6
    166c:	203c 0000 fa00 	move.l #64000,d0
    1672:	7202           	moveq #2,d1
    1674:	4eae ff3a      	jsr -198(a6)
    1678:	2400           	move.l d0,d2
    167a:	23c0 0000 4b92 	move.l d0,4b92 <Bitplane2>
  if(Bitplane2 == 0) {
    1680:	6778           	beq.s 16fa <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    1682:	23f9 0000 4ba6 	move.l 4ba6 <Copperlist2>,4b8a <ViewCopper>
    1688:	0000 4b8a 
  SwapCl();
    168c:	45fa ff6e      	lea 15fc <SwapCl>(pc),a2
    1690:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    1692:	2039 0000 4b9a 	move.l 4b9a <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    1698:	2079 0000 4b96 	movea.l 4b96 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    169e:	2200           	move.l d0,d1
    16a0:	4241           	clr.w d1
    16a2:	4841           	swap d1
    16a4:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    16a8:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    16ac:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    16b2:	2200           	move.l d0,d1
    16b4:	4241           	clr.w d1
    16b6:	4841           	swap d1
    16b8:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    16bc:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    16c0:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    16c2:	2079 0000 4b96 	movea.l 4b96 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    16c8:	2002           	move.l d2,d0
    16ca:	4240           	clr.w d0
    16cc:	4840           	swap d0
    16ce:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    16d2:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    16d6:	2002           	move.l d2,d0
    16d8:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    16de:	2200           	move.l d0,d1
    16e0:	4241           	clr.w d1
    16e2:	4841           	swap d1
    16e4:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    16e8:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    16ec:	23c2 0000 4b8e 	move.l d2,4b8e <ViewBuffer>
}
    16f2:	7000           	moveq #0,d0
    16f4:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    16f8:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    16fa:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
    1700:	4eae ffc4      	jsr -60(a6)
    1704:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
    170a:	2200           	move.l d0,d1
    170c:	243c 0000 24fc 	move.l #9468,d2
    1712:	7626           	moveq #38,d3
    1714:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1718:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
    171e:	7201           	moveq #1,d1
    1720:	4eae ff70      	jsr -144(a6)
    1724:	2439 0000 4b92 	move.l 4b92 <Bitplane2>,d2
  ViewCopper = Copperlist2;
    172a:	23f9 0000 4ba6 	move.l 4ba6 <Copperlist2>,4b8a <ViewCopper>
    1730:	0000 4b8a 
  SwapCl();
    1734:	45fa fec6      	lea 15fc <SwapCl>(pc),a2
    1738:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    173a:	2039 0000 4b9a 	move.l 4b9a <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    1740:	2079 0000 4b96 	movea.l 4b96 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    1746:	2200           	move.l d0,d1
    1748:	4241           	clr.w d1
    174a:	4841           	swap d1
    174c:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    1750:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    1754:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    175a:	2200           	move.l d0,d1
    175c:	4241           	clr.w d1
    175e:	4841           	swap d1
    1760:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    1764:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    1768:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    176a:	2079 0000 4b96 	movea.l 4b96 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    1770:	2002           	move.l d2,d0
    1772:	4240           	clr.w d0
    1774:	4840           	swap d0
    1776:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    177a:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    177e:	2002           	move.l d2,d0
    1780:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    1786:	2200           	move.l d0,d1
    1788:	4241           	clr.w d1
    178a:	4841           	swap d1
    178c:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    1790:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    1794:	23c2 0000 4b8e 	move.l d2,4b8e <ViewBuffer>
}
    179a:	7000           	moveq #0,d0
    179c:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    17a0:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    17a2:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
    17a8:	4eae ffc4      	jsr -60(a6)
    17ac:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
    17b2:	2200           	move.l d0,d1
    17b4:	243c 0000 24d5 	move.l #9429,d2
    17ba:	7626           	moveq #38,d3
    17bc:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    17c0:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
    17c6:	7201           	moveq #1,d1
    17c8:	4eae ff70      	jsr -144(a6)
    17cc:	2039 0000 4ba2 	move.l 4ba2 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    17d2:	23c0 0000 4b9a 	move.l d0,4b9a <DrawBuffer>
  DrawCopper = Copperlist1;
    17d8:	23f9 0000 4baa 	move.l 4baa <Copperlist1>,4b96 <DrawCopper>
    17de:	0000 4b96 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    17e2:	2c79 0000 4bae 	movea.l 4bae <SysBase>,a6
    17e8:	203c 0000 fa00 	move.l #64000,d0
    17ee:	7202           	moveq #2,d1
    17f0:	4eae ff3a      	jsr -198(a6)
    17f4:	2400           	move.l d0,d2
    17f6:	23c0 0000 4b92 	move.l d0,4b92 <Bitplane2>
  if(Bitplane2 == 0) {
    17fc:	6600 fe84      	bne.w 1682 <PrepareDisplayZoom+0x60>
    1800:	6000 fef8      	bra.w 16fa <PrepareDisplayZoom+0xd8>

00001804 <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    1804:	2039 0000 4b9a 	move.l 4b9a <DrawBuffer>,d0
  UWORD *copword = DrawCopper;
    180a:	2079 0000 4b96 	movea.l 4b96 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    1810:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    1814:	2200           	move.l d0,d1
    1816:	4241           	clr.w d1
    1818:	4841           	swap d1
    181a:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    181e:	23f9 0000 4b8e 	move.l 4b8e <ViewBuffer>,4b9a <DrawBuffer>
    1824:	0000 4b9a 
  ViewBuffer = tmp;
    1828:	23c0 0000 4b8e 	move.l d0,4b8e <ViewBuffer>
}
    182e:	4e75           	rts

00001830 <PrepareDisplay>:
 int PrepareDisplaySW() {
    1830:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClbuildSW();
    1834:	45fa f89e      	lea 10d4 <ClBuild>(pc),a2
    1838:	4e92           	jsr (a2)
    183a:	23c0 0000 4baa 	move.l d0,4baa <Copperlist1>
  Copperlist2 = ClbuildSW();
    1840:	4e92           	jsr (a2)
    1842:	23c0 0000 4ba6 	move.l d0,4ba6 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    1848:	2c79 0000 4bae 	movea.l 4bae <SysBase>,a6
    184e:	203c 0000 c800 	move.l #51200,d0
    1854:	7202           	moveq #2,d1
    1856:	4eae ff3a      	jsr -198(a6)
    185a:	23c0 0000 4ba2 	move.l d0,4ba2 <Bitplane1>
  if(Bitplane1 == 0) {
    1860:	6700 00ac      	beq.w 190e <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    1864:	23c0 0000 4b9a 	move.l d0,4b9a <DrawBuffer>
  DrawCopper = Copperlist1;
    186a:	23f9 0000 4baa 	move.l 4baa <Copperlist1>,4b96 <DrawCopper>
    1870:	0000 4b96 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    1874:	2c79 0000 4bae 	movea.l 4bae <SysBase>,a6
    187a:	203c 0000 c800 	move.l #51200,d0
    1880:	7202           	moveq #2,d1
    1882:	4eae ff3a      	jsr -198(a6)
    1886:	23c0 0000 4b92 	move.l d0,4b92 <Bitplane2>
  if(Bitplane2 == 0) {
    188c:	6728           	beq.s 18b6 <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    188e:	23c0 0000 4b8e 	move.l d0,4b8e <ViewBuffer>
  ViewCopper = Copperlist2;
    1894:	23f9 0000 4ba6 	move.l 4ba6 <Copperlist2>,4b8a <ViewCopper>
    189a:	0000 4b8a 
  SwapCl();
    189e:	47fa fd5c      	lea 15fc <SwapCl>(pc),a3
    18a2:	4e93           	jsr (a3)
  SetBplPointers();
    18a4:	45fa ff5e      	lea 1804 <SetBplPointers>(pc),a2
    18a8:	4e92           	jsr (a2)
  SwapCl();
    18aa:	4e93           	jsr (a3)
  SetBplPointers();
    18ac:	4e92           	jsr (a2)
}
    18ae:	7000           	moveq #0,d0
    18b0:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    18b4:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    18b6:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
    18bc:	4eae ffc4      	jsr -60(a6)
    18c0:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
    18c6:	2200           	move.l d0,d1
    18c8:	243c 0000 24fc 	move.l #9468,d2
    18ce:	7626           	moveq #38,d3
    18d0:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    18d4:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
    18da:	7201           	moveq #1,d1
    18dc:	4eae ff70      	jsr -144(a6)
    18e0:	2039 0000 4b92 	move.l 4b92 <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    18e6:	23c0 0000 4b8e 	move.l d0,4b8e <ViewBuffer>
  ViewCopper = Copperlist2;
    18ec:	23f9 0000 4ba6 	move.l 4ba6 <Copperlist2>,4b8a <ViewCopper>
    18f2:	0000 4b8a 
  SwapCl();
    18f6:	47fa fd04      	lea 15fc <SwapCl>(pc),a3
    18fa:	4e93           	jsr (a3)
  SetBplPointers();
    18fc:	45fa ff06      	lea 1804 <SetBplPointers>(pc),a2
    1900:	4e92           	jsr (a2)
  SwapCl();
    1902:	4e93           	jsr (a3)
  SetBplPointers();
    1904:	4e92           	jsr (a2)
}
    1906:	7000           	moveq #0,d0
    1908:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    190c:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    190e:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
    1914:	4eae ffc4      	jsr -60(a6)
    1918:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
    191e:	2200           	move.l d0,d1
    1920:	243c 0000 24d5 	move.l #9429,d2
    1926:	7626           	moveq #38,d3
    1928:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    192c:	2c79 0000 4b9e 	movea.l 4b9e <DOSBase>,a6
    1932:	7201           	moveq #1,d1
    1934:	4eae ff70      	jsr -144(a6)
    1938:	2039 0000 4ba2 	move.l 4ba2 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    193e:	23c0 0000 4b9a 	move.l d0,4b9a <DrawBuffer>
  DrawCopper = Copperlist1;
    1944:	23f9 0000 4baa 	move.l 4baa <Copperlist1>,4b96 <DrawCopper>
    194a:	0000 4b96 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    194e:	2c79 0000 4bae 	movea.l 4bae <SysBase>,a6
    1954:	203c 0000 c800 	move.l #51200,d0
    195a:	7202           	moveq #2,d1
    195c:	4eae ff3a      	jsr -198(a6)
    1960:	23c0 0000 4b92 	move.l d0,4b92 <Bitplane2>
  if(Bitplane2 == 0) {
    1966:	6600 ff26      	bne.w 188e <PrepareDisplay+0x5e>
    196a:	6000 ff4a      	bra.w 18b6 <PrepareDisplay+0x86>

0000196e <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    196e:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    1972:	262f 0010      	move.l 16(sp),d3
    1976:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    197a:	2279 0000 4baa 	movea.l 4baa <Copperlist1>,a1
    1980:	b2fc 0000      	cmpa.w #0,a1
    1984:	670c           	beq.s 1992 <FreeDisplay+0x24>
    1986:	2c79 0000 4bae 	movea.l 4bae <SysBase>,a6
    198c:	2003           	move.l d3,d0
    198e:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    1992:	2279 0000 4ba6 	movea.l 4ba6 <Copperlist2>,a1
    1998:	b2fc 0000      	cmpa.w #0,a1
    199c:	670c           	beq.s 19aa <FreeDisplay+0x3c>
    199e:	2c79 0000 4bae 	movea.l 4bae <SysBase>,a6
    19a4:	2003           	move.l d3,d0
    19a6:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    19aa:	2279 0000 4ba2 	movea.l 4ba2 <Bitplane1>,a1
    19b0:	b2fc 0000      	cmpa.w #0,a1
    19b4:	670c           	beq.s 19c2 <FreeDisplay+0x54>
    19b6:	2c79 0000 4bae 	movea.l 4bae <SysBase>,a6
    19bc:	2002           	move.l d2,d0
    19be:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    19c2:	2279 0000 4b92 	movea.l 4b92 <Bitplane2>,a1
    19c8:	b2fc 0000      	cmpa.w #0,a1
    19cc:	670c           	beq.s 19da <FreeDisplay+0x6c>
    19ce:	2c79 0000 4bae 	movea.l 4bae <SysBase>,a6
    19d4:	2002           	move.l d2,d0
    19d6:	4eae ff2e      	jsr -210(a6)
}
    19da:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    19de:	4e75           	rts

000019e0 <WaitVbl>:
void WaitVbl() {
    19e0:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    19e2:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddda39>,d0
    19e8:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    19ea:	2017           	move.l (sp),d0
    19ec:	0280 0001 ff00 	andi.l #130816,d0
    19f2:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    19f4:	2017           	move.l (sp),d0
    19f6:	0c80 0001 3700 	cmpi.l #79616,d0
    19fc:	67e4           	beq.s 19e2 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    19fe:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddda39>,d0
    1a04:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    1a08:	202f 0004      	move.l 4(sp),d0
    1a0c:	0280 0001 ff00 	andi.l #130816,d0
    1a12:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    1a16:	202f 0004      	move.l 4(sp),d0
    1a1a:	0c80 0001 3700 	cmpi.l #79616,d0
    1a20:	66dc           	bne.s 19fe <WaitVbl+0x1e>
}
    1a22:	508f           	addq.l #8,sp
    1a24:	4e75           	rts

00001a26 <memcpy>:
{
    1a26:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    1a2a:	202f 0014      	move.l 20(sp),d0
    1a2e:	226f 0018      	movea.l 24(sp),a1
    1a32:	222f 001c      	move.l 28(sp),d1
	while(len--)
    1a36:	2601           	move.l d1,d3
    1a38:	5383           	subq.l #1,d3
    1a3a:	4a81           	tst.l d1
    1a3c:	6762           	beq.s 1aa0 <memcpy+0x7a>
    1a3e:	2040           	movea.l d0,a0
    1a40:	5888           	addq.l #4,a0
    1a42:	b1c9           	cmpa.l a1,a0
    1a44:	53c2           	sl.s d2
    1a46:	4402           	neg.b d2
    1a48:	41e9 0004      	lea 4(a1),a0
    1a4c:	b1c0           	cmpa.l d0,a0
    1a4e:	53c4           	sl.s d4
    1a50:	4404           	neg.b d4
    1a52:	8404           	or.b d4,d2
    1a54:	7808           	moveq #8,d4
    1a56:	b883           	cmp.l d3,d4
    1a58:	55c4           	sc.s d4
    1a5a:	4404           	neg.b d4
    1a5c:	c404           	and.b d4,d2
    1a5e:	6746           	beq.s 1aa6 <memcpy+0x80>
    1a60:	2409           	move.l a1,d2
    1a62:	8480           	or.l d0,d2
    1a64:	7803           	moveq #3,d4
    1a66:	c484           	and.l d4,d2
    1a68:	663c           	bne.s 1aa6 <memcpy+0x80>
    1a6a:	2049           	movea.l a1,a0
    1a6c:	2440           	movea.l d0,a2
    1a6e:	74fc           	moveq #-4,d2
    1a70:	c481           	and.l d1,d2
    1a72:	d489           	add.l a1,d2
		*d++ = *s++;
    1a74:	24d8           	move.l (a0)+,(a2)+
    1a76:	b488           	cmp.l a0,d2
    1a78:	66fa           	bne.s 1a74 <memcpy+0x4e>
    1a7a:	74fc           	moveq #-4,d2
    1a7c:	c481           	and.l d1,d2
    1a7e:	2040           	movea.l d0,a0
    1a80:	d1c2           	adda.l d2,a0
    1a82:	d3c2           	adda.l d2,a1
    1a84:	9682           	sub.l d2,d3
    1a86:	b481           	cmp.l d1,d2
    1a88:	6716           	beq.s 1aa0 <memcpy+0x7a>
    1a8a:	1091           	move.b (a1),(a0)
	while(len--)
    1a8c:	4a83           	tst.l d3
    1a8e:	6710           	beq.s 1aa0 <memcpy+0x7a>
		*d++ = *s++;
    1a90:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    1a96:	5383           	subq.l #1,d3
    1a98:	6706           	beq.s 1aa0 <memcpy+0x7a>
		*d++ = *s++;
    1a9a:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    1aa0:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    1aa4:	4e75           	rts
    1aa6:	2040           	movea.l d0,a0
    1aa8:	d289           	add.l a1,d1
		*d++ = *s++;
    1aaa:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    1aac:	b289           	cmp.l a1,d1
    1aae:	67f0           	beq.s 1aa0 <memcpy+0x7a>
		*d++ = *s++;
    1ab0:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    1ab2:	b289           	cmp.l a1,d1
    1ab4:	66f4           	bne.s 1aaa <memcpy+0x84>
    1ab6:	60e8           	bra.s 1aa0 <memcpy+0x7a>

00001ab8 <memset>:
{
    1ab8:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    1abc:	202f 0024      	move.l 36(sp),d0
    1ac0:	2a2f 0028      	move.l 40(sp),d5
    1ac4:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    1ac8:	2809           	move.l a1,d4
    1aca:	5384           	subq.l #1,d4
    1acc:	b2fc 0000      	cmpa.w #0,a1
    1ad0:	6f00 00b0      	ble.w 1b82 <memset+0xca>
    1ad4:	1e05           	move.b d5,d7
    1ad6:	2200           	move.l d0,d1
    1ad8:	4481           	neg.l d1
    1ada:	7403           	moveq #3,d2
    1adc:	c282           	and.l d2,d1
    1ade:	7c05           	moveq #5,d6
		*ptr++ = val;
    1ae0:	2440           	movea.l d0,a2
    1ae2:	bc84           	cmp.l d4,d6
    1ae4:	646a           	bcc.s 1b50 <memset+0x98>
    1ae6:	4a81           	tst.l d1
    1ae8:	6724           	beq.s 1b0e <memset+0x56>
    1aea:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    1aec:	5384           	subq.l #1,d4
    1aee:	7401           	moveq #1,d2
    1af0:	b481           	cmp.l d1,d2
    1af2:	671a           	beq.s 1b0e <memset+0x56>
		*ptr++ = val;
    1af4:	2440           	movea.l d0,a2
    1af6:	548a           	addq.l #2,a2
    1af8:	2040           	movea.l d0,a0
    1afa:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    1afe:	5384           	subq.l #1,d4
    1b00:	7403           	moveq #3,d2
    1b02:	b481           	cmp.l d1,d2
    1b04:	6608           	bne.s 1b0e <memset+0x56>
		*ptr++ = val;
    1b06:	528a           	addq.l #1,a2
    1b08:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    1b0c:	5384           	subq.l #1,d4
    1b0e:	2609           	move.l a1,d3
    1b10:	9681           	sub.l d1,d3
    1b12:	7c00           	moveq #0,d6
    1b14:	1c05           	move.b d5,d6
    1b16:	2406           	move.l d6,d2
    1b18:	4842           	swap d2
    1b1a:	4242           	clr.w d2
    1b1c:	2042           	movea.l d2,a0
    1b1e:	2406           	move.l d6,d2
    1b20:	e14a           	lsl.w #8,d2
    1b22:	4842           	swap d2
    1b24:	4242           	clr.w d2
    1b26:	e18e           	lsl.l #8,d6
    1b28:	2646           	movea.l d6,a3
    1b2a:	2c08           	move.l a0,d6
    1b2c:	8486           	or.l d6,d2
    1b2e:	2c0b           	move.l a3,d6
    1b30:	8486           	or.l d6,d2
    1b32:	1407           	move.b d7,d2
    1b34:	2040           	movea.l d0,a0
    1b36:	d1c1           	adda.l d1,a0
    1b38:	72fc           	moveq #-4,d1
    1b3a:	c283           	and.l d3,d1
    1b3c:	d288           	add.l a0,d1
		*ptr++ = val;
    1b3e:	20c2           	move.l d2,(a0)+
    1b40:	b1c1           	cmpa.l d1,a0
    1b42:	66fa           	bne.s 1b3e <memset+0x86>
    1b44:	72fc           	moveq #-4,d1
    1b46:	c283           	and.l d3,d1
    1b48:	d5c1           	adda.l d1,a2
    1b4a:	9881           	sub.l d1,d4
    1b4c:	b283           	cmp.l d3,d1
    1b4e:	6732           	beq.s 1b82 <memset+0xca>
    1b50:	1485           	move.b d5,(a2)
	while(len-- > 0)
    1b52:	4a84           	tst.l d4
    1b54:	6f2c           	ble.s 1b82 <memset+0xca>
		*ptr++ = val;
    1b56:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    1b5a:	7201           	moveq #1,d1
    1b5c:	b284           	cmp.l d4,d1
    1b5e:	6c22           	bge.s 1b82 <memset+0xca>
		*ptr++ = val;
    1b60:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    1b64:	7402           	moveq #2,d2
    1b66:	b484           	cmp.l d4,d2
    1b68:	6c18           	bge.s 1b82 <memset+0xca>
		*ptr++ = val;
    1b6a:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    1b6e:	7c03           	moveq #3,d6
    1b70:	bc84           	cmp.l d4,d6
    1b72:	6c0e           	bge.s 1b82 <memset+0xca>
		*ptr++ = val;
    1b74:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    1b78:	7204           	moveq #4,d1
    1b7a:	b284           	cmp.l d4,d1
    1b7c:	6c04           	bge.s 1b82 <memset+0xca>
		*ptr++ = val;
    1b7e:	1545 0005      	move.b d5,5(a2)
}
    1b82:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    1b86:	4e75           	rts

00001b88 <strlen>:
{
    1b88:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    1b8c:	7000           	moveq #0,d0
	while(*s++)
    1b8e:	4a10           	tst.b (a0)
    1b90:	6708           	beq.s 1b9a <strlen+0x12>
		t++;
    1b92:	5280           	addq.l #1,d0
	while(*s++)
    1b94:	4a30 0800      	tst.b (0,a0,d0.l)
    1b98:	66f8           	bne.s 1b92 <strlen+0xa>
}
    1b9a:	4e75           	rts

00001b9c <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    1b9c:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    1ba0:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    1ba4:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    1ba8:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    1bac:	d041           	add.w d1,d0
	swap	d0
    1bae:	4840           	swap d0
	clrw	d0
    1bb0:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    1bb2:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    1bb6:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    1bba:	d081           	add.l d1,d0

	rts
    1bbc:	4e75           	rts

00001bbe <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    1bbe:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    1bc0:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    1bc4:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    1bc8:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    1bce:	6416           	bcc.s 1be6 <__udivsi3+0x28>
	movel	d0, d2
    1bd0:	2400           	move.l d0,d2
	clrw	d2
    1bd2:	4242           	clr.w d2
	swap	d2
    1bd4:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    1bd6:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    1bd8:	3002           	move.w d2,d0
	swap	d0
    1bda:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    1bdc:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    1be0:	84c1           	divu.w d1,d2
	movew	d2, d0
    1be2:	3002           	move.w d2,d0
	jra	6f
    1be4:	6030           	bra.s 1c16 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    1be6:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    1be8:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    1bea:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    1bec:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    1bf2:	64f4           	bcc.s 1be8 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    1bf4:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    1bf6:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    1bfc:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    1bfe:	c2c0           	mulu.w d0,d1
	swap	d2
    1c00:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    1c02:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    1c04:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    1c06:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    1c08:	660a           	bne.s 1c14 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    1c0a:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    1c0c:	6506           	bcs.s 1c14 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    1c0e:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    1c12:	6302           	bls.s 1c16 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    1c14:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    1c16:	241f           	move.l (sp)+,d2
	rts
    1c18:	4e75           	rts

00001c1a <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    1c1a:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    1c1c:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    1c1e:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    1c22:	6a04           	bpl.s 1c28 <__divsi3+0xe>
	negl	d1
    1c24:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    1c26:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    1c28:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    1c2c:	6a04           	bpl.s 1c32 <__divsi3+0x18>
	negl	d0
    1c2e:	4480           	neg.l d0
	negb	d2
    1c30:	4402           	neg.b d2

2:	movel	d1, sp@-
    1c32:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1c34:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    1c36:	6186           	bsr.s 1bbe <__udivsi3>
	addql	IMM (8), sp
    1c38:	508f           	addq.l #8,sp

	tstb	d2
    1c3a:	4a02           	tst.b d2
	jpl	3f
    1c3c:	6a02           	bpl.s 1c40 <__divsi3+0x26>
	negl	d0
    1c3e:	4480           	neg.l d0

3:	movel	sp@+, d2
    1c40:	241f           	move.l (sp)+,d2
	rts
    1c42:	4e75           	rts

00001c44 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    1c44:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    1c48:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    1c4c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1c4e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    1c50:	61c8           	bsr.s 1c1a <__divsi3>
	addql	IMM (8), sp
    1c52:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    1c54:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    1c58:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1c5a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    1c5c:	6100 ff3e      	bsr.w 1b9c <__mulsi3>
	addql	IMM (8), sp
    1c60:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    1c62:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    1c66:	9280           	sub.l d0,d1
	movel	d1, d0
    1c68:	2001           	move.l d1,d0
	rts
    1c6a:	4e75           	rts

00001c6c <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    1c6c:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    1c70:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    1c74:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1c76:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    1c78:	6100 ff44      	bsr.w 1bbe <__udivsi3>
	addql	IMM (8), sp
    1c7c:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    1c7e:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    1c82:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1c84:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    1c86:	6100 ff14      	bsr.w 1b9c <__mulsi3>
	addql	IMM (8), sp
    1c8a:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    1c8c:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    1c90:	9280           	sub.l d0,d1
	movel	d1, d0
    1c92:	2001           	move.l d1,d0
	rts
    1c94:	4e75           	rts

00001c96 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    1c96:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    1c98:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    1c9c:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    1ca0:	2c5f           	movea.l (sp)+,a6
    rts
    1ca2:	4e75           	rts

00001ca4 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    1ca4:	16c0           	move.b d0,(a3)+
	rts
    1ca6:	4e75           	rts

00001ca8 <saveregs>:
	...

00001ce4 <font2distance>:
    1ce4:	0505           	btst d2,d5
    1ce6:	0505           	btst d2,d5
    1ce8:	0505           	btst d2,d5
    1cea:	0505           	btst d2,d5
    1cec:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    1cee:	0505           	btst d2,d5
    1cf0:	0505           	btst d2,d5
    1cf2:	0005 0505      	ori.b #5,d5
    1cf6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    1cf8:	0505           	btst d2,d5
    1cfa:	0505           	btst d2,d5
    1cfc:	0505           	btst d2,d5
    1cfe:	0505           	btst d2,d5
    1d00:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    1d02:	0505           	btst d2,d5
    1d04:	0505           	btst d2,d5
    1d06:	0505           	btst d2,d5
    1d08:	0505           	btst d2,d5
    1d0a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    1d0c:	0500           	btst d2,d0
    1d0e:	0505           	btst d2,d5
    1d10:	0505           	btst d2,d5
    1d12:	0505           	btst d2,d5
    1d14:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    1d16:	0505           	btst d2,d5
    1d18:	0505           	btst d2,d5
    1d1a:	0505           	btst d2,d5
    1d1c:	0505           	btst d2,d5
    1d1e:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    1d20:	0505           	btst d2,d5
    1d22:	0505           	btst d2,d5
    1d24:	0503           	btst d2,d3
    1d26:	0505           	btst d2,d5
    1d28:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    1d2a:	0505           	btst d2,d5
    1d2c:	0500           	btst d2,d0
    1d2e:	0505           	btst d2,d5
    1d30:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    1d34:	0505           	btst d2,d5
    1d36:	0503           	btst d2,d3
    1d38:	0205 0507      	andi.b #7,d5
    1d3c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    1d3e:	0505           	btst d2,d5
    1d40:	0505           	btst d2,d5
    1d42:	0505           	btst d2,d5
    1d44:	0505           	btst d2,d5
    1d46:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1d48:	0505           	btst d2,d5
    1d4a:	0505           	btst d2,d5
    1d4c:	0505           	btst d2,d5
    1d4e:	0505           	btst d2,d5
    1d50:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1d52:	0505           	btst d2,d5
    1d54:	0505           	btst d2,d5
    1d56:	0505           	btst d2,d5
    1d58:	0505           	btst d2,d5
    1d5a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1d5c:	0505           	btst d2,d5
    1d5e:	0505           	btst d2,d5
    1d60:	0505           	btst d2,d5
    1d62:	0505           	btst d2,d5
    1d64:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1d66:	0505           	btst d2,d5
    1d68:	0505           	btst d2,d5
    1d6a:	0505           	btst d2,d5
    1d6c:	0505           	btst d2,d5
    1d6e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1d70:	0505           	btst d2,d5
    1d72:	0505           	btst d2,d5
    1d74:	0505           	btst d2,d5
    1d76:	0505           	btst d2,d5
    1d78:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1d7a:	0505           	btst d2,d5
    1d7c:	0505           	btst d2,d5
    1d7e:	0505           	btst d2,d5
    1d80:	0505           	btst d2,d5
    1d82:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1d84:	0505           	btst d2,d5
    1d86:	0505           	btst d2,d5
    1d88:	0505           	btst d2,d5
    1d8a:	0505           	btst d2,d5
    1d8c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1d8e:	0505           	btst d2,d5
    1d90:	0505           	btst d2,d5
    1d92:	0505           	btst d2,d5
    1d94:	0505           	btst d2,d5
    1d96:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1d98:	0505           	btst d2,d5
    1d9a:	0505           	btst d2,d5
    1d9c:	0505           	btst d2,d5
    1d9e:	0505           	btst d2,d5
    1da0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1da2:	0505           	btst d2,d5
    1da4:	0505           	btst d2,d5
    1da6:	0505           	btst d2,d5
    1da8:	0505           	btst d2,d5
    1daa:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1dac:	0505           	btst d2,d5
    1dae:	0505           	btst d2,d5
    1db0:	0505           	btst d2,d5
    1db2:	0505           	btst d2,d5
    1db4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1db6:	0505           	btst d2,d5
    1db8:	0505           	btst d2,d5
    1dba:	0505           	btst d2,d5
    1dbc:	0505           	btst d2,d5
    1dbe:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1dc0:	0505           	btst d2,d5
    1dc2:	0505           	btst d2,d5
    1dc4:	0505           	btst d2,d5
    1dc6:	0505           	btst d2,d5
    1dc8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1dca:	0505           	btst d2,d5
    1dcc:	0505           	btst d2,d5
    1dce:	0505           	btst d2,d5
    1dd0:	0505           	btst d2,d5
    1dd2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1dd4:	0505           	btst d2,d5
    1dd6:	0505           	btst d2,d5
    1dd8:	0505           	btst d2,d5
    1dda:	0505           	btst d2,d5
    1ddc:	0505           	btst d2,d5

00001dde <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    1dde:	48f9 7fff 0000 	movem.l d0-a6,1ca8 <saveregs>
    1de4:	1ca8 
  lea 0xdff000,a5
    1de6:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddda35>,a5
  move.l sp@(4),a0  //Fontlocation
    1dec:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    1df0:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    1df4:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    1df8:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    1dfa:	082d 0006 0002 	btst #6,2(a5)

00001e00 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    1e00:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    1e06:	66f8           	bne.s 1e00 <st2wblit>

00001e08 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    1e08:	7019           	moveq #25,d0
	sub.l d5,d5      
    1e0a:	9a85           	sub.l d5,d5

00001e0c <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    1e0c:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    1e0e:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    1e10:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    1e14:	9dce           	suba.l a6,a6
	move.l d2, a6
    1e16:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    1e18:	ddfc 0000 1ce4 	adda.l #7396,a6

	LSL  	#4,d2 	    //Fetch next char
    1e1e:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    1e20:	2842           	movea.l d2,a4


	move.l  #0,d4
    1e22:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    1e24:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    1e26:	3814           	move.w (a4),d4
	swap	d4
    1e28:	4844           	swap d4
	lsr.l	d5, d4
    1e2a:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    1e2c:	8993           	or.l d4,(a3)
	clr.l	d4
    1e2e:	4284           	clr.l d4
	move.w  2(a4), d4
    1e30:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    1e34:	4844           	swap d4
	lsr.l	d5, d4
    1e36:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    1e38:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    1e3c:	4284           	clr.l d4
	move.w  4(a4), d4
    1e3e:	382c 0004      	move.w 4(a4),d4
	swap	d4
    1e42:	4844           	swap d4
	lsr.l	d5, d4
    1e44:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    1e46:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    1e4a:	4284           	clr.l d4
	move.w  6(a4), d4
    1e4c:	382c 0006      	move.w 6(a4),d4
	swap	d4
    1e50:	4844           	swap d4
	lsr.l	d5, d4
    1e52:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    1e54:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    1e58:	4284           	clr.l d4
	move.w  8(a4), d4
    1e5a:	382c 0008      	move.w 8(a4),d4
	swap	d4
    1e5e:	4844           	swap d4
	lsr.l	d5, d4
    1e60:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    1e62:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    1e66:	4284           	clr.l d4
	move.w  10(a4), d4
    1e68:	382c 000a      	move.w 10(a4),d4
	swap	d4
    1e6c:	4844           	swap d4
	lsr.l	d5, d4
    1e6e:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    1e70:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    1e74:	4284           	clr.l d4
	move.w  12(a4), d4
    1e76:	382c 000c      	move.w 12(a4),d4
	swap	d4
    1e7a:	4844           	swap d4
	lsr.l	d5, d4
    1e7c:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    1e7e:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    1e82:	4284           	clr.l d4
	move.w  14(a4), d4
    1e84:	382c 000e      	move.w 14(a4),d4
	swap	d4
    1e88:	4844           	swap d4
	lsr.l	d5, d4
    1e8a:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    1e8c:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    1e90:	4284           	clr.l d4

	add.b   (a6), d5
    1e92:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    1e94:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    1e98:	6500 0006      	bcs.w 1ea0 <noadditionalchar>
	addq.w  #1, a3
    1e9c:	524b           	addq.w #1,a3
	sub.w   #8,d5
    1e9e:	5145           	subq.w #8,d5

00001ea0 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    1ea0:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    1ea2:	51c8 ff68      	dbf d0,1e0c <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    1ea6:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    1eaa:	51cb ff5c      	dbf d3,1e08 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    1eae:	4cfa 7fff fdf6 	movem.l 1ca8 <saveregs>(pc),d0-a6

	RTS
    1eb4:	4e75           	rts
