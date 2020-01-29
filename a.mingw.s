
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
      12:	23ce 0000 4d9a 	move.l a6,4d9a <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,4d72 <hw>
      1e:	0000 4d72 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 2667 	lea 2667 <incbin_swfont_end+0xbd>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 4d6e 	move.l d0,4d6e <GfxBase>
	if (!GfxBase)
      34:	6700 0e1a      	beq.w e50 <main+0xe4a>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 4d9a 	movea.l 4d9a <SysBase>,a6
      3e:	43f9 0000 2678 	lea 2678 <incbin_swfont_end+0xce>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 4d8a 	move.l d0,4d8a <DOSBase>
	if (!DOSBase)
      50:	6700 0df2      	beq.w e44 <main+0xe3e>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 2684 	pea 2684 <incbin_swfont_end+0xda>
      5a:	4eb9 0000 0fbc 	jsr fbc <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 26a0 	move.l #9888,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      7e:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
      84:	4eae ffc4      	jsr -60(a6)
      88:	2079 0000 4d72 	movea.l 4d72 <hw>,a0
      8e:	2628 0080      	move.l 128(a0),d3
      92:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
      98:	2200           	move.l d0,d1
      9a:	243c 0000 26b0 	move.l #9904,d2
      a0:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      a4:	47f9 0000 1218 	lea 1218 <ClBuild>,a3
      aa:	4e93           	jsr (a3)
      ac:	2440           	movea.l d0,a2
      ae:	23c0 0000 4d96 	move.l d0,4d96 <Copperlist1>
  DrawCopper = Copperlist1;
      b4:	23c0 0000 4d82 	move.l d0,4d82 <DrawCopper>
  Copperlist2 = ClBuild();
      ba:	4e93           	jsr (a3)
      bc:	23c0 0000 4d92 	move.l d0,4d92 <Copperlist2>
  ViewCopper = Copperlist2;
      c2:	23c0 0000 4d76 	move.l d0,4d76 <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      c8:	588f           	addq.l #4,sp
      ca:	2012           	move.l (a2),d0
      cc:	b0b9 0000 4cd8 	cmp.l 4cd8 <ClsSprites>,d0
      d2:	6600 0c04      	bne.w cd8 <main+0xcd2>
      d6:	206a 0004      	movea.l 4(a2),a0
      da:	b1f9 0000 4cdc 	cmpa.l 4cdc <ClsSprites+0x4>,a0
      e0:	6600 0bf6      	bne.w cd8 <main+0xcd2>
      e4:	202a 0008      	move.l 8(a2),d0
      e8:	b0b9 0000 4ce0 	cmp.l 4ce0 <ClsSprites+0x8>,d0
      ee:	6600 0be8      	bne.w cd8 <main+0xcd2>
      f2:	206a 000c      	movea.l 12(a2),a0
      f6:	b1f9 0000 4ce4 	cmpa.l 4ce4 <ClsSprites+0xc>,a0
      fc:	6600 0bda      	bne.w cd8 <main+0xcd2>
     100:	202a 0010      	move.l 16(a2),d0
     104:	b0b9 0000 4ce8 	cmp.l 4ce8 <ClsSprites+0x10>,d0
     10a:	6600 0bcc      	bne.w cd8 <main+0xcd2>
     10e:	206a 0014      	movea.l 20(a2),a0
     112:	b1f9 0000 4cec 	cmpa.l 4cec <ClsSprites+0x14>,a0
     118:	6600 0bbe      	bne.w cd8 <main+0xcd2>
     11c:	202a 0018      	move.l 24(a2),d0
     120:	b0b9 0000 4cf0 	cmp.l 4cf0 <ClsSprites+0x18>,d0
     126:	6600 0bb0      	bne.w cd8 <main+0xcd2>
     12a:	206a 001c      	movea.l 28(a2),a0
     12e:	b1f9 0000 4cf4 	cmpa.l 4cf4 <ClsSprites+0x1c>,a0
     134:	6600 0ba2      	bne.w cd8 <main+0xcd2>
     138:	202a 0020      	move.l 32(a2),d0
     13c:	b0b9 0000 4cf8 	cmp.l 4cf8 <ClsSprites+0x20>,d0
     142:	6600 0b94      	bne.w cd8 <main+0xcd2>
     146:	206a 0024      	movea.l 36(a2),a0
     14a:	b1f9 0000 4cfc 	cmpa.l 4cfc <ClsSprites+0x24>,a0
     150:	6600 0b86      	bne.w cd8 <main+0xcd2>
     154:	202a 0028      	move.l 40(a2),d0
     158:	b0b9 0000 4d00 	cmp.l 4d00 <ClsSprites+0x28>,d0
     15e:	6600 0b78      	bne.w cd8 <main+0xcd2>
     162:	206a 002c      	movea.l 44(a2),a0
     166:	b1f9 0000 4d04 	cmpa.l 4d04 <ClsSprites+0x2c>,a0
     16c:	6600 0b6a      	bne.w cd8 <main+0xcd2>
     170:	202a 0030      	move.l 48(a2),d0
     174:	b0b9 0000 4d08 	cmp.l 4d08 <ClsSprites+0x30>,d0
     17a:	6600 0b5c      	bne.w cd8 <main+0xcd2>
     17e:	206a 0034      	movea.l 52(a2),a0
     182:	b1f9 0000 4d0c 	cmpa.l 4d0c <ClsSprites+0x34>,a0
     188:	6600 0b4e      	bne.w cd8 <main+0xcd2>
     18c:	202a 0038      	move.l 56(a2),d0
     190:	b0b9 0000 4d10 	cmp.l 4d10 <ClsSprites+0x38>,d0
     196:	6600 0b40      	bne.w cd8 <main+0xcd2>
     19a:	246a 003c      	movea.l 60(a2),a2
     19e:	b5f9 0000 4d14 	cmpa.l 4d14 <ClsSprites+0x3c>,a2
     1a4:	6600 0b32      	bne.w cd8 <main+0xcd2>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1a8:	2079 0000 4d96 	movea.l 4d96 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ae:	2039 0000 4ca8 	move.l 4ca8 <ClScreen>,d0
     1b4:	b0a8 0040      	cmp.l 64(a0),d0
     1b8:	6600 0b40      	bne.w cfa <main+0xcf4>
     1bc:	2039 0000 4cac 	move.l 4cac <ClScreen+0x4>,d0
     1c2:	b0a8 0044      	cmp.l 68(a0),d0
     1c6:	6600 0b32      	bne.w cfa <main+0xcf4>
     1ca:	2039 0000 4cb0 	move.l 4cb0 <ClScreen+0x8>,d0
     1d0:	b0a8 0048      	cmp.l 72(a0),d0
     1d4:	6600 0b24      	bne.w cfa <main+0xcf4>
     1d8:	2039 0000 4cb4 	move.l 4cb4 <ClScreen+0xc>,d0
     1de:	b0a8 004c      	cmp.l 76(a0),d0
     1e2:	6600 0b16      	bne.w cfa <main+0xcf4>
     1e6:	2028 0050      	move.l 80(a0),d0
     1ea:	b0b9 0000 4cb8 	cmp.l 4cb8 <ClScreen+0x10>,d0
     1f0:	6600 0b08      	bne.w cfa <main+0xcf4>
     1f4:	2039 0000 4cbc 	move.l 4cbc <ClScreen+0x14>,d0
     1fa:	b0a8 0054      	cmp.l 84(a0),d0
     1fe:	6600 0afa      	bne.w cfa <main+0xcf4>
     202:	2028 0058      	move.l 88(a0),d0
     206:	b0b9 0000 4cc0 	cmp.l 4cc0 <ClScreen+0x18>,d0
     20c:	6600 0aec      	bne.w cfa <main+0xcf4>
     210:	2028 005c      	move.l 92(a0),d0
     214:	b0b9 0000 4cc4 	cmp.l 4cc4 <ClScreen+0x1c>,d0
     21a:	6600 0ade      	bne.w cfa <main+0xcf4>
     21e:	2028 0060      	move.l 96(a0),d0
     222:	b0b9 0000 4cc8 	cmp.l 4cc8 <ClScreen+0x20>,d0
     228:	6600 0ad0      	bne.w cfa <main+0xcf4>
     22c:	2028 0064      	move.l 100(a0),d0
     230:	b0b9 0000 4ccc 	cmp.l 4ccc <ClScreen+0x24>,d0
     236:	6600 0ac2      	bne.w cfa <main+0xcf4>
     23a:	2028 0068      	move.l 104(a0),d0
     23e:	b0b9 0000 4cd0 	cmp.l 4cd0 <ClScreen+0x28>,d0
     244:	6600 0ab4      	bne.w cfa <main+0xcf4>
     248:	2068 006c      	movea.l 108(a0),a0
     24c:	b1f9 0000 4cd4 	cmpa.l 4cd4 <ClScreen+0x2c>,a0
     252:	6600 0aa6      	bne.w cfa <main+0xcf4>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = 0x40000;
     256:	23fc 0004 0000 	move.l #262144,4d86 <DrawBuffer>
     25c:	0000 4d86 
  ViewBuffer = 0x50000;
     260:	23fc 0005 0000 	move.l #327680,4d7a <ViewBuffer>
     266:	0000 4d7a 
  SetBplPointers();
     26a:	45f9 0000 1948 	lea 1948 <SetBplPointers>,a2
     270:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     272:	0cb9 0005 0000 	cmpi.l #327680,4d86 <DrawBuffer>
     278:	0000 4d86 
     27c:	6700 0b96      	beq.w e14 <main+0xe0e>
    Write( Output(), 
     280:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     286:	4eae ffc4      	jsr -60(a6)
     28a:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     290:	2200           	move.l d0,d1
     292:	243c 0000 26b3 	move.l #9907,d2
     298:	763b           	moveq #59,d3
     29a:	4eae ffd0      	jsr -48(a6)
  int test1 = instructions[pos];
     29e:	2079 0000 4d96 	movea.l 4d96 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2a4:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2aa:	0070 
     2ac:	6724           	beq.s 2d2 <main+0x2cc>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ae:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     2b4:	4eae ffc4      	jsr -60(a6)
     2b8:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     2be:	2200           	move.l d0,d1
     2c0:	243c 0000 26ef 	move.l #9967,d2
     2c6:	763c           	moveq #60,d3
     2c8:	4eae ffd0      	jsr -48(a6)
     2cc:	2079 0000 4d96 	movea.l 4d96 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2d2:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2d8:	0074 
     2da:	6724           	beq.s 300 <main+0x2fa>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2dc:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     2e2:	4eae ffc4      	jsr -60(a6)
     2e6:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     2ec:	2200           	move.l d0,d1
     2ee:	243c 0000 272c 	move.l #10028,d2
     2f4:	763c           	moveq #60,d3
     2f6:	4eae ffd0      	jsr -48(a6)
     2fa:	2079 0000 4d96 	movea.l 4d96 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     300:	2028 0078      	move.l 120(a0),d0
     304:	b0b9 0000 4ca0 	cmp.l 4ca0 <ClColor>,d0
     30a:	6600 0b6e      	bne.w e7a <main+0xe74>
     30e:	2028 007c      	move.l 124(a0),d0
     312:	b0b9 0000 4ca4 	cmp.l 4ca4 <ClColor+0x4>,d0
     318:	6600 0b60      	bne.w e7a <main+0xe74>
  if( instructions[pos] == value ) 
     31c:	70fe           	moveq #-2,d0
     31e:	b0a8 0080      	cmp.l 128(a0),d0
     322:	671e           	beq.s 342 <main+0x33c>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     324:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     32a:	4eae ffc4      	jsr -60(a6)
     32e:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     334:	2200           	move.l d0,d1
     336:	243c 0000 278b 	move.l #10123,d2
     33c:	7622           	moveq #34,d3
     33e:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     342:	47f9 0000 1740 	lea 1740 <SwapCl>,a3
     348:	4e93           	jsr (a3)
  if( DrawCopper != Copperlist2)
     34a:	2079 0000 4d82 	movea.l 4d82 <DrawCopper>,a0
     350:	b1f9 0000 4d92 	cmpa.l 4d92 <Copperlist2>,a0
     356:	671e           	beq.s 376 <main+0x370>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     358:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     35e:	4eae ffc4      	jsr -60(a6)
     362:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     368:	2200           	move.l d0,d1
     36a:	243c 0000 27ae 	move.l #10158,d2
     370:	7615           	moveq #21,d3
     372:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     376:	49f9 0000 1974 	lea 1974 <PrepareDisplay>,a4
     37c:	4e94           	jsr (a4)
  if( DrawBuffer != Bitplane1) 
     37e:	2039 0000 4d86 	move.l 4d86 <DrawBuffer>,d0
     384:	b0b9 0000 4d8e 	cmp.l 4d8e <Bitplane1>,d0
     38a:	671e           	beq.s 3aa <main+0x3a4>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     38c:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     392:	4eae ffc4      	jsr -60(a6)
     396:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     39c:	2200           	move.l d0,d1
     39e:	243c 0000 27c4 	move.l #10180,d2
     3a4:	7637           	moveq #55,d3
     3a6:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3aa:	2079 0000 4d82 	movea.l 4d82 <DrawCopper>,a0
     3b0:	b1f9 0000 4d96 	cmpa.l 4d96 <Copperlist1>,a0
     3b6:	671e           	beq.s 3d6 <main+0x3d0>
    Write( Output(), 
     3b8:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     3be:	4eae ffc4      	jsr -60(a6)
     3c2:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     3c8:	2200           	move.l d0,d1
     3ca:	243c 0000 27fc 	move.l #10236,d2
     3d0:	7639           	moveq #57,d3
     3d2:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3d6:	4e94           	jsr (a4)

  if( ViewBuffer != Bitplane2) 
     3d8:	2039 0000 4d7a 	move.l 4d7a <ViewBuffer>,d0
     3de:	b0b9 0000 4d7e 	cmp.l 4d7e <Bitplane2>,d0
     3e4:	671e           	beq.s 404 <main+0x3fe>
    Write( Output(), 
     3e6:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     3ec:	4eae ffc4      	jsr -60(a6)
     3f0:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     3f6:	2200           	move.l d0,d1
     3f8:	243c 0000 2836 	move.l #10294,d2
     3fe:	7638           	moveq #56,d3
     400:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     404:	2079 0000 4d76 	movea.l 4d76 <ViewCopper>,a0
     40a:	b1f9 0000 4d92 	cmpa.l 4d92 <Copperlist2>,a0
     410:	671e           	beq.s 430 <main+0x42a>
    Write( Output(), 
     412:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     418:	4eae ffc4      	jsr -60(a6)
     41c:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     422:	2200           	move.l d0,d1
     424:	243c 0000 286f 	move.l #10351,d2
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
     434:	2079 0000 4d76 	movea.l 4d76 <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     43a:	7000           	moveq #0,d0
     43c:	3028 0072      	move.w 114(a0),d0
     440:	4840           	swap d0
     442:	4240           	clr.w d0
     444:	7200           	moveq #0,d1
     446:	3228 0076      	move.w 118(a0),d1
     44a:	d081           	add.l d1,d0
  if( pointer != Bitplane2) 
     44c:	b0b9 0000 4d7e 	cmp.l 4d7e <Bitplane2>,d0
     452:	671e           	beq.s 472 <main+0x46c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     454:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     45a:	4eae ffc4      	jsr -60(a6)
     45e:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     464:	2200           	move.l d0,d1
     466:	243c 0000 28aa 	move.l #10410,d2
     46c:	7648           	moveq #72,d3
     46e:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     472:	4e93           	jsr (a3)
  SetBplPointers();
     474:	4e92           	jsr (a2)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = ViewCopper;
     476:	2079 0000 4d76 	movea.l 4d76 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     47c:	7000           	moveq #0,d0
     47e:	3028 0072      	move.w 114(a0),d0
     482:	4840           	swap d0
     484:	4240           	clr.w d0
     486:	7200           	moveq #0,d1
     488:	3228 0076      	move.w 118(a0),d1
     48c:	d081           	add.l d1,d0
  if( pointer != Bitplane1) 
     48e:	b0b9 0000 4d8e 	cmp.l 4d8e <Bitplane1>,d0
     494:	671e           	beq.s 4b4 <main+0x4ae>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     496:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     49c:	4eae ffc4      	jsr -60(a6)
     4a0:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     4a6:	2200           	move.l d0,d1
     4a8:	243c 0000 28f3 	move.l #10483,d2
     4ae:	7649           	moveq #73,d3
     4b0:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4b4:	4e93           	jsr (a3)
  SetBplPointers();
     4b6:	4e92           	jsr (a2)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = ViewCopper;
     4b8:	2079 0000 4d76 	movea.l 4d76 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4be:	7000           	moveq #0,d0
     4c0:	3028 0072      	move.w 114(a0),d0
     4c4:	4840           	swap d0
     4c6:	4240           	clr.w d0
     4c8:	7200           	moveq #0,d1
     4ca:	3228 0076      	move.w 118(a0),d1
     4ce:	d081           	add.l d1,d0
  if( pointer != Bitplane2) 
     4d0:	b0b9 0000 4d7e 	cmp.l 4d7e <Bitplane2>,d0
     4d6:	671e           	beq.s 4f6 <main+0x4f0>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4d8:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     4de:	4eae ffc4      	jsr -60(a6)
     4e2:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     4e8:	2200           	move.l d0,d1
     4ea:	243c 0000 293d 	move.l #10557,d2
     4f0:	7648           	moveq #72,d3
     4f2:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     4f6:	2f3c 0000 c800 	move.l #51200,-(sp)
     4fc:	4878 0084      	pea 84 <main+0x7e>
     500:	4eb9 0000 1ab2 	jsr 1ab2 <FreeDisplay>
  ZoomTestRoutines();
}

void ZoomTestDisplay() {

  PrepareDisplayZoom();
     506:	49f9 0000 1766 	lea 1766 <PrepareDisplayZoom>,a4
     50c:	4e94           	jsr (a4)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     50e:	4878 0010      	pea 10 <main+0xa>
     512:	4879 0000 4cd8 	pea 4cd8 <ClsSprites>
     518:	42a7           	clr.l -(sp)
     51a:	2f39 0000 4d96 	move.l 4d96 <Copperlist1>,-(sp)
     520:	45f9 0000 1042 	lea 1042 <TestCopperlistBatch>,a2
     526:	4e92           	jsr (a2)
     528:	4fef 0018      	lea 24(sp),sp
     52c:	4a80           	tst.l d0
     52e:	661e           	bne.s 54e <main+0x548>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     530:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     536:	4eae ffc4      	jsr -60(a6)
     53a:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     540:	2200           	move.l d0,d1
     542:	243c 0000 2986 	move.l #10630,d2
     548:	762c           	moveq #44,d3
     54a:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
     54e:	4878 000c      	pea c <main+0x6>
     552:	4879 0000 4c70 	pea 4c70 <ClScreenZoom>
     558:	4878 0010      	pea 10 <main+0xa>
     55c:	2f39 0000 4d96 	move.l 4d96 <Copperlist1>,-(sp)
     562:	4e92           	jsr (a2)
     564:	4fef 0010      	lea 16(sp),sp
     568:	4a80           	tst.l d0
     56a:	661e           	bne.s 58a <main+0x584>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     56c:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     572:	4eae ffc4      	jsr -60(a6)
     576:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     57c:	2200           	move.l d0,d1
     57e:	243c 0000 29bc 	move.l #10684,d2
     584:	7636           	moveq #54,d3
     586:	4eae ffd0      	jsr -48(a6)
  return 0;
}

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
  UWORD *copword = (UWORD *) DrawCopper;
     58a:	2079 0000 4d82 	movea.l 4d82 <DrawCopper>,a0
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
     5a6:	23fc 0005 0000 	move.l #327680,4d86 <DrawBuffer>
     5ac:	0000 4d86 
  ViewBuffer = (ULONG *) tmp;
     5b0:	23fc 0004 0000 	move.l #262144,4d7a <ViewBuffer>
     5b6:	0000 4d7a 
  Zoom_SetBplPointers();
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
     5ba:	2f3c 00e0 0004 	move.l #14680068,-(sp)
     5c0:	4878 001c      	pea 1c <main+0x16>
     5c4:	2f39 0000 4d96 	move.l 4d96 <Copperlist1>,-(sp)
     5ca:	47f9 0000 1024 	lea 1024 <TestCopperlistPos>,a3
     5d0:	4e93           	jsr (a3)
     5d2:	4fef 000c      	lea 12(sp),sp
     5d6:	4a80           	tst.l d0
     5d8:	661e           	bne.s 5f8 <main+0x5f2>
    Write(Output(), 
     5da:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     5e0:	4eae ffc4      	jsr -60(a6)
     5e4:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     5ea:	2200           	move.l d0,d1
     5ec:	243c 0000 26ef 	move.l #9967,d2
     5f2:	763c           	moveq #60,d3
     5f4:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
     5f8:	2f3c 00e2 0000 	move.l #14811136,-(sp)
     5fe:	4878 001d      	pea 1d <main+0x17>
     602:	2f39 0000 4d96 	move.l 4d96 <Copperlist1>,-(sp)
     608:	4e93           	jsr (a3)
     60a:	4fef 000c      	lea 12(sp),sp
     60e:	4a80           	tst.l d0
     610:	661e           	bne.s 630 <main+0x62a>
    Write(Output(), 
     612:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     618:	4eae ffc4      	jsr -60(a6)
     61c:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     622:	2200           	move.l d0,d1
     624:	243c 0000 272c 	move.l #10028,d2
     62a:	763c           	moveq #60,d3
     62c:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
     630:	2f3c 00e4 0004 	move.l #14942212,-(sp)
     636:	4878 001e      	pea 1e <main+0x18>
     63a:	2f39 0000 4d96 	move.l 4d96 <Copperlist1>,-(sp)
     640:	4e93           	jsr (a3)
     642:	4fef 000c      	lea 12(sp),sp
     646:	4a80           	tst.l d0
     648:	661e           	bne.s 668 <main+0x662>
    Write(Output(), 
     64a:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     650:	4eae ffc4      	jsr -60(a6)
     654:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     65a:	2200           	move.l d0,d1
     65c:	243c 0000 29f3 	move.l #10739,d2
     662:	763c           	moveq #60,d3
     664:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
     668:	2f3c 00e6 2800 	move.l #15083520,-(sp)
     66e:	4878 001f      	pea 1f <main+0x19>
     672:	2f39 0000 4d96 	move.l 4d96 <Copperlist1>,-(sp)
     678:	4e93           	jsr (a3)
     67a:	4fef 000c      	lea 12(sp),sp
     67e:	4a80           	tst.l d0
     680:	661e           	bne.s 6a0 <main+0x69a>
    Write(Output(), 
     682:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     688:	4eae ffc4      	jsr -60(a6)
     68c:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     692:	2200           	move.l d0,d1
     694:	243c 0000 2a30 	move.l #10800,d2
     69a:	763c           	moveq #60,d3
     69c:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl2pl should be 2800\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
     6a0:	4878 0002      	pea 2 <_start+0x2>
     6a4:	4879 0000 4ca0 	pea 4ca0 <ClColor>
     6aa:	4878 0020      	pea 20 <main+0x1a>
     6ae:	2f39 0000 4d96 	move.l 4d96 <Copperlist1>,-(sp)
     6b4:	4e92           	jsr (a2)
     6b6:	4fef 0010      	lea 16(sp),sp
     6ba:	4a80           	tst.l d0
     6bc:	661e           	bne.s 6dc <main+0x6d6>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     6be:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     6c4:	4eae ffc4      	jsr -60(a6)
     6c8:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     6ce:	2200           	move.l d0,d1
     6d0:	243c 0000 2769 	move.l #10089,d2
     6d6:	7621           	moveq #33,d3
     6d8:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     6dc:	7ec0           	moveq #-64,d7
     6de:	de8d           	add.l a5,d7
     6e0:	4878 0040      	pea 40 <main+0x3a>
     6e4:	4879 0000 2c30 	pea 2c30 <incbin_swfont_end+0x686>
     6ea:	2f07           	move.l d7,-(sp)
     6ec:	4eb9 0000 1b6a 	jsr 1b6a <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
     6f2:	4878 0010      	pea 10 <main+0xa>
     6f6:	2f07           	move.l d7,-(sp)
     6f8:	4878 0022      	pea 22 <main+0x1c>
     6fc:	2f39 0000 4d96 	move.l 4d96 <Copperlist1>,-(sp)
     702:	4e92           	jsr (a2)
     704:	4fef 001c      	lea 28(sp),sp
     708:	4a80           	tst.l d0
     70a:	661e           	bne.s 72a <main+0x724>
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);
     70c:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     712:	4eae ffc4      	jsr -60(a6)
     716:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     71c:	2200           	move.l d0,d1
     71e:	243c 0000 2a6d 	move.l #10861,d2
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
     74e:	2f39 0000 4d96 	move.l 4d96 <Copperlist1>,-(sp)
     754:	4e92           	jsr (a2)
     756:	4fef 0010      	lea 16(sp),sp
     75a:	4a80           	tst.l d0
     75c:	661e           	bne.s 77c <main+0x776>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     75e:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     764:	4eae ffc4      	jsr -60(a6)
     768:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     76e:	2200           	move.l d0,d1
     770:	243c 0000 2a8f 	move.l #10895,d2
     776:	762c           	moveq #44,d3
     778:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
     77c:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffde69e>
     780:	4878 2922      	pea 2922 <incbin_swfont_end+0x378>
     784:	2f39 0000 4d96 	move.l 4d96 <Copperlist1>,-(sp)
     78a:	4e93           	jsr (a3)
     78c:	4fef 000c      	lea 12(sp),sp
     790:	4a80           	tst.l d0
     792:	6700 05d4      	beq.w d68 <main+0xd62>
    Write( Output(), "Copperlist End not correctly set.\n", 34);

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     796:	2f3c 0001 2c00 	move.l #76800,-(sp)
     79c:	2f3c 0000 a48c 	move.l #42124,-(sp)
     7a2:	4eb9 0000 1ab2 	jsr 1ab2 <FreeDisplay>

}

void ZoomTestRoutines() {

  PrepareDisplayZoom();
     7a8:	4e94           	jsr (a4)

  UWORD *destination = (UWORD *)DrawBuffer;
     7aa:	2079 0000 4d86 	movea.l 4d86 <DrawBuffer>,a0
  *destination= 0x0000;
     7b0:	4250           	clr.w (a0)
  destination += 20;
  *destination= 0x000f;
     7b2:	317c 000f 0028 	move.w #15,40(a0)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     7b8:	317c 000f 3bd8 	move.w #15,15320(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     7be:	2c79 0000 4d9a 	movea.l 4d9a <SysBase>,a6
     7c4:	203c 0000 c800 	move.l #51200,d0
     7ca:	7202           	moveq #2,d1
     7cc:	4eae ff3a      	jsr -198(a6)
     7d0:	2840           	movea.l d0,a4
     7d2:	23c0 0000 4d58 	move.l d0,4d58 <Zoom_Source>
  if( Zoom_Source == 0) {
     7d8:	508f           	addq.l #8,sp
     7da:	6700 05f2      	beq.w dce <main+0xdc8>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }

  UWORD *tstsource = Zoom_Source;
  *tstsource = 0xffff;
     7de:	38bc ffff      	move.w #-1,(a4)
  tstsource += 20;
  *tstsource = 0xffff;
     7e2:	397c ffff 0028 	move.w #-1,40(a4)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0xc000;
     7e8:	397c c000 3bd8 	move.w #-16384,15320(a4)
  Zoom_CopyColumn( Zoom_Source, (UWORD *)DrawBuffer, 1, 1);
     7ee:	2439 0000 4d86 	move.l 4d86 <DrawBuffer>,d2
  WaitBlit();
     7f4:	2c79 0000 4d6e 	movea.l 4d6e <GfxBase>,a6
     7fa:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     7fe:	2079 0000 4d72 	movea.l 4d72 <hw>,a0
     804:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4;
     80a:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltafwm = 0xffff;
     810:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     816:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 2;
     81c:	317c 0026 0064 	move.w #38,100(a0)
  hw->bltbmod = ZMLINESIZE - 2;
     822:	317c 0026 0062 	move.w #38,98(a0)
  hw->bltdmod = ZMLINESIZE - 2;
     828:	317c 0026 0066 	move.w #38,102(a0)
  hw->bltcdat = bltmask;
     82e:	317c 4000 0070 	move.w #16384,112(a0)
  hw->bltapt = (UWORD *) sourcepos;
     834:	214c 0050      	move.l a4,80(a0)
  hw->bltbpt = (UWORD *) destpos;
     838:	2142 004c      	move.l d2,76(a0)
  hw->bltdpt = (UWORD *) destpos;
     83c:	2142 0054      	move.l d2,84(a0)
  hw->bltsize = ZMCOLHEIGHT*64+1;
     840:	317c 6001 0058 	move.w #24577,88(a0)
  
  WaitBlit();
     846:	2c79 0000 4d6e 	movea.l 4d6e <GfxBase>,a6
     84c:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     850:	2879 0000 4d86 	movea.l 4d86 <DrawBuffer>,a4
  if( *destination != 0x4000)
     856:	0c54 4000      	cmpi.w #16384,(a4)
     85a:	671e           	beq.s 87a <main+0x874>
    Write(  Output(), "Zoomtest: CopyColumn2 - First row wrong.\n",41);
     85c:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     862:	4eae ffc4      	jsr -60(a6)
     866:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     86c:	2200           	move.l d0,d1
     86e:	243c 0000 2af4 	move.l #10996,d2
     874:	7629           	moveq #41,d3
     876:	4eae ffd0      	jsr -48(a6)

  destination+= 20;
  if( *destination != 0x400f)
     87a:	0c6c 400f 0028 	cmpi.w #16399,40(a4)
     880:	671e           	beq.s 8a0 <main+0x89a>
    Write(  Output(), "Zoomtest: CopyColumn2 - Second row wrong.\n",42);
     882:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     888:	4eae ffc4      	jsr -60(a6)
     88c:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     892:	2200           	move.l d0,d1
     894:	243c 0000 2b1e 	move.l #11038,d2
     89a:	762a           	moveq #42,d3
     89c:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x400f)
     8a0:	2879 0000 4d86 	movea.l 4d86 <DrawBuffer>,a4
     8a6:	0c6c 400f 3bd8 	cmpi.w #16399,15320(a4)
     8ac:	6724           	beq.s 8d2 <main+0x8cc>
    Write(  Output(), "Zoomtest: CopyColumn2 - Last row wrong.\n",40);
     8ae:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     8b4:	4eae ffc4      	jsr -60(a6)
     8b8:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     8be:	2200           	move.l d0,d1
     8c0:	243c 0000 2b49 	move.l #11081,d2
     8c6:	7628           	moveq #40,d3
     8c8:	4eae ffd0      	jsr -48(a6)
     8cc:	2879 0000 4d86 	movea.l 4d86 <DrawBuffer>,a4

  destination = DrawBuffer;
  *destination= 0x0000;
     8d2:	4254           	clr.w (a4)
  destination += 20;
  *destination= 0x000f;
     8d4:	397c 000f 0028 	move.w #15,40(a4)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     8da:	397c 000f 3bd8 	move.w #15,15320(a4)

  tstsource = Zoom_Source;
     8e0:	2439 0000 4d58 	move.l 4d58 <Zoom_Source>,d2
  *tstsource = 0xffff;
     8e6:	2042           	movea.l d2,a0
     8e8:	30bc ffff      	move.w #-1,(a0)
  tstsource += 20;
  *tstsource = 0xffff;
     8ec:	317c ffff 0028 	move.w #-1,40(a0)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0x8000;
     8f2:	317c 8000 3bd8 	move.w #-32768,15320(a0)
  WaitBlit();
     8f8:	2c79 0000 4d6e 	movea.l 4d6e <GfxBase>,a6
     8fe:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     902:	2079 0000 4d72 	movea.l 4d72 <hw>,a0
     908:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4;
     90e:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltafwm = 0xffff;
     914:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     91a:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 2;
     920:	317c 0026 0064 	move.w #38,100(a0)
  hw->bltbmod = ZMLINESIZE - 2;
     926:	317c 0026 0062 	move.w #38,98(a0)
  hw->bltdmod = ZMLINESIZE - 2;
     92c:	317c 0026 0066 	move.w #38,102(a0)
  hw->bltcdat = bltmask;
     932:	317c 8000 0070 	move.w #-32768,112(a0)
  hw->bltapt = (UWORD *) sourcepos;
     938:	2142 0050      	move.l d2,80(a0)
  hw->bltbpt = (UWORD *) destpos;
     93c:	214c 004c      	move.l a4,76(a0)
  hw->bltdpt = (UWORD *) destpos;
     940:	214c 0054      	move.l a4,84(a0)
  hw->bltsize = ZMCOLHEIGHT*64+1;
     944:	317c 6001 0058 	move.w #24577,88(a0)
  Zoom_CopyColumn( Zoom_Source, (UWORD *)DrawBuffer, 0, 0);
  
  WaitBlit();
     94a:	2c79 0000 4d6e 	movea.l 4d6e <GfxBase>,a6
     950:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     954:	2879 0000 4d86 	movea.l 4d86 <DrawBuffer>,a4
  if( *destination != 0x8000)
     95a:	0c54 8000      	cmpi.w #-32768,(a4)
     95e:	671e           	beq.s 97e <main+0x978>
    Write(  Output(), "Zoomtest: CopyColumn - First row wrong.\n",40);
     960:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     966:	4eae ffc4      	jsr -60(a6)
     96a:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     970:	2200           	move.l d0,d1
     972:	243c 0000 2b72 	move.l #11122,d2
     978:	7628           	moveq #40,d3
     97a:	4eae ffd0      	jsr -48(a6)

  destination+= 20;
  if( *destination != 0x800f)
     97e:	0c6c 800f 0028 	cmpi.w #-32753,40(a4)
     984:	671e           	beq.s 9a4 <main+0x99e>
    Write(  Output(), "Zoomtest: CopyColumn - Second row wrong.\n",41);
     986:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     98c:	4eae ffc4      	jsr -60(a6)
     990:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     996:	2200           	move.l d0,d1
     998:	243c 0000 2b9b 	move.l #11163,d2
     99e:	7629           	moveq #41,d3
     9a0:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x800f)
     9a4:	2079 0000 4d86 	movea.l 4d86 <DrawBuffer>,a0
     9aa:	0c68 800f 3bd8 	cmpi.w #-32753,15320(a0)
     9b0:	671e           	beq.s 9d0 <main+0x9ca>
    Write(  Output(), "Zoomtest: CopyColumn - Last row wrong.\n",39);
     9b2:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     9b8:	4eae ffc4      	jsr -60(a6)
     9bc:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     9c2:	2200           	move.l d0,d1
     9c4:	243c 0000 2bc5 	move.l #11205,d2
     9ca:	7627           	moveq #39,d3
     9cc:	4eae ffd0      	jsr -48(a6)


  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     9d0:	2f3c 0001 2c00 	move.l #76800,-(sp)
     9d6:	2f3c 0000 a48c 	move.l #42124,-(sp)
     9dc:	4eb9 0000 1ab2 	jsr 1ab2 <FreeDisplay>
     9e2:	508f           	addq.l #8,sp
char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
  PrepareDisplaySW();
     9e4:	4eb9 0000 1974 	jsr 1974 <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     9ea:	4878 0010      	pea 10 <main+0xa>
     9ee:	4879 0000 4cd8 	pea 4cd8 <ClsSprites>
     9f4:	42a7           	clr.l -(sp)
     9f6:	2f39 0000 4d96 	move.l 4d96 <Copperlist1>,-(sp)
     9fc:	4e92           	jsr (a2)
     9fe:	4fef 0010      	lea 16(sp),sp
     a02:	4a80           	tst.l d0
     a04:	661e           	bne.s a24 <main+0xa1e>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     a06:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     a0c:	4eae ffc4      	jsr -60(a6)
     a10:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     a16:	2200           	move.l d0,d1
     a18:	243c 0000 2986 	move.l #10630,d2
     a1e:	762c           	moveq #44,d3
     a20:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     a24:	4878 000c      	pea c <main+0x6>
     a28:	4879 0000 4ca8 	pea 4ca8 <ClScreen>
     a2e:	4878 0010      	pea 10 <main+0xa>
     a32:	2f39 0000 4d96 	move.l 4d96 <Copperlist1>,-(sp)
     a38:	4e92           	jsr (a2)
     a3a:	4fef 0010      	lea 16(sp),sp
     a3e:	4a80           	tst.l d0
     a40:	661e           	bne.s a60 <main+0xa5a>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     a42:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     a48:	4eae ffc4      	jsr -60(a6)
     a4c:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     a52:	2200           	move.l d0,d1
     a54:	243c 0000 29bc 	move.l #10684,d2
     a5a:	7636           	moveq #54,d3
     a5c:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
     a60:	4878 0002      	pea 2 <_start+0x2>
     a64:	4879 0000 4ca0 	pea 4ca0 <ClColor>
     a6a:	4878 001e      	pea 1e <main+0x18>
     a6e:	2f39 0000 4d96 	move.l 4d96 <Copperlist1>,-(sp)
     a74:	4e92           	jsr (a2)
     a76:	4fef 0010      	lea 16(sp),sp
     a7a:	4a80           	tst.l d0
     a7c:	661e           	bne.s a9c <main+0xa96>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     a7e:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     a84:	4eae ffc4      	jsr -60(a6)
     a88:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     a8e:	2200           	move.l d0,d1
     a90:	243c 0000 2769 	move.l #10089,d2
     a96:	7621           	moveq #33,d3
     a98:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
     a9c:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffde69e>
     aa0:	4878 0020      	pea 20 <main+0x1a>
     aa4:	2f39 0000 4d96 	move.l 4d96 <Copperlist1>,-(sp)
     aaa:	4e93           	jsr (a3)
     aac:	4fef 000c      	lea 12(sp),sp
     ab0:	4a80           	tst.l d0
     ab2:	6700 0292      	beq.w d46 <main+0xd40>
    Write( Output(), "Copperlist End not correctly set.\n", 34);

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
     ab6:	2479 0000 4d86 	movea.l 4d86 <DrawBuffer>,a2
     abc:	4879 0000 2bed 	pea 2bed <incbin_swfont_end+0x643>
     ac2:	2f0a           	move.l a2,-(sp)
     ac4:	4eb9 0000 0ecc 	jsr ecc <WriteFont.constprop.0>

  UWORD *tstpointer = DrawBuffer;
  if( *tstpointer != 0xff00)
     aca:	508f           	addq.l #8,sp
     acc:	0c52 ff00      	cmpi.w #-256,(a2)
     ad0:	671e           	beq.s af0 <main+0xaea>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
     ad2:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     ad8:	4eae ffc4      	jsr -60(a6)
     adc:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     ae2:	2200           	move.l d0,d1
     ae4:	243c 0000 2bfe 	move.l #11262,d2
     aea:	7631           	moveq #49,d3
     aec:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
     af0:	2f3c 0000 c800 	move.l #51200,-(sp)
     af6:	4878 0084      	pea 84 <main+0x7e>
     afa:	4eb9 0000 1ab2 	jsr 1ab2 <FreeDisplay>
  RunTests();
	Delay(50);
     b00:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     b06:	7232           	moveq #50,d1
     b08:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
     b0c:	247c 00f0 ff60 	movea.l #15794016,a2
     b12:	508f           	addq.l #8,sp
     b14:	4a92           	tst.l (a2)
     b16:	6718           	beq.s b30 <main+0xb2a>
     b18:	4878 0001      	pea 1 <_start+0x1>
     b1c:	47f9 0000 0f1a 	lea f1a <warpmode.part.0>,a3
     b22:	4e93           	jsr (a3)
     b24:	588f           	addq.l #4,sp
     b26:	4a92           	tst.l (a2)
     b28:	6706           	beq.s b30 <main+0xb2a>
     b2a:	42a7           	clr.l -(sp)
     b2c:	4e93           	jsr (a3)
     b2e:	588f           	addq.l #4,sp
  ViewCopper = tmp;
  hw->cop1lc = ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
     b30:	2c79 0000 4d6e 	movea.l 4d6e <GfxBase>,a6
     b36:	23ee 0022 0000 	move.l 34(a6),4d5c <ActiView>
     b3c:	4d5c 
	OwnBlitter();
     b3e:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     b42:	2c79 0000 4d6e 	movea.l 4d6e <GfxBase>,a6
     b48:	4eae ff1c      	jsr -228(a6)
	Disable();
     b4c:	2c79 0000 4d9a 	movea.l 4d9a <SysBase>,a6
     b52:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
     b56:	2679 0000 4d72 	movea.l 4d72 <hw>,a3
     b5c:	302b 0010      	move.w 16(a3),d0
     b60:	33c0 0000 4d60 	move.w d0,4d60 <SystemADKCON>
	SystemInts=hw->intenar;
     b66:	302b 001c      	move.w 28(a3),d0
     b6a:	33c0 0000 4d64 	move.w d0,4d64 <SystemInts>
	SystemDMA=hw->dmaconr;
     b70:	302b 0002      	move.w 2(a3),d0
     b74:	33c0 0000 4d62 	move.w d0,4d62 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
     b7a:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     b80:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
     b86:	45f9 0000 1b24 	lea 1b24 <WaitVbl>,a2
     b8c:	4e92           	jsr (a2)
	WaitVbl();
     b8e:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
     b90:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
     b96:	2c79 0000 4d6e 	movea.l 4d6e <GfxBase>,a6
     b9c:	93c9           	suba.l a1,a1
     b9e:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     ba2:	2c79 0000 4d6e 	movea.l 4d6e <GfxBase>,a6
     ba8:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     bac:	2c79 0000 4d6e 	movea.l 4d6e <GfxBase>,a6
     bb2:	4eae fef2      	jsr -270(a6)

	WaitVbl();
     bb6:	4e92           	jsr (a2)
	WaitVbl();
     bb8:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     bba:	3b7c 4e7a ffc0 	move.w #20090,-64(a5)
     bc0:	3b7c 0801 ffc2 	move.w #2049,-62(a5)
     bc6:	3b7c 4e73 ffc4 	move.w #20083,-60(a5)
	if (SysBase->AttnFlags & AFF_68010) 
     bcc:	2c79 0000 4d9a 	movea.l 4d9a <SysBase>,a6
     bd2:	082e 0000 0129 	btst #0,297(a6)
     bd8:	6700 02c8      	beq.w ea2 <main+0xe9c>
		vbr = (APTR)Supervisor((void*)getvbr);
     bdc:	cf8d           	exg d7,a5
     bde:	4eae ffe2      	jsr -30(a6)
     be2:	cf8d           	exg d7,a5

	VBR=GetVBR();
     be4:	23c0 0000 4d66 	move.l d0,4d66 <VBR.lto_priv.1>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     bea:	2079 0000 4d66 	movea.l 4d66 <VBR.lto_priv.1>,a0
     bf0:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
     bf4:	23c2 0000 4d6a 	move.l d2,4d6a <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
     bfa:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
     bfc:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     bfe:	2079 0000 4d72 	movea.l 4d72 <hw>,a0
     c04:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     c08:	3028 0002      	move.w 2(a0),d0
     c0c:	0800 000e      	btst #14,d0
     c10:	66f6           	bne.s c08 <main+0xc02>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
     c12:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     c18:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
     c1e:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     c24:	2279 0000 4d66 	movea.l 4d66 <VBR.lto_priv.1>,a1
     c2a:	2342 006c      	move.l d2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
     c2e:	2c79 0000 4d6e 	movea.l 4d6e <GfxBase>,a6
     c34:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
     c3a:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
     c40:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
     c46:	3039 0000 4d64 	move.w 4d64 <SystemInts>,d0
     c4c:	0040 8000      	ori.w #-32768,d0
     c50:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
     c54:	3039 0000 4d62 	move.w 4d62 <SystemDMA>,d0
     c5a:	0040 8000      	ori.w #-32768,d0
     c5e:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
     c62:	3039 0000 4d60 	move.w 4d60 <SystemADKCON>,d0
     c68:	0040 8000      	ori.w #-32768,d0
     c6c:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
     c70:	2279 0000 4d5c 	movea.l 4d5c <ActiView>,a1
     c76:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     c7a:	2c79 0000 4d6e 	movea.l 4d6e <GfxBase>,a6
     c80:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     c84:	2c79 0000 4d6e 	movea.l 4d6e <GfxBase>,a6
     c8a:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     c8e:	2c79 0000 4d6e 	movea.l 4d6e <GfxBase>,a6
     c94:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     c98:	2c79 0000 4d6e 	movea.l 4d6e <GfxBase>,a6
     c9e:	4eae fe32      	jsr -462(a6)
	Enable();
     ca2:	2c79 0000 4d9a 	movea.l 4d9a <SysBase>,a6
     ca8:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
     cac:	2c79 0000 4d9a 	movea.l 4d9a <SysBase>,a6
     cb2:	2279 0000 4d8a 	movea.l 4d8a <DOSBase>,a1
     cb8:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     cbc:	2c79 0000 4d9a 	movea.l 4d9a <SysBase>,a6
     cc2:	2279 0000 4d6e 	movea.l 4d6e <GfxBase>,a1
     cc8:	4eae fe62      	jsr -414(a6)
}
     ccc:	7000           	moveq #0,d0
     cce:	4ced 5c8c ff98 	movem.l -104(a5),d2-d3/d7/a2-a4/a6
     cd4:	4e5d           	unlk a5
     cd6:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     cd8:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     cde:	4eae ffc4      	jsr -60(a6)
     ce2:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     ce8:	2200           	move.l d0,d1
     cea:	243c 0000 2986 	move.l #10630,d2
     cf0:	762c           	moveq #44,d3
     cf2:	4eae ffd0      	jsr -48(a6)
     cf6:	6000 f4b0      	bra.w 1a8 <main+0x1a2>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
     cfa:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     d00:	4eae ffc4      	jsr -60(a6)
     d04:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     d0a:	2200           	move.l d0,d1
     d0c:	243c 0000 29bc 	move.l #10684,d2
     d12:	7636           	moveq #54,d3
     d14:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = 0x40000;
     d18:	23fc 0004 0000 	move.l #262144,4d86 <DrawBuffer>
     d1e:	0000 4d86 
  ViewBuffer = 0x50000;
     d22:	23fc 0005 0000 	move.l #327680,4d7a <ViewBuffer>
     d28:	0000 4d7a 
  SetBplPointers();
     d2c:	45f9 0000 1948 	lea 1948 <SetBplPointers>,a2
     d32:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     d34:	0cb9 0005 0000 	cmpi.l #327680,4d86 <DrawBuffer>
     d3a:	0000 4d86 
     d3e:	6600 f540      	bne.w 280 <main+0x27a>
     d42:	6000 00d0      	bra.w e14 <main+0xe0e>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     d46:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     d4c:	4eae ffc4      	jsr -60(a6)
     d50:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     d56:	2200           	move.l d0,d1
     d58:	243c 0000 278b 	move.l #10123,d2
     d5e:	7622           	moveq #34,d3
     d60:	4eae ffd0      	jsr -48(a6)
     d64:	6000 fd50      	bra.w ab6 <main+0xab0>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     d68:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     d6e:	4eae ffc4      	jsr -60(a6)
     d72:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     d78:	2200           	move.l d0,d1
     d7a:	243c 0000 278b 	move.l #10123,d2
     d80:	7622           	moveq #34,d3
     d82:	4eae ffd0      	jsr -48(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     d86:	2f3c 0001 2c00 	move.l #76800,-(sp)
     d8c:	2f3c 0000 a48c 	move.l #42124,-(sp)
     d92:	4eb9 0000 1ab2 	jsr 1ab2 <FreeDisplay>
  PrepareDisplayZoom();
     d98:	4e94           	jsr (a4)
  UWORD *destination = (UWORD *)DrawBuffer;
     d9a:	2079 0000 4d86 	movea.l 4d86 <DrawBuffer>,a0
  *destination= 0x0000;
     da0:	4250           	clr.w (a0)
  *destination= 0x000f;
     da2:	317c 000f 0028 	move.w #15,40(a0)
  *destination = 0x000f;
     da8:	317c 000f 3bd8 	move.w #15,15320(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     dae:	2c79 0000 4d9a 	movea.l 4d9a <SysBase>,a6
     db4:	203c 0000 c800 	move.l #51200,d0
     dba:	7202           	moveq #2,d1
     dbc:	4eae ff3a      	jsr -198(a6)
     dc0:	2840           	movea.l d0,a4
     dc2:	23c0 0000 4d58 	move.l d0,4d58 <Zoom_Source>
  if( Zoom_Source == 0) {
     dc8:	508f           	addq.l #8,sp
     dca:	6600 fa12      	bne.w 7de <main+0x7d8>
    Write(  Output(), 
     dce:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     dd4:	4eae ffc4      	jsr -60(a6)
     dd8:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     dde:	2200           	move.l d0,d1
     de0:	243c 0000 2abc 	move.l #10940,d2
     de6:	7636           	moveq #54,d3
     de8:	4eae ffd0      	jsr -48(a6)
  PrepareDisplaySW();
     dec:	4eb9 0000 1974 	jsr 1974 <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     df2:	4878 0010      	pea 10 <main+0xa>
     df6:	4879 0000 4cd8 	pea 4cd8 <ClsSprites>
     dfc:	42a7           	clr.l -(sp)
     dfe:	2f39 0000 4d96 	move.l 4d96 <Copperlist1>,-(sp)
     e04:	4e92           	jsr (a2)
     e06:	4fef 0010      	lea 16(sp),sp
     e0a:	4a80           	tst.l d0
     e0c:	6600 fc16      	bne.w a24 <main+0xa1e>
     e10:	6000 fbf4      	bra.w a06 <main+0xa00>
     e14:	0cb9 0004 0000 	cmpi.l #262144,4d7a <ViewBuffer>
     e1a:	0000 4d7a 
     e1e:	6700 f47e      	beq.w 29e <main+0x298>
    Write( Output(), 
     e22:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     e28:	4eae ffc4      	jsr -60(a6)
     e2c:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     e32:	2200           	move.l d0,d1
     e34:	243c 0000 26b3 	move.l #9907,d2
     e3a:	763b           	moveq #59,d3
     e3c:	4eae ffd0      	jsr -48(a6)
     e40:	6000 f45c      	bra.w 29e <main+0x298>
		Exit(0);
     e44:	9dce           	suba.l a6,a6
     e46:	7200           	moveq #0,d1
     e48:	4eae ff70      	jsr -144(a6)
     e4c:	6000 f206      	bra.w 54 <main+0x4e>
		Exit(0);
     e50:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     e56:	7200           	moveq #0,d1
     e58:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     e5c:	2c79 0000 4d9a 	movea.l 4d9a <SysBase>,a6
     e62:	43f9 0000 2678 	lea 2678 <incbin_swfont_end+0xce>,a1
     e68:	7000           	moveq #0,d0
     e6a:	4eae fdd8      	jsr -552(a6)
     e6e:	23c0 0000 4d8a 	move.l d0,4d8a <DOSBase>
	if (!DOSBase)
     e74:	6600 f1de      	bne.w 54 <main+0x4e>
     e78:	60ca           	bra.s e44 <main+0xe3e>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     e7a:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     e80:	4eae ffc4      	jsr -60(a6)
     e84:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
     e8a:	2200           	move.l d0,d1
     e8c:	243c 0000 2769 	move.l #10089,d2
     e92:	7621           	moveq #33,d3
     e94:	4eae ffd0      	jsr -48(a6)
     e98:	2079 0000 4d96 	movea.l 4d96 <Copperlist1>,a0
     e9e:	6000 f47c      	bra.w 31c <main+0x316>
	APTR vbr = 0;
     ea2:	7000           	moveq #0,d0
	VBR=GetVBR();
     ea4:	23c0 0000 4d66 	move.l d0,4d66 <VBR.lto_priv.1>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     eaa:	2079 0000 4d66 	movea.l 4d66 <VBR.lto_priv.1>,a0
     eb0:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
     eb4:	23c2 0000 4d6a 	move.l d2,4d6a <SystemIrq>
	WaitVbl();
     eba:	4e92           	jsr (a2)
	WaitVbl();
     ebc:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     ebe:	2079 0000 4d72 	movea.l 4d72 <hw>,a0
     ec4:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     ec8:	6000 fd3e      	bra.w c08 <main+0xc02>

00000ecc <WriteFont.constprop.0>:
  *cl = 0xfffffffe;

  return retval;
}

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
     ecc:	226f 0004      	movea.l 4(sp),a1
  UWORD *bmpptr = Destination;
  UWORD *fntptr = font;

  char charpos = *text;
  charpos -= 0x20;
     ed0:	206f 0008      	movea.l 8(sp),a0
     ed4:	1010           	move.b (a0),d0
     ed6:	0600 ffe0      	addi.b #-32,d0
  charpos = charpos<<3;
     eda:	4880           	ext.w d0
     edc:	48c0           	ext.l d0
     ede:	e788           	lsl.l #3,d0
  fntptr += charpos;
     ee0:	4880           	ext.w d0
     ee2:	3040           	movea.w d0,a0
     ee4:	d1c8           	adda.l a0,a0
     ee6:	d1fc 0000 4d18 	adda.l #19736,a0
  for(int i=1;i<=8;i++) {
    *bmpptr = *fntptr++;
     eec:	3290           	move.w (a0),(a1)
     eee:	3368 0002 0050 	move.w 2(a0),80(a1)
     ef4:	3368 0004 00a0 	move.w 4(a0),160(a1)
     efa:	3368 0006 00f0 	move.w 6(a0),240(a1)
     f00:	3368 0008 0140 	move.w 8(a0),320(a1)
     f06:	3368 000a 0190 	move.w 10(a0),400(a1)
     f0c:	3368 000c 01e0 	move.w 12(a0),480(a1)
     f12:	3368 000e 0230 	move.w 14(a0),560(a1)
    bmpptr += 40;
  }

}
     f18:	4e75           	rts

00000f1a <warpmode.part.0>:
void warpmode(int on) 
     f1a:	598f           	subq.l #4,sp
     f1c:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     f1e:	4aaf 000c      	tst.l 12(sp)
     f22:	674c           	beq.s f70 <warpmode.part.0+0x56>
     f24:	4878 0001      	pea 1 <_start+0x1>
     f28:	740b           	moveq #11,d2
     f2a:	d48f           	add.l sp,d2
     f2c:	2f02           	move.l d2,-(sp)
     f2e:	42a7           	clr.l -(sp)
     f30:	4879 0000 25de 	pea 25de <incbin_swfont_end+0x34>
     f36:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffde69f>
     f3a:	4878 0052      	pea 52 <main+0x4c>
     f3e:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeee600>
     f44:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     f48:	203c 0000 25c4 	move.l #9668,d0
     f4e:	4878 0001      	pea 1 <_start+0x1>
     f52:	2f02           	move.l d2,-(sp)
     f54:	42a7           	clr.l -(sp)
     f56:	2f00           	move.l d0,-(sp)
     f58:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffde69f>
     f5c:	4878 0052      	pea 52 <main+0x4c>
     f60:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeee600>
	}
}
     f66:	4fef 0018      	lea 24(sp),sp
     f6a:	241f           	move.l (sp)+,d2
     f6c:	588f           	addq.l #4,sp
     f6e:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     f70:	4878 0001      	pea 1 <_start+0x1>
     f74:	740b           	moveq #11,d2
     f76:	d48f           	add.l sp,d2
     f78:	2f02           	move.l d2,-(sp)
     f7a:	42a7           	clr.l -(sp)
     f7c:	4879 0000 25e8 	pea 25e8 <incbin_swfont_end+0x3e>
     f82:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffde69f>
     f86:	4878 0052      	pea 52 <main+0x4c>
     f8a:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeee600>
     f90:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     f94:	203c 0000 25ab 	move.l #9643,d0
     f9a:	4878 0001      	pea 1 <_start+0x1>
     f9e:	2f02           	move.l d2,-(sp)
     fa0:	42a7           	clr.l -(sp)
     fa2:	2f00           	move.l d0,-(sp)
     fa4:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffde69f>
     fa8:	4878 0052      	pea 52 <main+0x4c>
     fac:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeee600>
}
     fb2:	4fef 0018      	lea 24(sp),sp
     fb6:	241f           	move.l (sp)+,d2
     fb8:	588f           	addq.l #4,sp
     fba:	4e75           	rts

00000fbc <KPrintF>:
{
     fbc:	4fef ff80      	lea -128(sp),sp
     fc0:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
     fc4:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeee600>
     fca:	6734           	beq.s 1000 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
     fcc:	2c79 0000 4d9a 	movea.l 4d9a <SysBase>,a6
     fd2:	206f 0090      	movea.l 144(sp),a0
     fd6:	43ef 0094      	lea 148(sp),a1
     fda:	45f9 0000 1de8 	lea 1de8 <PutChar>,a2
     fe0:	47ef 000c      	lea 12(sp),a3
     fe4:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
     fe8:	2f0b           	move.l a3,-(sp)
     fea:	4878 0056      	pea 56 <main+0x50>
     fee:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeee600>
     ff4:	508f           	addq.l #8,sp
}
     ff6:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     ffa:	4fef 0080      	lea 128(sp),sp
     ffe:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
    1000:	2c79 0000 4d9a 	movea.l 4d9a <SysBase>,a6
    1006:	206f 0090      	movea.l 144(sp),a0
    100a:	43ef 0094      	lea 148(sp),a1
    100e:	45f9 0000 1dda 	lea 1dda <KPutCharX>,a2
    1014:	97cb           	suba.l a3,a3
    1016:	4eae fdf6      	jsr -522(a6)
}
    101a:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    101e:	4fef 0080      	lea 128(sp),sp
    1022:	4e75           	rts

00001024 <TestCopperlistPos>:
  int test1 = instructions[pos];
    1024:	202f 0008      	move.l 8(sp),d0
    1028:	d080           	add.l d0,d0
    102a:	d080           	add.l d0,d0
  if( instructions[pos] == value ) 
    102c:	206f 0004      	movea.l 4(sp),a0
    1030:	2030 0800      	move.l (0,a0,d0.l),d0
    1034:	b0af 000c      	cmp.l 12(sp),d0
    1038:	57c0           	seq d0
    103a:	4880           	ext.w d0
    103c:	48c0           	ext.l d0
}
    103e:	4480           	neg.l d0
    1040:	4e75           	rts

