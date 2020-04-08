
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
       6:	518f           	subq.l #8,sp
       8:	48e7 313a      	movem.l d2-d3/d7/a2-a4/a6,-(sp)

  SysBase = *((struct ExecBase**)4UL);
       c:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      10:	23ce 0000 77aa 	move.l a6,77aa <SysBase>
	hw = (struct Custom*)0xdff000;
      16:	23fc 00df f000 	move.l #14675968,779a <hw>
      1c:	0000 779a 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      20:	43f9 0000 51c1 	lea 51c1 <incbin_swfont_end+0x4d7>,a1
      26:	7000           	moveq #0,d0
      28:	4eae fdd8      	jsr -552(a6)
      2c:	23c0 0000 779e 	move.l d0,779e <GfxBase>
	if (!GfxBase)
      32:	6700 0730      	beq.w 764 <main+0x75e>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      36:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
      3c:	43f9 0000 51d2 	lea 51d2 <incbin_swfont_end+0x4e8>,a1
      42:	7000           	moveq #0,d0
      44:	4eae fdd8      	jsr -552(a6)
      48:	23c0 0000 77a6 	move.l d0,77a6 <DOSBase>
	if (!DOSBase)
      4e:	6700 0708      	beq.w 758 <main+0x752>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      52:	4879 0000 51de 	pea 51de <incbin_swfont_end+0x4f4>
      58:	4eb9 0000 0946 	jsr 946 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      5e:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
      64:	4eae ffc4      	jsr -60(a6)
      68:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
      6e:	2200           	move.l d0,d1
      70:	243c 0000 51fa 	move.l #20986,d2
      76:	760f           	moveq #15,d3
      78:	4eae ffd0      	jsr -48(a6)
	Delay(50);
      7c:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
      82:	7232           	moveq #50,d1
      84:	4eae ff3a      	jsr -198(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      88:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
      8e:	4eae ffc4      	jsr -60(a6)
      92:	2079 0000 779a 	movea.l 779a <hw>,a0
      98:	2628 0080      	move.l 128(a0),d3
      9c:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
      a2:	2200           	move.l d0,d1
      a4:	243c 0000 520a 	move.l #21002,d2
      aa:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      ae:	49f9 0000 0c92 	lea c92 <ClBuild>,a4
      b4:	4e94           	jsr (a4)
      b6:	2440           	movea.l d0,a2
      b8:	23c0 0000 778c 	move.l d0,778c <Copperlist1>
  DrawCopper = Copperlist1;
      be:	23c0 0000 7784 	move.l d0,7784 <DrawCopper>
  Copperlist2 = ClBuild();
      c4:	4e94           	jsr (a4)
      c6:	23c0 0000 777e 	move.l d0,777e <Copperlist2>
  ViewCopper = Copperlist2;
      cc:	23c0 0000 7772 	move.l d0,7772 <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      d2:	588f           	addq.l #4,sp
      d4:	2012           	move.l (a2),d0
      d6:	b0b9 0000 73e8 	cmp.l 73e8 <ClsSprites>,d0
      dc:	6600 060c      	bne.w 6ea <main+0x6e4>
      e0:	202a 0004      	move.l 4(a2),d0
      e4:	b0b9 0000 73ec 	cmp.l 73ec <ClsSprites+0x4>,d0
      ea:	6600 05fe      	bne.w 6ea <main+0x6e4>
      ee:	202a 0008      	move.l 8(a2),d0
      f2:	b0b9 0000 73f0 	cmp.l 73f0 <ClsSprites+0x8>,d0
      f8:	6600 05f0      	bne.w 6ea <main+0x6e4>
      fc:	202a 000c      	move.l 12(a2),d0
     100:	b0b9 0000 73f4 	cmp.l 73f4 <ClsSprites+0xc>,d0
     106:	6600 05e2      	bne.w 6ea <main+0x6e4>
     10a:	202a 0010      	move.l 16(a2),d0
     10e:	b0b9 0000 73f8 	cmp.l 73f8 <ClsSprites+0x10>,d0
     114:	6600 05d4      	bne.w 6ea <main+0x6e4>
     118:	202a 0014      	move.l 20(a2),d0
     11c:	b0b9 0000 73fc 	cmp.l 73fc <ClsSprites+0x14>,d0
     122:	6600 05c6      	bne.w 6ea <main+0x6e4>
     126:	202a 0018      	move.l 24(a2),d0
     12a:	b0b9 0000 7400 	cmp.l 7400 <ClsSprites+0x18>,d0
     130:	6600 05b8      	bne.w 6ea <main+0x6e4>
     134:	202a 001c      	move.l 28(a2),d0
     138:	b0b9 0000 7404 	cmp.l 7404 <ClsSprites+0x1c>,d0
     13e:	6600 05aa      	bne.w 6ea <main+0x6e4>
     142:	202a 0020      	move.l 32(a2),d0
     146:	b0b9 0000 7408 	cmp.l 7408 <ClsSprites+0x20>,d0
     14c:	6600 059c      	bne.w 6ea <main+0x6e4>
     150:	202a 0024      	move.l 36(a2),d0
     154:	b0b9 0000 740c 	cmp.l 740c <ClsSprites+0x24>,d0
     15a:	6600 058e      	bne.w 6ea <main+0x6e4>
     15e:	202a 0028      	move.l 40(a2),d0
     162:	b0b9 0000 7410 	cmp.l 7410 <ClsSprites+0x28>,d0
     168:	6600 0580      	bne.w 6ea <main+0x6e4>
     16c:	202a 002c      	move.l 44(a2),d0
     170:	b0b9 0000 7414 	cmp.l 7414 <ClsSprites+0x2c>,d0
     176:	6600 0572      	bne.w 6ea <main+0x6e4>
     17a:	202a 0030      	move.l 48(a2),d0
     17e:	b0b9 0000 7418 	cmp.l 7418 <ClsSprites+0x30>,d0
     184:	6600 0564      	bne.w 6ea <main+0x6e4>
     188:	202a 0034      	move.l 52(a2),d0
     18c:	b0b9 0000 741c 	cmp.l 741c <ClsSprites+0x34>,d0
     192:	6600 0556      	bne.w 6ea <main+0x6e4>
     196:	202a 0038      	move.l 56(a2),d0
     19a:	b0b9 0000 7420 	cmp.l 7420 <ClsSprites+0x38>,d0
     1a0:	6600 0548      	bne.w 6ea <main+0x6e4>
     1a4:	246a 003c      	movea.l 60(a2),a2
     1a8:	b5f9 0000 7424 	cmpa.l 7424 <ClsSprites+0x3c>,a2
     1ae:	6600 053a      	bne.w 6ea <main+0x6e4>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1b2:	2079 0000 778c 	movea.l 778c <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1b8:	2039 0000 73b8 	move.l 73b8 <ClScreen>,d0
     1be:	b0a8 0040      	cmp.l 64(a0),d0
     1c2:	6600 0548      	bne.w 70c <main+0x706>
     1c6:	2039 0000 73bc 	move.l 73bc <ClScreen+0x4>,d0
     1cc:	b0a8 0044      	cmp.l 68(a0),d0
     1d0:	6600 053a      	bne.w 70c <main+0x706>
     1d4:	2039 0000 73c0 	move.l 73c0 <ClScreen+0x8>,d0
     1da:	b0a8 0048      	cmp.l 72(a0),d0
     1de:	6600 052c      	bne.w 70c <main+0x706>
     1e2:	2028 004c      	move.l 76(a0),d0
     1e6:	b0b9 0000 73c4 	cmp.l 73c4 <ClScreen+0xc>,d0
     1ec:	6600 051e      	bne.w 70c <main+0x706>
     1f0:	2028 0050      	move.l 80(a0),d0
     1f4:	b0b9 0000 73c8 	cmp.l 73c8 <ClScreen+0x10>,d0
     1fa:	6600 0510      	bne.w 70c <main+0x706>
     1fe:	2028 0054      	move.l 84(a0),d0
     202:	b0b9 0000 73cc 	cmp.l 73cc <ClScreen+0x14>,d0
     208:	6600 0502      	bne.w 70c <main+0x706>
     20c:	2028 0058      	move.l 88(a0),d0
     210:	b0b9 0000 73d0 	cmp.l 73d0 <ClScreen+0x18>,d0
     216:	6600 04f4      	bne.w 70c <main+0x706>
     21a:	2028 005c      	move.l 92(a0),d0
     21e:	b0b9 0000 73d4 	cmp.l 73d4 <ClScreen+0x1c>,d0
     224:	6600 04e6      	bne.w 70c <main+0x706>
     228:	2028 0060      	move.l 96(a0),d0
     22c:	b0b9 0000 73d8 	cmp.l 73d8 <ClScreen+0x20>,d0
     232:	6600 04d8      	bne.w 70c <main+0x706>
     236:	2028 0064      	move.l 100(a0),d0
     23a:	b0b9 0000 73dc 	cmp.l 73dc <ClScreen+0x24>,d0
     240:	6600 04ca      	bne.w 70c <main+0x706>
     244:	2028 0068      	move.l 104(a0),d0
     248:	b0b9 0000 73e0 	cmp.l 73e0 <ClScreen+0x28>,d0
     24e:	6600 04bc      	bne.w 70c <main+0x706>
     252:	2068 006c      	movea.l 108(a0),a0
     256:	b1f9 0000 73e4 	cmpa.l 73e4 <ClScreen+0x2c>,a0
     25c:	6600 04ae      	bne.w 70c <main+0x706>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     260:	23fc 0004 0000 	move.l #262144,7792 <DrawBuffer>
     266:	0000 7792 
  ViewBuffer = (ULONG *)0x50000;
     26a:	23fc 0005 0000 	move.l #327680,7788 <ViewBuffer>
     270:	0000 7788 
  
  SetBplPointers();
     274:	45f9 0000 17fc 	lea 17fc <SetBplPointers>,a2
     27a:	4e92           	jsr (a2)
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     27c:	0cb9 0005 0000 	cmpi.l #327680,7792 <DrawBuffer>
     282:	0000 7792 
     286:	6700 059a      	beq.w 822 <main+0x81c>
    Write( Output(), 
     28a:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     290:	4eae ffc4      	jsr -60(a6)
     294:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     29a:	2200           	move.l d0,d1
     29c:	243c 0000 520d 	move.l #21005,d2
     2a2:	763b           	moveq #59,d3
     2a4:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     2a8:	2079 0000 778c 	movea.l 778c <Copperlist1>,a0
     2ae:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2b4:	0070 
     2b6:	6724           	beq.s 2dc <main+0x2d6>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2b8:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     2be:	4eae ffc4      	jsr -60(a6)
     2c2:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     2c8:	2200           	move.l d0,d1
     2ca:	243c 0000 4f0b 	move.l #20235,d2
     2d0:	763c           	moveq #60,d3
     2d2:	4eae ffd0      	jsr -48(a6)
     2d6:	2079 0000 778c 	movea.l 778c <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2dc:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2e2:	0074 
     2e4:	6724           	beq.s 30a <main+0x304>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2e6:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     2ec:	4eae ffc4      	jsr -60(a6)
     2f0:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     2f6:	2200           	move.l d0,d1
     2f8:	243c 0000 4f48 	move.l #20296,d2
     2fe:	763c           	moveq #60,d3
     300:	4eae ffd0      	jsr -48(a6)
     304:	2079 0000 778c 	movea.l 778c <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     30a:	2028 0078      	move.l 120(a0),d0
     30e:	b0b9 0000 73b0 	cmp.l 73b0 <ClColor>,d0
     314:	6600 053c      	bne.w 852 <main+0x84c>
     318:	2028 007c      	move.l 124(a0),d0
     31c:	b0b9 0000 73b4 	cmp.l 73b4 <ClColor+0x4>,d0
     322:	6600 052e      	bne.w 852 <main+0x84c>
  if( instructions[pos] == value ) 
     326:	70fe           	moveq #-2,d0
     328:	b0a8 0080      	cmp.l 128(a0),d0
     32c:	671e           	beq.s 34c <main+0x346>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     32e:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     334:	4eae ffc4      	jsr -60(a6)
     338:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     33e:	2200           	move.l d0,d1
     340:	243c 0000 5021 	move.l #20513,d2
     346:	7622           	moveq #34,d3
     348:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     34c:	47f9 0000 15f4 	lea 15f4 <SwapCl>,a3
     352:	4e93           	jsr (a3)
  
  if( DrawCopper != Copperlist2)
     354:	2039 0000 7784 	move.l 7784 <DrawCopper>,d0
     35a:	b0b9 0000 777e 	cmp.l 777e <Copperlist2>,d0
     360:	671e           	beq.s 380 <main+0x37a>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     362:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     368:	4eae ffc4      	jsr -60(a6)
     36c:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     372:	2200           	move.l d0,d1
     374:	243c 0000 5249 	move.l #21065,d2
     37a:	7615           	moveq #21,d3
     37c:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild( );
     380:	4e94           	jsr (a4)
     382:	23c0 0000 778c 	move.l d0,778c <Copperlist1>
  Copperlist2 = ClBuild( );
     388:	4e94           	jsr (a4)
     38a:	23c0 0000 777e 	move.l d0,777e <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
     390:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
     396:	203c 0000 c800 	move.l #51200,d0
     39c:	7202           	moveq #2,d1
     39e:	4eae ff3a      	jsr -198(a6)
     3a2:	23c0 0000 777a 	move.l d0,777a <Bitplane1>
  if(Bitplane1 == 0) {
     3a8:	6700 0418      	beq.w 7c2 <main+0x7bc>
  ViewBuffer = Bitplane1;
     3ac:	23c0 0000 7788 	move.l d0,7788 <ViewBuffer>
  ViewCopper = Copperlist1;
     3b2:	23f9 0000 778c 	move.l 778c <Copperlist1>,7772 <ViewCopper>
     3b8:	0000 7772 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
     3bc:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
     3c2:	203c 0000 c800 	move.l #51200,d0
     3c8:	7202           	moveq #2,d1
     3ca:	4eae ff3a      	jsr -198(a6)
     3ce:	23c0 0000 7776 	move.l d0,7776 <Bitplane2>
  if(Bitplane2 == 0) {
     3d4:	6700 03b8      	beq.w 78e <main+0x788>
  DrawBuffer = Bitplane2;
     3d8:	23c0 0000 7792 	move.l d0,7792 <DrawBuffer>
  DrawCopper = Copperlist2;
     3de:	23f9 0000 777e 	move.l 777e <Copperlist2>,7784 <DrawCopper>
     3e4:	0000 7784 
    Write( Output(), 
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
     3e8:	2039 0000 7788 	move.l 7788 <ViewBuffer>,d0
     3ee:	b0b9 0000 777a 	cmp.l 777a <Bitplane1>,d0
     3f4:	671e           	beq.s 414 <main+0x40e>
    Write( Output(), 
     3f6:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     3fc:	4eae ffc4      	jsr -60(a6)
     400:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     406:	2200           	move.l d0,d1
     408:	243c 0000 525f 	move.l #21087,d2
     40e:	7638           	moveq #56,d3
     410:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
     414:	2039 0000 7772 	move.l 7772 <ViewCopper>,d0
     41a:	b0b9 0000 778c 	cmp.l 778c <Copperlist1>,d0
     420:	671e           	beq.s 440 <main+0x43a>
    Write( Output(), 
     422:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     428:	4eae ffc4      	jsr -60(a6)
     42c:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     432:	2200           	move.l d0,d1
     434:	243c 0000 5298 	move.l #21144,d2
     43a:	763a           	moveq #58,d3
     43c:	4eae ffd0      	jsr -48(a6)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  SetBplPointers();
     440:	4e92           	jsr (a2)
  SwapCl();
     442:	4e93           	jsr (a3)
  UWORD *copword = ViewCopper;
     444:	2079 0000 7772 	movea.l 7772 <ViewCopper>,a0
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     44a:	7000           	moveq #0,d0
     44c:	3028 0072      	move.w 114(a0),d0
     450:	4840           	swap d0
     452:	4240           	clr.w d0
     454:	7200           	moveq #0,d1
     456:	3228 0076      	move.w 118(a0),d1
     45a:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     45c:	b0b9 0000 7776 	cmp.l 7776 <Bitplane2>,d0
     462:	671e           	beq.s 482 <main+0x47c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     464:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     46a:	4eae ffc4      	jsr -60(a6)
     46e:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     474:	2200           	move.l d0,d1
     476:	243c 0000 52d3 	move.l #21203,d2
     47c:	7648           	moveq #72,d3
     47e:	4eae ffd0      	jsr -48(a6)
                                                   " after first frame.\n", 72);
  SetBplPointers();
     482:	4e92           	jsr (a2)
  SwapCl();
     484:	4e93           	jsr (a3)

  copword = (UWORD *) ViewCopper;
     486:	2079 0000 7772 	movea.l 7772 <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     48c:	7000           	moveq #0,d0
     48e:	3028 0072      	move.w 114(a0),d0
     492:	4840           	swap d0
     494:	4240           	clr.w d0
     496:	7200           	moveq #0,d1
     498:	3228 0076      	move.w 118(a0),d1
     49c:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     49e:	b0b9 0000 777a 	cmp.l 777a <Bitplane1>,d0
     4a4:	671e           	beq.s 4c4 <main+0x4be>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     4a6:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     4ac:	4eae ffc4      	jsr -60(a6)
     4b0:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     4b6:	2200           	move.l d0,d1
     4b8:	243c 0000 531c 	move.l #21276,d2
     4be:	7649           	moveq #73,d3
     4c0:	4eae ffd0      	jsr -48(a6)
                                                  " after second frame.\n", 73);
  
  SetBplPointers();
     4c4:	4e92           	jsr (a2)
  SwapCl();
     4c6:	4e93           	jsr (a3)

  copword = (UWORD *) ViewCopper;
     4c8:	2079 0000 7772 	movea.l 7772 <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     4ce:	7000           	moveq #0,d0
     4d0:	3028 0072      	move.w 114(a0),d0
     4d4:	4840           	swap d0
     4d6:	4240           	clr.w d0
     4d8:	7200           	moveq #0,d1
     4da:	3228 0076      	move.w 118(a0),d1
     4de:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4e0:	b0b9 0000 7776 	cmp.l 7776 <Bitplane2>,d0
     4e6:	671e           	beq.s 506 <main+0x500>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4e8:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     4ee:	4eae ffc4      	jsr -60(a6)
     4f2:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     4f8:	2200           	move.l d0,d1
     4fa:	243c 0000 5366 	move.l #21350,d2
     500:	7648           	moveq #72,d3
     502:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     506:	2f3c 0000 c800 	move.l #51200,-(sp)
     50c:	4878 0084      	pea 84 <main+0x7e>
     510:	4eb9 0000 1828 	jsr 1828 <FreeDisplay>
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    ZoomTest();
     516:	4eb9 0000 18e0 	jsr 18e0 <ZoomTest>

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
     51c:	247c 00f0 ff60 	movea.l #15794016,a2
     522:	508f           	addq.l #8,sp
     524:	4a92           	tst.l (a2)
     526:	6718           	beq.s 540 <main+0x53a>
     528:	4878 0001      	pea 1 <_start+0x1>
     52c:	47f9 0000 08a4 	lea 8a4 <warpmode.part.0>,a3
     532:	4e93           	jsr (a3)
     534:	588f           	addq.l #4,sp
     536:	4a92           	tst.l (a2)
     538:	6706           	beq.s 540 <main+0x53a>
     53a:	42a7           	clr.l -(sp)
     53c:	4e93           	jsr (a3)
     53e:	588f           	addq.l #4,sp
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
     540:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
     546:	23ee 0022 0000 	move.l 34(a6),7760 <ActiView>
     54c:	7760 
	OwnBlitter();
     54e:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     552:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
     558:	4eae ff1c      	jsr -228(a6)
	Disable();
     55c:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
     562:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
     566:	2679 0000 779a 	movea.l 779a <hw>,a3
     56c:	302b 0010      	move.w 16(a3),d0
     570:	33c0 0000 7764 	move.w d0,7764 <SystemADKCON>
	SystemInts=hw->intenar;
     576:	302b 001c      	move.w 28(a3),d0
     57a:	33c0 0000 7768 	move.w d0,7768 <SystemInts>
	SystemDMA=hw->dmaconr;
     580:	302b 0002      	move.w 2(a3),d0
     584:	33c0 0000 7766 	move.w d0,7766 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
     58a:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     590:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
     596:	45f9 0000 189a 	lea 189a <WaitVbl>,a2
     59c:	4e92           	jsr (a2)
	WaitVbl();
     59e:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
     5a0:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
     5a6:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
     5ac:	93c9           	suba.l a1,a1
     5ae:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     5b2:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
     5b8:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     5bc:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
     5c2:	4eae fef2      	jsr -270(a6)

	WaitVbl();
     5c6:	4e92           	jsr (a2)
	WaitVbl();
     5c8:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     5ca:	3f7c 4e7a 001e 	move.w #20090,30(sp)
     5d0:	3f7c 0801 0020 	move.w #2049,32(sp)
     5d6:	3f7c 4e73 0022 	move.w #20083,34(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     5dc:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
     5e2:	082e 0000 0129 	btst #0,297(a6)
     5e8:	6700 0290      	beq.w 87a <main+0x874>
		vbr = (APTR)Supervisor((void*)getvbr);
     5ec:	7e1e           	moveq #30,d7
     5ee:	de8f           	add.l sp,d7
     5f0:	cf8d           	exg d7,a5
     5f2:	4eae ffe2      	jsr -30(a6)
     5f6:	cf8d           	exg d7,a5

	VBR=GetVBR();
     5f8:	23c0 0000 776a 	move.l d0,776a <VBR.lto_priv.3>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     5fe:	2079 0000 776a 	movea.l 776a <VBR.lto_priv.3>,a0
     604:	2668 006c      	movea.l 108(a0),a3
	SystemIrq=GetInterruptHandler(); //store interrupt register
     608:	23cb 0000 776e 	move.l a3,776e <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
     60e:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
     610:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     612:	2079 0000 779a 	movea.l 779a <hw>,a0
     618:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     61c:	3028 0002      	move.w 2(a0),d0
     620:	0800 000e      	btst #14,d0
     624:	66f6           	bne.s 61c <main+0x616>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
     626:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     62c:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
     632:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     638:	2279 0000 776a 	movea.l 776a <VBR.lto_priv.3>,a1
     63e:	234b 006c      	move.l a3,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
     642:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
     648:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
     64e:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
     654:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
     65a:	3039 0000 7768 	move.w 7768 <SystemInts>,d0
     660:	0040 8000      	ori.w #-32768,d0
     664:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
     668:	3039 0000 7766 	move.w 7766 <SystemDMA>,d0
     66e:	0040 8000      	ori.w #-32768,d0
     672:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
     676:	3039 0000 7764 	move.w 7764 <SystemADKCON>,d0
     67c:	0040 8000      	ori.w #-32768,d0
     680:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
     684:	2279 0000 7760 	movea.l 7760 <ActiView>,a1
     68a:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     68e:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
     694:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     698:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
     69e:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     6a2:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
     6a8:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     6ac:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
     6b2:	4eae fe32      	jsr -462(a6)
	Enable();
     6b6:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
     6bc:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
     6c0:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
     6c6:	2279 0000 77a6 	movea.l 77a6 <DOSBase>,a1
     6cc:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     6d0:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
     6d6:	2279 0000 779e 	movea.l 779e <GfxBase>,a1
     6dc:	4eae fe62      	jsr -414(a6)
}
     6e0:	7000           	moveq #0,d0
     6e2:	4cdf 5c8c      	movem.l (sp)+,d2-d3/d7/a2-a4/a6
     6e6:	508f           	addq.l #8,sp
     6e8:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     6ea:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     6f0:	4eae ffc4      	jsr -60(a6)
     6f4:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     6fa:	2200           	move.l d0,d1
     6fc:	243c 0000 4e9e 	move.l #20126,d2
     702:	762c           	moveq #44,d3
     704:	4eae ffd0      	jsr -48(a6)
     708:	6000 faa8      	bra.w 1b2 <main+0x1ac>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
     70c:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     712:	4eae ffc4      	jsr -60(a6)
     716:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     71c:	2200           	move.l d0,d1
     71e:	243c 0000 4ed4 	move.l #20180,d2
     724:	7636           	moveq #54,d3
     726:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
     72a:	23fc 0004 0000 	move.l #262144,7792 <DrawBuffer>
     730:	0000 7792 
  ViewBuffer = (ULONG *)0x50000;
     734:	23fc 0005 0000 	move.l #327680,7788 <ViewBuffer>
     73a:	0000 7788 
  SetBplPointers();
     73e:	45f9 0000 17fc 	lea 17fc <SetBplPointers>,a2
     744:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     746:	0cb9 0005 0000 	cmpi.l #327680,7792 <DrawBuffer>
     74c:	0000 7792 
     750:	6600 fb38      	bne.w 28a <main+0x284>
     754:	6000 00cc      	bra.w 822 <main+0x81c>
		Exit(0);
     758:	9dce           	suba.l a6,a6
     75a:	7200           	moveq #0,d1
     75c:	4eae ff70      	jsr -144(a6)
     760:	6000 f8f0      	bra.w 52 <main+0x4c>
		Exit(0);
     764:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     76a:	7200           	moveq #0,d1
     76c:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     770:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
     776:	43f9 0000 51d2 	lea 51d2 <incbin_swfont_end+0x4e8>,a1
     77c:	7000           	moveq #0,d0
     77e:	4eae fdd8      	jsr -552(a6)
     782:	23c0 0000 77a6 	move.l d0,77a6 <DOSBase>
	if (!DOSBase)
     788:	6600 f8c8      	bne.w 52 <main+0x4c>
     78c:	60ca           	bra.s 758 <main+0x752>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     78e:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     794:	4eae ffc4      	jsr -60(a6)
     798:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     79e:	2200           	move.l d0,d1
     7a0:	243c 0000 4dd6 	move.l #19926,d2
     7a6:	7626           	moveq #38,d3
     7a8:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     7ac:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     7b2:	7201           	moveq #1,d1
     7b4:	4eae ff70      	jsr -144(a6)
     7b8:	2039 0000 7776 	move.l 7776 <Bitplane2>,d0
     7be:	6000 fc18      	bra.w 3d8 <main+0x3d2>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     7c2:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     7c8:	4eae ffc4      	jsr -60(a6)
     7cc:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     7d2:	2200           	move.l d0,d1
     7d4:	243c 0000 4daf 	move.l #19887,d2
     7da:	7626           	moveq #38,d3
     7dc:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     7e0:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     7e6:	7201           	moveq #1,d1
     7e8:	4eae ff70      	jsr -144(a6)
     7ec:	2039 0000 777a 	move.l 777a <Bitplane1>,d0
  ViewBuffer = Bitplane1;
     7f2:	23c0 0000 7788 	move.l d0,7788 <ViewBuffer>
  ViewCopper = Copperlist1;
     7f8:	23f9 0000 778c 	move.l 778c <Copperlist1>,7772 <ViewCopper>
     7fe:	0000 7772 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
     802:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
     808:	203c 0000 c800 	move.l #51200,d0
     80e:	7202           	moveq #2,d1
     810:	4eae ff3a      	jsr -198(a6)
     814:	23c0 0000 7776 	move.l d0,7776 <Bitplane2>
  if(Bitplane2 == 0) {
     81a:	6600 fbbc      	bne.w 3d8 <main+0x3d2>
     81e:	6000 ff6e      	bra.w 78e <main+0x788>
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     822:	0cb9 0004 0000 	cmpi.l #262144,7788 <ViewBuffer>
     828:	0000 7788 
     82c:	6700 fa7a      	beq.w 2a8 <main+0x2a2>
    Write( Output(), 
     830:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     836:	4eae ffc4      	jsr -60(a6)
     83a:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     840:	2200           	move.l d0,d1
     842:	243c 0000 520d 	move.l #21005,d2
     848:	763b           	moveq #59,d3
     84a:	4eae ffd0      	jsr -48(a6)
     84e:	6000 fa58      	bra.w 2a8 <main+0x2a2>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     852:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     858:	4eae ffc4      	jsr -60(a6)
     85c:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     862:	2200           	move.l d0,d1
     864:	243c 0000 4fff 	move.l #20479,d2
     86a:	7621           	moveq #33,d3
     86c:	4eae ffd0      	jsr -48(a6)
     870:	2079 0000 778c 	movea.l 778c <Copperlist1>,a0
     876:	6000 faae      	bra.w 326 <main+0x320>
	APTR vbr = 0;
     87a:	7000           	moveq #0,d0
	VBR=GetVBR();
     87c:	23c0 0000 776a 	move.l d0,776a <VBR.lto_priv.3>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     882:	2079 0000 776a 	movea.l 776a <VBR.lto_priv.3>,a0
     888:	2668 006c      	movea.l 108(a0),a3
	SystemIrq=GetInterruptHandler(); //store interrupt register
     88c:	23cb 0000 776e 	move.l a3,776e <SystemIrq>
	WaitVbl();
     892:	4e92           	jsr (a2)
	WaitVbl();
     894:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     896:	2079 0000 779a 	movea.l 779a <hw>,a0
     89c:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     8a0:	6000 fd7a      	bra.w 61c <main+0x616>

000008a4 <warpmode.part.0>:
void warpmode(int on) 
     8a4:	598f           	subq.l #4,sp
     8a6:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     8a8:	4aaf 000c      	tst.l 12(sp)
     8ac:	674c           	beq.s 8fa <warpmode.part.0+0x56>
     8ae:	4878 0001      	pea 1 <_start+0x1>
     8b2:	740b           	moveq #11,d2
     8b4:	d48f           	add.l sp,d2
     8b6:	2f02           	move.l d2,-(sp)
     8b8:	42a7           	clr.l -(sp)
     8ba:	4879 0000 4d1e 	pea 4d1e <incbin_swfont_end+0x34>
     8c0:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdbbad>
     8c4:	4878 0052      	pea 52 <main+0x4c>
     8c8:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeebb0e>
     8ce:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     8d2:	203c 0000 4d04 	move.l #19716,d0
     8d8:	4878 0001      	pea 1 <_start+0x1>
     8dc:	2f02           	move.l d2,-(sp)
     8de:	42a7           	clr.l -(sp)
     8e0:	2f00           	move.l d0,-(sp)
     8e2:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdbbad>
     8e6:	4878 0052      	pea 52 <main+0x4c>
     8ea:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeebb0e>
	}
}
     8f0:	4fef 0018      	lea 24(sp),sp
     8f4:	241f           	move.l (sp)+,d2
     8f6:	588f           	addq.l #4,sp
     8f8:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     8fa:	4878 0001      	pea 1 <_start+0x1>
     8fe:	740b           	moveq #11,d2
     900:	d48f           	add.l sp,d2
     902:	2f02           	move.l d2,-(sp)
     904:	42a7           	clr.l -(sp)
     906:	4879 0000 4d28 	pea 4d28 <incbin_swfont_end+0x3e>
     90c:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdbbad>
     910:	4878 0052      	pea 52 <main+0x4c>
     914:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeebb0e>
     91a:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     91e:	203c 0000 4ceb 	move.l #19691,d0
     924:	4878 0001      	pea 1 <_start+0x1>
     928:	2f02           	move.l d2,-(sp)
     92a:	42a7           	clr.l -(sp)
     92c:	2f00           	move.l d0,-(sp)
     92e:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdbbad>
     932:	4878 0052      	pea 52 <main+0x4c>
     936:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeebb0e>
}
     93c:	4fef 0018      	lea 24(sp),sp
     940:	241f           	move.l (sp)+,d2
     942:	588f           	addq.l #4,sp
     944:	4e75           	rts

00000946 <KPrintF>:
{
     946:	4fef ff80      	lea -128(sp),sp
     94a:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
     94e:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeebb0e>
     954:	6734           	beq.s 98a <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
     956:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
     95c:	206f 0090      	movea.l 144(sp),a0
     960:	43ef 0094      	lea 148(sp),a1
     964:	45f9 0000 4524 	lea 4524 <PutChar>,a2
     96a:	47ef 000c      	lea 12(sp),a3
     96e:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
     972:	2f0b           	move.l a3,-(sp)
     974:	4878 0056      	pea 56 <main+0x50>
     978:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeebb0e>
     97e:	508f           	addq.l #8,sp
}
     980:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     984:	4fef 0080      	lea 128(sp),sp
     988:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
     98a:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
     990:	206f 0090      	movea.l 144(sp),a0
     994:	43ef 0094      	lea 148(sp),a1
     998:	45f9 0000 4516 	lea 4516 <KPutCharX>,a2
     99e:	97cb           	suba.l a3,a3
     9a0:	4eae fdf6      	jsr -522(a6)
}
     9a4:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     9a8:	4fef 0080      	lea 128(sp),sp
     9ac:	4e75           	rts

000009ae <TestRow>:
  FreeMem( source, (ZMLINESIZE+4)*272);
  FreeMem( destination, (ZMLINESIZE+4)*272);
}

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
     9ae:	4fef ff94      	lea -108(sp),sp
     9b2:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
     9b6:	2f6f 00a4 002c 	move.l 164(sp),44(sp)
     9bc:	3c2f 002e      	move.w 46(sp),d6
  
  char str[ 100] = { 0 };
     9c0:	7a34           	moveq #52,d5
     9c2:	da8f           	add.l sp,d5
     9c4:	4878 0064      	pea 64 <main+0x5e>
     9c8:	42a7           	clr.l -(sp)
     9ca:	2f05           	move.l d5,-(sp)
     9cc:	4eba 396a      	jsr 4338 <memset>(pc)
  UWORD data[2];
  data[1] = numberofline;
     9d0:	3f6f 00b6 003e 	move.w 182(sp),62(sp)
     9d6:	4fef 000c      	lea 12(sp),sp

  testpattern += 0;
  destination += 0;
     9da:	2a6f 00a0      	movea.l 160(sp),a5
  testpattern += 0;
     9de:	286f 009c      	movea.l 156(sp),a4

  for(int i=0;i<21;i++) {
     9e2:	7800           	moveq #0,d4
    if( (*testpattern++ ^ xormask) != *destination++) {
      data[0] = i;
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
     9e4:	2e3c 0000 4d33 	move.l #19763,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
     9ea:	301c           	move.w (a4)+,d0
     9ec:	bd40           	eor.w d6,d0
     9ee:	b05d           	cmp.w (a5)+,d0
     9f0:	6736           	beq.s a28 <TestRow+0x7a>
      data[0] = i;
     9f2:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
     9f6:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
     9fc:	2047           	movea.l d7,a0
     9fe:	43ef 0030      	lea 48(sp),a1
     a02:	45f9 0000 4524 	lea 4524 <PutChar>,a2
     a08:	2645           	movea.l d5,a3
     a0a:	4eae fdf6      	jsr -522(a6)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
     a0e:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     a14:	4eae ffc4      	jsr -60(a6)
     a18:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     a1e:	2200           	move.l d0,d1
     a20:	2405           	move.l d5,d2
     a22:	7664           	moveq #100,d3
     a24:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
     a28:	5284           	addq.l #1,d4
     a2a:	7015           	moveq #21,d0
     a2c:	b084           	cmp.l d4,d0
     a2e:	66ba           	bne.s 9ea <TestRow+0x3c>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
     a30:	206f 00a0      	movea.l 160(sp),a0
     a34:	3028 002a      	move.w 42(a0),d0
     a38:	322f 002e      	move.w 46(sp),d1
     a3c:	b340           	eor.w d1,d0
     a3e:	206f 009c      	movea.l 156(sp),a0
     a42:	3228 002a      	move.w 42(a0),d1
     a46:	b340           	eor.w d1,d0
     a48:	0240 ff00      	andi.w #-256,d0
     a4c:	660a           	bne.s a58 <TestRow+0xaa>
    Write(  Output(), str, 100);
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
     
  }
}
     a4e:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
     a52:	4fef 006c      	lea 108(sp),sp
     a56:	4e75           	rts
    data[0] = 21;
     a58:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
     a5e:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
     a64:	41f9 0000 4d33 	lea 4d33 <incbin_swfont_end+0x49>,a0
     a6a:	43ef 0030      	lea 48(sp),a1
     a6e:	45f9 0000 4524 	lea 4524 <PutChar>,a2
     a74:	47ef 0034      	lea 52(sp),a3
     a78:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
     a7c:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     a82:	4eae ffc4      	jsr -60(a6)
     a86:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     a8c:	2200           	move.l d0,d1
     a8e:	240b           	move.l a3,d2
     a90:	7664           	moveq #100,d3
     a92:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
     a96:	206f 00a0      	movea.l 160(sp),a0
     a9a:	7000           	moveq #0,d0
     a9c:	3028 002a      	move.w 42(a0),d0
     aa0:	2f00           	move.l d0,-(sp)
     aa2:	206f 00a0      	movea.l 160(sp),a0
     aa6:	3028 002a      	move.w 42(a0),d0
     aaa:	2f00           	move.l d0,-(sp)
     aac:	4879 0000 4d63 	pea 4d63 <incbin_swfont_end+0x79>
     ab2:	4eba fe92      	jsr 946 <KPrintF>(pc)
     ab6:	4fef 000c      	lea 12(sp),sp
}
     aba:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
     abe:	4fef 006c      	lea 108(sp),sp
     ac2:	4e75           	rts

00000ac4 <Vblankcounter>:
  Counter4Frames++;
     ac4:	52b9 0000 77a2 	addq.l #1,77a2 <Counter4Frames>
}
     aca:	4e75           	rts

00000acc <TestCopperlistPos>:
  if( instructions[pos] == value ) 
     acc:	202f 0008      	move.l 8(sp),d0
     ad0:	d080           	add.l d0,d0
     ad2:	d080           	add.l d0,d0
     ad4:	206f 0004      	movea.l 4(sp),a0
     ad8:	2030 0800      	move.l (0,a0,d0.l),d0
     adc:	b0af 000c      	cmp.l 12(sp),d0
     ae0:	57c0           	seq d0
     ae2:	4880           	ext.w d0
     ae4:	48c0           	ext.l d0
}
     ae6:	4480           	neg.l d0
     ae8:	4e75           	rts

00000aea <TestCopperlistBatch>:
                                                                  long length) {
     aea:	48e7 2030      	movem.l d2/a2-a3,-(sp)
     aee:	246f 0010      	movea.l 16(sp),a2
     af2:	206f 0014      	movea.l 20(sp),a0
     af6:	226f 0018      	movea.l 24(sp),a1
     afa:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
     afe:	2008           	move.l a0,d0
     b00:	d088           	add.l a0,d0
     b02:	d080           	add.l d0,d0
     b04:	2411           	move.l (a1),d2
     b06:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
     b0a:	6600 017e      	bne.w c8a <TestCopperlistBatch+0x1a0>
     b0e:	2008           	move.l a0,d0
     b10:	5280           	addq.l #1,d0
     b12:	d080           	add.l d0,d0
     b14:	d080           	add.l d0,d0
     b16:	2032 0800      	move.l (0,a2,d0.l),d0
     b1a:	b0a9 0004      	cmp.l 4(a1),d0
     b1e:	6600 016a      	bne.w c8a <TestCopperlistBatch+0x1a0>
  for( int i=0;i<length;i++)
     b22:	7002           	moveq #2,d0
     b24:	b081           	cmp.l d1,d0
     b26:	6700 015a      	beq.w c82 <TestCopperlistBatch+0x198>
    if( instructions[ pos+i] != batch[ i])
     b2a:	2008           	move.l a0,d0
     b2c:	5480           	addq.l #2,d0
     b2e:	d080           	add.l d0,d0
     b30:	d080           	add.l d0,d0
     b32:	2032 0800      	move.l (0,a2,d0.l),d0
     b36:	b0a9 0008      	cmp.l 8(a1),d0
     b3a:	6600 014e      	bne.w c8a <TestCopperlistBatch+0x1a0>
     b3e:	2008           	move.l a0,d0
     b40:	5680           	addq.l #3,d0
     b42:	d080           	add.l d0,d0
     b44:	d080           	add.l d0,d0
     b46:	2032 0800      	move.l (0,a2,d0.l),d0
     b4a:	b0a9 000c      	cmp.l 12(a1),d0
     b4e:	6600 013a      	bne.w c8a <TestCopperlistBatch+0x1a0>
  for( int i=0;i<length;i++)
     b52:	7404           	moveq #4,d2
     b54:	b481           	cmp.l d1,d2
     b56:	6700 012a      	beq.w c82 <TestCopperlistBatch+0x198>
    if( instructions[ pos+i] != batch[ i])
     b5a:	2008           	move.l a0,d0
     b5c:	5880           	addq.l #4,d0
     b5e:	d080           	add.l d0,d0
     b60:	d080           	add.l d0,d0
     b62:	2032 0800      	move.l (0,a2,d0.l),d0
     b66:	b0a9 0010      	cmp.l 16(a1),d0
     b6a:	6600 011e      	bne.w c8a <TestCopperlistBatch+0x1a0>
     b6e:	2008           	move.l a0,d0
     b70:	5a80           	addq.l #5,d0
     b72:	d080           	add.l d0,d0
     b74:	d080           	add.l d0,d0
     b76:	2032 0800      	move.l (0,a2,d0.l),d0
     b7a:	b0a9 0014      	cmp.l 20(a1),d0
     b7e:	6600 010a      	bne.w c8a <TestCopperlistBatch+0x1a0>
  for( int i=0;i<length;i++)
     b82:	7006           	moveq #6,d0
     b84:	b081           	cmp.l d1,d0
     b86:	6700 00fa      	beq.w c82 <TestCopperlistBatch+0x198>
    if( instructions[ pos+i] != batch[ i])
     b8a:	2008           	move.l a0,d0
     b8c:	5c80           	addq.l #6,d0
     b8e:	d080           	add.l d0,d0
     b90:	d080           	add.l d0,d0
     b92:	2032 0800      	move.l (0,a2,d0.l),d0
     b96:	b0a9 0018      	cmp.l 24(a1),d0
     b9a:	6600 00ee      	bne.w c8a <TestCopperlistBatch+0x1a0>
     b9e:	2008           	move.l a0,d0
     ba0:	5e80           	addq.l #7,d0
     ba2:	d080           	add.l d0,d0
     ba4:	d080           	add.l d0,d0
     ba6:	2032 0800      	move.l (0,a2,d0.l),d0
     baa:	b0a9 001c      	cmp.l 28(a1),d0
     bae:	6600 00da      	bne.w c8a <TestCopperlistBatch+0x1a0>
  for( int i=0;i<length;i++)
     bb2:	7408           	moveq #8,d2
     bb4:	b481           	cmp.l d1,d2
     bb6:	6700 00ca      	beq.w c82 <TestCopperlistBatch+0x198>
    if( instructions[ pos+i] != batch[ i])
     bba:	2008           	move.l a0,d0
     bbc:	5080           	addq.l #8,d0
     bbe:	d080           	add.l d0,d0
     bc0:	d080           	add.l d0,d0
     bc2:	2032 0800      	move.l (0,a2,d0.l),d0
     bc6:	b0a9 0020      	cmp.l 32(a1),d0
     bca:	6600 00be      	bne.w c8a <TestCopperlistBatch+0x1a0>
     bce:	47e8 0009      	lea 9(a0),a3
     bd2:	200b           	move.l a3,d0
     bd4:	d08b           	add.l a3,d0
     bd6:	d080           	add.l d0,d0
     bd8:	2032 0800      	move.l (0,a2,d0.l),d0
     bdc:	b0a9 0024      	cmp.l 36(a1),d0
     be0:	6600 00a8      	bne.w c8a <TestCopperlistBatch+0x1a0>
  for( int i=0;i<length;i++)
     be4:	700a           	moveq #10,d0
     be6:	b081           	cmp.l d1,d0
     be8:	6700 0098      	beq.w c82 <TestCopperlistBatch+0x198>
    if( instructions[ pos+i] != batch[ i])
     bec:	47e8 000a      	lea 10(a0),a3
     bf0:	200b           	move.l a3,d0
     bf2:	d08b           	add.l a3,d0
     bf4:	d080           	add.l d0,d0
     bf6:	2032 0800      	move.l (0,a2,d0.l),d0
     bfa:	b0a9 0028      	cmp.l 40(a1),d0
     bfe:	6600 008a      	bne.w c8a <TestCopperlistBatch+0x1a0>
     c02:	47e8 000b      	lea 11(a0),a3
     c06:	200b           	move.l a3,d0
     c08:	d08b           	add.l a3,d0
     c0a:	d080           	add.l d0,d0
     c0c:	2032 0800      	move.l (0,a2,d0.l),d0
     c10:	b0a9 002c      	cmp.l 44(a1),d0
     c14:	6674           	bne.s c8a <TestCopperlistBatch+0x1a0>
  for( int i=0;i<length;i++)
     c16:	740c           	moveq #12,d2
     c18:	b481           	cmp.l d1,d2
     c1a:	6766           	beq.s c82 <TestCopperlistBatch+0x198>
    if( instructions[ pos+i] != batch[ i])
     c1c:	47e8 000c      	lea 12(a0),a3
     c20:	200b           	move.l a3,d0
     c22:	d08b           	add.l a3,d0
     c24:	d080           	add.l d0,d0
     c26:	2032 0800      	move.l (0,a2,d0.l),d0
     c2a:	b0a9 0030      	cmp.l 48(a1),d0
     c2e:	665a           	bne.s c8a <TestCopperlistBatch+0x1a0>
     c30:	47e8 000d      	lea 13(a0),a3
     c34:	200b           	move.l a3,d0
     c36:	d08b           	add.l a3,d0
     c38:	d080           	add.l d0,d0
     c3a:	2032 0800      	move.l (0,a2,d0.l),d0
     c3e:	b0a9 0034      	cmp.l 52(a1),d0
     c42:	6646           	bne.s c8a <TestCopperlistBatch+0x1a0>
  for( int i=0;i<length;i++)
     c44:	700e           	moveq #14,d0
     c46:	b081           	cmp.l d1,d0
     c48:	6738           	beq.s c82 <TestCopperlistBatch+0x198>
    if( instructions[ pos+i] != batch[ i])
     c4a:	47e8 000e      	lea 14(a0),a3
     c4e:	200b           	move.l a3,d0
     c50:	d08b           	add.l a3,d0
     c52:	d080           	add.l d0,d0
     c54:	2032 0800      	move.l (0,a2,d0.l),d0
     c58:	b0a9 0038      	cmp.l 56(a1),d0
     c5c:	662c           	bne.s c8a <TestCopperlistBatch+0x1a0>
  for( int i=0;i<length;i++)
     c5e:	7410           	moveq #16,d2
     c60:	b481           	cmp.l d1,d2
     c62:	661e           	bne.s c82 <TestCopperlistBatch+0x198>
    if( instructions[ pos+i] != batch[ i])
     c64:	41e8 000f      	lea 15(a0),a0
     c68:	d1c8           	adda.l a0,a0
     c6a:	d1c8           	adda.l a0,a0
     c6c:	2070 a800      	movea.l (0,a0,a2.l),a0
     c70:	b1e9 003c      	cmpa.l 60(a1),a0
     c74:	57c0           	seq d0
     c76:	4880           	ext.w d0
     c78:	48c0           	ext.l d0
     c7a:	4480           	neg.l d0
}
     c7c:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
     c80:	4e75           	rts
  return 1;
     c82:	7001           	moveq #1,d0
}
     c84:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
     c88:	4e75           	rts
      return 0;
     c8a:	7000           	moveq #0,d0
}
     c8c:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
     c90:	4e75           	rts

00000c92 <ClBuild>:
ULONG * ClBuild() {
     c92:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
     c96:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
     c9c:	707b           	moveq #123,d0
     c9e:	4600           	not.b d0
     ca0:	7202           	moveq #2,d1
     ca2:	4eae ff3a      	jsr -198(a6)
     ca6:	2440           	movea.l d0,a2
  if( retval == 0) {
     ca8:	4a80           	tst.l d0
     caa:	6700 010e      	beq.w dba <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
     cae:	24b9 0000 73e8 	move.l 73e8 <ClsSprites>,(a2)
     cb4:	2579 0000 73ec 	move.l 73ec <ClsSprites+0x4>,4(a2)
     cba:	0004 
     cbc:	2579 0000 73f0 	move.l 73f0 <ClsSprites+0x8>,8(a2)
     cc2:	0008 
     cc4:	2579 0000 73f4 	move.l 73f4 <ClsSprites+0xc>,12(a2)
     cca:	000c 
     ccc:	2579 0000 73f8 	move.l 73f8 <ClsSprites+0x10>,16(a2)
     cd2:	0010 
     cd4:	2579 0000 73fc 	move.l 73fc <ClsSprites+0x14>,20(a2)
     cda:	0014 
     cdc:	2579 0000 7400 	move.l 7400 <ClsSprites+0x18>,24(a2)
     ce2:	0018 
     ce4:	2579 0000 7404 	move.l 7404 <ClsSprites+0x1c>,28(a2)
     cea:	001c 
     cec:	2579 0000 7408 	move.l 7408 <ClsSprites+0x20>,32(a2)
     cf2:	0020 
     cf4:	2579 0000 740c 	move.l 740c <ClsSprites+0x24>,36(a2)
     cfa:	0024 
     cfc:	2579 0000 7410 	move.l 7410 <ClsSprites+0x28>,40(a2)
     d02:	0028 
     d04:	2579 0000 7414 	move.l 7414 <ClsSprites+0x2c>,44(a2)
     d0a:	002c 
     d0c:	2579 0000 7418 	move.l 7418 <ClsSprites+0x30>,48(a2)
     d12:	0030 
     d14:	2579 0000 741c 	move.l 741c <ClsSprites+0x34>,52(a2)
     d1a:	0034 
     d1c:	2579 0000 7420 	move.l 7420 <ClsSprites+0x38>,56(a2)
     d22:	0038 
     d24:	2579 0000 7424 	move.l 7424 <ClsSprites+0x3c>,60(a2)
     d2a:	003c 
    *cl++ = *clpartinstruction++;
     d2c:	2579 0000 73b8 	move.l 73b8 <ClScreen>,64(a2)
     d32:	0040 
     d34:	2579 0000 73bc 	move.l 73bc <ClScreen+0x4>,68(a2)
     d3a:	0044 
     d3c:	2579 0000 73c0 	move.l 73c0 <ClScreen+0x8>,72(a2)
     d42:	0048 
     d44:	2579 0000 73c4 	move.l 73c4 <ClScreen+0xc>,76(a2)
     d4a:	004c 
     d4c:	2579 0000 73c8 	move.l 73c8 <ClScreen+0x10>,80(a2)
     d52:	0050 
     d54:	2579 0000 73cc 	move.l 73cc <ClScreen+0x14>,84(a2)
     d5a:	0054 
     d5c:	2579 0000 73d0 	move.l 73d0 <ClScreen+0x18>,88(a2)
     d62:	0058 
     d64:	2579 0000 73d4 	move.l 73d4 <ClScreen+0x1c>,92(a2)
     d6a:	005c 
     d6c:	2579 0000 73d8 	move.l 73d8 <ClScreen+0x20>,96(a2)
     d72:	0060 
     d74:	2579 0000 73dc 	move.l 73dc <ClScreen+0x24>,100(a2)
     d7a:	0064 
     d7c:	2579 0000 73e0 	move.l 73e0 <ClScreen+0x28>,104(a2)
     d82:	0068 
     d84:	2579 0000 73e4 	move.l 73e4 <ClScreen+0x2c>,108(a2)
     d8a:	006c 
  *cl++ = 0x00e00000;
     d8c:	257c 00e0 0000 	move.l #14680064,112(a2)
     d92:	0070 
  *cl++ = 0x00e20000;
     d94:	257c 00e2 0000 	move.l #14811136,116(a2)
     d9a:	0074 
    *cl++ = *clpartinstruction++;
     d9c:	2579 0000 73b0 	move.l 73b0 <ClColor>,120(a2)
     da2:	0078 
     da4:	2579 0000 73b4 	move.l 73b4 <ClColor+0x4>,124(a2)
     daa:	007c 
  *cl = 0xfffffffe;
     dac:	70fe           	moveq #-2,d0
     dae:	2540 0080      	move.l d0,128(a2)
}
     db2:	200a           	move.l a2,d0
     db4:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     db8:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     dba:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     dc0:	4eae ffc4      	jsr -60(a6)
     dc4:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     dca:	2200           	move.l d0,d1
     dcc:	243c 0000 4d89 	move.l #19849,d2
     dd2:	7628           	moveq #40,d3
     dd4:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     dd8:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
     dde:	7201           	moveq #1,d1
     de0:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
     de4:	24b9 0000 73e8 	move.l 73e8 <ClsSprites>,(a2)
     dea:	2579 0000 73ec 	move.l 73ec <ClsSprites+0x4>,4(a2)
     df0:	0004 
     df2:	2579 0000 73f0 	move.l 73f0 <ClsSprites+0x8>,8(a2)
     df8:	0008 
     dfa:	2579 0000 73f4 	move.l 73f4 <ClsSprites+0xc>,12(a2)
     e00:	000c 
     e02:	2579 0000 73f8 	move.l 73f8 <ClsSprites+0x10>,16(a2)
     e08:	0010 
     e0a:	2579 0000 73fc 	move.l 73fc <ClsSprites+0x14>,20(a2)
     e10:	0014 
     e12:	2579 0000 7400 	move.l 7400 <ClsSprites+0x18>,24(a2)
     e18:	0018 
     e1a:	2579 0000 7404 	move.l 7404 <ClsSprites+0x1c>,28(a2)
     e20:	001c 
     e22:	2579 0000 7408 	move.l 7408 <ClsSprites+0x20>,32(a2)
     e28:	0020 
     e2a:	2579 0000 740c 	move.l 740c <ClsSprites+0x24>,36(a2)
     e30:	0024 
     e32:	2579 0000 7410 	move.l 7410 <ClsSprites+0x28>,40(a2)
     e38:	0028 
     e3a:	2579 0000 7414 	move.l 7414 <ClsSprites+0x2c>,44(a2)
     e40:	002c 
     e42:	2579 0000 7418 	move.l 7418 <ClsSprites+0x30>,48(a2)
     e48:	0030 
     e4a:	2579 0000 741c 	move.l 741c <ClsSprites+0x34>,52(a2)
     e50:	0034 
     e52:	2579 0000 7420 	move.l 7420 <ClsSprites+0x38>,56(a2)
     e58:	0038 
     e5a:	2579 0000 7424 	move.l 7424 <ClsSprites+0x3c>,60(a2)
     e60:	003c 
    *cl++ = *clpartinstruction++;
     e62:	2579 0000 73b8 	move.l 73b8 <ClScreen>,64(a2)
     e68:	0040 
     e6a:	2579 0000 73bc 	move.l 73bc <ClScreen+0x4>,68(a2)
     e70:	0044 
     e72:	2579 0000 73c0 	move.l 73c0 <ClScreen+0x8>,72(a2)
     e78:	0048 
     e7a:	2579 0000 73c4 	move.l 73c4 <ClScreen+0xc>,76(a2)
     e80:	004c 
     e82:	2579 0000 73c8 	move.l 73c8 <ClScreen+0x10>,80(a2)
     e88:	0050 
     e8a:	2579 0000 73cc 	move.l 73cc <ClScreen+0x14>,84(a2)
     e90:	0054 
     e92:	2579 0000 73d0 	move.l 73d0 <ClScreen+0x18>,88(a2)
     e98:	0058 
     e9a:	2579 0000 73d4 	move.l 73d4 <ClScreen+0x1c>,92(a2)
     ea0:	005c 
     ea2:	2579 0000 73d8 	move.l 73d8 <ClScreen+0x20>,96(a2)
     ea8:	0060 
     eaa:	2579 0000 73dc 	move.l 73dc <ClScreen+0x24>,100(a2)
     eb0:	0064 
     eb2:	2579 0000 73e0 	move.l 73e0 <ClScreen+0x28>,104(a2)
     eb8:	0068 
     eba:	2579 0000 73e4 	move.l 73e4 <ClScreen+0x2c>,108(a2)
     ec0:	006c 
  *cl++ = 0x00e00000;
     ec2:	257c 00e0 0000 	move.l #14680064,112(a2)
     ec8:	0070 
  *cl++ = 0x00e20000;
     eca:	257c 00e2 0000 	move.l #14811136,116(a2)
     ed0:	0074 
    *cl++ = *clpartinstruction++;
     ed2:	2579 0000 73b0 	move.l 73b0 <ClColor>,120(a2)
     ed8:	0078 
     eda:	2579 0000 73b4 	move.l 73b4 <ClColor+0x4>,124(a2)
     ee0:	007c 
  *cl = 0xfffffffe;
     ee2:	70fe           	moveq #-2,d0
     ee4:	2540 0080      	move.l d0,128(a2)
}
     ee8:	200a           	move.l a2,d0
     eea:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     eee:	4e75           	rts

00000ef0 <WaitBlt>:
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     ef0:	2079 0000 779a 	movea.l 779a <hw>,a0
     ef6:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     efa:	3028 0002      	move.w 2(a0),d0
     efe:	0800 000e      	btst #14,d0
     f02:	66f6           	bne.s efa <WaitBlt+0xa>
}
     f04:	4e75           	rts