00001042 <TestCopperlistBatch>:
                                                                  long length) {
    1042:	48e7 2030      	movem.l d2/a2-a3,-(sp)
    1046:	246f 0010      	movea.l 16(sp),a2
    104a:	206f 0014      	movea.l 20(sp),a0
    104e:	226f 0018      	movea.l 24(sp),a1
    1052:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
    1056:	2008           	move.l a0,d0
    1058:	d088           	add.l a0,d0
    105a:	d080           	add.l d0,d0
    105c:	2411           	move.l (a1),d2
    105e:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
    1062:	6600 01ac      	bne.w 1210 <TestCopperlistBatch+0x1ce>
    1066:	2008           	move.l a0,d0
    1068:	5280           	addq.l #1,d0
    106a:	d080           	add.l d0,d0
    106c:	d080           	add.l d0,d0
    106e:	2032 0800      	move.l (0,a2,d0.l),d0
    1072:	b0a9 0004      	cmp.l 4(a1),d0
    1076:	6600 0198      	bne.w 1210 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    107a:	7002           	moveq #2,d0
    107c:	b081           	cmp.l d1,d0
    107e:	6700 0188      	beq.w 1208 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1082:	2008           	move.l a0,d0
    1084:	5480           	addq.l #2,d0
    1086:	d080           	add.l d0,d0
    1088:	d080           	add.l d0,d0
    108a:	2032 0800      	move.l (0,a2,d0.l),d0
    108e:	b0a9 0008      	cmp.l 8(a1),d0
    1092:	6600 017c      	bne.w 1210 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1096:	7403           	moveq #3,d2
    1098:	b481           	cmp.l d1,d2
    109a:	6700 016c      	beq.w 1208 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    109e:	2008           	move.l a0,d0
    10a0:	5680           	addq.l #3,d0
    10a2:	d080           	add.l d0,d0
    10a4:	d080           	add.l d0,d0
    10a6:	2032 0800      	move.l (0,a2,d0.l),d0
    10aa:	b0a9 000c      	cmp.l 12(a1),d0
    10ae:	6600 0160      	bne.w 1210 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    10b2:	7004           	moveq #4,d0
    10b4:	b081           	cmp.l d1,d0
    10b6:	6700 0150      	beq.w 1208 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    10ba:	2008           	move.l a0,d0
    10bc:	5880           	addq.l #4,d0
    10be:	d080           	add.l d0,d0
    10c0:	d080           	add.l d0,d0
    10c2:	2032 0800      	move.l (0,a2,d0.l),d0
    10c6:	b0a9 0010      	cmp.l 16(a1),d0
    10ca:	6600 0144      	bne.w 1210 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    10ce:	7405           	moveq #5,d2
    10d0:	b481           	cmp.l d1,d2
    10d2:	6700 0134      	beq.w 1208 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    10d6:	2008           	move.l a0,d0
    10d8:	5a80           	addq.l #5,d0
    10da:	d080           	add.l d0,d0
    10dc:	d080           	add.l d0,d0
    10de:	2032 0800      	move.l (0,a2,d0.l),d0
    10e2:	b0a9 0014      	cmp.l 20(a1),d0
    10e6:	6600 0128      	bne.w 1210 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    10ea:	7006           	moveq #6,d0
    10ec:	b081           	cmp.l d1,d0
    10ee:	6700 0118      	beq.w 1208 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    10f2:	2008           	move.l a0,d0
    10f4:	5c80           	addq.l #6,d0
    10f6:	d080           	add.l d0,d0
    10f8:	d080           	add.l d0,d0
    10fa:	2032 0800      	move.l (0,a2,d0.l),d0
    10fe:	b0a9 0018      	cmp.l 24(a1),d0
    1102:	6600 010c      	bne.w 1210 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1106:	7407           	moveq #7,d2
    1108:	b481           	cmp.l d1,d2
    110a:	6700 00fc      	beq.w 1208 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    110e:	2008           	move.l a0,d0
    1110:	5e80           	addq.l #7,d0
    1112:	d080           	add.l d0,d0
    1114:	d080           	add.l d0,d0
    1116:	2032 0800      	move.l (0,a2,d0.l),d0
    111a:	b0a9 001c      	cmp.l 28(a1),d0
    111e:	6600 00f0      	bne.w 1210 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1122:	7008           	moveq #8,d0
    1124:	b081           	cmp.l d1,d0
    1126:	6700 00e0      	beq.w 1208 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    112a:	2008           	move.l a0,d0
    112c:	5080           	addq.l #8,d0
    112e:	d080           	add.l d0,d0
    1130:	d080           	add.l d0,d0
    1132:	2032 0800      	move.l (0,a2,d0.l),d0
    1136:	b0a9 0020      	cmp.l 32(a1),d0
    113a:	6600 00d4      	bne.w 1210 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    113e:	7409           	moveq #9,d2
    1140:	b481           	cmp.l d1,d2
    1142:	6700 00c4      	beq.w 1208 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1146:	47e8 0009      	lea 9(a0),a3
    114a:	200b           	move.l a3,d0
    114c:	d08b           	add.l a3,d0
    114e:	d080           	add.l d0,d0
    1150:	2032 0800      	move.l (0,a2,d0.l),d0
    1154:	b0a9 0024      	cmp.l 36(a1),d0
    1158:	6600 00b6      	bne.w 1210 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    115c:	700a           	moveq #10,d0
    115e:	b081           	cmp.l d1,d0
    1160:	6700 00a6      	beq.w 1208 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1164:	47e8 000a      	lea 10(a0),a3
    1168:	200b           	move.l a3,d0
    116a:	d08b           	add.l a3,d0
    116c:	d080           	add.l d0,d0
    116e:	2032 0800      	move.l (0,a2,d0.l),d0
    1172:	b0a9 0028      	cmp.l 40(a1),d0
    1176:	6600 0098      	bne.w 1210 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    117a:	740b           	moveq #11,d2
    117c:	b481           	cmp.l d1,d2
    117e:	6700 0088      	beq.w 1208 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1182:	47e8 000b      	lea 11(a0),a3
    1186:	200b           	move.l a3,d0
    1188:	d08b           	add.l a3,d0
    118a:	d080           	add.l d0,d0
    118c:	2032 0800      	move.l (0,a2,d0.l),d0
    1190:	b0a9 002c      	cmp.l 44(a1),d0
    1194:	667a           	bne.s 1210 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1196:	700c           	moveq #12,d0
    1198:	b081           	cmp.l d1,d0
    119a:	676c           	beq.s 1208 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    119c:	47e8 000c      	lea 12(a0),a3
    11a0:	200b           	move.l a3,d0
    11a2:	d08b           	add.l a3,d0
    11a4:	d080           	add.l d0,d0
    11a6:	2032 0800      	move.l (0,a2,d0.l),d0
    11aa:	b0a9 0030      	cmp.l 48(a1),d0
    11ae:	6660           	bne.s 1210 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    11b0:	740d           	moveq #13,d2
    11b2:	b481           	cmp.l d1,d2
    11b4:	6752           	beq.s 1208 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    11b6:	47e8 000d      	lea 13(a0),a3
    11ba:	200b           	move.l a3,d0
    11bc:	d08b           	add.l a3,d0
    11be:	d080           	add.l d0,d0
    11c0:	2032 0800      	move.l (0,a2,d0.l),d0
    11c4:	b0a9 0034      	cmp.l 52(a1),d0
    11c8:	6646           	bne.s 1210 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    11ca:	700e           	moveq #14,d0
    11cc:	b081           	cmp.l d1,d0
    11ce:	6738           	beq.s 1208 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    11d0:	47e8 000e      	lea 14(a0),a3
    11d4:	200b           	move.l a3,d0
    11d6:	d08b           	add.l a3,d0
    11d8:	d080           	add.l d0,d0
    11da:	2032 0800      	move.l (0,a2,d0.l),d0
    11de:	b0a9 0038      	cmp.l 56(a1),d0
    11e2:	662c           	bne.s 1210 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    11e4:	7410           	moveq #16,d2
    11e6:	b481           	cmp.l d1,d2
    11e8:	661e           	bne.s 1208 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    11ea:	41e8 000f      	lea 15(a0),a0
    11ee:	d1c8           	adda.l a0,a0
    11f0:	d1c8           	adda.l a0,a0
    11f2:	2070 a800      	movea.l (0,a0,a2.l),a0
    11f6:	b1e9 003c      	cmpa.l 60(a1),a0
    11fa:	57c0           	seq d0
    11fc:	4880           	ext.w d0
    11fe:	48c0           	ext.l d0
    1200:	4480           	neg.l d0
}
    1202:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    1206:	4e75           	rts
  return 1;
    1208:	7001           	moveq #1,d0
}
    120a:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    120e:	4e75           	rts
      return 0;
    1210:	7000           	moveq #0,d0
}
    1212:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    1216:	4e75           	rts