00000f06 <Zoom_ZoomIntoPicture>:
  hw->bltcon0 = 0x9f0 + shiftright;
  hw->bltcon1 = 0;
}

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
     f06:	4fef ffe0      	lea -32(sp),sp
     f0a:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
     f0e:	282f 0058      	move.l 88(sp),d4
     f12:	262f 005c      	move.l 92(sp),d3
     f16:	3404           	move.w d4,d2
  WaitBlit();
     f18:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
     f1e:	4eae ff1c      	jsr -228(a6)
  hw->bltafwm = 0xffff;
     f22:	2079 0000 779a 	movea.l 779a <hw>,a0
     f28:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     f2e:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     f34:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     f3a:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     f40:	317c 002c 0066 	move.w #44,102(a0)
  Init_Blit();
  WORD shiftright = 9;
  UWORD shifthoriz = 7;
  UWORD startofword = 21*16;
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
     f46:	3044           	movea.w d4,a0
     f48:	d0c4           	adda.w d4,a0
     f4a:	3208           	move.w a0,d1
     f4c:	d248           	add.w a0,d1
     f4e:	d244           	add.w d4,d1
     f50:	3001           	move.w d1,d0
     f52:	d041           	add.w d1,d0
     f54:	0640 014c      	addi.w #332,d0
     f58:	3f40 0040      	move.w d0,64(sp)
  WORD shiftright = 9;
     f5c:	3f7c 0009 0032 	move.w #9,50(sp)
  while( nextzoom > 22 * 16) {
     f62:	0c40 0160      	cmpi.w #352,d0
     f66:	631a           	bls.s f82 <Zoom_ZoomIntoPicture+0x7c>
  WORD shiftright = 9;
     f68:	327c 0009      	movea.w #9,a1
    nextzoom -= (19 + zoomnr);
     f6c:	0640 ffed      	addi.w #-19,d0
     f70:	9042           	sub.w d2,d0
    shiftright--;
     f72:	5349           	subq.w #1,a1
  while( nextzoom > 22 * 16) {
     f74:	0c40 0160      	cmpi.w #352,d0
     f78:	62f2           	bhi.s f6c <Zoom_ZoomIntoPicture+0x66>
     f7a:	3f49 0032      	move.w a1,50(sp)
     f7e:	3f40 0040      	move.w d0,64(sp)
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
     f82:	7012           	moveq #18,d0
     f84:	9041           	sub.w d1,d0
     f86:	3f40 0048      	move.w d0,72(sp)
  while( ZoomHorizontalStart < 0) {
     f8a:	6c00 0346      	bge.w 12d2 <Zoom_ZoomIntoPicture+0x3cc>
     f8e:	3200           	move.w d0,d1
  UWORD shifthoriz = 7;
     f90:	7007           	moveq #7,d0
      ZoomHorizontalStart += 1 + 18 + zoomnr;
     f92:	0641 0013      	addi.w #19,d1
     f96:	d242           	add.w d2,d1
      shifthoriz--;
     f98:	5340           	subq.w #1,d0
  while( ZoomHorizontalStart < 0) {
     f9a:	4a41           	tst.w d1
     f9c:	6df4           	blt.s f92 <Zoom_ZoomIntoPicture+0x8c>
     f9e:	3f41 0048      	move.w d1,72(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    /*UWORD size4blitsmall = ZMLINESIZE/2*ZoomHorizontal*planes;
    UWORD size4blitbig = ZMLINESIZE/2*(ZoomHorizontal+1)*planes;*/

    UWORD onestep = ZMLINESIZE/2*planes;
     fa2:	3203           	move.w d3,d1
     fa4:	d243           	add.w d3,d1
     fa6:	d243           	add.w d3,d1
     fa8:	e749           	lsl.w #3,d1
     faa:	3f41 0034      	move.w d1,52(sp)
  hw->bltsize = height*64+2;
     fae:	3e03           	move.w d3,d7
     fb0:	ed4f           	lsl.w #6,d7
     fb2:	3207           	move.w d7,d1
     fb4:	5441           	addq.w #2,d1
     fb6:	3f41 0036      	move.w d1,54(sp)
          linesleft--;
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
        pos4source += size4blit;
        pos4dest += size4blit + onestep;   
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     fba:	90c4           	suba.w d4,a0
     fbc:	3a48           	movea.w a0,a5
     fbe:	4bed 0012      	lea 18(a5),a5
     fc2:	7200           	moveq #0,d1
     fc4:	322f 0034      	move.w 52(sp),d1
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
     fc8:	c6c0           	mulu.w d0,d3
     fca:	2003           	move.l d3,d0
     fcc:	d083           	add.l d3,d0
     fce:	d083           	add.l d3,d0
     fd0:	e988           	lsl.l #4,d0
     fd2:	206f 0050      	movea.l 80(sp),a0
     fd6:	41f0 082c      	lea (44,a0,d0.l),a0
     fda:	2f48 003c      	move.l a0,60(sp)
     fde:	702c           	moveq #44,d0
     fe0:	d0af 0054      	add.l 84(sp),d0
     fe4:	2f40 0038      	move.l d0,56(sp)
  UWORD shifttoleft = 0;
     fe8:	426f 0046      	clr.w 70(sp)
  UWORD startofword = 21*16;
     fec:	3f7c 0150 0030 	move.w #336,48(sp)
      nextzoom -= (19 + zoomnr);
     ff2:	70ed           	moveq #-19,d0
     ff4:	9042           	sub.w d2,d0
     ff6:	3f40 004a      	move.w d0,74(sp)
    ZoomBlit_Increment4SrcA = 1;
     ffa:	2841           	movea.l d1,a4
    ZoomHorizontal = ZoomHorizontalStart;
     ffc:	33ef 0048 0000 	move.w 72(sp),7782 <ZoomHorizontal>
    1002:	7782 
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    1004:	242f 003c      	move.l 60(sp),d2
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    1008:	262f 0038      	move.l 56(sp),d3
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    100c:	7c00           	moveq #0,d6
    100e:	3c2f 0046      	move.w 70(sp),d6
    1012:	2a06           	move.l d6,d5
    1014:	da86           	add.l d6,d5
    1016:	3f6f 0032 002c 	move.w 50(sp),44(sp)
    101c:	382f 0032      	move.w 50(sp),d4
    1020:	720c           	moveq #12,d1
    1022:	e36c           	lsl.w d1,d4
    1024:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    102a:	7000           	moveq #0,d0
    102c:	302f 0030      	move.w 48(sp),d0
    1030:	306f 0040      	movea.w 64(sp),a0
    1034:	b1c0           	cmpa.l d0,a0
    1036:	6e00 00e8      	bgt.w 1120 <Zoom_ZoomIntoPicture+0x21a>
  WaitBlit();
    103a:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
    103e:	2079 0000 779a 	movea.l 779a <hw>,a0
    1044:	0644 09f0      	addi.w #2544,d4
    1048:	3144 0040      	move.w d4,64(a0)
  hw->bltcon1 = 0;
    104c:	317c 0000 0042 	move.w #0,66(a0)
    1052:	3239 0000 7782 	move.w 7782 <ZoomHorizontal>,d1
    WORD linesleft = 272;
    1058:	383c 0110      	move.w #272,d4
    105c:	2f46 002c      	move.l d6,44(sp)
    1060:	2645           	movea.l d5,a3
    1062:	3c2f 0034      	move.w 52(sp),d6
        if( linesleft >= ZoomHorizontal+1) {
    1066:	b841           	cmp.w d1,d4
    1068:	6f00 009a      	ble.w 1104 <Zoom_ZoomIntoPicture+0x1fe>
          linesleft -= ZoomHorizontal;
    106c:	9841           	sub.w d1,d4
        UWORD size4blit = ZoomHorizontal*onestep; 
    106e:	3001           	move.w d1,d0
    1070:	c1c6           	muls.w d6,d0
        if( linesleft>0) {
    1072:	0280 0000 ffff 	andi.l #65535,d0
    1078:	2440           	movea.l d0,a2
    107a:	d5c0           	adda.l d0,a2
    107c:	4a44           	tst.w d4
    107e:	6f2c           	ble.s 10ac <Zoom_ZoomIntoPicture+0x1a6>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1080:	226f 002c      	movea.l 44(sp),a1
    1084:	d3c0           	adda.l d0,a1
    1086:	d3c9           	adda.l a1,a1
    1088:	d3c2           	adda.l d2,a1
          UWORD *tmpdest = pos4dest +  size4blit;
    108a:	4df2 3800      	lea (0,a2,d3.l),a6
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    108e:	3a28 0002      	move.w 2(a0),d5
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    1092:	3a28 0002      	move.w 2(a0),d5
    1096:	0805 000e      	btst #14,d5
    109a:	66f6           	bne.s 1092 <Zoom_ZoomIntoPicture+0x18c>
  hw->bltapt = (UWORD *) source;
    109c:	2149 0050      	move.l a1,80(a0)
  hw->bltdpt = (UWORD *) destination;
    10a0:	214e 0054      	move.l a6,84(a0)
  hw->bltsize = height*64+2;
    10a4:	316f 0036 0058 	move.w 54(sp),88(a0)
          linesleft--;
    10aa:	5344           	subq.w #1,d4
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    10ac:	43f3 2800      	lea (0,a3,d2.l),a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    10b0:	3a28 0002      	move.w 2(a0),d5
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    10b4:	3a28 0002      	move.w 2(a0),d5
    10b8:	0805 000e      	btst #14,d5
    10bc:	66f6           	bne.s 10b4 <Zoom_ZoomIntoPicture+0x1ae>
  hw->bltapt = (UWORD *) source;
    10be:	2149 0050      	move.l a1,80(a0)
  hw->bltdpt = (UWORD *) destination;
    10c2:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
    10c6:	c3c7           	muls.w d7,d1
    10c8:	5441           	addq.w #2,d1
    10ca:	3141 0058      	move.w d1,88(a0)
        pos4source += size4blit;
    10ce:	d48a           	add.l a2,d2
        pos4dest += size4blit + onestep; 
    10d0:	d08c           	add.l a4,d0
    10d2:	d080           	add.l d0,d0
    10d4:	d680           	add.l d0,d3
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    10d6:	320d           	move.w a5,d1
      while(linesleft > 0) {
    10d8:	4a44           	tst.w d4
    10da:	6e8a           	bgt.s 1066 <Zoom_ZoomIntoPicture+0x160>
    10dc:	33cd 0000 7782 	move.w a5,7782 <ZoomHorizontal>
      if(shiftright < 0) {
        shiftright += 16;
        shifttoleft = 1;
      }
    }
    startofword -= 16;
    10e2:	066f fff0 0030 	addi.w #-16,48(sp)
    10e8:	55af 003c      	subq.l #2,60(sp)
    10ec:	55af 0038      	subq.l #2,56(sp)
  for(int i=0;i<22;i++) {
    10f0:	0c6f fff0 0030 	cmpi.w #-16,48(sp)
    10f6:	6600 ff04      	bne.w ffc <Zoom_ZoomIntoPicture+0xf6>
  }
  //ZoomHorizontal = 10;
}
    10fa:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    10fe:	4fef 0020      	lea 32(sp),sp
    1102:	4e75           	rts
        UWORD size4blit = ZoomHorizontal*onestep; 
    1104:	3006           	move.w d6,d0
    1106:	c1c4           	muls.w d4,d0
        if( linesleft>0) {
    1108:	0280 0000 ffff 	andi.l #65535,d0
    110e:	2440           	movea.l d0,a2
    1110:	d5c0           	adda.l d0,a2
        UWORD size4blit = ZoomHorizontal*onestep; 
    1112:	3204           	move.w d4,d1
          linesleft = 0;
    1114:	4244           	clr.w d4
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1116:	43f3 2800      	lea (0,a3,d2.l),a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    111a:	3a28 0002      	move.w 2(a0),d5
    111e:	6094           	bra.s 10b4 <Zoom_ZoomIntoPicture+0x1ae>
  UWORD colnr = nextzoom - startofword - 1;                                                                          
    1120:	366f 0040      	movea.w 64(sp),a3
    1124:	96ef 0030      	suba.w 48(sp),a3
    1128:	534b           	subq.w #1,a3
  if( shiftright == 0) {
    112a:	302f 002c      	move.w 44(sp),d0
    112e:	5340           	subq.w #1,d0
    1130:	3f40 0032      	move.w d0,50(sp)
    1134:	4a6f 002c      	tst.w 44(sp)
    1138:	6600 013c      	bne.w 1276 <Zoom_ZoomIntoPicture+0x370>
    ZoomBlit_Increment4SrcA = 1;
    113c:	33fc 0001 0000 	move.w #1,7790 <ZoomBlit_Increment4SrcA>
    1142:	7790 
    1144:	347c fde4      	movea.w #-540,a2
  WaitBlit(); 
    1148:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    114c:	2079 0000 779a 	movea.l 779a <hw>,a0
    1152:	3144 0042      	move.w d4,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1156:	314a 0040      	move.w a2,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    115a:	7000           	moveq #0,d0
    115c:	300b           	move.w a3,d0
    115e:	7210           	moveq #16,d1
    1160:	9280           	sub.l d0,d1
    1162:	2001           	move.l d1,d0
    1164:	7200           	moveq #0,d1
    1166:	4641           	not.w d1
    1168:	e1a9           	lsl.l d0,d1
    116a:	3141 0070      	move.w d1,112(a0)
      nextzoom -= (19 + zoomnr);
    116e:	302f 004a      	move.w 74(sp),d0
    1172:	d16f 0040      	add.w d0,64(sp)
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    1176:	7000           	moveq #0,d0
    1178:	3039 0000 7790 	move.w 7790 <ZoomBlit_Increment4SrcA>,d0
    117e:	2c40           	movea.l d0,a6
    1180:	ddc0           	adda.l d0,a6
    1182:	3239 0000 7782 	move.w 7782 <ZoomHorizontal>,d1
    WORD linesleft = 272;
    1188:	383c 0110      	move.w #272,d4
    118c:	2f46 0042      	move.l d6,66(sp)
        if( linesleft >= ZoomHorizontal+1) {
    1190:	b841           	cmp.w d1,d4
    1192:	6f00 00c2      	ble.w 1256 <Zoom_ZoomIntoPicture+0x350>
          linesleft -= ZoomHorizontal;
    1196:	9841           	sub.w d1,d4
        UWORD size4blit = ZoomHorizontal*onestep;
    1198:	302f 0034      	move.w 52(sp),d0
    119c:	c1c1           	muls.w d1,d0
        if( linesleft>0) {
    119e:	0280 0000 ffff 	andi.l #65535,d0
    11a4:	2440           	movea.l d0,a2
    11a6:	d5c0           	adda.l d0,a2
    11a8:	4a44           	tst.w d4
    11aa:	6f34           	ble.s 11e0 <Zoom_ZoomIntoPicture+0x2da>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    11ac:	226f 0042      	movea.l 66(sp),a1
    11b0:	d3c0           	adda.l d0,a1
    11b2:	d3c9           	adda.l a1,a1
    11b4:	d3c2           	adda.l d2,a1
          UWORD *tmpdest = pos4dest + size4blit;
    11b6:	47f2 3800      	lea (0,a2,d3.l),a3
    11ba:	3c28 0002      	move.w 2(a0),d6
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    11be:	3c28 0002      	move.w 2(a0),d6
    11c2:	0806 000e      	btst #14,d6
    11c6:	66f6           	bne.s 11be <Zoom_ZoomIntoPicture+0x2b8>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    11c8:	2c09           	move.l a1,d6
    11ca:	dc8e           	add.l a6,d6
    11cc:	2146 0050      	move.l d6,80(a0)
  hw->bltbpt = source;
    11d0:	2149 004c      	move.l a1,76(a0)
  hw->bltdpt = destination;
    11d4:	214b 0054      	move.l a3,84(a0)
  hw->bltsize = height*64+2;
    11d8:	316f 0036 0058 	move.w 54(sp),88(a0)
          linesleft--;
    11de:	5344           	subq.w #1,d4
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    11e0:	2242           	movea.l d2,a1
    11e2:	d3c5           	adda.l d5,a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    11e4:	3c28 0002      	move.w 2(a0),d6
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    11e8:	3c28 0002      	move.w 2(a0),d6
    11ec:	0806 000e      	btst #14,d6
    11f0:	66f6           	bne.s 11e8 <Zoom_ZoomIntoPicture+0x2e2>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    11f2:	2c09           	move.l a1,d6
    11f4:	dc8e           	add.l a6,d6
    11f6:	2146 0050      	move.l d6,80(a0)
  hw->bltbpt = source;
    11fa:	2149 004c      	move.l a1,76(a0)
  hw->bltdpt = destination;
    11fe:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
    1202:	c3c7           	muls.w d7,d1
    1204:	5441           	addq.w #2,d1
    1206:	3141 0058      	move.w d1,88(a0)
        pos4source += size4blit;
    120a:	d48a           	add.l a2,d2
        pos4dest += size4blit + onestep;   
    120c:	d08c           	add.l a4,d0
    120e:	d080           	add.l d0,d0
    1210:	d680           	add.l d0,d3
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1212:	320d           	move.w a5,d1
      while( linesleft > 0) {
    1214:	4a44           	tst.w d4
    1216:	6e00 ff78      	bgt.w 1190 <Zoom_ZoomIntoPicture+0x28a>
    121a:	33cd 0000 7782 	move.w a5,7782 <ZoomHorizontal>
      if(shiftright < 0) {
    1220:	4a6f 0032      	tst.w 50(sp)
    1224:	6c00 febc      	bge.w 10e2 <Zoom_ZoomIntoPicture+0x1dc>
        shiftright += 16;
    1228:	322f 002c      	move.w 44(sp),d1
    122c:	0641 000f      	addi.w #15,d1
    1230:	3f41 0032      	move.w d1,50(sp)
        shifttoleft = 1;
    1234:	3f7c 0001 0046 	move.w #1,70(sp)
    startofword -= 16;
    123a:	066f fff0 0030 	addi.w #-16,48(sp)
    1240:	55af 003c      	subq.l #2,60(sp)
    1244:	55af 0038      	subq.l #2,56(sp)
  for(int i=0;i<22;i++) {
    1248:	0c6f fff0 0030 	cmpi.w #-16,48(sp)
    124e:	6600 fdac      	bne.w ffc <Zoom_ZoomIntoPicture+0xf6>
    1252:	6000 fea6      	bra.w 10fa <Zoom_ZoomIntoPicture+0x1f4>
        UWORD size4blit = ZoomHorizontal*onestep;
    1256:	302f 0034      	move.w 52(sp),d0
    125a:	c1c4           	muls.w d4,d0
        if( linesleft>0) {
    125c:	0280 0000 ffff 	andi.l #65535,d0
    1262:	2440           	movea.l d0,a2
    1264:	d5c0           	adda.l d0,a2
        UWORD size4blit = ZoomHorizontal*onestep;
    1266:	3204           	move.w d4,d1
          linesleft = 0;
    1268:	4244           	clr.w d4
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    126a:	2242           	movea.l d2,a1
    126c:	d3c5           	adda.l d5,a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    126e:	3c28 0002      	move.w 2(a0),d6
    1272:	6000 ff74      	bra.w 11e8 <Zoom_ZoomIntoPicture+0x2e2>
  ZoomBlit_Increment4SrcA = 0;
    1276:	4279 0000 7790 	clr.w 7790 <ZoomBlit_Increment4SrcA>
    shifta = (shiftright - 1) << 12;
    127c:	720c           	moveq #12,d1
    127e:	e368           	lsl.w d1,d0
    1280:	3440           	movea.w d0,a2
    1282:	45ea 0de4      	lea 3556(a2),a2
  WaitBlit(); 
    1286:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    128a:	2079 0000 779a 	movea.l 779a <hw>,a0
    1290:	3144 0042      	move.w d4,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1294:	314a 0040      	move.w a2,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1298:	7000           	moveq #0,d0
    129a:	300b           	move.w a3,d0
    129c:	7210           	moveq #16,d1
    129e:	9280           	sub.l d0,d1
    12a0:	2001           	move.l d1,d0
    12a2:	7200           	moveq #0,d1
    12a4:	4641           	not.w d1
    12a6:	e1a9           	lsl.l d0,d1
    12a8:	3141 0070      	move.w d1,112(a0)
      nextzoom -= (19 + zoomnr);
    12ac:	302f 004a      	move.w 74(sp),d0
    12b0:	d16f 0040      	add.w d0,64(sp)
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    12b4:	7000           	moveq #0,d0
    12b6:	3039 0000 7790 	move.w 7790 <ZoomBlit_Increment4SrcA>,d0
    12bc:	2c40           	movea.l d0,a6
    12be:	ddc0           	adda.l d0,a6
    12c0:	3239 0000 7782 	move.w 7782 <ZoomHorizontal>,d1
    WORD linesleft = 272;
    12c6:	383c 0110      	move.w #272,d4
    12ca:	2f46 0042      	move.l d6,66(sp)
    12ce:	6000 fec0      	bra.w 1190 <Zoom_ZoomIntoPicture+0x28a>
  UWORD shifthoriz = 7;
    12d2:	7007           	moveq #7,d0
    UWORD onestep = ZMLINESIZE/2*planes;
    12d4:	3203           	move.w d3,d1
    12d6:	d243           	add.w d3,d1
    12d8:	d243           	add.w d3,d1
    12da:	e749           	lsl.w #3,d1
    12dc:	3f41 0034      	move.w d1,52(sp)
  hw->bltsize = height*64+2;
    12e0:	3e03           	move.w d3,d7
    12e2:	ed4f           	lsl.w #6,d7
    12e4:	3207           	move.w d7,d1
    12e6:	5441           	addq.w #2,d1
    12e8:	3f41 0036      	move.w d1,54(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    12ec:	90c4           	suba.w d4,a0
    12ee:	3a48           	movea.w a0,a5
    12f0:	4bed 0012      	lea 18(a5),a5
    12f4:	7200           	moveq #0,d1
    12f6:	322f 0034      	move.w 52(sp),d1
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    12fa:	c6c0           	mulu.w d0,d3
    12fc:	2003           	move.l d3,d0
    12fe:	d083           	add.l d3,d0
    1300:	d083           	add.l d3,d0
    1302:	e988           	lsl.l #4,d0
    1304:	206f 0050      	movea.l 80(sp),a0
    1308:	41f0 082c      	lea (44,a0,d0.l),a0
    130c:	2f48 003c      	move.l a0,60(sp)
    1310:	702c           	moveq #44,d0
    1312:	d0af 0054      	add.l 84(sp),d0
    1316:	2f40 0038      	move.l d0,56(sp)
  UWORD shifttoleft = 0;
    131a:	426f 0046      	clr.w 70(sp)
  UWORD startofword = 21*16;
    131e:	3f7c 0150 0030 	move.w #336,48(sp)
      nextzoom -= (19 + zoomnr);
    1324:	70ed           	moveq #-19,d0
    1326:	9042           	sub.w d2,d0
    1328:	3f40 004a      	move.w d0,74(sp)
    ZoomBlit_Increment4SrcA = 1;
    132c:	2841           	movea.l d1,a4
    132e:	6000 fccc      	bra.w ffc <Zoom_ZoomIntoPicture+0xf6>

00001332 <Init_Blit>:
  hw->bltafwm = 0xffff;
    1332:	2079 0000 779a 	movea.l 779a <hw>,a0
    1338:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    133e:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    1344:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    134a:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    1350:	317c 002c 0066 	move.w #44,102(a0)
}
    1356:	4e75           	rts

00001358 <ClbuildZoom>:
ULONG * ClbuildZoom() {
    1358:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    135c:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    1362:	203c 0000 a48c 	move.l #42124,d0
    1368:	7202           	moveq #2,d1
    136a:	4eae ff3a      	jsr -198(a6)
    136e:	2440           	movea.l d0,a2
  if( retval == 0) {
    1370:	4a80           	tst.l d0
    1372:	6700 011e      	beq.w 1492 <ClbuildZoom+0x13a>
    *cl++ = *clpartinstruction++;
    1376:	24b9 0000 73e8 	move.l 73e8 <ClsSprites>,(a2)
    137c:	2579 0000 73ec 	move.l 73ec <ClsSprites+0x4>,4(a2)
    1382:	0004 
    1384:	2579 0000 73f0 	move.l 73f0 <ClsSprites+0x8>,8(a2)
    138a:	0008 
    138c:	2579 0000 73f4 	move.l 73f4 <ClsSprites+0xc>,12(a2)
    1392:	000c 
    1394:	2579 0000 73f8 	move.l 73f8 <ClsSprites+0x10>,16(a2)
    139a:	0010 
    139c:	2579 0000 73fc 	move.l 73fc <ClsSprites+0x14>,20(a2)
    13a2:	0014 
    13a4:	2579 0000 7400 	move.l 7400 <ClsSprites+0x18>,24(a2)
    13aa:	0018 
    13ac:	2579 0000 7404 	move.l 7404 <ClsSprites+0x1c>,28(a2)
    13b2:	001c 
    13b4:	2579 0000 7408 	move.l 7408 <ClsSprites+0x20>,32(a2)
    13ba:	0020 
    13bc:	2579 0000 740c 	move.l 740c <ClsSprites+0x24>,36(a2)
    13c2:	0024 
    13c4:	2579 0000 7410 	move.l 7410 <ClsSprites+0x28>,40(a2)
    13ca:	0028 
    13cc:	2579 0000 7414 	move.l 7414 <ClsSprites+0x2c>,44(a2)
    13d2:	002c 
    13d4:	2579 0000 7418 	move.l 7418 <ClsSprites+0x30>,48(a2)
    13da:	0030 
    13dc:	2579 0000 741c 	move.l 741c <ClsSprites+0x34>,52(a2)
    13e2:	0034 
    13e4:	2579 0000 7420 	move.l 7420 <ClsSprites+0x38>,56(a2)
    13ea:	0038 
    13ec:	2579 0000 7424 	move.l 7424 <ClsSprites+0x3c>,60(a2)
    13f2:	003c 
    *cl++ = *clpartinstruction++;
    13f4:	2579 0000 73b8 	move.l 73b8 <ClScreen>,64(a2)
    13fa:	0040 
    13fc:	2579 0000 73bc 	move.l 73bc <ClScreen+0x4>,68(a2)
    1402:	0044 
    1404:	2579 0000 73c0 	move.l 73c0 <ClScreen+0x8>,72(a2)
    140a:	0048 
    140c:	2579 0000 73c4 	move.l 73c4 <ClScreen+0xc>,76(a2)
    1412:	004c 
    1414:	2579 0000 73c8 	move.l 73c8 <ClScreen+0x10>,80(a2)
    141a:	0050 
    141c:	2579 0000 73cc 	move.l 73cc <ClScreen+0x14>,84(a2)
    1422:	0054 
    1424:	2579 0000 73d0 	move.l 73d0 <ClScreen+0x18>,88(a2)
    142a:	0058 
    142c:	2579 0000 73d4 	move.l 73d4 <ClScreen+0x1c>,92(a2)
    1432:	005c 
    1434:	2579 0000 73d8 	move.l 73d8 <ClScreen+0x20>,96(a2)
    143a:	0060 
    143c:	2579 0000 73dc 	move.l 73dc <ClScreen+0x24>,100(a2)
    1442:	0064 
    1444:	2579 0000 73e0 	move.l 73e0 <ClScreen+0x28>,104(a2)
    144a:	0068 
    144c:	2579 0000 73e4 	move.l 73e4 <ClScreen+0x2c>,108(a2)
    1452:	006c 
  *cl++ = 0x00e00000;
    1454:	257c 00e0 0000 	move.l #14680064,112(a2)
    145a:	0070 
  *cl++ = 0x00e20000;
    145c:	257c 00e2 0000 	move.l #14811136,116(a2)
    1462:	0074 
  *cl++ = 0x00e40000;
    1464:	257c 00e4 0000 	move.l #14942208,120(a2)
    146a:	0078 
  *cl++ = 0x00e60000;
    146c:	257c 00e6 0000 	move.l #15073280,124(a2)
    1472:	007c 
    *cl++ = *clpartinstruction++;
    1474:	2579 0000 73b0 	move.l 73b0 <ClColor>,128(a2)
    147a:	0080 
    147c:	2579 0000 73b4 	move.l 73b4 <ClColor+0x4>,132(a2)
    1482:	0084 
   *cl = 0xfffffffe;
    1484:	70fe           	moveq #-2,d0
    1486:	2540 0088      	move.l d0,136(a2)
}
    148a:	200a           	move.l a2,d0
    148c:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1490:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1492:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1498:	4eae ffc4      	jsr -60(a6)
    149c:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    14a2:	2200           	move.l d0,d1
    14a4:	243c 0000 4d89 	move.l #19849,d2
    14aa:	7628           	moveq #40,d3
    14ac:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    14b0:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    14b6:	7201           	moveq #1,d1
    14b8:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    14bc:	24b9 0000 73e8 	move.l 73e8 <ClsSprites>,(a2)
    14c2:	2579 0000 73ec 	move.l 73ec <ClsSprites+0x4>,4(a2)
    14c8:	0004 
    14ca:	2579 0000 73f0 	move.l 73f0 <ClsSprites+0x8>,8(a2)
    14d0:	0008 
    14d2:	2579 0000 73f4 	move.l 73f4 <ClsSprites+0xc>,12(a2)
    14d8:	000c 
    14da:	2579 0000 73f8 	move.l 73f8 <ClsSprites+0x10>,16(a2)
    14e0:	0010 
    14e2:	2579 0000 73fc 	move.l 73fc <ClsSprites+0x14>,20(a2)
    14e8:	0014 
    14ea:	2579 0000 7400 	move.l 7400 <ClsSprites+0x18>,24(a2)
    14f0:	0018 
    14f2:	2579 0000 7404 	move.l 7404 <ClsSprites+0x1c>,28(a2)
    14f8:	001c 
    14fa:	2579 0000 7408 	move.l 7408 <ClsSprites+0x20>,32(a2)
    1500:	0020 
    1502:	2579 0000 740c 	move.l 740c <ClsSprites+0x24>,36(a2)
    1508:	0024 
    150a:	2579 0000 7410 	move.l 7410 <ClsSprites+0x28>,40(a2)
    1510:	0028 
    1512:	2579 0000 7414 	move.l 7414 <ClsSprites+0x2c>,44(a2)
    1518:	002c 
    151a:	2579 0000 7418 	move.l 7418 <ClsSprites+0x30>,48(a2)
    1520:	0030 
    1522:	2579 0000 741c 	move.l 741c <ClsSprites+0x34>,52(a2)
    1528:	0034 
    152a:	2579 0000 7420 	move.l 7420 <ClsSprites+0x38>,56(a2)
    1530:	0038 
    1532:	2579 0000 7424 	move.l 7424 <ClsSprites+0x3c>,60(a2)
    1538:	003c 
    *cl++ = *clpartinstruction++;
    153a:	2579 0000 73b8 	move.l 73b8 <ClScreen>,64(a2)
    1540:	0040 
    1542:	2579 0000 73bc 	move.l 73bc <ClScreen+0x4>,68(a2)
    1548:	0044 
    154a:	2579 0000 73c0 	move.l 73c0 <ClScreen+0x8>,72(a2)
    1550:	0048 
    1552:	2579 0000 73c4 	move.l 73c4 <ClScreen+0xc>,76(a2)
    1558:	004c 
    155a:	2579 0000 73c8 	move.l 73c8 <ClScreen+0x10>,80(a2)
    1560:	0050 
    1562:	2579 0000 73cc 	move.l 73cc <ClScreen+0x14>,84(a2)
    1568:	0054 
    156a:	2579 0000 73d0 	move.l 73d0 <ClScreen+0x18>,88(a2)
    1570:	0058 
    1572:	2579 0000 73d4 	move.l 73d4 <ClScreen+0x1c>,92(a2)
    1578:	005c 
    157a:	2579 0000 73d8 	move.l 73d8 <ClScreen+0x20>,96(a2)
    1580:	0060 
    1582:	2579 0000 73dc 	move.l 73dc <ClScreen+0x24>,100(a2)
    1588:	0064 
    158a:	2579 0000 73e0 	move.l 73e0 <ClScreen+0x28>,104(a2)
    1590:	0068 
    1592:	2579 0000 73e4 	move.l 73e4 <ClScreen+0x2c>,108(a2)
    1598:	006c 
  *cl++ = 0x00e00000;
    159a:	257c 00e0 0000 	move.l #14680064,112(a2)
    15a0:	0070 
  *cl++ = 0x00e20000;
    15a2:	257c 00e2 0000 	move.l #14811136,116(a2)
    15a8:	0074 
  *cl++ = 0x00e40000;
    15aa:	257c 00e4 0000 	move.l #14942208,120(a2)
    15b0:	0078 
  *cl++ = 0x00e60000;
    15b2:	257c 00e6 0000 	move.l #15073280,124(a2)
    15b8:	007c 
    *cl++ = *clpartinstruction++;
    15ba:	2579 0000 73b0 	move.l 73b0 <ClColor>,128(a2)
    15c0:	0080 
    15c2:	2579 0000 73b4 	move.l 73b4 <ClColor+0x4>,132(a2)
    15c8:	0084 
   *cl = 0xfffffffe;
    15ca:	70fe           	moveq #-2,d0
    15cc:	2540 0088      	move.l d0,136(a2)
}
    15d0:	200a           	move.l a2,d0
    15d2:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    15d6:	4e75           	rts

000015d8 <Zoom_Init>:
void Zoom_Init() {
    15d8:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    15da:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    15e0:	7004           	moveq #4,d0
    15e2:	7202           	moveq #2,d1
    15e4:	4eae ff3a      	jsr -198(a6)
  ZoomHorizontal = 16;
    15e8:	33fc 0010 0000 	move.w #16,7782 <ZoomHorizontal>
    15ee:	7782 
}
    15f0:	2c5f           	movea.l (sp)+,a6
    15f2:	4e75           	rts

000015f4 <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    15f4:	2039 0000 7784 	move.l 7784 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    15fa:	23f9 0000 7772 	move.l 7772 <ViewCopper>,7784 <DrawCopper>
    1600:	0000 7784 
  ViewCopper = (ULONG *)tmp;
    1604:	23c0 0000 7772 	move.l d0,7772 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    160a:	2079 0000 779a 	movea.l 779a <hw>,a0
    1610:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    1614:	3140 0088      	move.w d0,136(a0)
}
    1618:	4e75           	rts

0000161a <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    161a:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    161e:	45fa fd38      	lea 1358 <ClbuildZoom>(pc),a2
    1622:	4e92           	jsr (a2)
    1624:	23c0 0000 778c 	move.l d0,778c <Copperlist1>
  Copperlist2 = ClbuildZoom();
    162a:	4e92           	jsr (a2)
    162c:	23c0 0000 777e 	move.l d0,777e <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1632:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    1638:	203c 0001 6800 	move.l #92160,d0
    163e:	7202           	moveq #2,d1
    1640:	4eae ff3a      	jsr -198(a6)
    1644:	23c0 0000 777a 	move.l d0,777a <Bitplane1>
  if(Bitplane1 == 0) {
    164a:	6700 014e      	beq.w 179a <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    164e:	23c0 0000 7792 	move.l d0,7792 <DrawBuffer>
  DrawCopper = Copperlist1;
    1654:	23f9 0000 778c 	move.l 778c <Copperlist1>,7784 <DrawCopper>
    165a:	0000 7784 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    165e:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    1664:	203c 0001 6800 	move.l #92160,d0
    166a:	7202           	moveq #2,d1
    166c:	4eae ff3a      	jsr -198(a6)
    1670:	2400           	move.l d0,d2
    1672:	23c0 0000 7776 	move.l d0,7776 <Bitplane2>
  if(Bitplane2 == 0) {
    1678:	6778           	beq.s 16f2 <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    167a:	23f9 0000 777e 	move.l 777e <Copperlist2>,7772 <ViewCopper>
    1680:	0000 7772 
  SwapCl();
    1684:	45fa ff6e      	lea 15f4 <SwapCl>(pc),a2
    1688:	4e92           	jsr (a2)

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
    168a:	2039 0000 7792 	move.l 7792 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    1690:	2079 0000 7784 	movea.l 7784 <DrawCopper>,a0
  copword += ZMBPLPTRS+1;
  for(int i=1;i<=2;i++) {
    UWORD highword = ptr >> 16;
    1696:	2200           	move.l d0,d1
    1698:	4241           	clr.w d1
    169a:	4841           	swap d1
    169c:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    16a0:	3140 0076      	move.w d0,118(a0)
    *copword = highword;
    copword += 2;
    *copword = lowword;
    copword += 2;
    ptr += 40*256;
    16a4:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    16aa:	2200           	move.l d0,d1
    16ac:	4241           	clr.w d1
    16ae:	4841           	swap d1
    16b0:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    16b4:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    16b8:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    16ba:	2079 0000 7784 	movea.l 7784 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    16c0:	2002           	move.l d2,d0
    16c2:	4240           	clr.w d0
    16c4:	4840           	swap d0
    16c6:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    16ca:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    16ce:	2002           	move.l d2,d0
    16d0:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    16d6:	2200           	move.l d0,d1
    16d8:	4241           	clr.w d1
    16da:	4841           	swap d1
    16dc:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    16e0:	3140 007e      	move.w d0,126(a0)
  }
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
  ViewBuffer = (ULONG *) tmp;
    16e4:	23c2 0000 7788 	move.l d2,7788 <ViewBuffer>
}
    16ea:	7000           	moveq #0,d0
    16ec:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    16f0:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    16f2:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    16f8:	4eae ffc4      	jsr -60(a6)
    16fc:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1702:	2200           	move.l d0,d1
    1704:	243c 0000 4dd6 	move.l #19926,d2
    170a:	7626           	moveq #38,d3
    170c:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1710:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1716:	7201           	moveq #1,d1
    1718:	4eae ff70      	jsr -144(a6)
    171c:	2439 0000 7776 	move.l 7776 <Bitplane2>,d2
  ViewCopper = Copperlist2;
    1722:	23f9 0000 777e 	move.l 777e <Copperlist2>,7772 <ViewCopper>
    1728:	0000 7772 
  SwapCl();
    172c:	45fa fec6      	lea 15f4 <SwapCl>(pc),a2
    1730:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    1732:	2039 0000 7792 	move.l 7792 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    1738:	2079 0000 7784 	movea.l 7784 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    173e:	2200           	move.l d0,d1
    1740:	4241           	clr.w d1
    1742:	4841           	swap d1
    1744:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    1748:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    174c:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    1752:	2200           	move.l d0,d1
    1754:	4241           	clr.w d1
    1756:	4841           	swap d1
    1758:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    175c:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    1760:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    1762:	2079 0000 7784 	movea.l 7784 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    1768:	2002           	move.l d2,d0
    176a:	4240           	clr.w d0
    176c:	4840           	swap d0
    176e:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    1772:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    1776:	2002           	move.l d2,d0
    1778:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    177e:	2200           	move.l d0,d1
    1780:	4241           	clr.w d1
    1782:	4841           	swap d1
    1784:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    1788:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    178c:	23c2 0000 7788 	move.l d2,7788 <ViewBuffer>
}
    1792:	7000           	moveq #0,d0
    1794:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1798:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    179a:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    17a0:	4eae ffc4      	jsr -60(a6)
    17a4:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    17aa:	2200           	move.l d0,d1
    17ac:	243c 0000 4daf 	move.l #19887,d2
    17b2:	7626           	moveq #38,d3
    17b4:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    17b8:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    17be:	7201           	moveq #1,d1
    17c0:	4eae ff70      	jsr -144(a6)
    17c4:	2039 0000 777a 	move.l 777a <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    17ca:	23c0 0000 7792 	move.l d0,7792 <DrawBuffer>
  DrawCopper = Copperlist1;
    17d0:	23f9 0000 778c 	move.l 778c <Copperlist1>,7784 <DrawCopper>
    17d6:	0000 7784 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    17da:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    17e0:	203c 0001 6800 	move.l #92160,d0
    17e6:	7202           	moveq #2,d1
    17e8:	4eae ff3a      	jsr -198(a6)
    17ec:	2400           	move.l d0,d2
    17ee:	23c0 0000 7776 	move.l d0,7776 <Bitplane2>
  if(Bitplane2 == 0) {
    17f4:	6600 fe84      	bne.w 167a <PrepareDisplayZoom+0x60>
    17f8:	6000 fef8      	bra.w 16f2 <PrepareDisplayZoom+0xd8>

000017fc <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    17fc:	2039 0000 7792 	move.l 7792 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    1802:	2079 0000 7784 	movea.l 7784 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    1808:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    180c:	2200           	move.l d0,d1
    180e:	4241           	clr.w d1
    1810:	4841           	swap d1
    1812:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    1816:	23f9 0000 7788 	move.l 7788 <ViewBuffer>,7792 <DrawBuffer>
    181c:	0000 7792 
  ViewBuffer = (ULONG *) tmp;
    1820:	23c0 0000 7788 	move.l d0,7788 <ViewBuffer>
}
    1826:	4e75           	rts

00001828 <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    1828:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    182c:	262f 0010      	move.l 16(sp),d3
    1830:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    1834:	2279 0000 778c 	movea.l 778c <Copperlist1>,a1
    183a:	b2fc 0000      	cmpa.w #0,a1
    183e:	670c           	beq.s 184c <FreeDisplay+0x24>
    1840:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    1846:	2003           	move.l d3,d0
    1848:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    184c:	2279 0000 777e 	movea.l 777e <Copperlist2>,a1
    1852:	b2fc 0000      	cmpa.w #0,a1
    1856:	670c           	beq.s 1864 <FreeDisplay+0x3c>
    1858:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    185e:	2003           	move.l d3,d0
    1860:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    1864:	2279 0000 777a 	movea.l 777a <Bitplane1>,a1
    186a:	b2fc 0000      	cmpa.w #0,a1
    186e:	670c           	beq.s 187c <FreeDisplay+0x54>
    1870:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    1876:	2002           	move.l d2,d0
    1878:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    187c:	2279 0000 7776 	movea.l 7776 <Bitplane2>,a1
    1882:	b2fc 0000      	cmpa.w #0,a1
    1886:	670c           	beq.s 1894 <FreeDisplay+0x6c>
    1888:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    188e:	2002           	move.l d2,d0
    1890:	4eae ff2e      	jsr -210(a6)
}
    1894:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    1898:	4e75           	rts

0000189a <WaitVbl>:
void WaitVbl() {
    189a:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    189c:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddabb2>,d0
    18a2:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    18a4:	2017           	move.l (sp),d0
    18a6:	0280 0001 ff00 	andi.l #130816,d0
    18ac:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    18ae:	2017           	move.l (sp),d0
    18b0:	0c80 0001 3700 	cmpi.l #79616,d0
    18b6:	67e4           	beq.s 189c <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    18b8:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddabb2>,d0
    18be:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    18c2:	202f 0004      	move.l 4(sp),d0
    18c6:	0280 0001 ff00 	andi.l #130816,d0
    18cc:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    18d0:	202f 0004      	move.l 4(sp),d0
    18d4:	0c80 0001 3700 	cmpi.l #79616,d0
    18da:	66dc           	bne.s 18b8 <WaitVbl+0x1e>
}
    18dc:	508f           	addq.l #8,sp
    18de:	4e75           	rts

000018e0 <ZoomTest>:
void ZoomTest() {
    18e0:	4fef ff50      	lea -176(sp),sp
    18e4:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
  hw->dmacon = 0b1000010000000000; //Blitter nasty
    18e8:	2079 0000 779a 	movea.l 779a <hw>,a0
    18ee:	317c 8400 0096 	move.w #-31744,150(a0)
  Counter4Frames = 0;
    18f4:	42b9 0000 77a2 	clr.l 77a2 <Counter4Frames>
  if ((vbint = AllocMem(sizeof(struct Interrupt),    
    18fa:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    1900:	7016           	moveq #22,d0
    1902:	223c 0001 0001 	move.l #65537,d1
    1908:	4eae ff3a      	jsr -198(a6)
    190c:	2440           	movea.l d0,a2
    190e:	4a80           	tst.l d0
    1910:	671a           	beq.s 192c <ZoomTest+0x4c>
    vbint->is_Node.ln_Type = NT_INTERRUPT;       
    1912:	357c 02c4 0008 	move.w #708,8(a2)
    vbint->is_Node.ln_Name = "VertB-Example";
    1918:	257c 0000 4dfd 	move.l #19965,10(a2)
    191e:	000a 
    vbint->is_Data = NULL;
    1920:	42aa 000e      	clr.l 14(a2)
    vbint->is_Code = Vblankcounter;
    1924:	257c 0000 0ac4 	move.l #2756,18(a2)
    192a:	0012 
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    192c:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    1932:	203c 0001 1440 	move.l #70720,d0
    1938:	7202           	moveq #2,d1
    193a:	4eae ff3a      	jsr -198(a6)
    193e:	2800           	move.l d0,d4
  if( source == 0) {
    1940:	6700 28d6      	beq.w 4218 <ZoomTest+0x2938>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    1944:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    194a:	203c 0001 1440 	move.l #70720,d0
    1950:	7202           	moveq #2,d1
    1952:	4eae ff3a      	jsr -198(a6)
    1956:	2a00           	move.l d0,d5
  if( destination == 0) {
    1958:	6700 2908      	beq.w 4262 <ZoomTest+0x2982>
    195c:	2004           	move.l d4,d0
    195e:	0680 0000 3300 	addi.l #13056,d0
    1964:	2044           	movea.l d4,a0
      *tmp4source++ = 0x55555555;
    1966:	20bc 5555 5555 	move.l #1431655765,(a0)
    196c:	217c 5555 5555 	move.l #1431655765,4(a0)
    1972:	0004 
    1974:	217c 5555 5555 	move.l #1431655765,8(a0)
    197a:	0008 
    197c:	217c 5555 5555 	move.l #1431655765,12(a0)
    1982:	000c 
    1984:	217c 5555 5555 	move.l #1431655765,16(a0)
    198a:	0010 
    198c:	217c 5555 5555 	move.l #1431655765,20(a0)
    1992:	0014 
    1994:	217c 5555 5555 	move.l #1431655765,24(a0)
    199a:	0018 
    199c:	217c 5555 5555 	move.l #1431655765,28(a0)
    19a2:	001c 
    19a4:	217c 5555 5555 	move.l #1431655765,32(a0)
    19aa:	0020 
    19ac:	217c 5555 5555 	move.l #1431655765,36(a0)
    19b2:	0024 
    19b4:	217c 5555 5555 	move.l #1431655765,40(a0)
    19ba:	0028 
    19bc:	217c 5555 5555 	move.l #1431655765,44(a0)
    19c2:	002c 
      *tmp4source++ = 0xaaaaaaaa;
    19c4:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
    19ca:	0030 
    19cc:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
    19d2:	0034 
    19d4:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
    19da:	0038 
    19dc:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
    19e2:	003c 
    19e4:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
    19ea:	0040 
    19ec:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
    19f2:	0044 
    19f4:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
    19fa:	0048 
    19fc:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
    1a02:	004c 
    1a04:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
    1a0a:	0050 
    1a0c:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
    1a12:	0054 
    1a14:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
    1a1a:	0058 
    1a1c:	41e8 0060      	lea 96(a0),a0
    1a20:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
    1a26:	fffc 
  for(int i=0;i<128+8;i++) {
    1a28:	b1c0           	cmpa.l d0,a0
    1a2a:	6600 ff3a      	bne.w 1966 <ZoomTest+0x86>
  WaitVbl();
    1a2e:	4eba fe6a      	jsr 189a <WaitVbl>(pc)
  Init_Blit();
    1a32:	4eba f8fe      	jsr 1332 <Init_Blit>(pc)
    ZoomBlit_Increment4SrcA = 1;
    1a36:	33fc 0001 0000 	move.w #1,7790 <ZoomBlit_Increment4SrcA>
    1a3c:	7790 
  WaitBlit(); 
    1a3e:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    1a44:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    1a48:	2079 0000 779a 	movea.l 779a <hw>,a0
    1a4e:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1a54:	317c fde4 0040 	move.w #-540,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1a5a:	317c fff8 0070 	move.w #-8,112(a0)
  AddIntServer(INTB_VERTB, vbint);
    1a60:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    1a66:	7005           	moveq #5,d0
    1a68:	224a           	movea.l a2,a1
    1a6a:	4eae ff58      	jsr -168(a6)
  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    1a6e:	4878 0005      	pea 5 <_start+0x5>
    1a72:	42a7           	clr.l -(sp)
    1a74:	2f05           	move.l d5,-(sp)
    1a76:	2f04           	move.l d4,-(sp)
    1a78:	4eba f48c      	jsr f06 <Zoom_ZoomIntoPicture>(pc)
  RemIntServer(INTB_VERTB, vbint);
    1a7c:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    1a82:	7005           	moveq #5,d0
    1a84:	224a           	movea.l a2,a1
    1a86:	4eae ff52      	jsr -174(a6)
  if( Counter4Frames > 6)
    1a8a:	4fef 0010      	lea 16(sp),sp
    1a8e:	7006           	moveq #6,d0
    1a90:	b0b9 0000 77a2 	cmp.l 77a2 <Counter4Frames>,d0
    1a96:	6c1e           	bge.s 1ab6 <ZoomTest+0x1d6>
    Write( Output(), "TestSpeed4Zoom: Takes too long\n", 31);
    1a98:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1a9e:	4eae ffc4      	jsr -60(a6)
    1aa2:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1aa8:	2200           	move.l d0,d1
    1aaa:	243c 0000 4e7e 	move.l #20094,d2
    1ab0:	761f           	moveq #31,d3
    1ab2:	4eae ffd0      	jsr -48(a6)
  FreeMem( source, ( ZMLINESIZE+4)*272*5);
    1ab6:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    1abc:	2244           	movea.l d4,a1
    1abe:	203c 0001 1440 	move.l #70720,d0
    1ac4:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, ( ZMLINESIZE+4)*272*5);
    1ac8:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    1ace:	2245           	movea.l d5,a1
    1ad0:	203c 0001 1440 	move.l #70720,d0
    1ad6:	4eae ff2e      	jsr -210(a6)
  PrepareDisplayZoom();
    1ada:	4bfa fb3e      	lea 161a <PrepareDisplayZoom>(pc),a5
    1ade:	4e95           	jsr (a5)
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    1ae0:	4878 0010      	pea 10 <main+0xa>
    1ae4:	4879 0000 73e8 	pea 73e8 <ClsSprites>
    1aea:	42a7           	clr.l -(sp)
    1aec:	2f39 0000 778c 	move.l 778c <Copperlist1>,-(sp)
    1af2:	47fa eff6      	lea aea <TestCopperlistBatch>(pc),a3
    1af6:	4e93           	jsr (a3)
    1af8:	4fef 0010      	lea 16(sp),sp
    1afc:	4a80           	tst.l d0
    1afe:	661e           	bne.s 1b1e <ZoomTest+0x23e>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    1b00:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1b06:	4eae ffc4      	jsr -60(a6)
    1b0a:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1b10:	2200           	move.l d0,d1
    1b12:	243c 0000 4e9e 	move.l #20126,d2
    1b18:	762c           	moveq #44,d3
    1b1a:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    1b1e:	4878 000c      	pea c <main+0x6>
    1b22:	4879 0000 73b8 	pea 73b8 <ClScreen>
    1b28:	4878 0010      	pea 10 <main+0xa>
    1b2c:	2f39 0000 778c 	move.l 778c <Copperlist1>,-(sp)
    1b32:	4e93           	jsr (a3)
    1b34:	4fef 0010      	lea 16(sp),sp
    1b38:	4a80           	tst.l d0
    1b3a:	661e           	bne.s 1b5a <ZoomTest+0x27a>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
    1b3c:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1b42:	4eae ffc4      	jsr -60(a6)
    1b46:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1b4c:	2200           	move.l d0,d1
    1b4e:	243c 0000 4ed4 	move.l #20180,d2
    1b54:	7636           	moveq #54,d3
    1b56:	4eae ffd0      	jsr -48(a6)
  UWORD *copword = (UWORD *) DrawCopper;
    1b5a:	2079 0000 7784 	movea.l 7784 <DrawCopper>,a0
    *copword = highword;
    1b60:	317c 0004 0072 	move.w #4,114(a0)
    *copword = lowword;
    1b66:	4268 0076      	clr.w 118(a0)
    *copword = highword;
    1b6a:	317c 0004 007a 	move.w #4,122(a0)
    *copword = lowword;
    1b70:	317c 2800 007e 	move.w #10240,126(a0)
  DrawBuffer = ViewBuffer;
    1b76:	23fc 0005 0000 	move.l #327680,7792 <DrawBuffer>
    1b7c:	0000 7792 
  ViewBuffer = (ULONG *) tmp;
    1b80:	23fc 0004 0000 	move.l #262144,7788 <ViewBuffer>
    1b86:	0000 7788 
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    1b8a:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    1b90:	4878 001c      	pea 1c <main+0x16>
    1b94:	2f39 0000 778c 	move.l 778c <Copperlist1>,-(sp)
    1b9a:	45fa ef30      	lea acc <TestCopperlistPos>(pc),a2
    1b9e:	4e92           	jsr (a2)
    1ba0:	4fef 000c      	lea 12(sp),sp
    1ba4:	4a80           	tst.l d0
    1ba6:	661e           	bne.s 1bc6 <ZoomTest+0x2e6>
    Write(Output(), 
    1ba8:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1bae:	4eae ffc4      	jsr -60(a6)
    1bb2:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1bb8:	2200           	move.l d0,d1
    1bba:	243c 0000 4f0b 	move.l #20235,d2
    1bc0:	763c           	moveq #60,d3
    1bc2:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    1bc6:	2f3c 00e2 0000 	move.l #14811136,-(sp)
    1bcc:	4878 001d      	pea 1d <main+0x17>
    1bd0:	2f39 0000 778c 	move.l 778c <Copperlist1>,-(sp)
    1bd6:	4e92           	jsr (a2)
    1bd8:	4fef 000c      	lea 12(sp),sp
    1bdc:	4a80           	tst.l d0
    1bde:	661e           	bne.s 1bfe <ZoomTest+0x31e>
    Write(Output(), 
    1be0:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1be6:	4eae ffc4      	jsr -60(a6)
    1bea:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1bf0:	2200           	move.l d0,d1
    1bf2:	243c 0000 4f48 	move.l #20296,d2
    1bf8:	763c           	moveq #60,d3
    1bfa:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    1bfe:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    1c04:	4878 001e      	pea 1e <main+0x18>
    1c08:	2f39 0000 778c 	move.l 778c <Copperlist1>,-(sp)
    1c0e:	4e92           	jsr (a2)
    1c10:	4fef 000c      	lea 12(sp),sp
    1c14:	4a80           	tst.l d0
    1c16:	661e           	bne.s 1c36 <ZoomTest+0x356>
    Write(Output(), 
    1c18:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1c1e:	4eae ffc4      	jsr -60(a6)
    1c22:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1c28:	2200           	move.l d0,d1
    1c2a:	243c 0000 4f85 	move.l #20357,d2
    1c30:	763c           	moveq #60,d3
    1c32:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
    1c36:	2f3c 00e6 2800 	move.l #15083520,-(sp)
    1c3c:	4878 001f      	pea 1f <main+0x19>
    1c40:	2f39 0000 778c 	move.l 778c <Copperlist1>,-(sp)
    1c46:	4e92           	jsr (a2)
    1c48:	4fef 000c      	lea 12(sp),sp
    1c4c:	4a80           	tst.l d0
    1c4e:	661e           	bne.s 1c6e <ZoomTest+0x38e>
    Write(Output(), 
    1c50:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1c56:	4eae ffc4      	jsr -60(a6)
    1c5a:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1c60:	2200           	move.l d0,d1
    1c62:	243c 0000 4fc2 	move.l #20418,d2
    1c68:	763c           	moveq #60,d3
    1c6a:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
    1c6e:	4878 0002      	pea 2 <_start+0x2>
    1c72:	4879 0000 73b0 	pea 73b0 <ClColor>
    1c78:	4878 0020      	pea 20 <main+0x1a>
    1c7c:	2f39 0000 778c 	move.l 778c <Copperlist1>,-(sp)
    1c82:	4e93           	jsr (a3)
    1c84:	4fef 0010      	lea 16(sp),sp
    1c88:	4a80           	tst.l d0
    1c8a:	661e           	bne.s 1caa <ZoomTest+0x3ca>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    1c8c:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1c92:	4eae ffc4      	jsr -60(a6)
    1c96:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1c9c:	2200           	move.l d0,d1
    1c9e:	243c 0000 4fff 	move.l #20479,d2
    1ca4:	7621           	moveq #33,d3
    1ca6:	4eae ffd0      	jsr -48(a6)
  if( TestCopperlistPos( Copperlist1, 34, 0xfffffffe) == 0)
    1caa:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdbbac>
    1cae:	4878 0022      	pea 22 <main+0x1c>
    1cb2:	2f39 0000 778c 	move.l 778c <Copperlist1>,-(sp)
    1cb8:	4e92           	jsr (a2)
    1cba:	4fef 000c      	lea 12(sp),sp
    1cbe:	4a80           	tst.l d0
    1cc0:	661e           	bne.s 1ce0 <ZoomTest+0x400>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
    1cc2:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1cc8:	4eae ffc4      	jsr -60(a6)
    1ccc:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1cd2:	2200           	move.l d0,d1
    1cd4:	243c 0000 5021 	move.l #20513,d2
    1cda:	7622           	moveq #34,d3
    1cdc:	4eae ffd0      	jsr -48(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    1ce0:	2f3c 0001 6800 	move.l #92160,-(sp)
    1ce6:	2f3c 0000 a48c 	move.l #42124,-(sp)
    1cec:	47fa fb3a      	lea 1828 <FreeDisplay>(pc),a3
    1cf0:	4e93           	jsr (a3)
  Zoom_Init();
    1cf2:	49fa f8e4      	lea 15d8 <Zoom_Init>(pc),a4
    1cf6:	4e94           	jsr (a4)
  PrepareDisplayZoom();
    1cf8:	4e95           	jsr (a5)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    1cfa:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    1d00:	203c 0000 c800 	move.l #51200,d0
    1d06:	7202           	moveq #2,d1
    1d08:	4eae ff3a      	jsr -198(a6)
    1d0c:	2040           	movea.l d0,a0
    1d0e:	23c0 0000 7796 	move.l d0,7796 <Zoom_Source>
  if( Zoom_Source == 0) {
    1d14:	508f           	addq.l #8,sp
    1d16:	6700 24de      	beq.w 41f6 <ZoomTest+0x2916>
  *tstsource++ = 0x0000;
    1d1a:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    1d1c:	317c 0080 0002 	move.w #128,2(a0)
  *tstsource = 0x1000;
    1d22:	317c 1000 0030 	move.w #4096,48(a0)
  *tstsource = 0x8e88;
    1d28:	317c 8e88 0032 	move.w #-29048,50(a0)
  *tstsource++ = 0x0000;
    1d2e:	4268 17d0      	clr.w 6096(a0)
  *tstsource = 0x00ff;
    1d32:	317c 00ff 17d2 	move.w #255,6098(a0)
  WaitBlit();
    1d38:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    1d3e:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    1d42:	4eba f5ee      	jsr 1332 <Init_Blit>(pc)
    ZoomBlit_Increment4SrcA = 1;
    1d46:	33fc 0001 0000 	move.w #1,7790 <ZoomBlit_Increment4SrcA>
    1d4c:	7790 
  WaitBlit(); 
    1d4e:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    1d54:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    1d58:	2479 0000 779a 	movea.l 779a <hw>,a2
    1d5e:	357c 0000 0042 	move.w #0,66(a2)
  hw->bltcon0 = 0xde4 + shifta;
    1d64:	357c fde4 0040 	move.w #-540,64(a2)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1d6a:	357c ff00 0070 	move.w #-256,112(a2)
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    1d70:	2639 0000 7792 	move.l 7792 <DrawBuffer>,d3
    1d76:	2439 0000 7796 	move.l 7796 <Zoom_Source>,d2
  WaitBlt();
    1d7c:	4eba f172      	jsr ef0 <WaitBlt>(pc)
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    1d80:	7000           	moveq #0,d0
    1d82:	3039 0000 7790 	move.w 7790 <ZoomBlit_Increment4SrcA>,d0
    1d88:	d080           	add.l d0,d0
    1d8a:	d082           	add.l d2,d0
    1d8c:	2540 0050      	move.l d0,80(a2)
  hw->bltbpt = source;
    1d90:	2542 004c      	move.l d2,76(a2)
  hw->bltdpt = destination;
    1d94:	2543 0054      	move.l d3,84(a2)
  hw->bltsize = height*64+2;
    1d98:	357c 2002 0058 	move.w #8194,88(a2)
  WaitBlit();
    1d9e:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    1da4:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    1da8:	2479 0000 7792 	movea.l 7792 <DrawBuffer>,a2
  if( *destination != 0x0180) {
    1dae:	0c6a 0180 0002 	cmpi.w #384,2(a2)
    1db4:	671e           	beq.s 1dd4 <ZoomTest+0x4f4>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    1db6:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1dbc:	4eae ffc4      	jsr -60(a6)
    1dc0:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1dc6:	2200           	move.l d0,d1
    1dc8:	243c 0000 507c 	move.l #20604,d2
    1dce:	761c           	moveq #28,d3
    1dd0:	4eae ffd0      	jsr -48(a6)
  if( *destination != 0x1d88)
    1dd4:	0c6a 1d88 0032 	cmpi.w #7560,50(a2)
    1dda:	671e           	beq.s 1dfa <ZoomTest+0x51a>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    1ddc:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1de2:	4eae ffc4      	jsr -60(a6)
    1de6:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1dec:	2200           	move.l d0,d1
    1dee:	243c 0000 5099 	move.l #20633,d2
    1df4:	761c           	moveq #28,d3
    1df6:	4eae ffd0      	jsr -48(a6)
  if( *destination != 0x01ff) {
    1dfa:	2079 0000 7792 	movea.l 7792 <DrawBuffer>,a0
    1e00:	0c68 01ff 17d2 	cmpi.w #511,6098(a0)
    1e06:	671e           	beq.s 1e26 <ZoomTest+0x546>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    1e08:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1e0e:	4eae ffc4      	jsr -60(a6)
    1e12:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    1e18:	2200           	move.l d0,d1
    1e1a:	243c 0000 50b6 	move.l #20662,d2
    1e20:	761a           	moveq #26,d3
    1e22:	4eae ffd0      	jsr -48(a6)
  FreeMem( Zoom_Source, 40*256*5);
    1e26:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    1e2c:	2279 0000 7796 	movea.l 7796 <Zoom_Source>,a1
    1e32:	203c 0000 c800 	move.l #51200,d0
    1e38:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    1e3c:	2f3c 0001 6800 	move.l #92160,-(sp)
    1e42:	2f3c 0000 a48c 	move.l #42124,-(sp)
    1e48:	4e93           	jsr (a3)
    1e4a:	508f           	addq.l #8,sp
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    1e4c:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    1e52:	203c 0000 05a0 	move.l #1440,d0
    1e58:	7202           	moveq #2,d1
    1e5a:	4eae ff3a      	jsr -198(a6)
    1e5e:	2440           	movea.l d0,a2
  if( source == 0) {
    1e60:	4a80           	tst.l d0
    1e62:	6700 22fc      	beq.w 4160 <ZoomTest+0x2880>
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    1e66:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    1e6c:	203c 0000 05a0 	move.l #1440,d0
    1e72:	7202           	moveq #2,d1
    1e74:	4eae ff3a      	jsr -198(a6)
    1e78:	2640           	movea.l d0,a3
  if( destination == 0) {
    1e7a:	4a80           	tst.l d0
    1e7c:	6700 22e2      	beq.w 4160 <ZoomTest+0x2880>
    *tmp++ = 0;
    1e80:	4252           	clr.w (a2)
    *tmp++ = 0xaaaa;
    1e82:	357c aaaa 0002 	move.w #-21846,2(a2)
    *tmp++ = 0xaaaa;
    1e88:	357c aaaa 0004 	move.w #-21846,4(a2)
    *tmp = 0;
    1e8e:	426a 0006      	clr.w 6(a2)
    *tmp++ = 0;
    1e92:	426a 0030      	clr.w 48(a2)
    *tmp++ = 0x5555;
    1e96:	357c 5555 0032 	move.w #21845,50(a2)
    *tmp++ = 0x5555;
    1e9c:	357c 5555 0034 	move.w #21845,52(a2)
    *tmp = 0;
    1ea2:	426a 0036      	clr.w 54(a2)
    *tmp++ = 0;
    1ea6:	426a 0060      	clr.w 96(a2)
    *tmp++ = 0xaaaa;
    1eaa:	357c aaaa 0062 	move.w #-21846,98(a2)
    *tmp++ = 0xaaaa;
    1eb0:	357c aaaa 0064 	move.w #-21846,100(a2)
    *tmp = 0;
    1eb6:	426a 0066      	clr.w 102(a2)
    *tmp++ = 0;
    1eba:	426a 0090      	clr.w 144(a2)
    *tmp++ = 0x5555;
    1ebe:	357c 5555 0092 	move.w #21845,146(a2)
    *tmp++ = 0x5555;
    1ec4:	357c 5555 0094 	move.w #21845,148(a2)
    *tmp = 0;
    1eca:	426a 0096      	clr.w 150(a2)
    *tmp++ = 0;
    1ece:	426a 00c0      	clr.w 192(a2)
    *tmp++ = 0xaaaa;
    1ed2:	357c aaaa 00c2 	move.w #-21846,194(a2)
    *tmp++ = 0xaaaa;
    1ed8:	357c aaaa 00c4 	move.w #-21846,196(a2)
    *tmp = 0;
    1ede:	426a 00c6      	clr.w 198(a2)
    *tmp++ = 0;
    1ee2:	426a 00f0      	clr.w 240(a2)
    *tmp++ = 0x5555;
    1ee6:	357c 5555 00f2 	move.w #21845,242(a2)
    *tmp++ = 0x5555;
    1eec:	357c 5555 00f4 	move.w #21845,244(a2)
    *tmp = 0;
    1ef2:	426a 00f6      	clr.w 246(a2)
    *tmp++ = 0;
    1ef6:	426a 0120      	clr.w 288(a2)
    *tmp++ = 0xaaaa;
    1efa:	357c aaaa 0122 	move.w #-21846,290(a2)
    *tmp++ = 0xaaaa;
    1f00:	357c aaaa 0124 	move.w #-21846,292(a2)
    *tmp = 0;
    1f06:	426a 0126      	clr.w 294(a2)
    *tmp++ = 0;
    1f0a:	426a 0150      	clr.w 336(a2)
    *tmp++ = 0x5555;
    1f0e:	357c 5555 0152 	move.w #21845,338(a2)
    *tmp++ = 0x5555;
    1f14:	357c 5555 0154 	move.w #21845,340(a2)
    *tmp = 0;
    1f1a:	426a 0156      	clr.w 342(a2)
    *tmp++ = 0;
    1f1e:	426a 0180      	clr.w 384(a2)
    *tmp++ = 0xaaaa;
    1f22:	357c aaaa 0182 	move.w #-21846,386(a2)
    *tmp++ = 0xaaaa;
    1f28:	357c aaaa 0184 	move.w #-21846,388(a2)
    *tmp = 0;
    1f2e:	426a 0186      	clr.w 390(a2)
    *tmp++ = 0;
    1f32:	426a 01b0      	clr.w 432(a2)
    *tmp++ = 0x5555;
    1f36:	357c 5555 01b2 	move.w #21845,434(a2)
    *tmp++ = 0x5555;
    1f3c:	357c 5555 01b4 	move.w #21845,436(a2)
    *tmp = 0;
    1f42:	426a 01b6      	clr.w 438(a2)
    *tmp++ = 0;
    1f46:	426a 01e0      	clr.w 480(a2)
    *tmp++ = 0xaaaa;
    1f4a:	357c aaaa 01e2 	move.w #-21846,482(a2)
    *tmp++ = 0xaaaa;
    1f50:	357c aaaa 01e4 	move.w #-21846,484(a2)
    *tmp = 0;
    1f56:	426a 01e6      	clr.w 486(a2)
    *tmp++ = 0;
    1f5a:	426a 0210      	clr.w 528(a2)
    *tmp++ = 0x5555;
    1f5e:	357c 5555 0212 	move.w #21845,530(a2)
    *tmp++ = 0x5555;
    1f64:	357c 5555 0214 	move.w #21845,532(a2)
    *tmp = 0;
    1f6a:	426a 0216      	clr.w 534(a2)
    *tmp++ = 0;
    1f6e:	426a 0240      	clr.w 576(a2)
    *tmp++ = 0xaaaa;
    1f72:	357c aaaa 0242 	move.w #-21846,578(a2)
    *tmp++ = 0xaaaa;
    1f78:	357c aaaa 0244 	move.w #-21846,580(a2)
    *tmp = 0;
    1f7e:	426a 0246      	clr.w 582(a2)
    *tmp++ = 0;
    1f82:	426a 0270      	clr.w 624(a2)
    *tmp++ = 0x5555;
    1f86:	357c 5555 0272 	move.w #21845,626(a2)
    *tmp++ = 0x5555;
    1f8c:	357c 5555 0274 	move.w #21845,628(a2)
    *tmp = 0;
    1f92:	426a 0276      	clr.w 630(a2)
    *tmp++ = 0;
    1f96:	426a 02a0      	clr.w 672(a2)
    *tmp++ = 0xaaaa;
    1f9a:	357c aaaa 02a2 	move.w #-21846,674(a2)
    *tmp++ = 0xaaaa;
    1fa0:	357c aaaa 02a4 	move.w #-21846,676(a2)
    *tmp = 0;
    1fa6:	426a 02a6      	clr.w 678(a2)
    *tmp++ = 0;
    1faa:	426a 02d0      	clr.w 720(a2)
    *tmp++ = 0x5555;
    1fae:	357c 5555 02d2 	move.w #21845,722(a2)
    *tmp++ = 0x5555;
    1fb4:	357c 5555 02d4 	move.w #21845,724(a2)
    *tmp = 0;
    1fba:	426a 02d6      	clr.w 726(a2)
    tmp += ZMLINESIZE/2-3;
    1fbe:	4878 05a0      	pea 5a0 <main+0x59a>
    1fc2:	42a7           	clr.l -(sp)
    1fc4:	2f00           	move.l d0,-(sp)
    1fc6:	4eba 2370      	jsr 4338 <memset>(pc)
  WaitBlit();
    1fca:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    1fd0:	4eae ff1c      	jsr -228(a6)
  Zoom_Init();
    1fd4:	4e94           	jsr (a4)
  WaitBlit();
    1fd6:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    1fdc:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
    1fe0:	2879 0000 779a 	movea.l 779a <hw>,a4
    1fe6:	397c 39f0 0040 	move.w #14832,64(a4)
  hw->bltcon1 = 0;
    1fec:	397c 0000 0042 	move.w #0,66(a4)
  WaitBlt();
    1ff2:	4eba eefc      	jsr ef0 <WaitBlt>(pc)
  hw->bltapt = (UWORD *) source;
    1ff6:	200a           	move.l a2,d0
    1ff8:	5480           	addq.l #2,d0
    1ffa:	2940 0050      	move.l d0,80(a4)
  hw->bltdpt = (UWORD *) destination;
    1ffe:	294b 0054      	move.l a3,84(a4)
  hw->bltsize = height*64+2;
    2002:	397c 0402 0058 	move.w #1026,88(a4)
  WaitBlit();
    2008:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    200e:	4eae ff1c      	jsr -228(a6)
  if( *tmp != 0x5555) 
    2012:	4fef 000c      	lea 12(sp),sp
    2016:	0c6b 5555 0002 	cmpi.w #21845,2(a3)
    201c:	671e           	beq.s 203c <ZoomTest+0x75c>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    201e:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    2024:	4eae ffc4      	jsr -60(a6)
    2028:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    202e:	2200           	move.l d0,d1
    2030:	243c 0000 5107 	move.l #20743,d2
    2036:	761f           	moveq #31,d3
    2038:	4eae ffd0      	jsr -48(a6)
  if( *tmp != 0xaaaa)
    203c:	0c6b aaaa 0032 	cmpi.w #-21846,50(a3)
    2042:	671e           	beq.s 2062 <ZoomTest+0x782>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    2044:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    204a:	4eae ffc4      	jsr -60(a6)
    204e:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    2054:	2200           	move.l d0,d1
    2056:	243c 0000 5127 	move.l #20775,d2
    205c:	7620           	moveq #32,d3
    205e:	4eae ffd0      	jsr -48(a6)
  FreeMem( source,ZMLINESIZE*30);
    2062:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    2068:	224a           	movea.l a2,a1
    206a:	203c 0000 05a0 	move.l #1440,d0
    2070:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    2074:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    207a:	224b           	movea.l a3,a1
    207c:	203c 0000 05a0 	move.l #1440,d0
    2082:	4eae ff2e      	jsr -210(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    2086:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    208c:	203c 0000 3740 	move.l #14144,d0
    2092:	7202           	moveq #2,d1
    2094:	4eae ff3a      	jsr -198(a6)
    2098:	2600           	move.l d0,d3
  if( source == 0) {
    209a:	6700 20fa      	beq.w 4196 <ZoomTest+0x28b6>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    209e:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    20a4:	203c 0000 3740 	move.l #14144,d0
    20aa:	7202           	moveq #2,d1
    20ac:	4eae ff3a      	jsr -198(a6)
    20b0:	2840           	movea.l d0,a4
  if( destination == 0) {
    20b2:	4a80           	tst.l d0
    20b4:	6700 21ce      	beq.w 4284 <ZoomTest+0x29a4>
    20b8:	2003           	move.l d3,d0
    20ba:	0680 0000 3300 	addi.l #13056,d0
    20c0:	2043           	movea.l d3,a0
      *tmp4source++ = 0x55555555;
    20c2:	20bc 5555 5555 	move.l #1431655765,(a0)
    20c8:	217c 5555 5555 	move.l #1431655765,4(a0)
    20ce:	0004 
    20d0:	217c 5555 5555 	move.l #1431655765,8(a0)
    20d6:	0008 
    20d8:	217c 5555 5555 	move.l #1431655765,12(a0)
    20de:	000c 
    20e0:	217c 5555 5555 	move.l #1431655765,16(a0)
    20e6:	0010 
    20e8:	217c 5555 5555 	move.l #1431655765,20(a0)
    20ee:	0014 
    20f0:	217c 5555 5555 	move.l #1431655765,24(a0)
    20f6:	0018 
    20f8:	217c 5555 5555 	move.l #1431655765,28(a0)
    20fe:	001c 
    2100:	217c 5555 5555 	move.l #1431655765,32(a0)
    2106:	0020 
    2108:	217c 5555 5555 	move.l #1431655765,36(a0)
    210e:	0024 
    2110:	217c 5555 5555 	move.l #1431655765,40(a0)
    2116:	0028 
    2118:	217c 5555 5555 	move.l #1431655765,44(a0)
    211e:	002c 
      *tmp4source++ = 0xaaaaaaaa;
    2120:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
    2126:	0030 
    2128:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
    212e:	0034 
    2130:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
    2136:	0038 
    2138:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
    213e:	003c 
    2140:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
    2146:	0040 
    2148:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
    214e:	0044 
    2150:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
    2156:	0048 
    2158:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
    215e:	004c 
    2160:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
    2166:	0050 
    2168:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
    216e:	0054 
    2170:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
    2176:	0058 
    2178:	41e8 0060      	lea 96(a0),a0
    217c:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
    2182:	fffc 
  for(int i=0;i<128+8;i++) {
    2184:	b1c0           	cmpa.l d0,a0
    2186:	6600 ff3a      	bne.w 20c2 <ZoomTest+0x7e2>
  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    218a:	4878 0001      	pea 1 <_start+0x1>
    218e:	42a7           	clr.l -(sp)
    2190:	2f0c           	move.l a4,-(sp)
    2192:	2f03           	move.l d3,-(sp)
    2194:	4eba ed70      	jsr f06 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2198:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    219e:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    21a2:	41ec 0004      	lea 4(a4),a0
    21a6:	2f48 0044      	move.l a0,68(sp)
  for(int i=0;i<14;i++) {
    21aa:	41ec 0364      	lea 868(a4),a0
    21ae:	2f48 004c      	move.l a0,76(sp)
    21b2:	2a08           	move.l a0,d5
    21b4:	4fef 0010      	lea 16(sp),sp
  UWORD *valactual = destination+2; 
    21b8:	367c 0012      	movea.w #18,a3
  UWORD mask = 0xffff;
    21bc:	74ff           	moveq #-1,d2
    21be:	7800           	moveq #0,d4
    21c0:	4644           	not.w d4
    21c2:	4bfa e7ea      	lea 9ae <TestRow>(pc),a5
    21c6:	2445           	movea.l d5,a2
    21c8:	45ea fca0      	lea -864(a2),a2
    21cc:	4deb ffee      	lea -18(a3),a6
      TestRow( valsupposed, valactual, mask, i2+i*19);
    21d0:	2f0e           	move.l a6,-(sp)
    21d2:	2f04           	move.l d4,-(sp)
    21d4:	2f0a           	move.l a2,-(sp)
    21d6:	4879 0000 7714 	pea 7714 <destlinezoom1>
    21dc:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    21de:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    21e2:	4642           	not.w d2
    21e4:	528e           	addq.l #1,a6
    for(int i2=0;i2<18;i2++) { 
    21e6:	4fef 0010      	lea 16(sp),sp
    21ea:	ba8a           	cmp.l a2,d5
    21ec:	6600 1888      	bne.w 3a76 <ZoomTest+0x2196>
    TestRow( valsupposed, valactual, mask, 18+i*19);
    21f0:	2f0b           	move.l a3,-(sp)
    21f2:	7800           	moveq #0,d4
    21f4:	3802           	move.w d2,d4
    21f6:	2f04           	move.l d4,-(sp)
    21f8:	2f0a           	move.l a2,-(sp)
    21fa:	4879 0000 7714 	pea 7714 <destlinezoom1>
    2200:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2202:	2a0a           	move.l a2,d5
    2204:	0685 0000 0390 	addi.l #912,d5
    220a:	47eb 0013      	lea 19(a3),a3
  for(int i=0;i<14;i++) {
    220e:	4fef 0010      	lea 16(sp),sp
    2212:	b6fc 011c      	cmpa.w #284,a3
    2216:	66ae           	bne.s 21c6 <ZoomTest+0x8e6>
    2218:	41ec 31e4      	lea 12772(a4),a0
    221c:	2f48 0030      	move.l a0,48(sp)
    2220:	2448           	movea.l a0,a2
    2222:	2a3c 0000 0109 	move.l #265,d5
    TestRow( valsupposed, valactual, mask, i2+265);
    2228:	2f05           	move.l d5,-(sp)
    222a:	2f04           	move.l d4,-(sp)
    222c:	2f0a           	move.l a2,-(sp)
    222e:	4879 0000 7714 	pea 7714 <destlinezoom1>
    2234:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2236:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    223a:	4642           	not.w d2
    223c:	5285           	addq.l #1,d5
  for(int i2=0;i2<4;i2++) { 
    223e:	4fef 0010      	lea 16(sp),sp
    2242:	0c85 0000 010d 	cmpi.l #269,d5
    2248:	6726           	beq.s 2270 <ZoomTest+0x990>
    224a:	7800           	moveq #0,d4
    224c:	3802           	move.w d2,d4
    TestRow( valsupposed, valactual, mask, i2+265);
    224e:	2f05           	move.l d5,-(sp)
    2250:	2f04           	move.l d4,-(sp)
    2252:	2f0a           	move.l a2,-(sp)
    2254:	4879 0000 7714 	pea 7714 <destlinezoom1>
    225a:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    225c:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2260:	4642           	not.w d2
    2262:	5285           	addq.l #1,d5
  for(int i2=0;i2<4;i2++) { 
    2264:	4fef 0010      	lea 16(sp),sp
    2268:	0c85 0000 010d 	cmpi.l #269,d5
    226e:	66da           	bne.s 224a <ZoomTest+0x96a>
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    2270:	4878 0001      	pea 1 <_start+0x1>
    2274:	4878 0001      	pea 1 <_start+0x1>
    2278:	2f03           	move.l d3,-(sp)
    227a:	2f0c           	move.l a4,-(sp)
    227c:	4eba ec88      	jsr f06 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2280:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    2286:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    228a:	2003           	move.l d3,d0
    228c:	5880           	addq.l #4,d0
    228e:	2f40 003c      	move.l d0,60(sp)
    2292:	4fef 0010      	lea 16(sp),sp
    2296:	2440           	movea.l d0,a2
  for(int i2=0;i2<11;i2++) { 
    2298:	7800           	moveq #0,d4
  mask = 0x0000;
    229a:	4242           	clr.w d2
    TestRow( valsupposed, valactual, mask, i2);
    229c:	2f04           	move.l d4,-(sp)
    229e:	3f02           	move.w d2,-(sp)
    22a0:	4267           	clr.w -(sp)
    22a2:	2f0a           	move.l a2,-(sp)
    22a4:	4879 0000 76e8 	pea 76e8 <destlinezoom2>
    22aa:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    22ac:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    22b0:	4642           	not.w d2
  for(int i2=0;i2<11;i2++) { 
    22b2:	5284           	addq.l #1,d4
    22b4:	4fef 0010      	lea 16(sp),sp
    22b8:	720b           	moveq #11,d1
    22ba:	b284           	cmp.l d4,d1
    22bc:	66de           	bne.s 229c <ZoomTest+0x9bc>
  TestRow( valsupposed, valactual, 0xffff, 8);
    22be:	4878 0008      	pea 8 <main+0x2>
    22c2:	2f3c 0000 ffff 	move.l #65535,-(sp)
    22c8:	2003           	move.l d3,d0
    22ca:	0680 0000 0214 	addi.l #532,d0
    22d0:	2f40 006c      	move.l d0,108(sp)
    22d4:	2f00           	move.l d0,-(sp)
    22d6:	4879 0000 76e8 	pea 76e8 <destlinezoom2>
    22dc:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 9);
    22de:	4878 0009      	pea 9 <main+0x3>
    22e2:	2f3c 0000 ffff 	move.l #65535,-(sp)
    22e8:	2043           	movea.l d3,a0
    22ea:	4868 0244      	pea 580(a0)
    22ee:	4879 0000 76e8 	pea 76e8 <destlinezoom2>
    22f4:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 10);
    22f6:	4fef 0020      	lea 32(sp),sp
    22fa:	4878 000a      	pea a <main+0x4>
    22fe:	42a7           	clr.l -(sp)
    2300:	2043           	movea.l d3,a0
    2302:	4868 0274      	pea 628(a0)
    2306:	4879 0000 76e8 	pea 76e8 <destlinezoom2>
    230c:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 11);
    230e:	4878 000b      	pea b <main+0x5>
    2312:	42a7           	clr.l -(sp)
    2314:	2043           	movea.l d3,a0
    2316:	4868 02a4      	pea 676(a0)
    231a:	4879 0000 76e8 	pea 76e8 <destlinezoom2>
    2320:	4e95           	jsr (a5)
  for(int i=0;i<12;i++) {
    2322:	2c03           	move.l d3,d6
    2324:	0686 0000 05d4 	addi.l #1492,d6
    232a:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0x0000, 11);
    232e:	2e06           	move.l d6,d7
    2330:	367c 0018      	movea.w #24,a3
    2334:	7a00           	moveq #0,d5
    2336:	3a02           	move.w d2,d5
    2338:	2447           	movea.l d7,a2
    233a:	45ea fd00      	lea -768(a2),a2
    233e:	4deb fff3      	lea -13(a3),a6
    2342:	2805           	move.l d5,d4
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    2344:	2f0e           	move.l a6,-(sp)
    2346:	2f04           	move.l d4,-(sp)
    2348:	2f0a           	move.l a2,-(sp)
    234a:	4879 0000 76e8 	pea 76e8 <destlinezoom2>
    2350:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2352:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2356:	4642           	not.w d2
    2358:	528e           	addq.l #1,a6
    for(int i2=0;i2<16;i2++) {  
    235a:	4fef 0010      	lea 16(sp),sp
    235e:	be8a           	cmp.l a2,d7
    2360:	6722           	beq.s 2384 <ZoomTest+0xaa4>
    2362:	7800           	moveq #0,d4
    2364:	3802           	move.w d2,d4
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    2366:	2f0e           	move.l a6,-(sp)
    2368:	2f04           	move.l d4,-(sp)
    236a:	2f0a           	move.l a2,-(sp)
    236c:	4879 0000 76e8 	pea 76e8 <destlinezoom2>
    2372:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2374:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2378:	4642           	not.w d2
    237a:	528e           	addq.l #1,a6
    for(int i2=0;i2<16;i2++) {  
    237c:	4fef 0010      	lea 16(sp),sp
    2380:	be8a           	cmp.l a2,d7
    2382:	66de           	bne.s 2362 <ZoomTest+0xa82>
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    2384:	7a00           	moveq #0,d5
    2386:	3a02           	move.w d2,d5
    2388:	2f0b           	move.l a3,-(sp)
    238a:	2f05           	move.l d5,-(sp)
    238c:	2f0a           	move.l a2,-(sp)
    238e:	4879 0000 76e8 	pea 76e8 <destlinezoom2>
    2394:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    2396:	486b 0001      	pea 1(a3)
    239a:	2f05           	move.l d5,-(sp)
    239c:	486a 0030      	pea 48(a2)
    23a0:	4879 0000 76e8 	pea 76e8 <destlinezoom2>
    23a6:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    23a8:	4fef 0020      	lea 32(sp),sp
    23ac:	486b 0002      	pea 2(a3)
    23b0:	2f04           	move.l d4,-(sp)
    23b2:	486a 0060      	pea 96(a2)
    23b6:	4879 0000 76e8 	pea 76e8 <destlinezoom2>
    23bc:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    23be:	486b 0003      	pea 3(a3)
    23c2:	2f04           	move.l d4,-(sp)
    23c4:	486a 0090      	pea 144(a2)
    23c8:	4879 0000 76e8 	pea 76e8 <destlinezoom2>
    23ce:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    23d0:	2e0a           	move.l a2,d7
    23d2:	0687 0000 03c0 	addi.l #960,d7
    23d8:	47eb 0011      	lea 17(a3),a3
  for(int i=0;i<12;i++) {
    23dc:	4fef 0020      	lea 32(sp),sp
    23e0:	b6fc 00e4      	cmpa.w #228,a3
    23e4:	6600 ff52      	bne.w 2338 <ZoomTest+0xa58>
    23e8:	2003           	move.l d3,d0
    23ea:	0680 0000 2fd4 	addi.l #12244,d0
    23f0:	2f40 0068      	move.l d0,104(sp)
    23f4:	2440           	movea.l d0,a2
  for(int i2=0;i2<15;i2++) { 
    23f6:	7800           	moveq #0,d4
    TestRow( valsupposed, valactual, mask, i2);
    23f8:	2f04           	move.l d4,-(sp)
    23fa:	2f05           	move.l d5,-(sp)
    23fc:	2f0a           	move.l a2,-(sp)
    23fe:	4879 0000 76e8 	pea 76e8 <destlinezoom2>
    2404:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2406:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    240a:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    240c:	5284           	addq.l #1,d4
    240e:	4fef 0010      	lea 16(sp),sp
    2412:	720f           	moveq #15,d1
    2414:	b284           	cmp.l d4,d1
    2416:	6724           	beq.s 243c <ZoomTest+0xb5c>
    2418:	7a00           	moveq #0,d5
    241a:	3a02           	move.w d2,d5
    TestRow( valsupposed, valactual, mask, i2);
    241c:	2f04           	move.l d4,-(sp)
    241e:	2f05           	move.l d5,-(sp)
    2420:	2f0a           	move.l a2,-(sp)
    2422:	4879 0000 76e8 	pea 76e8 <destlinezoom2>
    2428:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    242a:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    242e:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    2430:	5284           	addq.l #1,d4
    2432:	4fef 0010      	lea 16(sp),sp
    2436:	720f           	moveq #15,d1
    2438:	b284           	cmp.l d4,d1
    243a:	66dc           	bne.s 2418 <ZoomTest+0xb38>
  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    243c:	4878 0001      	pea 1 <_start+0x1>
    2440:	4878 0002      	pea 2 <_start+0x2>
    2444:	2f0c           	move.l a4,-(sp)
    2446:	2f03           	move.l d3,-(sp)
    2448:	4eba eabc      	jsr f06 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    244c:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    2452:	4eae ff1c      	jsr -228(a6)
    2456:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    245a:	246f 0034      	movea.l 52(sp),a2
  for(int i2=0;i2<4;i2++) { 
    245e:	7400           	moveq #0,d2
  mask = 0xffff;
    2460:	78ff           	moveq #-1,d4
    TestRow( valsupposed, valactual, mask, i2);
    2462:	2f02           	move.l d2,-(sp)
    2464:	3f04           	move.w d4,-(sp)
    2466:	4267           	clr.w -(sp)
    2468:	2f0a           	move.l a2,-(sp)
    246a:	4879 0000 76bc 	pea 76bc <destlinezoom3>
    2470:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2472:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2476:	4644           	not.w d4
  for(int i2=0;i2<4;i2++) { 
    2478:	5282           	addq.l #1,d2
    247a:	4fef 0010      	lea 16(sp),sp
    247e:	7004           	moveq #4,d0
    2480:	b082           	cmp.l d2,d0
    2482:	66de           	bne.s 2462 <ZoomTest+0xb82>
  TestRow( valsupposed, valactual, 0xffff, 0+4);
    2484:	4878 0004      	pea 4 <_start+0x4>
    2488:	2f3c 0000 ffff 	move.l #65535,-(sp)
    248e:	486c 00c4      	pea 196(a4)
    2492:	4879 0000 76bc 	pea 76bc <destlinezoom3>
    2498:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    249a:	4878 0005      	pea 5 <_start+0x5>
    249e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    24a4:	486c 00f4      	pea 244(a4)
    24a8:	4879 0000 76bc 	pea 76bc <destlinezoom3>
    24ae:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    24b0:	4fef 0020      	lea 32(sp),sp
    24b4:	4878 0006      	pea 6 <main>
    24b8:	42a7           	clr.l -(sp)
  valactual += ZMLINESIZE/2;
    24ba:	41ec 0124      	lea 292(a4),a0
    24be:	2f48 0060      	move.l a0,96(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    24c2:	2f08           	move.l a0,-(sp)
    24c4:	4879 0000 76bc 	pea 76bc <destlinezoom3>
    24ca:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    24cc:	4878 0007      	pea 7 <main+0x1>
    24d0:	42a7           	clr.l -(sp)
    24d2:	486c 0154      	pea 340(a4)
    24d6:	4879 0000 76bc 	pea 76bc <destlinezoom3>
    24dc:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    24de:	4fef 0020      	lea 32(sp),sp
    24e2:	4878 0008      	pea 8 <main+0x2>
    24e6:	2f3c 0000 ffff 	move.l #65535,-(sp)
    24ec:	486c 0184      	pea 388(a4)
    24f0:	4879 0000 76bc 	pea 76bc <destlinezoom3>
    24f6:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    24f8:	4878 0009      	pea 9 <main+0x3>
    24fc:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2502:	486c 01b4      	pea 436(a4)
    2506:	4879 0000 76bc 	pea 76bc <destlinezoom3>
    250c:	4e95           	jsr (a5)
  for(int i=0;i<12;i++) {
    250e:	280c           	move.l a4,d4
    2510:	0684 0000 04b4 	addi.l #1204,d4
    2516:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    251a:	367c 0018      	movea.w #24,a3
    251e:	7a00           	moveq #0,d5
    2520:	74ff           	moveq #-1,d2
    2522:	2444           	movea.l d4,a2
    2524:	45ea fd30      	lea -720(a2),a2
    2528:	4deb fff1      	lea -15(a3),a6
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    252c:	2f0e           	move.l a6,-(sp)
    252e:	2f05           	move.l d5,-(sp)
    2530:	2f0a           	move.l a2,-(sp)
    2532:	4879 0000 76bc 	pea 76bc <destlinezoom3>
    2538:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    253a:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    253e:	528e           	addq.l #1,a6
    for(int i2=0;i2<15;i2++) {  
    2540:	4fef 0010      	lea 16(sp),sp
    2544:	b88a           	cmp.l a2,d4
    2546:	6722           	beq.s 256a <ZoomTest+0xc8a>
    2548:	7a00           	moveq #0,d5
    254a:	3a02           	move.w d2,d5
    254c:	4642           	not.w d2
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    254e:	2f0e           	move.l a6,-(sp)
    2550:	2f05           	move.l d5,-(sp)
    2552:	2f0a           	move.l a2,-(sp)
    2554:	4879 0000 76bc 	pea 76bc <destlinezoom3>
    255a:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    255c:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2560:	528e           	addq.l #1,a6
    for(int i2=0;i2<15;i2++) {  
    2562:	4fef 0010      	lea 16(sp),sp
    2566:	b88a           	cmp.l a2,d4
    2568:	66de           	bne.s 2548 <ZoomTest+0xc68>
    TestRow( valsupposed, valactual, mask, i*21+9+15);
    256a:	7800           	moveq #0,d4
    256c:	3802           	move.w d2,d4
    256e:	2f0b           	move.l a3,-(sp)
    2570:	2f04           	move.l d4,-(sp)
    2572:	2f0a           	move.l a2,-(sp)
    2574:	4879 0000 76bc 	pea 76bc <destlinezoom3>
    257a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    257c:	486b 0001      	pea 1(a3)
    2580:	2f04           	move.l d4,-(sp)
    2582:	486a 0030      	pea 48(a2)
    2586:	4879 0000 76bc 	pea 76bc <destlinezoom3>
    258c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    258e:	4fef 0020      	lea 32(sp),sp
    2592:	486b 0002      	pea 2(a3)
    2596:	2f05           	move.l d5,-(sp)
    2598:	486a 0060      	pea 96(a2)
    259c:	4879 0000 76bc 	pea 76bc <destlinezoom3>
    25a2:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    25a4:	486b 0003      	pea 3(a3)
    25a8:	2f05           	move.l d5,-(sp)
    25aa:	486a 0090      	pea 144(a2)
    25ae:	4879 0000 76bc 	pea 76bc <destlinezoom3>
    25b4:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    25b6:	4fef 0020      	lea 32(sp),sp
    25ba:	486b 0004      	pea 4(a3)
    25be:	2f04           	move.l d4,-(sp)
    25c0:	486a 00c0      	pea 192(a2)
    25c4:	4879 0000 76bc 	pea 76bc <destlinezoom3>
    25ca:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    25cc:	486b 0005      	pea 5(a3)
    25d0:	2f04           	move.l d4,-(sp)
    25d2:	486a 00f0      	pea 240(a2)
    25d6:	4879 0000 76bc 	pea 76bc <destlinezoom3>
    25dc:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    25de:	280a           	move.l a2,d4
    25e0:	0684 0000 03f0 	addi.l #1008,d4
    25e6:	47eb 0015      	lea 21(a3),a3
  for(int i=0;i<12;i++) {
    25ea:	4fef 0020      	lea 32(sp),sp
    25ee:	b6fc 0114      	cmpa.w #276,a3
    25f2:	6600 ff2e      	bne.w 2522 <ZoomTest+0xc42>
    25f6:	45ec 3124      	lea 12580(a4),a2
    25fa:	283c 0000 0105 	move.l #261,d4
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    2600:	2f04           	move.l d4,-(sp)
    2602:	2f05           	move.l d5,-(sp)
    2604:	2f0a           	move.l a2,-(sp)
    2606:	4879 0000 76bc 	pea 76bc <destlinezoom3>
    260c:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    260e:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2612:	5284           	addq.l #1,d4
  for(int i2=0;i2<8;i2++) {  
    2614:	4fef 0010      	lea 16(sp),sp
    2618:	0c84 0000 010d 	cmpi.l #269,d4
    261e:	6726           	beq.s 2646 <ZoomTest+0xd66>
    2620:	7a00           	moveq #0,d5
    2622:	3a02           	move.w d2,d5
    2624:	4642           	not.w d2
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    2626:	2f04           	move.l d4,-(sp)
    2628:	2f05           	move.l d5,-(sp)
    262a:	2f0a           	move.l a2,-(sp)
    262c:	4879 0000 76bc 	pea 76bc <destlinezoom3>
    2632:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2634:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2638:	5284           	addq.l #1,d4
  for(int i2=0;i2<8;i2++) {  
    263a:	4fef 0010      	lea 16(sp),sp
    263e:	0c84 0000 010d 	cmpi.l #269,d4
    2644:	66da           	bne.s 2620 <ZoomTest+0xd40>
  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    2646:	4878 0001      	pea 1 <_start+0x1>
    264a:	4878 0003      	pea 3 <_start+0x3>
    264e:	2f03           	move.l d3,-(sp)
    2650:	2f0c           	move.l a4,-(sp)
    2652:	4eba e8b2      	jsr f06 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2656:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    265c:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    2660:	4878 0007      	pea 7 <main+0x1>
    2664:	42a7           	clr.l -(sp)
    2666:	2f2f 0044      	move.l 68(sp),-(sp)
    266a:	4879 0000 7690 	pea 7690 <destlinezoom4>
    2670:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    2672:	7034           	moveq #52,d0
    2674:	d083           	add.l d3,d0
    2676:	2f40 0060      	move.l d0,96(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    267a:	4fef 0020      	lea 32(sp),sp
    267e:	4878 0008      	pea 8 <main+0x2>
    2682:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2688:	2f00           	move.l d0,-(sp)
    268a:	4879 0000 7690 	pea 7690 <destlinezoom4>
    2690:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    2692:	7264           	moveq #100,d1
    2694:	d283           	add.l d3,d1
    2696:	2f41 0060      	move.l d1,96(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    269a:	4878 0009      	pea 9 <main+0x3>
    269e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    26a4:	2f01           	move.l d1,-(sp)
    26a6:	4879 0000 7690 	pea 7690 <destlinezoom4>
    26ac:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    26ae:	2003           	move.l d3,d0
    26b0:	0680 0000 0094 	addi.l #148,d0
    26b6:	2f40 0058      	move.l d0,88(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    26ba:	4fef 0020      	lea 32(sp),sp
    26be:	4878 0008      	pea 8 <main+0x2>
    26c2:	42a7           	clr.l -(sp)
    26c4:	2f00           	move.l d0,-(sp)
    26c6:	4879 0000 7690 	pea 7690 <destlinezoom4>
    26cc:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    26ce:	4878 0009      	pea 9 <main+0x3>
    26d2:	42a7           	clr.l -(sp)
    26d4:	2043           	movea.l d3,a0
    26d6:	4868 00c4      	pea 196(a0)
    26da:	4879 0000 7690 	pea 7690 <destlinezoom4>
    26e0:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    26e2:	2003           	move.l d3,d0
    26e4:	0680 0000 00f4 	addi.l #244,d0
    26ea:	2f40 0064      	move.l d0,100(sp)
  for(int i=0;i<12;i++) {
    26ee:	2e03           	move.l d3,d7
    26f0:	0687 0000 0394 	addi.l #916,d7
    26f6:	4fef 0020      	lea 32(sp),sp
  valactual += ZMLINESIZE/2;
    26fa:	367c 0018      	movea.w #24,a3
  mask = 0xffff;
    26fe:	7aff           	moveq #-1,d5
    2700:	7400           	moveq #0,d2
    2702:	4642           	not.w d2
    2704:	2447           	movea.l d7,a2
    2706:	45ea fd60      	lea -672(a2),a2
    270a:	4deb fff1      	lea -15(a3),a6
    270e:	2802           	move.l d2,d4
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    2710:	2f0e           	move.l a6,-(sp)
    2712:	2f04           	move.l d4,-(sp)
    2714:	2f0a           	move.l a2,-(sp)
    2716:	4879 0000 7690 	pea 7690 <destlinezoom4>
    271c:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    271e:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2722:	4645           	not.w d5
    2724:	528e           	addq.l #1,a6
    for(int i2=0;i2<14;i2++) {  
    2726:	4fef 0010      	lea 16(sp),sp
    272a:	be8a           	cmp.l a2,d7
    272c:	6722           	beq.s 2750 <ZoomTest+0xe70>
    272e:	7800           	moveq #0,d4
    2730:	3805           	move.w d5,d4
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    2732:	2f0e           	move.l a6,-(sp)
    2734:	2f04           	move.l d4,-(sp)
    2736:	2f0a           	move.l a2,-(sp)
    2738:	4879 0000 7690 	pea 7690 <destlinezoom4>
    273e:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2740:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2744:	4645           	not.w d5
    2746:	528e           	addq.l #1,a6
    for(int i2=0;i2<14;i2++) {  
    2748:	4fef 0010      	lea 16(sp),sp
    274c:	be8a           	cmp.l a2,d7
    274e:	66de           	bne.s 272e <ZoomTest+0xe4e>
    TestRow( valsupposed, valactual, mask, i*21+9+15);
    2750:	7400           	moveq #0,d2
    2752:	3405           	move.w d5,d2
    2754:	2f0b           	move.l a3,-(sp)
    2756:	2f02           	move.l d2,-(sp)
    2758:	2f0a           	move.l a2,-(sp)
    275a:	4879 0000 7690 	pea 7690 <destlinezoom4>
    2760:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    2762:	486b 0001      	pea 1(a3)
    2766:	2f02           	move.l d2,-(sp)
    2768:	486a 0030      	pea 48(a2)
    276c:	4879 0000 7690 	pea 7690 <destlinezoom4>
    2772:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    2774:	4fef 0020      	lea 32(sp),sp
    2778:	486b 0002      	pea 2(a3)
    277c:	2f04           	move.l d4,-(sp)
    277e:	486a 0060      	pea 96(a2)
    2782:	4879 0000 7690 	pea 7690 <destlinezoom4>
    2788:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    278a:	486b 0003      	pea 3(a3)
    278e:	2f04           	move.l d4,-(sp)
    2790:	486a 0090      	pea 144(a2)
    2794:	4879 0000 7690 	pea 7690 <destlinezoom4>
    279a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    279c:	4deb 0004      	lea 4(a3),a6
    27a0:	4fef 001c      	lea 28(sp),sp
    27a4:	2e8e           	move.l a6,(sp)
    27a6:	2f02           	move.l d2,-(sp)
    27a8:	486a 00c0      	pea 192(a2)
    27ac:	4879 0000 7690 	pea 7690 <destlinezoom4>
    27b2:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    27b4:	2e0b           	move.l a3,d7
    27b6:	5a87           	addq.l #5,d7
    27b8:	2f07           	move.l d7,-(sp)
    27ba:	2f02           	move.l d2,-(sp)
    27bc:	486a 00f0      	pea 240(a2)
    27c0:	4879 0000 7690 	pea 7690 <destlinezoom4>
    27c6:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    27c8:	4fef 001c      	lea 28(sp),sp
    27cc:	2e8e           	move.l a6,(sp)
    27ce:	2f04           	move.l d4,-(sp)
    27d0:	486a 0120      	pea 288(a2)
    27d4:	4879 0000 7690 	pea 7690 <destlinezoom4>
    27da:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    27dc:	2f07           	move.l d7,-(sp)
    27de:	2f04           	move.l d4,-(sp)
    27e0:	486a 0150      	pea 336(a2)
    27e4:	4879 0000 7690 	pea 7690 <destlinezoom4>
    27ea:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    27ec:	2e0a           	move.l a2,d7
    27ee:	0687 0000 0420 	addi.l #1056,d7
    27f4:	47eb 0015      	lea 21(a3),a3
  for(int i=0;i<12;i++) {
    27f8:	4fef 0020      	lea 32(sp),sp
    27fc:	b6fc 0114      	cmpa.w #276,a3
    2800:	6600 ff02      	bne.w 2704 <ZoomTest+0xe24>
  TestRow( valsupposed, valactual, mask, 269);
    2804:	4878 010d      	pea 10d <main+0x107>
    2808:	2f02           	move.l d2,-(sp)
    280a:	2043           	movea.l d3,a0
    280c:	4868 3274      	pea 12916(a0)
    2810:	4879 0000 7690 	pea 7690 <destlinezoom4>
    2816:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    2818:	4878 0001      	pea 1 <_start+0x1>
    281c:	4878 0004      	pea 4 <_start+0x4>
    2820:	2f0c           	move.l a4,-(sp)
    2822:	2f03           	move.l d3,-(sp)
    2824:	4eba e6e0      	jsr f06 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2828:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    282e:	4eae ff1c      	jsr -228(a6)
    2832:	4fef 0020      	lea 32(sp),sp
  valactual = destination+2; 
    2836:	266f 0034      	movea.l 52(sp),a3
  for(int i2=0;i2<13;i2++) {  
    283a:	95ca           	suba.l a2,a2
  mask = 0x0000;
    283c:	4245           	clr.w d5
    TestRow( valsupposed, valactual, mask, i2);
    283e:	7400           	moveq #0,d2
    2840:	3405           	move.w d5,d2
    2842:	2f0a           	move.l a2,-(sp)
    2844:	2f02           	move.l d2,-(sp)
    2846:	2f0b           	move.l a3,-(sp)
    2848:	4879 0000 7664 	pea 7664 <destlinezoom5>
    284e:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2850:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    2854:	4645           	not.w d5
  for(int i2=0;i2<13;i2++) {  
    2856:	528a           	addq.l #1,a2
    2858:	4fef 0010      	lea 16(sp),sp
    285c:	700d           	moveq #13,d0
    285e:	b08a           	cmp.l a2,d0
    2860:	66dc           	bne.s 283e <ZoomTest+0xf5e>
    2862:	7800           	moveq #0,d4
    2864:	3805           	move.w d5,d4
  TestRow( valsupposed, valactual, mask, 12);   
    2866:	4878 000c      	pea c <main+0x6>
    286a:	2f04           	move.l d4,-(sp)
    286c:	486c 0274      	pea 628(a4)
    2870:	4879 0000 7664 	pea 7664 <destlinezoom5>
    2876:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 13);
    2878:	4878 000d      	pea d <main+0x7>
    287c:	2f04           	move.l d4,-(sp)
    287e:	486c 02a4      	pea 676(a4)
    2882:	4879 0000 7664 	pea 7664 <destlinezoom5>
    2888:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 14);
    288a:	4fef 0020      	lea 32(sp),sp
    288e:	4878 000e      	pea e <main+0x8>
    2892:	2f02           	move.l d2,-(sp)
    2894:	486c 02d4      	pea 724(a4)
    2898:	4879 0000 7664 	pea 7664 <destlinezoom5>
    289e:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 15);
    28a0:	4878 000f      	pea f <main+0x9>
    28a4:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    28a6:	41ec 0304      	lea 772(a4),a0
    28aa:	2f48 0064      	move.l a0,100(sp)
  TestRow( valsupposed, valactual, mask, 15);
    28ae:	2f08           	move.l a0,-(sp)
    28b0:	4879 0000 7664 	pea 7664 <destlinezoom5>
    28b6:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 16);
    28b8:	4fef 0020      	lea 32(sp),sp
    28bc:	4878 0010      	pea 10 <main+0xa>
    28c0:	2f04           	move.l d4,-(sp)
    28c2:	486c 0334      	pea 820(a4)
    28c6:	4879 0000 7664 	pea 7664 <destlinezoom5>
    28cc:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 17);
    28ce:	4878 0011      	pea 11 <main+0xb>
    28d2:	2f04           	move.l d4,-(sp)
    28d4:	2f2f 0054      	move.l 84(sp),-(sp)
    28d8:	4879 0000 7664 	pea 7664 <destlinezoom5>
    28de:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 18);
    28e0:	4fef 0020      	lea 32(sp),sp
    28e4:	4878 0012      	pea 12 <main+0xc>
    28e8:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    28ea:	41ec 0394      	lea 916(a4),a0
    28ee:	2f48 005c      	move.l a0,92(sp)
  TestRow( valsupposed, valactual, mask, 18);
    28f2:	2f08           	move.l a0,-(sp)
    28f4:	4879 0000 7664 	pea 7664 <destlinezoom5>
    28fa:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 19);
    28fc:	4878 0013      	pea 13 <main+0xd>
    2900:	2f02           	move.l d2,-(sp)
    2902:	486c 03c4      	pea 964(a4)
    2906:	4879 0000 7664 	pea 7664 <destlinezoom5>
    290c:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 20);
    290e:	4fef 0020      	lea 32(sp),sp
    2912:	4878 0014      	pea 14 <main+0xe>
    2916:	2f04           	move.l d4,-(sp)
    2918:	486c 03f4      	pea 1012(a4)
    291c:	4879 0000 7664 	pea 7664 <destlinezoom5>
    2922:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 21);
    2924:	4878 0015      	pea 15 <main+0xf>
    2928:	2f04           	move.l d4,-(sp)
    292a:	486c 0424      	pea 1060(a4)
    292e:	4879 0000 7664 	pea 7664 <destlinezoom5>
    2934:	4e95           	jsr (a5)
  for(int i=0;i<10;i++) {
    2936:	280c           	move.l a4,d4
    2938:	0684 0000 06c4 	addi.l #1732,d4
    293e:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, mask, 21);
    2942:	347c 0023      	movea.w #35,a2
    2946:	2644           	movea.l d4,a3
    2948:	47eb fd90      	lea -624(a3),a3
    294c:	4dea fff3      	lea -13(a2),a6
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    2950:	2f0e           	move.l a6,-(sp)
    2952:	2f02           	move.l d2,-(sp)
    2954:	2f0b           	move.l a3,-(sp)
    2956:	4879 0000 7664 	pea 7664 <destlinezoom5>
    295c:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    295e:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    2962:	528e           	addq.l #1,a6
    for(int i2=0;i2<13;i2++) {  
    2964:	4fef 0010      	lea 16(sp),sp
    2968:	b88b           	cmp.l a3,d4
    296a:	6722           	beq.s 298e <ZoomTest+0x10ae>
    296c:	7400           	moveq #0,d2
    296e:	3405           	move.w d5,d2
    2970:	4645           	not.w d5
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    2972:	2f0e           	move.l a6,-(sp)
    2974:	2f02           	move.l d2,-(sp)
    2976:	2f0b           	move.l a3,-(sp)
    2978:	4879 0000 7664 	pea 7664 <destlinezoom5>
    297e:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2980:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    2984:	528e           	addq.l #1,a6
    for(int i2=0;i2<13;i2++) {  
    2986:	4fef 0010      	lea 16(sp),sp
    298a:	b88b           	cmp.l a3,d4
    298c:	66de           	bne.s 296c <ZoomTest+0x108c>
    TestRow( valsupposed, valactual, mask, i*21+22+13);
    298e:	7800           	moveq #0,d4
    2990:	3805           	move.w d5,d4
    2992:	2f0a           	move.l a2,-(sp)
    2994:	2f04           	move.l d4,-(sp)
    2996:	2f0b           	move.l a3,-(sp)
    2998:	4879 0000 7664 	pea 7664 <destlinezoom5>
    299e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    29a0:	486a 0001      	pea 1(a2)
    29a4:	2f04           	move.l d4,-(sp)
    29a6:	486b 0030      	pea 48(a3)
    29aa:	4879 0000 7664 	pea 7664 <destlinezoom5>
    29b0:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    29b2:	4fef 0020      	lea 32(sp),sp
    29b6:	486a 0002      	pea 2(a2)
    29ba:	2f02           	move.l d2,-(sp)
    29bc:	486b 0060      	pea 96(a3)
    29c0:	4879 0000 7664 	pea 7664 <destlinezoom5>
    29c6:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    29c8:	486a 0003      	pea 3(a2)
    29cc:	2f02           	move.l d2,-(sp)
    29ce:	486b 0090      	pea 144(a3)
    29d2:	4879 0000 7664 	pea 7664 <destlinezoom5>
    29d8:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    29da:	4fef 0020      	lea 32(sp),sp
    29de:	486a 0004      	pea 4(a2)
    29e2:	2f04           	move.l d4,-(sp)
    29e4:	486b 00c0      	pea 192(a3)
    29e8:	4879 0000 7664 	pea 7664 <destlinezoom5>
    29ee:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    29f0:	486a 0005      	pea 5(a2)
    29f4:	2f04           	move.l d4,-(sp)
    29f6:	486b 00f0      	pea 240(a3)
    29fa:	4879 0000 7664 	pea 7664 <destlinezoom5>
    2a00:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    2a02:	4fef 0020      	lea 32(sp),sp
    2a06:	486a 0006      	pea 6(a2)
    2a0a:	2f02           	move.l d2,-(sp)
    2a0c:	486b 0120      	pea 288(a3)
    2a10:	4879 0000 7664 	pea 7664 <destlinezoom5>
    2a16:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    2a18:	486a 0007      	pea 7(a2)
    2a1c:	2f02           	move.l d2,-(sp)
    2a1e:	486b 0150      	pea 336(a3)
    2a22:	4879 0000 7664 	pea 7664 <destlinezoom5>
    2a28:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    2a2a:	4fef 0020      	lea 32(sp),sp
    2a2e:	486a 0008      	pea 8(a2)
    2a32:	2f04           	move.l d4,-(sp)
    2a34:	486b 0180      	pea 384(a3)
    2a38:	4879 0000 7664 	pea 7664 <destlinezoom5>
    2a3e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    2a40:	486a 0009      	pea 9(a2)
    2a44:	2f04           	move.l d4,-(sp)
    2a46:	486b 01b0      	pea 432(a3)
    2a4a:	4879 0000 7664 	pea 7664 <destlinezoom5>
    2a50:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2a52:	280b           	move.l a3,d4
    2a54:	0684 0000 0450 	addi.l #1104,d4
    2a5a:	45ea 0015      	lea 21(a2),a2
  for(int i=0;i<10;i++) {
    2a5e:	4fef 0020      	lea 32(sp),sp
    2a62:	b4fc 00f5      	cmpa.w #245,a2
    2a66:	6600 fede      	bne.w 2946 <ZoomTest+0x1066>
    2a6a:	47ec 2f74      	lea 12148(a4),a3
    2a6e:	7e02           	moveq #2,d7
    2a70:	4607           	not.b d7
    TestRow( valsupposed, valactual, mask, i2+253);
    2a72:	2f07           	move.l d7,-(sp)
    2a74:	2f02           	move.l d2,-(sp)
    2a76:	2f0b           	move.l a3,-(sp)
    2a78:	4879 0000 7664 	pea 7664 <destlinezoom5>
    2a7e:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2a80:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    2a84:	5287           	addq.l #1,d7
  for(int i2=0;i2<13;i2++) {  
    2a86:	4fef 0010      	lea 16(sp),sp
    2a8a:	0c87 0000 010a 	cmpi.l #266,d7
    2a90:	6726           	beq.s 2ab8 <ZoomTest+0x11d8>
    2a92:	7400           	moveq #0,d2
    2a94:	3405           	move.w d5,d2
    2a96:	4645           	not.w d5
    TestRow( valsupposed, valactual, mask, i2+253);
    2a98:	2f07           	move.l d7,-(sp)
    2a9a:	2f02           	move.l d2,-(sp)
    2a9c:	2f0b           	move.l a3,-(sp)
    2a9e:	4879 0000 7664 	pea 7664 <destlinezoom5>
    2aa4:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2aa6:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    2aaa:	5287           	addq.l #1,d7
  for(int i2=0;i2<13;i2++) {  
    2aac:	4fef 0010      	lea 16(sp),sp
    2ab0:	0c87 0000 010a 	cmpi.l #266,d7
    2ab6:	66da           	bne.s 2a92 <ZoomTest+0x11b2>
    2ab8:	0285 0000 ffff 	andi.l #65535,d5
  TestRow( valsupposed, valactual, mask, 266);
    2abe:	2f07           	move.l d7,-(sp)
    2ac0:	2f05           	move.l d5,-(sp)
    2ac2:	2f2f 0038      	move.l 56(sp),-(sp)
    2ac6:	4879 0000 7664 	pea 7664 <destlinezoom5>
    2acc:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 267);
    2ace:	4878 010b      	pea 10b <main+0x105>
    2ad2:	2f05           	move.l d5,-(sp)
  valactual += ZMLINESIZE/2;
    2ad4:	41ec 3214      	lea 12820(a4),a0
    2ad8:	2f48 0074      	move.l a0,116(sp)
  TestRow( valsupposed, valactual, mask, 267);
    2adc:	2f08           	move.l a0,-(sp)
    2ade:	4879 0000 7664 	pea 7664 <destlinezoom5>
    2ae4:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 268);
    2ae6:	4fef 0020      	lea 32(sp),sp
    2aea:	4878 010c      	pea 10c <main+0x106>
    2aee:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2af0:	41ec 3244      	lea 12868(a4),a0
    2af4:	2f48 0068      	move.l a0,104(sp)
  TestRow( valsupposed, valactual, mask, 268);
    2af8:	2f08           	move.l a0,-(sp)
    2afa:	4879 0000 7664 	pea 7664 <destlinezoom5>
    2b00:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 269);
    2b02:	4878 010d      	pea 10d <main+0x107>
    2b06:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2b08:	41ec 3274      	lea 12916(a4),a0
    2b0c:	2f48 0054      	move.l a0,84(sp)
  TestRow( valsupposed, valactual, mask, 269);
    2b10:	2f08           	move.l a0,-(sp)
    2b12:	4879 0000 7664 	pea 7664 <destlinezoom5>
    2b18:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    2b1a:	4fef 0020      	lea 32(sp),sp
    2b1e:	4878 0001      	pea 1 <_start+0x1>
    2b22:	4878 0005      	pea 5 <_start+0x5>
    2b26:	2f03           	move.l d3,-(sp)
    2b28:	2f0c           	move.l a4,-(sp)
    2b2a:	4eba e3da      	jsr f06 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2b2e:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    2b34:	4eae ff1c      	jsr -228(a6)
    2b38:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    2b3c:	266f 002c      	movea.l 44(sp),a3
  for(int i2=0;i2<7;i2++) {  
    2b40:	7800           	moveq #0,d4
  mask = 0x0000;
    2b42:	4242           	clr.w d2
    TestRow( valsupposed, valactual, mask, i2);
    2b44:	2f04           	move.l d4,-(sp)
    2b46:	3f02           	move.w d2,-(sp)
    2b48:	4267           	clr.w -(sp)
    2b4a:	2f0b           	move.l a3,-(sp)
    2b4c:	4879 0000 7638 	pea 7638 <destlinezoom6>
    2b52:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2b54:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    2b58:	4642           	not.w d2
  for(int i2=0;i2<7;i2++) {  
    2b5a:	5284           	addq.l #1,d4
    2b5c:	4fef 0010      	lea 16(sp),sp
    2b60:	7007           	moveq #7,d0
    2b62:	b084           	cmp.l d4,d0
    2b64:	66de           	bne.s 2b44 <ZoomTest+0x1264>
    2b66:	2c43           	movea.l d3,a6
    2b68:	4dee 0154      	lea 340(a6),a6
    2b6c:	367c 0007      	movea.w #7,a3
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    2b70:	7800           	moveq #0,d4
    2b72:	3802           	move.w d2,d4
    2b74:	2f0b           	move.l a3,-(sp)
    2b76:	2f04           	move.l d4,-(sp)
    2b78:	2f0e           	move.l a6,-(sp)
    2b7a:	4879 0000 7638 	pea 7638 <destlinezoom6>
    2b80:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    2b82:	486b 0001      	pea 1(a3)
    2b86:	2f04           	move.l d4,-(sp)
    2b88:	486e 0030      	pea 48(a6)
    2b8c:	4879 0000 7638 	pea 7638 <destlinezoom6>
    2b92:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2b94:	4642           	not.w d2
    2b96:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    2b98:	4dee 0060      	lea 96(a6),a6
  for(int i=0;i<6;i++) {
    2b9c:	4fef 0020      	lea 32(sp),sp
    2ba0:	7213           	moveq #19,d1
    2ba2:	b28b           	cmp.l a3,d1
    2ba4:	66ca           	bne.s 2b70 <ZoomTest+0x1290>
    2ba6:	2a0a           	move.l a2,d5
    2ba8:	2c46           	movea.l d6,a6
    2baa:	4dee fdc0      	lea -576(a6),a6
  for(int i2=0;i2<7;i2++) {  
    2bae:	280b           	move.l a3,d4
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    2bb0:	2f04           	move.l d4,-(sp)
    2bb2:	3f02           	move.w d2,-(sp)
    2bb4:	4267           	clr.w -(sp)
    2bb6:	2f0e           	move.l a6,-(sp)
    2bb8:	4879 0000 7638 	pea 7638 <destlinezoom6>
    2bbe:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2bc0:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2bc4:	4642           	not.w d2
    2bc6:	5284           	addq.l #1,d4
    for(int i2=0;i2<12;i2++) {  
    2bc8:	4fef 0010      	lea 16(sp),sp
    2bcc:	bc8e           	cmp.l a6,d6
    2bce:	66e0           	bne.s 2bb0 <ZoomTest+0x12d0>
    2bd0:	347c 001f      	movea.w #31,a2
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    2bd4:	7800           	moveq #0,d4
    2bd6:	3802           	move.w d2,d4
    2bd8:	2f0a           	move.l a2,-(sp)
    2bda:	2f04           	move.l d4,-(sp)
    2bdc:	2f0e           	move.l a6,-(sp)
    2bde:	4879 0000 7638 	pea 7638 <destlinezoom6>
    2be4:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    2be6:	486a 0001      	pea 1(a2)
    2bea:	2f04           	move.l d4,-(sp)
    2bec:	486e 0030      	pea 48(a6)
    2bf0:	4879 0000 7638 	pea 7638 <destlinezoom6>
    2bf6:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    2bf8:	4642           	not.w d2
    2bfa:	45ea 0018      	lea 24(a2),a2
      valactual += ZMLINESIZE/2;
    2bfe:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<6;i++) {
    2c02:	4fef 0020      	lea 32(sp),sp
    2c06:	b4fc 00af      	cmpa.w #175,a2
    2c0a:	66c8           	bne.s 2bd4 <ZoomTest+0x12f4>
    2c0c:	0686 0000 0480 	addi.l #1152,d6
    2c12:	47eb 0018      	lea 24(a3),a3
  for(int i=0;i<10;i++) {
    2c16:	b6fc 0103      	cmpa.w #259,a3
    2c1a:	668c           	bne.s 2ba8 <ZoomTest+0x12c8>
    2c1c:	2445           	movea.l d5,a2
    2c1e:	2c43           	movea.l d3,a6
    2c20:	4dee 3094      	lea 12436(a6),a6
    2c24:	283c 0000 0102 	move.l #258,d4
    TestRow( valsupposed, valactual, mask, 258+i2);
    2c2a:	2f04           	move.l d4,-(sp)
    2c2c:	3f02           	move.w d2,-(sp)
    2c2e:	4267           	clr.w -(sp)
    2c30:	2f0e           	move.l a6,-(sp)
    2c32:	4879 0000 7638 	pea 7638 <destlinezoom6>
    2c38:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2c3a:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2c3e:	4642           	not.w d2
    2c40:	5284           	addq.l #1,d4
  for(int i2=0;i2<11;i2++) {  
    2c42:	4fef 0010      	lea 16(sp),sp
    2c46:	0c84 0000 010d 	cmpi.l #269,d4
    2c4c:	66dc           	bne.s 2c2a <ZoomTest+0x134a>
  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    2c4e:	4878 0001      	pea 1 <_start+0x1>
    2c52:	4878 0006      	pea 6 <main>
    2c56:	2f0c           	move.l a4,-(sp)
    2c58:	2f03           	move.l d3,-(sp)
    2c5a:	4eba e2aa      	jsr f06 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2c5e:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    2c64:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2c68:	42a7           	clr.l -(sp)
    2c6a:	42a7           	clr.l -(sp)
    2c6c:	2f2f 004c      	move.l 76(sp),-(sp)
    2c70:	4879 0000 760c 	pea 760c <destlinezoom7>
    2c76:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    2c78:	41ec 0034      	lea 52(a4),a0
    2c7c:	2f48 0068      	move.l a0,104(sp)
    2c80:	4fef 0020      	lea 32(sp),sp
    2c84:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    2c88:	7eff           	moveq #-1,d7
    2c8a:	280a           	move.l a2,d4
    2c8c:	2448           	movea.l a0,a2
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2c8e:	7400           	moveq #0,d2
    2c90:	3407           	move.w d7,d2
    2c92:	2f0e           	move.l a6,-(sp)
    2c94:	2f02           	move.l d2,-(sp)
    2c96:	2f0a           	move.l a2,-(sp)
    2c98:	4879 0000 760c 	pea 760c <destlinezoom7>
    2c9e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2ca0:	486e 0001      	pea 1(a6)
    2ca4:	2f02           	move.l d2,-(sp)
    2ca6:	486a 0030      	pea 48(a2)
    2caa:	4879 0000 760c 	pea 760c <destlinezoom7>
    2cb0:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2cb2:	4647           	not.w d7
    2cb4:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2cb6:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<7;i++) {
    2cba:	4fef 0020      	lea 32(sp),sp
    2cbe:	700f           	moveq #15,d0
    2cc0:	b08e           	cmp.l a6,d0
    2cc2:	66ca           	bne.s 2c8e <ZoomTest+0x13ae>
    2cc4:	240c           	move.l a4,d2
    2cc6:	0682 0000 04e4 	addi.l #1252,d2
    2ccc:	2a04           	move.l d4,d5
    2cce:	2c0b           	move.l a3,d6
    2cd0:	264e           	movea.l a6,a3
    2cd2:	2c42           	movea.l d2,a6
    2cd4:	4dee fdf0      	lea -528(a6),a6
  mask = mask ^ 0xffff;
    2cd8:	280b           	move.l a3,d4
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    2cda:	2f04           	move.l d4,-(sp)
    2cdc:	3f07           	move.w d7,-(sp)
    2cde:	4267           	clr.w -(sp)
    2ce0:	2f0e           	move.l a6,-(sp)
    2ce2:	4879 0000 760c 	pea 760c <destlinezoom7>
    2ce8:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2cea:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2cee:	4647           	not.w d7
    2cf0:	5284           	addq.l #1,d4
    for(int i2=0;i2<11;i2++) {  
    2cf2:	4fef 0010      	lea 16(sp),sp
    2cf6:	b48e           	cmp.l a6,d2
    2cf8:	66e0           	bne.s 2cda <ZoomTest+0x13fa>
    2cfa:	347c 001a      	movea.w #26,a2
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    2cfe:	7800           	moveq #0,d4
    2d00:	3807           	move.w d7,d4
    2d02:	2f0a           	move.l a2,-(sp)
    2d04:	2f04           	move.l d4,-(sp)
    2d06:	2f0e           	move.l a6,-(sp)
    2d08:	4879 0000 760c 	pea 760c <destlinezoom7>
    2d0e:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    2d10:	2f0a           	move.l a2,-(sp)
    2d12:	2f04           	move.l d4,-(sp)
    2d14:	486e 0030      	pea 48(a6)
    2d18:	4879 0000 760c 	pea 760c <destlinezoom7>
    2d1e:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    2d20:	4647           	not.w d7
    2d22:	45ea 0019      	lea 25(a2),a2
      valactual += ZMLINESIZE/2;
    2d26:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<7;i++) {
    2d2a:	4fef 0020      	lea 32(sp),sp
    2d2e:	b4fc 00c9      	cmpa.w #201,a2
    2d32:	66ca           	bne.s 2cfe <ZoomTest+0x141e>
    2d34:	0682 0000 04b0 	addi.l #1200,d2
    2d3a:	47eb 0019      	lea 25(a3),a3
  for(int i=0;i<10;i++) {
    2d3e:	b6fc 0109      	cmpa.w #265,a3
    2d42:	668e           	bne.s 2cd2 <ZoomTest+0x13f2>
    2d44:	2445           	movea.l d5,a2
    2d46:	2646           	movea.l d6,a3
    2d48:	4dec 31b4      	lea 12724(a4),a6
    2d4c:	243c 0000 0100 	move.l #256,d2
    TestRow( valsupposed, valactual, mask, 256+i2);
    2d52:	2f02           	move.l d2,-(sp)
    2d54:	3f07           	move.w d7,-(sp)
    2d56:	4267           	clr.w -(sp)
    2d58:	2f0e           	move.l a6,-(sp)
    2d5a:	4879 0000 760c 	pea 760c <destlinezoom7>
    2d60:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2d62:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2d66:	4647           	not.w d7
    2d68:	5282           	addq.l #1,d2
  for(int i2=0;i2<5;i2++) {  
    2d6a:	4fef 0010      	lea 16(sp),sp
    2d6e:	0c82 0000 0105 	cmpi.l #261,d2
    2d74:	66dc           	bne.s 2d52 <ZoomTest+0x1472>
  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    2d76:	4878 0001      	pea 1 <_start+0x1>
    2d7a:	4878 0007      	pea 7 <main+0x1>
    2d7e:	2f03           	move.l d3,-(sp)
    2d80:	2f0c           	move.l a4,-(sp)
    2d82:	4eba e182      	jsr f06 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2d86:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    2d8c:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2d90:	42a7           	clr.l -(sp)
    2d92:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2d98:	2f2f 0044      	move.l 68(sp),-(sp)
    2d9c:	4879 0000 75e0 	pea 75e0 <destlinezoom8>
    2da2:	4e95           	jsr (a5)
    2da4:	4fef 0020      	lea 32(sp),sp
    2da8:	2f6f 0038 0030 	move.l 56(sp),48(sp)
  valactual += ZMLINESIZE/2;
    2dae:	242f 0040      	move.l 64(sp),d2
  TestRow( valsupposed, valactual, mask, 0);
    2db2:	7801           	moveq #1,d4
  mask = mask ^ 0xffff;
    2db4:	4245           	clr.w d5
    2db6:	2c2f 0030      	move.l 48(sp),d6
    2dba:	2c44           	movea.l d4,a6
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2dbc:	7800           	moveq #0,d4
    2dbe:	3805           	move.w d5,d4
    2dc0:	2f0e           	move.l a6,-(sp)
    2dc2:	2f04           	move.l d4,-(sp)
    2dc4:	2f02           	move.l d2,-(sp)
    2dc6:	4879 0000 75e0 	pea 75e0 <destlinezoom8>
    2dcc:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2dce:	486e 0001      	pea 1(a6)
    2dd2:	2f04           	move.l d4,-(sp)
    2dd4:	2042           	movea.l d2,a0
    2dd6:	4868 0030      	pea 48(a0)
    2dda:	4879 0000 75e0 	pea 75e0 <destlinezoom8>
    2de0:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2de2:	4645           	not.w d5
    2de4:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    2de6:	4fef 0020      	lea 32(sp),sp
    2dea:	700b           	moveq #11,d0
    2dec:	b08e           	cmp.l a6,d0
    2dee:	6740           	beq.s 2e30 <ZoomTest+0x1550>
    2df0:	2002           	move.l d2,d0
    2df2:	0680 0000 00c0 	addi.l #192,d0
    2df8:	2406           	move.l d6,d2
    2dfa:	2c00           	move.l d0,d6
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2dfc:	7800           	moveq #0,d4
    2dfe:	3805           	move.w d5,d4
    2e00:	2f0e           	move.l a6,-(sp)
    2e02:	2f04           	move.l d4,-(sp)
    2e04:	2f02           	move.l d2,-(sp)
    2e06:	4879 0000 75e0 	pea 75e0 <destlinezoom8>
    2e0c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2e0e:	486e 0001      	pea 1(a6)
    2e12:	2f04           	move.l d4,-(sp)
    2e14:	2042           	movea.l d2,a0
    2e16:	4868 0030      	pea 48(a0)
    2e1a:	4879 0000 75e0 	pea 75e0 <destlinezoom8>
    2e20:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2e22:	4645           	not.w d5
    2e24:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    2e26:	4fef 0020      	lea 32(sp),sp
    2e2a:	700b           	moveq #11,d0
    2e2c:	b08e           	cmp.l a6,d0
    2e2e:	66c0           	bne.s 2df0 <ZoomTest+0x1510>
    2e30:	2f46 0030      	move.l d6,48(sp)
    2e34:	280e           	move.l a6,d4
    2e36:	2e06           	move.l d6,d7
    2e38:	0687 0000 01e0 	addi.l #480,d7
    2e3e:	327c 0015      	movea.w #21,a1
    2e42:	2f4a 006c      	move.l a2,108(sp)
    2e46:	2449           	movea.l a1,a2
    2e48:	2f4b 0070      	move.l a3,112(sp)
    2e4c:	2c47           	movea.l d7,a6
    2e4e:	4dee fe20      	lea -480(a6),a6
    2e52:	47ea fff6      	lea -10(a2),a3
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    2e56:	2f0b           	move.l a3,-(sp)
    2e58:	3f05           	move.w d5,-(sp)
    2e5a:	4267           	clr.w -(sp)
    2e5c:	2f0e           	move.l a6,-(sp)
    2e5e:	4879 0000 75e0 	pea 75e0 <destlinezoom8>
    2e64:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2e66:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2e6a:	4645           	not.w d5
    2e6c:	528b           	addq.l #1,a3
    for(int i2=0;i2<10;i2++) {  
    2e6e:	4fef 0010      	lea 16(sp),sp
    2e72:	be8e           	cmp.l a6,d7
    2e74:	66e0           	bne.s 2e56 <ZoomTest+0x1576>
    2e76:	240a           	move.l a2,d2
    2e78:	2c0e           	move.l a6,d6
    2e7a:	0686 0000 0300 	addi.l #768,d6
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    2e80:	7200           	moveq #0,d1
    2e82:	3205           	move.w d5,d1
    2e84:	2641           	movea.l d1,a3
    2e86:	2f02           	move.l d2,-(sp)
    2e88:	2f0b           	move.l a3,-(sp)
    2e8a:	2f0e           	move.l a6,-(sp)
    2e8c:	4879 0000 75e0 	pea 75e0 <destlinezoom8>
    2e92:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    2e94:	2f02           	move.l d2,-(sp)
    2e96:	2f0b           	move.l a3,-(sp)
    2e98:	486e 0030      	pea 48(a6)
    2e9c:	4879 0000 75e0 	pea 75e0 <destlinezoom8>
    2ea2:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2ea4:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    2ea8:	4645           	not.w d5
    2eaa:	5282           	addq.l #1,d2
    for(int i2=0;i2<8;i2++) {
    2eac:	4fef 0020      	lea 32(sp),sp
    2eb0:	bc8e           	cmp.l a6,d6
    2eb2:	66cc           	bne.s 2e80 <ZoomTest+0x15a0>
    2eb4:	0687 0000 04e0 	addi.l #1248,d7
    2eba:	45ea 001a      	lea 26(a2),a2
  for(int i=0;i<9;i++) {
    2ebe:	b4fc 00ff      	cmpa.w #255,a2
    2ec2:	6688           	bne.s 2e4c <ZoomTest+0x156c>
    2ec4:	246f 006c      	movea.l 108(sp),a2
    2ec8:	266f 0070      	movea.l 112(sp),a3
    2ecc:	2c2f 0030      	move.l 48(sp),d6
    2ed0:	0686 0000 2be0 	addi.l #11232,d6
    2ed6:	240a           	move.l a2,d2
    2ed8:	2c46           	movea.l d6,a6
    TestRow( valsupposed, valactual, mask, 245+i2);
    2eda:	2f02           	move.l d2,-(sp)
    2edc:	3f05           	move.w d5,-(sp)
    2ede:	4267           	clr.w -(sp)
    2ee0:	2f0e           	move.l a6,-(sp)
    2ee2:	4879 0000 75e0 	pea 75e0 <destlinezoom8>
    2ee8:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2eea:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2eee:	4645           	not.w d5
    2ef0:	5282           	addq.l #1,d2
  for(int i2=0;i2<10;i2++) {  
    2ef2:	4fef 0010      	lea 16(sp),sp
    2ef6:	0c82 0000 00ff 	cmpi.l #255,d2
    2efc:	66dc           	bne.s 2eda <ZoomTest+0x15fa>
    2efe:	2c2f 0030      	move.l 48(sp),d6
    2f02:	0686 0000 2dc0 	addi.l #11712,d6
    2f08:	2c42           	movea.l d2,a6
    2f0a:	2e0a           	move.l a2,d7
    2f0c:	2446           	movea.l d6,a2
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    2f0e:	7c00           	moveq #0,d6
    2f10:	3c05           	move.w d5,d6
    2f12:	2f0e           	move.l a6,-(sp)
    2f14:	2f06           	move.l d6,-(sp)
    2f16:	2f0a           	move.l a2,-(sp)
    2f18:	4879 0000 75e0 	pea 75e0 <destlinezoom8>
    2f1e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    2f20:	486e 0001      	pea 1(a6)
    2f24:	2f06           	move.l d6,-(sp)
    2f26:	486a 0030      	pea 48(a2)
    2f2a:	4879 0000 75e0 	pea 75e0 <destlinezoom8>
    2f30:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2f32:	4645           	not.w d5
    2f34:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2f36:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<7;i++) {
    2f3a:	4fef 0020      	lea 32(sp),sp
    2f3e:	bcfc 010d      	cmpa.w #269,a6
    2f42:	66ca           	bne.s 2f0e <ZoomTest+0x162e>
    2f44:	2447           	movea.l d7,a2
  TestRow( valsupposed, valactual, mask, 269);
    2f46:	2f0e           	move.l a6,-(sp)
    2f48:	3f05           	move.w d5,-(sp)
    2f4a:	4267           	clr.w -(sp)
    2f4c:	206f 0038      	movea.l 56(sp),a0
    2f50:	4868 3060      	pea 12384(a0)
    2f54:	4879 0000 75e0 	pea 75e0 <destlinezoom8>
    2f5a:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    2f5c:	4878 0001      	pea 1 <_start+0x1>
    2f60:	4878 0008      	pea 8 <main+0x2>
    2f64:	2f0c           	move.l a4,-(sp)
    2f66:	2f03           	move.l d3,-(sp)
    2f68:	4eba df9c      	jsr f06 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2f6c:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    2f72:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2f76:	4fef 001c      	lea 28(sp),sp
    2f7a:	4297           	clr.l (sp)
    2f7c:	42a7           	clr.l -(sp)
    2f7e:	2f2f 003c      	move.l 60(sp),-(sp)
    2f82:	4879 0000 75b4 	pea 75b4 <destlinezoom9>
    2f88:	4e95           	jsr (a5)
    2f8a:	4fef 0010      	lea 16(sp),sp
    2f8e:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    2f92:	7cff           	moveq #-1,d6
    2f94:	2e0a           	move.l a2,d7
    2f96:	246f 0048      	movea.l 72(sp),a2
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2f9a:	7a00           	moveq #0,d5
    2f9c:	3a06           	move.w d6,d5
    2f9e:	2f0e           	move.l a6,-(sp)
    2fa0:	2f05           	move.l d5,-(sp)
    2fa2:	2f0a           	move.l a2,-(sp)
    2fa4:	4879 0000 75b4 	pea 75b4 <destlinezoom9>
    2faa:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2fac:	486e 0001      	pea 1(a6)
    2fb0:	2f05           	move.l d5,-(sp)
    2fb2:	486a 0030      	pea 48(a2)
    2fb6:	4879 0000 75b4 	pea 75b4 <destlinezoom9>
    2fbc:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2fbe:	4646           	not.w d6
    2fc0:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2fc2:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<3;i++) {
    2fc6:	4fef 0020      	lea 32(sp),sp
    2fca:	7007           	moveq #7,d0
    2fcc:	b08e           	cmp.l a6,d0
    2fce:	66ca           	bne.s 2f9a <ZoomTest+0x16ba>
    2fd0:	2a2f 004c      	move.l 76(sp),d5
    2fd4:	307c 0014      	movea.w #20,a0
    2fd8:	2f47 0030      	move.l d7,48(sp)
    2fdc:	2f4b 0048      	move.l a3,72(sp)
    2fe0:	2f42 004c      	move.l d2,76(sp)
    2fe4:	2448           	movea.l a0,a2
    2fe6:	2c45           	movea.l d5,a6
    2fe8:	4dee fe50      	lea -432(a6),a6
    2fec:	47ea fff7      	lea -9(a2),a3
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    2ff0:	2f0b           	move.l a3,-(sp)
    2ff2:	3f06           	move.w d6,-(sp)
    2ff4:	4267           	clr.w -(sp)
    2ff6:	2f0e           	move.l a6,-(sp)
    2ff8:	4879 0000 75b4 	pea 75b4 <destlinezoom9>
    2ffe:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3000:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    3004:	4646           	not.w d6
    3006:	528b           	addq.l #1,a3
    for(int i2=0;i2<9;i2++) {  
    3008:	4fef 0010      	lea 16(sp),sp
    300c:	ba8e           	cmp.l a6,d5
    300e:	66e0           	bne.s 2ff0 <ZoomTest+0x1710>
    3010:	2e0a           	move.l a2,d7
    3012:	47ea 0009      	lea 9(a2),a3
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    3016:	7400           	moveq #0,d2
    3018:	3406           	move.w d6,d2
    301a:	2f07           	move.l d7,-(sp)
    301c:	2f02           	move.l d2,-(sp)
    301e:	2f0e           	move.l a6,-(sp)
    3020:	4879 0000 75b4 	pea 75b4 <destlinezoom9>
    3026:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    3028:	5287           	addq.l #1,d7
    302a:	2f07           	move.l d7,-(sp)
    302c:	2f02           	move.l d2,-(sp)
    302e:	486e 0030      	pea 48(a6)
    3032:	4879 0000 75b4 	pea 75b4 <destlinezoom9>
    3038:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    303a:	4646           	not.w d6
      valactual += ZMLINESIZE/2;
    303c:	4dee 0060      	lea 96(a6),a6
    for(int i2=0;i2<9;i2++) {
    3040:	4fef 0020      	lea 32(sp),sp
    3044:	be8b           	cmp.l a3,d7
    3046:	66ce           	bne.s 3016 <ZoomTest+0x1736>
    3048:	0685 0000 0510 	addi.l #1296,d5
    304e:	45ea 001b      	lea 27(a2),a2
  for(int i=0;i<9;i++) {
    3052:	b4fc 0107      	cmpa.w #263,a2
    3056:	668e           	bne.s 2fe6 <ZoomTest+0x1706>
    3058:	246f 0030      	movea.l 48(sp),a2
    305c:	266f 0048      	movea.l 72(sp),a3
    3060:	242f 004c      	move.l 76(sp),d2
    3064:	41ec 2ee4      	lea 12004(a4),a0
    3068:	2f48 0030      	move.l a0,48(sp)
    306c:	2c48           	movea.l a0,a6
    TestRow( valsupposed, valactual, mask, 245+i2);
    306e:	2f0a           	move.l a2,-(sp)
    3070:	3f06           	move.w d6,-(sp)
    3072:	4267           	clr.w -(sp)
    3074:	2f0e           	move.l a6,-(sp)
    3076:	4879 0000 75b4 	pea 75b4 <destlinezoom9>
    307c:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    307e:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    3082:	4646           	not.w d6
    3084:	528a           	addq.l #1,a2
  for(int i2=0;i2<9;i2++) {  
    3086:	4fef 0010      	lea 16(sp),sp
    308a:	b4fc 00fe      	cmpa.w #254,a2
    308e:	66de           	bne.s 306e <ZoomTest+0x178e>
    3090:	45ec 3094      	lea 12436(a4),a2
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    3094:	7a00           	moveq #0,d5
    3096:	3a06           	move.w d6,d5
    3098:	2f0b           	move.l a3,-(sp)
    309a:	2f05           	move.l d5,-(sp)
    309c:	2f0a           	move.l a2,-(sp)
    309e:	4879 0000 75b4 	pea 75b4 <destlinezoom9>
    30a4:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    30a6:	486b 0001      	pea 1(a3)
    30aa:	2f05           	move.l d5,-(sp)
    30ac:	486a 0030      	pea 48(a2)
    30b0:	4879 0000 75b4 	pea 75b4 <destlinezoom9>
    30b6:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    30b8:	4646           	not.w d6
    30ba:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    30bc:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<5;i++) {
    30c0:	4fef 0020      	lea 32(sp),sp
    30c4:	b6fc 010d      	cmpa.w #269,a3
    30c8:	66ca           	bne.s 3094 <ZoomTest+0x17b4>
  TestRow( valsupposed, valactual, mask, 269);
    30ca:	2f0b           	move.l a3,-(sp)
    30cc:	3f06           	move.w d6,-(sp)
    30ce:	4267           	clr.w -(sp)
    30d0:	2f2f 0044      	move.l 68(sp),-(sp)
    30d4:	4879 0000 75b4 	pea 75b4 <destlinezoom9>
    30da:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    30dc:	4878 0001      	pea 1 <_start+0x1>
    30e0:	4878 0009      	pea 9 <main+0x3>
    30e4:	2f03           	move.l d3,-(sp)
    30e6:	2f0c           	move.l a4,-(sp)
    30e8:	4eba de1c      	jsr f06 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    30ec:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    30f2:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    30f6:	4fef 001c      	lea 28(sp),sp
    30fa:	4297           	clr.l (sp)
    30fc:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3102:	2f2f 0034      	move.l 52(sp),-(sp)
    3106:	4879 0000 7588 	pea 7588 <destlinezoom10>
    310c:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 1);   
    310e:	4878 0001      	pea 1 <_start+0x1>
    3112:	42a7           	clr.l -(sp)
    3114:	2f2f 0058      	move.l 88(sp),-(sp)
    3118:	4879 0000 7588 	pea 7588 <destlinezoom10>
    311e:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 2);
    3120:	4fef 0020      	lea 32(sp),sp
    3124:	4878 0002      	pea 2 <_start+0x2>
    3128:	42a7           	clr.l -(sp)
    312a:	2f2f 0058      	move.l 88(sp),-(sp)
    312e:	4879 0000 7588 	pea 7588 <destlinezoom10>
    3134:	4e95           	jsr (a5)
  for(int i=0;i<9;i++) {
    3136:	2a2f 0074      	move.l 116(sp),d5
    313a:	4fef 0010      	lea 16(sp),sp
  mask = mask ^ 0xffff;
    313e:	7eff           	moveq #-1,d7
    3140:	2644           	movea.l d4,a3
    3142:	2445           	movea.l d5,a2
    3144:	45ea fe80      	lea -384(a2),a2
    3148:	280b           	move.l a3,d4
    314a:	5184           	subq.l #8,d4
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    314c:	2f04           	move.l d4,-(sp)
    314e:	3f07           	move.w d7,-(sp)
    3150:	4267           	clr.w -(sp)
    3152:	2f0a           	move.l a2,-(sp)
    3154:	4879 0000 7588 	pea 7588 <destlinezoom10>
    315a:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    315c:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    3160:	4647           	not.w d7
    3162:	5284           	addq.l #1,d4
    for(int i2=0;i2<8;i2++) {  
    3164:	4fef 0010      	lea 16(sp),sp
    3168:	ba8a           	cmp.l a2,d5
    316a:	66e0           	bne.s 314c <ZoomTest+0x186c>
    316c:	280b           	move.l a3,d4
    316e:	4dea 03c0      	lea 960(a2),a6
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    3172:	7c00           	moveq #0,d6
    3174:	3c07           	move.w d7,d6
    3176:	2f04           	move.l d4,-(sp)
    3178:	2f06           	move.l d6,-(sp)
    317a:	2f0a           	move.l a2,-(sp)
    317c:	4879 0000 7588 	pea 7588 <destlinezoom10>
    3182:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    3184:	2f04           	move.l d4,-(sp)
    3186:	2f06           	move.l d6,-(sp)
    3188:	486a 0030      	pea 48(a2)
    318c:	4879 0000 7588 	pea 7588 <destlinezoom10>
    3192:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3194:	45ea 0060      	lea 96(a2),a2
      mask = mask ^ 0xffff;
    3198:	4647           	not.w d7
    319a:	5284           	addq.l #1,d4
    for(int i2=0;i2<10;i2++) {
    319c:	4fef 0020      	lea 32(sp),sp
    31a0:	bdca           	cmpa.l a2,a6
    31a2:	66ce           	bne.s 3172 <ZoomTest+0x1892>
    31a4:	0685 0000 0540 	addi.l #1344,d5
    31aa:	47eb 001c      	lea 28(a3),a3
  for(int i=0;i<9;i++) {
    31ae:	b6fc 0107      	cmpa.w #263,a3
    31b2:	668e           	bne.s 3142 <ZoomTest+0x1862>
    31b4:	246f 0068      	movea.l 104(sp),a2
    TestRow( valsupposed, valactual, mask, 255+i2);
    31b8:	2f02           	move.l d2,-(sp)
    31ba:	3f07           	move.w d7,-(sp)
    31bc:	4267           	clr.w -(sp)
    31be:	2f0a           	move.l a2,-(sp)
    31c0:	4879 0000 7588 	pea 7588 <destlinezoom10>
    31c6:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    31c8:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    31cc:	4647           	not.w d7
    31ce:	5282           	addq.l #1,d2
  for(int i2=0;i2<8;i2++) {  
    31d0:	4fef 0010      	lea 16(sp),sp
    31d4:	0c82 0000 0107 	cmpi.l #263,d2
    31da:	66dc           	bne.s 31b8 <ZoomTest+0x18d8>
    31dc:	2c43           	movea.l d3,a6
    31de:	4dee 3154      	lea 12628(a6),a6
    31e2:	347c 0108      	movea.w #264,a2
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    31e6:	7400           	moveq #0,d2
    31e8:	3407           	move.w d7,d2
    31ea:	486a ffff      	pea -1(a2)
    31ee:	2f02           	move.l d2,-(sp)
    31f0:	2f0e           	move.l a6,-(sp)
    31f2:	4879 0000 7588 	pea 7588 <destlinezoom10>
    31f8:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    31fa:	2f0a           	move.l a2,-(sp)
    31fc:	2f02           	move.l d2,-(sp)
    31fe:	486e 0030      	pea 48(a6)
    3202:	4879 0000 7588 	pea 7588 <destlinezoom10>
    3208:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    320a:	4647           	not.w d7
    320c:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    320e:	4dee 0060      	lea 96(a6),a6
  for(int i=0;i<3;i++) {
    3212:	4fef 0020      	lea 32(sp),sp
    3216:	b4fc 010e      	cmpa.w #270,a2
    321a:	66ca           	bne.s 31e6 <ZoomTest+0x1906>
  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    321c:	4878 0001      	pea 1 <_start+0x1>
    3220:	4878 000a      	pea a <main+0x4>
    3224:	2f0c           	move.l a4,-(sp)
    3226:	2f03           	move.l d3,-(sp)
    3228:	4eba dcdc      	jsr f06 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    322c:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    3232:	4eae ff1c      	jsr -228(a6)
    3236:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    323a:	246f 0034      	movea.l 52(sp),a2
  for(int i2=0;i2<6;i2++) {  
    323e:	7800           	moveq #0,d4
  mask = 0xffff;
    3240:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, i2);
    3242:	2f04           	move.l d4,-(sp)
    3244:	3f02           	move.w d2,-(sp)
    3246:	4267           	clr.w -(sp)
    3248:	2f0a           	move.l a2,-(sp)
    324a:	4879 0000 755c 	pea 755c <destlinezoom11>
    3250:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3252:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    3256:	4642           	not.w d2
  for(int i2=0;i2<6;i2++) {  
    3258:	5284           	addq.l #1,d4
    325a:	4fef 0010      	lea 16(sp),sp
    325e:	7006           	moveq #6,d0
    3260:	b084           	cmp.l d4,d0
    3262:	66de           	bne.s 3242 <ZoomTest+0x1962>
    3264:	266f 0058      	movea.l 88(sp),a3
    3268:	347c 0006      	movea.w #6,a2
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    326c:	7800           	moveq #0,d4
    326e:	3802           	move.w d2,d4
    3270:	2f0a           	move.l a2,-(sp)
    3272:	2f04           	move.l d4,-(sp)
    3274:	2f0b           	move.l a3,-(sp)
    3276:	4879 0000 755c 	pea 755c <destlinezoom11>
    327c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    327e:	486a 0001      	pea 1(a2)
    3282:	2f04           	move.l d4,-(sp)
    3284:	486b 0030      	pea 48(a3)
    3288:	4879 0000 755c 	pea 755c <destlinezoom11>
    328e:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3290:	4642           	not.w d2
    3292:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3294:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<11;i2++) {
    3298:	4fef 0020      	lea 32(sp),sp
    329c:	721c           	moveq #28,d1
    329e:	b28a           	cmp.l a2,d1
    32a0:	66ca           	bne.s 326c <ZoomTest+0x198c>
    32a2:	280c           	move.l a4,d4
    32a4:	0684 0000 0694 	addi.l #1684,d4
    32aa:	347c 0023      	movea.w #35,a2
    32ae:	2644           	movea.l d4,a3
    32b0:	47eb feb0      	lea -336(a3),a3
    32b4:	2a0a           	move.l a2,d5
    32b6:	5f85           	subq.l #7,d5
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    32b8:	2f05           	move.l d5,-(sp)
    32ba:	3f02           	move.w d2,-(sp)
    32bc:	4267           	clr.w -(sp)
    32be:	2f0b           	move.l a3,-(sp)
    32c0:	4879 0000 755c 	pea 755c <destlinezoom11>
    32c6:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    32c8:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    32cc:	4642           	not.w d2
    32ce:	5285           	addq.l #1,d5
    for(int i2=0;i2<7;i2++) {  
    32d0:	4fef 0010      	lea 16(sp),sp
    32d4:	b88b           	cmp.l a3,d4
    32d6:	66e0           	bne.s 32b8 <ZoomTest+0x19d8>
    32d8:	2c4a           	movea.l a2,a6
    32da:	2c0b           	move.l a3,d6
    32dc:	0686 0000 0420 	addi.l #1056,d6
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    32e2:	7a00           	moveq #0,d5
    32e4:	3a02           	move.w d2,d5
    32e6:	2f0e           	move.l a6,-(sp)
    32e8:	2f05           	move.l d5,-(sp)
    32ea:	2f0b           	move.l a3,-(sp)
    32ec:	4879 0000 755c 	pea 755c <destlinezoom11>
    32f2:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    32f4:	486e ffe8      	pea -24(a6)
    32f8:	2f05           	move.l d5,-(sp)
    32fa:	486b 0030      	pea 48(a3)
    32fe:	4879 0000 755c 	pea 755c <destlinezoom11>
    3304:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3306:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    330a:	4642           	not.w d2
    330c:	548e           	addq.l #2,a6
    for(int i2=0;i2<11;i2++) {
    330e:	4fef 0020      	lea 32(sp),sp
    3312:	bc8b           	cmp.l a3,d6
    3314:	66cc           	bne.s 32e2 <ZoomTest+0x1a02>
    3316:	0684 0000 0570 	addi.l #1392,d4
    331c:	45ea 001d      	lea 29(a2),a2
  for(int i=0;i<8;i++) {
    3320:	b4fc 010b      	cmpa.w #267,a2
    3324:	6688           	bne.s 32ae <ZoomTest+0x19ce>
    3326:	45ec 30c4      	lea 12484(a4),a2
    332a:	2a3c 0000 0104 	move.l #260,d5
    TestRow( valsupposed, valactual, mask, 260+i2);
    3330:	7800           	moveq #0,d4
    3332:	3802           	move.w d2,d4
    3334:	2f05           	move.l d5,-(sp)
    3336:	2f04           	move.l d4,-(sp)
    3338:	2f0a           	move.l a2,-(sp)
    333a:	4879 0000 755c 	pea 755c <destlinezoom11>
    3340:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3342:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    3346:	4642           	not.w d2
    3348:	5285           	addq.l #1,d5
  for(int i2=0;i2<7;i2++) {  
    334a:	4fef 0010      	lea 16(sp),sp
    334e:	0c85 0000 010b 	cmpi.l #267,d5
    3354:	66da           	bne.s 3330 <ZoomTest+0x1a50>
    3356:	0282 0000 ffff 	andi.l #65535,d2
  TestRow( valsupposed, valactual, mask, 267);   
    335c:	2f05           	move.l d5,-(sp)
    335e:	2f02           	move.l d2,-(sp)
    3360:	2f2f 0064      	move.l 100(sp),-(sp)
    3364:	4879 0000 755c 	pea 755c <destlinezoom11>
    336a:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 268);
    336c:	4878 010c      	pea 10c <main+0x106>
    3370:	2f02           	move.l d2,-(sp)
    3372:	2f2f 0078      	move.l 120(sp),-(sp)
    3376:	4879 0000 755c 	pea 755c <destlinezoom11>
    337c:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 269);
    337e:	4fef 0020      	lea 32(sp),sp
    3382:	4878 010d      	pea 10d <main+0x107>
    3386:	2f04           	move.l d4,-(sp)
    3388:	2f2f 0044      	move.l 68(sp),-(sp)
    338c:	4879 0000 755c 	pea 755c <destlinezoom11>
    3392:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    3394:	4878 0001      	pea 1 <_start+0x1>
    3398:	4878 000b      	pea b <main+0x5>
    339c:	2f03           	move.l d3,-(sp)
    339e:	2f0c           	move.l a4,-(sp)
    33a0:	4eba db64      	jsr f06 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    33a4:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    33aa:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    33ae:	4fef 001c      	lea 28(sp),sp
    33b2:	4297           	clr.l (sp)
    33b4:	42a7           	clr.l -(sp)
    33b6:	2f2f 0034      	move.l 52(sp),-(sp)
    33ba:	4879 0000 7530 	pea 7530 <destlinezoom12>
    33c0:	4e95           	jsr (a5)
    33c2:	4fef 0010      	lea 16(sp),sp
    33c6:	282f 0038      	move.l 56(sp),d4
  valactual += ZMLINESIZE/2;
    33ca:	266f 0040      	movea.l 64(sp),a3
  TestRow( valsupposed, valactual, mask, 0);
    33ce:	347c 0001      	movea.w #1,a2
  mask = mask ^ 0xffff;
    33d2:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    33d4:	7a00           	moveq #0,d5
    33d6:	3a02           	move.w d2,d5
    33d8:	2f0a           	move.l a2,-(sp)
    33da:	2f05           	move.l d5,-(sp)
    33dc:	2f0b           	move.l a3,-(sp)
    33de:	4879 0000 7530 	pea 7530 <destlinezoom12>
    33e4:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    33e6:	486a 0001      	pea 1(a2)
    33ea:	2f05           	move.l d5,-(sp)
    33ec:	486b 0030      	pea 48(a3)
    33f0:	4879 0000 7530 	pea 7530 <destlinezoom12>
    33f6:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    33f8:	4642           	not.w d2
    33fa:	548a           	addq.l #2,a2
  for(int i2=0;i2<12;i2++) {
    33fc:	4fef 0020      	lea 32(sp),sp
    3400:	7019           	moveq #25,d0
    3402:	b08a           	cmp.l a2,d0
    3404:	673e           	beq.s 3444 <ZoomTest+0x1b64>
    3406:	200b           	move.l a3,d0
    3408:	0680 0000 00c0 	addi.l #192,d0
    340e:	2644           	movea.l d4,a3
    3410:	2800           	move.l d0,d4
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3412:	7a00           	moveq #0,d5
    3414:	3a02           	move.w d2,d5
    3416:	2f0a           	move.l a2,-(sp)
    3418:	2f05           	move.l d5,-(sp)
    341a:	2f0b           	move.l a3,-(sp)
    341c:	4879 0000 7530 	pea 7530 <destlinezoom12>
    3422:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3424:	486a 0001      	pea 1(a2)
    3428:	2f05           	move.l d5,-(sp)
    342a:	486b 0030      	pea 48(a3)
    342e:	4879 0000 7530 	pea 7530 <destlinezoom12>
    3434:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3436:	4642           	not.w d2
    3438:	548a           	addq.l #2,a2
  for(int i2=0;i2<12;i2++) {
    343a:	4fef 0020      	lea 32(sp),sp
    343e:	7019           	moveq #25,d0
    3440:	b08a           	cmp.l a2,d0
    3442:	66c2           	bne.s 3406 <ZoomTest+0x1b26>
    3444:	2a04           	move.l d4,d5
    3446:	0685 0000 0120 	addi.l #288,d5
    344c:	347c 001f      	movea.w #31,a2
    3450:	2645           	movea.l d5,a3
    3452:	47eb fee0      	lea -288(a3),a3
    3456:	2c0a           	move.l a2,d6
    3458:	5d86           	subq.l #6,d6
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    345a:	2f06           	move.l d6,-(sp)
    345c:	3f02           	move.w d2,-(sp)
    345e:	4267           	clr.w -(sp)
    3460:	2f0b           	move.l a3,-(sp)
    3462:	4879 0000 7530 	pea 7530 <destlinezoom12>
    3468:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    346a:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    346e:	4642           	not.w d2
    3470:	5286           	addq.l #1,d6
    for(int i2=0;i2<6;i2++) {  
    3472:	4fef 0010      	lea 16(sp),sp
    3476:	ba8b           	cmp.l a3,d5
    3478:	66e0           	bne.s 345a <ZoomTest+0x1b7a>
    347a:	2c4a           	movea.l a2,a6
    347c:	2e0b           	move.l a3,d7
    347e:	0687 0000 0480 	addi.l #1152,d7
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    3484:	7c00           	moveq #0,d6
    3486:	3c02           	move.w d2,d6
    3488:	2f0e           	move.l a6,-(sp)
    348a:	2f06           	move.l d6,-(sp)
    348c:	2f0b           	move.l a3,-(sp)
    348e:	4879 0000 7530 	pea 7530 <destlinezoom12>
    3494:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    3496:	486e 0001      	pea 1(a6)
    349a:	2f06           	move.l d6,-(sp)
    349c:	486b 0030      	pea 48(a3)
    34a0:	4879 0000 7530 	pea 7530 <destlinezoom12>
    34a6:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    34a8:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    34ac:	4642           	not.w d2
    34ae:	548e           	addq.l #2,a6
    for(int i2=0;i2<12;i2++) {
    34b0:	4fef 0020      	lea 32(sp),sp
    34b4:	be8b           	cmp.l a3,d7
    34b6:	66cc           	bne.s 3484 <ZoomTest+0x1ba4>
    34b8:	0685 0000 05a0 	addi.l #1440,d5
    34be:	45ea 001e      	lea 30(a2),a2
  for(int i=0;i<8;i++) {
    34c2:	b4fc 010f      	cmpa.w #271,a2
    34c6:	6688           	bne.s 3450 <ZoomTest+0x1b70>
    34c8:	2444           	movea.l d4,a2
    34ca:	45ea 2d00      	lea 11520(a2),a2
    34ce:	283c 0000 0104 	move.l #260,d4
    TestRow( valsupposed, valactual, mask, 260+i2);
    34d4:	2f04           	move.l d4,-(sp)
    34d6:	3f02           	move.w d2,-(sp)
    34d8:	4267           	clr.w -(sp)
    34da:	2f0a           	move.l a2,-(sp)
    34dc:	4879 0000 7530 	pea 7530 <destlinezoom12>
    34e2:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    34e4:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    34e8:	4642           	not.w d2
    34ea:	5284           	addq.l #1,d4
  for(int i2=0;i2<5;i2++) {  
    34ec:	4fef 0010      	lea 16(sp),sp
    34f0:	0c84 0000 0109 	cmpi.l #265,d4
    34f6:	66dc           	bne.s 34d4 <ZoomTest+0x1bf4>
  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    34f8:	4878 0001      	pea 1 <_start+0x1>
    34fc:	4878 000c      	pea c <main+0x6>
    3500:	2f0c           	move.l a4,-(sp)
    3502:	2f03           	move.l d3,-(sp)
    3504:	4eba da00      	jsr f06 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3508:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    350e:	4eae ff1c      	jsr -228(a6)
    3512:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    3516:	266f 0034      	movea.l 52(sp),a3
  WaitBlit();
    351a:	347c 0001      	movea.w #1,a2
  mask = 0xffff;
    351e:	7cff           	moveq #-1,d6
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3520:	7400           	moveq #0,d2
    3522:	3406           	move.w d6,d2
    3524:	486a ffff      	pea -1(a2)
    3528:	2f02           	move.l d2,-(sp)
    352a:	2f0b           	move.l a3,-(sp)
    352c:	4879 0000 7504 	pea 7504 <destlinezoom13>
    3532:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3534:	2f0a           	move.l a2,-(sp)
    3536:	2f02           	move.l d2,-(sp)
    3538:	486b 0030      	pea 48(a3)
    353c:	4879 0000 7504 	pea 7504 <destlinezoom13>
    3542:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3544:	4646           	not.w d6
    3546:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3548:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<11;i2++) {
    354c:	4fef 0020      	lea 32(sp),sp
    3550:	7217           	moveq #23,d1
    3552:	b28a           	cmp.l a2,d1
    3554:	66ca           	bne.s 3520 <ZoomTest+0x1c40>
    3556:	240c           	move.l a4,d2
    3558:	0682 0000 0514 	addi.l #1300,d2
    355e:	3c7c 001b      	movea.w #27,a6
    3562:	2a0a           	move.l a2,d5
    3564:	2642           	movea.l d2,a3
    3566:	47eb ff10      	lea -240(a3),a3
    356a:	280e           	move.l a6,d4
    356c:	5b84           	subq.l #5,d4
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    356e:	2f04           	move.l d4,-(sp)
    3570:	3f06           	move.w d6,-(sp)
    3572:	4267           	clr.w -(sp)
    3574:	2f0b           	move.l a3,-(sp)
    3576:	4879 0000 7504 	pea 7504 <destlinezoom13>
    357c:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    357e:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    3582:	4646           	not.w d6
    3584:	5284           	addq.l #1,d4
    for(int i2=0;i2<5;i2++) {  
    3586:	4fef 0010      	lea 16(sp),sp
    358a:	b48b           	cmp.l a3,d2
    358c:	66e0           	bne.s 356e <ZoomTest+0x1c8e>
    358e:	244e           	movea.l a6,a2
    3590:	2e0b           	move.l a3,d7
    3592:	0687 0000 04e0 	addi.l #1248,d7
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    3598:	7800           	moveq #0,d4
    359a:	3806           	move.w d6,d4
    359c:	2f0a           	move.l a2,-(sp)
    359e:	2f04           	move.l d4,-(sp)
    35a0:	2f0b           	move.l a3,-(sp)
    35a2:	4879 0000 7504 	pea 7504 <destlinezoom13>
    35a8:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    35aa:	486a 0001      	pea 1(a2)
    35ae:	2f04           	move.l d4,-(sp)
    35b0:	486b 0030      	pea 48(a3)
    35b4:	4879 0000 7504 	pea 7504 <destlinezoom13>
    35ba:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    35bc:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    35c0:	4646           	not.w d6
    35c2:	548a           	addq.l #2,a2
    for(int i2=0;i2<13;i2++) {
    35c4:	4fef 0020      	lea 32(sp),sp
    35c8:	be8b           	cmp.l a3,d7
    35ca:	66cc           	bne.s 3598 <ZoomTest+0x1cb8>
    35cc:	0682 0000 05d0 	addi.l #1488,d2
    35d2:	4dee 001f      	lea 31(a6),a6
  for(int i=0;i<8;i++) {
    35d6:	bcfc 0113      	cmpa.w #275,a6
    35da:	6688           	bne.s 3564 <ZoomTest+0x1c84>
    35dc:	2445           	movea.l d5,a2
  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    35de:	4878 0001      	pea 1 <_start+0x1>
    35e2:	4878 000d      	pea d <main+0x7>
    35e6:	2f03           	move.l d3,-(sp)
    35e8:	2f0c           	move.l a4,-(sp)
    35ea:	4eba d91a      	jsr f06 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    35ee:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    35f4:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);   
    35f8:	42a7           	clr.l -(sp)
    35fa:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3600:	2f2f 0044      	move.l 68(sp),-(sp)
    3604:	4879 0000 74d8 	pea 74d8 <destlinezoom14>
    360a:	4e95           	jsr (a5)
    360c:	4fef 0020      	lea 32(sp),sp
    3610:	242f 0038      	move.l 56(sp),d2
  valactual += ZMLINESIZE/2; 
    3614:	2c6f 0040      	movea.l 64(sp),a6
  TestRow( valsupposed, valactual, mask, 0);   
    3618:	367c 0001      	movea.w #1,a3
  mask = mask ^ 0xffff; 
    361c:	4247           	clr.w d7
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    361e:	7800           	moveq #0,d4
    3620:	3807           	move.w d7,d4
    3622:	2f0b           	move.l a3,-(sp)
    3624:	2f04           	move.l d4,-(sp)
    3626:	2f0e           	move.l a6,-(sp)
    3628:	4879 0000 74d8 	pea 74d8 <destlinezoom14>
    362e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3630:	486b 0001      	pea 1(a3)
    3634:	2f04           	move.l d4,-(sp)
    3636:	486e 0030      	pea 48(a6)
    363a:	4879 0000 74d8 	pea 74d8 <destlinezoom14>
    3640:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3642:	4647           	not.w d7
    3644:	548b           	addq.l #2,a3
  for(int i2=0;i2<9;i2++) {
    3646:	4fef 0020      	lea 32(sp),sp
    364a:	7013           	moveq #19,d0
    364c:	b08b           	cmp.l a3,d0
    364e:	673e           	beq.s 368e <ZoomTest+0x1dae>
    3650:	200e           	move.l a6,d0
    3652:	0680 0000 00c0 	addi.l #192,d0
    3658:	2c42           	movea.l d2,a6
    365a:	2400           	move.l d0,d2
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    365c:	7800           	moveq #0,d4
    365e:	3807           	move.w d7,d4
    3660:	2f0b           	move.l a3,-(sp)
    3662:	2f04           	move.l d4,-(sp)
    3664:	2f0e           	move.l a6,-(sp)
    3666:	4879 0000 74d8 	pea 74d8 <destlinezoom14>
    366c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    366e:	486b 0001      	pea 1(a3)
    3672:	2f04           	move.l d4,-(sp)
    3674:	486e 0030      	pea 48(a6)
    3678:	4879 0000 74d8 	pea 74d8 <destlinezoom14>
    367e:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3680:	4647           	not.w d7
    3682:	548b           	addq.l #2,a3
  for(int i2=0;i2<9;i2++) {
    3684:	4fef 0020      	lea 32(sp),sp
    3688:	7013           	moveq #19,d0
    368a:	b08b           	cmp.l a3,d0
    368c:	66c2           	bne.s 3650 <ZoomTest+0x1d70>
    368e:	2802           	move.l d2,d4
    3690:	0684 0000 00c0 	addi.l #192,d4
    3696:	2c0b           	move.l a3,d6
    3698:	2c44           	movea.l d4,a6
    369a:	4dee ff40      	lea -192(a6),a6
    369e:	2a0a           	move.l a2,d5
    36a0:	5985           	subq.l #4,d5
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    36a2:	2f05           	move.l d5,-(sp)
    36a4:	3f07           	move.w d7,-(sp)
    36a6:	4267           	clr.w -(sp)
    36a8:	2f0e           	move.l a6,-(sp)
    36aa:	4879 0000 74d8 	pea 74d8 <destlinezoom14>
    36b0:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    36b2:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    36b6:	4647           	not.w d7
    36b8:	5285           	addq.l #1,d5
    for(int i2=0;i2<4;i2++) {  
    36ba:	4fef 0010      	lea 16(sp),sp
    36be:	b88e           	cmp.l a6,d4
    36c0:	66e0           	bne.s 36a2 <ZoomTest+0x1dc2>
    36c2:	264a           	movea.l a2,a3
    36c4:	41ee 0540      	lea 1344(a6),a0
    36c8:	2f48 003c      	move.l a0,60(sp)
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    36cc:	7a00           	moveq #0,d5
    36ce:	3a07           	move.w d7,d5
    36d0:	2f0b           	move.l a3,-(sp)
    36d2:	2f05           	move.l d5,-(sp)
    36d4:	2f0e           	move.l a6,-(sp)
    36d6:	4879 0000 74d8 	pea 74d8 <destlinezoom14>
    36dc:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    36de:	486b 0001      	pea 1(a3)
    36e2:	2f05           	move.l d5,-(sp)
    36e4:	486e 0030      	pea 48(a6)
    36e8:	4879 0000 74d8 	pea 74d8 <destlinezoom14>
    36ee:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    36f0:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    36f4:	4647           	not.w d7
    36f6:	548b           	addq.l #2,a3
    for(int i2=0;i2<14;i2++) {
    36f8:	4fef 0020      	lea 32(sp),sp
    36fc:	bdef 003c      	cmpa.l 60(sp),a6
    3700:	66ca           	bne.s 36cc <ZoomTest+0x1dec>
    3702:	0684 0000 0600 	addi.l #1536,d4
    3708:	45ea 0020      	lea 32(a2),a2
  for(int i=0;i<7;i++) {
    370c:	b4fc 00f7      	cmpa.w #247,a2
    3710:	6686           	bne.s 3698 <ZoomTest+0x1db8>
    3712:	2646           	movea.l d6,a3
    3714:	2c42           	movea.l d2,a6
    3716:	4dee 2a00      	lea 10752(a6),a6
    371a:	347c 00f3      	movea.w #243,a2
    TestRow( valsupposed, valactual, mask, 243+i2);
    371e:	2f0a           	move.l a2,-(sp)
    3720:	3f07           	move.w d7,-(sp)
    3722:	4267           	clr.w -(sp)
    3724:	2f0e           	move.l a6,-(sp)
    3726:	4879 0000 74d8 	pea 74d8 <destlinezoom14>
    372c:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    372e:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    3732:	4647           	not.w d7
    3734:	528a           	addq.l #1,a2
  for(int i2=0;i2<4;i2++) {  
    3736:	4fef 0010      	lea 16(sp),sp
    373a:	b4fc 00f7      	cmpa.w #247,a2
    373e:	66de           	bne.s 371e <ZoomTest+0x1e3e>
    3740:	0682 0000 2ac0 	addi.l #10944,d2
    3746:	2c4a           	movea.l a2,a6
    3748:	280a           	move.l a2,d4
    374a:	2442           	movea.l d2,a2
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    374c:	7400           	moveq #0,d2
    374e:	3407           	move.w d7,d2
    3750:	2f0e           	move.l a6,-(sp)
    3752:	2f02           	move.l d2,-(sp)
    3754:	2f0a           	move.l a2,-(sp)
    3756:	4879 0000 74d8 	pea 74d8 <destlinezoom14>
    375c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    375e:	486e 0001      	pea 1(a6)
    3762:	2f02           	move.l d2,-(sp)
    3764:	486a 0030      	pea 48(a2)
    3768:	4879 0000 74d8 	pea 74d8 <destlinezoom14>
    376e:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3770:	4647           	not.w d7
    3772:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    3774:	45ea 0060      	lea 96(a2),a2
  for(int i2=0;i2<12;i2++) {
    3778:	4fef 0020      	lea 32(sp),sp
    377c:	bcfc 010f      	cmpa.w #271,a6
    3780:	66ca           	bne.s 374c <ZoomTest+0x1e6c>
  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    3782:	4878 0001      	pea 1 <_start+0x1>
    3786:	4878 000e      	pea e <main+0x8>
    378a:	2f0c           	move.l a4,-(sp)
    378c:	2f03           	move.l d3,-(sp)
    378e:	4eba d776      	jsr f06 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3792:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    3798:	4eae ff1c      	jsr -228(a6)
    379c:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    37a0:	242f 0034      	move.l 52(sp),d2
  WaitBlit();
    37a4:	3c7c 0001      	movea.w #1,a6
  mask = 0x0000;
    37a8:	4246           	clr.w d6
    37aa:	2442           	movea.l d2,a2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    37ac:	7400           	moveq #0,d2
    37ae:	3406           	move.w d6,d2
    37b0:	486e ffff      	pea -1(a6)
    37b4:	2f02           	move.l d2,-(sp)
    37b6:	2f0a           	move.l a2,-(sp)
    37b8:	4879 0000 74ac 	pea 74ac <destlinezoom15>
    37be:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    37c0:	2f0e           	move.l a6,-(sp)
    37c2:	2f02           	move.l d2,-(sp)
    37c4:	486a 0030      	pea 48(a2)
    37c8:	4879 0000 74ac 	pea 74ac <destlinezoom15>
    37ce:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    37d0:	4646           	not.w d6
    37d2:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    37d4:	45ea 0060      	lea 96(a2),a2
  for(int i2=0;i2<8;i2++) {
    37d8:	4fef 0020      	lea 32(sp),sp
    37dc:	7011           	moveq #17,d0
    37de:	b08e           	cmp.l a6,d0
    37e0:	66ca           	bne.s 37ac <ZoomTest+0x1ecc>
    37e2:	2444           	movea.l d4,a2
    37e4:	242f 0054      	move.l 84(sp),d2
    37e8:	2c42           	movea.l d2,a6
    37ea:	4dee ff70      	lea -144(a6),a6
    37ee:	280b           	move.l a3,d4
    37f0:	5784           	subq.l #3,d4
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    37f2:	2f04           	move.l d4,-(sp)
    37f4:	3f06           	move.w d6,-(sp)
    37f6:	4267           	clr.w -(sp)
    37f8:	2f0e           	move.l a6,-(sp)
    37fa:	4879 0000 74ac 	pea 74ac <destlinezoom15>
    3800:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3802:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    3806:	4646           	not.w d6
    3808:	5284           	addq.l #1,d4
    for(int i2=0;i2<3;i2++) {  
    380a:	4fef 0010      	lea 16(sp),sp
    380e:	b48e           	cmp.l a6,d2
    3810:	66e0           	bne.s 37f2 <ZoomTest+0x1f12>
    3812:	280b           	move.l a3,d4
    3814:	2e0e           	move.l a6,d7
    3816:	0687 0000 05a0 	addi.l #1440,d7
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    381c:	7a00           	moveq #0,d5
    381e:	3a06           	move.w d6,d5
    3820:	2f04           	move.l d4,-(sp)
    3822:	2f05           	move.l d5,-(sp)
    3824:	2f0e           	move.l a6,-(sp)
    3826:	4879 0000 74ac 	pea 74ac <destlinezoom15>
    382c:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    382e:	2f04           	move.l d4,-(sp)
    3830:	2f05           	move.l d5,-(sp)
    3832:	486e 0030      	pea 48(a6)
    3836:	4879 0000 74ac 	pea 74ac <destlinezoom15>
    383c:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    383e:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    3842:	4646           	not.w d6
    3844:	5484           	addq.l #2,d4
    for(int i2=0;i2<15;i2++) {
    3846:	4fef 0020      	lea 32(sp),sp
    384a:	be8e           	cmp.l a6,d7
    384c:	66ce           	bne.s 381c <ZoomTest+0x1f3c>
    384e:	0682 0000 0630 	addi.l #1584,d2
    3854:	47eb 0021      	lea 33(a3),a3
  for(int i=0;i<7;i++) {
    3858:	b6fc 00fa      	cmpa.w #250,a3
    385c:	668a           	bne.s 37e8 <ZoomTest+0x1f08>
    385e:	47ec 2e54      	lea 11860(a4),a3
    TestRow( valsupposed, valactual, mask, 247+i2);
    3862:	2f0a           	move.l a2,-(sp)
    3864:	3f06           	move.w d6,-(sp)
    3866:	4267           	clr.w -(sp)
    3868:	2f0b           	move.l a3,-(sp)
    386a:	4879 0000 74ac 	pea 74ac <destlinezoom15>
    3870:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3872:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    3876:	4646           	not.w d6
    3878:	528a           	addq.l #1,a2
  for(int i2=0;i2<3;i2++) {  
    387a:	4fef 0010      	lea 16(sp),sp
    387e:	b4fc 00fa      	cmpa.w #250,a2
    3882:	66de           	bne.s 3862 <ZoomTest+0x1f82>
    3884:	266f 0030      	movea.l 48(sp),a3
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    3888:	7400           	moveq #0,d2
    388a:	3406           	move.w d6,d2
    388c:	2f0a           	move.l a2,-(sp)
    388e:	2f02           	move.l d2,-(sp)
    3890:	2f0b           	move.l a3,-(sp)
    3892:	4879 0000 74ac 	pea 74ac <destlinezoom15>
    3898:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    389a:	486a 0001      	pea 1(a2)
    389e:	2f02           	move.l d2,-(sp)
    38a0:	486b 0030      	pea 48(a3)
    38a4:	4879 0000 74ac 	pea 74ac <destlinezoom15>
    38aa:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    38ac:	4646           	not.w d6
    38ae:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    38b0:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<10;i2++) {
    38b4:	4fef 0020      	lea 32(sp),sp
    38b8:	b4fc 010e      	cmpa.w #270,a2
    38bc:	66ca           	bne.s 3888 <ZoomTest+0x1fa8>
  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    38be:	4878 0001      	pea 1 <_start+0x1>
    38c2:	4878 000f      	pea f <main+0x9>
    38c6:	2f03           	move.l d3,-(sp)
    38c8:	2f0c           	move.l a4,-(sp)
    38ca:	4eba d63a      	jsr f06 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    38ce:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    38d4:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);   
    38d8:	42a7           	clr.l -(sp)
    38da:	42a7           	clr.l -(sp)
    38dc:	2f2f 0044      	move.l 68(sp),-(sp)
    38e0:	4879 0000 7480 	pea 7480 <destlinezoom16>
    38e6:	4e95           	jsr (a5)
    38e8:	4fef 0020      	lea 32(sp),sp
    38ec:	246f 0044      	movea.l 68(sp),a2
    38f0:	2c6f 0038      	movea.l 56(sp),a6
  valactual += ZMLINESIZE/2;
    38f4:	282f 0040      	move.l 64(sp),d4
  TestRow( valsupposed, valactual, mask, 0);   
    38f8:	97cb           	suba.l a3,a3
  mask = mask ^ 0xffff;
    38fa:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    38fc:	7a00           	moveq #0,d5
    38fe:	3a02           	move.w d2,d5
    3900:	2f0b           	move.l a3,-(sp)
    3902:	2f05           	move.l d5,-(sp)
    3904:	2f04           	move.l d4,-(sp)
    3906:	4879 0000 7480 	pea 7480 <destlinezoom16>
    390c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    390e:	486b 0001      	pea 1(a3)
    3912:	2f05           	move.l d5,-(sp)
    3914:	2044           	movea.l d4,a0
    3916:	4868 0030      	pea 48(a0)
    391a:	4879 0000 7480 	pea 7480 <destlinezoom16>
    3920:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3922:	4642           	not.w d2
    3924:	2004           	move.l d4,d0
    3926:	0680 0000 0120 	addi.l #288,d0
    392c:	548b           	addq.l #2,a3
    392e:	280e           	move.l a6,d4
  for(int i2=0;i2<6;i2++) {
    3930:	4fef 0020      	lea 32(sp),sp
    3934:	720c           	moveq #12,d1
    3936:	b28b           	cmp.l a3,d1
    3938:	6742           	beq.s 397c <ZoomTest+0x209c>
    393a:	2c4a           	movea.l a2,a6
    393c:	2440           	movea.l d0,a2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    393e:	7a00           	moveq #0,d5
    3940:	3a02           	move.w d2,d5
    3942:	2f0b           	move.l a3,-(sp)
    3944:	2f05           	move.l d5,-(sp)
    3946:	2f04           	move.l d4,-(sp)
    3948:	4879 0000 7480 	pea 7480 <destlinezoom16>
    394e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3950:	486b 0001      	pea 1(a3)
    3954:	2f05           	move.l d5,-(sp)
    3956:	2044           	movea.l d4,a0
    3958:	4868 0030      	pea 48(a0)
    395c:	4879 0000 7480 	pea 7480 <destlinezoom16>
    3962:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3964:	4642           	not.w d2
    3966:	2004           	move.l d4,d0
    3968:	0680 0000 0120 	addi.l #288,d0
    396e:	548b           	addq.l #2,a3
    3970:	280e           	move.l a6,d4
  for(int i2=0;i2<6;i2++) {
    3972:	4fef 0020      	lea 32(sp),sp
    3976:	720c           	moveq #12,d1
    3978:	b28b           	cmp.l a3,d1
    397a:	66be           	bne.s 393a <ZoomTest+0x205a>
    397c:	367c 000d      	movea.w #13,a3
    3980:	2a0c           	move.l a4,d5
    3982:	2e00           	move.l d0,d7
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3984:	2f0b           	move.l a3,-(sp)
    3986:	7800           	moveq #0,d4
    3988:	3802           	move.w d2,d4
    398a:	2f04           	move.l d4,-(sp)
    398c:	2f0e           	move.l a6,-(sp)
    398e:	4879 0000 7480 	pea 7480 <destlinezoom16>
    3994:	4e95           	jsr (a5)
    3996:	486b 0001      	pea 1(a3)
      mask = mask ^ 0xffff;
    399a:	3c02           	move.w d2,d6
    399c:	4646           	not.w d6
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    399e:	3f06           	move.w d6,-(sp)
    39a0:	4267           	clr.w -(sp)
    39a2:	486e 0030      	pea 48(a6)
    39a6:	4879 0000 7480 	pea 7480 <destlinezoom16>
    39ac:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    39ae:	49eb 0003      	lea 3(a3),a4
    39b2:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    39b6:	2c47           	movea.l d7,a6
    39b8:	7e23           	moveq #35,d7
    39ba:	de8b           	add.l a3,d7
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    39bc:	2f0c           	move.l a4,-(sp)
    39be:	2f04           	move.l d4,-(sp)
    39c0:	2f0a           	move.l a2,-(sp)
    39c2:	4879 0000 7480 	pea 7480 <destlinezoom16>
    39c8:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    39ca:	486c 0001      	pea 1(a4)
    39ce:	2f04           	move.l d4,-(sp)
    39d0:	486a 0030      	pea 48(a2)
    39d4:	4879 0000 7480 	pea 7480 <destlinezoom16>
    39da:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    39dc:	3406           	move.w d6,d2
    39de:	41ea 00c0      	lea 192(a2),a0
    39e2:	548c           	addq.l #2,a4
    for(int i2=0;i2<16;i2++) {
    39e4:	4fef 0020      	lea 32(sp),sp
    39e8:	b9c7           	cmpa.l d7,a4
    39ea:	673a           	beq.s 3a26 <ZoomTest+0x2146>
    39ec:	244e           	movea.l a6,a2
    39ee:	2c48           	movea.l a0,a6
    39f0:	7800           	moveq #0,d4
    39f2:	3806           	move.w d6,d4
    39f4:	4646           	not.w d6
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    39f6:	2f0c           	move.l a4,-(sp)
    39f8:	2f04           	move.l d4,-(sp)
    39fa:	2f0a           	move.l a2,-(sp)
    39fc:	4879 0000 7480 	pea 7480 <destlinezoom16>
    3a02:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    3a04:	486c 0001      	pea 1(a4)
    3a08:	2f04           	move.l d4,-(sp)
    3a0a:	486a 0030      	pea 48(a2)
    3a0e:	4879 0000 7480 	pea 7480 <destlinezoom16>
    3a14:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3a16:	3406           	move.w d6,d2
    3a18:	41ea 00c0      	lea 192(a2),a0
    3a1c:	548c           	addq.l #2,a4
    for(int i2=0;i2<16;i2++) {
    3a1e:	4fef 0020      	lea 32(sp),sp
    3a22:	b9c7           	cmpa.l d7,a4
    3a24:	66c6           	bne.s 39ec <ZoomTest+0x210c>
    3a26:	47eb 0022      	lea 34(a3),a3
  for(int i=0;i<7;i++) {
    3a2a:	b6fc 00fb      	cmpa.w #251,a3
    3a2e:	674e           	beq.s 3a7e <ZoomTest+0x219e>
    3a30:	2e0a           	move.l a2,d7
    3a32:	0687 0000 0120 	addi.l #288,d7
    3a38:	2448           	movea.l a0,a2
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3a3a:	2f0b           	move.l a3,-(sp)
    3a3c:	7800           	moveq #0,d4
    3a3e:	3802           	move.w d2,d4
    3a40:	2f04           	move.l d4,-(sp)
    3a42:	2f0e           	move.l a6,-(sp)
    3a44:	4879 0000 7480 	pea 7480 <destlinezoom16>
    3a4a:	4e95           	jsr (a5)
    3a4c:	486b 0001      	pea 1(a3)
      mask = mask ^ 0xffff;
    3a50:	3c02           	move.w d2,d6
    3a52:	4646           	not.w d6
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3a54:	3f06           	move.w d6,-(sp)
    3a56:	4267           	clr.w -(sp)
    3a58:	486e 0030      	pea 48(a6)
    3a5c:	4879 0000 7480 	pea 7480 <destlinezoom16>
    3a62:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3a64:	49eb 0003      	lea 3(a3),a4
    3a68:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3a6c:	2c47           	movea.l d7,a6
    3a6e:	7e23           	moveq #35,d7
    3a70:	de8b           	add.l a3,d7
    3a72:	6000 ff48      	bra.w 39bc <ZoomTest+0x20dc>
    3a76:	7800           	moveq #0,d4
    3a78:	3802           	move.w d2,d4
    3a7a:	6000 e754      	bra.w 21d0 <ZoomTest+0x8f0>
    3a7e:	2845           	movea.l d5,a4
    3a80:	2a08           	move.l a0,d5
    TestRow( valsupposed, valactual, mask, 251+i2);
    3a82:	2f0b           	move.l a3,-(sp)
    3a84:	7c00           	moveq #0,d6
    3a86:	3c02           	move.w d2,d6
    3a88:	2f06           	move.l d6,-(sp)
    3a8a:	2f0e           	move.l a6,-(sp)
    3a8c:	4879 0000 7480 	pea 7480 <destlinezoom16>
    3a92:	4e95           	jsr (a5)
    3a94:	4878 00fc      	pea fc <main+0xf6>
    3a98:	2f04           	move.l d4,-(sp)
    3a9a:	486a 0090      	pea 144(a2)
    3a9e:	4879 0000 7480 	pea 7480 <destlinezoom16>
    3aa4:	4e95           	jsr (a5)
    3aa6:	4fef 0020      	lea 32(sp),sp
    3aaa:	347c 00fd      	movea.w #253,a2
    3aae:	2645           	movea.l d5,a3
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    3ab0:	2f0a           	move.l a2,-(sp)
    3ab2:	2f06           	move.l d6,-(sp)
    3ab4:	2f0b           	move.l a3,-(sp)
    3ab6:	4879 0000 7480 	pea 7480 <destlinezoom16>
    3abc:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    3abe:	486a 0001      	pea 1(a2)
    3ac2:	2f06           	move.l d6,-(sp)
    3ac4:	486b 0030      	pea 48(a3)
    3ac8:	4879 0000 7480 	pea 7480 <destlinezoom16>
    3ace:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3ad0:	4642           	not.w d2
    3ad2:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3ad4:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<8;i2++) {
    3ad8:	4fef 0020      	lea 32(sp),sp
    3adc:	b4fc 010d      	cmpa.w #269,a2
    3ae0:	6736           	beq.s 3b18 <ZoomTest+0x2238>
    3ae2:	7c00           	moveq #0,d6
    3ae4:	3c02           	move.w d2,d6
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    3ae6:	2f0a           	move.l a2,-(sp)
    3ae8:	2f06           	move.l d6,-(sp)
    3aea:	2f0b           	move.l a3,-(sp)
    3aec:	4879 0000 7480 	pea 7480 <destlinezoom16>
    3af2:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    3af4:	486a 0001      	pea 1(a2)
    3af8:	2f06           	move.l d6,-(sp)
    3afa:	486b 0030      	pea 48(a3)
    3afe:	4879 0000 7480 	pea 7480 <destlinezoom16>
    3b04:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3b06:	4642           	not.w d2
    3b08:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3b0a:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<8;i2++) {
    3b0e:	4fef 0020      	lea 32(sp),sp
    3b12:	b4fc 010d      	cmpa.w #269,a2
    3b16:	66ca           	bne.s 3ae2 <ZoomTest+0x2202>
  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    3b18:	4878 0001      	pea 1 <_start+0x1>
    3b1c:	4878 0010      	pea 10 <main+0xa>
    3b20:	2f0c           	move.l a4,-(sp)
    3b22:	2f03           	move.l d3,-(sp)
    3b24:	4eba d3e0      	jsr f06 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3b28:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    3b2e:	4eae ff1c      	jsr -228(a6)
    3b32:	4fef 0010      	lea 16(sp),sp
    3b36:	347c 0001      	movea.w #1,a2
  mask = 0xffff;
    3b3a:	7eff           	moveq #-1,d7
    3b3c:	266f 0034      	movea.l 52(sp),a3
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3b40:	7400           	moveq #0,d2
    3b42:	3407           	move.w d7,d2
    3b44:	486a ffff      	pea -1(a2)
    3b48:	2f02           	move.l d2,-(sp)
    3b4a:	2f0b           	move.l a3,-(sp)
    3b4c:	4879 0000 7454 	pea 7454 <destlinezoom17>
    3b52:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3b54:	2f0a           	move.l a2,-(sp)
    3b56:	2f02           	move.l d2,-(sp)
    3b58:	486b 0030      	pea 48(a3)
    3b5c:	4879 0000 7454 	pea 7454 <destlinezoom17>
    3b62:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3b64:	4647           	not.w d7
    3b66:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3b68:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<5;i2++) {
    3b6c:	4fef 0020      	lea 32(sp),sp
    3b70:	700b           	moveq #11,d0
    3b72:	b08a           	cmp.l a2,d0
    3b74:	66ca           	bne.s 3b40 <ZoomTest+0x2260>
    3b76:	2a0c           	move.l a4,d5
    3b78:	0685 0000 01e4 	addi.l #484,d5
    3b7e:	367c 000a      	movea.w #10,a3
    3b82:	2f4c 0034      	move.l a4,52(sp)
    3b86:	2c0a           	move.l a2,d6
    3b88:	2445           	movea.l d5,a2
      TestRow( valsupposed, valactual, mask, 10+i*35);
    3b8a:	2f0b           	move.l a3,-(sp)
    3b8c:	3f07           	move.w d7,-(sp)
    3b8e:	4267           	clr.w -(sp)
    3b90:	2f0a           	move.l a2,-(sp)
    3b92:	4879 0000 7454 	pea 7454 <destlinezoom17>
    3b98:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3b9a:	4dea 0030      	lea 48(a2),a6
      mask = mask ^ 0xffff;
    3b9e:	3807           	move.w d7,d4
    3ba0:	4644           	not.w d4
    for(int i2=0;i2<17;i2++) {
    3ba2:	49eb 0001      	lea 1(a3),a4
    3ba6:	4fef 0010      	lea 16(sp),sp
    3baa:	45ea 0690      	lea 1680(a2),a2
    3bae:	2a0a           	move.l a2,d5
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3bb0:	7400           	moveq #0,d2
    3bb2:	3404           	move.w d4,d2
    3bb4:	2f0c           	move.l a4,-(sp)
    3bb6:	2f02           	move.l d2,-(sp)
    3bb8:	2f0e           	move.l a6,-(sp)
    3bba:	4879 0000 7454 	pea 7454 <destlinezoom17>
    3bc0:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3bc2:	486c 0001      	pea 1(a4)
    3bc6:	2f02           	move.l d2,-(sp)
    3bc8:	486e 0030      	pea 48(a6)
    3bcc:	4879 0000 7454 	pea 7454 <destlinezoom17>
    3bd2:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3bd4:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    3bd8:	4644           	not.w d4
    3bda:	3e04           	move.w d4,d7
    3bdc:	548c           	addq.l #2,a4
    for(int i2=0;i2<17;i2++) {
    3bde:	4fef 0020      	lea 32(sp),sp
    3be2:	bdc5           	cmpa.l d5,a6
    3be4:	66ca           	bne.s 3bb0 <ZoomTest+0x22d0>
    3be6:	47eb 0023      	lea 35(a3),a3
  for(int i=0;i<7;i++) {
    3bea:	b6fc 00ff      	cmpa.w #255,a3
    3bee:	669a           	bne.s 3b8a <ZoomTest+0x22aa>
    3bf0:	286f 0034      	movea.l 52(sp),a4
    3bf4:	2446           	movea.l d6,a2
  TestRow( valsupposed, valactual, mask, 255);
    3bf6:	2f0b           	move.l a3,-(sp)
    3bf8:	3f04           	move.w d4,-(sp)
    3bfa:	4267           	clr.w -(sp)
    3bfc:	486c 2fd4      	pea 12244(a4)
    3c00:	4879 0000 7454 	pea 7454 <destlinezoom17>
    3c06:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    3c08:	4dec 3004      	lea 12292(a4),a6
    3c0c:	4fef 0010      	lea 16(sp),sp
    3c10:	367c 0100      	movea.w #256,a3
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3c14:	2f0b           	move.l a3,-(sp)
    3c16:	2f02           	move.l d2,-(sp)
    3c18:	2f0e           	move.l a6,-(sp)
    3c1a:	4879 0000 7454 	pea 7454 <destlinezoom17>
    3c20:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3c22:	486b 0001      	pea 1(a3)
    3c26:	2f02           	move.l d2,-(sp)
    3c28:	486e 0030      	pea 48(a6)
    3c2c:	4879 0000 7454 	pea 7454 <destlinezoom17>
    3c32:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3c34:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    3c36:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<7;i2++) {
    3c3a:	4fef 0020      	lea 32(sp),sp
    3c3e:	b6fc 010e      	cmpa.w #270,a3
    3c42:	6736           	beq.s 3c7a <ZoomTest+0x239a>
    3c44:	7400           	moveq #0,d2
    3c46:	3404           	move.w d4,d2
    3c48:	4644           	not.w d4
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3c4a:	2f0b           	move.l a3,-(sp)
    3c4c:	2f02           	move.l d2,-(sp)
    3c4e:	2f0e           	move.l a6,-(sp)
    3c50:	4879 0000 7454 	pea 7454 <destlinezoom17>
    3c56:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3c58:	486b 0001      	pea 1(a3)
    3c5c:	2f02           	move.l d2,-(sp)
    3c5e:	486e 0030      	pea 48(a6)
    3c62:	4879 0000 7454 	pea 7454 <destlinezoom17>
    3c68:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3c6a:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    3c6c:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<7;i2++) {
    3c70:	4fef 0020      	lea 32(sp),sp
    3c74:	b6fc 010e      	cmpa.w #270,a3
    3c78:	66ca           	bne.s 3c44 <ZoomTest+0x2364>
  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    3c7a:	4878 0001      	pea 1 <_start+0x1>
    3c7e:	4878 0011      	pea 11 <main+0xb>
    3c82:	2f03           	move.l d3,-(sp)
    3c84:	2f0c           	move.l a4,-(sp)
    3c86:	4eba d27e      	jsr f06 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3c8a:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    3c90:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    3c94:	42a7           	clr.l -(sp)
    3c96:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3c9c:	2f2f 0044      	move.l 68(sp),-(sp)
    3ca0:	4879 0000 7428 	pea 7428 <destlinezoom18>
    3ca6:	4e95           	jsr (a5)
    3ca8:	4fef 0020      	lea 32(sp),sp
    3cac:	367c 0001      	movea.w #1,a3
  mask = mask ^ 0xffff;
    3cb0:	4242           	clr.w d2
    3cb2:	2c6f 0040      	movea.l 64(sp),a6
    3cb6:	2a2f 0044      	move.l 68(sp),d5
    3cba:	2c2f 0038      	move.l 56(sp),d6
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3cbe:	7800           	moveq #0,d4
    3cc0:	3802           	move.w d2,d4
    3cc2:	2f0b           	move.l a3,-(sp)
    3cc4:	2f04           	move.l d4,-(sp)
    3cc6:	2f0e           	move.l a6,-(sp)
    3cc8:	4879 0000 7428 	pea 7428 <destlinezoom18>
    3cce:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3cd0:	486b 0001      	pea 1(a3)
    3cd4:	2f04           	move.l d4,-(sp)
    3cd6:	486e 0030      	pea 48(a6)
    3cda:	4879 0000 7428 	pea 7428 <destlinezoom18>
    3ce0:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3ce2:	4642           	not.w d2
    3ce4:	200e           	move.l a6,d0
    3ce6:	0680 0000 0120 	addi.l #288,d0
    3cec:	548b           	addq.l #2,a3
    3cee:	2c46           	movea.l d6,a6
  for(int i2=0;i2<4;i2++) {
    3cf0:	4fef 0020      	lea 32(sp),sp
    3cf4:	7209           	moveq #9,d1
    3cf6:	b28b           	cmp.l a3,d1
    3cf8:	6740           	beq.s 3d3a <ZoomTest+0x245a>
    3cfa:	2c05           	move.l d5,d6
    3cfc:	2a00           	move.l d0,d5
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3cfe:	7800           	moveq #0,d4
    3d00:	3802           	move.w d2,d4
    3d02:	2f0b           	move.l a3,-(sp)
    3d04:	2f04           	move.l d4,-(sp)
    3d06:	2f0e           	move.l a6,-(sp)
    3d08:	4879 0000 7428 	pea 7428 <destlinezoom18>
    3d0e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3d10:	486b 0001      	pea 1(a3)
    3d14:	2f04           	move.l d4,-(sp)
    3d16:	486e 0030      	pea 48(a6)
    3d1a:	4879 0000 7428 	pea 7428 <destlinezoom18>
    3d20:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3d22:	4642           	not.w d2
    3d24:	200e           	move.l a6,d0
    3d26:	0680 0000 0120 	addi.l #288,d0
    3d2c:	548b           	addq.l #2,a3
    3d2e:	2c46           	movea.l d6,a6
  for(int i2=0;i2<4;i2++) {
    3d30:	4fef 0020      	lea 32(sp),sp
    3d34:	7209           	moveq #9,d1
    3d36:	b28b           	cmp.l a3,d1
    3d38:	66c0           	bne.s 3cfa <ZoomTest+0x241a>
    3d3a:	2f45 0044      	move.l d5,68(sp)
    3d3e:	2f46 0038      	move.l d6,56(sp)
    3d42:	2805           	move.l d5,d4
    3d44:	2646           	movea.l d6,a3
    3d46:	2c4a           	movea.l a2,a6
    3d48:	2a00           	move.l d0,d5
    3d4a:	7e24           	moveq #36,d7
    3d4c:	de8a           	add.l a2,d7
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3d4e:	7c00           	moveq #0,d6
    3d50:	3c02           	move.w d2,d6
    3d52:	2f0e           	move.l a6,-(sp)
    3d54:	2f06           	move.l d6,-(sp)
    3d56:	2f0b           	move.l a3,-(sp)
    3d58:	4879 0000 7428 	pea 7428 <destlinezoom18>
    3d5e:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3d60:	486e 0001      	pea 1(a6)
    3d64:	2f06           	move.l d6,-(sp)
    3d66:	486b 0030      	pea 48(a3)
    3d6a:	4879 0000 7428 	pea 7428 <destlinezoom18>
    3d70:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3d72:	4642           	not.w d2
    3d74:	548e           	addq.l #2,a6
    for(int i2=0;i2<18;i2++) {
    3d76:	4fef 0020      	lea 32(sp),sp
    3d7a:	bdc7           	cmpa.l d7,a6
    3d7c:	673e           	beq.s 3dbc <ZoomTest+0x24dc>
    3d7e:	200b           	move.l a3,d0
    3d80:	0680 0000 0120 	addi.l #288,d0
    3d86:	2644           	movea.l d4,a3
    3d88:	2805           	move.l d5,d4
    3d8a:	2a00           	move.l d0,d5
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3d8c:	7c00           	moveq #0,d6
    3d8e:	3c02           	move.w d2,d6
    3d90:	2f0e           	move.l a6,-(sp)
    3d92:	2f06           	move.l d6,-(sp)
    3d94:	2f0b           	move.l a3,-(sp)
    3d96:	4879 0000 7428 	pea 7428 <destlinezoom18>
    3d9c:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3d9e:	486e 0001      	pea 1(a6)
    3da2:	2f06           	move.l d6,-(sp)
    3da4:	486b 0030      	pea 48(a3)
    3da8:	4879 0000 7428 	pea 7428 <destlinezoom18>
    3dae:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3db0:	4642           	not.w d2
    3db2:	548e           	addq.l #2,a6
    for(int i2=0;i2<18;i2++) {
    3db4:	4fef 0020      	lea 32(sp),sp
    3db8:	bdc7           	cmpa.l d7,a6
    3dba:	66c2           	bne.s 3d7e <ZoomTest+0x249e>
    3dbc:	45ea 0023      	lea 35(a2),a2
  for(int i=0;i<7;i++) {  
    3dc0:	b4fc 0100      	cmpa.w #256,a2
    3dc4:	6718           	beq.s 3dde <ZoomTest+0x24fe>
    3dc6:	200b           	move.l a3,d0
    3dc8:	0680 0000 0120 	addi.l #288,d0
    3dce:	2644           	movea.l d4,a3
    3dd0:	2805           	move.l d5,d4
  for(int i2=0;i2<4;i2++) {
    3dd2:	2c4a           	movea.l a2,a6
    3dd4:	2a00           	move.l d0,d5
    3dd6:	7e24           	moveq #36,d7
    3dd8:	de8a           	add.l a2,d7
    3dda:	6000 ff72      	bra.w 3d4e <ZoomTest+0x246e>
    3dde:	2644           	movea.l d4,a3
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3de0:	7800           	moveq #0,d4
    3de2:	3802           	move.w d2,d4
    3de4:	2f0a           	move.l a2,-(sp)
    3de6:	2f04           	move.l d4,-(sp)
    3de8:	2f0b           	move.l a3,-(sp)
    3dea:	4879 0000 7428 	pea 7428 <destlinezoom18>
    3df0:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3df2:	486a 0001      	pea 1(a2)
    3df6:	2f04           	move.l d4,-(sp)
    3df8:	486b 0030      	pea 48(a3)
    3dfc:	4879 0000 7428 	pea 7428 <destlinezoom18>
    3e02:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3e04:	4642           	not.w d2
    3e06:	548a           	addq.l #2,a2
  for(int i2=0;i2<4;i2++) {
    3e08:	4fef 0020      	lea 32(sp),sp
    3e0c:	b4fc 0108      	cmpa.w #264,a2
    3e10:	673e           	beq.s 3e50 <ZoomTest+0x2570>
    3e12:	200b           	move.l a3,d0
    3e14:	0680 0000 00c0 	addi.l #192,d0
    3e1a:	2645           	movea.l d5,a3
    3e1c:	2a00           	move.l d0,d5
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3e1e:	7800           	moveq #0,d4
    3e20:	3802           	move.w d2,d4
    3e22:	2f0a           	move.l a2,-(sp)
    3e24:	2f04           	move.l d4,-(sp)
    3e26:	2f0b           	move.l a3,-(sp)
    3e28:	4879 0000 7428 	pea 7428 <destlinezoom18>
    3e2e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3e30:	486a 0001      	pea 1(a2)
    3e34:	2f04           	move.l d4,-(sp)
    3e36:	486b 0030      	pea 48(a3)
    3e3a:	4879 0000 7428 	pea 7428 <destlinezoom18>
    3e40:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3e42:	4642           	not.w d2
    3e44:	548a           	addq.l #2,a2
  for(int i2=0;i2<4;i2++) {
    3e46:	4fef 0020      	lea 32(sp),sp
    3e4a:	b4fc 0108      	cmpa.w #264,a2
    3e4e:	66c2           	bne.s 3e12 <ZoomTest+0x2532>
  TestRow( valsupposed, valactual, mask, 0);
    3e50:	42a7           	clr.l -(sp)
    3e52:	3f02           	move.w d2,-(sp)
    3e54:	4267           	clr.w -(sp)
    3e56:	2f05           	move.l d5,-(sp)
    3e58:	4879 0000 7428 	pea 7428 <destlinezoom18>
    3e5e:	4e95           	jsr (a5)
  FreeMem( source, (ZMLINESIZE+4)*272);
    3e60:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    3e66:	224c           	movea.l a4,a1
    3e68:	203c 0000 3740 	move.l #14144,d0
    3e6e:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272);
    3e72:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    3e78:	2243           	movea.l d3,a1
    3e7a:	203c 0000 3740 	move.l #14144,d0
    3e80:	4eae ff2e      	jsr -210(a6)
    3e84:	4fef 0010      	lea 16(sp),sp
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3e88:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    3e8e:	203c 0001 1440 	move.l #70720,d0
    3e94:	7202           	moveq #2,d1
    3e96:	4eae ff3a      	jsr -198(a6)
    3e9a:	2f40 0034      	move.l d0,52(sp)
  if( source == 0) {
    3e9e:	6700 032e      	beq.w 41ce <ZoomTest+0x28ee>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3ea2:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    3ea8:	203c 0001 1440 	move.l #70720,d0
    3eae:	7202           	moveq #2,d1
    3eb0:	4eae ff3a      	jsr -198(a6)
    3eb4:	2f40 0038      	move.l d0,56(sp)
  if( destination == 0) {
    3eb8:	6700 0380      	beq.w 423a <ZoomTest+0x295a>
    3ebc:	242f 0034      	move.l 52(sp),d2
    3ec0:	0682 0000 ff00 	addi.l #65280,d2
    3ec6:	246f 0034      	movea.l 52(sp),a2
    3eca:	4878 00f0      	pea f0 <main+0xea>
    3ece:	4878 0055      	pea 55 <main+0x4f>
    3ed2:	2f0a           	move.l a2,-(sp)
    3ed4:	4eba 0462      	jsr 4338 <memset>(pc)
    3ed8:	4878 00f0      	pea f0 <main+0xea>
    3edc:	4878 00aa      	pea aa <main+0xa4>
    3ee0:	486a 00f0      	pea 240(a2)
    3ee4:	4eba 0452      	jsr 4338 <memset>(pc)
    3ee8:	45ea 01e0      	lea 480(a2),a2
  for(int i=0;i<128+8;i++) {
    3eec:	4fef 0018      	lea 24(sp),sp
    3ef0:	b48a           	cmp.l a2,d2
    3ef2:	66d6           	bne.s 3eca <ZoomTest+0x25ea>
  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    3ef4:	4878 0005      	pea 5 <_start+0x5>
    3ef8:	42a7           	clr.l -(sp)
    3efa:	2f2f 0040      	move.l 64(sp),-(sp)
    3efe:	2f2f 0040      	move.l 64(sp),-(sp)
    3f02:	4eba d002      	jsr f06 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3f06:	2c79 0000 779e 	movea.l 779e <GfxBase>,a6
    3f0c:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<14;i++) {
    3f10:	202f 0048      	move.l 72(sp),d0
    3f14:	0680 0000 11d4 	addi.l #4564,d0
    3f1a:	2f40 003c      	move.l d0,60(sp)
    3f1e:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3f22:	7c12           	moveq #18,d6
  UWORD mask = 0xffff;
    3f24:	7eff           	moveq #-1,d7
    3f26:	4bfa ca86      	lea 9ae <TestRow>(pc),a5
    3f2a:	41ef 0078      	lea 120(sp),a0
    3f2e:	2f48 0048      	move.l a0,72(sp)
    3f32:	2f4d 0030      	move.l a5,48(sp)
    3f36:	2a46           	movea.l d6,a5
    3f38:	282f 002c      	move.l 44(sp),d4
    3f3c:	0684 ffff ef4a 	addi.l #-4278,d4
    3f42:	3c0d           	move.w a5,d6
    3f44:	0646 ffee      	addi.w #-18,d6
    3f48:	307c 002a      	movea.w #42,a0
    3f4c:	d1ef 002c      	adda.l 44(sp),a0
    3f50:	2f48 0044      	move.l a0,68(sp)
    3f54:	2f4d 003c      	move.l a5,60(sp)
    3f58:	2844           	movea.l d4,a4
    3f5a:	49ec ff10      	lea -240(a4),a4
    3f5e:	41ec ffd6      	lea -42(a4),a0
    3f62:	2f48 0040      	move.l a0,64(sp)
  char str[ 100] = { 0 };
    3f66:	4878 0064      	pea 64 <main+0x5e>
    3f6a:	42a7           	clr.l -(sp)
    3f6c:	486f 0080      	pea 128(sp)
    3f70:	4eba 03c6      	jsr 4338 <memset>(pc)
  data[1] = numberofline;
    3f74:	3f46 0082      	move.w d6,130(sp)
    3f78:	4fef 000c      	lea 12(sp),sp
  for(int i=0;i<21;i++) {
    3f7c:	7a00           	moveq #0,d5
  testpattern += 0;
    3f7e:	4bf9 0000 7714 	lea 7714 <destlinezoom1>,a5
    if( (*testpattern++ ^ xormask) != *destination++) {
    3f84:	301d           	move.w (a5)+,d0
    3f86:	bf40           	eor.w d7,d0
    3f88:	206f 0040      	movea.l 64(sp),a0
    3f8c:	54af 0040      	addq.l #2,64(sp)
    3f90:	b058           	cmp.w (a0)+,d0
    3f92:	673c           	beq.s 3fd0 <ZoomTest+0x26f0>
      data[0] = i;
    3f94:	3f45 0074      	move.w d5,116(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    3f98:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    3f9e:	41f9 0000 4d33 	lea 4d33 <incbin_swfont_end+0x49>,a0
    3fa4:	43ef 0074      	lea 116(sp),a1
    3fa8:	45f9 0000 4524 	lea 4524 <PutChar>,a2
    3fae:	47ef 0078      	lea 120(sp),a3
    3fb2:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    3fb6:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    3fbc:	4eae ffc4      	jsr -60(a6)
    3fc0:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    3fc6:	2200           	move.l d0,d1
    3fc8:	240b           	move.l a3,d2
    3fca:	7664           	moveq #100,d3
    3fcc:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    3fd0:	5285           	addq.l #1,d5
    3fd2:	bbfc 0000 773e 	cmpa.l #30526,a5
    3fd8:	66aa           	bne.s 3f84 <ZoomTest+0x26a4>
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    3fda:	3039 0000 773e 	move.w 773e <destlinezoom1+0x2a>,d0
    3fe0:	bf40           	eor.w d7,d0
    3fe2:	3214           	move.w (a4),d1
    3fe4:	b340           	eor.w d1,d0
    3fe6:	0240 ff00      	andi.w #-256,d0
    3fea:	6600 00b4      	bne.w 40a0 <ZoomTest+0x27c0>
        valactual += ZMLINESIZE/2;
    3fee:	49ec 0030      	lea 48(a4),a4
      for( int i3=0;i3<5;i3++) {
    3ff2:	b88c           	cmp.l a4,d4
    3ff4:	6600 ff68      	bne.w 3f5e <ZoomTest+0x267e>
      mask = mask ^ 0xffff;
    3ff8:	4647           	not.w d7
    3ffa:	0684 0000 00f0 	addi.l #240,d4
    4000:	5246           	addq.w #1,d6
    for(int i2=0;i2<18;i2++) { 
    4002:	b8af 0044      	cmp.l 68(sp),d4
    4006:	6600 ff50      	bne.w 3f58 <ZoomTest+0x2678>
    400a:	2a6f 003c      	movea.l 60(sp),a5
    400e:	246f 002c      	movea.l 44(sp),a2
    4012:	45ea ff10      	lea -240(a2),a2
    4016:	7600           	moveq #0,d3
    4018:	3607           	move.w d7,d3
      TestRow( valsupposed, valactual, mask, 18+i*19);
    401a:	2f0d           	move.l a5,-(sp)
    401c:	2f03           	move.l d3,-(sp)
    401e:	2f0a           	move.l a2,-(sp)
    4020:	4879 0000 7714 	pea 7714 <destlinezoom1>
    4026:	206f 0040      	movea.l 64(sp),a0
    402a:	4e90           	jsr (a0)
      valactual += ZMLINESIZE/2;
    402c:	45ea 0030      	lea 48(a2),a2
    for( int i3=0;i3<5;i3++) {
    4030:	4fef 0010      	lea 16(sp),sp
    4034:	b5ef 002c      	cmpa.l 44(sp),a2
    4038:	66e0           	bne.s 401a <ZoomTest+0x273a>
    403a:	45ea 11d0      	lea 4560(a2),a2
    403e:	2f4a 002c      	move.l a2,44(sp)
    4042:	4bed 0013      	lea 19(a5),a5
  for(int i=0;i<14;i++) {
    4046:	bafc 011c      	cmpa.w #284,a5
    404a:	6600 feec      	bne.w 3f38 <ZoomTest+0x2658>
    404e:	2a6f 0030      	movea.l 48(sp),a5
    4052:	246f 0038      	movea.l 56(sp),a2
    4056:	d5fc 0000 f964 	adda.l #63844,a2
    405c:	243c 0000 0109 	move.l #265,d2
    4062:	280a           	move.l a2,d4
    4064:	0684 0000 00f0 	addi.l #240,d4
      TestRow( valsupposed, valactual, mask, i2+265);
    406a:	2f02           	move.l d2,-(sp)
    406c:	2f03           	move.l d3,-(sp)
    406e:	2f0a           	move.l a2,-(sp)
    4070:	4879 0000 7714 	pea 7714 <destlinezoom1>
    4076:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    4078:	45ea 0030      	lea 48(a2),a2
    for( int i3=0;i3<5;i3++) {
    407c:	4fef 0010      	lea 16(sp),sp
    4080:	b88a           	cmp.l a2,d4
    4082:	66e6           	bne.s 406a <ZoomTest+0x278a>
    mask = mask ^ 0xffff;
    4084:	4647           	not.w d7
    4086:	5282           	addq.l #1,d2
  for(int i2=0;i2<4;i2++) { 
    4088:	0c82 0000 010d 	cmpi.l #269,d2
    408e:	6700 009e      	beq.w 412e <ZoomTest+0x284e>
    4092:	7600           	moveq #0,d3
    4094:	3607           	move.w d7,d3
    4096:	280a           	move.l a2,d4
    4098:	0684 0000 00f0 	addi.l #240,d4
    409e:	60ca           	bra.s 406a <ZoomTest+0x278a>
    data[0] = 21;
    40a0:	3f7c 0015 0074 	move.w #21,116(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    40a6:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    40ac:	41f9 0000 4d33 	lea 4d33 <incbin_swfont_end+0x49>,a0
    40b2:	43ef 0074      	lea 116(sp),a1
    40b6:	45f9 0000 4524 	lea 4524 <PutChar>,a2
    40bc:	47ef 0078      	lea 120(sp),a3
    40c0:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    40c4:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    40ca:	4eae ffc4      	jsr -60(a6)
    40ce:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    40d4:	2200           	move.l d0,d1
    40d6:	240b           	move.l a3,d2
    40d8:	7664           	moveq #100,d3
    40da:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    40de:	7000           	moveq #0,d0
    40e0:	3014           	move.w (a4),d0
    40e2:	2f00           	move.l d0,-(sp)
    40e4:	3039 0000 773e 	move.w 773e <destlinezoom1+0x2a>,d0
    40ea:	2f00           	move.l d0,-(sp)
    40ec:	4879 0000 4d63 	pea 4d63 <incbin_swfont_end+0x79>
    40f2:	4eba c852      	jsr 946 <KPrintF>(pc)
        valactual += ZMLINESIZE/2;
    40f6:	49ec 0030      	lea 48(a4),a4
      for( int i3=0;i3<5;i3++) {
    40fa:	4fef 000c      	lea 12(sp),sp
    40fe:	b88c           	cmp.l a4,d4
    4100:	6700 fef6      	beq.w 3ff8 <ZoomTest+0x2718>
    4104:	41ec ffd6      	lea -42(a4),a0
    4108:	2f48 0040      	move.l a0,64(sp)
  char str[ 100] = { 0 };
    410c:	4878 0064      	pea 64 <main+0x5e>
    4110:	42a7           	clr.l -(sp)
    4112:	486f 0080      	pea 128(sp)
    4116:	4eba 0220      	jsr 4338 <memset>(pc)
  data[1] = numberofline;
    411a:	3f46 0082      	move.w d6,130(sp)
    411e:	4fef 000c      	lea 12(sp),sp
  for(int i=0;i<21;i++) {
    4122:	7a00           	moveq #0,d5
  testpattern += 0;
    4124:	4bf9 0000 7714 	lea 7714 <destlinezoom1>,a5
    412a:	6000 fe58      	bra.w 3f84 <ZoomTest+0x26a4>
  FreeMem( source, (ZMLINESIZE+4)*272*5);
    412e:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    4134:	226f 0034      	movea.l 52(sp),a1
    4138:	203c 0001 1440 	move.l #70720,d0
    413e:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272*5);
    4142:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    4148:	226f 0038      	movea.l 56(sp),a1
    414c:	203c 0001 1440 	move.l #70720,d0
    4152:	4eae ff2e      	jsr -210(a6)
}
    4156:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    415a:	4fef 00b0      	lea 176(sp),sp
    415e:	4e75           	rts
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    4160:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    4166:	4eae ffc4      	jsr -60(a6)
    416a:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    4170:	2200           	move.l d0,d1
    4172:	243c 0000 50d1 	move.l #20689,d2
    4178:	7635           	moveq #53,d3
    417a:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    417e:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    4184:	203c 0000 3740 	move.l #14144,d0
    418a:	7202           	moveq #2,d1
    418c:	4eae ff3a      	jsr -198(a6)
    4190:	2600           	move.l d0,d3
  if( source == 0) {
    4192:	6600 df0a      	bne.w 209e <ZoomTest+0x7be>
    Write(  Output(), 
    4196:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    419c:	4eae ffc4      	jsr -60(a6)
    41a0:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    41a6:	2200           	move.l d0,d1
    41a8:	243c 0000 5148 	move.l #20808,d2
    41ae:	7639           	moveq #57,d3
    41b0:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    41b4:	2c79 0000 77aa 	movea.l 77aa <SysBase>,a6
    41ba:	203c 0001 1440 	move.l #70720,d0
    41c0:	7202           	moveq #2,d1
    41c2:	4eae ff3a      	jsr -198(a6)
    41c6:	2f40 0034      	move.l d0,52(sp)
  if( source == 0) {
    41ca:	6600 fcd6      	bne.w 3ea2 <ZoomTest+0x25c2>
    Write(  Output(), 
    41ce:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    41d4:	4eae ffc4      	jsr -60(a6)
    41d8:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    41de:	2200           	move.l d0,d1
    41e0:	243c 0000 5148 	move.l #20808,d2
    41e6:	7639           	moveq #57,d3
    41e8:	4eae ffd0      	jsr -48(a6)
}
    41ec:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    41f0:	4fef 00b0      	lea 176(sp),sp
    41f4:	4e75           	rts
    Write(  Output(), 
    41f6:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    41fc:	4eae ffc4      	jsr -60(a6)
    4200:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    4206:	2200           	move.l d0,d1
    4208:	243c 0000 5044 	move.l #20548,d2
    420e:	7636           	moveq #54,d3
    4210:	4eae ffd0      	jsr -48(a6)
    return;
    4214:	6000 dc36      	bra.w 1e4c <ZoomTest+0x56c>
    Write(  Output(), 
    4218:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    421e:	4eae ffc4      	jsr -60(a6)
    4222:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    4228:	2200           	move.l d0,d1
    422a:	243c 0000 4e0b 	move.l #19979,d2
    4230:	7639           	moveq #57,d3
    4232:	4eae ffd0      	jsr -48(a6)
    return;
    4236:	6000 d8a2      	bra.w 1ada <ZoomTest+0x1fa>
    Write(  Output(), 
    423a:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    4240:	4eae ffc4      	jsr -60(a6)
    4244:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    424a:	2200           	move.l d0,d1
    424c:	243c 0000 5182 	move.l #20866,d2
    4252:	763d           	moveq #61,d3
    4254:	4eae ffd0      	jsr -48(a6)
}
    4258:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    425c:	4fef 00b0      	lea 176(sp),sp
    4260:	4e75           	rts
    Write(  Output(), 
    4262:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    4268:	4eae ffc4      	jsr -60(a6)
    426c:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    4272:	2200           	move.l d0,d1
    4274:	243c 0000 4e42 	move.l #20034,d2
    427a:	763d           	moveq #61,d3
    427c:	4eae ffd0      	jsr -48(a6)
    return;
    4280:	6000 d858      	bra.w 1ada <ZoomTest+0x1fa>
    Write(  Output(), 
    4284:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    428a:	4eae ffc4      	jsr -60(a6)
    428e:	2c79 0000 77a6 	movea.l 77a6 <DOSBase>,a6
    4294:	2200           	move.l d0,d1
    4296:	243c 0000 5182 	move.l #20866,d2
    429c:	763d           	moveq #61,d3
    429e:	4eae ffd0      	jsr -48(a6)
    return;
    42a2:	6000 fbe4      	bra.w 3e88 <ZoomTest+0x25a8>

000042a6 <memcpy>:
{
    42a6:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    42aa:	202f 0014      	move.l 20(sp),d0
    42ae:	226f 0018      	movea.l 24(sp),a1
    42b2:	222f 001c      	move.l 28(sp),d1
	while(len--)
    42b6:	2601           	move.l d1,d3
    42b8:	5383           	subq.l #1,d3
    42ba:	4a81           	tst.l d1
    42bc:	6762           	beq.s 4320 <memcpy+0x7a>
    42be:	2040           	movea.l d0,a0
    42c0:	5888           	addq.l #4,a0
    42c2:	b1c9           	cmpa.l a1,a0
    42c4:	53c2           	sl.s d2
    42c6:	4402           	neg.b d2
    42c8:	41e9 0004      	lea 4(a1),a0
    42cc:	b1c0           	cmpa.l d0,a0
    42ce:	53c4           	sl.s d4
    42d0:	4404           	neg.b d4
    42d2:	8404           	or.b d4,d2
    42d4:	7808           	moveq #8,d4
    42d6:	b883           	cmp.l d3,d4
    42d8:	55c4           	sc.s d4
    42da:	4404           	neg.b d4
    42dc:	c404           	and.b d4,d2
    42de:	6746           	beq.s 4326 <memcpy+0x80>
    42e0:	2409           	move.l a1,d2
    42e2:	8480           	or.l d0,d2
    42e4:	7803           	moveq #3,d4
    42e6:	c484           	and.l d4,d2
    42e8:	663c           	bne.s 4326 <memcpy+0x80>
    42ea:	2049           	movea.l a1,a0
    42ec:	2440           	movea.l d0,a2
    42ee:	74fc           	moveq #-4,d2
    42f0:	c481           	and.l d1,d2
    42f2:	d489           	add.l a1,d2
		*d++ = *s++;
    42f4:	24d8           	move.l (a0)+,(a2)+
    42f6:	b488           	cmp.l a0,d2
    42f8:	66fa           	bne.s 42f4 <memcpy+0x4e>
    42fa:	74fc           	moveq #-4,d2
    42fc:	c481           	and.l d1,d2
    42fe:	2040           	movea.l d0,a0
    4300:	d1c2           	adda.l d2,a0
    4302:	d3c2           	adda.l d2,a1
    4304:	9682           	sub.l d2,d3
    4306:	b481           	cmp.l d1,d2
    4308:	6716           	beq.s 4320 <memcpy+0x7a>
    430a:	1091           	move.b (a1),(a0)
	while(len--)
    430c:	4a83           	tst.l d3
    430e:	6710           	beq.s 4320 <memcpy+0x7a>
		*d++ = *s++;
    4310:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    4316:	5383           	subq.l #1,d3
    4318:	6706           	beq.s 4320 <memcpy+0x7a>
		*d++ = *s++;
    431a:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    4320:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    4324:	4e75           	rts
    4326:	2040           	movea.l d0,a0
    4328:	d289           	add.l a1,d1
		*d++ = *s++;
    432a:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    432c:	b289           	cmp.l a1,d1
    432e:	67f0           	beq.s 4320 <memcpy+0x7a>
		*d++ = *s++;
    4330:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    4332:	b289           	cmp.l a1,d1
    4334:	66f4           	bne.s 432a <memcpy+0x84>
    4336:	60e8           	bra.s 4320 <memcpy+0x7a>

00004338 <memset>:
{
    4338:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    433c:	202f 0024      	move.l 36(sp),d0
    4340:	2a2f 0028      	move.l 40(sp),d5
    4344:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    4348:	2809           	move.l a1,d4
    434a:	5384           	subq.l #1,d4
    434c:	b2fc 0000      	cmpa.w #0,a1
    4350:	6f00 00b0      	ble.w 4402 <memset+0xca>
    4354:	1e05           	move.b d5,d7
    4356:	2200           	move.l d0,d1
    4358:	4481           	neg.l d1
    435a:	7403           	moveq #3,d2
    435c:	c282           	and.l d2,d1
    435e:	7c05           	moveq #5,d6
		*ptr++ = val;
    4360:	2440           	movea.l d0,a2
    4362:	bc84           	cmp.l d4,d6
    4364:	646a           	bcc.s 43d0 <memset+0x98>
    4366:	4a81           	tst.l d1
    4368:	6724           	beq.s 438e <memset+0x56>
    436a:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    436c:	5384           	subq.l #1,d4
    436e:	7401           	moveq #1,d2
    4370:	b481           	cmp.l d1,d2
    4372:	671a           	beq.s 438e <memset+0x56>
		*ptr++ = val;
    4374:	2440           	movea.l d0,a2
    4376:	548a           	addq.l #2,a2
    4378:	2040           	movea.l d0,a0
    437a:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    437e:	5384           	subq.l #1,d4
    4380:	7403           	moveq #3,d2
    4382:	b481           	cmp.l d1,d2
    4384:	6608           	bne.s 438e <memset+0x56>
		*ptr++ = val;
    4386:	528a           	addq.l #1,a2
    4388:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    438c:	5384           	subq.l #1,d4
    438e:	2609           	move.l a1,d3
    4390:	9681           	sub.l d1,d3
    4392:	7c00           	moveq #0,d6
    4394:	1c05           	move.b d5,d6
    4396:	2406           	move.l d6,d2
    4398:	4842           	swap d2
    439a:	4242           	clr.w d2
    439c:	2042           	movea.l d2,a0
    439e:	2406           	move.l d6,d2
    43a0:	e14a           	lsl.w #8,d2
    43a2:	4842           	swap d2
    43a4:	4242           	clr.w d2
    43a6:	e18e           	lsl.l #8,d6
    43a8:	2646           	movea.l d6,a3
    43aa:	2c08           	move.l a0,d6
    43ac:	8486           	or.l d6,d2
    43ae:	2c0b           	move.l a3,d6
    43b0:	8486           	or.l d6,d2
    43b2:	1407           	move.b d7,d2
    43b4:	2040           	movea.l d0,a0
    43b6:	d1c1           	adda.l d1,a0
    43b8:	72fc           	moveq #-4,d1
    43ba:	c283           	and.l d3,d1
    43bc:	d288           	add.l a0,d1
		*ptr++ = val;
    43be:	20c2           	move.l d2,(a0)+
    43c0:	b1c1           	cmpa.l d1,a0
    43c2:	66fa           	bne.s 43be <memset+0x86>
    43c4:	72fc           	moveq #-4,d1
    43c6:	c283           	and.l d3,d1
    43c8:	d5c1           	adda.l d1,a2
    43ca:	9881           	sub.l d1,d4
    43cc:	b283           	cmp.l d3,d1
    43ce:	6732           	beq.s 4402 <memset+0xca>
    43d0:	1485           	move.b d5,(a2)
	while(len-- > 0)
    43d2:	4a84           	tst.l d4
    43d4:	6f2c           	ble.s 4402 <memset+0xca>
		*ptr++ = val;
    43d6:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    43da:	7201           	moveq #1,d1
    43dc:	b284           	cmp.l d4,d1
    43de:	6c22           	bge.s 4402 <memset+0xca>
		*ptr++ = val;
    43e0:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    43e4:	7402           	moveq #2,d2
    43e6:	b484           	cmp.l d4,d2
    43e8:	6c18           	bge.s 4402 <memset+0xca>
		*ptr++ = val;
    43ea:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    43ee:	7c03           	moveq #3,d6
    43f0:	bc84           	cmp.l d4,d6
    43f2:	6c0e           	bge.s 4402 <memset+0xca>
		*ptr++ = val;
    43f4:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    43f8:	7204           	moveq #4,d1
    43fa:	b284           	cmp.l d4,d1
    43fc:	6c04           	bge.s 4402 <memset+0xca>
		*ptr++ = val;
    43fe:	1545 0005      	move.b d5,5(a2)
}
    4402:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    4406:	4e75           	rts

00004408 <strlen>:
{
    4408:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    440c:	7000           	moveq #0,d0
	while(*s++)
    440e:	4a10           	tst.b (a0)
    4410:	6708           	beq.s 441a <strlen+0x12>
		t++;
    4412:	5280           	addq.l #1,d0
	while(*s++)
    4414:	4a30 0800      	tst.b (0,a0,d0.l)
    4418:	66f8           	bne.s 4412 <strlen+0xa>
}
    441a:	4e75           	rts

0000441c <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    441c:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    4420:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    4424:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    4428:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    442c:	d041           	add.w d1,d0
	swap	d0
    442e:	4840           	swap d0
	clrw	d0
    4430:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    4432:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    4436:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    443a:	d081           	add.l d1,d0

	rts
    443c:	4e75           	rts

0000443e <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    443e:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    4440:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    4444:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    4448:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    444e:	6416           	bcc.s 4466 <__udivsi3+0x28>
	movel	d0, d2
    4450:	2400           	move.l d0,d2
	clrw	d2
    4452:	4242           	clr.w d2
	swap	d2
    4454:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    4456:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    4458:	3002           	move.w d2,d0
	swap	d0
    445a:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    445c:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    4460:	84c1           	divu.w d1,d2
	movew	d2, d0
    4462:	3002           	move.w d2,d0
	jra	6f
    4464:	6030           	bra.s 4496 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    4466:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    4468:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    446a:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    446c:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    4472:	64f4           	bcc.s 4468 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    4474:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    4476:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    447c:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    447e:	c2c0           	mulu.w d0,d1
	swap	d2
    4480:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    4482:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    4484:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    4486:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    4488:	660a           	bne.s 4494 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    448a:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    448c:	6506           	bcs.s 4494 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    448e:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    4492:	6302           	bls.s 4496 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    4494:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    4496:	241f           	move.l (sp)+,d2
	rts
    4498:	4e75           	rts

0000449a <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    449a:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    449c:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    449e:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    44a2:	6a04           	bpl.s 44a8 <__divsi3+0xe>
	negl	d1
    44a4:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    44a6:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    44a8:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    44ac:	6a04           	bpl.s 44b2 <__divsi3+0x18>
	negl	d0
    44ae:	4480           	neg.l d0
	negb	d2
    44b0:	4402           	neg.b d2

2:	movel	d1, sp@-
    44b2:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    44b4:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    44b6:	6186           	bsr.s 443e <__udivsi3>
	addql	IMM (8), sp
    44b8:	508f           	addq.l #8,sp

	tstb	d2
    44ba:	4a02           	tst.b d2
	jpl	3f
    44bc:	6a02           	bpl.s 44c0 <__divsi3+0x26>
	negl	d0
    44be:	4480           	neg.l d0

3:	movel	sp@+, d2
    44c0:	241f           	move.l (sp)+,d2
	rts
    44c2:	4e75           	rts

000044c4 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    44c4:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    44c8:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    44cc:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    44ce:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    44d0:	61c8           	bsr.s 449a <__divsi3>
	addql	IMM (8), sp
    44d2:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    44d4:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    44d8:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    44da:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    44dc:	6100 ff3e      	bsr.w 441c <__mulsi3>
	addql	IMM (8), sp
    44e0:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    44e2:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    44e6:	9280           	sub.l d0,d1
	movel	d1, d0
    44e8:	2001           	move.l d1,d0
	rts
    44ea:	4e75           	rts

000044ec <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    44ec:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    44f0:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    44f4:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    44f6:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    44f8:	6100 ff44      	bsr.w 443e <__udivsi3>
	addql	IMM (8), sp
    44fc:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    44fe:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    4502:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4504:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    4506:	6100 ff14      	bsr.w 441c <__mulsi3>
	addql	IMM (8), sp
    450a:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    450c:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    4510:	9280           	sub.l d0,d1
	movel	d1, d0
    4512:	2001           	move.l d1,d0
	rts
    4514:	4e75           	rts

00004516 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    4516:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    4518:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    451c:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    4520:	2c5f           	movea.l (sp)+,a6
    rts
    4522:	4e75           	rts

00004524 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    4524:	16c0           	move.b d0,(a3)+
	rts
    4526:	4e75           	rts

00004528 <saveregs>:
	...

00004564 <font2distance>:
    4564:	0505           	btst d2,d5
    4566:	0505           	btst d2,d5
    4568:	0505           	btst d2,d5
    456a:	0505           	btst d2,d5
    456c:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    456e:	0505           	btst d2,d5
    4570:	0505           	btst d2,d5
    4572:	0005 0505      	ori.b #5,d5
    4576:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    4578:	0505           	btst d2,d5
    457a:	0505           	btst d2,d5
    457c:	0505           	btst d2,d5
    457e:	0505           	btst d2,d5
    4580:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    4582:	0505           	btst d2,d5
    4584:	0505           	btst d2,d5
    4586:	0505           	btst d2,d5
    4588:	0505           	btst d2,d5
    458a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    458c:	0500           	btst d2,d0
    458e:	0505           	btst d2,d5
    4590:	0505           	btst d2,d5
    4592:	0505           	btst d2,d5
    4594:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    4596:	0505           	btst d2,d5
    4598:	0505           	btst d2,d5
    459a:	0505           	btst d2,d5
    459c:	0505           	btst d2,d5
    459e:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    45a0:	0505           	btst d2,d5
    45a2:	0505           	btst d2,d5
    45a4:	0503           	btst d2,d3
    45a6:	0505           	btst d2,d5
    45a8:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    45aa:	0505           	btst d2,d5
    45ac:	0500           	btst d2,d0
    45ae:	0505           	btst d2,d5
    45b0:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    45b4:	0505           	btst d2,d5
    45b6:	0503           	btst d2,d3
    45b8:	0205 0507      	andi.b #7,d5
    45bc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    45be:	0505           	btst d2,d5
    45c0:	0505           	btst d2,d5
    45c2:	0505           	btst d2,d5
    45c4:	0505           	btst d2,d5
    45c6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    45c8:	0505           	btst d2,d5
    45ca:	0505           	btst d2,d5
    45cc:	0505           	btst d2,d5
    45ce:	0505           	btst d2,d5
    45d0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    45d2:	0505           	btst d2,d5
    45d4:	0505           	btst d2,d5
    45d6:	0505           	btst d2,d5
    45d8:	0505           	btst d2,d5
    45da:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    45dc:	0505           	btst d2,d5
    45de:	0505           	btst d2,d5
    45e0:	0505           	btst d2,d5
    45e2:	0505           	btst d2,d5
    45e4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    45e6:	0505           	btst d2,d5
    45e8:	0505           	btst d2,d5
    45ea:	0505           	btst d2,d5
    45ec:	0505           	btst d2,d5
    45ee:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    45f0:	0505           	btst d2,d5
    45f2:	0505           	btst d2,d5
    45f4:	0505           	btst d2,d5
    45f6:	0505           	btst d2,d5
    45f8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    45fa:	0505           	btst d2,d5
    45fc:	0505           	btst d2,d5
    45fe:	0505           	btst d2,d5
    4600:	0505           	btst d2,d5
    4602:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4604:	0505           	btst d2,d5
    4606:	0505           	btst d2,d5
    4608:	0505           	btst d2,d5
    460a:	0505           	btst d2,d5
    460c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    460e:	0505           	btst d2,d5
    4610:	0505           	btst d2,d5
    4612:	0505           	btst d2,d5
    4614:	0505           	btst d2,d5
    4616:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4618:	0505           	btst d2,d5
    461a:	0505           	btst d2,d5
    461c:	0505           	btst d2,d5
    461e:	0505           	btst d2,d5
    4620:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4622:	0505           	btst d2,d5
    4624:	0505           	btst d2,d5
    4626:	0505           	btst d2,d5
    4628:	0505           	btst d2,d5
    462a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    462c:	0505           	btst d2,d5
    462e:	0505           	btst d2,d5
    4630:	0505           	btst d2,d5
    4632:	0505           	btst d2,d5
    4634:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4636:	0505           	btst d2,d5
    4638:	0505           	btst d2,d5
    463a:	0505           	btst d2,d5
    463c:	0505           	btst d2,d5
    463e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4640:	0505           	btst d2,d5
    4642:	0505           	btst d2,d5
    4644:	0505           	btst d2,d5
    4646:	0505           	btst d2,d5
    4648:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    464a:	0505           	btst d2,d5
    464c:	0505           	btst d2,d5
    464e:	0505           	btst d2,d5
    4650:	0505           	btst d2,d5
    4652:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4654:	0505           	btst d2,d5
    4656:	0505           	btst d2,d5
    4658:	0505           	btst d2,d5
    465a:	0505           	btst d2,d5
    465c:	0505           	btst d2,d5

0000465e <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    465e:	16c0           	move.b d0,(a3)+
  RTS
    4660:	4e75           	rts

00004662 <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    4662:	48f9 7fff 0000 	movem.l d0-a6,4528 <saveregs>
    4668:	4528 
  lea 0xdff000,a5
    466a:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddabae>,a5
  move.l sp@(4),a0  //Fontlocation
    4670:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    4674:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    4678:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    467c:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    467e:	082d 0006 0002 	btst #6,2(a5)

00004684 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    4684:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    468a:	66f8           	bne.s 4684 <st2wblit>

0000468c <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    468c:	7019           	moveq #25,d0
	sub.l d5,d5      
    468e:	9a85           	sub.l d5,d5

00004690 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    4690:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    4692:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    4694:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    4698:	9dce           	suba.l a6,a6
	move.l d2, a6
    469a:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    469c:	ddfc 0000 4564 	adda.l #17764,a6

	LSL  	#4,d2 	    //Fetch next char
    46a2:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    46a4:	2842           	movea.l d2,a4


	move.l  #0,d4
    46a6:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    46a8:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    46aa:	3814           	move.w (a4),d4
	swap	d4
    46ac:	4844           	swap d4
	lsr.l	d5, d4
    46ae:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    46b0:	8993           	or.l d4,(a3)
	clr.l	d4
    46b2:	4284           	clr.l d4
	move.w  2(a4), d4
    46b4:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    46b8:	4844           	swap d4
	lsr.l	d5, d4
    46ba:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    46bc:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    46c0:	4284           	clr.l d4
	move.w  4(a4), d4
    46c2:	382c 0004      	move.w 4(a4),d4
	swap	d4
    46c6:	4844           	swap d4
	lsr.l	d5, d4
    46c8:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    46ca:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    46ce:	4284           	clr.l d4
	move.w  6(a4), d4
    46d0:	382c 0006      	move.w 6(a4),d4
	swap	d4
    46d4:	4844           	swap d4
	lsr.l	d5, d4
    46d6:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    46d8:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    46dc:	4284           	clr.l d4
	move.w  8(a4), d4
    46de:	382c 0008      	move.w 8(a4),d4
	swap	d4
    46e2:	4844           	swap d4
	lsr.l	d5, d4
    46e4:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    46e6:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    46ea:	4284           	clr.l d4
	move.w  10(a4), d4
    46ec:	382c 000a      	move.w 10(a4),d4
	swap	d4
    46f0:	4844           	swap d4
	lsr.l	d5, d4
    46f2:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    46f4:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    46f8:	4284           	clr.l d4
	move.w  12(a4), d4
    46fa:	382c 000c      	move.w 12(a4),d4
	swap	d4
    46fe:	4844           	swap d4
	lsr.l	d5, d4
    4700:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    4702:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    4706:	4284           	clr.l d4
	move.w  14(a4), d4
    4708:	382c 000e      	move.w 14(a4),d4
	swap	d4
    470c:	4844           	swap d4
	lsr.l	d5, d4
    470e:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    4710:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    4714:	4284           	clr.l d4

	add.b   (a6), d5
    4716:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    4718:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    471c:	6500 0006      	bcs.w 4724 <noadditionalchar>
	addq.w  #1, a3
    4720:	524b           	addq.w #1,a3
	sub.w   #8,d5
    4722:	5145           	subq.w #8,d5

00004724 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    4724:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    4726:	51c8 ff68      	dbf d0,4690 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    472a:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    472e:	51cb ff5c      	dbf d3,468c <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    4732:	4cfa 7fff fdf2 	movem.l 4528 <saveregs>(pc),d0-a6

	RTS
    4738:	4e75           	rts