00001218 <ClBuild>:
ULONG * ClbuildSW() {
    1218:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
    121c:	2c79 0000 4d9a 	movea.l 4d9a <SysBase>,a6
    1222:	707b           	moveq #123,d0
    1224:	4600           	not.b d0
    1226:	7202           	moveq #2,d1
    1228:	4eae ff3a      	jsr -198(a6)
    122c:	2440           	movea.l d0,a2
  if( retval == 0) {
    122e:	4a80           	tst.l d0
    1230:	6700 010e      	beq.w 1340 <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
    1234:	24b9 0000 4cd8 	move.l 4cd8 <ClsSprites>,(a2)
    123a:	2579 0000 4cdc 	move.l 4cdc <ClsSprites+0x4>,4(a2)
    1240:	0004 
    1242:	2579 0000 4ce0 	move.l 4ce0 <ClsSprites+0x8>,8(a2)
    1248:	0008 
    124a:	2579 0000 4ce4 	move.l 4ce4 <ClsSprites+0xc>,12(a2)
    1250:	000c 
    1252:	2579 0000 4ce8 	move.l 4ce8 <ClsSprites+0x10>,16(a2)
    1258:	0010 
    125a:	2579 0000 4cec 	move.l 4cec <ClsSprites+0x14>,20(a2)
    1260:	0014 
    1262:	2579 0000 4cf0 	move.l 4cf0 <ClsSprites+0x18>,24(a2)
    1268:	0018 
    126a:	2579 0000 4cf4 	move.l 4cf4 <ClsSprites+0x1c>,28(a2)
    1270:	001c 
    1272:	2579 0000 4cf8 	move.l 4cf8 <ClsSprites+0x20>,32(a2)
    1278:	0020 
    127a:	2579 0000 4cfc 	move.l 4cfc <ClsSprites+0x24>,36(a2)
    1280:	0024 
    1282:	2579 0000 4d00 	move.l 4d00 <ClsSprites+0x28>,40(a2)
    1288:	0028 
    128a:	2579 0000 4d04 	move.l 4d04 <ClsSprites+0x2c>,44(a2)
    1290:	002c 
    1292:	2579 0000 4d08 	move.l 4d08 <ClsSprites+0x30>,48(a2)
    1298:	0030 
    129a:	2579 0000 4d0c 	move.l 4d0c <ClsSprites+0x34>,52(a2)
    12a0:	0034 
    12a2:	2579 0000 4d10 	move.l 4d10 <ClsSprites+0x38>,56(a2)
    12a8:	0038 
    12aa:	2579 0000 4d14 	move.l 4d14 <ClsSprites+0x3c>,60(a2)
    12b0:	003c 
    *cl++ = *clpartinstruction++;
    12b2:	2579 0000 4ca8 	move.l 4ca8 <ClScreen>,64(a2)
    12b8:	0040 
    12ba:	2579 0000 4cac 	move.l 4cac <ClScreen+0x4>,68(a2)
    12c0:	0044 
    12c2:	2579 0000 4cb0 	move.l 4cb0 <ClScreen+0x8>,72(a2)
    12c8:	0048 
    12ca:	2579 0000 4cb4 	move.l 4cb4 <ClScreen+0xc>,76(a2)
    12d0:	004c 
    12d2:	2579 0000 4cb8 	move.l 4cb8 <ClScreen+0x10>,80(a2)
    12d8:	0050 
    12da:	2579 0000 4cbc 	move.l 4cbc <ClScreen+0x14>,84(a2)
    12e0:	0054 
    12e2:	2579 0000 4cc0 	move.l 4cc0 <ClScreen+0x18>,88(a2)
    12e8:	0058 
    12ea:	2579 0000 4cc4 	move.l 4cc4 <ClScreen+0x1c>,92(a2)
    12f0:	005c 
    12f2:	2579 0000 4cc8 	move.l 4cc8 <ClScreen+0x20>,96(a2)
    12f8:	0060 
    12fa:	2579 0000 4ccc 	move.l 4ccc <ClScreen+0x24>,100(a2)
    1300:	0064 
    1302:	2579 0000 4cd0 	move.l 4cd0 <ClScreen+0x28>,104(a2)
    1308:	0068 
    130a:	2579 0000 4cd4 	move.l 4cd4 <ClScreen+0x2c>,108(a2)
    1310:	006c 
  *cl++ = 0x00e00000;
    1312:	257c 00e0 0000 	move.l #14680064,112(a2)
    1318:	0070 
  *cl++ = 0x00e20000;
    131a:	257c 00e2 0000 	move.l #14811136,116(a2)
    1320:	0074 
    *cl++ = *clpartinstruction++;
    1322:	2579 0000 4ca0 	move.l 4ca0 <ClColor>,120(a2)
    1328:	0078 
    132a:	2579 0000 4ca4 	move.l 4ca4 <ClColor+0x4>,124(a2)
    1330:	007c 
  *cl = 0xfffffffe;
    1332:	70fe           	moveq #-2,d0
    1334:	2540 0080      	move.l d0,128(a2)
}
    1338:	200a           	move.l a2,d0
    133a:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    133e:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1340:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
    1346:	4eae ffc4      	jsr -60(a6)
    134a:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
    1350:	2200           	move.l d0,d1
    1352:	243c 0000 25f3 	move.l #9715,d2
    1358:	7628           	moveq #40,d3
    135a:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    135e:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
    1364:	7201           	moveq #1,d1
    1366:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    136a:	24b9 0000 4cd8 	move.l 4cd8 <ClsSprites>,(a2)
    1370:	2579 0000 4cdc 	move.l 4cdc <ClsSprites+0x4>,4(a2)
    1376:	0004 
    1378:	2579 0000 4ce0 	move.l 4ce0 <ClsSprites+0x8>,8(a2)
    137e:	0008 
    1380:	2579 0000 4ce4 	move.l 4ce4 <ClsSprites+0xc>,12(a2)
    1386:	000c 
    1388:	2579 0000 4ce8 	move.l 4ce8 <ClsSprites+0x10>,16(a2)
    138e:	0010 
    1390:	2579 0000 4cec 	move.l 4cec <ClsSprites+0x14>,20(a2)
    1396:	0014 
    1398:	2579 0000 4cf0 	move.l 4cf0 <ClsSprites+0x18>,24(a2)
    139e:	0018 
    13a0:	2579 0000 4cf4 	move.l 4cf4 <ClsSprites+0x1c>,28(a2)
    13a6:	001c 
    13a8:	2579 0000 4cf8 	move.l 4cf8 <ClsSprites+0x20>,32(a2)
    13ae:	0020 
    13b0:	2579 0000 4cfc 	move.l 4cfc <ClsSprites+0x24>,36(a2)
    13b6:	0024 
    13b8:	2579 0000 4d00 	move.l 4d00 <ClsSprites+0x28>,40(a2)
    13be:	0028 
    13c0:	2579 0000 4d04 	move.l 4d04 <ClsSprites+0x2c>,44(a2)
    13c6:	002c 
    13c8:	2579 0000 4d08 	move.l 4d08 <ClsSprites+0x30>,48(a2)
    13ce:	0030 
    13d0:	2579 0000 4d0c 	move.l 4d0c <ClsSprites+0x34>,52(a2)
    13d6:	0034 
    13d8:	2579 0000 4d10 	move.l 4d10 <ClsSprites+0x38>,56(a2)
    13de:	0038 
    13e0:	2579 0000 4d14 	move.l 4d14 <ClsSprites+0x3c>,60(a2)
    13e6:	003c 
    *cl++ = *clpartinstruction++;
    13e8:	2579 0000 4ca8 	move.l 4ca8 <ClScreen>,64(a2)
    13ee:	0040 
    13f0:	2579 0000 4cac 	move.l 4cac <ClScreen+0x4>,68(a2)
    13f6:	0044 
    13f8:	2579 0000 4cb0 	move.l 4cb0 <ClScreen+0x8>,72(a2)
    13fe:	0048 
    1400:	2579 0000 4cb4 	move.l 4cb4 <ClScreen+0xc>,76(a2)
    1406:	004c 
    1408:	2579 0000 4cb8 	move.l 4cb8 <ClScreen+0x10>,80(a2)
    140e:	0050 
    1410:	2579 0000 4cbc 	move.l 4cbc <ClScreen+0x14>,84(a2)
    1416:	0054 
    1418:	2579 0000 4cc0 	move.l 4cc0 <ClScreen+0x18>,88(a2)
    141e:	0058 
    1420:	2579 0000 4cc4 	move.l 4cc4 <ClScreen+0x1c>,92(a2)
    1426:	005c 
    1428:	2579 0000 4cc8 	move.l 4cc8 <ClScreen+0x20>,96(a2)
    142e:	0060 
    1430:	2579 0000 4ccc 	move.l 4ccc <ClScreen+0x24>,100(a2)
    1436:	0064 
    1438:	2579 0000 4cd0 	move.l 4cd0 <ClScreen+0x28>,104(a2)
    143e:	0068 
    1440:	2579 0000 4cd4 	move.l 4cd4 <ClScreen+0x2c>,108(a2)
    1446:	006c 
  *cl++ = 0x00e00000;
    1448:	257c 00e0 0000 	move.l #14680064,112(a2)
    144e:	0070 
  *cl++ = 0x00e20000;
    1450:	257c 00e2 0000 	move.l #14811136,116(a2)
    1456:	0074 
    *cl++ = *clpartinstruction++;
    1458:	2579 0000 4ca0 	move.l 4ca0 <ClColor>,120(a2)
    145e:	0078 
    1460:	2579 0000 4ca4 	move.l 4ca4 <ClColor+0x4>,124(a2)
    1466:	007c 
  *cl = 0xfffffffe;
    1468:	70fe           	moveq #-2,d0
    146a:	2540 0080      	move.l d0,128(a2)
}
    146e:	200a           	move.l a2,d0
    1470:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1474:	4e75           	rts

00001476 <ClbuildZoom>:
ULONG * ClbuildZoom() {
    1476:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    147a:	2c79 0000 4d9a 	movea.l 4d9a <SysBase>,a6
    1480:	203c 0000 a48c 	move.l #42124,d0
    1486:	7202           	moveq #2,d1
    1488:	4eae ff3a      	jsr -198(a6)
    148c:	2440           	movea.l d0,a2
  if( retval == 0) {
    148e:	4a80           	tst.l d0
    1490:	6700 0160      	beq.w 15f2 <ClbuildZoom+0x17c>
    *cl++ = *clpartinstruction++;
    1494:	24b9 0000 4cd8 	move.l 4cd8 <ClsSprites>,(a2)
    149a:	2579 0000 4cdc 	move.l 4cdc <ClsSprites+0x4>,4(a2)
    14a0:	0004 
    14a2:	2579 0000 4ce0 	move.l 4ce0 <ClsSprites+0x8>,8(a2)
    14a8:	0008 
    14aa:	2579 0000 4ce4 	move.l 4ce4 <ClsSprites+0xc>,12(a2)
    14b0:	000c 
    14b2:	2579 0000 4ce8 	move.l 4ce8 <ClsSprites+0x10>,16(a2)
    14b8:	0010 
    14ba:	2579 0000 4cec 	move.l 4cec <ClsSprites+0x14>,20(a2)
    14c0:	0014 
    14c2:	2579 0000 4cf0 	move.l 4cf0 <ClsSprites+0x18>,24(a2)
    14c8:	0018 
    14ca:	2579 0000 4cf4 	move.l 4cf4 <ClsSprites+0x1c>,28(a2)
    14d0:	001c 
    14d2:	2579 0000 4cf8 	move.l 4cf8 <ClsSprites+0x20>,32(a2)
    14d8:	0020 
    14da:	2579 0000 4cfc 	move.l 4cfc <ClsSprites+0x24>,36(a2)
    14e0:	0024 
    14e2:	2579 0000 4d00 	move.l 4d00 <ClsSprites+0x28>,40(a2)
    14e8:	0028 
    14ea:	2579 0000 4d04 	move.l 4d04 <ClsSprites+0x2c>,44(a2)
    14f0:	002c 
    14f2:	2579 0000 4d08 	move.l 4d08 <ClsSprites+0x30>,48(a2)
    14f8:	0030 
    14fa:	2579 0000 4d0c 	move.l 4d0c <ClsSprites+0x34>,52(a2)
    1500:	0034 
    1502:	2579 0000 4d10 	move.l 4d10 <ClsSprites+0x38>,56(a2)
    1508:	0038 
    150a:	2579 0000 4d14 	move.l 4d14 <ClsSprites+0x3c>,60(a2)
    1510:	003c 
    *cl++ = *clpartinstruction++;
    1512:	2579 0000 4c70 	move.l 4c70 <ClScreenZoom>,64(a2)
    1518:	0040 
    151a:	2579 0000 4c74 	move.l 4c74 <ClScreenZoom+0x4>,68(a2)
    1520:	0044 
    1522:	2579 0000 4c78 	move.l 4c78 <ClScreenZoom+0x8>,72(a2)
    1528:	0048 
    152a:	2579 0000 4c7c 	move.l 4c7c <ClScreenZoom+0xc>,76(a2)
    1530:	004c 
    1532:	2579 0000 4c80 	move.l 4c80 <ClScreenZoom+0x10>,80(a2)
    1538:	0050 
    153a:	2579 0000 4c84 	move.l 4c84 <ClScreenZoom+0x14>,84(a2)
    1540:	0054 
    1542:	2579 0000 4c88 	move.l 4c88 <ClScreenZoom+0x18>,88(a2)
    1548:	0058 
    154a:	2579 0000 4c8c 	move.l 4c8c <ClScreenZoom+0x1c>,92(a2)
    1550:	005c 
    1552:	2579 0000 4c90 	move.l 4c90 <ClScreenZoom+0x20>,96(a2)
    1558:	0060 
    155a:	2579 0000 4c94 	move.l 4c94 <ClScreenZoom+0x24>,100(a2)
    1560:	0064 
    1562:	2579 0000 4c98 	move.l 4c98 <ClScreenZoom+0x28>,104(a2)
    1568:	0068 
    156a:	2579 0000 4c9c 	move.l 4c9c <ClScreenZoom+0x2c>,108(a2)
    1570:	006c 
  *cl++ = 0x00e00000;
    1572:	257c 00e0 0000 	move.l #14680064,112(a2)
    1578:	0070 
  *cl++ = 0x00e20000;
    157a:	257c 00e2 0000 	move.l #14811136,116(a2)
    1580:	0074 
  *cl++ = 0x00e40000;
    1582:	257c 00e4 0000 	move.l #14942208,120(a2)
    1588:	0078 
  *cl++ = 0x00e60000;
    158a:	257c 00e6 0000 	move.l #15073280,124(a2)
    1590:	007c 
    *cl++ = *clpartinstruction++;
    1592:	2579 0000 4ca0 	move.l 4ca0 <ClColor>,128(a2)
    1598:	0080 
    159a:	2579 0000 4ca4 	move.l 4ca4 <ClColor+0x4>,132(a2)
    15a0:	0084 
    15a2:	43ea 012c      	lea 300(a2),a1
    15a6:	220a           	move.l a2,d1
    15a8:	0681 0000 a52c 	addi.l #42284,d1
    15ae:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    15b4:	41e9 ff60      	lea -160(a1),a0
    15b8:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    15bc:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    15c2:	5088           	addq.l #8,a0
    15c4:	217c 0182 0f00 	move.l #25300736,-4(a0)
    15ca:	fffc 
    for(int i2=0;i2<20;i2++) {
    15cc:	b3c8           	cmpa.l a0,a1
    15ce:	66ec           	bne.s 15bc <ClbuildZoom+0x146>
    15d0:	43e8 00a4      	lea 164(a0),a1
    15d4:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    15da:	b3c1           	cmpa.l d1,a1
    15dc:	66d6           	bne.s 15b4 <ClbuildZoom+0x13e>
   *cl = 0xfffffffe;
    15de:	203c 0000 a488 	move.l #42120,d0
    15e4:	72fe           	moveq #-2,d1
    15e6:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    15ea:	200a           	move.l a2,d0
    15ec:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    15f0:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    15f2:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
    15f8:	4eae ffc4      	jsr -60(a6)
    15fc:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
    1602:	2200           	move.l d0,d1
    1604:	243c 0000 25f3 	move.l #9715,d2
    160a:	7628           	moveq #40,d3
    160c:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1610:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
    1616:	7201           	moveq #1,d1
    1618:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    161c:	24b9 0000 4cd8 	move.l 4cd8 <ClsSprites>,(a2)
    1622:	2579 0000 4cdc 	move.l 4cdc <ClsSprites+0x4>,4(a2)
    1628:	0004 
    162a:	2579 0000 4ce0 	move.l 4ce0 <ClsSprites+0x8>,8(a2)
    1630:	0008 
    1632:	2579 0000 4ce4 	move.l 4ce4 <ClsSprites+0xc>,12(a2)
    1638:	000c 
    163a:	2579 0000 4ce8 	move.l 4ce8 <ClsSprites+0x10>,16(a2)
    1640:	0010 
    1642:	2579 0000 4cec 	move.l 4cec <ClsSprites+0x14>,20(a2)
    1648:	0014 
    164a:	2579 0000 4cf0 	move.l 4cf0 <ClsSprites+0x18>,24(a2)
    1650:	0018 
    1652:	2579 0000 4cf4 	move.l 4cf4 <ClsSprites+0x1c>,28(a2)
    1658:	001c 
    165a:	2579 0000 4cf8 	move.l 4cf8 <ClsSprites+0x20>,32(a2)
    1660:	0020 
    1662:	2579 0000 4cfc 	move.l 4cfc <ClsSprites+0x24>,36(a2)
    1668:	0024 
    166a:	2579 0000 4d00 	move.l 4d00 <ClsSprites+0x28>,40(a2)
    1670:	0028 
    1672:	2579 0000 4d04 	move.l 4d04 <ClsSprites+0x2c>,44(a2)
    1678:	002c 
    167a:	2579 0000 4d08 	move.l 4d08 <ClsSprites+0x30>,48(a2)
    1680:	0030 
    1682:	2579 0000 4d0c 	move.l 4d0c <ClsSprites+0x34>,52(a2)
    1688:	0034 
    168a:	2579 0000 4d10 	move.l 4d10 <ClsSprites+0x38>,56(a2)
    1690:	0038 
    1692:	2579 0000 4d14 	move.l 4d14 <ClsSprites+0x3c>,60(a2)
    1698:	003c 
    *cl++ = *clpartinstruction++;
    169a:	2579 0000 4c70 	move.l 4c70 <ClScreenZoom>,64(a2)
    16a0:	0040 
    16a2:	2579 0000 4c74 	move.l 4c74 <ClScreenZoom+0x4>,68(a2)
    16a8:	0044 
    16aa:	2579 0000 4c78 	move.l 4c78 <ClScreenZoom+0x8>,72(a2)
    16b0:	0048 
    16b2:	2579 0000 4c7c 	move.l 4c7c <ClScreenZoom+0xc>,76(a2)
    16b8:	004c 
    16ba:	2579 0000 4c80 	move.l 4c80 <ClScreenZoom+0x10>,80(a2)
    16c0:	0050 
    16c2:	2579 0000 4c84 	move.l 4c84 <ClScreenZoom+0x14>,84(a2)
    16c8:	0054 
    16ca:	2579 0000 4c88 	move.l 4c88 <ClScreenZoom+0x18>,88(a2)
    16d0:	0058 
    16d2:	2579 0000 4c8c 	move.l 4c8c <ClScreenZoom+0x1c>,92(a2)
    16d8:	005c 
    16da:	2579 0000 4c90 	move.l 4c90 <ClScreenZoom+0x20>,96(a2)
    16e0:	0060 
    16e2:	2579 0000 4c94 	move.l 4c94 <ClScreenZoom+0x24>,100(a2)
    16e8:	0064 
    16ea:	2579 0000 4c98 	move.l 4c98 <ClScreenZoom+0x28>,104(a2)
    16f0:	0068 
    16f2:	2579 0000 4c9c 	move.l 4c9c <ClScreenZoom+0x2c>,108(a2)
    16f8:	006c 
  *cl++ = 0x00e00000;
    16fa:	257c 00e0 0000 	move.l #14680064,112(a2)
    1700:	0070 
  *cl++ = 0x00e20000;
    1702:	257c 00e2 0000 	move.l #14811136,116(a2)
    1708:	0074 
  *cl++ = 0x00e40000;
    170a:	257c 00e4 0000 	move.l #14942208,120(a2)
    1710:	0078 
  *cl++ = 0x00e60000;
    1712:	257c 00e6 0000 	move.l #15073280,124(a2)
    1718:	007c 
    *cl++ = *clpartinstruction++;
    171a:	2579 0000 4ca0 	move.l 4ca0 <ClColor>,128(a2)
    1720:	0080 
    1722:	2579 0000 4ca4 	move.l 4ca4 <ClColor+0x4>,132(a2)
    1728:	0084 
    172a:	43ea 012c      	lea 300(a2),a1
    172e:	220a           	move.l a2,d1
    1730:	0681 0000 a52c 	addi.l #42284,d1
    1736:	203c 2c07 fffe 	move.l #738721790,d0
    173c:	6000 fe76      	bra.w 15b4 <ClbuildZoom+0x13e>

00001740 <SwapCl>:
  ULONG tmp = DrawCopper;
    1740:	2039 0000 4d82 	move.l 4d82 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    1746:	23f9 0000 4d76 	move.l 4d76 <ViewCopper>,4d82 <DrawCopper>
    174c:	0000 4d82 
  ViewCopper = tmp;
    1750:	23c0 0000 4d76 	move.l d0,4d76 <ViewCopper>
  hw->cop1lc = ViewCopper;
    1756:	2079 0000 4d72 	movea.l 4d72 <hw>,a0
    175c:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    1760:	3140 0088      	move.w d0,136(a0)
}
    1764:	4e75           	rts

00001766 <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    1766:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    176a:	45fa fd0a      	lea 1476 <ClbuildZoom>(pc),a2
    176e:	4e92           	jsr (a2)
    1770:	23c0 0000 4d96 	move.l d0,4d96 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    1776:	4e92           	jsr (a2)
    1778:	23c0 0000 4d92 	move.l d0,4d92 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    177e:	2c79 0000 4d9a 	movea.l 4d9a <SysBase>,a6
    1784:	203c 0001 2c00 	move.l #76800,d0
    178a:	7202           	moveq #2,d1
    178c:	4eae ff3a      	jsr -198(a6)
    1790:	23c0 0000 4d8e 	move.l d0,4d8e <Bitplane1>
  if(Bitplane1 == 0) {
    1796:	6700 014e      	beq.w 18e6 <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    179a:	23c0 0000 4d86 	move.l d0,4d86 <DrawBuffer>
  DrawCopper = Copperlist1;
    17a0:	23f9 0000 4d96 	move.l 4d96 <Copperlist1>,4d82 <DrawCopper>
    17a6:	0000 4d82 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    17aa:	2c79 0000 4d9a 	movea.l 4d9a <SysBase>,a6
    17b0:	203c 0001 2c00 	move.l #76800,d0
    17b6:	7202           	moveq #2,d1
    17b8:	4eae ff3a      	jsr -198(a6)
    17bc:	2400           	move.l d0,d2
    17be:	23c0 0000 4d7e 	move.l d0,4d7e <Bitplane2>
  if(Bitplane2 == 0) {
    17c4:	6778           	beq.s 183e <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    17c6:	23f9 0000 4d92 	move.l 4d92 <Copperlist2>,4d76 <ViewCopper>
    17cc:	0000 4d76 
  SwapCl();
    17d0:	45fa ff6e      	lea 1740 <SwapCl>(pc),a2
    17d4:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    17d6:	2039 0000 4d86 	move.l 4d86 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    17dc:	2079 0000 4d82 	movea.l 4d82 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    17e2:	2200           	move.l d0,d1
    17e4:	4241           	clr.w d1
    17e6:	4841           	swap d1
    17e8:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    17ec:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    17f0:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    17f6:	2200           	move.l d0,d1
    17f8:	4241           	clr.w d1
    17fa:	4841           	swap d1
    17fc:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    1800:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    1804:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    1806:	2079 0000 4d82 	movea.l 4d82 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    180c:	2002           	move.l d2,d0
    180e:	4240           	clr.w d0
    1810:	4840           	swap d0
    1812:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    1816:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    181a:	2002           	move.l d2,d0
    181c:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    1822:	2200           	move.l d0,d1
    1824:	4241           	clr.w d1
    1826:	4841           	swap d1
    1828:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    182c:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    1830:	23c2 0000 4d7a 	move.l d2,4d7a <ViewBuffer>
}
    1836:	7000           	moveq #0,d0
    1838:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    183c:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    183e:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
    1844:	4eae ffc4      	jsr -60(a6)
    1848:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
    184e:	2200           	move.l d0,d1
    1850:	243c 0000 2640 	move.l #9792,d2
    1856:	7626           	moveq #38,d3
    1858:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    185c:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
    1862:	7201           	moveq #1,d1
    1864:	4eae ff70      	jsr -144(a6)
    1868:	2439 0000 4d7e 	move.l 4d7e <Bitplane2>,d2
  ViewCopper = Copperlist2;
    186e:	23f9 0000 4d92 	move.l 4d92 <Copperlist2>,4d76 <ViewCopper>
    1874:	0000 4d76 
  SwapCl();
    1878:	45fa fec6      	lea 1740 <SwapCl>(pc),a2
    187c:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    187e:	2039 0000 4d86 	move.l 4d86 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    1884:	2079 0000 4d82 	movea.l 4d82 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    188a:	2200           	move.l d0,d1
    188c:	4241           	clr.w d1
    188e:	4841           	swap d1
    1890:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    1894:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    1898:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    189e:	2200           	move.l d0,d1
    18a0:	4241           	clr.w d1
    18a2:	4841           	swap d1
    18a4:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    18a8:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    18ac:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    18ae:	2079 0000 4d82 	movea.l 4d82 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    18b4:	2002           	move.l d2,d0
    18b6:	4240           	clr.w d0
    18b8:	4840           	swap d0
    18ba:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    18be:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    18c2:	2002           	move.l d2,d0
    18c4:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    18ca:	2200           	move.l d0,d1
    18cc:	4241           	clr.w d1
    18ce:	4841           	swap d1
    18d0:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    18d4:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    18d8:	23c2 0000 4d7a 	move.l d2,4d7a <ViewBuffer>
}
    18de:	7000           	moveq #0,d0
    18e0:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    18e4:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    18e6:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
    18ec:	4eae ffc4      	jsr -60(a6)
    18f0:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
    18f6:	2200           	move.l d0,d1
    18f8:	243c 0000 2619 	move.l #9753,d2
    18fe:	7626           	moveq #38,d3
    1900:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1904:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
    190a:	7201           	moveq #1,d1
    190c:	4eae ff70      	jsr -144(a6)
    1910:	2039 0000 4d8e 	move.l 4d8e <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    1916:	23c0 0000 4d86 	move.l d0,4d86 <DrawBuffer>
  DrawCopper = Copperlist1;
    191c:	23f9 0000 4d96 	move.l 4d96 <Copperlist1>,4d82 <DrawCopper>
    1922:	0000 4d82 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1926:	2c79 0000 4d9a 	movea.l 4d9a <SysBase>,a6
    192c:	203c 0001 2c00 	move.l #76800,d0
    1932:	7202           	moveq #2,d1
    1934:	4eae ff3a      	jsr -198(a6)
    1938:	2400           	move.l d0,d2
    193a:	23c0 0000 4d7e 	move.l d0,4d7e <Bitplane2>
  if(Bitplane2 == 0) {
    1940:	6600 fe84      	bne.w 17c6 <PrepareDisplayZoom+0x60>
    1944:	6000 fef8      	bra.w 183e <PrepareDisplayZoom+0xd8>

00001948 <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    1948:	2039 0000 4d86 	move.l 4d86 <DrawBuffer>,d0
  UWORD *copword = DrawCopper;
    194e:	2079 0000 4d82 	movea.l 4d82 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    1954:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    1958:	2200           	move.l d0,d1
    195a:	4241           	clr.w d1
    195c:	4841           	swap d1
    195e:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    1962:	23f9 0000 4d7a 	move.l 4d7a <ViewBuffer>,4d86 <DrawBuffer>
    1968:	0000 4d86 
  ViewBuffer = tmp;
    196c:	23c0 0000 4d7a 	move.l d0,4d7a <ViewBuffer>
}
    1972:	4e75           	rts

00001974 <PrepareDisplay>:
 int PrepareDisplaySW() {
    1974:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClbuildSW();
    1978:	45fa f89e      	lea 1218 <ClBuild>(pc),a2
    197c:	4e92           	jsr (a2)
    197e:	23c0 0000 4d96 	move.l d0,4d96 <Copperlist1>
  Copperlist2 = ClbuildSW();
    1984:	4e92           	jsr (a2)
    1986:	23c0 0000 4d92 	move.l d0,4d92 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    198c:	2c79 0000 4d9a 	movea.l 4d9a <SysBase>,a6
    1992:	203c 0000 c800 	move.l #51200,d0
    1998:	7202           	moveq #2,d1
    199a:	4eae ff3a      	jsr -198(a6)
    199e:	23c0 0000 4d8e 	move.l d0,4d8e <Bitplane1>
  if(Bitplane1 == 0) {
    19a4:	6700 00ac      	beq.w 1a52 <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    19a8:	23c0 0000 4d86 	move.l d0,4d86 <DrawBuffer>
  DrawCopper = Copperlist1;
    19ae:	23f9 0000 4d96 	move.l 4d96 <Copperlist1>,4d82 <DrawCopper>
    19b4:	0000 4d82 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    19b8:	2c79 0000 4d9a 	movea.l 4d9a <SysBase>,a6
    19be:	203c 0000 c800 	move.l #51200,d0
    19c4:	7202           	moveq #2,d1
    19c6:	4eae ff3a      	jsr -198(a6)
    19ca:	23c0 0000 4d7e 	move.l d0,4d7e <Bitplane2>
  if(Bitplane2 == 0) {
    19d0:	6728           	beq.s 19fa <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    19d2:	23c0 0000 4d7a 	move.l d0,4d7a <ViewBuffer>
  ViewCopper = Copperlist2;
    19d8:	23f9 0000 4d92 	move.l 4d92 <Copperlist2>,4d76 <ViewCopper>
    19de:	0000 4d76 
  SwapCl();
    19e2:	47fa fd5c      	lea 1740 <SwapCl>(pc),a3
    19e6:	4e93           	jsr (a3)
  SetBplPointers();
    19e8:	45fa ff5e      	lea 1948 <SetBplPointers>(pc),a2
    19ec:	4e92           	jsr (a2)
  SwapCl();
    19ee:	4e93           	jsr (a3)
  SetBplPointers();
    19f0:	4e92           	jsr (a2)
}
    19f2:	7000           	moveq #0,d0
    19f4:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    19f8:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    19fa:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
    1a00:	4eae ffc4      	jsr -60(a6)
    1a04:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
    1a0a:	2200           	move.l d0,d1
    1a0c:	243c 0000 2640 	move.l #9792,d2
    1a12:	7626           	moveq #38,d3
    1a14:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1a18:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
    1a1e:	7201           	moveq #1,d1
    1a20:	4eae ff70      	jsr -144(a6)
    1a24:	2039 0000 4d7e 	move.l 4d7e <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    1a2a:	23c0 0000 4d7a 	move.l d0,4d7a <ViewBuffer>
  ViewCopper = Copperlist2;
    1a30:	23f9 0000 4d92 	move.l 4d92 <Copperlist2>,4d76 <ViewCopper>
    1a36:	0000 4d76 
  SwapCl();
    1a3a:	47fa fd04      	lea 1740 <SwapCl>(pc),a3
    1a3e:	4e93           	jsr (a3)
  SetBplPointers();
    1a40:	45fa ff06      	lea 1948 <SetBplPointers>(pc),a2
    1a44:	4e92           	jsr (a2)
  SwapCl();
    1a46:	4e93           	jsr (a3)
  SetBplPointers();
    1a48:	4e92           	jsr (a2)
}
    1a4a:	7000           	moveq #0,d0
    1a4c:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    1a50:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    1a52:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
    1a58:	4eae ffc4      	jsr -60(a6)
    1a5c:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
    1a62:	2200           	move.l d0,d1
    1a64:	243c 0000 2619 	move.l #9753,d2
    1a6a:	7626           	moveq #38,d3
    1a6c:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1a70:	2c79 0000 4d8a 	movea.l 4d8a <DOSBase>,a6
    1a76:	7201           	moveq #1,d1
    1a78:	4eae ff70      	jsr -144(a6)
    1a7c:	2039 0000 4d8e 	move.l 4d8e <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    1a82:	23c0 0000 4d86 	move.l d0,4d86 <DrawBuffer>
  DrawCopper = Copperlist1;
    1a88:	23f9 0000 4d96 	move.l 4d96 <Copperlist1>,4d82 <DrawCopper>
    1a8e:	0000 4d82 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    1a92:	2c79 0000 4d9a 	movea.l 4d9a <SysBase>,a6
    1a98:	203c 0000 c800 	move.l #51200,d0
    1a9e:	7202           	moveq #2,d1
    1aa0:	4eae ff3a      	jsr -198(a6)
    1aa4:	23c0 0000 4d7e 	move.l d0,4d7e <Bitplane2>
  if(Bitplane2 == 0) {
    1aaa:	6600 ff26      	bne.w 19d2 <PrepareDisplay+0x5e>
    1aae:	6000 ff4a      	bra.w 19fa <PrepareDisplay+0x86>

00001ab2 <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    1ab2:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    1ab6:	262f 0010      	move.l 16(sp),d3
    1aba:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    1abe:	2279 0000 4d96 	movea.l 4d96 <Copperlist1>,a1
    1ac4:	b2fc 0000      	cmpa.w #0,a1
    1ac8:	670c           	beq.s 1ad6 <FreeDisplay+0x24>
    1aca:	2c79 0000 4d9a 	movea.l 4d9a <SysBase>,a6
    1ad0:	2003           	move.l d3,d0
    1ad2:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    1ad6:	2279 0000 4d92 	movea.l 4d92 <Copperlist2>,a1
    1adc:	b2fc 0000      	cmpa.w #0,a1
    1ae0:	670c           	beq.s 1aee <FreeDisplay+0x3c>
    1ae2:	2c79 0000 4d9a 	movea.l 4d9a <SysBase>,a6
    1ae8:	2003           	move.l d3,d0
    1aea:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    1aee:	2279 0000 4d8e 	movea.l 4d8e <Bitplane1>,a1
    1af4:	b2fc 0000      	cmpa.w #0,a1
    1af8:	670c           	beq.s 1b06 <FreeDisplay+0x54>
    1afa:	2c79 0000 4d9a 	movea.l 4d9a <SysBase>,a6
    1b00:	2002           	move.l d2,d0
    1b02:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    1b06:	2279 0000 4d7e 	movea.l 4d7e <Bitplane2>,a1
    1b0c:	b2fc 0000      	cmpa.w #0,a1
    1b10:	670c           	beq.s 1b1e <FreeDisplay+0x6c>
    1b12:	2c79 0000 4d9a 	movea.l 4d9a <SysBase>,a6
    1b18:	2002           	move.l d2,d0
    1b1a:	4eae ff2e      	jsr -210(a6)
}
    1b1e:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    1b22:	4e75           	rts

00001b24 <WaitVbl>:
void WaitVbl() {
    1b24:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    1b26:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddd6a4>,d0
    1b2c:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    1b2e:	2017           	move.l (sp),d0
    1b30:	0280 0001 ff00 	andi.l #130816,d0
    1b36:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    1b38:	2017           	move.l (sp),d0
    1b3a:	0c80 0001 3700 	cmpi.l #79616,d0
    1b40:	67e4           	beq.s 1b26 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    1b42:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddd6a4>,d0
    1b48:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    1b4c:	202f 0004      	move.l 4(sp),d0
    1b50:	0280 0001 ff00 	andi.l #130816,d0
    1b56:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    1b5a:	202f 0004      	move.l 4(sp),d0
    1b5e:	0c80 0001 3700 	cmpi.l #79616,d0
    1b64:	66dc           	bne.s 1b42 <WaitVbl+0x1e>
}
    1b66:	508f           	addq.l #8,sp
    1b68:	4e75           	rts

00001b6a <memcpy>:
{
    1b6a:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    1b6e:	202f 0014      	move.l 20(sp),d0
    1b72:	226f 0018      	movea.l 24(sp),a1
    1b76:	222f 001c      	move.l 28(sp),d1
	while(len--)
    1b7a:	2601           	move.l d1,d3
    1b7c:	5383           	subq.l #1,d3
    1b7e:	4a81           	tst.l d1
    1b80:	6762           	beq.s 1be4 <memcpy+0x7a>
    1b82:	2040           	movea.l d0,a0
    1b84:	5888           	addq.l #4,a0
    1b86:	b1c9           	cmpa.l a1,a0
    1b88:	53c2           	sl.s d2
    1b8a:	4402           	neg.b d2
    1b8c:	41e9 0004      	lea 4(a1),a0
    1b90:	b1c0           	cmpa.l d0,a0
    1b92:	53c4           	sl.s d4
    1b94:	4404           	neg.b d4
    1b96:	8404           	or.b d4,d2
    1b98:	7808           	moveq #8,d4
    1b9a:	b883           	cmp.l d3,d4
    1b9c:	55c4           	sc.s d4
    1b9e:	4404           	neg.b d4
    1ba0:	c404           	and.b d4,d2
    1ba2:	6746           	beq.s 1bea <memcpy+0x80>
    1ba4:	2409           	move.l a1,d2
    1ba6:	8480           	or.l d0,d2
    1ba8:	7803           	moveq #3,d4
    1baa:	c484           	and.l d4,d2
    1bac:	663c           	bne.s 1bea <memcpy+0x80>
    1bae:	2049           	movea.l a1,a0
    1bb0:	2440           	movea.l d0,a2
    1bb2:	74fc           	moveq #-4,d2
    1bb4:	c481           	and.l d1,d2
    1bb6:	d489           	add.l a1,d2
		*d++ = *s++;
    1bb8:	24d8           	move.l (a0)+,(a2)+
    1bba:	b488           	cmp.l a0,d2
    1bbc:	66fa           	bne.s 1bb8 <memcpy+0x4e>
    1bbe:	74fc           	moveq #-4,d2
    1bc0:	c481           	and.l d1,d2
    1bc2:	2040           	movea.l d0,a0
    1bc4:	d1c2           	adda.l d2,a0
    1bc6:	d3c2           	adda.l d2,a1
    1bc8:	9682           	sub.l d2,d3
    1bca:	b481           	cmp.l d1,d2
    1bcc:	6716           	beq.s 1be4 <memcpy+0x7a>
    1bce:	1091           	move.b (a1),(a0)
	while(len--)
    1bd0:	4a83           	tst.l d3
    1bd2:	6710           	beq.s 1be4 <memcpy+0x7a>
		*d++ = *s++;
    1bd4:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    1bda:	5383           	subq.l #1,d3
    1bdc:	6706           	beq.s 1be4 <memcpy+0x7a>
		*d++ = *s++;
    1bde:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    1be4:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    1be8:	4e75           	rts
    1bea:	2040           	movea.l d0,a0
    1bec:	d289           	add.l a1,d1
		*d++ = *s++;
    1bee:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    1bf0:	b289           	cmp.l a1,d1
    1bf2:	67f0           	beq.s 1be4 <memcpy+0x7a>
		*d++ = *s++;
    1bf4:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    1bf6:	b289           	cmp.l a1,d1
    1bf8:	66f4           	bne.s 1bee <memcpy+0x84>
    1bfa:	60e8           	bra.s 1be4 <memcpy+0x7a>

00001bfc <memset>:
{
    1bfc:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    1c00:	202f 0024      	move.l 36(sp),d0
    1c04:	2a2f 0028      	move.l 40(sp),d5
    1c08:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    1c0c:	2809           	move.l a1,d4
    1c0e:	5384           	subq.l #1,d4
    1c10:	b2fc 0000      	cmpa.w #0,a1
    1c14:	6f00 00b0      	ble.w 1cc6 <memset+0xca>
    1c18:	1e05           	move.b d5,d7
    1c1a:	2200           	move.l d0,d1
    1c1c:	4481           	neg.l d1
    1c1e:	7403           	moveq #3,d2
    1c20:	c282           	and.l d2,d1
    1c22:	7c05           	moveq #5,d6
		*ptr++ = val;
    1c24:	2440           	movea.l d0,a2
    1c26:	bc84           	cmp.l d4,d6
    1c28:	646a           	bcc.s 1c94 <memset+0x98>
    1c2a:	4a81           	tst.l d1
    1c2c:	6724           	beq.s 1c52 <memset+0x56>
    1c2e:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    1c30:	5384           	subq.l #1,d4
    1c32:	7401           	moveq #1,d2
    1c34:	b481           	cmp.l d1,d2
    1c36:	671a           	beq.s 1c52 <memset+0x56>
		*ptr++ = val;
    1c38:	2440           	movea.l d0,a2
    1c3a:	548a           	addq.l #2,a2
    1c3c:	2040           	movea.l d0,a0
    1c3e:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    1c42:	5384           	subq.l #1,d4
    1c44:	7403           	moveq #3,d2
    1c46:	b481           	cmp.l d1,d2
    1c48:	6608           	bne.s 1c52 <memset+0x56>
		*ptr++ = val;
    1c4a:	528a           	addq.l #1,a2
    1c4c:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    1c50:	5384           	subq.l #1,d4
    1c52:	2609           	move.l a1,d3
    1c54:	9681           	sub.l d1,d3
    1c56:	7c00           	moveq #0,d6
    1c58:	1c05           	move.b d5,d6
    1c5a:	2406           	move.l d6,d2
    1c5c:	4842           	swap d2
    1c5e:	4242           	clr.w d2
    1c60:	2042           	movea.l d2,a0
    1c62:	2406           	move.l d6,d2
    1c64:	e14a           	lsl.w #8,d2
    1c66:	4842           	swap d2
    1c68:	4242           	clr.w d2
    1c6a:	e18e           	lsl.l #8,d6
    1c6c:	2646           	movea.l d6,a3
    1c6e:	2c08           	move.l a0,d6
    1c70:	8486           	or.l d6,d2
    1c72:	2c0b           	move.l a3,d6
    1c74:	8486           	or.l d6,d2
    1c76:	1407           	move.b d7,d2
    1c78:	2040           	movea.l d0,a0
    1c7a:	d1c1           	adda.l d1,a0
    1c7c:	72fc           	moveq #-4,d1
    1c7e:	c283           	and.l d3,d1
    1c80:	d288           	add.l a0,d1
		*ptr++ = val;
    1c82:	20c2           	move.l d2,(a0)+
    1c84:	b1c1           	cmpa.l d1,a0
    1c86:	66fa           	bne.s 1c82 <memset+0x86>
    1c88:	72fc           	moveq #-4,d1
    1c8a:	c283           	and.l d3,d1
    1c8c:	d5c1           	adda.l d1,a2
    1c8e:	9881           	sub.l d1,d4
    1c90:	b283           	cmp.l d3,d1
    1c92:	6732           	beq.s 1cc6 <memset+0xca>
    1c94:	1485           	move.b d5,(a2)
	while(len-- > 0)
    1c96:	4a84           	tst.l d4
    1c98:	6f2c           	ble.s 1cc6 <memset+0xca>
		*ptr++ = val;
    1c9a:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    1c9e:	7201           	moveq #1,d1
    1ca0:	b284           	cmp.l d4,d1
    1ca2:	6c22           	bge.s 1cc6 <memset+0xca>
		*ptr++ = val;
    1ca4:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    1ca8:	7402           	moveq #2,d2
    1caa:	b484           	cmp.l d4,d2
    1cac:	6c18           	bge.s 1cc6 <memset+0xca>
		*ptr++ = val;
    1cae:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    1cb2:	7c03           	moveq #3,d6
    1cb4:	bc84           	cmp.l d4,d6
    1cb6:	6c0e           	bge.s 1cc6 <memset+0xca>
		*ptr++ = val;
    1cb8:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    1cbc:	7204           	moveq #4,d1
    1cbe:	b284           	cmp.l d4,d1
    1cc0:	6c04           	bge.s 1cc6 <memset+0xca>
		*ptr++ = val;
    1cc2:	1545 0005      	move.b d5,5(a2)
}
    1cc6:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    1cca:	4e75           	rts

00001ccc <strlen>:
{
    1ccc:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    1cd0:	7000           	moveq #0,d0
	while(*s++)
    1cd2:	4a10           	tst.b (a0)
    1cd4:	6708           	beq.s 1cde <strlen+0x12>
		t++;
    1cd6:	5280           	addq.l #1,d0
	while(*s++)
    1cd8:	4a30 0800      	tst.b (0,a0,d0.l)
    1cdc:	66f8           	bne.s 1cd6 <strlen+0xa>
}
    1cde:	4e75           	rts

00001ce0 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    1ce0:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    1ce4:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    1ce8:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    1cec:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    1cf0:	d041           	add.w d1,d0
	swap	d0
    1cf2:	4840           	swap d0
	clrw	d0
    1cf4:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    1cf6:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    1cfa:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    1cfe:	d081           	add.l d1,d0

	rts
    1d00:	4e75           	rts

00001d02 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    1d02:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    1d04:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    1d08:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    1d0c:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    1d12:	6416           	bcc.s 1d2a <__udivsi3+0x28>
	movel	d0, d2
    1d14:	2400           	move.l d0,d2
	clrw	d2
    1d16:	4242           	clr.w d2
	swap	d2
    1d18:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    1d1a:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    1d1c:	3002           	move.w d2,d0
	swap	d0
    1d1e:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    1d20:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    1d24:	84c1           	divu.w d1,d2
	movew	d2, d0
    1d26:	3002           	move.w d2,d0
	jra	6f
    1d28:	6030           	bra.s 1d5a <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    1d2a:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    1d2c:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    1d2e:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    1d30:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    1d36:	64f4           	bcc.s 1d2c <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    1d38:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    1d3a:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    1d40:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    1d42:	c2c0           	mulu.w d0,d1
	swap	d2
    1d44:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    1d46:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    1d48:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    1d4a:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    1d4c:	660a           	bne.s 1d58 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    1d4e:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    1d50:	6506           	bcs.s 1d58 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    1d52:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    1d56:	6302           	bls.s 1d5a <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    1d58:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    1d5a:	241f           	move.l (sp)+,d2
	rts
    1d5c:	4e75           	rts

00001d5e <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    1d5e:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    1d60:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    1d62:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    1d66:	6a04           	bpl.s 1d6c <__divsi3+0xe>
	negl	d1
    1d68:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    1d6a:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    1d6c:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    1d70:	6a04           	bpl.s 1d76 <__divsi3+0x18>
	negl	d0
    1d72:	4480           	neg.l d0
	negb	d2
    1d74:	4402           	neg.b d2

2:	movel	d1, sp@-
    1d76:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1d78:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    1d7a:	6186           	bsr.s 1d02 <__udivsi3>
	addql	IMM (8), sp
    1d7c:	508f           	addq.l #8,sp

	tstb	d2
    1d7e:	4a02           	tst.b d2
	jpl	3f
    1d80:	6a02           	bpl.s 1d84 <__divsi3+0x26>
	negl	d0
    1d82:	4480           	neg.l d0

3:	movel	sp@+, d2
    1d84:	241f           	move.l (sp)+,d2
	rts
    1d86:	4e75           	rts

00001d88 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    1d88:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    1d8c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    1d90:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1d92:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    1d94:	61c8           	bsr.s 1d5e <__divsi3>
	addql	IMM (8), sp
    1d96:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    1d98:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    1d9c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1d9e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    1da0:	6100 ff3e      	bsr.w 1ce0 <__mulsi3>
	addql	IMM (8), sp
    1da4:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    1da6:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    1daa:	9280           	sub.l d0,d1
	movel	d1, d0
    1dac:	2001           	move.l d1,d0
	rts
    1dae:	4e75           	rts

00001db0 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    1db0:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    1db4:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    1db8:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1dba:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    1dbc:	6100 ff44      	bsr.w 1d02 <__udivsi3>
	addql	IMM (8), sp
    1dc0:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    1dc2:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    1dc6:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1dc8:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    1dca:	6100 ff14      	bsr.w 1ce0 <__mulsi3>
	addql	IMM (8), sp
    1dce:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    1dd0:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    1dd4:	9280           	sub.l d0,d1
	movel	d1, d0
    1dd6:	2001           	move.l d1,d0
	rts
    1dd8:	4e75           	rts

00001dda <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    1dda:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    1ddc:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    1de0:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    1de4:	2c5f           	movea.l (sp)+,a6
    rts
    1de6:	4e75           	rts

00001de8 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    1de8:	16c0           	move.b d0,(a3)+
	rts
    1dea:	4e75           	rts

00001dec <saveregs>:
	...

00001e28 <font2distance>:
    1e28:	0505           	btst d2,d5
    1e2a:	0505           	btst d2,d5
    1e2c:	0505           	btst d2,d5
    1e2e:	0505           	btst d2,d5
    1e30:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    1e32:	0505           	btst d2,d5
    1e34:	0505           	btst d2,d5
    1e36:	0005 0505      	ori.b #5,d5
    1e3a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    1e3c:	0505           	btst d2,d5
    1e3e:	0505           	btst d2,d5
    1e40:	0505           	btst d2,d5
    1e42:	0505           	btst d2,d5
    1e44:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    1e46:	0505           	btst d2,d5
    1e48:	0505           	btst d2,d5
    1e4a:	0505           	btst d2,d5
    1e4c:	0505           	btst d2,d5
    1e4e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    1e50:	0500           	btst d2,d0
    1e52:	0505           	btst d2,d5
    1e54:	0505           	btst d2,d5
    1e56:	0505           	btst d2,d5
    1e58:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    1e5a:	0505           	btst d2,d5
    1e5c:	0505           	btst d2,d5
    1e5e:	0505           	btst d2,d5
    1e60:	0505           	btst d2,d5
    1e62:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    1e64:	0505           	btst d2,d5
    1e66:	0505           	btst d2,d5
    1e68:	0503           	btst d2,d3
    1e6a:	0505           	btst d2,d5
    1e6c:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    1e6e:	0505           	btst d2,d5
    1e70:	0500           	btst d2,d0
    1e72:	0505           	btst d2,d5
    1e74:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    1e78:	0505           	btst d2,d5
    1e7a:	0503           	btst d2,d3
    1e7c:	0205 0507      	andi.b #7,d5
    1e80:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    1e82:	0505           	btst d2,d5
    1e84:	0505           	btst d2,d5
    1e86:	0505           	btst d2,d5
    1e88:	0505           	btst d2,d5
    1e8a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1e8c:	0505           	btst d2,d5
    1e8e:	0505           	btst d2,d5
    1e90:	0505           	btst d2,d5
    1e92:	0505           	btst d2,d5
    1e94:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1e96:	0505           	btst d2,d5
    1e98:	0505           	btst d2,d5
    1e9a:	0505           	btst d2,d5
    1e9c:	0505           	btst d2,d5
    1e9e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1ea0:	0505           	btst d2,d5
    1ea2:	0505           	btst d2,d5
    1ea4:	0505           	btst d2,d5
    1ea6:	0505           	btst d2,d5
    1ea8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1eaa:	0505           	btst d2,d5
    1eac:	0505           	btst d2,d5
    1eae:	0505           	btst d2,d5
    1eb0:	0505           	btst d2,d5
    1eb2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1eb4:	0505           	btst d2,d5
    1eb6:	0505           	btst d2,d5
    1eb8:	0505           	btst d2,d5
    1eba:	0505           	btst d2,d5
    1ebc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1ebe:	0505           	btst d2,d5
    1ec0:	0505           	btst d2,d5
    1ec2:	0505           	btst d2,d5
    1ec4:	0505           	btst d2,d5
    1ec6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1ec8:	0505           	btst d2,d5
    1eca:	0505           	btst d2,d5
    1ecc:	0505           	btst d2,d5
    1ece:	0505           	btst d2,d5
    1ed0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1ed2:	0505           	btst d2,d5
    1ed4:	0505           	btst d2,d5
    1ed6:	0505           	btst d2,d5
    1ed8:	0505           	btst d2,d5
    1eda:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1edc:	0505           	btst d2,d5
    1ede:	0505           	btst d2,d5
    1ee0:	0505           	btst d2,d5
    1ee2:	0505           	btst d2,d5
    1ee4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1ee6:	0505           	btst d2,d5
    1ee8:	0505           	btst d2,d5
    1eea:	0505           	btst d2,d5
    1eec:	0505           	btst d2,d5
    1eee:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1ef0:	0505           	btst d2,d5
    1ef2:	0505           	btst d2,d5
    1ef4:	0505           	btst d2,d5
    1ef6:	0505           	btst d2,d5
    1ef8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1efa:	0505           	btst d2,d5
    1efc:	0505           	btst d2,d5
    1efe:	0505           	btst d2,d5
    1f00:	0505           	btst d2,d5
    1f02:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1f04:	0505           	btst d2,d5
    1f06:	0505           	btst d2,d5
    1f08:	0505           	btst d2,d5
    1f0a:	0505           	btst d2,d5
    1f0c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1f0e:	0505           	btst d2,d5
    1f10:	0505           	btst d2,d5
    1f12:	0505           	btst d2,d5
    1f14:	0505           	btst d2,d5
    1f16:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1f18:	0505           	btst d2,d5
    1f1a:	0505           	btst d2,d5
    1f1c:	0505           	btst d2,d5
    1f1e:	0505           	btst d2,d5
    1f20:	0505           	btst d2,d5

00001f22 <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    1f22:	48f9 7fff 0000 	movem.l d0-a6,1dec <saveregs>
    1f28:	1dec 
  lea 0xdff000,a5
    1f2a:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddd6a0>,a5
  move.l sp@(4),a0  //Fontlocation
    1f30:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    1f34:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    1f38:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    1f3c:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    1f3e:	082d 0006 0002 	btst #6,2(a5)

00001f44 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    1f44:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    1f4a:	66f8           	bne.s 1f44 <st2wblit>

00001f4c <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    1f4c:	7019           	moveq #25,d0
	sub.l d5,d5      
    1f4e:	9a85           	sub.l d5,d5

00001f50 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    1f50:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    1f52:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    1f54:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    1f58:	9dce           	suba.l a6,a6
	move.l d2, a6
    1f5a:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    1f5c:	ddfc 0000 1e28 	adda.l #7720,a6

	LSL  	#4,d2 	    //Fetch next char
    1f62:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    1f64:	2842           	movea.l d2,a4


	move.l  #0,d4
    1f66:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    1f68:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    1f6a:	3814           	move.w (a4),d4
	swap	d4
    1f6c:	4844           	swap d4
	lsr.l	d5, d4
    1f6e:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    1f70:	8993           	or.l d4,(a3)
	clr.l	d4
    1f72:	4284           	clr.l d4
	move.w  2(a4), d4
    1f74:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    1f78:	4844           	swap d4
	lsr.l	d5, d4
    1f7a:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    1f7c:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    1f80:	4284           	clr.l d4
	move.w  4(a4), d4
    1f82:	382c 0004      	move.w 4(a4),d4
	swap	d4
    1f86:	4844           	swap d4
	lsr.l	d5, d4
    1f88:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    1f8a:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    1f8e:	4284           	clr.l d4
	move.w  6(a4), d4
    1f90:	382c 0006      	move.w 6(a4),d4
	swap	d4
    1f94:	4844           	swap d4
	lsr.l	d5, d4
    1f96:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    1f98:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    1f9c:	4284           	clr.l d4
	move.w  8(a4), d4
    1f9e:	382c 0008      	move.w 8(a4),d4
	swap	d4
    1fa2:	4844           	swap d4
	lsr.l	d5, d4
    1fa4:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    1fa6:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    1faa:	4284           	clr.l d4
	move.w  10(a4), d4
    1fac:	382c 000a      	move.w 10(a4),d4
	swap	d4
    1fb0:	4844           	swap d4
	lsr.l	d5, d4
    1fb2:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    1fb4:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    1fb8:	4284           	clr.l d4
	move.w  12(a4), d4
    1fba:	382c 000c      	move.w 12(a4),d4
	swap	d4
    1fbe:	4844           	swap d4
	lsr.l	d5, d4
    1fc0:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    1fc2:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    1fc6:	4284           	clr.l d4
	move.w  14(a4), d4
    1fc8:	382c 000e      	move.w 14(a4),d4
	swap	d4
    1fcc:	4844           	swap d4
	lsr.l	d5, d4
    1fce:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    1fd0:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    1fd4:	4284           	clr.l d4

	add.b   (a6), d5
    1fd6:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    1fd8:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    1fdc:	6500 0006      	bcs.w 1fe4 <noadditionalchar>
	addq.w  #1, a3
    1fe0:	524b           	addq.w #1,a3
	sub.w   #8,d5
    1fe2:	5145           	subq.w #8,d5

00001fe4 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    1fe4:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    1fe6:	51c8 ff68      	dbf d0,1f50 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    1fea:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    1fee:	51cb ff5c      	dbf d3,1f4c <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    1ff2:	4cfa 7fff fdf6 	movem.l 1dec <saveregs>(pc),d0-a6

	RTS
    1ff8:	4e75           	rts
