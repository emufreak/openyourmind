
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
      10:	23ce 0001 6a8e 	move.l a6,16a8e <SysBase>
	hw = (struct Custom*)0xdff000;
      16:	23fc 00df f000 	move.l #14675968,16a7e <hw>
      1c:	0001 6a7e 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      20:	43f9 0001 53bc 	lea 153bc <incbin_startimage_end+0x530>,a1
      26:	7000           	moveq #0,d0
      28:	4eae fdd8      	jsr -552(a6)
      2c:	23c0 0001 6a82 	move.l d0,16a82 <GfxBase>
	if (!GfxBase)
      32:	6700 0730      	beq.w 764 <main+0x75e>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      36:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
      3c:	43f9 0001 53cd 	lea 153cd <incbin_startimage_end+0x541>,a1
      42:	7000           	moveq #0,d0
      44:	4eae fdd8      	jsr -552(a6)
      48:	23c0 0001 6a8a 	move.l d0,16a8a <DOSBase>
	if (!DOSBase)
      4e:	6700 0708      	beq.w 758 <main+0x752>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      52:	4879 0001 53d9 	pea 153d9 <incbin_startimage_end+0x54d>
      58:	4eb9 0000 0946 	jsr 946 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      5e:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
      64:	4eae ffc4      	jsr -60(a6)
      68:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
      6e:	2200           	move.l d0,d1
      70:	243c 0001 53f5 	move.l #87029,d2
      76:	760f           	moveq #15,d3
      78:	4eae ffd0      	jsr -48(a6)
	Delay(50);
      7c:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
      82:	7232           	moveq #50,d1
      84:	4eae ff3a      	jsr -198(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      88:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
      8e:	4eae ffc4      	jsr -60(a6)
      92:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
      98:	2628 0080      	move.l 128(a0),d3
      9c:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
      a2:	2200           	move.l d0,d1
      a4:	243c 0001 5405 	move.l #87045,d2
      aa:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      ae:	49f9 0000 0dde 	lea dde <ClBuild>,a4
      b4:	4e94           	jsr (a4)
      b6:	2440           	movea.l d0,a2
      b8:	23c0 0001 6a70 	move.l d0,16a70 <Copperlist1>
  DrawCopper = Copperlist1;
      be:	23c0 0001 6a68 	move.l d0,16a68 <DrawCopper>
  Copperlist2 = ClBuild();
      c4:	4e94           	jsr (a4)
      c6:	23c0 0001 6a62 	move.l d0,16a62 <Copperlist2>
  ViewCopper = Copperlist2;
      cc:	23c0 0001 6a56 	move.l d0,16a56 <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      d2:	588f           	addq.l #4,sp
      d4:	2012           	move.l (a2),d0
      d6:	b0b9 0001 66c8 	cmp.l 166c8 <ClsSprites>,d0
      dc:	6600 060c      	bne.w 6ea <main+0x6e4>
      e0:	202a 0004      	move.l 4(a2),d0
      e4:	b0b9 0001 66cc 	cmp.l 166cc <ClsSprites+0x4>,d0
      ea:	6600 05fe      	bne.w 6ea <main+0x6e4>
      ee:	202a 0008      	move.l 8(a2),d0
      f2:	b0b9 0001 66d0 	cmp.l 166d0 <ClsSprites+0x8>,d0
      f8:	6600 05f0      	bne.w 6ea <main+0x6e4>
      fc:	202a 000c      	move.l 12(a2),d0
     100:	b0b9 0001 66d4 	cmp.l 166d4 <ClsSprites+0xc>,d0
     106:	6600 05e2      	bne.w 6ea <main+0x6e4>
     10a:	202a 0010      	move.l 16(a2),d0
     10e:	b0b9 0001 66d8 	cmp.l 166d8 <ClsSprites+0x10>,d0
     114:	6600 05d4      	bne.w 6ea <main+0x6e4>
     118:	202a 0014      	move.l 20(a2),d0
     11c:	b0b9 0001 66dc 	cmp.l 166dc <ClsSprites+0x14>,d0
     122:	6600 05c6      	bne.w 6ea <main+0x6e4>
     126:	202a 0018      	move.l 24(a2),d0
     12a:	b0b9 0001 66e0 	cmp.l 166e0 <ClsSprites+0x18>,d0
     130:	6600 05b8      	bne.w 6ea <main+0x6e4>
     134:	202a 001c      	move.l 28(a2),d0
     138:	b0b9 0001 66e4 	cmp.l 166e4 <ClsSprites+0x1c>,d0
     13e:	6600 05aa      	bne.w 6ea <main+0x6e4>
     142:	202a 0020      	move.l 32(a2),d0
     146:	b0b9 0001 66e8 	cmp.l 166e8 <ClsSprites+0x20>,d0
     14c:	6600 059c      	bne.w 6ea <main+0x6e4>
     150:	202a 0024      	move.l 36(a2),d0
     154:	b0b9 0001 66ec 	cmp.l 166ec <ClsSprites+0x24>,d0
     15a:	6600 058e      	bne.w 6ea <main+0x6e4>
     15e:	202a 0028      	move.l 40(a2),d0
     162:	b0b9 0001 66f0 	cmp.l 166f0 <ClsSprites+0x28>,d0
     168:	6600 0580      	bne.w 6ea <main+0x6e4>
     16c:	202a 002c      	move.l 44(a2),d0
     170:	b0b9 0001 66f4 	cmp.l 166f4 <ClsSprites+0x2c>,d0
     176:	6600 0572      	bne.w 6ea <main+0x6e4>
     17a:	202a 0030      	move.l 48(a2),d0
     17e:	b0b9 0001 66f8 	cmp.l 166f8 <ClsSprites+0x30>,d0
     184:	6600 0564      	bne.w 6ea <main+0x6e4>
     188:	202a 0034      	move.l 52(a2),d0
     18c:	b0b9 0001 66fc 	cmp.l 166fc <ClsSprites+0x34>,d0
     192:	6600 0556      	bne.w 6ea <main+0x6e4>
     196:	202a 0038      	move.l 56(a2),d0
     19a:	b0b9 0001 6700 	cmp.l 16700 <ClsSprites+0x38>,d0
     1a0:	6600 0548      	bne.w 6ea <main+0x6e4>
     1a4:	246a 003c      	movea.l 60(a2),a2
     1a8:	b5f9 0001 6704 	cmpa.l 16704 <ClsSprites+0x3c>,a2
     1ae:	6600 053a      	bne.w 6ea <main+0x6e4>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1b2:	2079 0001 6a70 	movea.l 16a70 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1b8:	2039 0001 6698 	move.l 16698 <ClScreen>,d0
     1be:	b0a8 0040      	cmp.l 64(a0),d0
     1c2:	6600 0548      	bne.w 70c <main+0x706>
     1c6:	2039 0001 669c 	move.l 1669c <ClScreen+0x4>,d0
     1cc:	b0a8 0044      	cmp.l 68(a0),d0
     1d0:	6600 053a      	bne.w 70c <main+0x706>
     1d4:	2039 0001 66a0 	move.l 166a0 <ClScreen+0x8>,d0
     1da:	b0a8 0048      	cmp.l 72(a0),d0
     1de:	6600 052c      	bne.w 70c <main+0x706>
     1e2:	2028 004c      	move.l 76(a0),d0
     1e6:	b0b9 0001 66a4 	cmp.l 166a4 <ClScreen+0xc>,d0
     1ec:	6600 051e      	bne.w 70c <main+0x706>
     1f0:	2028 0050      	move.l 80(a0),d0
     1f4:	b0b9 0001 66a8 	cmp.l 166a8 <ClScreen+0x10>,d0
     1fa:	6600 0510      	bne.w 70c <main+0x706>
     1fe:	2028 0054      	move.l 84(a0),d0
     202:	b0b9 0001 66ac 	cmp.l 166ac <ClScreen+0x14>,d0
     208:	6600 0502      	bne.w 70c <main+0x706>
     20c:	2028 0058      	move.l 88(a0),d0
     210:	b0b9 0001 66b0 	cmp.l 166b0 <ClScreen+0x18>,d0
     216:	6600 04f4      	bne.w 70c <main+0x706>
     21a:	2028 005c      	move.l 92(a0),d0
     21e:	b0b9 0001 66b4 	cmp.l 166b4 <ClScreen+0x1c>,d0
     224:	6600 04e6      	bne.w 70c <main+0x706>
     228:	2028 0060      	move.l 96(a0),d0
     22c:	b0b9 0001 66b8 	cmp.l 166b8 <ClScreen+0x20>,d0
     232:	6600 04d8      	bne.w 70c <main+0x706>
     236:	2028 0064      	move.l 100(a0),d0
     23a:	b0b9 0001 66bc 	cmp.l 166bc <ClScreen+0x24>,d0
     240:	6600 04ca      	bne.w 70c <main+0x706>
     244:	2028 0068      	move.l 104(a0),d0
     248:	b0b9 0001 66c0 	cmp.l 166c0 <ClScreen+0x28>,d0
     24e:	6600 04bc      	bne.w 70c <main+0x706>
     252:	2068 006c      	movea.l 108(a0),a0
     256:	b1f9 0001 66c4 	cmpa.l 166c4 <ClScreen+0x2c>,a0
     25c:	6600 04ae      	bne.w 70c <main+0x706>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     260:	23fc 0004 0000 	move.l #262144,16a76 <DrawBuffer>
     266:	0001 6a76 
  ViewBuffer = (ULONG *)0x50000;
     26a:	23fc 0005 0000 	move.l #327680,16a6c <ViewBuffer>
     270:	0001 6a6c 
  
  SetBplPointers();
     274:	45f9 0000 1974 	lea 1974 <SetBplPointers>,a2
     27a:	4e92           	jsr (a2)
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     27c:	0cb9 0005 0000 	cmpi.l #327680,16a76 <DrawBuffer>
     282:	0001 6a76 
     286:	6700 059a      	beq.w 822 <main+0x81c>
    Write( Output(), 
     28a:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     290:	4eae ffc4      	jsr -60(a6)
     294:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     29a:	2200           	move.l d0,d1
     29c:	243c 0001 5408 	move.l #87048,d2
     2a2:	763b           	moveq #59,d3
     2a4:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     2a8:	2079 0001 6a70 	movea.l 16a70 <Copperlist1>,a0
     2ae:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2b4:	0070 
     2b6:	6724           	beq.s 2dc <main+0x2d6>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2b8:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     2be:	4eae ffc4      	jsr -60(a6)
     2c2:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     2c8:	2200           	move.l d0,d1
     2ca:	243c 0001 5444 	move.l #87108,d2
     2d0:	763c           	moveq #60,d3
     2d2:	4eae ffd0      	jsr -48(a6)
     2d6:	2079 0001 6a70 	movea.l 16a70 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2dc:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2e2:	0074 
     2e4:	6724           	beq.s 30a <main+0x304>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2e6:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     2ec:	4eae ffc4      	jsr -60(a6)
     2f0:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     2f6:	2200           	move.l d0,d1
     2f8:	243c 0001 5481 	move.l #87169,d2
     2fe:	763c           	moveq #60,d3
     300:	4eae ffd0      	jsr -48(a6)
     304:	2079 0001 6a70 	movea.l 16a70 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     30a:	2028 0078      	move.l 120(a0),d0
     30e:	b0b9 0001 6618 	cmp.l 16618 <ClColor>,d0
     314:	6600 053c      	bne.w 852 <main+0x84c>
     318:	2028 007c      	move.l 124(a0),d0
     31c:	b0b9 0001 661c 	cmp.l 1661c <ClColor+0x4>,d0
     322:	6600 052e      	bne.w 852 <main+0x84c>
  if( instructions[pos] == value ) 
     326:	70fe           	moveq #-2,d0
     328:	b0a8 0080      	cmp.l 128(a0),d0
     32c:	671e           	beq.s 34c <main+0x346>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     32e:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     334:	4eae ffc4      	jsr -60(a6)
     338:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     33e:	2200           	move.l d0,d1
     340:	243c 0001 54e0 	move.l #87264,d2
     346:	7622           	moveq #34,d3
     348:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     34c:	47f9 0000 194e 	lea 194e <SwapCl>,a3
     352:	4e93           	jsr (a3)
  
  if( DrawCopper != Copperlist2)
     354:	2039 0001 6a68 	move.l 16a68 <DrawCopper>,d0
     35a:	b0b9 0001 6a62 	cmp.l 16a62 <Copperlist2>,d0
     360:	671e           	beq.s 380 <main+0x37a>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     362:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     368:	4eae ffc4      	jsr -60(a6)
     36c:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     372:	2200           	move.l d0,d1
     374:	243c 0001 5503 	move.l #87299,d2
     37a:	7615           	moveq #21,d3
     37c:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild( );
     380:	4e94           	jsr (a4)
     382:	23c0 0001 6a70 	move.l d0,16a70 <Copperlist1>
  Copperlist2 = ClBuild( );
     388:	4e94           	jsr (a4)
     38a:	23c0 0001 6a62 	move.l d0,16a62 <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
     390:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     396:	203c 0000 c800 	move.l #51200,d0
     39c:	7202           	moveq #2,d1
     39e:	4eae ff3a      	jsr -198(a6)
     3a2:	23c0 0001 6a5e 	move.l d0,16a5e <Bitplane1>
  if(Bitplane1 == 0) {
     3a8:	6700 0418      	beq.w 7c2 <main+0x7bc>
  ViewBuffer = Bitplane1;
     3ac:	23c0 0001 6a6c 	move.l d0,16a6c <ViewBuffer>
  ViewCopper = Copperlist1;
     3b2:	23f9 0001 6a70 	move.l 16a70 <Copperlist1>,16a56 <ViewCopper>
     3b8:	0001 6a56 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
     3bc:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     3c2:	203c 0000 c800 	move.l #51200,d0
     3c8:	7202           	moveq #2,d1
     3ca:	4eae ff3a      	jsr -198(a6)
     3ce:	23c0 0001 6a5a 	move.l d0,16a5a <Bitplane2>
  if(Bitplane2 == 0) {
     3d4:	6700 03b8      	beq.w 78e <main+0x788>
  DrawBuffer = Bitplane2;
     3d8:	23c0 0001 6a76 	move.l d0,16a76 <DrawBuffer>
  DrawCopper = Copperlist2;
     3de:	23f9 0001 6a62 	move.l 16a62 <Copperlist2>,16a68 <DrawCopper>
     3e4:	0001 6a68 
    Write( Output(), 
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
     3e8:	2039 0001 6a6c 	move.l 16a6c <ViewBuffer>,d0
     3ee:	b0b9 0001 6a5e 	cmp.l 16a5e <Bitplane1>,d0
     3f4:	671e           	beq.s 414 <main+0x40e>
    Write( Output(), 
     3f6:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     3fc:	4eae ffc4      	jsr -60(a6)
     400:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     406:	2200           	move.l d0,d1
     408:	243c 0001 5519 	move.l #87321,d2
     40e:	7638           	moveq #56,d3
     410:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
     414:	2039 0001 6a56 	move.l 16a56 <ViewCopper>,d0
     41a:	b0b9 0001 6a70 	cmp.l 16a70 <Copperlist1>,d0
     420:	671e           	beq.s 440 <main+0x43a>
    Write( Output(), 
     422:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     428:	4eae ffc4      	jsr -60(a6)
     42c:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     432:	2200           	move.l d0,d1
     434:	243c 0001 5552 	move.l #87378,d2
     43a:	763a           	moveq #58,d3
     43c:	4eae ffd0      	jsr -48(a6)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  SetBplPointers();
     440:	4e92           	jsr (a2)
  SwapCl();
     442:	4e93           	jsr (a3)
  UWORD *copword = ViewCopper;
     444:	2079 0001 6a56 	movea.l 16a56 <ViewCopper>,a0
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     44a:	7000           	moveq #0,d0
     44c:	3028 0072      	move.w 114(a0),d0
     450:	4840           	swap d0
     452:	4240           	clr.w d0
     454:	7200           	moveq #0,d1
     456:	3228 0076      	move.w 118(a0),d1
     45a:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     45c:	b0b9 0001 6a5a 	cmp.l 16a5a <Bitplane2>,d0
     462:	671e           	beq.s 482 <main+0x47c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     464:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     46a:	4eae ffc4      	jsr -60(a6)
     46e:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     474:	2200           	move.l d0,d1
     476:	243c 0001 558d 	move.l #87437,d2
     47c:	7648           	moveq #72,d3
     47e:	4eae ffd0      	jsr -48(a6)
                                                   " after first frame.\n", 72);
  SetBplPointers();
     482:	4e92           	jsr (a2)
  SwapCl();
     484:	4e93           	jsr (a3)

  copword = (UWORD *) ViewCopper;
     486:	2079 0001 6a56 	movea.l 16a56 <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     48c:	7000           	moveq #0,d0
     48e:	3028 0072      	move.w 114(a0),d0
     492:	4840           	swap d0
     494:	4240           	clr.w d0
     496:	7200           	moveq #0,d1
     498:	3228 0076      	move.w 118(a0),d1
     49c:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     49e:	b0b9 0001 6a5e 	cmp.l 16a5e <Bitplane1>,d0
     4a4:	671e           	beq.s 4c4 <main+0x4be>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     4a6:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     4ac:	4eae ffc4      	jsr -60(a6)
     4b0:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     4b6:	2200           	move.l d0,d1
     4b8:	243c 0001 55d6 	move.l #87510,d2
     4be:	7649           	moveq #73,d3
     4c0:	4eae ffd0      	jsr -48(a6)
                                                  " after second frame.\n", 73);
  
  SetBplPointers();
     4c4:	4e92           	jsr (a2)
  SwapCl();
     4c6:	4e93           	jsr (a3)

  copword = (UWORD *) ViewCopper;
     4c8:	2079 0001 6a56 	movea.l 16a56 <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     4ce:	7000           	moveq #0,d0
     4d0:	3028 0072      	move.w 114(a0),d0
     4d4:	4840           	swap d0
     4d6:	4240           	clr.w d0
     4d8:	7200           	moveq #0,d1
     4da:	3228 0076      	move.w 118(a0),d1
     4de:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4e0:	b0b9 0001 6a5a 	cmp.l 16a5a <Bitplane2>,d0
     4e6:	671e           	beq.s 506 <main+0x500>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4e8:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     4ee:	4eae ffc4      	jsr -60(a6)
     4f2:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     4f8:	2200           	move.l d0,d1
     4fa:	243c 0001 5620 	move.l #87584,d2
     500:	7648           	moveq #72,d3
     502:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     506:	2f3c 0000 c800 	move.l #51200,-(sp)
     50c:	4878 0084      	pea 84 <main+0x7e>
     510:	4eb9 0000 19a0 	jsr 19a0 <FreeDisplay>
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    ZoomTest();
     516:	4eb9 0000 1a58 	jsr 1a58 <ZoomTest>

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
     540:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
     546:	23ee 0022 0001 	move.l 34(a6),16a44 <ActiView>
     54c:	6a44 
	OwnBlitter();
     54e:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     552:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
     558:	4eae ff1c      	jsr -228(a6)
	Disable();
     55c:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     562:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
     566:	2679 0001 6a7e 	movea.l 16a7e <hw>,a3
     56c:	302b 0010      	move.w 16(a3),d0
     570:	33c0 0001 6a48 	move.w d0,16a48 <SystemADKCON>
	SystemInts=hw->intenar;
     576:	302b 001c      	move.w 28(a3),d0
     57a:	33c0 0001 6a4c 	move.w d0,16a4c <SystemInts>
	SystemDMA=hw->dmaconr;
     580:	302b 0002      	move.w 2(a3),d0
     584:	33c0 0001 6a4a 	move.w d0,16a4a <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
     58a:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     590:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
     596:	45f9 0000 1a12 	lea 1a12 <WaitVbl>,a2
     59c:	4e92           	jsr (a2)
	WaitVbl();
     59e:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
     5a0:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
     5a6:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
     5ac:	93c9           	suba.l a1,a1
     5ae:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     5b2:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
     5b8:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     5bc:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
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
     5dc:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     5e2:	082e 0000 0129 	btst #0,297(a6)
     5e8:	6700 0290      	beq.w 87a <main+0x874>
		vbr = (APTR)Supervisor((void*)getvbr);
     5ec:	7e1e           	moveq #30,d7
     5ee:	de8f           	add.l sp,d7
     5f0:	cf8d           	exg d7,a5
     5f2:	4eae ffe2      	jsr -30(a6)
     5f6:	cf8d           	exg d7,a5

	VBR=GetVBR();
     5f8:	23c0 0001 6a4e 	move.l d0,16a4e <VBR.lto_priv.5>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     5fe:	2079 0001 6a4e 	movea.l 16a4e <VBR.lto_priv.5>,a0
     604:	2668 006c      	movea.l 108(a0),a3
	SystemIrq=GetInterruptHandler(); //store interrupt register
     608:	23cb 0001 6a52 	move.l a3,16a52 <SystemIrq>
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
     612:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
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
     638:	2279 0001 6a4e 	movea.l 16a4e <VBR.lto_priv.5>,a1
     63e:	234b 006c      	move.l a3,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
     642:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
     648:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
     64e:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
     654:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
     65a:	3039 0001 6a4c 	move.w 16a4c <SystemInts>,d0
     660:	0040 8000      	ori.w #-32768,d0
     664:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
     668:	3039 0001 6a4a 	move.w 16a4a <SystemDMA>,d0
     66e:	0040 8000      	ori.w #-32768,d0
     672:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
     676:	3039 0001 6a48 	move.w 16a48 <SystemADKCON>,d0
     67c:	0040 8000      	ori.w #-32768,d0
     680:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
     684:	2279 0001 6a44 	movea.l 16a44 <ActiView>,a1
     68a:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     68e:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
     694:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     698:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
     69e:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     6a2:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
     6a8:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     6ac:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
     6b2:	4eae fe32      	jsr -462(a6)
	Enable();
     6b6:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     6bc:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
     6c0:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     6c6:	2279 0001 6a8a 	movea.l 16a8a <DOSBase>,a1
     6cc:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     6d0:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     6d6:	2279 0001 6a82 	movea.l 16a82 <GfxBase>,a1
     6dc:	4eae fe62      	jsr -414(a6)
}
     6e0:	7000           	moveq #0,d0
     6e2:	4cdf 5c8c      	movem.l (sp)+,d2-d3/d7/a2-a4/a6
     6e6:	508f           	addq.l #8,sp
     6e8:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     6ea:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     6f0:	4eae ffc4      	jsr -60(a6)
     6f4:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     6fa:	2200           	move.l d0,d1
     6fc:	243c 0001 56a0 	move.l #87712,d2
     702:	762c           	moveq #44,d3
     704:	4eae ffd0      	jsr -48(a6)
     708:	6000 faa8      	bra.w 1b2 <main+0x1ac>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
     70c:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     712:	4eae ffc4      	jsr -60(a6)
     716:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     71c:	2200           	move.l d0,d1
     71e:	243c 0001 5669 	move.l #87657,d2
     724:	7636           	moveq #54,d3
     726:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
     72a:	23fc 0004 0000 	move.l #262144,16a76 <DrawBuffer>
     730:	0001 6a76 
  ViewBuffer = (ULONG *)0x50000;
     734:	23fc 0005 0000 	move.l #327680,16a6c <ViewBuffer>
     73a:	0001 6a6c 
  SetBplPointers();
     73e:	45f9 0000 1974 	lea 1974 <SetBplPointers>,a2
     744:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     746:	0cb9 0005 0000 	cmpi.l #327680,16a76 <DrawBuffer>
     74c:	0001 6a76 
     750:	6600 fb38      	bne.w 28a <main+0x284>
     754:	6000 00cc      	bra.w 822 <main+0x81c>
		Exit(0);
     758:	9dce           	suba.l a6,a6
     75a:	7200           	moveq #0,d1
     75c:	4eae ff70      	jsr -144(a6)
     760:	6000 f8f0      	bra.w 52 <main+0x4c>
		Exit(0);
     764:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     76a:	7200           	moveq #0,d1
     76c:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     770:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     776:	43f9 0001 53cd 	lea 153cd <incbin_startimage_end+0x541>,a1
     77c:	7000           	moveq #0,d0
     77e:	4eae fdd8      	jsr -552(a6)
     782:	23c0 0001 6a8a 	move.l d0,16a8a <DOSBase>
	if (!DOSBase)
     788:	6600 f8c8      	bne.w 52 <main+0x4c>
     78c:	60ca           	bra.s 758 <main+0x752>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     78e:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     794:	4eae ffc4      	jsr -60(a6)
     798:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     79e:	2200           	move.l d0,d1
     7a0:	243c 0001 4f78 	move.l #85880,d2
     7a6:	7626           	moveq #38,d3
     7a8:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     7ac:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     7b2:	7201           	moveq #1,d1
     7b4:	4eae ff70      	jsr -144(a6)
     7b8:	2039 0001 6a5a 	move.l 16a5a <Bitplane2>,d0
     7be:	6000 fc18      	bra.w 3d8 <main+0x3d2>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     7c2:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     7c8:	4eae ffc4      	jsr -60(a6)
     7cc:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     7d2:	2200           	move.l d0,d1
     7d4:	243c 0001 4f51 	move.l #85841,d2
     7da:	7626           	moveq #38,d3
     7dc:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     7e0:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     7e6:	7201           	moveq #1,d1
     7e8:	4eae ff70      	jsr -144(a6)
     7ec:	2039 0001 6a5e 	move.l 16a5e <Bitplane1>,d0
  ViewBuffer = Bitplane1;
     7f2:	23c0 0001 6a6c 	move.l d0,16a6c <ViewBuffer>
  ViewCopper = Copperlist1;
     7f8:	23f9 0001 6a70 	move.l 16a70 <Copperlist1>,16a56 <ViewCopper>
     7fe:	0001 6a56 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
     802:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     808:	203c 0000 c800 	move.l #51200,d0
     80e:	7202           	moveq #2,d1
     810:	4eae ff3a      	jsr -198(a6)
     814:	23c0 0001 6a5a 	move.l d0,16a5a <Bitplane2>
  if(Bitplane2 == 0) {
     81a:	6600 fbbc      	bne.w 3d8 <main+0x3d2>
     81e:	6000 ff6e      	bra.w 78e <main+0x788>
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     822:	0cb9 0004 0000 	cmpi.l #262144,16a6c <ViewBuffer>
     828:	0001 6a6c 
     82c:	6700 fa7a      	beq.w 2a8 <main+0x2a2>
    Write( Output(), 
     830:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     836:	4eae ffc4      	jsr -60(a6)
     83a:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     840:	2200           	move.l d0,d1
     842:	243c 0001 5408 	move.l #87048,d2
     848:	763b           	moveq #59,d3
     84a:	4eae ffd0      	jsr -48(a6)
     84e:	6000 fa58      	bra.w 2a8 <main+0x2a2>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     852:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     858:	4eae ffc4      	jsr -60(a6)
     85c:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     862:	2200           	move.l d0,d1
     864:	243c 0001 54be 	move.l #87230,d2
     86a:	7621           	moveq #33,d3
     86c:	4eae ffd0      	jsr -48(a6)
     870:	2079 0001 6a70 	movea.l 16a70 <Copperlist1>,a0
     876:	6000 faae      	bra.w 326 <main+0x320>
	APTR vbr = 0;
     87a:	7000           	moveq #0,d0
	VBR=GetVBR();
     87c:	23c0 0001 6a4e 	move.l d0,16a4e <VBR.lto_priv.5>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     882:	2079 0001 6a4e 	movea.l 16a4e <VBR.lto_priv.5>,a0
     888:	2668 006c      	movea.l 108(a0),a3
	SystemIrq=GetInterruptHandler(); //store interrupt register
     88c:	23cb 0001 6a52 	move.l a3,16a52 <SystemIrq>
	WaitVbl();
     892:	4e92           	jsr (a2)
	WaitVbl();
     894:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     896:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
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
     8ba:	4879 0001 4ec0 	pea 14ec0 <incbin_startimage_end+0x34>
     8c0:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffd8215>
     8c4:	4878 0052      	pea 52 <main+0x4c>
     8c8:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee8176>
     8ce:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     8d2:	203c 0001 4ea6 	move.l #85670,d0
     8d8:	4878 0001      	pea 1 <_start+0x1>
     8dc:	2f02           	move.l d2,-(sp)
     8de:	42a7           	clr.l -(sp)
     8e0:	2f00           	move.l d0,-(sp)
     8e2:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffd8215>
     8e6:	4878 0052      	pea 52 <main+0x4c>
     8ea:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee8176>
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
     906:	4879 0001 4eca 	pea 14eca <incbin_startimage_end+0x3e>
     90c:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffd8215>
     910:	4878 0052      	pea 52 <main+0x4c>
     914:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee8176>
     91a:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     91e:	203c 0001 4e8d 	move.l #85645,d0
     924:	4878 0001      	pea 1 <_start+0x1>
     928:	2f02           	move.l d2,-(sp)
     92a:	42a7           	clr.l -(sp)
     92c:	2f00           	move.l d0,-(sp)
     92e:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffd8215>
     932:	4878 0052      	pea 52 <main+0x4c>
     936:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee8176>
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
     94e:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xee8176>
     954:	6734           	beq.s 98a <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
     956:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     95c:	206f 0090      	movea.l 144(sp),a0
     960:	43ef 0094      	lea 148(sp),a1
     964:	45f9 0000 47c4 	lea 47c4 <PutChar>,a2
     96a:	47ef 000c      	lea 12(sp),a3
     96e:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
     972:	2f0b           	move.l a3,-(sp)
     974:	4878 0056      	pea 56 <main+0x50>
     978:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee8176>
     97e:	508f           	addq.l #8,sp
}
     980:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     984:	4fef 0080      	lea 128(sp),sp
     988:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
     98a:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     990:	206f 0090      	movea.l 144(sp),a0
     994:	43ef 0094      	lea 148(sp),a1
     998:	45f9 0000 47b6 	lea 47b6 <KPutCharX>,a2
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
     9cc:	4eba 3c08      	jsr 45d6 <memset>(pc)
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
     9e4:	2e3c 0001 4ed5 	move.l #85717,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
     9ea:	301c           	move.w (a4)+,d0
     9ec:	bd40           	eor.w d6,d0
     9ee:	b05d           	cmp.w (a5)+,d0
     9f0:	6736           	beq.s a28 <TestRow+0x7a>
      data[0] = i;
     9f2:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
     9f6:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     9fc:	2047           	movea.l d7,a0
     9fe:	43ef 0030      	lea 48(sp),a1
     a02:	45f9 0000 47c4 	lea 47c4 <PutChar>,a2
     a08:	2645           	movea.l d5,a3
     a0a:	4eae fdf6      	jsr -522(a6)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
     a0e:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     a14:	4eae ffc4      	jsr -60(a6)
     a18:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
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
     a5e:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     a64:	41f9 0001 4ed5 	lea 14ed5 <incbin_startimage_end+0x49>,a0
     a6a:	43ef 0030      	lea 48(sp),a1
     a6e:	45f9 0000 47c4 	lea 47c4 <PutChar>,a2
     a74:	47ef 0034      	lea 52(sp),a3
     a78:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
     a7c:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     a82:	4eae ffc4      	jsr -60(a6)
     a86:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
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
     aac:	4879 0001 4f05 	pea 14f05 <incbin_startimage_end+0x79>
     ab2:	4eba fe92      	jsr 946 <KPrintF>(pc)
     ab6:	4fef 000c      	lea 12(sp),sp
}
     aba:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
     abe:	4fef 006c      	lea 108(sp),sp
     ac2:	4e75           	rts

00000ac4 <Vblankcounter>:
  Counter4Frames++;
     ac4:	52b9 0001 6a86 	addq.l #1,16a86 <Counter4Frames>
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

00000aea <TestZoom102Batch>:
int TestZoom102Batch( ULONG *cl2test, UWORD position) {
     aea:	48e7 2030      	movem.l d2/a2-a3,-(sp)
     aee:	242f 0010      	move.l 16(sp),d2
  for( int i=0;i<12;i++)
     af2:	7000           	moveq #0,d0
     af4:	302f 0016      	move.w 22(sp),d0
     af8:	2640           	movea.l d0,a3
    if( TestCopperlistPos( cl2test, i+position, 0x1020099) == 0)
     afa:	2f3c 0102 0099 	move.l #16908441,-(sp)
     b00:	2f0b           	move.l a3,-(sp)
     b02:	2f02           	move.l d2,-(sp)
     b04:	45fa ffc6      	lea acc <TestCopperlistPos>(pc),a2
     b08:	4e92           	jsr (a2)
     b0a:	4fef 000c      	lea 12(sp),sp
     b0e:	4a80           	tst.l d0
     b10:	6700 029c      	beq.w dae <TestZoom102Batch+0x2c4>
     b14:	2f3c 0102 0099 	move.l #16908441,-(sp)
     b1a:	486b 0001      	pea 1(a3)
     b1e:	2f02           	move.l d2,-(sp)
     b20:	4e92           	jsr (a2)
     b22:	4fef 000c      	lea 12(sp),sp
     b26:	4a80           	tst.l d0
     b28:	6700 0284      	beq.w dae <TestZoom102Batch+0x2c4>
     b2c:	2f3c 0102 0099 	move.l #16908441,-(sp)
     b32:	486b 0002      	pea 2(a3)
     b36:	2f02           	move.l d2,-(sp)
     b38:	4e92           	jsr (a2)
     b3a:	4fef 000c      	lea 12(sp),sp
     b3e:	4a80           	tst.l d0
     b40:	6700 026c      	beq.w dae <TestZoom102Batch+0x2c4>
     b44:	2f3c 0102 0099 	move.l #16908441,-(sp)
     b4a:	486b 0003      	pea 3(a3)
     b4e:	2f02           	move.l d2,-(sp)
     b50:	4e92           	jsr (a2)
     b52:	4fef 000c      	lea 12(sp),sp
     b56:	4a80           	tst.l d0
     b58:	6700 0254      	beq.w dae <TestZoom102Batch+0x2c4>
     b5c:	2f3c 0102 0099 	move.l #16908441,-(sp)
     b62:	486b 0004      	pea 4(a3)
     b66:	2f02           	move.l d2,-(sp)
     b68:	4e92           	jsr (a2)
     b6a:	4fef 000c      	lea 12(sp),sp
     b6e:	4a80           	tst.l d0
     b70:	6700 023c      	beq.w dae <TestZoom102Batch+0x2c4>
     b74:	2f3c 0102 0099 	move.l #16908441,-(sp)
     b7a:	486b 0005      	pea 5(a3)
     b7e:	2f02           	move.l d2,-(sp)
     b80:	4e92           	jsr (a2)
     b82:	4fef 000c      	lea 12(sp),sp
     b86:	4a80           	tst.l d0
     b88:	6700 0224      	beq.w dae <TestZoom102Batch+0x2c4>
     b8c:	2f3c 0102 0099 	move.l #16908441,-(sp)
     b92:	486b 0006      	pea 6(a3)
     b96:	2f02           	move.l d2,-(sp)
     b98:	4e92           	jsr (a2)
     b9a:	4fef 000c      	lea 12(sp),sp
     b9e:	4a80           	tst.l d0
     ba0:	6700 020c      	beq.w dae <TestZoom102Batch+0x2c4>
     ba4:	2f3c 0102 0099 	move.l #16908441,-(sp)
     baa:	486b 0007      	pea 7(a3)
     bae:	2f02           	move.l d2,-(sp)
     bb0:	4e92           	jsr (a2)
     bb2:	4fef 000c      	lea 12(sp),sp
     bb6:	4a80           	tst.l d0
     bb8:	6700 01f4      	beq.w dae <TestZoom102Batch+0x2c4>
     bbc:	2f3c 0102 0099 	move.l #16908441,-(sp)
     bc2:	486b 0008      	pea 8(a3)
     bc6:	2f02           	move.l d2,-(sp)
     bc8:	4e92           	jsr (a2)
     bca:	4fef 000c      	lea 12(sp),sp
     bce:	4a80           	tst.l d0
     bd0:	6700 01dc      	beq.w dae <TestZoom102Batch+0x2c4>
     bd4:	2f3c 0102 0099 	move.l #16908441,-(sp)
     bda:	486b 0009      	pea 9(a3)
     bde:	2f02           	move.l d2,-(sp)
     be0:	4e92           	jsr (a2)
     be2:	4fef 000c      	lea 12(sp),sp
     be6:	4a80           	tst.l d0
     be8:	6700 01c4      	beq.w dae <TestZoom102Batch+0x2c4>
     bec:	2f3c 0102 0099 	move.l #16908441,-(sp)
     bf2:	486b 000a      	pea 10(a3)
     bf6:	2f02           	move.l d2,-(sp)
     bf8:	4e92           	jsr (a2)
     bfa:	4fef 000c      	lea 12(sp),sp
     bfe:	4a80           	tst.l d0
     c00:	6700 01ac      	beq.w dae <TestZoom102Batch+0x2c4>
     c04:	2f3c 0102 0099 	move.l #16908441,-(sp)
     c0a:	486b 000b      	pea 11(a3)
     c0e:	2f02           	move.l d2,-(sp)
     c10:	4e92           	jsr (a2)
     c12:	4fef 000c      	lea 12(sp),sp
     c16:	4a80           	tst.l d0
     c18:	6700 0194      	beq.w dae <TestZoom102Batch+0x2c4>
    if( TestCopperlistPos( cl2test, 12+i+position, 0x1020088) == 0)
     c1c:	2f3c 0102 0088 	move.l #16908424,-(sp)
     c22:	486b 000c      	pea 12(a3)
     c26:	2f02           	move.l d2,-(sp)
     c28:	4e92           	jsr (a2)
     c2a:	4fef 000c      	lea 12(sp),sp
     c2e:	4a80           	tst.l d0
     c30:	6700 017c      	beq.w dae <TestZoom102Batch+0x2c4>
     c34:	2f3c 0102 0088 	move.l #16908424,-(sp)
     c3a:	486b 000d      	pea 13(a3)
     c3e:	2f02           	move.l d2,-(sp)
     c40:	4e92           	jsr (a2)
     c42:	4fef 000c      	lea 12(sp),sp
     c46:	4a80           	tst.l d0
     c48:	6700 0164      	beq.w dae <TestZoom102Batch+0x2c4>
    if( TestCopperlistPos( cl2test, 14+i+position, 0x1020077) == 0)
     c4c:	2f3c 0102 0077 	move.l #16908407,-(sp)
     c52:	486b 000e      	pea 14(a3)
     c56:	2f02           	move.l d2,-(sp)
     c58:	4e92           	jsr (a2)
     c5a:	4fef 000c      	lea 12(sp),sp
     c5e:	4a80           	tst.l d0
     c60:	6700 014c      	beq.w dae <TestZoom102Batch+0x2c4>
     c64:	2f3c 0102 0077 	move.l #16908407,-(sp)
     c6a:	486b 000f      	pea 15(a3)
     c6e:	2f02           	move.l d2,-(sp)
     c70:	4e92           	jsr (a2)
     c72:	4fef 000c      	lea 12(sp),sp
     c76:	4a80           	tst.l d0
     c78:	6700 0134      	beq.w dae <TestZoom102Batch+0x2c4>
    if( TestCopperlistPos( cl2test, 16+i+position, 0x1020066) == 0)
     c7c:	2f3c 0102 0066 	move.l #16908390,-(sp)
     c82:	486b 0010      	pea 16(a3)
     c86:	2f02           	move.l d2,-(sp)
     c88:	4e92           	jsr (a2)
     c8a:	4fef 000c      	lea 12(sp),sp
     c8e:	4a80           	tst.l d0
     c90:	6700 011c      	beq.w dae <TestZoom102Batch+0x2c4>
     c94:	2f3c 0102 0066 	move.l #16908390,-(sp)
     c9a:	486b 0011      	pea 17(a3)
     c9e:	2f02           	move.l d2,-(sp)
     ca0:	4e92           	jsr (a2)
     ca2:	4fef 000c      	lea 12(sp),sp
     ca6:	4a80           	tst.l d0
     ca8:	6700 0104      	beq.w dae <TestZoom102Batch+0x2c4>
    if( TestCopperlistPos( cl2test, 18+i+position, 0x1020055) == 0)
     cac:	2f3c 0102 0055 	move.l #16908373,-(sp)
     cb2:	486b 0012      	pea 18(a3)
     cb6:	2f02           	move.l d2,-(sp)
     cb8:	4e92           	jsr (a2)
     cba:	4fef 000c      	lea 12(sp),sp
     cbe:	4a80           	tst.l d0
     cc0:	6700 00ec      	beq.w dae <TestZoom102Batch+0x2c4>
     cc4:	2f3c 0102 0055 	move.l #16908373,-(sp)
     cca:	486b 0013      	pea 19(a3)
     cce:	2f02           	move.l d2,-(sp)
     cd0:	4e92           	jsr (a2)
     cd2:	4fef 000c      	lea 12(sp),sp
     cd6:	4a80           	tst.l d0
     cd8:	6700 00d4      	beq.w dae <TestZoom102Batch+0x2c4>
     cdc:	2f3c 0102 0055 	move.l #16908373,-(sp)
     ce2:	486b 0014      	pea 20(a3)
     ce6:	2f02           	move.l d2,-(sp)
     ce8:	4e92           	jsr (a2)
     cea:	4fef 000c      	lea 12(sp),sp
     cee:	4a80           	tst.l d0
     cf0:	6700 00bc      	beq.w dae <TestZoom102Batch+0x2c4>
     cf4:	2f3c 0102 0055 	move.l #16908373,-(sp)
     cfa:	486b 0015      	pea 21(a3)
     cfe:	2f02           	move.l d2,-(sp)
     d00:	4e92           	jsr (a2)
     d02:	4fef 000c      	lea 12(sp),sp
     d06:	4a80           	tst.l d0
     d08:	6700 00a4      	beq.w dae <TestZoom102Batch+0x2c4>
     d0c:	2f3c 0102 0055 	move.l #16908373,-(sp)
     d12:	486b 0016      	pea 22(a3)
     d16:	2f02           	move.l d2,-(sp)
     d18:	4e92           	jsr (a2)
     d1a:	4fef 000c      	lea 12(sp),sp
     d1e:	4a80           	tst.l d0
     d20:	6700 008c      	beq.w dae <TestZoom102Batch+0x2c4>
     d24:	2f3c 0102 0055 	move.l #16908373,-(sp)
     d2a:	486b 0017      	pea 23(a3)
     d2e:	2f02           	move.l d2,-(sp)
     d30:	4e92           	jsr (a2)
     d32:	4fef 000c      	lea 12(sp),sp
     d36:	4a80           	tst.l d0
     d38:	6774           	beq.s dae <TestZoom102Batch+0x2c4>
     d3a:	2f3c 0102 0055 	move.l #16908373,-(sp)
     d40:	486b 0018      	pea 24(a3)
     d44:	2f02           	move.l d2,-(sp)
     d46:	4e92           	jsr (a2)
     d48:	4fef 000c      	lea 12(sp),sp
     d4c:	4a80           	tst.l d0
     d4e:	675e           	beq.s dae <TestZoom102Batch+0x2c4>
     d50:	2f3c 0102 0055 	move.l #16908373,-(sp)
     d56:	486b 0019      	pea 25(a3)
     d5a:	2f02           	move.l d2,-(sp)
     d5c:	4e92           	jsr (a2)
     d5e:	4fef 000c      	lea 12(sp),sp
     d62:	4a80           	tst.l d0
     d64:	6748           	beq.s dae <TestZoom102Batch+0x2c4>
     d66:	2f3c 0102 0055 	move.l #16908373,-(sp)
     d6c:	486b 001a      	pea 26(a3)
     d70:	2f02           	move.l d2,-(sp)
     d72:	4e92           	jsr (a2)
     d74:	4fef 000c      	lea 12(sp),sp
     d78:	4a80           	tst.l d0
     d7a:	6732           	beq.s dae <TestZoom102Batch+0x2c4>
     d7c:	2f3c 0102 0055 	move.l #16908373,-(sp)
     d82:	486b 001b      	pea 27(a3)
     d86:	2f02           	move.l d2,-(sp)
     d88:	4e92           	jsr (a2)
     d8a:	4fef 000c      	lea 12(sp),sp
     d8e:	4a80           	tst.l d0
     d90:	671c           	beq.s dae <TestZoom102Batch+0x2c4>
     d92:	2f3c 0102 0055 	move.l #16908373,-(sp)
     d98:	486b 001c      	pea 28(a3)
     d9c:	2f02           	move.l d2,-(sp)
     d9e:	4e92           	jsr (a2)
     da0:	4fef 000c      	lea 12(sp),sp
     da4:	4a80           	tst.l d0
     da6:	56c0           	sne d0
     da8:	4880           	ext.w d0
     daa:	48c0           	ext.l d0
     dac:	4480           	neg.l d0
}
     dae:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
     db2:	4e75           	rts

00000db4 <TestCopperlistBatch>:
  for( int i=0;i<length;i++)
     db4:	226f 0008      	movea.l 8(sp),a1
     db8:	d3c9           	adda.l a1,a1
     dba:	d3c9           	adda.l a1,a1
     dbc:	d3ef 0004      	adda.l 4(sp),a1
     dc0:	206f 000c      	movea.l 12(sp),a0
     dc4:	202f 0010      	move.l 16(sp),d0
     dc8:	d080           	add.l d0,d0
     dca:	d080           	add.l d0,d0
     dcc:	d088           	add.l a0,d0
    if( instructions[ pos+i] != batch[ i])
     dce:	b388           	cmpm.l (a0)+,(a1)+
     dd0:	6608           	bne.s dda <TestCopperlistBatch+0x26>
  for( int i=0;i<length;i++)
     dd2:	b1c0           	cmpa.l d0,a0
     dd4:	66f8           	bne.s dce <TestCopperlistBatch+0x1a>
  return 1;
     dd6:	7001           	moveq #1,d0
}
     dd8:	4e75           	rts
      return 0;
     dda:	7000           	moveq #0,d0
}
     ddc:	4e75           	rts

00000dde <ClBuild>:
ULONG * ClBuild() {
     dde:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
     de2:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     de8:	707b           	moveq #123,d0
     dea:	4600           	not.b d0
     dec:	7202           	moveq #2,d1
     dee:	4eae ff3a      	jsr -198(a6)
     df2:	2440           	movea.l d0,a2
  if( retval == 0) {
     df4:	4a80           	tst.l d0
     df6:	6700 010e      	beq.w f06 <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
     dfa:	24b9 0001 66c8 	move.l 166c8 <ClsSprites>,(a2)
     e00:	2579 0001 66cc 	move.l 166cc <ClsSprites+0x4>,4(a2)
     e06:	0004 
     e08:	2579 0001 66d0 	move.l 166d0 <ClsSprites+0x8>,8(a2)
     e0e:	0008 
     e10:	2579 0001 66d4 	move.l 166d4 <ClsSprites+0xc>,12(a2)
     e16:	000c 
     e18:	2579 0001 66d8 	move.l 166d8 <ClsSprites+0x10>,16(a2)
     e1e:	0010 
     e20:	2579 0001 66dc 	move.l 166dc <ClsSprites+0x14>,20(a2)
     e26:	0014 
     e28:	2579 0001 66e0 	move.l 166e0 <ClsSprites+0x18>,24(a2)
     e2e:	0018 
     e30:	2579 0001 66e4 	move.l 166e4 <ClsSprites+0x1c>,28(a2)
     e36:	001c 
     e38:	2579 0001 66e8 	move.l 166e8 <ClsSprites+0x20>,32(a2)
     e3e:	0020 
     e40:	2579 0001 66ec 	move.l 166ec <ClsSprites+0x24>,36(a2)
     e46:	0024 
     e48:	2579 0001 66f0 	move.l 166f0 <ClsSprites+0x28>,40(a2)
     e4e:	0028 
     e50:	2579 0001 66f4 	move.l 166f4 <ClsSprites+0x2c>,44(a2)
     e56:	002c 
     e58:	2579 0001 66f8 	move.l 166f8 <ClsSprites+0x30>,48(a2)
     e5e:	0030 
     e60:	2579 0001 66fc 	move.l 166fc <ClsSprites+0x34>,52(a2)
     e66:	0034 
     e68:	2579 0001 6700 	move.l 16700 <ClsSprites+0x38>,56(a2)
     e6e:	0038 
     e70:	2579 0001 6704 	move.l 16704 <ClsSprites+0x3c>,60(a2)
     e76:	003c 
    *cl++ = *clpartinstruction++;
     e78:	2579 0001 6698 	move.l 16698 <ClScreen>,64(a2)
     e7e:	0040 
     e80:	2579 0001 669c 	move.l 1669c <ClScreen+0x4>,68(a2)
     e86:	0044 
     e88:	2579 0001 66a0 	move.l 166a0 <ClScreen+0x8>,72(a2)
     e8e:	0048 
     e90:	2579 0001 66a4 	move.l 166a4 <ClScreen+0xc>,76(a2)
     e96:	004c 
     e98:	2579 0001 66a8 	move.l 166a8 <ClScreen+0x10>,80(a2)
     e9e:	0050 
     ea0:	2579 0001 66ac 	move.l 166ac <ClScreen+0x14>,84(a2)
     ea6:	0054 
     ea8:	2579 0001 66b0 	move.l 166b0 <ClScreen+0x18>,88(a2)
     eae:	0058 
     eb0:	2579 0001 66b4 	move.l 166b4 <ClScreen+0x1c>,92(a2)
     eb6:	005c 
     eb8:	2579 0001 66b8 	move.l 166b8 <ClScreen+0x20>,96(a2)
     ebe:	0060 
     ec0:	2579 0001 66bc 	move.l 166bc <ClScreen+0x24>,100(a2)
     ec6:	0064 
     ec8:	2579 0001 66c0 	move.l 166c0 <ClScreen+0x28>,104(a2)
     ece:	0068 
     ed0:	2579 0001 66c4 	move.l 166c4 <ClScreen+0x2c>,108(a2)
     ed6:	006c 
  *cl++ = 0x00e00000;
     ed8:	257c 00e0 0000 	move.l #14680064,112(a2)
     ede:	0070 
  *cl++ = 0x00e20000;
     ee0:	257c 00e2 0000 	move.l #14811136,116(a2)
     ee6:	0074 
    *cl++ = *clpartinstruction++;
     ee8:	2579 0001 6618 	move.l 16618 <ClColor>,120(a2)
     eee:	0078 
     ef0:	2579 0001 661c 	move.l 1661c <ClColor+0x4>,124(a2)
     ef6:	007c 
  *cl = 0xfffffffe;
     ef8:	70fe           	moveq #-2,d0
     efa:	2540 0080      	move.l d0,128(a2)
}
     efe:	200a           	move.l a2,d0
     f00:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     f04:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     f06:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     f0c:	4eae ffc4      	jsr -60(a6)
     f10:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     f16:	2200           	move.l d0,d1
     f18:	243c 0001 4f2b 	move.l #85803,d2
     f1e:	7628           	moveq #40,d3
     f20:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     f24:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     f2a:	7201           	moveq #1,d1
     f2c:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
     f30:	24b9 0001 66c8 	move.l 166c8 <ClsSprites>,(a2)
     f36:	2579 0001 66cc 	move.l 166cc <ClsSprites+0x4>,4(a2)
     f3c:	0004 
     f3e:	2579 0001 66d0 	move.l 166d0 <ClsSprites+0x8>,8(a2)
     f44:	0008 
     f46:	2579 0001 66d4 	move.l 166d4 <ClsSprites+0xc>,12(a2)
     f4c:	000c 
     f4e:	2579 0001 66d8 	move.l 166d8 <ClsSprites+0x10>,16(a2)
     f54:	0010 
     f56:	2579 0001 66dc 	move.l 166dc <ClsSprites+0x14>,20(a2)
     f5c:	0014 
     f5e:	2579 0001 66e0 	move.l 166e0 <ClsSprites+0x18>,24(a2)
     f64:	0018 
     f66:	2579 0001 66e4 	move.l 166e4 <ClsSprites+0x1c>,28(a2)
     f6c:	001c 
     f6e:	2579 0001 66e8 	move.l 166e8 <ClsSprites+0x20>,32(a2)
     f74:	0020 
     f76:	2579 0001 66ec 	move.l 166ec <ClsSprites+0x24>,36(a2)
     f7c:	0024 
     f7e:	2579 0001 66f0 	move.l 166f0 <ClsSprites+0x28>,40(a2)
     f84:	0028 
     f86:	2579 0001 66f4 	move.l 166f4 <ClsSprites+0x2c>,44(a2)
     f8c:	002c 
     f8e:	2579 0001 66f8 	move.l 166f8 <ClsSprites+0x30>,48(a2)
     f94:	0030 
     f96:	2579 0001 66fc 	move.l 166fc <ClsSprites+0x34>,52(a2)
     f9c:	0034 
     f9e:	2579 0001 6700 	move.l 16700 <ClsSprites+0x38>,56(a2)
     fa4:	0038 
     fa6:	2579 0001 6704 	move.l 16704 <ClsSprites+0x3c>,60(a2)
     fac:	003c 
    *cl++ = *clpartinstruction++;
     fae:	2579 0001 6698 	move.l 16698 <ClScreen>,64(a2)
     fb4:	0040 
     fb6:	2579 0001 669c 	move.l 1669c <ClScreen+0x4>,68(a2)
     fbc:	0044 
     fbe:	2579 0001 66a0 	move.l 166a0 <ClScreen+0x8>,72(a2)
     fc4:	0048 
     fc6:	2579 0001 66a4 	move.l 166a4 <ClScreen+0xc>,76(a2)
     fcc:	004c 
     fce:	2579 0001 66a8 	move.l 166a8 <ClScreen+0x10>,80(a2)
     fd4:	0050 
     fd6:	2579 0001 66ac 	move.l 166ac <ClScreen+0x14>,84(a2)
     fdc:	0054 
     fde:	2579 0001 66b0 	move.l 166b0 <ClScreen+0x18>,88(a2)
     fe4:	0058 
     fe6:	2579 0001 66b4 	move.l 166b4 <ClScreen+0x1c>,92(a2)
     fec:	005c 
     fee:	2579 0001 66b8 	move.l 166b8 <ClScreen+0x20>,96(a2)
     ff4:	0060 
     ff6:	2579 0001 66bc 	move.l 166bc <ClScreen+0x24>,100(a2)
     ffc:	0064 
     ffe:	2579 0001 66c0 	move.l 166c0 <ClScreen+0x28>,104(a2)
    1004:	0068 
    1006:	2579 0001 66c4 	move.l 166c4 <ClScreen+0x2c>,108(a2)
    100c:	006c 
  *cl++ = 0x00e00000;
    100e:	257c 00e0 0000 	move.l #14680064,112(a2)
    1014:	0070 
  *cl++ = 0x00e20000;
    1016:	257c 00e2 0000 	move.l #14811136,116(a2)
    101c:	0074 
    *cl++ = *clpartinstruction++;
    101e:	2579 0001 6618 	move.l 16618 <ClColor>,120(a2)
    1024:	0078 
    1026:	2579 0001 661c 	move.l 1661c <ClColor+0x4>,124(a2)
    102c:	007c 
  *cl = 0xfffffffe;
    102e:	70fe           	moveq #-2,d0
    1030:	2540 0080      	move.l d0,128(a2)
}
    1034:	200a           	move.l a2,d0
    1036:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    103a:	4e75           	rts

0000103c <WaitBlt>:
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    103c:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
    1042:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    1046:	3028 0002      	move.w 2(a0),d0
    104a:	0800 000e      	btst #14,d0
    104e:	66f6           	bne.s 1046 <WaitBlt+0xa>
}
    1050:	4e75           	rts

00001052 <Zoom_ZoomIntoPicture>:
  hw->bltcon0 = 0x9f0 + shiftright;
  hw->bltcon1 = 0;
}

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
    1052:	4fef ffe0      	lea -32(sp),sp
    1056:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    105a:	282f 0058      	move.l 88(sp),d4
    105e:	262f 005c      	move.l 92(sp),d3
    1062:	3404           	move.w d4,d2
  WaitBlit();
    1064:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    106a:	4eae ff1c      	jsr -228(a6)
  hw->bltafwm = 0xffff;
    106e:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
    1074:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    107a:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    1080:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    1086:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    108c:	317c 002c 0066 	move.w #44,102(a0)
  Init_Blit();
  WORD shiftright = 9;
  UWORD shifthoriz = 7;
  UWORD startofword = 21*16;
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
    1092:	3044           	movea.w d4,a0
    1094:	d0c4           	adda.w d4,a0
    1096:	3208           	move.w a0,d1
    1098:	d248           	add.w a0,d1
    109a:	d244           	add.w d4,d1
    109c:	3001           	move.w d1,d0
    109e:	d041           	add.w d1,d0
    10a0:	0640 014c      	addi.w #332,d0
    10a4:	3f40 0040      	move.w d0,64(sp)
  WORD shiftright = 9;
    10a8:	3f7c 0009 0032 	move.w #9,50(sp)
  while( nextzoom > 22 * 16) {
    10ae:	0c40 0160      	cmpi.w #352,d0
    10b2:	631a           	bls.s 10ce <Zoom_ZoomIntoPicture+0x7c>
  WORD shiftright = 9;
    10b4:	327c 0009      	movea.w #9,a1
    nextzoom -= (19 + zoomnr);
    10b8:	0640 ffed      	addi.w #-19,d0
    10bc:	9042           	sub.w d2,d0
    shiftright--;
    10be:	5349           	subq.w #1,a1
  while( nextzoom > 22 * 16) {
    10c0:	0c40 0160      	cmpi.w #352,d0
    10c4:	62f2           	bhi.s 10b8 <Zoom_ZoomIntoPicture+0x66>
    10c6:	3f49 0032      	move.w a1,50(sp)
    10ca:	3f40 0040      	move.w d0,64(sp)
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
    10ce:	7012           	moveq #18,d0
    10d0:	9041           	sub.w d1,d0
    10d2:	3f40 0048      	move.w d0,72(sp)
  while( ZoomHorizontalStart < 0) {
    10d6:	6c00 0346      	bge.w 141e <Zoom_ZoomIntoPicture+0x3cc>
    10da:	3200           	move.w d0,d1
  UWORD shifthoriz = 7;
    10dc:	7007           	moveq #7,d0
      ZoomHorizontalStart += 1 + 18 + zoomnr;
    10de:	0641 0013      	addi.w #19,d1
    10e2:	d242           	add.w d2,d1
      shifthoriz--;
    10e4:	5340           	subq.w #1,d0
  while( ZoomHorizontalStart < 0) {
    10e6:	4a41           	tst.w d1
    10e8:	6df4           	blt.s 10de <Zoom_ZoomIntoPicture+0x8c>
    10ea:	3f41 0048      	move.w d1,72(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    /*UWORD size4blitsmall = ZMLINESIZE/2*ZoomHorizontal*planes;
    UWORD size4blitbig = ZMLINESIZE/2*(ZoomHorizontal+1)*planes;*/

    UWORD onestep = ZMLINESIZE/2*planes;
    10ee:	3203           	move.w d3,d1
    10f0:	d243           	add.w d3,d1
    10f2:	d243           	add.w d3,d1
    10f4:	e749           	lsl.w #3,d1
    10f6:	3f41 0034      	move.w d1,52(sp)
  hw->bltsize = height*64+2;
    10fa:	3e03           	move.w d3,d7
    10fc:	ed4f           	lsl.w #6,d7
    10fe:	3207           	move.w d7,d1
    1100:	5441           	addq.w #2,d1
    1102:	3f41 0036      	move.w d1,54(sp)
          linesleft--;
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
        pos4source += size4blit;
        pos4dest += size4blit + onestep;   
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1106:	90c4           	suba.w d4,a0
    1108:	3a48           	movea.w a0,a5
    110a:	4bed 0012      	lea 18(a5),a5
    110e:	7200           	moveq #0,d1
    1110:	322f 0034      	move.w 52(sp),d1
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    1114:	c6c0           	mulu.w d0,d3
    1116:	2003           	move.l d3,d0
    1118:	d083           	add.l d3,d0
    111a:	d083           	add.l d3,d0
    111c:	e988           	lsl.l #4,d0
    111e:	206f 0050      	movea.l 80(sp),a0
    1122:	41f0 082c      	lea (44,a0,d0.l),a0
    1126:	2f48 003c      	move.l a0,60(sp)
    112a:	702c           	moveq #44,d0
    112c:	d0af 0054      	add.l 84(sp),d0
    1130:	2f40 0038      	move.l d0,56(sp)
  UWORD shifttoleft = 0;
    1134:	426f 0046      	clr.w 70(sp)
  UWORD startofword = 21*16;
    1138:	3f7c 0150 0030 	move.w #336,48(sp)
      nextzoom -= (19 + zoomnr);
    113e:	70ed           	moveq #-19,d0
    1140:	9042           	sub.w d2,d0
    1142:	3f40 004a      	move.w d0,74(sp)
    ZoomBlit_Increment4SrcA = 1;
    1146:	2841           	movea.l d1,a4
    ZoomHorizontal = ZoomHorizontalStart;
    1148:	33ef 0048 0001 	move.w 72(sp),16a66 <ZoomHorizontal>
    114e:	6a66 
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    1150:	242f 003c      	move.l 60(sp),d2
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    1154:	262f 0038      	move.l 56(sp),d3
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    1158:	7c00           	moveq #0,d6
    115a:	3c2f 0046      	move.w 70(sp),d6
    115e:	2a06           	move.l d6,d5
    1160:	da86           	add.l d6,d5
    1162:	3f6f 0032 002c 	move.w 50(sp),44(sp)
    1168:	382f 0032      	move.w 50(sp),d4
    116c:	720c           	moveq #12,d1
    116e:	e36c           	lsl.w d1,d4
    1170:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    1176:	7000           	moveq #0,d0
    1178:	302f 0030      	move.w 48(sp),d0
    117c:	306f 0040      	movea.w 64(sp),a0
    1180:	b1c0           	cmpa.l d0,a0
    1182:	6e00 00e8      	bgt.w 126c <Zoom_ZoomIntoPicture+0x21a>
  WaitBlit();
    1186:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
    118a:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
    1190:	0644 09f0      	addi.w #2544,d4
    1194:	3144 0040      	move.w d4,64(a0)
  hw->bltcon1 = 0;
    1198:	317c 0000 0042 	move.w #0,66(a0)
    119e:	3239 0001 6a66 	move.w 16a66 <ZoomHorizontal>,d1
    WORD linesleft = 272;
    11a4:	383c 0110      	move.w #272,d4
    11a8:	2f46 002c      	move.l d6,44(sp)
    11ac:	2645           	movea.l d5,a3
    11ae:	3c2f 0034      	move.w 52(sp),d6
        if( linesleft >= ZoomHorizontal+1) {
    11b2:	b841           	cmp.w d1,d4
    11b4:	6f00 009a      	ble.w 1250 <Zoom_ZoomIntoPicture+0x1fe>
          linesleft -= ZoomHorizontal;
    11b8:	9841           	sub.w d1,d4
        UWORD size4blit = ZoomHorizontal*onestep; 
    11ba:	3001           	move.w d1,d0
    11bc:	c1c6           	muls.w d6,d0
        if( linesleft>0) {
    11be:	0280 0000 ffff 	andi.l #65535,d0
    11c4:	2440           	movea.l d0,a2
    11c6:	d5c0           	adda.l d0,a2
    11c8:	4a44           	tst.w d4
    11ca:	6f2c           	ble.s 11f8 <Zoom_ZoomIntoPicture+0x1a6>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    11cc:	226f 002c      	movea.l 44(sp),a1
    11d0:	d3c0           	adda.l d0,a1
    11d2:	d3c9           	adda.l a1,a1
    11d4:	d3c2           	adda.l d2,a1
          UWORD *tmpdest = pos4dest +  size4blit;
    11d6:	4df2 3800      	lea (0,a2,d3.l),a6
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    11da:	3a28 0002      	move.w 2(a0),d5
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    11de:	3a28 0002      	move.w 2(a0),d5
    11e2:	0805 000e      	btst #14,d5
    11e6:	66f6           	bne.s 11de <Zoom_ZoomIntoPicture+0x18c>
  hw->bltapt = (UWORD *) source;
    11e8:	2149 0050      	move.l a1,80(a0)
  hw->bltdpt = (UWORD *) destination;
    11ec:	214e 0054      	move.l a6,84(a0)
  hw->bltsize = height*64+2;
    11f0:	316f 0036 0058 	move.w 54(sp),88(a0)
          linesleft--;
    11f6:	5344           	subq.w #1,d4
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    11f8:	43f3 2800      	lea (0,a3,d2.l),a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    11fc:	3a28 0002      	move.w 2(a0),d5
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    1200:	3a28 0002      	move.w 2(a0),d5
    1204:	0805 000e      	btst #14,d5
    1208:	66f6           	bne.s 1200 <Zoom_ZoomIntoPicture+0x1ae>
  hw->bltapt = (UWORD *) source;
    120a:	2149 0050      	move.l a1,80(a0)
  hw->bltdpt = (UWORD *) destination;
    120e:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
    1212:	c3c7           	muls.w d7,d1
    1214:	5441           	addq.w #2,d1
    1216:	3141 0058      	move.w d1,88(a0)
        pos4source += size4blit;
    121a:	d48a           	add.l a2,d2
        pos4dest += size4blit + onestep; 
    121c:	d08c           	add.l a4,d0
    121e:	d080           	add.l d0,d0
    1220:	d680           	add.l d0,d3
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1222:	320d           	move.w a5,d1
      while(linesleft > 0) {
    1224:	4a44           	tst.w d4
    1226:	6e8a           	bgt.s 11b2 <Zoom_ZoomIntoPicture+0x160>
    1228:	33cd 0001 6a66 	move.w a5,16a66 <ZoomHorizontal>
      if(shiftright < 0) {
        shiftright += 16;
        shifttoleft = 1;
      }
    }
    startofword -= 16;
    122e:	066f fff0 0030 	addi.w #-16,48(sp)
    1234:	55af 003c      	subq.l #2,60(sp)
    1238:	55af 0038      	subq.l #2,56(sp)
  for(int i=0;i<22;i++) {
    123c:	0c6f fff0 0030 	cmpi.w #-16,48(sp)
    1242:	6600 ff04      	bne.w 1148 <Zoom_ZoomIntoPicture+0xf6>
  }
  //ZoomHorizontal = 10;
}
    1246:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    124a:	4fef 0020      	lea 32(sp),sp
    124e:	4e75           	rts
        UWORD size4blit = ZoomHorizontal*onestep; 
    1250:	3006           	move.w d6,d0
    1252:	c1c4           	muls.w d4,d0
        if( linesleft>0) {
    1254:	0280 0000 ffff 	andi.l #65535,d0
    125a:	2440           	movea.l d0,a2
    125c:	d5c0           	adda.l d0,a2
        UWORD size4blit = ZoomHorizontal*onestep; 
    125e:	3204           	move.w d4,d1
          linesleft = 0;
    1260:	4244           	clr.w d4
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1262:	43f3 2800      	lea (0,a3,d2.l),a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1266:	3a28 0002      	move.w 2(a0),d5
    126a:	6094           	bra.s 1200 <Zoom_ZoomIntoPicture+0x1ae>
  UWORD colnr = nextzoom - startofword - 1;                                                                          
    126c:	366f 0040      	movea.w 64(sp),a3
    1270:	96ef 0030      	suba.w 48(sp),a3
    1274:	534b           	subq.w #1,a3
  if( shiftright == 0) {
    1276:	302f 002c      	move.w 44(sp),d0
    127a:	5340           	subq.w #1,d0
    127c:	3f40 0032      	move.w d0,50(sp)
    1280:	4a6f 002c      	tst.w 44(sp)
    1284:	6600 013c      	bne.w 13c2 <Zoom_ZoomIntoPicture+0x370>
    ZoomBlit_Increment4SrcA = 1;
    1288:	33fc 0001 0001 	move.w #1,16a74 <ZoomBlit_Increment4SrcA>
    128e:	6a74 
    1290:	347c fde4      	movea.w #-540,a2
  WaitBlit(); 
    1294:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    1298:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
    129e:	3144 0042      	move.w d4,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    12a2:	314a 0040      	move.w a2,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    12a6:	7000           	moveq #0,d0
    12a8:	300b           	move.w a3,d0
    12aa:	7210           	moveq #16,d1
    12ac:	9280           	sub.l d0,d1
    12ae:	2001           	move.l d1,d0
    12b0:	7200           	moveq #0,d1
    12b2:	4641           	not.w d1
    12b4:	e1a9           	lsl.l d0,d1
    12b6:	3141 0070      	move.w d1,112(a0)
      nextzoom -= (19 + zoomnr);
    12ba:	302f 004a      	move.w 74(sp),d0
    12be:	d16f 0040      	add.w d0,64(sp)
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    12c2:	7000           	moveq #0,d0
    12c4:	3039 0001 6a74 	move.w 16a74 <ZoomBlit_Increment4SrcA>,d0
    12ca:	2c40           	movea.l d0,a6
    12cc:	ddc0           	adda.l d0,a6
    12ce:	3239 0001 6a66 	move.w 16a66 <ZoomHorizontal>,d1
    WORD linesleft = 272;
    12d4:	383c 0110      	move.w #272,d4
    12d8:	2f46 0042      	move.l d6,66(sp)
        if( linesleft >= ZoomHorizontal+1) {
    12dc:	b841           	cmp.w d1,d4
    12de:	6f00 00c2      	ble.w 13a2 <Zoom_ZoomIntoPicture+0x350>
          linesleft -= ZoomHorizontal;
    12e2:	9841           	sub.w d1,d4
        UWORD size4blit = ZoomHorizontal*onestep;
    12e4:	302f 0034      	move.w 52(sp),d0
    12e8:	c1c1           	muls.w d1,d0
        if( linesleft>0) {
    12ea:	0280 0000 ffff 	andi.l #65535,d0
    12f0:	2440           	movea.l d0,a2
    12f2:	d5c0           	adda.l d0,a2
    12f4:	4a44           	tst.w d4
    12f6:	6f34           	ble.s 132c <Zoom_ZoomIntoPicture+0x2da>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    12f8:	226f 0042      	movea.l 66(sp),a1
    12fc:	d3c0           	adda.l d0,a1
    12fe:	d3c9           	adda.l a1,a1
    1300:	d3c2           	adda.l d2,a1
          UWORD *tmpdest = pos4dest + size4blit;
    1302:	47f2 3800      	lea (0,a2,d3.l),a3
    1306:	3c28 0002      	move.w 2(a0),d6
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    130a:	3c28 0002      	move.w 2(a0),d6
    130e:	0806 000e      	btst #14,d6
    1312:	66f6           	bne.s 130a <Zoom_ZoomIntoPicture+0x2b8>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    1314:	2c09           	move.l a1,d6
    1316:	dc8e           	add.l a6,d6
    1318:	2146 0050      	move.l d6,80(a0)
  hw->bltbpt = source;
    131c:	2149 004c      	move.l a1,76(a0)
  hw->bltdpt = destination;
    1320:	214b 0054      	move.l a3,84(a0)
  hw->bltsize = height*64+2;
    1324:	316f 0036 0058 	move.w 54(sp),88(a0)
          linesleft--;
    132a:	5344           	subq.w #1,d4
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    132c:	2242           	movea.l d2,a1
    132e:	d3c5           	adda.l d5,a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1330:	3c28 0002      	move.w 2(a0),d6
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    1334:	3c28 0002      	move.w 2(a0),d6
    1338:	0806 000e      	btst #14,d6
    133c:	66f6           	bne.s 1334 <Zoom_ZoomIntoPicture+0x2e2>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    133e:	2c09           	move.l a1,d6
    1340:	dc8e           	add.l a6,d6
    1342:	2146 0050      	move.l d6,80(a0)
  hw->bltbpt = source;
    1346:	2149 004c      	move.l a1,76(a0)
  hw->bltdpt = destination;
    134a:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
    134e:	c3c7           	muls.w d7,d1
    1350:	5441           	addq.w #2,d1
    1352:	3141 0058      	move.w d1,88(a0)
        pos4source += size4blit;
    1356:	d48a           	add.l a2,d2
        pos4dest += size4blit + onestep;   
    1358:	d08c           	add.l a4,d0
    135a:	d080           	add.l d0,d0
    135c:	d680           	add.l d0,d3
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    135e:	320d           	move.w a5,d1
      while( linesleft > 0) {
    1360:	4a44           	tst.w d4
    1362:	6e00 ff78      	bgt.w 12dc <Zoom_ZoomIntoPicture+0x28a>
    1366:	33cd 0001 6a66 	move.w a5,16a66 <ZoomHorizontal>
      if(shiftright < 0) {
    136c:	4a6f 0032      	tst.w 50(sp)
    1370:	6c00 febc      	bge.w 122e <Zoom_ZoomIntoPicture+0x1dc>
        shiftright += 16;
    1374:	322f 002c      	move.w 44(sp),d1
    1378:	0641 000f      	addi.w #15,d1
    137c:	3f41 0032      	move.w d1,50(sp)
        shifttoleft = 1;
    1380:	3f7c 0001 0046 	move.w #1,70(sp)
    startofword -= 16;
    1386:	066f fff0 0030 	addi.w #-16,48(sp)
    138c:	55af 003c      	subq.l #2,60(sp)
    1390:	55af 0038      	subq.l #2,56(sp)
  for(int i=0;i<22;i++) {
    1394:	0c6f fff0 0030 	cmpi.w #-16,48(sp)
    139a:	6600 fdac      	bne.w 1148 <Zoom_ZoomIntoPicture+0xf6>
    139e:	6000 fea6      	bra.w 1246 <Zoom_ZoomIntoPicture+0x1f4>
        UWORD size4blit = ZoomHorizontal*onestep;
    13a2:	302f 0034      	move.w 52(sp),d0
    13a6:	c1c4           	muls.w d4,d0
        if( linesleft>0) {
    13a8:	0280 0000 ffff 	andi.l #65535,d0
    13ae:	2440           	movea.l d0,a2
    13b0:	d5c0           	adda.l d0,a2
        UWORD size4blit = ZoomHorizontal*onestep;
    13b2:	3204           	move.w d4,d1
          linesleft = 0;
    13b4:	4244           	clr.w d4
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    13b6:	2242           	movea.l d2,a1
    13b8:	d3c5           	adda.l d5,a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    13ba:	3c28 0002      	move.w 2(a0),d6
    13be:	6000 ff74      	bra.w 1334 <Zoom_ZoomIntoPicture+0x2e2>
  ZoomBlit_Increment4SrcA = 0;
    13c2:	4279 0001 6a74 	clr.w 16a74 <ZoomBlit_Increment4SrcA>
    shifta = (shiftright - 1) << 12;
    13c8:	720c           	moveq #12,d1
    13ca:	e368           	lsl.w d1,d0
    13cc:	3440           	movea.w d0,a2
    13ce:	45ea 0de4      	lea 3556(a2),a2
  WaitBlit(); 
    13d2:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    13d6:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
    13dc:	3144 0042      	move.w d4,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    13e0:	314a 0040      	move.w a2,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    13e4:	7000           	moveq #0,d0
    13e6:	300b           	move.w a3,d0
    13e8:	7210           	moveq #16,d1
    13ea:	9280           	sub.l d0,d1
    13ec:	2001           	move.l d1,d0
    13ee:	7200           	moveq #0,d1
    13f0:	4641           	not.w d1
    13f2:	e1a9           	lsl.l d0,d1
    13f4:	3141 0070      	move.w d1,112(a0)
      nextzoom -= (19 + zoomnr);
    13f8:	302f 004a      	move.w 74(sp),d0
    13fc:	d16f 0040      	add.w d0,64(sp)
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    1400:	7000           	moveq #0,d0
    1402:	3039 0001 6a74 	move.w 16a74 <ZoomBlit_Increment4SrcA>,d0
    1408:	2c40           	movea.l d0,a6
    140a:	ddc0           	adda.l d0,a6
    140c:	3239 0001 6a66 	move.w 16a66 <ZoomHorizontal>,d1
    WORD linesleft = 272;
    1412:	383c 0110      	move.w #272,d4
    1416:	2f46 0042      	move.l d6,66(sp)
    141a:	6000 fec0      	bra.w 12dc <Zoom_ZoomIntoPicture+0x28a>
  UWORD shifthoriz = 7;
    141e:	7007           	moveq #7,d0
    UWORD onestep = ZMLINESIZE/2*planes;
    1420:	3203           	move.w d3,d1
    1422:	d243           	add.w d3,d1
    1424:	d243           	add.w d3,d1
    1426:	e749           	lsl.w #3,d1
    1428:	3f41 0034      	move.w d1,52(sp)
  hw->bltsize = height*64+2;
    142c:	3e03           	move.w d3,d7
    142e:	ed4f           	lsl.w #6,d7
    1430:	3207           	move.w d7,d1
    1432:	5441           	addq.w #2,d1
    1434:	3f41 0036      	move.w d1,54(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1438:	90c4           	suba.w d4,a0
    143a:	3a48           	movea.w a0,a5
    143c:	4bed 0012      	lea 18(a5),a5
    1440:	7200           	moveq #0,d1
    1442:	322f 0034      	move.w 52(sp),d1
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    1446:	c6c0           	mulu.w d0,d3
    1448:	2003           	move.l d3,d0
    144a:	d083           	add.l d3,d0
    144c:	d083           	add.l d3,d0
    144e:	e988           	lsl.l #4,d0
    1450:	206f 0050      	movea.l 80(sp),a0
    1454:	41f0 082c      	lea (44,a0,d0.l),a0
    1458:	2f48 003c      	move.l a0,60(sp)
    145c:	702c           	moveq #44,d0
    145e:	d0af 0054      	add.l 84(sp),d0
    1462:	2f40 0038      	move.l d0,56(sp)
  UWORD shifttoleft = 0;
    1466:	426f 0046      	clr.w 70(sp)
  UWORD startofword = 21*16;
    146a:	3f7c 0150 0030 	move.w #336,48(sp)
      nextzoom -= (19 + zoomnr);
    1470:	70ed           	moveq #-19,d0
    1472:	9042           	sub.w d2,d0
    1474:	3f40 004a      	move.w d0,74(sp)
    ZoomBlit_Increment4SrcA = 1;
    1478:	2841           	movea.l d1,a4
    147a:	6000 fccc      	bra.w 1148 <Zoom_ZoomIntoPicture+0xf6>

0000147e <Init_Blit>:
  hw->bltafwm = 0xffff;
    147e:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
    1484:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    148a:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    1490:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    1496:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    149c:	317c 002c 0066 	move.w #44,102(a0)
}
    14a2:	4e75           	rts

000014a4 <ClbuildZoom>:
ULONG * ClbuildZoom() {
    14a4:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    14a8:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    14ae:	203c 0000 591c 	move.l #22812,d0
    14b4:	7202           	moveq #2,d1
    14b6:	4eae ff3a      	jsr -198(a6)
    14ba:	2440           	movea.l d0,a2
  if( retval == 0) {
    14bc:	4a80           	tst.l d0
    14be:	6700 01ee      	beq.w 16ae <ClbuildZoom+0x20a>
    *cl++ = *clpartinstruction++;
    14c2:	24b9 0001 66c8 	move.l 166c8 <ClsSprites>,(a2)
    14c8:	2579 0001 66cc 	move.l 166cc <ClsSprites+0x4>,4(a2)
    14ce:	0004 
    14d0:	2579 0001 66d0 	move.l 166d0 <ClsSprites+0x8>,8(a2)
    14d6:	0008 
    14d8:	2579 0001 66d4 	move.l 166d4 <ClsSprites+0xc>,12(a2)
    14de:	000c 
    14e0:	2579 0001 66d8 	move.l 166d8 <ClsSprites+0x10>,16(a2)
    14e6:	0010 
    14e8:	2579 0001 66dc 	move.l 166dc <ClsSprites+0x14>,20(a2)
    14ee:	0014 
    14f0:	2579 0001 66e0 	move.l 166e0 <ClsSprites+0x18>,24(a2)
    14f6:	0018 
    14f8:	2579 0001 66e4 	move.l 166e4 <ClsSprites+0x1c>,28(a2)
    14fe:	001c 
    1500:	2579 0001 66e8 	move.l 166e8 <ClsSprites+0x20>,32(a2)
    1506:	0020 
    1508:	2579 0001 66ec 	move.l 166ec <ClsSprites+0x24>,36(a2)
    150e:	0024 
    1510:	2579 0001 66f0 	move.l 166f0 <ClsSprites+0x28>,40(a2)
    1516:	0028 
    1518:	2579 0001 66f4 	move.l 166f4 <ClsSprites+0x2c>,44(a2)
    151e:	002c 
    1520:	2579 0001 66f8 	move.l 166f8 <ClsSprites+0x30>,48(a2)
    1526:	0030 
    1528:	2579 0001 66fc 	move.l 166fc <ClsSprites+0x34>,52(a2)
    152e:	0034 
    1530:	2579 0001 6700 	move.l 16700 <ClsSprites+0x38>,56(a2)
    1536:	0038 
    1538:	2579 0001 6704 	move.l 16704 <ClsSprites+0x3c>,60(a2)
    153e:	003c 
    *cl++ = *clpartinstruction++;
    1540:	2579 0001 6698 	move.l 16698 <ClScreen>,64(a2)
    1546:	0040 
    1548:	2579 0001 669c 	move.l 1669c <ClScreen+0x4>,68(a2)
    154e:	0044 
    1550:	2579 0001 66a0 	move.l 166a0 <ClScreen+0x8>,72(a2)
    1556:	0048 
    1558:	2579 0001 66a4 	move.l 166a4 <ClScreen+0xc>,76(a2)
    155e:	004c 
    1560:	2579 0001 66a8 	move.l 166a8 <ClScreen+0x10>,80(a2)
    1566:	0050 
    1568:	2579 0001 66ac 	move.l 166ac <ClScreen+0x14>,84(a2)
    156e:	0054 
    1570:	2579 0001 66b0 	move.l 166b0 <ClScreen+0x18>,88(a2)
    1576:	0058 
    1578:	2579 0001 66b4 	move.l 166b4 <ClScreen+0x1c>,92(a2)
    157e:	005c 
    1580:	2579 0001 66b8 	move.l 166b8 <ClScreen+0x20>,96(a2)
    1586:	0060 
    1588:	2579 0001 66bc 	move.l 166bc <ClScreen+0x24>,100(a2)
    158e:	0064 
    1590:	2579 0001 66c0 	move.l 166c0 <ClScreen+0x28>,104(a2)
    1596:	0068 
    1598:	2579 0001 66c4 	move.l 166c4 <ClScreen+0x2c>,108(a2)
    159e:	006c 
  *cl++ = 0x00e00000;
    15a0:	257c 00e0 0000 	move.l #14680064,112(a2)
    15a6:	0070 
  *cl++ = 0x00e20000;
    15a8:	257c 00e2 0000 	move.l #14811136,116(a2)
    15ae:	0074 
  *cl++ = 0x00e40000;
    15b0:	257c 00e4 0000 	move.l #14942208,120(a2)
    15b6:	0078 
  *cl++ = 0x00e60000;
    15b8:	257c 00e6 0000 	move.l #15073280,124(a2)
    15be:	007c 
  *cl++ = 0x00e80000;
    15c0:	257c 00e8 0000 	move.l #15204352,128(a2)
    15c6:	0080 
  *cl++ = 0x00ea0000;
    15c8:	257c 00ea 0000 	move.l #15335424,132(a2)
    15ce:	0084 
  *cl++ = 0x00ec0000;
    15d0:	257c 00ec 0000 	move.l #15466496,136(a2)
    15d6:	0088 
  *cl++ = 0x00ee0000;
    15d8:	257c 00ee 0000 	move.l #15597568,140(a2)
    15de:	008c 
  *cl++ = 0x00f00000;
    15e0:	257c 00f0 0000 	move.l #15728640,144(a2)
    15e6:	0090 
  *cl++ = 0x00f20000;
    15e8:	257c 00f2 0000 	move.l #15859712,148(a2)
    15ee:	0094 
  for(int i=0; i<32;i++)
    15f0:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
    15f4:	41f9 0001 6618 	lea 16618 <ClColor>,a0
    *cl++ = *clpartinstruction++;
    15fa:	22d8           	move.l (a0)+,(a1)+
  for(int i=0; i<32;i++)
    15fc:	b1fc 0001 6698 	cmpa.l #91800,a0
    1602:	66f6           	bne.s 15fa <ClbuildZoom+0x156>
  ULONG cop2 = cl+3;
    1604:	200a           	move.l a2,d0
    1606:	0680 0000 0124 	addi.l #292,d0
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
    160c:	2200           	move.l d0,d1
    160e:	4241           	clr.w d1
    1610:	4841           	swap d1
    1612:	0681 0084 0000 	addi.l #8650752,d1
    1618:	2541 0118      	move.l d1,280(a2)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
    161c:	2200           	move.l d0,d1
    161e:	0281 0000 ffff 	andi.l #65535,d1
    1624:	0681 0086 0000 	addi.l #8781824,d1
    162a:	2541 011c      	move.l d1,284(a2)
  *cl++ = 0x2c01ff00;
    162e:	257c 2c01 ff00 	move.l #738328320,288(a2)
    1634:	0120 
  ULONG cop2br1 = cop2 + ( (8+27)<<2);
    1636:	2200           	move.l d0,d1
    1638:	0681 0000 008c 	addi.l #140,d1
  clpartinstruction[6+27] = 0x00840000 + ( cop2br1 >> 16);
    163e:	2401           	move.l d1,d2
    1640:	4242           	clr.w d2
    1642:	4842           	swap d2
    1644:	0682 0084 0000 	addi.l #8650752,d2
    164a:	23c2 0001 6480 	move.l d2,16480 <Cl102ZoomRepeat+0x84>
  clpartinstruction[7+27] = 0x00860000 + ( cop2br1 & 0xffff);
    1650:	0281 0000 ffff 	andi.l #65535,d1
    1656:	0681 0086 0000 	addi.l #8781824,d1
    165c:	23c1 0001 6484 	move.l d1,16484 <Cl102ZoomRepeat+0x88>
  clpartinstruction[17+27+27+27] = 0x00840000 + ( cop2br2 >> 16);
    1662:	220a           	move.l a2,d1
    1664:	0681 0000 02b4 	addi.l #692,d1
    166a:	2401           	move.l d1,d2
    166c:	4242           	clr.w d2
    166e:	4842           	swap d2
    1670:	0682 0084 0000 	addi.l #8650752,d2
    1676:	23c2 0001 6584 	move.l d2,16584 <Cl102ZoomRepeat+0x188>
  clpartinstruction[18+27+27+27] = 0x00860000 + ( cop2br2 & 0xffff);
    167c:	0281 0000 ffff 	andi.l #65535,d1
    1682:	0681 0086 0000 	addi.l #8781824,d1
    1688:	23c1 0001 6588 	move.l d1,16588 <Cl102ZoomRepeat+0x18c>
  for(int i=0;i<26+27+27+26+27;i++)
    168e:	2240           	movea.l d0,a1
  clpartinstruction = Cl102ZoomRepeat;
    1690:	41f9 0001 63fc 	lea 163fc <Cl102ZoomRepeat>,a0
    *cl++ = *clpartinstruction++;
    1696:	22d8           	move.l (a0)+,(a1)+
  for(int i=0;i<26+27+27+26+27;i++)
    1698:	b1fc 0001 6610 	cmpa.l #91664,a0
    169e:	66f6           	bne.s 1696 <ClbuildZoom+0x1f2>
   *cl++ = 0xfffffffe;
    16a0:	70fe           	moveq #-2,d0
    16a2:	2540 0338      	move.l d0,824(a2)
}
    16a6:	200a           	move.l a2,d0
    16a8:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    16ac:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    16ae:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    16b4:	4eae ffc4      	jsr -60(a6)
    16b8:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    16be:	2200           	move.l d0,d1
    16c0:	243c 0001 4f2b 	move.l #85803,d2
    16c6:	7628           	moveq #40,d3
    16c8:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    16cc:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    16d2:	7201           	moveq #1,d1
    16d4:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    16d8:	24b9 0001 66c8 	move.l 166c8 <ClsSprites>,(a2)
    16de:	2579 0001 66cc 	move.l 166cc <ClsSprites+0x4>,4(a2)
    16e4:	0004 
    16e6:	2579 0001 66d0 	move.l 166d0 <ClsSprites+0x8>,8(a2)
    16ec:	0008 
    16ee:	2579 0001 66d4 	move.l 166d4 <ClsSprites+0xc>,12(a2)
    16f4:	000c 
    16f6:	2579 0001 66d8 	move.l 166d8 <ClsSprites+0x10>,16(a2)
    16fc:	0010 
    16fe:	2579 0001 66dc 	move.l 166dc <ClsSprites+0x14>,20(a2)
    1704:	0014 
    1706:	2579 0001 66e0 	move.l 166e0 <ClsSprites+0x18>,24(a2)
    170c:	0018 
    170e:	2579 0001 66e4 	move.l 166e4 <ClsSprites+0x1c>,28(a2)
    1714:	001c 
    1716:	2579 0001 66e8 	move.l 166e8 <ClsSprites+0x20>,32(a2)
    171c:	0020 
    171e:	2579 0001 66ec 	move.l 166ec <ClsSprites+0x24>,36(a2)
    1724:	0024 
    1726:	2579 0001 66f0 	move.l 166f0 <ClsSprites+0x28>,40(a2)
    172c:	0028 
    172e:	2579 0001 66f4 	move.l 166f4 <ClsSprites+0x2c>,44(a2)
    1734:	002c 
    1736:	2579 0001 66f8 	move.l 166f8 <ClsSprites+0x30>,48(a2)
    173c:	0030 
    173e:	2579 0001 66fc 	move.l 166fc <ClsSprites+0x34>,52(a2)
    1744:	0034 
    1746:	2579 0001 6700 	move.l 16700 <ClsSprites+0x38>,56(a2)
    174c:	0038 
    174e:	2579 0001 6704 	move.l 16704 <ClsSprites+0x3c>,60(a2)
    1754:	003c 
    *cl++ = *clpartinstruction++;
    1756:	2579 0001 6698 	move.l 16698 <ClScreen>,64(a2)
    175c:	0040 
    175e:	2579 0001 669c 	move.l 1669c <ClScreen+0x4>,68(a2)
    1764:	0044 
    1766:	2579 0001 66a0 	move.l 166a0 <ClScreen+0x8>,72(a2)
    176c:	0048 
    176e:	2579 0001 66a4 	move.l 166a4 <ClScreen+0xc>,76(a2)
    1774:	004c 
    1776:	2579 0001 66a8 	move.l 166a8 <ClScreen+0x10>,80(a2)
    177c:	0050 
    177e:	2579 0001 66ac 	move.l 166ac <ClScreen+0x14>,84(a2)
    1784:	0054 
    1786:	2579 0001 66b0 	move.l 166b0 <ClScreen+0x18>,88(a2)
    178c:	0058 
    178e:	2579 0001 66b4 	move.l 166b4 <ClScreen+0x1c>,92(a2)
    1794:	005c 
    1796:	2579 0001 66b8 	move.l 166b8 <ClScreen+0x20>,96(a2)
    179c:	0060 
    179e:	2579 0001 66bc 	move.l 166bc <ClScreen+0x24>,100(a2)
    17a4:	0064 
    17a6:	2579 0001 66c0 	move.l 166c0 <ClScreen+0x28>,104(a2)
    17ac:	0068 
    17ae:	2579 0001 66c4 	move.l 166c4 <ClScreen+0x2c>,108(a2)
    17b4:	006c 
  *cl++ = 0x00e00000;
    17b6:	257c 00e0 0000 	move.l #14680064,112(a2)
    17bc:	0070 
  *cl++ = 0x00e20000;
    17be:	257c 00e2 0000 	move.l #14811136,116(a2)
    17c4:	0074 
  *cl++ = 0x00e40000;
    17c6:	257c 00e4 0000 	move.l #14942208,120(a2)
    17cc:	0078 
  *cl++ = 0x00e60000;
    17ce:	257c 00e6 0000 	move.l #15073280,124(a2)
    17d4:	007c 
  *cl++ = 0x00e80000;
    17d6:	257c 00e8 0000 	move.l #15204352,128(a2)
    17dc:	0080 
  *cl++ = 0x00ea0000;
    17de:	257c 00ea 0000 	move.l #15335424,132(a2)
    17e4:	0084 
  *cl++ = 0x00ec0000;
    17e6:	257c 00ec 0000 	move.l #15466496,136(a2)
    17ec:	0088 
  *cl++ = 0x00ee0000;
    17ee:	257c 00ee 0000 	move.l #15597568,140(a2)
    17f4:	008c 
  *cl++ = 0x00f00000;
    17f6:	257c 00f0 0000 	move.l #15728640,144(a2)
    17fc:	0090 
  *cl++ = 0x00f20000;
    17fe:	257c 00f2 0000 	move.l #15859712,148(a2)
    1804:	0094 
  for(int i=0; i<32;i++)
    1806:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
    180a:	41f9 0001 6618 	lea 16618 <ClColor>,a0
    1810:	6000 fde8      	bra.w 15fa <ClbuildZoom+0x156>

00001814 <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    1814:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    1818:	45fa fc8a      	lea 14a4 <ClbuildZoom>(pc),a2
    181c:	4e92           	jsr (a2)
    181e:	23c0 0001 6a70 	move.l d0,16a70 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    1824:	4e92           	jsr (a2)
    1826:	23c0 0001 6a62 	move.l d0,16a62 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    182c:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1832:	203c 0001 6800 	move.l #92160,d0
    1838:	7202           	moveq #2,d1
    183a:	4eae ff3a      	jsr -198(a6)
    183e:	23c0 0001 6a5e 	move.l d0,16a5e <Bitplane1>
  if(Bitplane1 == 0) {
    1844:	6700 008c      	beq.w 18d2 <PrepareDisplayZoom+0xbe>
  DrawBuffer = Bitplane1;
    1848:	23c0 0001 6a76 	move.l d0,16a76 <DrawBuffer>
  DrawCopper = Copperlist1;
    184e:	23f9 0001 6a70 	move.l 16a70 <Copperlist1>,16a68 <DrawCopper>
    1854:	0001 6a68 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1858:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    185e:	203c 0001 6800 	move.l #92160,d0
    1864:	7202           	moveq #2,d1
    1866:	4eae ff3a      	jsr -198(a6)
    186a:	23c0 0001 6a5a 	move.l d0,16a5a <Bitplane2>
  if(Bitplane2 == 0) {
    1870:	6718           	beq.s 188a <PrepareDisplayZoom+0x76>
  ViewBuffer = Bitplane2;
    1872:	23c0 0001 6a6c 	move.l d0,16a6c <ViewBuffer>
  ViewCopper = Copperlist2;
    1878:	23f9 0001 6a62 	move.l 16a62 <Copperlist2>,16a56 <ViewCopper>
    187e:	0001 6a56 
}
    1882:	7000           	moveq #0,d0
    1884:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1888:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    188a:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1890:	4eae ffc4      	jsr -60(a6)
    1894:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    189a:	2200           	move.l d0,d1
    189c:	243c 0001 4f78 	move.l #85880,d2
    18a2:	7626           	moveq #38,d3
    18a4:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    18a8:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    18ae:	7201           	moveq #1,d1
    18b0:	4eae ff70      	jsr -144(a6)
    18b4:	2039 0001 6a5a 	move.l 16a5a <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    18ba:	23c0 0001 6a6c 	move.l d0,16a6c <ViewBuffer>
  ViewCopper = Copperlist2;
    18c0:	23f9 0001 6a62 	move.l 16a62 <Copperlist2>,16a56 <ViewCopper>
    18c6:	0001 6a56 
}
    18ca:	7000           	moveq #0,d0
    18cc:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    18d0:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    18d2:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    18d8:	4eae ffc4      	jsr -60(a6)
    18dc:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    18e2:	2200           	move.l d0,d1
    18e4:	243c 0001 4f51 	move.l #85841,d2
    18ea:	7626           	moveq #38,d3
    18ec:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    18f0:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    18f6:	7201           	moveq #1,d1
    18f8:	4eae ff70      	jsr -144(a6)
    18fc:	2039 0001 6a5e 	move.l 16a5e <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    1902:	23c0 0001 6a76 	move.l d0,16a76 <DrawBuffer>
  DrawCopper = Copperlist1;
    1908:	23f9 0001 6a70 	move.l 16a70 <Copperlist1>,16a68 <DrawCopper>
    190e:	0001 6a68 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1912:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1918:	203c 0001 6800 	move.l #92160,d0
    191e:	7202           	moveq #2,d1
    1920:	4eae ff3a      	jsr -198(a6)
    1924:	23c0 0001 6a5a 	move.l d0,16a5a <Bitplane2>
  if(Bitplane2 == 0) {
    192a:	6600 ff46      	bne.w 1872 <PrepareDisplayZoom+0x5e>
    192e:	6000 ff5a      	bra.w 188a <PrepareDisplayZoom+0x76>

00001932 <Zoom_Init>:
void Zoom_Init() {
    1932:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    1934:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    193a:	7004           	moveq #4,d0
    193c:	7202           	moveq #2,d1
    193e:	4eae ff3a      	jsr -198(a6)
  ZoomHorizontal = 16;
    1942:	33fc 0010 0001 	move.w #16,16a66 <ZoomHorizontal>
    1948:	6a66 
}
    194a:	2c5f           	movea.l (sp)+,a6
    194c:	4e75           	rts

0000194e <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    194e:	2039 0001 6a68 	move.l 16a68 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    1954:	23f9 0001 6a56 	move.l 16a56 <ViewCopper>,16a68 <DrawCopper>
    195a:	0001 6a68 
  ViewCopper = (ULONG *)tmp;
    195e:	23c0 0001 6a56 	move.l d0,16a56 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    1964:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
    196a:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    196e:	3140 0088      	move.w d0,136(a0)
}
    1972:	4e75           	rts

00001974 <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    1974:	2039 0001 6a76 	move.l 16a76 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    197a:	2079 0001 6a68 	movea.l 16a68 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    1980:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    1984:	2200           	move.l d0,d1
    1986:	4241           	clr.w d1
    1988:	4841           	swap d1
    198a:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    198e:	23f9 0001 6a6c 	move.l 16a6c <ViewBuffer>,16a76 <DrawBuffer>
    1994:	0001 6a76 
  ViewBuffer = (ULONG *) tmp;
    1998:	23c0 0001 6a6c 	move.l d0,16a6c <ViewBuffer>
}
    199e:	4e75           	rts

000019a0 <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    19a0:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    19a4:	262f 0010      	move.l 16(sp),d3
    19a8:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    19ac:	2279 0001 6a70 	movea.l 16a70 <Copperlist1>,a1
    19b2:	b2fc 0000      	cmpa.w #0,a1
    19b6:	670c           	beq.s 19c4 <FreeDisplay+0x24>
    19b8:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    19be:	2003           	move.l d3,d0
    19c0:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    19c4:	2279 0001 6a62 	movea.l 16a62 <Copperlist2>,a1
    19ca:	b2fc 0000      	cmpa.w #0,a1
    19ce:	670c           	beq.s 19dc <FreeDisplay+0x3c>
    19d0:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    19d6:	2003           	move.l d3,d0
    19d8:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    19dc:	2279 0001 6a5e 	movea.l 16a5e <Bitplane1>,a1
    19e2:	b2fc 0000      	cmpa.w #0,a1
    19e6:	670c           	beq.s 19f4 <FreeDisplay+0x54>
    19e8:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    19ee:	2002           	move.l d2,d0
    19f0:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    19f4:	2279 0001 6a5a 	movea.l 16a5a <Bitplane2>,a1
    19fa:	b2fc 0000      	cmpa.w #0,a1
    19fe:	670c           	beq.s 1a0c <FreeDisplay+0x6c>
    1a00:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1a06:	2002           	move.l d2,d0
    1a08:	4eae ff2e      	jsr -210(a6)
}
    1a0c:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    1a10:	4e75           	rts

00001a12 <WaitVbl>:
void WaitVbl() {
    1a12:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    1a14:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd721a>,d0
    1a1a:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    1a1c:	2017           	move.l (sp),d0
    1a1e:	0280 0001 ff00 	andi.l #130816,d0
    1a24:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    1a26:	2017           	move.l (sp),d0
    1a28:	0c80 0001 3700 	cmpi.l #79616,d0
    1a2e:	67e4           	beq.s 1a14 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    1a30:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd721a>,d0
    1a36:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    1a3a:	202f 0004      	move.l 4(sp),d0
    1a3e:	0280 0001 ff00 	andi.l #130816,d0
    1a44:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    1a48:	202f 0004      	move.l 4(sp),d0
    1a4c:	0c80 0001 3700 	cmpi.l #79616,d0
    1a52:	66dc           	bne.s 1a30 <WaitVbl+0x1e>
}
    1a54:	508f           	addq.l #8,sp
    1a56:	4e75           	rts

00001a58 <ZoomTest>:
void ZoomTest() {
    1a58:	4fef ff50      	lea -176(sp),sp
    1a5c:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
  hw->dmacon = 0b1000010000000000; //Blitter nasty
    1a60:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
    1a66:	317c 8400 0096 	move.w #-31744,150(a0)
  Counter4Frames = 0;
    1a6c:	42b9 0001 6a86 	clr.l 16a86 <Counter4Frames>
  if ((vbint = AllocMem(sizeof(struct Interrupt),    
    1a72:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1a78:	7016           	moveq #22,d0
    1a7a:	223c 0001 0001 	move.l #65537,d1
    1a80:	4eae ff3a      	jsr -198(a6)
    1a84:	2440           	movea.l d0,a2
    1a86:	4a80           	tst.l d0
    1a88:	671a           	beq.s 1aa4 <ZoomTest+0x4c>
    vbint->is_Node.ln_Type = NT_INTERRUPT;       
    1a8a:	357c 02c4 0008 	move.w #708,8(a2)
    vbint->is_Node.ln_Name = "VertB-Example";
    1a90:	257c 0001 4f9f 	move.l #85919,10(a2)
    1a96:	000a 
    vbint->is_Data = NULL;
    1a98:	42aa 000e      	clr.l 14(a2)
    vbint->is_Code = Vblankcounter;
    1a9c:	257c 0000 0ac4 	move.l #2756,18(a2)
    1aa2:	0012 
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    1aa4:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1aaa:	203c 0001 1440 	move.l #70720,d0
    1ab0:	7202           	moveq #2,d1
    1ab2:	4eae ff3a      	jsr -198(a6)
    1ab6:	2800           	move.l d0,d4
  if( source == 0) {
    1ab8:	6700 29fc      	beq.w 44b6 <ZoomTest+0x2a5e>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    1abc:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1ac2:	203c 0001 1440 	move.l #70720,d0
    1ac8:	7202           	moveq #2,d1
    1aca:	4eae ff3a      	jsr -198(a6)
    1ace:	2a00           	move.l d0,d5
  if( destination == 0) {
    1ad0:	6700 2a50      	beq.w 4522 <ZoomTest+0x2aca>
    1ad4:	2004           	move.l d4,d0
    1ad6:	0680 0000 3300 	addi.l #13056,d0
    1adc:	2044           	movea.l d4,a0
      *tmp4source++ = 0x55555555;
    1ade:	20bc 5555 5555 	move.l #1431655765,(a0)
    1ae4:	217c 5555 5555 	move.l #1431655765,4(a0)
    1aea:	0004 
    1aec:	217c 5555 5555 	move.l #1431655765,8(a0)
    1af2:	0008 
    1af4:	217c 5555 5555 	move.l #1431655765,12(a0)
    1afa:	000c 
    1afc:	217c 5555 5555 	move.l #1431655765,16(a0)
    1b02:	0010 
    1b04:	217c 5555 5555 	move.l #1431655765,20(a0)
    1b0a:	0014 
    1b0c:	217c 5555 5555 	move.l #1431655765,24(a0)
    1b12:	0018 
    1b14:	217c 5555 5555 	move.l #1431655765,28(a0)
    1b1a:	001c 
    1b1c:	217c 5555 5555 	move.l #1431655765,32(a0)
    1b22:	0020 
    1b24:	217c 5555 5555 	move.l #1431655765,36(a0)
    1b2a:	0024 
    1b2c:	217c 5555 5555 	move.l #1431655765,40(a0)
    1b32:	0028 
    1b34:	217c 5555 5555 	move.l #1431655765,44(a0)
    1b3a:	002c 
      *tmp4source++ = 0xaaaaaaaa;
    1b3c:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
    1b42:	0030 
    1b44:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
    1b4a:	0034 
    1b4c:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
    1b52:	0038 
    1b54:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
    1b5a:	003c 
    1b5c:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
    1b62:	0040 
    1b64:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
    1b6a:	0044 
    1b6c:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
    1b72:	0048 
    1b74:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
    1b7a:	004c 
    1b7c:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
    1b82:	0050 
    1b84:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
    1b8a:	0054 
    1b8c:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
    1b92:	0058 
    1b94:	41e8 0060      	lea 96(a0),a0
    1b98:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
    1b9e:	fffc 
  for(int i=0;i<128+8;i++) {
    1ba0:	b1c0           	cmpa.l d0,a0
    1ba2:	6600 ff3a      	bne.w 1ade <ZoomTest+0x86>
  WaitVbl();
    1ba6:	4eba fe6a      	jsr 1a12 <WaitVbl>(pc)
  Init_Blit();
    1baa:	4eba f8d2      	jsr 147e <Init_Blit>(pc)
    ZoomBlit_Increment4SrcA = 1;
    1bae:	33fc 0001 0001 	move.w #1,16a74 <ZoomBlit_Increment4SrcA>
    1bb4:	6a74 
  WaitBlit(); 
    1bb6:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    1bbc:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    1bc0:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
    1bc6:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1bcc:	317c fde4 0040 	move.w #-540,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1bd2:	317c fff8 0070 	move.w #-8,112(a0)
  AddIntServer(INTB_VERTB, vbint);
    1bd8:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1bde:	7005           	moveq #5,d0
    1be0:	224a           	movea.l a2,a1
    1be2:	4eae ff58      	jsr -168(a6)
  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    1be6:	4878 0005      	pea 5 <_start+0x5>
    1bea:	42a7           	clr.l -(sp)
    1bec:	2f05           	move.l d5,-(sp)
    1bee:	2f04           	move.l d4,-(sp)
    1bf0:	4eba f460      	jsr 1052 <Zoom_ZoomIntoPicture>(pc)
  RemIntServer(INTB_VERTB, vbint);
    1bf4:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1bfa:	7005           	moveq #5,d0
    1bfc:	224a           	movea.l a2,a1
    1bfe:	4eae ff52      	jsr -174(a6)
  if( Counter4Frames > 7)
    1c02:	4fef 0010      	lea 16(sp),sp
    1c06:	7007           	moveq #7,d0
    1c08:	b0b9 0001 6a86 	cmp.l 16a86 <Counter4Frames>,d0
    1c0e:	6c1e           	bge.s 1c2e <ZoomTest+0x1d6>
    Write( Output(), "TestSpeed4Zoom: Takes too long\n", 31);
    1c10:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1c16:	4eae ffc4      	jsr -60(a6)
    1c1a:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1c20:	2200           	move.l d0,d1
    1c22:	243c 0001 5020 	move.l #86048,d2
    1c28:	761f           	moveq #31,d3
    1c2a:	4eae ffd0      	jsr -48(a6)
  FreeMem( source, ( ZMLINESIZE+4)*272*5);
    1c2e:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1c34:	2244           	movea.l d4,a1
    1c36:	203c 0001 1440 	move.l #70720,d0
    1c3c:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, ( ZMLINESIZE+4)*272*5);
    1c40:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1c46:	2245           	movea.l d5,a1
    1c48:	203c 0001 1440 	move.l #70720,d0
    1c4e:	4eae ff2e      	jsr -210(a6)
  PrepareDisplayZoom();
    1c52:	47fa fbc0      	lea 1814 <PrepareDisplayZoom>(pc),a3
    1c56:	4e93           	jsr (a3)
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    1c58:	4878 0010      	pea 10 <main+0xa>
    1c5c:	4879 0001 66c8 	pea 166c8 <ClsSprites>
    1c62:	42a7           	clr.l -(sp)
    1c64:	2f39 0001 6a70 	move.l 16a70 <Copperlist1>,-(sp)
    1c6a:	49fa f148      	lea db4 <TestCopperlistBatch>(pc),a4
    1c6e:	4e94           	jsr (a4)
    1c70:	4fef 0010      	lea 16(sp),sp
    1c74:	4a80           	tst.l d0
    1c76:	661e           	bne.s 1c96 <ZoomTest+0x23e>
    Write( Output(), 
    1c78:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1c7e:	4eae ffc4      	jsr -60(a6)
    1c82:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1c88:	2200           	move.l d0,d1
    1c8a:	243c 0001 5040 	move.l #86080,d2
    1c90:	7645           	moveq #69,d3
    1c92:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    1c96:	4878 000c      	pea c <main+0x6>
    1c9a:	4879 0001 6698 	pea 16698 <ClScreen>
    1ca0:	4878 0010      	pea 10 <main+0xa>
    1ca4:	2f39 0001 6a70 	move.l 16a70 <Copperlist1>,-(sp)
    1caa:	4e94           	jsr (a4)
    1cac:	4fef 0010      	lea 16(sp),sp
    1cb0:	4a80           	tst.l d0
    1cb2:	661e           	bne.s 1cd2 <ZoomTest+0x27a>
    Write( Output(), 
    1cb4:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1cba:	4eae ffc4      	jsr -60(a6)
    1cbe:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1cc4:	2200           	move.l d0,d1
    1cc6:	243c 0001 5086 	move.l #86150,d2
    1ccc:	7646           	moveq #70,d3
    1cce:	4eae ffd0      	jsr -48(a6)

void Zoom_SetBplPointers() {
  ULONG plane2set = DrawBuffer;
  UWORD *posofcopper = (UWORD *)DrawCopper + ZMCOPBPL1HIGH;
    1cd2:	2079 0001 6a68 	movea.l 16a68 <DrawCopper>,a0
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    UWORD highword = (ULONG)plane2set >> 16;
    UWORD lowword = (ULONG)plane2set & 0xffff;
    *posofcopper = highword;
    1cd8:	317c 0004 0072 	move.w #4,114(a0)
    posofcopper += 2;
    *posofcopper = lowword;
    1cde:	4268 0076      	clr.w 118(a0)
    *posofcopper = highword;
    1ce2:	317c 0004 007a 	move.w #4,122(a0)
    *posofcopper = lowword;
    1ce8:	317c 0030 007e 	move.w #48,126(a0)
    *posofcopper = highword;
    1cee:	317c 0004 0082 	move.w #4,130(a0)
    *posofcopper = lowword;
    1cf4:	317c 0060 0086 	move.w #96,134(a0)
    *posofcopper = highword;
    1cfa:	317c 0004 008a 	move.w #4,138(a0)
    *posofcopper = lowword;
    1d00:	317c 0090 008e 	move.w #144,142(a0)
    *posofcopper = highword;
    1d06:	317c 0004 0092 	move.w #4,146(a0)
    *posofcopper = lowword;
    1d0c:	317c 00c0 0096 	move.w #192,150(a0)
    posofcopper += 2;
    plane2set += ZMLINESIZE; //Next plane (interleaved)
  }
  
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
    1d12:	23fc 0005 0000 	move.l #327680,16a76 <DrawBuffer>
    1d18:	0001 6a76 
  ViewBuffer = (ULONG *) tmp;
    1d1c:	23fc 0004 0000 	move.l #262144,16a6c <ViewBuffer>
    1d22:	0001 6a6c 
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    1d26:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    1d2c:	4878 001c      	pea 1c <main+0x16>
    1d30:	2f39 0001 6a70 	move.l 16a70 <Copperlist1>,-(sp)
    1d36:	45fa ed94      	lea acc <TestCopperlistPos>(pc),a2
    1d3a:	4e92           	jsr (a2)
    1d3c:	4fef 000c      	lea 12(sp),sp
    1d40:	4a80           	tst.l d0
    1d42:	661e           	bne.s 1d62 <ZoomTest+0x30a>
    Write(Output(), 
    1d44:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1d4a:	4eae ffc4      	jsr -60(a6)
    1d4e:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1d54:	2200           	move.l d0,d1
    1d56:	243c 0001 50cd 	move.l #86221,d2
    1d5c:	763c           	moveq #60,d3
    1d5e:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    1d62:	2f3c 00e2 0000 	move.l #14811136,-(sp)
    1d68:	4878 001d      	pea 1d <main+0x17>
    1d6c:	2f39 0001 6a70 	move.l 16a70 <Copperlist1>,-(sp)
    1d72:	4e92           	jsr (a2)
    1d74:	4fef 000c      	lea 12(sp),sp
    1d78:	4a80           	tst.l d0
    1d7a:	661e           	bne.s 1d9a <ZoomTest+0x342>
    Write(Output(), 
    1d7c:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1d82:	4eae ffc4      	jsr -60(a6)
    1d86:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1d8c:	2200           	move.l d0,d1
    1d8e:	243c 0001 510a 	move.l #86282,d2
    1d94:	763c           	moveq #60,d3
    1d96:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    1d9a:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    1da0:	4878 001e      	pea 1e <main+0x18>
    1da4:	2f39 0001 6a70 	move.l 16a70 <Copperlist1>,-(sp)
    1daa:	4e92           	jsr (a2)
    1dac:	4fef 000c      	lea 12(sp),sp
    1db0:	4a80           	tst.l d0
    1db2:	661e           	bne.s 1dd2 <ZoomTest+0x37a>
    Write(Output(), 
    1db4:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1dba:	4eae ffc4      	jsr -60(a6)
    1dbe:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1dc4:	2200           	move.l d0,d1
    1dc6:	243c 0001 5147 	move.l #86343,d2
    1dcc:	763c           	moveq #60,d3
    1dce:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e60030) == 0)
    1dd2:	2f3c 00e6 0030 	move.l #15073328,-(sp)
    1dd8:	4878 001f      	pea 1f <main+0x19>
    1ddc:	2f39 0001 6a70 	move.l 16a70 <Copperlist1>,-(sp)
    1de2:	4e92           	jsr (a2)
    1de4:	4fef 000c      	lea 12(sp),sp
    1de8:	4a80           	tst.l d0
    1dea:	661e           	bne.s 1e0a <ZoomTest+0x3b2>
    Write(Output(), 
    1dec:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1df2:	4eae ffc4      	jsr -60(a6)
    1df6:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1dfc:	2200           	move.l d0,d1
    1dfe:	243c 0001 5184 	move.l #86404,d2
    1e04:	763c           	moveq #60,d3
    1e06:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistBatch(  Copperlist1, 38, ClColor, 32) == 0)
    1e0a:	4878 0020      	pea 20 <main+0x1a>
    1e0e:	4879 0001 6618 	pea 16618 <ClColor>
    1e14:	4878 0026      	pea 26 <main+0x20>
    1e18:	2f39 0001 6a70 	move.l 16a70 <Copperlist1>,-(sp)
    1e1e:	4e94           	jsr (a4)
    1e20:	4fef 0010      	lea 16(sp),sp
    1e24:	4a80           	tst.l d0
    1e26:	661e           	bne.s 1e46 <ZoomTest+0x3ee>
    Write(Output(), "ZoomCopperlist: Colorpart messed up.\n", 37);
    1e28:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1e2e:	4eae ffc4      	jsr -60(a6)
    1e32:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1e38:	2200           	move.l d0,d1
    1e3a:	243c 0001 51c1 	move.l #86465,d2
    1e40:	7625           	moveq #37,d3
    1e42:	4eae ffd0      	jsr -48(a6)
  Zoom_Shrink102( 4, (UWORD *) Copperlist1+73*2);
    1e46:	2439 0001 6a70 	move.l 16a70 <Copperlist1>,d2
           0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 
           0x01800f00, 0x01800000 };*/

void Zoom_Shrink102( UWORD levelofshrink, UWORD *copperlist )  {
  UWORD *values4shift = Values4Shift+levelofshrink*30;
  copperlist+=3;
    1e4c:	2242           	movea.l d2,a1
    1e4e:	43e9 012a      	lea 298(a1),a1
  UWORD *values4shift = Values4Shift+levelofshrink*30;
    1e52:	41f9 0001 60f0 	lea 160f0 <Values4Shift+0xf0>,a0
  for(int i = 0; i<29;i++) {
    *copperlist = *values4shift++;
    1e58:	3298           	move.w (a0)+,(a1)
    copperlist += 2;
    1e5a:	5889           	addq.l #4,a1
  for(int i = 0; i<29;i++) {
    1e5c:	b1fc 0001 612a 	cmpa.l #90410,a0
    1e62:	66f4           	bne.s 1e58 <ZoomTest+0x400>
  }
  values4shift -= 29;
  copperlist += 12;
    1e64:	2242           	movea.l d2,a1
    1e66:	43e9 01b6      	lea 438(a1),a1
  values4shift -= 29;
    1e6a:	41f9 0001 60f0 	lea 160f0 <Values4Shift+0xf0>,a0
  for(int i = 0; i<29;i++) {
    *copperlist = *values4shift++;
    1e70:	3298           	move.w (a0)+,(a1)
    copperlist += 2;
    1e72:	5889           	addq.l #4,a1
  for(int i = 0; i<29;i++) {
    1e74:	b1fc 0001 612a 	cmpa.l #90410,a0
    1e7a:	66f4           	bne.s 1e70 <ZoomTest+0x418>
  }
  values4shift -= 29;
  copperlist += 8;
    1e7c:	2242           	movea.l d2,a1
    1e7e:	43e9 023a      	lea 570(a1),a1
  values4shift -= 29;
    1e82:	41f9 0001 60f0 	lea 160f0 <Values4Shift+0xf0>,a0
  
  for(int i = 0; i<29;i++) {
    *copperlist = *values4shift++;
    1e88:	3298           	move.w (a0)+,(a1)
    copperlist += 2;
    1e8a:	5889           	addq.l #4,a1
  for(int i = 0; i<29;i++) {
    1e8c:	b1fc 0001 612a 	cmpa.l #90410,a0
    1e92:	66f4           	bne.s 1e88 <ZoomTest+0x430>
  }
  values4shift -= 29;
  copperlist += 6;
    1e94:	2242           	movea.l d2,a1
    1e96:	43e9 02ba      	lea 698(a1),a1
  values4shift -= 29;
    1e9a:	41f9 0001 60f0 	lea 160f0 <Values4Shift+0xf0>,a0
  for(int i = 0; i<29;i++) {
    *copperlist = *values4shift++;
    1ea0:	3298           	move.w (a0)+,(a1)
    copperlist += 2;
    1ea2:	5889           	addq.l #4,a1
  for(int i = 0; i<29;i++) {
    1ea4:	b1fc 0001 612a 	cmpa.l #90410,a0
    1eaa:	66f4           	bne.s 1ea0 <ZoomTest+0x448>
  }
  UWORD *bp = 0x200;
  *bp = 0;
    1eac:	4278 0200      	clr.w 200 <main+0x1fa>
  if( TestCopperlistPos( cl2test, position, *template4cl) == 0)
    1eb0:	2f39 0001 63fc 	move.l 163fc <Cl102ZoomRepeat>,-(sp)
    1eb6:	4878 0049      	pea 49 <main+0x43>
    1eba:	2f02           	move.l d2,-(sp)
    1ebc:	4e92           	jsr (a2)
    1ebe:	4fef 000c      	lea 12(sp),sp
    1ec2:	4a80           	tst.l d0
    1ec4:	6600 24d2      	bne.w 4398 <ZoomTest+0x2940>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 37);
    1ec8:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1ece:	4eae ffc4      	jsr -60(a6)
    1ed2:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1ed8:	2200           	move.l d0,d1
    1eda:	243c 0001 51e7 	move.l #86503,d2
    1ee0:	7625           	moveq #37,d3
    1ee2:	4eae ffd0      	jsr -48(a6)
  if( TestCopperlistPos( Copperlist1, 73+133, 0xfffffffe) == 0)
    1ee6:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffd8214>
    1eea:	4878 00ce      	pea ce <main+0xc8>
    1eee:	2f39 0001 6a70 	move.l 16a70 <Copperlist1>,-(sp)
    1ef4:	4e92           	jsr (a2)
    1ef6:	4fef 000c      	lea 12(sp),sp
    1efa:	4a80           	tst.l d0
    1efc:	661e           	bne.s 1f1c <ZoomTest+0x4c4>
    Write( Output(), "ZoomCopperlist: Copperlist End not correctly set.\n", 50);
    1efe:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1f04:	4eae ffc4      	jsr -60(a6)
    1f08:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1f0e:	2200           	move.l d0,d1
    1f10:	243c 0001 520c 	move.l #86540,d2
    1f16:	7632           	moveq #50,d3
    1f18:	4eae ffd0      	jsr -48(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    1f1c:	2f3c 0001 6800 	move.l #92160,-(sp)
    1f22:	4878 591c      	pea 591c <incbin_startimage_start+0x990>
    1f26:	4bfa fa78      	lea 19a0 <FreeDisplay>(pc),a5
    1f2a:	4e95           	jsr (a5)
  Zoom_Init();
    1f2c:	49fa fa04      	lea 1932 <Zoom_Init>(pc),a4
    1f30:	4e94           	jsr (a4)
  PrepareDisplayZoom();
    1f32:	4e93           	jsr (a3)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    1f34:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1f3a:	203c 0000 c800 	move.l #51200,d0
    1f40:	7202           	moveq #2,d1
    1f42:	4eae ff3a      	jsr -198(a6)
    1f46:	2040           	movea.l d0,a0
    1f48:	23c0 0001 6a7a 	move.l d0,16a7a <Zoom_Source>
  if( Zoom_Source == 0) {
    1f4e:	508f           	addq.l #8,sp
    1f50:	6700 2542      	beq.w 4494 <ZoomTest+0x2a3c>
  *tstsource++ = 0x0000;
    1f54:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    1f56:	317c 0080 0002 	move.w #128,2(a0)
  *tstsource = 0x1000;
    1f5c:	317c 1000 0030 	move.w #4096,48(a0)
  *tstsource = 0x8e88;
    1f62:	317c 8e88 0032 	move.w #-29048,50(a0)
  *tstsource++ = 0x0000;
    1f68:	4268 17d0      	clr.w 6096(a0)
  *tstsource = 0x00ff;
    1f6c:	317c 00ff 17d2 	move.w #255,6098(a0)
  WaitBlit();
    1f72:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    1f78:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    1f7c:	4eba f500      	jsr 147e <Init_Blit>(pc)
    ZoomBlit_Increment4SrcA = 1;
    1f80:	33fc 0001 0001 	move.w #1,16a74 <ZoomBlit_Increment4SrcA>
    1f86:	6a74 
  WaitBlit(); 
    1f88:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    1f8e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    1f92:	2479 0001 6a7e 	movea.l 16a7e <hw>,a2
    1f98:	357c 0000 0042 	move.w #0,66(a2)
  hw->bltcon0 = 0xde4 + shifta;
    1f9e:	357c fde4 0040 	move.w #-540,64(a2)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1fa4:	357c ff00 0070 	move.w #-256,112(a2)
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    1faa:	2639 0001 6a76 	move.l 16a76 <DrawBuffer>,d3
    1fb0:	2439 0001 6a7a 	move.l 16a7a <Zoom_Source>,d2
  WaitBlt();
    1fb6:	4eba f084      	jsr 103c <WaitBlt>(pc)
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    1fba:	7000           	moveq #0,d0
    1fbc:	3039 0001 6a74 	move.w 16a74 <ZoomBlit_Increment4SrcA>,d0
    1fc2:	d080           	add.l d0,d0
    1fc4:	d082           	add.l d2,d0
    1fc6:	2540 0050      	move.l d0,80(a2)
  hw->bltbpt = source;
    1fca:	2542 004c      	move.l d2,76(a2)
  hw->bltdpt = destination;
    1fce:	2543 0054      	move.l d3,84(a2)
  hw->bltsize = height*64+2;
    1fd2:	357c 2002 0058 	move.w #8194,88(a2)
  WaitBlit();
    1fd8:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    1fde:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    1fe2:	2479 0001 6a76 	movea.l 16a76 <DrawBuffer>,a2
  if( *destination != 0x0180) {
    1fe8:	0c6a 0180 0002 	cmpi.w #384,2(a2)
    1fee:	671e           	beq.s 200e <ZoomTest+0x5b6>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    1ff0:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1ff6:	4eae ffc4      	jsr -60(a6)
    1ffa:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    2000:	2200           	move.l d0,d1
    2002:	243c 0001 5277 	move.l #86647,d2
    2008:	761c           	moveq #28,d3
    200a:	4eae ffd0      	jsr -48(a6)
  if( *destination != 0x1d88)
    200e:	0c6a 1d88 0032 	cmpi.w #7560,50(a2)
    2014:	671e           	beq.s 2034 <ZoomTest+0x5dc>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    2016:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    201c:	4eae ffc4      	jsr -60(a6)
    2020:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    2026:	2200           	move.l d0,d1
    2028:	243c 0001 5294 	move.l #86676,d2
    202e:	761c           	moveq #28,d3
    2030:	4eae ffd0      	jsr -48(a6)
  if( *destination != 0x01ff) {
    2034:	2079 0001 6a76 	movea.l 16a76 <DrawBuffer>,a0
    203a:	0c68 01ff 17d2 	cmpi.w #511,6098(a0)
    2040:	671e           	beq.s 2060 <ZoomTest+0x608>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    2042:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    2048:	4eae ffc4      	jsr -60(a6)
    204c:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    2052:	2200           	move.l d0,d1
    2054:	243c 0001 52b1 	move.l #86705,d2
    205a:	761a           	moveq #26,d3
    205c:	4eae ffd0      	jsr -48(a6)
  FreeMem( Zoom_Source, 40*256*5);
    2060:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    2066:	2279 0001 6a7a 	movea.l 16a7a <Zoom_Source>,a1
    206c:	203c 0000 c800 	move.l #51200,d0
    2072:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    2076:	2f3c 0001 6800 	move.l #92160,-(sp)
    207c:	4878 591c      	pea 591c <incbin_startimage_start+0x990>
    2080:	4e95           	jsr (a5)
    2082:	508f           	addq.l #8,sp
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    2084:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    208a:	203c 0000 05a0 	move.l #1440,d0
    2090:	7202           	moveq #2,d1
    2092:	4eae ff3a      	jsr -198(a6)
    2096:	2440           	movea.l d0,a2
  if( source == 0) {
    2098:	4a80           	tst.l d0
    209a:	6700 2362      	beq.w 43fe <ZoomTest+0x29a6>
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    209e:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    20a4:	203c 0000 05a0 	move.l #1440,d0
    20aa:	7202           	moveq #2,d1
    20ac:	4eae ff3a      	jsr -198(a6)
    20b0:	2640           	movea.l d0,a3
  if( destination == 0) {
    20b2:	4a80           	tst.l d0
    20b4:	6700 2348      	beq.w 43fe <ZoomTest+0x29a6>
    *tmp++ = 0;
    20b8:	4252           	clr.w (a2)
    *tmp++ = 0xaaaa;
    20ba:	357c aaaa 0002 	move.w #-21846,2(a2)
    *tmp++ = 0xaaaa;
    20c0:	357c aaaa 0004 	move.w #-21846,4(a2)
    *tmp = 0;
    20c6:	426a 0006      	clr.w 6(a2)
    *tmp++ = 0;
    20ca:	426a 0030      	clr.w 48(a2)
    *tmp++ = 0x5555;
    20ce:	357c 5555 0032 	move.w #21845,50(a2)
    *tmp++ = 0x5555;
    20d4:	357c 5555 0034 	move.w #21845,52(a2)
    *tmp = 0;
    20da:	426a 0036      	clr.w 54(a2)
    *tmp++ = 0;
    20de:	426a 0060      	clr.w 96(a2)
    *tmp++ = 0xaaaa;
    20e2:	357c aaaa 0062 	move.w #-21846,98(a2)
    *tmp++ = 0xaaaa;
    20e8:	357c aaaa 0064 	move.w #-21846,100(a2)
    *tmp = 0;
    20ee:	426a 0066      	clr.w 102(a2)
    *tmp++ = 0;
    20f2:	426a 0090      	clr.w 144(a2)
    *tmp++ = 0x5555;
    20f6:	357c 5555 0092 	move.w #21845,146(a2)
    *tmp++ = 0x5555;
    20fc:	357c 5555 0094 	move.w #21845,148(a2)
    *tmp = 0;
    2102:	426a 0096      	clr.w 150(a2)
    *tmp++ = 0;
    2106:	426a 00c0      	clr.w 192(a2)
    *tmp++ = 0xaaaa;
    210a:	357c aaaa 00c2 	move.w #-21846,194(a2)
    *tmp++ = 0xaaaa;
    2110:	357c aaaa 00c4 	move.w #-21846,196(a2)
    *tmp = 0;
    2116:	426a 00c6      	clr.w 198(a2)
    *tmp++ = 0;
    211a:	426a 00f0      	clr.w 240(a2)
    *tmp++ = 0x5555;
    211e:	357c 5555 00f2 	move.w #21845,242(a2)
    *tmp++ = 0x5555;
    2124:	357c 5555 00f4 	move.w #21845,244(a2)
    *tmp = 0;
    212a:	426a 00f6      	clr.w 246(a2)
    *tmp++ = 0;
    212e:	426a 0120      	clr.w 288(a2)
    *tmp++ = 0xaaaa;
    2132:	357c aaaa 0122 	move.w #-21846,290(a2)
    *tmp++ = 0xaaaa;
    2138:	357c aaaa 0124 	move.w #-21846,292(a2)
    *tmp = 0;
    213e:	426a 0126      	clr.w 294(a2)
    *tmp++ = 0;
    2142:	426a 0150      	clr.w 336(a2)
    *tmp++ = 0x5555;
    2146:	357c 5555 0152 	move.w #21845,338(a2)
    *tmp++ = 0x5555;
    214c:	357c 5555 0154 	move.w #21845,340(a2)
    *tmp = 0;
    2152:	426a 0156      	clr.w 342(a2)
    *tmp++ = 0;
    2156:	426a 0180      	clr.w 384(a2)
    *tmp++ = 0xaaaa;
    215a:	357c aaaa 0182 	move.w #-21846,386(a2)
    *tmp++ = 0xaaaa;
    2160:	357c aaaa 0184 	move.w #-21846,388(a2)
    *tmp = 0;
    2166:	426a 0186      	clr.w 390(a2)
    *tmp++ = 0;
    216a:	426a 01b0      	clr.w 432(a2)
    *tmp++ = 0x5555;
    216e:	357c 5555 01b2 	move.w #21845,434(a2)
    *tmp++ = 0x5555;
    2174:	357c 5555 01b4 	move.w #21845,436(a2)
    *tmp = 0;
    217a:	426a 01b6      	clr.w 438(a2)
    *tmp++ = 0;
    217e:	426a 01e0      	clr.w 480(a2)
    *tmp++ = 0xaaaa;
    2182:	357c aaaa 01e2 	move.w #-21846,482(a2)
    *tmp++ = 0xaaaa;
    2188:	357c aaaa 01e4 	move.w #-21846,484(a2)
    *tmp = 0;
    218e:	426a 01e6      	clr.w 486(a2)
    *tmp++ = 0;
    2192:	426a 0210      	clr.w 528(a2)
    *tmp++ = 0x5555;
    2196:	357c 5555 0212 	move.w #21845,530(a2)
    *tmp++ = 0x5555;
    219c:	357c 5555 0214 	move.w #21845,532(a2)
    *tmp = 0;
    21a2:	426a 0216      	clr.w 534(a2)
    *tmp++ = 0;
    21a6:	426a 0240      	clr.w 576(a2)
    *tmp++ = 0xaaaa;
    21aa:	357c aaaa 0242 	move.w #-21846,578(a2)
    *tmp++ = 0xaaaa;
    21b0:	357c aaaa 0244 	move.w #-21846,580(a2)
    *tmp = 0;
    21b6:	426a 0246      	clr.w 582(a2)
    *tmp++ = 0;
    21ba:	426a 0270      	clr.w 624(a2)
    *tmp++ = 0x5555;
    21be:	357c 5555 0272 	move.w #21845,626(a2)
    *tmp++ = 0x5555;
    21c4:	357c 5555 0274 	move.w #21845,628(a2)
    *tmp = 0;
    21ca:	426a 0276      	clr.w 630(a2)
    *tmp++ = 0;
    21ce:	426a 02a0      	clr.w 672(a2)
    *tmp++ = 0xaaaa;
    21d2:	357c aaaa 02a2 	move.w #-21846,674(a2)
    *tmp++ = 0xaaaa;
    21d8:	357c aaaa 02a4 	move.w #-21846,676(a2)
    *tmp = 0;
    21de:	426a 02a6      	clr.w 678(a2)
    *tmp++ = 0;
    21e2:	426a 02d0      	clr.w 720(a2)
    *tmp++ = 0x5555;
    21e6:	357c 5555 02d2 	move.w #21845,722(a2)
    *tmp++ = 0x5555;
    21ec:	357c 5555 02d4 	move.w #21845,724(a2)
    *tmp = 0;
    21f2:	426a 02d6      	clr.w 726(a2)
    tmp += ZMLINESIZE/2-3;
    21f6:	4878 05a0      	pea 5a0 <main+0x59a>
    21fa:	42a7           	clr.l -(sp)
    21fc:	2f00           	move.l d0,-(sp)
    21fe:	4eba 23d6      	jsr 45d6 <memset>(pc)
  WaitBlit();
    2202:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    2208:	4eae ff1c      	jsr -228(a6)
  Zoom_Init();
    220c:	4e94           	jsr (a4)
  WaitBlit();
    220e:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    2214:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
    2218:	2879 0001 6a7e 	movea.l 16a7e <hw>,a4
    221e:	397c 39f0 0040 	move.w #14832,64(a4)
  hw->bltcon1 = 0;
    2224:	397c 0000 0042 	move.w #0,66(a4)
  WaitBlt();
    222a:	4eba ee10      	jsr 103c <WaitBlt>(pc)
  hw->bltapt = (UWORD *) source;
    222e:	200a           	move.l a2,d0
    2230:	5480           	addq.l #2,d0
    2232:	2940 0050      	move.l d0,80(a4)
  hw->bltdpt = (UWORD *) destination;
    2236:	294b 0054      	move.l a3,84(a4)
  hw->bltsize = height*64+2;
    223a:	397c 0402 0058 	move.w #1026,88(a4)
  WaitBlit();
    2240:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    2246:	4eae ff1c      	jsr -228(a6)
  if( *tmp != 0x5555) 
    224a:	4fef 000c      	lea 12(sp),sp
    224e:	0c6b 5555 0002 	cmpi.w #21845,2(a3)
    2254:	671e           	beq.s 2274 <ZoomTest+0x81c>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    2256:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    225c:	4eae ffc4      	jsr -60(a6)
    2260:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    2266:	2200           	move.l d0,d1
    2268:	243c 0001 5302 	move.l #86786,d2
    226e:	761f           	moveq #31,d3
    2270:	4eae ffd0      	jsr -48(a6)
  if( *tmp != 0xaaaa)
    2274:	0c6b aaaa 0032 	cmpi.w #-21846,50(a3)
    227a:	671e           	beq.s 229a <ZoomTest+0x842>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    227c:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    2282:	4eae ffc4      	jsr -60(a6)
    2286:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    228c:	2200           	move.l d0,d1
    228e:	243c 0001 5322 	move.l #86818,d2
    2294:	7620           	moveq #32,d3
    2296:	4eae ffd0      	jsr -48(a6)
  FreeMem( source,ZMLINESIZE*30);
    229a:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    22a0:	224a           	movea.l a2,a1
    22a2:	203c 0000 05a0 	move.l #1440,d0
    22a8:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    22ac:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    22b2:	224b           	movea.l a3,a1
    22b4:	203c 0000 05a0 	move.l #1440,d0
    22ba:	4eae ff2e      	jsr -210(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    22be:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    22c4:	203c 0000 3740 	move.l #14144,d0
    22ca:	7202           	moveq #2,d1
    22cc:	4eae ff3a      	jsr -198(a6)
    22d0:	2600           	move.l d0,d3
  if( source == 0) {
    22d2:	6700 2160      	beq.w 4434 <ZoomTest+0x29dc>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    22d6:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    22dc:	203c 0000 3740 	move.l #14144,d0
    22e2:	7202           	moveq #2,d1
    22e4:	4eae ff3a      	jsr -198(a6)
    22e8:	2840           	movea.l d0,a4
  if( destination == 0) {
    22ea:	4a80           	tst.l d0
    22ec:	6700 21ea      	beq.w 44d8 <ZoomTest+0x2a80>
    22f0:	2003           	move.l d3,d0
    22f2:	0680 0000 3300 	addi.l #13056,d0
    22f8:	2043           	movea.l d3,a0
      *tmp4source++ = 0x55555555;
    22fa:	20bc 5555 5555 	move.l #1431655765,(a0)
    2300:	217c 5555 5555 	move.l #1431655765,4(a0)
    2306:	0004 
    2308:	217c 5555 5555 	move.l #1431655765,8(a0)
    230e:	0008 
    2310:	217c 5555 5555 	move.l #1431655765,12(a0)
    2316:	000c 
    2318:	217c 5555 5555 	move.l #1431655765,16(a0)
    231e:	0010 
    2320:	217c 5555 5555 	move.l #1431655765,20(a0)
    2326:	0014 
    2328:	217c 5555 5555 	move.l #1431655765,24(a0)
    232e:	0018 
    2330:	217c 5555 5555 	move.l #1431655765,28(a0)
    2336:	001c 
    2338:	217c 5555 5555 	move.l #1431655765,32(a0)
    233e:	0020 
    2340:	217c 5555 5555 	move.l #1431655765,36(a0)
    2346:	0024 
    2348:	217c 5555 5555 	move.l #1431655765,40(a0)
    234e:	0028 
    2350:	217c 5555 5555 	move.l #1431655765,44(a0)
    2356:	002c 
      *tmp4source++ = 0xaaaaaaaa;
    2358:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
    235e:	0030 
    2360:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
    2366:	0034 
    2368:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
    236e:	0038 
    2370:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
    2376:	003c 
    2378:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
    237e:	0040 
    2380:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
    2386:	0044 
    2388:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
    238e:	0048 
    2390:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
    2396:	004c 
    2398:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
    239e:	0050 
    23a0:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
    23a6:	0054 
    23a8:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
    23ae:	0058 
    23b0:	41e8 0060      	lea 96(a0),a0
    23b4:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
    23ba:	fffc 
  for(int i=0;i<128+8;i++) {
    23bc:	b1c0           	cmpa.l d0,a0
    23be:	6600 ff3a      	bne.w 22fa <ZoomTest+0x8a2>
  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    23c2:	4878 0001      	pea 1 <_start+0x1>
    23c6:	42a7           	clr.l -(sp)
    23c8:	2f0c           	move.l a4,-(sp)
    23ca:	2f03           	move.l d3,-(sp)
    23cc:	4eba ec84      	jsr 1052 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    23d0:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    23d6:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    23da:	41ec 0004      	lea 4(a4),a0
    23de:	2f48 0044      	move.l a0,68(sp)
  for(int i=0;i<14;i++) {
    23e2:	41ec 0364      	lea 868(a4),a0
    23e6:	2f48 004c      	move.l a0,76(sp)
    23ea:	2a08           	move.l a0,d5
    23ec:	4fef 0010      	lea 16(sp),sp
  UWORD *valactual = destination+2; 
    23f0:	367c 0012      	movea.w #18,a3
  UWORD mask = 0xffff;
    23f4:	74ff           	moveq #-1,d2
    23f6:	7800           	moveq #0,d4
    23f8:	4644           	not.w d4
    23fa:	4bfa e5b2      	lea 9ae <TestRow>(pc),a5
    23fe:	2445           	movea.l d5,a2
    2400:	45ea fca0      	lea -864(a2),a2
    2404:	4deb ffee      	lea -18(a3),a6
      TestRow( valsupposed, valactual, mask, i2+i*19);
    2408:	2f0e           	move.l a6,-(sp)
    240a:	2f04           	move.l d4,-(sp)
    240c:	2f0a           	move.l a2,-(sp)
    240e:	4879 0001 69f4 	pea 169f4 <destlinezoom1>
    2414:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2416:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    241a:	4642           	not.w d2
    241c:	528e           	addq.l #1,a6
    for(int i2=0;i2<18;i2++) { 
    241e:	4fef 0010      	lea 16(sp),sp
    2422:	ba8a           	cmp.l a2,d5
    2424:	6600 1888      	bne.w 3cae <ZoomTest+0x2256>
    TestRow( valsupposed, valactual, mask, 18+i*19);
    2428:	2f0b           	move.l a3,-(sp)
    242a:	7800           	moveq #0,d4
    242c:	3802           	move.w d2,d4
    242e:	2f04           	move.l d4,-(sp)
    2430:	2f0a           	move.l a2,-(sp)
    2432:	4879 0001 69f4 	pea 169f4 <destlinezoom1>
    2438:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    243a:	2a0a           	move.l a2,d5
    243c:	0685 0000 0390 	addi.l #912,d5
    2442:	47eb 0013      	lea 19(a3),a3
  for(int i=0;i<14;i++) {
    2446:	4fef 0010      	lea 16(sp),sp
    244a:	b6fc 011c      	cmpa.w #284,a3
    244e:	66ae           	bne.s 23fe <ZoomTest+0x9a6>
    2450:	41ec 31e4      	lea 12772(a4),a0
    2454:	2f48 0030      	move.l a0,48(sp)
    2458:	2448           	movea.l a0,a2
    245a:	2a3c 0000 0109 	move.l #265,d5
    TestRow( valsupposed, valactual, mask, i2+265);
    2460:	2f05           	move.l d5,-(sp)
    2462:	2f04           	move.l d4,-(sp)
    2464:	2f0a           	move.l a2,-(sp)
    2466:	4879 0001 69f4 	pea 169f4 <destlinezoom1>
    246c:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    246e:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2472:	4642           	not.w d2
    2474:	5285           	addq.l #1,d5
  for(int i2=0;i2<4;i2++) { 
    2476:	4fef 0010      	lea 16(sp),sp
    247a:	0c85 0000 010d 	cmpi.l #269,d5
    2480:	6726           	beq.s 24a8 <ZoomTest+0xa50>
    2482:	7800           	moveq #0,d4
    2484:	3802           	move.w d2,d4
    TestRow( valsupposed, valactual, mask, i2+265);
    2486:	2f05           	move.l d5,-(sp)
    2488:	2f04           	move.l d4,-(sp)
    248a:	2f0a           	move.l a2,-(sp)
    248c:	4879 0001 69f4 	pea 169f4 <destlinezoom1>
    2492:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2494:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2498:	4642           	not.w d2
    249a:	5285           	addq.l #1,d5
  for(int i2=0;i2<4;i2++) { 
    249c:	4fef 0010      	lea 16(sp),sp
    24a0:	0c85 0000 010d 	cmpi.l #269,d5
    24a6:	66da           	bne.s 2482 <ZoomTest+0xa2a>
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    24a8:	4878 0001      	pea 1 <_start+0x1>
    24ac:	4878 0001      	pea 1 <_start+0x1>
    24b0:	2f03           	move.l d3,-(sp)
    24b2:	2f0c           	move.l a4,-(sp)
    24b4:	4eba eb9c      	jsr 1052 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    24b8:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    24be:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    24c2:	2003           	move.l d3,d0
    24c4:	5880           	addq.l #4,d0
    24c6:	2f40 003c      	move.l d0,60(sp)
    24ca:	4fef 0010      	lea 16(sp),sp
    24ce:	2440           	movea.l d0,a2
  for(int i2=0;i2<11;i2++) { 
    24d0:	7800           	moveq #0,d4
  mask = 0x0000;
    24d2:	4242           	clr.w d2
    TestRow( valsupposed, valactual, mask, i2);
    24d4:	2f04           	move.l d4,-(sp)
    24d6:	3f02           	move.w d2,-(sp)
    24d8:	4267           	clr.w -(sp)
    24da:	2f0a           	move.l a2,-(sp)
    24dc:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    24e2:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    24e4:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    24e8:	4642           	not.w d2
  for(int i2=0;i2<11;i2++) { 
    24ea:	5284           	addq.l #1,d4
    24ec:	4fef 0010      	lea 16(sp),sp
    24f0:	720b           	moveq #11,d1
    24f2:	b284           	cmp.l d4,d1
    24f4:	66de           	bne.s 24d4 <ZoomTest+0xa7c>
  TestRow( valsupposed, valactual, 0xffff, 8);
    24f6:	4878 0008      	pea 8 <main+0x2>
    24fa:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2500:	2003           	move.l d3,d0
    2502:	0680 0000 0214 	addi.l #532,d0
    2508:	2f40 005c      	move.l d0,92(sp)
    250c:	2f00           	move.l d0,-(sp)
    250e:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    2514:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 9);
    2516:	4878 0009      	pea 9 <main+0x3>
    251a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2520:	2043           	movea.l d3,a0
    2522:	4868 0244      	pea 580(a0)
    2526:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    252c:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 10);
    252e:	4fef 0020      	lea 32(sp),sp
    2532:	4878 000a      	pea a <main+0x4>
    2536:	42a7           	clr.l -(sp)
    2538:	2043           	movea.l d3,a0
    253a:	4868 0274      	pea 628(a0)
    253e:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    2544:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 11);
    2546:	4878 000b      	pea b <main+0x5>
    254a:	42a7           	clr.l -(sp)
    254c:	2043           	movea.l d3,a0
    254e:	4868 02a4      	pea 676(a0)
    2552:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    2558:	4e95           	jsr (a5)
  for(int i=0;i<12;i++) {
    255a:	2c03           	move.l d3,d6
    255c:	0686 0000 05d4 	addi.l #1492,d6
    2562:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0x0000, 11);
    2566:	2e06           	move.l d6,d7
    2568:	367c 0018      	movea.w #24,a3
    256c:	7a00           	moveq #0,d5
    256e:	3a02           	move.w d2,d5
    2570:	2447           	movea.l d7,a2
    2572:	45ea fd00      	lea -768(a2),a2
    2576:	4deb fff3      	lea -13(a3),a6
    257a:	2805           	move.l d5,d4
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    257c:	2f0e           	move.l a6,-(sp)
    257e:	2f04           	move.l d4,-(sp)
    2580:	2f0a           	move.l a2,-(sp)
    2582:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    2588:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    258a:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    258e:	4642           	not.w d2
    2590:	528e           	addq.l #1,a6
    for(int i2=0;i2<16;i2++) {  
    2592:	4fef 0010      	lea 16(sp),sp
    2596:	be8a           	cmp.l a2,d7
    2598:	6722           	beq.s 25bc <ZoomTest+0xb64>
    259a:	7800           	moveq #0,d4
    259c:	3802           	move.w d2,d4
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    259e:	2f0e           	move.l a6,-(sp)
    25a0:	2f04           	move.l d4,-(sp)
    25a2:	2f0a           	move.l a2,-(sp)
    25a4:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    25aa:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    25ac:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    25b0:	4642           	not.w d2
    25b2:	528e           	addq.l #1,a6
    for(int i2=0;i2<16;i2++) {  
    25b4:	4fef 0010      	lea 16(sp),sp
    25b8:	be8a           	cmp.l a2,d7
    25ba:	66de           	bne.s 259a <ZoomTest+0xb42>
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    25bc:	7a00           	moveq #0,d5
    25be:	3a02           	move.w d2,d5
    25c0:	2f0b           	move.l a3,-(sp)
    25c2:	2f05           	move.l d5,-(sp)
    25c4:	2f0a           	move.l a2,-(sp)
    25c6:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    25cc:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    25ce:	486b 0001      	pea 1(a3)
    25d2:	2f05           	move.l d5,-(sp)
    25d4:	486a 0030      	pea 48(a2)
    25d8:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    25de:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    25e0:	4fef 0020      	lea 32(sp),sp
    25e4:	486b 0002      	pea 2(a3)
    25e8:	2f04           	move.l d4,-(sp)
    25ea:	486a 0060      	pea 96(a2)
    25ee:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    25f4:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    25f6:	486b 0003      	pea 3(a3)
    25fa:	2f04           	move.l d4,-(sp)
    25fc:	486a 0090      	pea 144(a2)
    2600:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    2606:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2608:	2e0a           	move.l a2,d7
    260a:	0687 0000 03c0 	addi.l #960,d7
    2610:	47eb 0011      	lea 17(a3),a3
  for(int i=0;i<12;i++) {
    2614:	4fef 0020      	lea 32(sp),sp
    2618:	b6fc 00e4      	cmpa.w #228,a3
    261c:	6600 ff52      	bne.w 2570 <ZoomTest+0xb18>
    2620:	2003           	move.l d3,d0
    2622:	0680 0000 2fd4 	addi.l #12244,d0
    2628:	2f40 0068      	move.l d0,104(sp)
    262c:	2440           	movea.l d0,a2
  for(int i2=0;i2<15;i2++) { 
    262e:	7800           	moveq #0,d4
    TestRow( valsupposed, valactual, mask, i2);
    2630:	2f04           	move.l d4,-(sp)
    2632:	2f05           	move.l d5,-(sp)
    2634:	2f0a           	move.l a2,-(sp)
    2636:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    263c:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    263e:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2642:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    2644:	5284           	addq.l #1,d4
    2646:	4fef 0010      	lea 16(sp),sp
    264a:	720f           	moveq #15,d1
    264c:	b284           	cmp.l d4,d1
    264e:	6724           	beq.s 2674 <ZoomTest+0xc1c>
    2650:	7a00           	moveq #0,d5
    2652:	3a02           	move.w d2,d5
    TestRow( valsupposed, valactual, mask, i2);
    2654:	2f04           	move.l d4,-(sp)
    2656:	2f05           	move.l d5,-(sp)
    2658:	2f0a           	move.l a2,-(sp)
    265a:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    2660:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2662:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2666:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    2668:	5284           	addq.l #1,d4
    266a:	4fef 0010      	lea 16(sp),sp
    266e:	720f           	moveq #15,d1
    2670:	b284           	cmp.l d4,d1
    2672:	66dc           	bne.s 2650 <ZoomTest+0xbf8>
  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    2674:	4878 0001      	pea 1 <_start+0x1>
    2678:	4878 0002      	pea 2 <_start+0x2>
    267c:	2f0c           	move.l a4,-(sp)
    267e:	2f03           	move.l d3,-(sp)
    2680:	4eba e9d0      	jsr 1052 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2684:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    268a:	4eae ff1c      	jsr -228(a6)
    268e:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    2692:	246f 0034      	movea.l 52(sp),a2
  for(int i2=0;i2<4;i2++) { 
    2696:	7400           	moveq #0,d2
  mask = 0xffff;
    2698:	78ff           	moveq #-1,d4
    TestRow( valsupposed, valactual, mask, i2);
    269a:	2f02           	move.l d2,-(sp)
    269c:	3f04           	move.w d4,-(sp)
    269e:	4267           	clr.w -(sp)
    26a0:	2f0a           	move.l a2,-(sp)
    26a2:	4879 0001 699c 	pea 1699c <destlinezoom3>
    26a8:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    26aa:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    26ae:	4644           	not.w d4
  for(int i2=0;i2<4;i2++) { 
    26b0:	5282           	addq.l #1,d2
    26b2:	4fef 0010      	lea 16(sp),sp
    26b6:	7004           	moveq #4,d0
    26b8:	b082           	cmp.l d2,d0
    26ba:	66de           	bne.s 269a <ZoomTest+0xc42>
  TestRow( valsupposed, valactual, 0xffff, 0+4);
    26bc:	4878 0004      	pea 4 <_start+0x4>
    26c0:	2f3c 0000 ffff 	move.l #65535,-(sp)
    26c6:	486c 00c4      	pea 196(a4)
    26ca:	4879 0001 699c 	pea 1699c <destlinezoom3>
    26d0:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    26d2:	4878 0005      	pea 5 <_start+0x5>
    26d6:	2f3c 0000 ffff 	move.l #65535,-(sp)
    26dc:	486c 00f4      	pea 244(a4)
    26e0:	4879 0001 699c 	pea 1699c <destlinezoom3>
    26e6:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    26e8:	4fef 0020      	lea 32(sp),sp
    26ec:	4878 0006      	pea 6 <main>
    26f0:	42a7           	clr.l -(sp)
  valactual += ZMLINESIZE/2;
    26f2:	41ec 0124      	lea 292(a4),a0
    26f6:	2f48 006c      	move.l a0,108(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    26fa:	2f08           	move.l a0,-(sp)
    26fc:	4879 0001 699c 	pea 1699c <destlinezoom3>
    2702:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    2704:	4878 0007      	pea 7 <main+0x1>
    2708:	42a7           	clr.l -(sp)
    270a:	486c 0154      	pea 340(a4)
    270e:	4879 0001 699c 	pea 1699c <destlinezoom3>
    2714:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    2716:	4fef 0020      	lea 32(sp),sp
    271a:	4878 0008      	pea 8 <main+0x2>
    271e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2724:	486c 0184      	pea 388(a4)
    2728:	4879 0001 699c 	pea 1699c <destlinezoom3>
    272e:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    2730:	4878 0009      	pea 9 <main+0x3>
    2734:	2f3c 0000 ffff 	move.l #65535,-(sp)
    273a:	486c 01b4      	pea 436(a4)
    273e:	4879 0001 699c 	pea 1699c <destlinezoom3>
    2744:	4e95           	jsr (a5)
  for(int i=0;i<12;i++) {
    2746:	280c           	move.l a4,d4
    2748:	0684 0000 04b4 	addi.l #1204,d4
    274e:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    2752:	367c 0018      	movea.w #24,a3
    2756:	7a00           	moveq #0,d5
    2758:	74ff           	moveq #-1,d2
    275a:	2444           	movea.l d4,a2
    275c:	45ea fd30      	lea -720(a2),a2
    2760:	4deb fff1      	lea -15(a3),a6
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    2764:	2f0e           	move.l a6,-(sp)
    2766:	2f05           	move.l d5,-(sp)
    2768:	2f0a           	move.l a2,-(sp)
    276a:	4879 0001 699c 	pea 1699c <destlinezoom3>
    2770:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2772:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2776:	528e           	addq.l #1,a6
    for(int i2=0;i2<15;i2++) {  
    2778:	4fef 0010      	lea 16(sp),sp
    277c:	b88a           	cmp.l a2,d4
    277e:	6722           	beq.s 27a2 <ZoomTest+0xd4a>
    2780:	7a00           	moveq #0,d5
    2782:	3a02           	move.w d2,d5
    2784:	4642           	not.w d2
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    2786:	2f0e           	move.l a6,-(sp)
    2788:	2f05           	move.l d5,-(sp)
    278a:	2f0a           	move.l a2,-(sp)
    278c:	4879 0001 699c 	pea 1699c <destlinezoom3>
    2792:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2794:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2798:	528e           	addq.l #1,a6
    for(int i2=0;i2<15;i2++) {  
    279a:	4fef 0010      	lea 16(sp),sp
    279e:	b88a           	cmp.l a2,d4
    27a0:	66de           	bne.s 2780 <ZoomTest+0xd28>
    TestRow( valsupposed, valactual, mask, i*21+9+15);
    27a2:	7800           	moveq #0,d4
    27a4:	3802           	move.w d2,d4
    27a6:	2f0b           	move.l a3,-(sp)
    27a8:	2f04           	move.l d4,-(sp)
    27aa:	2f0a           	move.l a2,-(sp)
    27ac:	4879 0001 699c 	pea 1699c <destlinezoom3>
    27b2:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    27b4:	486b 0001      	pea 1(a3)
    27b8:	2f04           	move.l d4,-(sp)
    27ba:	486a 0030      	pea 48(a2)
    27be:	4879 0001 699c 	pea 1699c <destlinezoom3>
    27c4:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    27c6:	4fef 0020      	lea 32(sp),sp
    27ca:	486b 0002      	pea 2(a3)
    27ce:	2f05           	move.l d5,-(sp)
    27d0:	486a 0060      	pea 96(a2)
    27d4:	4879 0001 699c 	pea 1699c <destlinezoom3>
    27da:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    27dc:	486b 0003      	pea 3(a3)
    27e0:	2f05           	move.l d5,-(sp)
    27e2:	486a 0090      	pea 144(a2)
    27e6:	4879 0001 699c 	pea 1699c <destlinezoom3>
    27ec:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    27ee:	4fef 0020      	lea 32(sp),sp
    27f2:	486b 0004      	pea 4(a3)
    27f6:	2f04           	move.l d4,-(sp)
    27f8:	486a 00c0      	pea 192(a2)
    27fc:	4879 0001 699c 	pea 1699c <destlinezoom3>
    2802:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    2804:	486b 0005      	pea 5(a3)
    2808:	2f04           	move.l d4,-(sp)
    280a:	486a 00f0      	pea 240(a2)
    280e:	4879 0001 699c 	pea 1699c <destlinezoom3>
    2814:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2816:	280a           	move.l a2,d4
    2818:	0684 0000 03f0 	addi.l #1008,d4
    281e:	47eb 0015      	lea 21(a3),a3
  for(int i=0;i<12;i++) {
    2822:	4fef 0020      	lea 32(sp),sp
    2826:	b6fc 0114      	cmpa.w #276,a3
    282a:	6600 ff2e      	bne.w 275a <ZoomTest+0xd02>
    282e:	45ec 3124      	lea 12580(a4),a2
    2832:	283c 0000 0105 	move.l #261,d4
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    2838:	2f04           	move.l d4,-(sp)
    283a:	2f05           	move.l d5,-(sp)
    283c:	2f0a           	move.l a2,-(sp)
    283e:	4879 0001 699c 	pea 1699c <destlinezoom3>
    2844:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2846:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    284a:	5284           	addq.l #1,d4
  for(int i2=0;i2<8;i2++) {  
    284c:	4fef 0010      	lea 16(sp),sp
    2850:	0c84 0000 010d 	cmpi.l #269,d4
    2856:	6726           	beq.s 287e <ZoomTest+0xe26>
    2858:	7a00           	moveq #0,d5
    285a:	3a02           	move.w d2,d5
    285c:	4642           	not.w d2
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    285e:	2f04           	move.l d4,-(sp)
    2860:	2f05           	move.l d5,-(sp)
    2862:	2f0a           	move.l a2,-(sp)
    2864:	4879 0001 699c 	pea 1699c <destlinezoom3>
    286a:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    286c:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2870:	5284           	addq.l #1,d4
  for(int i2=0;i2<8;i2++) {  
    2872:	4fef 0010      	lea 16(sp),sp
    2876:	0c84 0000 010d 	cmpi.l #269,d4
    287c:	66da           	bne.s 2858 <ZoomTest+0xe00>
  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    287e:	4878 0001      	pea 1 <_start+0x1>
    2882:	4878 0003      	pea 3 <_start+0x3>
    2886:	2f03           	move.l d3,-(sp)
    2888:	2f0c           	move.l a4,-(sp)
    288a:	4eba e7c6      	jsr 1052 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    288e:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    2894:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    2898:	4878 0007      	pea 7 <main+0x1>
    289c:	42a7           	clr.l -(sp)
    289e:	2f2f 0044      	move.l 68(sp),-(sp)
    28a2:	4879 0001 6970 	pea 16970 <destlinezoom4>
    28a8:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    28aa:	7034           	moveq #52,d0
    28ac:	d083           	add.l d3,d0
    28ae:	2f40 0060      	move.l d0,96(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    28b2:	4fef 0020      	lea 32(sp),sp
    28b6:	4878 0008      	pea 8 <main+0x2>
    28ba:	2f3c 0000 ffff 	move.l #65535,-(sp)
    28c0:	2f00           	move.l d0,-(sp)
    28c2:	4879 0001 6970 	pea 16970 <destlinezoom4>
    28c8:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    28ca:	7264           	moveq #100,d1
    28cc:	d283           	add.l d3,d1
    28ce:	2f41 0060      	move.l d1,96(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    28d2:	4878 0009      	pea 9 <main+0x3>
    28d6:	2f3c 0000 ffff 	move.l #65535,-(sp)
    28dc:	2f01           	move.l d1,-(sp)
    28de:	4879 0001 6970 	pea 16970 <destlinezoom4>
    28e4:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    28e6:	2003           	move.l d3,d0
    28e8:	0680 0000 0094 	addi.l #148,d0
    28ee:	2f40 0058      	move.l d0,88(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    28f2:	4fef 0020      	lea 32(sp),sp
    28f6:	4878 0008      	pea 8 <main+0x2>
    28fa:	42a7           	clr.l -(sp)
    28fc:	2f00           	move.l d0,-(sp)
    28fe:	4879 0001 6970 	pea 16970 <destlinezoom4>
    2904:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    2906:	4878 0009      	pea 9 <main+0x3>
    290a:	42a7           	clr.l -(sp)
    290c:	2043           	movea.l d3,a0
    290e:	4868 00c4      	pea 196(a0)
    2912:	4879 0001 6970 	pea 16970 <destlinezoom4>
    2918:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    291a:	2003           	move.l d3,d0
    291c:	0680 0000 00f4 	addi.l #244,d0
    2922:	2f40 0064      	move.l d0,100(sp)
  for(int i=0;i<12;i++) {
    2926:	2e03           	move.l d3,d7
    2928:	0687 0000 0394 	addi.l #916,d7
    292e:	4fef 0020      	lea 32(sp),sp
  valactual += ZMLINESIZE/2;
    2932:	367c 0018      	movea.w #24,a3
  mask = 0xffff;
    2936:	7aff           	moveq #-1,d5
    2938:	7400           	moveq #0,d2
    293a:	4642           	not.w d2
    293c:	2447           	movea.l d7,a2
    293e:	45ea fd60      	lea -672(a2),a2
    2942:	4deb fff1      	lea -15(a3),a6
    2946:	2802           	move.l d2,d4
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    2948:	2f0e           	move.l a6,-(sp)
    294a:	2f04           	move.l d4,-(sp)
    294c:	2f0a           	move.l a2,-(sp)
    294e:	4879 0001 6970 	pea 16970 <destlinezoom4>
    2954:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2956:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    295a:	4645           	not.w d5
    295c:	528e           	addq.l #1,a6
    for(int i2=0;i2<14;i2++) {  
    295e:	4fef 0010      	lea 16(sp),sp
    2962:	be8a           	cmp.l a2,d7
    2964:	6722           	beq.s 2988 <ZoomTest+0xf30>
    2966:	7800           	moveq #0,d4
    2968:	3805           	move.w d5,d4
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    296a:	2f0e           	move.l a6,-(sp)
    296c:	2f04           	move.l d4,-(sp)
    296e:	2f0a           	move.l a2,-(sp)
    2970:	4879 0001 6970 	pea 16970 <destlinezoom4>
    2976:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2978:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    297c:	4645           	not.w d5
    297e:	528e           	addq.l #1,a6
    for(int i2=0;i2<14;i2++) {  
    2980:	4fef 0010      	lea 16(sp),sp
    2984:	be8a           	cmp.l a2,d7
    2986:	66de           	bne.s 2966 <ZoomTest+0xf0e>
    TestRow( valsupposed, valactual, mask, i*21+9+15);
    2988:	7400           	moveq #0,d2
    298a:	3405           	move.w d5,d2
    298c:	2f0b           	move.l a3,-(sp)
    298e:	2f02           	move.l d2,-(sp)
    2990:	2f0a           	move.l a2,-(sp)
    2992:	4879 0001 6970 	pea 16970 <destlinezoom4>
    2998:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    299a:	486b 0001      	pea 1(a3)
    299e:	2f02           	move.l d2,-(sp)
    29a0:	486a 0030      	pea 48(a2)
    29a4:	4879 0001 6970 	pea 16970 <destlinezoom4>
    29aa:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    29ac:	4fef 0020      	lea 32(sp),sp
    29b0:	486b 0002      	pea 2(a3)
    29b4:	2f04           	move.l d4,-(sp)
    29b6:	486a 0060      	pea 96(a2)
    29ba:	4879 0001 6970 	pea 16970 <destlinezoom4>
    29c0:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    29c2:	486b 0003      	pea 3(a3)
    29c6:	2f04           	move.l d4,-(sp)
    29c8:	486a 0090      	pea 144(a2)
    29cc:	4879 0001 6970 	pea 16970 <destlinezoom4>
    29d2:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    29d4:	4deb 0004      	lea 4(a3),a6
    29d8:	4fef 001c      	lea 28(sp),sp
    29dc:	2e8e           	move.l a6,(sp)
    29de:	2f02           	move.l d2,-(sp)
    29e0:	486a 00c0      	pea 192(a2)
    29e4:	4879 0001 6970 	pea 16970 <destlinezoom4>
    29ea:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    29ec:	2e0b           	move.l a3,d7
    29ee:	5a87           	addq.l #5,d7
    29f0:	2f07           	move.l d7,-(sp)
    29f2:	2f02           	move.l d2,-(sp)
    29f4:	486a 00f0      	pea 240(a2)
    29f8:	4879 0001 6970 	pea 16970 <destlinezoom4>
    29fe:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    2a00:	4fef 001c      	lea 28(sp),sp
    2a04:	2e8e           	move.l a6,(sp)
    2a06:	2f04           	move.l d4,-(sp)
    2a08:	486a 0120      	pea 288(a2)
    2a0c:	4879 0001 6970 	pea 16970 <destlinezoom4>
    2a12:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    2a14:	2f07           	move.l d7,-(sp)
    2a16:	2f04           	move.l d4,-(sp)
    2a18:	486a 0150      	pea 336(a2)
    2a1c:	4879 0001 6970 	pea 16970 <destlinezoom4>
    2a22:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2a24:	2e0a           	move.l a2,d7
    2a26:	0687 0000 0420 	addi.l #1056,d7
    2a2c:	47eb 0015      	lea 21(a3),a3
  for(int i=0;i<12;i++) {
    2a30:	4fef 0020      	lea 32(sp),sp
    2a34:	b6fc 0114      	cmpa.w #276,a3
    2a38:	6600 ff02      	bne.w 293c <ZoomTest+0xee4>
  TestRow( valsupposed, valactual, mask, 269);
    2a3c:	4878 010d      	pea 10d <main+0x107>
    2a40:	2f02           	move.l d2,-(sp)
    2a42:	2043           	movea.l d3,a0
    2a44:	4868 3274      	pea 12916(a0)
    2a48:	4879 0001 6970 	pea 16970 <destlinezoom4>
    2a4e:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    2a50:	4878 0001      	pea 1 <_start+0x1>
    2a54:	4878 0004      	pea 4 <_start+0x4>
    2a58:	2f0c           	move.l a4,-(sp)
    2a5a:	2f03           	move.l d3,-(sp)
    2a5c:	4eba e5f4      	jsr 1052 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2a60:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    2a66:	4eae ff1c      	jsr -228(a6)
    2a6a:	4fef 0020      	lea 32(sp),sp
  valactual = destination+2; 
    2a6e:	266f 0034      	movea.l 52(sp),a3
  for(int i2=0;i2<13;i2++) {  
    2a72:	95ca           	suba.l a2,a2
  mask = 0x0000;
    2a74:	4245           	clr.w d5
    TestRow( valsupposed, valactual, mask, i2);
    2a76:	7400           	moveq #0,d2
    2a78:	3405           	move.w d5,d2
    2a7a:	2f0a           	move.l a2,-(sp)
    2a7c:	2f02           	move.l d2,-(sp)
    2a7e:	2f0b           	move.l a3,-(sp)
    2a80:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2a86:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2a88:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    2a8c:	4645           	not.w d5
  for(int i2=0;i2<13;i2++) {  
    2a8e:	528a           	addq.l #1,a2
    2a90:	4fef 0010      	lea 16(sp),sp
    2a94:	700d           	moveq #13,d0
    2a96:	b08a           	cmp.l a2,d0
    2a98:	66dc           	bne.s 2a76 <ZoomTest+0x101e>
    2a9a:	7800           	moveq #0,d4
    2a9c:	3805           	move.w d5,d4
  TestRow( valsupposed, valactual, mask, 12);   
    2a9e:	4878 000c      	pea c <main+0x6>
    2aa2:	2f04           	move.l d4,-(sp)
    2aa4:	486c 0274      	pea 628(a4)
    2aa8:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2aae:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 13);
    2ab0:	4878 000d      	pea d <main+0x7>
    2ab4:	2f04           	move.l d4,-(sp)
    2ab6:	486c 02a4      	pea 676(a4)
    2aba:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2ac0:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 14);
    2ac2:	4fef 0020      	lea 32(sp),sp
    2ac6:	4878 000e      	pea e <main+0x8>
    2aca:	2f02           	move.l d2,-(sp)
    2acc:	486c 02d4      	pea 724(a4)
    2ad0:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2ad6:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 15);
    2ad8:	4878 000f      	pea f <main+0x9>
    2adc:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2ade:	41ec 0304      	lea 772(a4),a0
    2ae2:	2f48 0064      	move.l a0,100(sp)
  TestRow( valsupposed, valactual, mask, 15);
    2ae6:	2f08           	move.l a0,-(sp)
    2ae8:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2aee:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 16);
    2af0:	4fef 0020      	lea 32(sp),sp
    2af4:	4878 0010      	pea 10 <main+0xa>
    2af8:	2f04           	move.l d4,-(sp)
    2afa:	486c 0334      	pea 820(a4)
    2afe:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2b04:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 17);
    2b06:	4878 0011      	pea 11 <main+0xb>
    2b0a:	2f04           	move.l d4,-(sp)
    2b0c:	2f2f 0054      	move.l 84(sp),-(sp)
    2b10:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2b16:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 18);
    2b18:	4fef 0020      	lea 32(sp),sp
    2b1c:	4878 0012      	pea 12 <main+0xc>
    2b20:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2b22:	41ec 0394      	lea 916(a4),a0
    2b26:	2f48 0064      	move.l a0,100(sp)
  TestRow( valsupposed, valactual, mask, 18);
    2b2a:	2f08           	move.l a0,-(sp)
    2b2c:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2b32:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 19);
    2b34:	4878 0013      	pea 13 <main+0xd>
    2b38:	2f02           	move.l d2,-(sp)
    2b3a:	486c 03c4      	pea 964(a4)
    2b3e:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2b44:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 20);
    2b46:	4fef 0020      	lea 32(sp),sp
    2b4a:	4878 0014      	pea 14 <main+0xe>
    2b4e:	2f04           	move.l d4,-(sp)
    2b50:	486c 03f4      	pea 1012(a4)
    2b54:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2b5a:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 21);
    2b5c:	4878 0015      	pea 15 <main+0xf>
    2b60:	2f04           	move.l d4,-(sp)
    2b62:	486c 0424      	pea 1060(a4)
    2b66:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2b6c:	4e95           	jsr (a5)
  for(int i=0;i<10;i++) {
    2b6e:	280c           	move.l a4,d4
    2b70:	0684 0000 06c4 	addi.l #1732,d4
    2b76:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, mask, 21);
    2b7a:	347c 0023      	movea.w #35,a2
    2b7e:	2644           	movea.l d4,a3
    2b80:	47eb fd90      	lea -624(a3),a3
    2b84:	4dea fff3      	lea -13(a2),a6
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    2b88:	2f0e           	move.l a6,-(sp)
    2b8a:	2f02           	move.l d2,-(sp)
    2b8c:	2f0b           	move.l a3,-(sp)
    2b8e:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2b94:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2b96:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    2b9a:	528e           	addq.l #1,a6
    for(int i2=0;i2<13;i2++) {  
    2b9c:	4fef 0010      	lea 16(sp),sp
    2ba0:	b88b           	cmp.l a3,d4
    2ba2:	6722           	beq.s 2bc6 <ZoomTest+0x116e>
    2ba4:	7400           	moveq #0,d2
    2ba6:	3405           	move.w d5,d2
    2ba8:	4645           	not.w d5
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    2baa:	2f0e           	move.l a6,-(sp)
    2bac:	2f02           	move.l d2,-(sp)
    2bae:	2f0b           	move.l a3,-(sp)
    2bb0:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2bb6:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2bb8:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    2bbc:	528e           	addq.l #1,a6
    for(int i2=0;i2<13;i2++) {  
    2bbe:	4fef 0010      	lea 16(sp),sp
    2bc2:	b88b           	cmp.l a3,d4
    2bc4:	66de           	bne.s 2ba4 <ZoomTest+0x114c>
    TestRow( valsupposed, valactual, mask, i*21+22+13);
    2bc6:	7800           	moveq #0,d4
    2bc8:	3805           	move.w d5,d4
    2bca:	2f0a           	move.l a2,-(sp)
    2bcc:	2f04           	move.l d4,-(sp)
    2bce:	2f0b           	move.l a3,-(sp)
    2bd0:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2bd6:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    2bd8:	486a 0001      	pea 1(a2)
    2bdc:	2f04           	move.l d4,-(sp)
    2bde:	486b 0030      	pea 48(a3)
    2be2:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2be8:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    2bea:	4fef 0020      	lea 32(sp),sp
    2bee:	486a 0002      	pea 2(a2)
    2bf2:	2f02           	move.l d2,-(sp)
    2bf4:	486b 0060      	pea 96(a3)
    2bf8:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2bfe:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    2c00:	486a 0003      	pea 3(a2)
    2c04:	2f02           	move.l d2,-(sp)
    2c06:	486b 0090      	pea 144(a3)
    2c0a:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2c10:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    2c12:	4fef 0020      	lea 32(sp),sp
    2c16:	486a 0004      	pea 4(a2)
    2c1a:	2f04           	move.l d4,-(sp)
    2c1c:	486b 00c0      	pea 192(a3)
    2c20:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2c26:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    2c28:	486a 0005      	pea 5(a2)
    2c2c:	2f04           	move.l d4,-(sp)
    2c2e:	486b 00f0      	pea 240(a3)
    2c32:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2c38:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    2c3a:	4fef 0020      	lea 32(sp),sp
    2c3e:	486a 0006      	pea 6(a2)
    2c42:	2f02           	move.l d2,-(sp)
    2c44:	486b 0120      	pea 288(a3)
    2c48:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2c4e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    2c50:	486a 0007      	pea 7(a2)
    2c54:	2f02           	move.l d2,-(sp)
    2c56:	486b 0150      	pea 336(a3)
    2c5a:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2c60:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    2c62:	4fef 0020      	lea 32(sp),sp
    2c66:	486a 0008      	pea 8(a2)
    2c6a:	2f04           	move.l d4,-(sp)
    2c6c:	486b 0180      	pea 384(a3)
    2c70:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2c76:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    2c78:	486a 0009      	pea 9(a2)
    2c7c:	2f04           	move.l d4,-(sp)
    2c7e:	486b 01b0      	pea 432(a3)
    2c82:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2c88:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2c8a:	280b           	move.l a3,d4
    2c8c:	0684 0000 0450 	addi.l #1104,d4
    2c92:	45ea 0015      	lea 21(a2),a2
  for(int i=0;i<10;i++) {
    2c96:	4fef 0020      	lea 32(sp),sp
    2c9a:	b4fc 00f5      	cmpa.w #245,a2
    2c9e:	6600 fede      	bne.w 2b7e <ZoomTest+0x1126>
    2ca2:	47ec 2f74      	lea 12148(a4),a3
    2ca6:	7e02           	moveq #2,d7
    2ca8:	4607           	not.b d7
    TestRow( valsupposed, valactual, mask, i2+253);
    2caa:	2f07           	move.l d7,-(sp)
    2cac:	2f02           	move.l d2,-(sp)
    2cae:	2f0b           	move.l a3,-(sp)
    2cb0:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2cb6:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2cb8:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    2cbc:	5287           	addq.l #1,d7
  for(int i2=0;i2<13;i2++) {  
    2cbe:	4fef 0010      	lea 16(sp),sp
    2cc2:	0c87 0000 010a 	cmpi.l #266,d7
    2cc8:	6726           	beq.s 2cf0 <ZoomTest+0x1298>
    2cca:	7400           	moveq #0,d2
    2ccc:	3405           	move.w d5,d2
    2cce:	4645           	not.w d5
    TestRow( valsupposed, valactual, mask, i2+253);
    2cd0:	2f07           	move.l d7,-(sp)
    2cd2:	2f02           	move.l d2,-(sp)
    2cd4:	2f0b           	move.l a3,-(sp)
    2cd6:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2cdc:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2cde:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    2ce2:	5287           	addq.l #1,d7
  for(int i2=0;i2<13;i2++) {  
    2ce4:	4fef 0010      	lea 16(sp),sp
    2ce8:	0c87 0000 010a 	cmpi.l #266,d7
    2cee:	66da           	bne.s 2cca <ZoomTest+0x1272>
    2cf0:	0285 0000 ffff 	andi.l #65535,d5
  TestRow( valsupposed, valactual, mask, 266);
    2cf6:	2f07           	move.l d7,-(sp)
    2cf8:	2f05           	move.l d5,-(sp)
    2cfa:	2f2f 0038      	move.l 56(sp),-(sp)
    2cfe:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2d04:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 267);
    2d06:	4878 010b      	pea 10b <main+0x105>
    2d0a:	2f05           	move.l d5,-(sp)
  valactual += ZMLINESIZE/2;
    2d0c:	41ec 3214      	lea 12820(a4),a0
    2d10:	2f48 0070      	move.l a0,112(sp)
  TestRow( valsupposed, valactual, mask, 267);
    2d14:	2f08           	move.l a0,-(sp)
    2d16:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2d1c:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 268);
    2d1e:	4fef 0020      	lea 32(sp),sp
    2d22:	4878 010c      	pea 10c <main+0x106>
    2d26:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2d28:	41ec 3244      	lea 12868(a4),a0
    2d2c:	2f48 0068      	move.l a0,104(sp)
  TestRow( valsupposed, valactual, mask, 268);
    2d30:	2f08           	move.l a0,-(sp)
    2d32:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2d38:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 269);
    2d3a:	4878 010d      	pea 10d <main+0x107>
    2d3e:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2d40:	41ec 3274      	lea 12916(a4),a0
    2d44:	2f48 0054      	move.l a0,84(sp)
  TestRow( valsupposed, valactual, mask, 269);
    2d48:	2f08           	move.l a0,-(sp)
    2d4a:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2d50:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    2d52:	4fef 0020      	lea 32(sp),sp
    2d56:	4878 0001      	pea 1 <_start+0x1>
    2d5a:	4878 0005      	pea 5 <_start+0x5>
    2d5e:	2f03           	move.l d3,-(sp)
    2d60:	2f0c           	move.l a4,-(sp)
    2d62:	4eba e2ee      	jsr 1052 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2d66:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    2d6c:	4eae ff1c      	jsr -228(a6)
    2d70:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    2d74:	266f 002c      	movea.l 44(sp),a3
  for(int i2=0;i2<7;i2++) {  
    2d78:	7800           	moveq #0,d4
  mask = 0x0000;
    2d7a:	4242           	clr.w d2
    TestRow( valsupposed, valactual, mask, i2);
    2d7c:	2f04           	move.l d4,-(sp)
    2d7e:	3f02           	move.w d2,-(sp)
    2d80:	4267           	clr.w -(sp)
    2d82:	2f0b           	move.l a3,-(sp)
    2d84:	4879 0001 6918 	pea 16918 <destlinezoom6>
    2d8a:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2d8c:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    2d90:	4642           	not.w d2
  for(int i2=0;i2<7;i2++) {  
    2d92:	5284           	addq.l #1,d4
    2d94:	4fef 0010      	lea 16(sp),sp
    2d98:	7007           	moveq #7,d0
    2d9a:	b084           	cmp.l d4,d0
    2d9c:	66de           	bne.s 2d7c <ZoomTest+0x1324>
    2d9e:	2c43           	movea.l d3,a6
    2da0:	4dee 0154      	lea 340(a6),a6
    2da4:	367c 0007      	movea.w #7,a3
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    2da8:	7800           	moveq #0,d4
    2daa:	3802           	move.w d2,d4
    2dac:	2f0b           	move.l a3,-(sp)
    2dae:	2f04           	move.l d4,-(sp)
    2db0:	2f0e           	move.l a6,-(sp)
    2db2:	4879 0001 6918 	pea 16918 <destlinezoom6>
    2db8:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    2dba:	486b 0001      	pea 1(a3)
    2dbe:	2f04           	move.l d4,-(sp)
    2dc0:	486e 0030      	pea 48(a6)
    2dc4:	4879 0001 6918 	pea 16918 <destlinezoom6>
    2dca:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2dcc:	4642           	not.w d2
    2dce:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    2dd0:	4dee 0060      	lea 96(a6),a6
  for(int i=0;i<6;i++) {
    2dd4:	4fef 0020      	lea 32(sp),sp
    2dd8:	7213           	moveq #19,d1
    2dda:	b28b           	cmp.l a3,d1
    2ddc:	66ca           	bne.s 2da8 <ZoomTest+0x1350>
    2dde:	2a0a           	move.l a2,d5
    2de0:	2c46           	movea.l d6,a6
    2de2:	4dee fdc0      	lea -576(a6),a6
  for(int i2=0;i2<7;i2++) {  
    2de6:	280b           	move.l a3,d4
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    2de8:	2f04           	move.l d4,-(sp)
    2dea:	3f02           	move.w d2,-(sp)
    2dec:	4267           	clr.w -(sp)
    2dee:	2f0e           	move.l a6,-(sp)
    2df0:	4879 0001 6918 	pea 16918 <destlinezoom6>
    2df6:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2df8:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2dfc:	4642           	not.w d2
    2dfe:	5284           	addq.l #1,d4
    for(int i2=0;i2<12;i2++) {  
    2e00:	4fef 0010      	lea 16(sp),sp
    2e04:	bc8e           	cmp.l a6,d6
    2e06:	66e0           	bne.s 2de8 <ZoomTest+0x1390>
    2e08:	347c 001f      	movea.w #31,a2
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    2e0c:	7800           	moveq #0,d4
    2e0e:	3802           	move.w d2,d4
    2e10:	2f0a           	move.l a2,-(sp)
    2e12:	2f04           	move.l d4,-(sp)
    2e14:	2f0e           	move.l a6,-(sp)
    2e16:	4879 0001 6918 	pea 16918 <destlinezoom6>
    2e1c:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    2e1e:	486a 0001      	pea 1(a2)
    2e22:	2f04           	move.l d4,-(sp)
    2e24:	486e 0030      	pea 48(a6)
    2e28:	4879 0001 6918 	pea 16918 <destlinezoom6>
    2e2e:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    2e30:	4642           	not.w d2
    2e32:	45ea 0018      	lea 24(a2),a2
      valactual += ZMLINESIZE/2;
    2e36:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<6;i++) {
    2e3a:	4fef 0020      	lea 32(sp),sp
    2e3e:	b4fc 00af      	cmpa.w #175,a2
    2e42:	66c8           	bne.s 2e0c <ZoomTest+0x13b4>
    2e44:	0686 0000 0480 	addi.l #1152,d6
    2e4a:	47eb 0018      	lea 24(a3),a3
  for(int i=0;i<10;i++) {
    2e4e:	b6fc 0103      	cmpa.w #259,a3
    2e52:	668c           	bne.s 2de0 <ZoomTest+0x1388>
    2e54:	2445           	movea.l d5,a2
    2e56:	2c43           	movea.l d3,a6
    2e58:	4dee 3094      	lea 12436(a6),a6
    2e5c:	283c 0000 0102 	move.l #258,d4
    TestRow( valsupposed, valactual, mask, 258+i2);
    2e62:	2f04           	move.l d4,-(sp)
    2e64:	3f02           	move.w d2,-(sp)
    2e66:	4267           	clr.w -(sp)
    2e68:	2f0e           	move.l a6,-(sp)
    2e6a:	4879 0001 6918 	pea 16918 <destlinezoom6>
    2e70:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2e72:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2e76:	4642           	not.w d2
    2e78:	5284           	addq.l #1,d4
  for(int i2=0;i2<11;i2++) {  
    2e7a:	4fef 0010      	lea 16(sp),sp
    2e7e:	0c84 0000 010d 	cmpi.l #269,d4
    2e84:	66dc           	bne.s 2e62 <ZoomTest+0x140a>
  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    2e86:	4878 0001      	pea 1 <_start+0x1>
    2e8a:	4878 0006      	pea 6 <main>
    2e8e:	2f0c           	move.l a4,-(sp)
    2e90:	2f03           	move.l d3,-(sp)
    2e92:	4eba e1be      	jsr 1052 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2e96:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    2e9c:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2ea0:	42a7           	clr.l -(sp)
    2ea2:	42a7           	clr.l -(sp)
    2ea4:	2f2f 004c      	move.l 76(sp),-(sp)
    2ea8:	4879 0001 68ec 	pea 168ec <destlinezoom7>
    2eae:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    2eb0:	41ec 0034      	lea 52(a4),a0
    2eb4:	2f48 0068      	move.l a0,104(sp)
    2eb8:	4fef 0020      	lea 32(sp),sp
    2ebc:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    2ec0:	7eff           	moveq #-1,d7
    2ec2:	280a           	move.l a2,d4
    2ec4:	2448           	movea.l a0,a2
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2ec6:	7400           	moveq #0,d2
    2ec8:	3407           	move.w d7,d2
    2eca:	2f0e           	move.l a6,-(sp)
    2ecc:	2f02           	move.l d2,-(sp)
    2ece:	2f0a           	move.l a2,-(sp)
    2ed0:	4879 0001 68ec 	pea 168ec <destlinezoom7>
    2ed6:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2ed8:	486e 0001      	pea 1(a6)
    2edc:	2f02           	move.l d2,-(sp)
    2ede:	486a 0030      	pea 48(a2)
    2ee2:	4879 0001 68ec 	pea 168ec <destlinezoom7>
    2ee8:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2eea:	4647           	not.w d7
    2eec:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2eee:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<7;i++) {
    2ef2:	4fef 0020      	lea 32(sp),sp
    2ef6:	700f           	moveq #15,d0
    2ef8:	b08e           	cmp.l a6,d0
    2efa:	66ca           	bne.s 2ec6 <ZoomTest+0x146e>
    2efc:	240c           	move.l a4,d2
    2efe:	0682 0000 04e4 	addi.l #1252,d2
    2f04:	2a04           	move.l d4,d5
    2f06:	2c0b           	move.l a3,d6
    2f08:	264e           	movea.l a6,a3
    2f0a:	2c42           	movea.l d2,a6
    2f0c:	4dee fdf0      	lea -528(a6),a6
  mask = mask ^ 0xffff;
    2f10:	280b           	move.l a3,d4
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    2f12:	2f04           	move.l d4,-(sp)
    2f14:	3f07           	move.w d7,-(sp)
    2f16:	4267           	clr.w -(sp)
    2f18:	2f0e           	move.l a6,-(sp)
    2f1a:	4879 0001 68ec 	pea 168ec <destlinezoom7>
    2f20:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2f22:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2f26:	4647           	not.w d7
    2f28:	5284           	addq.l #1,d4
    for(int i2=0;i2<11;i2++) {  
    2f2a:	4fef 0010      	lea 16(sp),sp
    2f2e:	b48e           	cmp.l a6,d2
    2f30:	66e0           	bne.s 2f12 <ZoomTest+0x14ba>
    2f32:	347c 001a      	movea.w #26,a2
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    2f36:	7800           	moveq #0,d4
    2f38:	3807           	move.w d7,d4
    2f3a:	2f0a           	move.l a2,-(sp)
    2f3c:	2f04           	move.l d4,-(sp)
    2f3e:	2f0e           	move.l a6,-(sp)
    2f40:	4879 0001 68ec 	pea 168ec <destlinezoom7>
    2f46:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    2f48:	2f0a           	move.l a2,-(sp)
    2f4a:	2f04           	move.l d4,-(sp)
    2f4c:	486e 0030      	pea 48(a6)
    2f50:	4879 0001 68ec 	pea 168ec <destlinezoom7>
    2f56:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    2f58:	4647           	not.w d7
    2f5a:	45ea 0019      	lea 25(a2),a2
      valactual += ZMLINESIZE/2;
    2f5e:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<7;i++) {
    2f62:	4fef 0020      	lea 32(sp),sp
    2f66:	b4fc 00c9      	cmpa.w #201,a2
    2f6a:	66ca           	bne.s 2f36 <ZoomTest+0x14de>
    2f6c:	0682 0000 04b0 	addi.l #1200,d2
    2f72:	47eb 0019      	lea 25(a3),a3
  for(int i=0;i<10;i++) {
    2f76:	b6fc 0109      	cmpa.w #265,a3
    2f7a:	668e           	bne.s 2f0a <ZoomTest+0x14b2>
    2f7c:	2445           	movea.l d5,a2
    2f7e:	2646           	movea.l d6,a3
    2f80:	4dec 31b4      	lea 12724(a4),a6
    2f84:	243c 0000 0100 	move.l #256,d2
    TestRow( valsupposed, valactual, mask, 256+i2);
    2f8a:	2f02           	move.l d2,-(sp)
    2f8c:	3f07           	move.w d7,-(sp)
    2f8e:	4267           	clr.w -(sp)
    2f90:	2f0e           	move.l a6,-(sp)
    2f92:	4879 0001 68ec 	pea 168ec <destlinezoom7>
    2f98:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2f9a:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2f9e:	4647           	not.w d7
    2fa0:	5282           	addq.l #1,d2
  for(int i2=0;i2<5;i2++) {  
    2fa2:	4fef 0010      	lea 16(sp),sp
    2fa6:	0c82 0000 0105 	cmpi.l #261,d2
    2fac:	66dc           	bne.s 2f8a <ZoomTest+0x1532>
  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    2fae:	4878 0001      	pea 1 <_start+0x1>
    2fb2:	4878 0007      	pea 7 <main+0x1>
    2fb6:	2f03           	move.l d3,-(sp)
    2fb8:	2f0c           	move.l a4,-(sp)
    2fba:	4eba e096      	jsr 1052 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2fbe:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    2fc4:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2fc8:	42a7           	clr.l -(sp)
    2fca:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2fd0:	2f2f 0044      	move.l 68(sp),-(sp)
    2fd4:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    2fda:	4e95           	jsr (a5)
    2fdc:	4fef 0020      	lea 32(sp),sp
    2fe0:	2f6f 0038 0030 	move.l 56(sp),48(sp)
  valactual += ZMLINESIZE/2;
    2fe6:	242f 0040      	move.l 64(sp),d2
  TestRow( valsupposed, valactual, mask, 0);
    2fea:	7801           	moveq #1,d4
  mask = mask ^ 0xffff;
    2fec:	4245           	clr.w d5
    2fee:	2c2f 0030      	move.l 48(sp),d6
    2ff2:	2c44           	movea.l d4,a6
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2ff4:	7800           	moveq #0,d4
    2ff6:	3805           	move.w d5,d4
    2ff8:	2f0e           	move.l a6,-(sp)
    2ffa:	2f04           	move.l d4,-(sp)
    2ffc:	2f02           	move.l d2,-(sp)
    2ffe:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    3004:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    3006:	486e 0001      	pea 1(a6)
    300a:	2f04           	move.l d4,-(sp)
    300c:	2042           	movea.l d2,a0
    300e:	4868 0030      	pea 48(a0)
    3012:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    3018:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    301a:	4645           	not.w d5
    301c:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    301e:	4fef 0020      	lea 32(sp),sp
    3022:	700b           	moveq #11,d0
    3024:	b08e           	cmp.l a6,d0
    3026:	6740           	beq.s 3068 <ZoomTest+0x1610>
    3028:	2002           	move.l d2,d0
    302a:	0680 0000 00c0 	addi.l #192,d0
    3030:	2406           	move.l d6,d2
    3032:	2c00           	move.l d0,d6
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    3034:	7800           	moveq #0,d4
    3036:	3805           	move.w d5,d4
    3038:	2f0e           	move.l a6,-(sp)
    303a:	2f04           	move.l d4,-(sp)
    303c:	2f02           	move.l d2,-(sp)
    303e:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    3044:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    3046:	486e 0001      	pea 1(a6)
    304a:	2f04           	move.l d4,-(sp)
    304c:	2042           	movea.l d2,a0
    304e:	4868 0030      	pea 48(a0)
    3052:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    3058:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    305a:	4645           	not.w d5
    305c:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    305e:	4fef 0020      	lea 32(sp),sp
    3062:	700b           	moveq #11,d0
    3064:	b08e           	cmp.l a6,d0
    3066:	66c0           	bne.s 3028 <ZoomTest+0x15d0>
    3068:	2f46 0030      	move.l d6,48(sp)
    306c:	280e           	move.l a6,d4
    306e:	2e06           	move.l d6,d7
    3070:	0687 0000 01e0 	addi.l #480,d7
    3076:	327c 0015      	movea.w #21,a1
    307a:	2f4a 006c      	move.l a2,108(sp)
    307e:	2f4b 0070      	move.l a3,112(sp)
    3082:	2449           	movea.l a1,a2
    3084:	2c47           	movea.l d7,a6
    3086:	4dee fe20      	lea -480(a6),a6
    308a:	47ea fff6      	lea -10(a2),a3
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    308e:	2f0b           	move.l a3,-(sp)
    3090:	3f05           	move.w d5,-(sp)
    3092:	4267           	clr.w -(sp)
    3094:	2f0e           	move.l a6,-(sp)
    3096:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    309c:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    309e:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    30a2:	4645           	not.w d5
    30a4:	528b           	addq.l #1,a3
    for(int i2=0;i2<10;i2++) {  
    30a6:	4fef 0010      	lea 16(sp),sp
    30aa:	be8e           	cmp.l a6,d7
    30ac:	66e0           	bne.s 308e <ZoomTest+0x1636>
    30ae:	240a           	move.l a2,d2
    30b0:	2c0e           	move.l a6,d6
    30b2:	0686 0000 0300 	addi.l #768,d6
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    30b8:	7200           	moveq #0,d1
    30ba:	3205           	move.w d5,d1
    30bc:	2641           	movea.l d1,a3
    30be:	2f02           	move.l d2,-(sp)
    30c0:	2f0b           	move.l a3,-(sp)
    30c2:	2f0e           	move.l a6,-(sp)
    30c4:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    30ca:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    30cc:	2f02           	move.l d2,-(sp)
    30ce:	2f0b           	move.l a3,-(sp)
    30d0:	486e 0030      	pea 48(a6)
    30d4:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    30da:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    30dc:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    30e0:	4645           	not.w d5
    30e2:	5282           	addq.l #1,d2
    for(int i2=0;i2<8;i2++) {
    30e4:	4fef 0020      	lea 32(sp),sp
    30e8:	bc8e           	cmp.l a6,d6
    30ea:	66cc           	bne.s 30b8 <ZoomTest+0x1660>
    30ec:	0687 0000 04e0 	addi.l #1248,d7
    30f2:	45ea 001a      	lea 26(a2),a2
  for(int i=0;i<9;i++) {
    30f6:	b4fc 00ff      	cmpa.w #255,a2
    30fa:	6688           	bne.s 3084 <ZoomTest+0x162c>
    30fc:	246f 006c      	movea.l 108(sp),a2
    3100:	266f 0070      	movea.l 112(sp),a3
    3104:	2c2f 0030      	move.l 48(sp),d6
    3108:	0686 0000 2be0 	addi.l #11232,d6
    310e:	240a           	move.l a2,d2
    3110:	2c46           	movea.l d6,a6
    TestRow( valsupposed, valactual, mask, 245+i2);
    3112:	2f02           	move.l d2,-(sp)
    3114:	3f05           	move.w d5,-(sp)
    3116:	4267           	clr.w -(sp)
    3118:	2f0e           	move.l a6,-(sp)
    311a:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    3120:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3122:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    3126:	4645           	not.w d5
    3128:	5282           	addq.l #1,d2
  for(int i2=0;i2<10;i2++) {  
    312a:	4fef 0010      	lea 16(sp),sp
    312e:	0c82 0000 00ff 	cmpi.l #255,d2
    3134:	66dc           	bne.s 3112 <ZoomTest+0x16ba>
    3136:	2c2f 0030      	move.l 48(sp),d6
    313a:	0686 0000 2dc0 	addi.l #11712,d6
    3140:	2c42           	movea.l d2,a6
    3142:	2e0a           	move.l a2,d7
    3144:	2446           	movea.l d6,a2
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    3146:	7c00           	moveq #0,d6
    3148:	3c05           	move.w d5,d6
    314a:	2f0e           	move.l a6,-(sp)
    314c:	2f06           	move.l d6,-(sp)
    314e:	2f0a           	move.l a2,-(sp)
    3150:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    3156:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    3158:	486e 0001      	pea 1(a6)
    315c:	2f06           	move.l d6,-(sp)
    315e:	486a 0030      	pea 48(a2)
    3162:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    3168:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    316a:	4645           	not.w d5
    316c:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    316e:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<7;i++) {
    3172:	4fef 0020      	lea 32(sp),sp
    3176:	bcfc 010d      	cmpa.w #269,a6
    317a:	66ca           	bne.s 3146 <ZoomTest+0x16ee>
    317c:	2447           	movea.l d7,a2
  TestRow( valsupposed, valactual, mask, 269);
    317e:	2f0e           	move.l a6,-(sp)
    3180:	3f05           	move.w d5,-(sp)
    3182:	4267           	clr.w -(sp)
    3184:	206f 0038      	movea.l 56(sp),a0
    3188:	4868 3060      	pea 12384(a0)
    318c:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    3192:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    3194:	4878 0001      	pea 1 <_start+0x1>
    3198:	4878 0008      	pea 8 <main+0x2>
    319c:	2f0c           	move.l a4,-(sp)
    319e:	2f03           	move.l d3,-(sp)
    31a0:	4eba deb0      	jsr 1052 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    31a4:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    31aa:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    31ae:	4fef 001c      	lea 28(sp),sp
    31b2:	4297           	clr.l (sp)
    31b4:	42a7           	clr.l -(sp)
    31b6:	2f2f 003c      	move.l 60(sp),-(sp)
    31ba:	4879 0001 6894 	pea 16894 <destlinezoom9>
    31c0:	4e95           	jsr (a5)
    31c2:	4fef 0010      	lea 16(sp),sp
    31c6:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    31ca:	7cff           	moveq #-1,d6
    31cc:	2e0a           	move.l a2,d7
    31ce:	246f 0048      	movea.l 72(sp),a2
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    31d2:	7a00           	moveq #0,d5
    31d4:	3a06           	move.w d6,d5
    31d6:	2f0e           	move.l a6,-(sp)
    31d8:	2f05           	move.l d5,-(sp)
    31da:	2f0a           	move.l a2,-(sp)
    31dc:	4879 0001 6894 	pea 16894 <destlinezoom9>
    31e2:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    31e4:	486e 0001      	pea 1(a6)
    31e8:	2f05           	move.l d5,-(sp)
    31ea:	486a 0030      	pea 48(a2)
    31ee:	4879 0001 6894 	pea 16894 <destlinezoom9>
    31f4:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    31f6:	4646           	not.w d6
    31f8:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    31fa:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<3;i++) {
    31fe:	4fef 0020      	lea 32(sp),sp
    3202:	7007           	moveq #7,d0
    3204:	b08e           	cmp.l a6,d0
    3206:	66ca           	bne.s 31d2 <ZoomTest+0x177a>
    3208:	2a2f 004c      	move.l 76(sp),d5
    320c:	307c 0014      	movea.w #20,a0
    3210:	2f47 0030      	move.l d7,48(sp)
    3214:	2f4b 0048      	move.l a3,72(sp)
    3218:	2f42 004c      	move.l d2,76(sp)
    321c:	2448           	movea.l a0,a2
    321e:	2c45           	movea.l d5,a6
    3220:	4dee fe50      	lea -432(a6),a6
    3224:	47ea fff7      	lea -9(a2),a3
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    3228:	2f0b           	move.l a3,-(sp)
    322a:	3f06           	move.w d6,-(sp)
    322c:	4267           	clr.w -(sp)
    322e:	2f0e           	move.l a6,-(sp)
    3230:	4879 0001 6894 	pea 16894 <destlinezoom9>
    3236:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3238:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    323c:	4646           	not.w d6
    323e:	528b           	addq.l #1,a3
    for(int i2=0;i2<9;i2++) {  
    3240:	4fef 0010      	lea 16(sp),sp
    3244:	ba8e           	cmp.l a6,d5
    3246:	66e0           	bne.s 3228 <ZoomTest+0x17d0>
    3248:	2e0a           	move.l a2,d7
    324a:	47ea 0009      	lea 9(a2),a3
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    324e:	7400           	moveq #0,d2
    3250:	3406           	move.w d6,d2
    3252:	2f07           	move.l d7,-(sp)
    3254:	2f02           	move.l d2,-(sp)
    3256:	2f0e           	move.l a6,-(sp)
    3258:	4879 0001 6894 	pea 16894 <destlinezoom9>
    325e:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    3260:	5287           	addq.l #1,d7
    3262:	2f07           	move.l d7,-(sp)
    3264:	2f02           	move.l d2,-(sp)
    3266:	486e 0030      	pea 48(a6)
    326a:	4879 0001 6894 	pea 16894 <destlinezoom9>
    3270:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3272:	4646           	not.w d6
      valactual += ZMLINESIZE/2;
    3274:	4dee 0060      	lea 96(a6),a6
    for(int i2=0;i2<9;i2++) {
    3278:	4fef 0020      	lea 32(sp),sp
    327c:	be8b           	cmp.l a3,d7
    327e:	66ce           	bne.s 324e <ZoomTest+0x17f6>
    3280:	0685 0000 0510 	addi.l #1296,d5
    3286:	45ea 001b      	lea 27(a2),a2
  for(int i=0;i<9;i++) {
    328a:	b4fc 0107      	cmpa.w #263,a2
    328e:	668e           	bne.s 321e <ZoomTest+0x17c6>
    3290:	246f 0030      	movea.l 48(sp),a2
    3294:	266f 0048      	movea.l 72(sp),a3
    3298:	242f 004c      	move.l 76(sp),d2
    329c:	41ec 2ee4      	lea 12004(a4),a0
    32a0:	2f48 0030      	move.l a0,48(sp)
    32a4:	2c48           	movea.l a0,a6
    TestRow( valsupposed, valactual, mask, 245+i2);
    32a6:	2f0a           	move.l a2,-(sp)
    32a8:	3f06           	move.w d6,-(sp)
    32aa:	4267           	clr.w -(sp)
    32ac:	2f0e           	move.l a6,-(sp)
    32ae:	4879 0001 6894 	pea 16894 <destlinezoom9>
    32b4:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    32b6:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    32ba:	4646           	not.w d6
    32bc:	528a           	addq.l #1,a2
  for(int i2=0;i2<9;i2++) {  
    32be:	4fef 0010      	lea 16(sp),sp
    32c2:	b4fc 00fe      	cmpa.w #254,a2
    32c6:	66de           	bne.s 32a6 <ZoomTest+0x184e>
    32c8:	45ec 3094      	lea 12436(a4),a2
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    32cc:	7a00           	moveq #0,d5
    32ce:	3a06           	move.w d6,d5
    32d0:	2f0b           	move.l a3,-(sp)
    32d2:	2f05           	move.l d5,-(sp)
    32d4:	2f0a           	move.l a2,-(sp)
    32d6:	4879 0001 6894 	pea 16894 <destlinezoom9>
    32dc:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    32de:	486b 0001      	pea 1(a3)
    32e2:	2f05           	move.l d5,-(sp)
    32e4:	486a 0030      	pea 48(a2)
    32e8:	4879 0001 6894 	pea 16894 <destlinezoom9>
    32ee:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    32f0:	4646           	not.w d6
    32f2:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    32f4:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<5;i++) {
    32f8:	4fef 0020      	lea 32(sp),sp
    32fc:	b6fc 010d      	cmpa.w #269,a3
    3300:	66ca           	bne.s 32cc <ZoomTest+0x1874>
  TestRow( valsupposed, valactual, mask, 269);
    3302:	2f0b           	move.l a3,-(sp)
    3304:	3f06           	move.w d6,-(sp)
    3306:	4267           	clr.w -(sp)
    3308:	2f2f 0044      	move.l 68(sp),-(sp)
    330c:	4879 0001 6894 	pea 16894 <destlinezoom9>
    3312:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    3314:	4878 0001      	pea 1 <_start+0x1>
    3318:	4878 0009      	pea 9 <main+0x3>
    331c:	2f03           	move.l d3,-(sp)
    331e:	2f0c           	move.l a4,-(sp)
    3320:	4eba dd30      	jsr 1052 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3324:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    332a:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    332e:	4fef 001c      	lea 28(sp),sp
    3332:	4297           	clr.l (sp)
    3334:	2f3c 0000 ffff 	move.l #65535,-(sp)
    333a:	2f2f 0034      	move.l 52(sp),-(sp)
    333e:	4879 0001 6868 	pea 16868 <destlinezoom10>
    3344:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 1);   
    3346:	4878 0001      	pea 1 <_start+0x1>
    334a:	42a7           	clr.l -(sp)
    334c:	2f2f 0058      	move.l 88(sp),-(sp)
    3350:	4879 0001 6868 	pea 16868 <destlinezoom10>
    3356:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 2);
    3358:	4fef 0020      	lea 32(sp),sp
    335c:	4878 0002      	pea 2 <_start+0x2>
    3360:	42a7           	clr.l -(sp)
    3362:	2f2f 0058      	move.l 88(sp),-(sp)
    3366:	4879 0001 6868 	pea 16868 <destlinezoom10>
    336c:	4e95           	jsr (a5)
  for(int i=0;i<9;i++) {
    336e:	2a2f 0064      	move.l 100(sp),d5
    3372:	4fef 0010      	lea 16(sp),sp
  mask = mask ^ 0xffff;
    3376:	7eff           	moveq #-1,d7
    3378:	2644           	movea.l d4,a3
    337a:	2445           	movea.l d5,a2
    337c:	45ea fe80      	lea -384(a2),a2
    3380:	280b           	move.l a3,d4
    3382:	5184           	subq.l #8,d4
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    3384:	2f04           	move.l d4,-(sp)
    3386:	3f07           	move.w d7,-(sp)
    3388:	4267           	clr.w -(sp)
    338a:	2f0a           	move.l a2,-(sp)
    338c:	4879 0001 6868 	pea 16868 <destlinezoom10>
    3392:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3394:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    3398:	4647           	not.w d7
    339a:	5284           	addq.l #1,d4
    for(int i2=0;i2<8;i2++) {  
    339c:	4fef 0010      	lea 16(sp),sp
    33a0:	ba8a           	cmp.l a2,d5
    33a2:	66e0           	bne.s 3384 <ZoomTest+0x192c>
    33a4:	280b           	move.l a3,d4
    33a6:	4dea 03c0      	lea 960(a2),a6
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    33aa:	7c00           	moveq #0,d6
    33ac:	3c07           	move.w d7,d6
    33ae:	2f04           	move.l d4,-(sp)
    33b0:	2f06           	move.l d6,-(sp)
    33b2:	2f0a           	move.l a2,-(sp)
    33b4:	4879 0001 6868 	pea 16868 <destlinezoom10>
    33ba:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    33bc:	2f04           	move.l d4,-(sp)
    33be:	2f06           	move.l d6,-(sp)
    33c0:	486a 0030      	pea 48(a2)
    33c4:	4879 0001 6868 	pea 16868 <destlinezoom10>
    33ca:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    33cc:	45ea 0060      	lea 96(a2),a2
      mask = mask ^ 0xffff;
    33d0:	4647           	not.w d7
    33d2:	5284           	addq.l #1,d4
    for(int i2=0;i2<10;i2++) {
    33d4:	4fef 0020      	lea 32(sp),sp
    33d8:	bdca           	cmpa.l a2,a6
    33da:	66ce           	bne.s 33aa <ZoomTest+0x1952>
    33dc:	0685 0000 0540 	addi.l #1344,d5
    33e2:	47eb 001c      	lea 28(a3),a3
  for(int i=0;i<9;i++) {
    33e6:	b6fc 0107      	cmpa.w #263,a3
    33ea:	668e           	bne.s 337a <ZoomTest+0x1922>
    33ec:	246f 0068      	movea.l 104(sp),a2
    TestRow( valsupposed, valactual, mask, 255+i2);
    33f0:	2f02           	move.l d2,-(sp)
    33f2:	3f07           	move.w d7,-(sp)
    33f4:	4267           	clr.w -(sp)
    33f6:	2f0a           	move.l a2,-(sp)
    33f8:	4879 0001 6868 	pea 16868 <destlinezoom10>
    33fe:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3400:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    3404:	4647           	not.w d7
    3406:	5282           	addq.l #1,d2
  for(int i2=0;i2<8;i2++) {  
    3408:	4fef 0010      	lea 16(sp),sp
    340c:	0c82 0000 0107 	cmpi.l #263,d2
    3412:	66dc           	bne.s 33f0 <ZoomTest+0x1998>
    3414:	2c43           	movea.l d3,a6
    3416:	4dee 3154      	lea 12628(a6),a6
    341a:	347c 0108      	movea.w #264,a2
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    341e:	7400           	moveq #0,d2
    3420:	3407           	move.w d7,d2
    3422:	486a ffff      	pea -1(a2)
    3426:	2f02           	move.l d2,-(sp)
    3428:	2f0e           	move.l a6,-(sp)
    342a:	4879 0001 6868 	pea 16868 <destlinezoom10>
    3430:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    3432:	2f0a           	move.l a2,-(sp)
    3434:	2f02           	move.l d2,-(sp)
    3436:	486e 0030      	pea 48(a6)
    343a:	4879 0001 6868 	pea 16868 <destlinezoom10>
    3440:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3442:	4647           	not.w d7
    3444:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3446:	4dee 0060      	lea 96(a6),a6
  for(int i=0;i<3;i++) {
    344a:	4fef 0020      	lea 32(sp),sp
    344e:	b4fc 010e      	cmpa.w #270,a2
    3452:	66ca           	bne.s 341e <ZoomTest+0x19c6>
  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    3454:	4878 0001      	pea 1 <_start+0x1>
    3458:	4878 000a      	pea a <main+0x4>
    345c:	2f0c           	move.l a4,-(sp)
    345e:	2f03           	move.l d3,-(sp)
    3460:	4eba dbf0      	jsr 1052 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3464:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    346a:	4eae ff1c      	jsr -228(a6)
    346e:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    3472:	246f 0034      	movea.l 52(sp),a2
  for(int i2=0;i2<6;i2++) {  
    3476:	7800           	moveq #0,d4
  mask = 0xffff;
    3478:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, i2);
    347a:	2f04           	move.l d4,-(sp)
    347c:	3f02           	move.w d2,-(sp)
    347e:	4267           	clr.w -(sp)
    3480:	2f0a           	move.l a2,-(sp)
    3482:	4879 0001 683c 	pea 1683c <destlinezoom11>
    3488:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    348a:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    348e:	4642           	not.w d2
  for(int i2=0;i2<6;i2++) {  
    3490:	5284           	addq.l #1,d4
    3492:	4fef 0010      	lea 16(sp),sp
    3496:	7006           	moveq #6,d0
    3498:	b084           	cmp.l d4,d0
    349a:	66de           	bne.s 347a <ZoomTest+0x1a22>
    349c:	266f 0064      	movea.l 100(sp),a3
    34a0:	347c 0006      	movea.w #6,a2
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    34a4:	7800           	moveq #0,d4
    34a6:	3802           	move.w d2,d4
    34a8:	2f0a           	move.l a2,-(sp)
    34aa:	2f04           	move.l d4,-(sp)
    34ac:	2f0b           	move.l a3,-(sp)
    34ae:	4879 0001 683c 	pea 1683c <destlinezoom11>
    34b4:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    34b6:	486a 0001      	pea 1(a2)
    34ba:	2f04           	move.l d4,-(sp)
    34bc:	486b 0030      	pea 48(a3)
    34c0:	4879 0001 683c 	pea 1683c <destlinezoom11>
    34c6:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    34c8:	4642           	not.w d2
    34ca:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    34cc:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<11;i2++) {
    34d0:	4fef 0020      	lea 32(sp),sp
    34d4:	721c           	moveq #28,d1
    34d6:	b28a           	cmp.l a2,d1
    34d8:	66ca           	bne.s 34a4 <ZoomTest+0x1a4c>
    34da:	280c           	move.l a4,d4
    34dc:	0684 0000 0694 	addi.l #1684,d4
    34e2:	347c 0023      	movea.w #35,a2
    34e6:	2644           	movea.l d4,a3
    34e8:	47eb feb0      	lea -336(a3),a3
    34ec:	2a0a           	move.l a2,d5
    34ee:	5f85           	subq.l #7,d5
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    34f0:	2f05           	move.l d5,-(sp)
    34f2:	3f02           	move.w d2,-(sp)
    34f4:	4267           	clr.w -(sp)
    34f6:	2f0b           	move.l a3,-(sp)
    34f8:	4879 0001 683c 	pea 1683c <destlinezoom11>
    34fe:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3500:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    3504:	4642           	not.w d2
    3506:	5285           	addq.l #1,d5
    for(int i2=0;i2<7;i2++) {  
    3508:	4fef 0010      	lea 16(sp),sp
    350c:	b88b           	cmp.l a3,d4
    350e:	66e0           	bne.s 34f0 <ZoomTest+0x1a98>
    3510:	2c4a           	movea.l a2,a6
    3512:	2c0b           	move.l a3,d6
    3514:	0686 0000 0420 	addi.l #1056,d6
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    351a:	7a00           	moveq #0,d5
    351c:	3a02           	move.w d2,d5
    351e:	2f0e           	move.l a6,-(sp)
    3520:	2f05           	move.l d5,-(sp)
    3522:	2f0b           	move.l a3,-(sp)
    3524:	4879 0001 683c 	pea 1683c <destlinezoom11>
    352a:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    352c:	486e ffe8      	pea -24(a6)
    3530:	2f05           	move.l d5,-(sp)
    3532:	486b 0030      	pea 48(a3)
    3536:	4879 0001 683c 	pea 1683c <destlinezoom11>
    353c:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    353e:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    3542:	4642           	not.w d2
    3544:	548e           	addq.l #2,a6
    for(int i2=0;i2<11;i2++) {
    3546:	4fef 0020      	lea 32(sp),sp
    354a:	bc8b           	cmp.l a3,d6
    354c:	66cc           	bne.s 351a <ZoomTest+0x1ac2>
    354e:	0684 0000 0570 	addi.l #1392,d4
    3554:	45ea 001d      	lea 29(a2),a2
  for(int i=0;i<8;i++) {
    3558:	b4fc 010b      	cmpa.w #267,a2
    355c:	6688           	bne.s 34e6 <ZoomTest+0x1a8e>
    355e:	45ec 30c4      	lea 12484(a4),a2
    3562:	2a3c 0000 0104 	move.l #260,d5
    TestRow( valsupposed, valactual, mask, 260+i2);
    3568:	7800           	moveq #0,d4
    356a:	3802           	move.w d2,d4
    356c:	2f05           	move.l d5,-(sp)
    356e:	2f04           	move.l d4,-(sp)
    3570:	2f0a           	move.l a2,-(sp)
    3572:	4879 0001 683c 	pea 1683c <destlinezoom11>
    3578:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    357a:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    357e:	4642           	not.w d2
    3580:	5285           	addq.l #1,d5
  for(int i2=0;i2<7;i2++) {  
    3582:	4fef 0010      	lea 16(sp),sp
    3586:	0c85 0000 010b 	cmpi.l #267,d5
    358c:	66da           	bne.s 3568 <ZoomTest+0x1b10>
    358e:	0282 0000 ffff 	andi.l #65535,d2
  TestRow( valsupposed, valactual, mask, 267);   
    3594:	2f05           	move.l d5,-(sp)
    3596:	2f02           	move.l d2,-(sp)
    3598:	2f2f 0060      	move.l 96(sp),-(sp)
    359c:	4879 0001 683c 	pea 1683c <destlinezoom11>
    35a2:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 268);
    35a4:	4878 010c      	pea 10c <main+0x106>
    35a8:	2f02           	move.l d2,-(sp)
    35aa:	2f2f 0078      	move.l 120(sp),-(sp)
    35ae:	4879 0001 683c 	pea 1683c <destlinezoom11>
    35b4:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 269);
    35b6:	4fef 0020      	lea 32(sp),sp
    35ba:	4878 010d      	pea 10d <main+0x107>
    35be:	2f04           	move.l d4,-(sp)
    35c0:	2f2f 0044      	move.l 68(sp),-(sp)
    35c4:	4879 0001 683c 	pea 1683c <destlinezoom11>
    35ca:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    35cc:	4878 0001      	pea 1 <_start+0x1>
    35d0:	4878 000b      	pea b <main+0x5>
    35d4:	2f03           	move.l d3,-(sp)
    35d6:	2f0c           	move.l a4,-(sp)
    35d8:	4eba da78      	jsr 1052 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    35dc:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    35e2:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    35e6:	4fef 001c      	lea 28(sp),sp
    35ea:	4297           	clr.l (sp)
    35ec:	42a7           	clr.l -(sp)
    35ee:	2f2f 0034      	move.l 52(sp),-(sp)
    35f2:	4879 0001 6810 	pea 16810 <destlinezoom12>
    35f8:	4e95           	jsr (a5)
    35fa:	4fef 0010      	lea 16(sp),sp
    35fe:	282f 0038      	move.l 56(sp),d4
  valactual += ZMLINESIZE/2;
    3602:	266f 0040      	movea.l 64(sp),a3
  TestRow( valsupposed, valactual, mask, 0);
    3606:	347c 0001      	movea.w #1,a2
  mask = mask ^ 0xffff;
    360a:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    360c:	7a00           	moveq #0,d5
    360e:	3a02           	move.w d2,d5
    3610:	2f0a           	move.l a2,-(sp)
    3612:	2f05           	move.l d5,-(sp)
    3614:	2f0b           	move.l a3,-(sp)
    3616:	4879 0001 6810 	pea 16810 <destlinezoom12>
    361c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    361e:	486a 0001      	pea 1(a2)
    3622:	2f05           	move.l d5,-(sp)
    3624:	486b 0030      	pea 48(a3)
    3628:	4879 0001 6810 	pea 16810 <destlinezoom12>
    362e:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3630:	4642           	not.w d2
    3632:	548a           	addq.l #2,a2
  for(int i2=0;i2<12;i2++) {
    3634:	4fef 0020      	lea 32(sp),sp
    3638:	7019           	moveq #25,d0
    363a:	b08a           	cmp.l a2,d0
    363c:	673e           	beq.s 367c <ZoomTest+0x1c24>
    363e:	200b           	move.l a3,d0
    3640:	0680 0000 00c0 	addi.l #192,d0
    3646:	2644           	movea.l d4,a3
    3648:	2800           	move.l d0,d4
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    364a:	7a00           	moveq #0,d5
    364c:	3a02           	move.w d2,d5
    364e:	2f0a           	move.l a2,-(sp)
    3650:	2f05           	move.l d5,-(sp)
    3652:	2f0b           	move.l a3,-(sp)
    3654:	4879 0001 6810 	pea 16810 <destlinezoom12>
    365a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    365c:	486a 0001      	pea 1(a2)
    3660:	2f05           	move.l d5,-(sp)
    3662:	486b 0030      	pea 48(a3)
    3666:	4879 0001 6810 	pea 16810 <destlinezoom12>
    366c:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    366e:	4642           	not.w d2
    3670:	548a           	addq.l #2,a2
  for(int i2=0;i2<12;i2++) {
    3672:	4fef 0020      	lea 32(sp),sp
    3676:	7019           	moveq #25,d0
    3678:	b08a           	cmp.l a2,d0
    367a:	66c2           	bne.s 363e <ZoomTest+0x1be6>
    367c:	2a04           	move.l d4,d5
    367e:	0685 0000 0120 	addi.l #288,d5
    3684:	347c 001f      	movea.w #31,a2
    3688:	2645           	movea.l d5,a3
    368a:	47eb fee0      	lea -288(a3),a3
    368e:	2c0a           	move.l a2,d6
    3690:	5d86           	subq.l #6,d6
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    3692:	2f06           	move.l d6,-(sp)
    3694:	3f02           	move.w d2,-(sp)
    3696:	4267           	clr.w -(sp)
    3698:	2f0b           	move.l a3,-(sp)
    369a:	4879 0001 6810 	pea 16810 <destlinezoom12>
    36a0:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    36a2:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    36a6:	4642           	not.w d2
    36a8:	5286           	addq.l #1,d6
    for(int i2=0;i2<6;i2++) {  
    36aa:	4fef 0010      	lea 16(sp),sp
    36ae:	ba8b           	cmp.l a3,d5
    36b0:	66e0           	bne.s 3692 <ZoomTest+0x1c3a>
    36b2:	2c4a           	movea.l a2,a6
    36b4:	2e0b           	move.l a3,d7
    36b6:	0687 0000 0480 	addi.l #1152,d7
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    36bc:	7c00           	moveq #0,d6
    36be:	3c02           	move.w d2,d6
    36c0:	2f0e           	move.l a6,-(sp)
    36c2:	2f06           	move.l d6,-(sp)
    36c4:	2f0b           	move.l a3,-(sp)
    36c6:	4879 0001 6810 	pea 16810 <destlinezoom12>
    36cc:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    36ce:	486e 0001      	pea 1(a6)
    36d2:	2f06           	move.l d6,-(sp)
    36d4:	486b 0030      	pea 48(a3)
    36d8:	4879 0001 6810 	pea 16810 <destlinezoom12>
    36de:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    36e0:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    36e4:	4642           	not.w d2
    36e6:	548e           	addq.l #2,a6
    for(int i2=0;i2<12;i2++) {
    36e8:	4fef 0020      	lea 32(sp),sp
    36ec:	be8b           	cmp.l a3,d7
    36ee:	66cc           	bne.s 36bc <ZoomTest+0x1c64>
    36f0:	0685 0000 05a0 	addi.l #1440,d5
    36f6:	45ea 001e      	lea 30(a2),a2
  for(int i=0;i<8;i++) {
    36fa:	b4fc 010f      	cmpa.w #271,a2
    36fe:	6688           	bne.s 3688 <ZoomTest+0x1c30>
    3700:	2444           	movea.l d4,a2
    3702:	45ea 2d00      	lea 11520(a2),a2
    3706:	283c 0000 0104 	move.l #260,d4
    TestRow( valsupposed, valactual, mask, 260+i2);
    370c:	2f04           	move.l d4,-(sp)
    370e:	3f02           	move.w d2,-(sp)
    3710:	4267           	clr.w -(sp)
    3712:	2f0a           	move.l a2,-(sp)
    3714:	4879 0001 6810 	pea 16810 <destlinezoom12>
    371a:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    371c:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    3720:	4642           	not.w d2
    3722:	5284           	addq.l #1,d4
  for(int i2=0;i2<5;i2++) {  
    3724:	4fef 0010      	lea 16(sp),sp
    3728:	0c84 0000 0109 	cmpi.l #265,d4
    372e:	66dc           	bne.s 370c <ZoomTest+0x1cb4>
  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    3730:	4878 0001      	pea 1 <_start+0x1>
    3734:	4878 000c      	pea c <main+0x6>
    3738:	2f0c           	move.l a4,-(sp)
    373a:	2f03           	move.l d3,-(sp)
    373c:	4eba d914      	jsr 1052 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3740:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    3746:	4eae ff1c      	jsr -228(a6)
    374a:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    374e:	266f 0034      	movea.l 52(sp),a3
  WaitBlit();
    3752:	347c 0001      	movea.w #1,a2
  mask = 0xffff;
    3756:	7cff           	moveq #-1,d6
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3758:	7400           	moveq #0,d2
    375a:	3406           	move.w d6,d2
    375c:	486a ffff      	pea -1(a2)
    3760:	2f02           	move.l d2,-(sp)
    3762:	2f0b           	move.l a3,-(sp)
    3764:	4879 0001 67e4 	pea 167e4 <destlinezoom13>
    376a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    376c:	2f0a           	move.l a2,-(sp)
    376e:	2f02           	move.l d2,-(sp)
    3770:	486b 0030      	pea 48(a3)
    3774:	4879 0001 67e4 	pea 167e4 <destlinezoom13>
    377a:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    377c:	4646           	not.w d6
    377e:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3780:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<11;i2++) {
    3784:	4fef 0020      	lea 32(sp),sp
    3788:	7217           	moveq #23,d1
    378a:	b28a           	cmp.l a2,d1
    378c:	66ca           	bne.s 3758 <ZoomTest+0x1d00>
    378e:	240c           	move.l a4,d2
    3790:	0682 0000 0514 	addi.l #1300,d2
    3796:	3c7c 001b      	movea.w #27,a6
    379a:	2a0a           	move.l a2,d5
    379c:	2642           	movea.l d2,a3
    379e:	47eb ff10      	lea -240(a3),a3
    37a2:	280e           	move.l a6,d4
    37a4:	5b84           	subq.l #5,d4
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    37a6:	2f04           	move.l d4,-(sp)
    37a8:	3f06           	move.w d6,-(sp)
    37aa:	4267           	clr.w -(sp)
    37ac:	2f0b           	move.l a3,-(sp)
    37ae:	4879 0001 67e4 	pea 167e4 <destlinezoom13>
    37b4:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    37b6:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    37ba:	4646           	not.w d6
    37bc:	5284           	addq.l #1,d4
    for(int i2=0;i2<5;i2++) {  
    37be:	4fef 0010      	lea 16(sp),sp
    37c2:	b48b           	cmp.l a3,d2
    37c4:	66e0           	bne.s 37a6 <ZoomTest+0x1d4e>
    37c6:	244e           	movea.l a6,a2
    37c8:	2e0b           	move.l a3,d7
    37ca:	0687 0000 04e0 	addi.l #1248,d7
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    37d0:	7800           	moveq #0,d4
    37d2:	3806           	move.w d6,d4
    37d4:	2f0a           	move.l a2,-(sp)
    37d6:	2f04           	move.l d4,-(sp)
    37d8:	2f0b           	move.l a3,-(sp)
    37da:	4879 0001 67e4 	pea 167e4 <destlinezoom13>
    37e0:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    37e2:	486a 0001      	pea 1(a2)
    37e6:	2f04           	move.l d4,-(sp)
    37e8:	486b 0030      	pea 48(a3)
    37ec:	4879 0001 67e4 	pea 167e4 <destlinezoom13>
    37f2:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    37f4:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    37f8:	4646           	not.w d6
    37fa:	548a           	addq.l #2,a2
    for(int i2=0;i2<13;i2++) {
    37fc:	4fef 0020      	lea 32(sp),sp
    3800:	be8b           	cmp.l a3,d7
    3802:	66cc           	bne.s 37d0 <ZoomTest+0x1d78>
    3804:	0682 0000 05d0 	addi.l #1488,d2
    380a:	4dee 001f      	lea 31(a6),a6
  for(int i=0;i<8;i++) {
    380e:	bcfc 0113      	cmpa.w #275,a6
    3812:	6688           	bne.s 379c <ZoomTest+0x1d44>
    3814:	2445           	movea.l d5,a2
  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    3816:	4878 0001      	pea 1 <_start+0x1>
    381a:	4878 000d      	pea d <main+0x7>
    381e:	2f03           	move.l d3,-(sp)
    3820:	2f0c           	move.l a4,-(sp)
    3822:	4eba d82e      	jsr 1052 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3826:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    382c:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);   
    3830:	42a7           	clr.l -(sp)
    3832:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3838:	2f2f 0044      	move.l 68(sp),-(sp)
    383c:	4879 0001 67b8 	pea 167b8 <destlinezoom14>
    3842:	4e95           	jsr (a5)
    3844:	4fef 0020      	lea 32(sp),sp
    3848:	242f 0038      	move.l 56(sp),d2
  valactual += ZMLINESIZE/2; 
    384c:	2c6f 0040      	movea.l 64(sp),a6
  TestRow( valsupposed, valactual, mask, 0);   
    3850:	367c 0001      	movea.w #1,a3
  mask = mask ^ 0xffff; 
    3854:	4247           	clr.w d7
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3856:	7800           	moveq #0,d4
    3858:	3807           	move.w d7,d4
    385a:	2f0b           	move.l a3,-(sp)
    385c:	2f04           	move.l d4,-(sp)
    385e:	2f0e           	move.l a6,-(sp)
    3860:	4879 0001 67b8 	pea 167b8 <destlinezoom14>
    3866:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3868:	486b 0001      	pea 1(a3)
    386c:	2f04           	move.l d4,-(sp)
    386e:	486e 0030      	pea 48(a6)
    3872:	4879 0001 67b8 	pea 167b8 <destlinezoom14>
    3878:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    387a:	4647           	not.w d7
    387c:	548b           	addq.l #2,a3
  for(int i2=0;i2<9;i2++) {
    387e:	4fef 0020      	lea 32(sp),sp
    3882:	7013           	moveq #19,d0
    3884:	b08b           	cmp.l a3,d0
    3886:	673e           	beq.s 38c6 <ZoomTest+0x1e6e>
    3888:	200e           	move.l a6,d0
    388a:	0680 0000 00c0 	addi.l #192,d0
    3890:	2c42           	movea.l d2,a6
    3892:	2400           	move.l d0,d2
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3894:	7800           	moveq #0,d4
    3896:	3807           	move.w d7,d4
    3898:	2f0b           	move.l a3,-(sp)
    389a:	2f04           	move.l d4,-(sp)
    389c:	2f0e           	move.l a6,-(sp)
    389e:	4879 0001 67b8 	pea 167b8 <destlinezoom14>
    38a4:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    38a6:	486b 0001      	pea 1(a3)
    38aa:	2f04           	move.l d4,-(sp)
    38ac:	486e 0030      	pea 48(a6)
    38b0:	4879 0001 67b8 	pea 167b8 <destlinezoom14>
    38b6:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    38b8:	4647           	not.w d7
    38ba:	548b           	addq.l #2,a3
  for(int i2=0;i2<9;i2++) {
    38bc:	4fef 0020      	lea 32(sp),sp
    38c0:	7013           	moveq #19,d0
    38c2:	b08b           	cmp.l a3,d0
    38c4:	66c2           	bne.s 3888 <ZoomTest+0x1e30>
    38c6:	2802           	move.l d2,d4
    38c8:	0684 0000 00c0 	addi.l #192,d4
    38ce:	2c0b           	move.l a3,d6
    38d0:	2c44           	movea.l d4,a6
    38d2:	4dee ff40      	lea -192(a6),a6
    38d6:	2a0a           	move.l a2,d5
    38d8:	5985           	subq.l #4,d5
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    38da:	2f05           	move.l d5,-(sp)
    38dc:	3f07           	move.w d7,-(sp)
    38de:	4267           	clr.w -(sp)
    38e0:	2f0e           	move.l a6,-(sp)
    38e2:	4879 0001 67b8 	pea 167b8 <destlinezoom14>
    38e8:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    38ea:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    38ee:	4647           	not.w d7
    38f0:	5285           	addq.l #1,d5
    for(int i2=0;i2<4;i2++) {  
    38f2:	4fef 0010      	lea 16(sp),sp
    38f6:	b88e           	cmp.l a6,d4
    38f8:	66e0           	bne.s 38da <ZoomTest+0x1e82>
    38fa:	264a           	movea.l a2,a3
    38fc:	41ee 0540      	lea 1344(a6),a0
    3900:	2f48 003c      	move.l a0,60(sp)
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    3904:	7a00           	moveq #0,d5
    3906:	3a07           	move.w d7,d5
    3908:	2f0b           	move.l a3,-(sp)
    390a:	2f05           	move.l d5,-(sp)
    390c:	2f0e           	move.l a6,-(sp)
    390e:	4879 0001 67b8 	pea 167b8 <destlinezoom14>
    3914:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    3916:	486b 0001      	pea 1(a3)
    391a:	2f05           	move.l d5,-(sp)
    391c:	486e 0030      	pea 48(a6)
    3920:	4879 0001 67b8 	pea 167b8 <destlinezoom14>
    3926:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3928:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    392c:	4647           	not.w d7
    392e:	548b           	addq.l #2,a3
    for(int i2=0;i2<14;i2++) {
    3930:	4fef 0020      	lea 32(sp),sp
    3934:	bdef 003c      	cmpa.l 60(sp),a6
    3938:	66ca           	bne.s 3904 <ZoomTest+0x1eac>
    393a:	0684 0000 0600 	addi.l #1536,d4
    3940:	45ea 0020      	lea 32(a2),a2
  for(int i=0;i<7;i++) {
    3944:	b4fc 00f7      	cmpa.w #247,a2
    3948:	6686           	bne.s 38d0 <ZoomTest+0x1e78>
    394a:	2646           	movea.l d6,a3
    394c:	2c42           	movea.l d2,a6
    394e:	4dee 2a00      	lea 10752(a6),a6
    3952:	347c 00f3      	movea.w #243,a2
    TestRow( valsupposed, valactual, mask, 243+i2);
    3956:	2f0a           	move.l a2,-(sp)
    3958:	3f07           	move.w d7,-(sp)
    395a:	4267           	clr.w -(sp)
    395c:	2f0e           	move.l a6,-(sp)
    395e:	4879 0001 67b8 	pea 167b8 <destlinezoom14>
    3964:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3966:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    396a:	4647           	not.w d7
    396c:	528a           	addq.l #1,a2
  for(int i2=0;i2<4;i2++) {  
    396e:	4fef 0010      	lea 16(sp),sp
    3972:	b4fc 00f7      	cmpa.w #247,a2
    3976:	66de           	bne.s 3956 <ZoomTest+0x1efe>
    3978:	0682 0000 2ac0 	addi.l #10944,d2
    397e:	2c4a           	movea.l a2,a6
    3980:	280a           	move.l a2,d4
    3982:	2442           	movea.l d2,a2
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    3984:	7400           	moveq #0,d2
    3986:	3407           	move.w d7,d2
    3988:	2f0e           	move.l a6,-(sp)
    398a:	2f02           	move.l d2,-(sp)
    398c:	2f0a           	move.l a2,-(sp)
    398e:	4879 0001 67b8 	pea 167b8 <destlinezoom14>
    3994:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    3996:	486e 0001      	pea 1(a6)
    399a:	2f02           	move.l d2,-(sp)
    399c:	486a 0030      	pea 48(a2)
    39a0:	4879 0001 67b8 	pea 167b8 <destlinezoom14>
    39a6:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    39a8:	4647           	not.w d7
    39aa:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    39ac:	45ea 0060      	lea 96(a2),a2
  for(int i2=0;i2<12;i2++) {
    39b0:	4fef 0020      	lea 32(sp),sp
    39b4:	bcfc 010f      	cmpa.w #271,a6
    39b8:	66ca           	bne.s 3984 <ZoomTest+0x1f2c>
  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    39ba:	4878 0001      	pea 1 <_start+0x1>
    39be:	4878 000e      	pea e <main+0x8>
    39c2:	2f0c           	move.l a4,-(sp)
    39c4:	2f03           	move.l d3,-(sp)
    39c6:	4eba d68a      	jsr 1052 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    39ca:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    39d0:	4eae ff1c      	jsr -228(a6)
    39d4:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    39d8:	242f 0034      	move.l 52(sp),d2
  WaitBlit();
    39dc:	3c7c 0001      	movea.w #1,a6
  mask = 0x0000;
    39e0:	4246           	clr.w d6
    39e2:	2442           	movea.l d2,a2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    39e4:	7400           	moveq #0,d2
    39e6:	3406           	move.w d6,d2
    39e8:	486e ffff      	pea -1(a6)
    39ec:	2f02           	move.l d2,-(sp)
    39ee:	2f0a           	move.l a2,-(sp)
    39f0:	4879 0001 678c 	pea 1678c <destlinezoom15>
    39f6:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    39f8:	2f0e           	move.l a6,-(sp)
    39fa:	2f02           	move.l d2,-(sp)
    39fc:	486a 0030      	pea 48(a2)
    3a00:	4879 0001 678c 	pea 1678c <destlinezoom15>
    3a06:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3a08:	4646           	not.w d6
    3a0a:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    3a0c:	45ea 0060      	lea 96(a2),a2
  for(int i2=0;i2<8;i2++) {
    3a10:	4fef 0020      	lea 32(sp),sp
    3a14:	7011           	moveq #17,d0
    3a16:	b08e           	cmp.l a6,d0
    3a18:	66ca           	bne.s 39e4 <ZoomTest+0x1f8c>
    3a1a:	2444           	movea.l d4,a2
    3a1c:	242f 005c      	move.l 92(sp),d2
    3a20:	2c42           	movea.l d2,a6
    3a22:	4dee ff70      	lea -144(a6),a6
    3a26:	280b           	move.l a3,d4
    3a28:	5784           	subq.l #3,d4
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    3a2a:	2f04           	move.l d4,-(sp)
    3a2c:	3f06           	move.w d6,-(sp)
    3a2e:	4267           	clr.w -(sp)
    3a30:	2f0e           	move.l a6,-(sp)
    3a32:	4879 0001 678c 	pea 1678c <destlinezoom15>
    3a38:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3a3a:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    3a3e:	4646           	not.w d6
    3a40:	5284           	addq.l #1,d4
    for(int i2=0;i2<3;i2++) {  
    3a42:	4fef 0010      	lea 16(sp),sp
    3a46:	b48e           	cmp.l a6,d2
    3a48:	66e0           	bne.s 3a2a <ZoomTest+0x1fd2>
    3a4a:	280b           	move.l a3,d4
    3a4c:	2e0e           	move.l a6,d7
    3a4e:	0687 0000 05a0 	addi.l #1440,d7
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    3a54:	7a00           	moveq #0,d5
    3a56:	3a06           	move.w d6,d5
    3a58:	2f04           	move.l d4,-(sp)
    3a5a:	2f05           	move.l d5,-(sp)
    3a5c:	2f0e           	move.l a6,-(sp)
    3a5e:	4879 0001 678c 	pea 1678c <destlinezoom15>
    3a64:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    3a66:	2f04           	move.l d4,-(sp)
    3a68:	2f05           	move.l d5,-(sp)
    3a6a:	486e 0030      	pea 48(a6)
    3a6e:	4879 0001 678c 	pea 1678c <destlinezoom15>
    3a74:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3a76:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    3a7a:	4646           	not.w d6
    3a7c:	5484           	addq.l #2,d4
    for(int i2=0;i2<15;i2++) {
    3a7e:	4fef 0020      	lea 32(sp),sp
    3a82:	be8e           	cmp.l a6,d7
    3a84:	66ce           	bne.s 3a54 <ZoomTest+0x1ffc>
    3a86:	0682 0000 0630 	addi.l #1584,d2
    3a8c:	47eb 0021      	lea 33(a3),a3
  for(int i=0;i<7;i++) {
    3a90:	b6fc 00fa      	cmpa.w #250,a3
    3a94:	668a           	bne.s 3a20 <ZoomTest+0x1fc8>
    3a96:	47ec 2e54      	lea 11860(a4),a3
    TestRow( valsupposed, valactual, mask, 247+i2);
    3a9a:	2f0a           	move.l a2,-(sp)
    3a9c:	3f06           	move.w d6,-(sp)
    3a9e:	4267           	clr.w -(sp)
    3aa0:	2f0b           	move.l a3,-(sp)
    3aa2:	4879 0001 678c 	pea 1678c <destlinezoom15>
    3aa8:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3aaa:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    3aae:	4646           	not.w d6
    3ab0:	528a           	addq.l #1,a2
  for(int i2=0;i2<3;i2++) {  
    3ab2:	4fef 0010      	lea 16(sp),sp
    3ab6:	b4fc 00fa      	cmpa.w #250,a2
    3aba:	66de           	bne.s 3a9a <ZoomTest+0x2042>
    3abc:	266f 0030      	movea.l 48(sp),a3
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    3ac0:	7400           	moveq #0,d2
    3ac2:	3406           	move.w d6,d2
    3ac4:	2f0a           	move.l a2,-(sp)
    3ac6:	2f02           	move.l d2,-(sp)
    3ac8:	2f0b           	move.l a3,-(sp)
    3aca:	4879 0001 678c 	pea 1678c <destlinezoom15>
    3ad0:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    3ad2:	486a 0001      	pea 1(a2)
    3ad6:	2f02           	move.l d2,-(sp)
    3ad8:	486b 0030      	pea 48(a3)
    3adc:	4879 0001 678c 	pea 1678c <destlinezoom15>
    3ae2:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3ae4:	4646           	not.w d6
    3ae6:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3ae8:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<10;i2++) {
    3aec:	4fef 0020      	lea 32(sp),sp
    3af0:	b4fc 010e      	cmpa.w #270,a2
    3af4:	66ca           	bne.s 3ac0 <ZoomTest+0x2068>
  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    3af6:	4878 0001      	pea 1 <_start+0x1>
    3afa:	4878 000f      	pea f <main+0x9>
    3afe:	2f03           	move.l d3,-(sp)
    3b00:	2f0c           	move.l a4,-(sp)
    3b02:	4eba d54e      	jsr 1052 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3b06:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    3b0c:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);   
    3b10:	42a7           	clr.l -(sp)
    3b12:	42a7           	clr.l -(sp)
    3b14:	2f2f 0044      	move.l 68(sp),-(sp)
    3b18:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3b1e:	4e95           	jsr (a5)
    3b20:	4fef 0020      	lea 32(sp),sp
    3b24:	246f 0044      	movea.l 68(sp),a2
    3b28:	2c6f 0038      	movea.l 56(sp),a6
  valactual += ZMLINESIZE/2;
    3b2c:	282f 0040      	move.l 64(sp),d4
  TestRow( valsupposed, valactual, mask, 0);   
    3b30:	97cb           	suba.l a3,a3
  mask = mask ^ 0xffff;
    3b32:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3b34:	7a00           	moveq #0,d5
    3b36:	3a02           	move.w d2,d5
    3b38:	2f0b           	move.l a3,-(sp)
    3b3a:	2f05           	move.l d5,-(sp)
    3b3c:	2f04           	move.l d4,-(sp)
    3b3e:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3b44:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3b46:	486b 0001      	pea 1(a3)
    3b4a:	2f05           	move.l d5,-(sp)
    3b4c:	2044           	movea.l d4,a0
    3b4e:	4868 0030      	pea 48(a0)
    3b52:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3b58:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3b5a:	4642           	not.w d2
    3b5c:	2004           	move.l d4,d0
    3b5e:	0680 0000 0120 	addi.l #288,d0
    3b64:	548b           	addq.l #2,a3
    3b66:	280e           	move.l a6,d4
  for(int i2=0;i2<6;i2++) {
    3b68:	4fef 0020      	lea 32(sp),sp
    3b6c:	720c           	moveq #12,d1
    3b6e:	b28b           	cmp.l a3,d1
    3b70:	6742           	beq.s 3bb4 <ZoomTest+0x215c>
    3b72:	2c4a           	movea.l a2,a6
    3b74:	2440           	movea.l d0,a2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3b76:	7a00           	moveq #0,d5
    3b78:	3a02           	move.w d2,d5
    3b7a:	2f0b           	move.l a3,-(sp)
    3b7c:	2f05           	move.l d5,-(sp)
    3b7e:	2f04           	move.l d4,-(sp)
    3b80:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3b86:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3b88:	486b 0001      	pea 1(a3)
    3b8c:	2f05           	move.l d5,-(sp)
    3b8e:	2044           	movea.l d4,a0
    3b90:	4868 0030      	pea 48(a0)
    3b94:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3b9a:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3b9c:	4642           	not.w d2
    3b9e:	2004           	move.l d4,d0
    3ba0:	0680 0000 0120 	addi.l #288,d0
    3ba6:	548b           	addq.l #2,a3
    3ba8:	280e           	move.l a6,d4
  for(int i2=0;i2<6;i2++) {
    3baa:	4fef 0020      	lea 32(sp),sp
    3bae:	720c           	moveq #12,d1
    3bb0:	b28b           	cmp.l a3,d1
    3bb2:	66be           	bne.s 3b72 <ZoomTest+0x211a>
    3bb4:	367c 000d      	movea.w #13,a3
    3bb8:	2a0c           	move.l a4,d5
    3bba:	2e00           	move.l d0,d7
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3bbc:	2f0b           	move.l a3,-(sp)
    3bbe:	7800           	moveq #0,d4
    3bc0:	3802           	move.w d2,d4
    3bc2:	2f04           	move.l d4,-(sp)
    3bc4:	2f0e           	move.l a6,-(sp)
    3bc6:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3bcc:	4e95           	jsr (a5)
    3bce:	486b 0001      	pea 1(a3)
      mask = mask ^ 0xffff;
    3bd2:	3c02           	move.w d2,d6
    3bd4:	4646           	not.w d6
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3bd6:	3f06           	move.w d6,-(sp)
    3bd8:	4267           	clr.w -(sp)
    3bda:	486e 0030      	pea 48(a6)
    3bde:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3be4:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3be6:	49eb 0003      	lea 3(a3),a4
    3bea:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3bee:	2c47           	movea.l d7,a6
    3bf0:	7e23           	moveq #35,d7
    3bf2:	de8b           	add.l a3,d7
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    3bf4:	2f0c           	move.l a4,-(sp)
    3bf6:	2f04           	move.l d4,-(sp)
    3bf8:	2f0a           	move.l a2,-(sp)
    3bfa:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3c00:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    3c02:	486c 0001      	pea 1(a4)
    3c06:	2f04           	move.l d4,-(sp)
    3c08:	486a 0030      	pea 48(a2)
    3c0c:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3c12:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3c14:	3406           	move.w d6,d2
    3c16:	41ea 00c0      	lea 192(a2),a0
    3c1a:	548c           	addq.l #2,a4
    for(int i2=0;i2<16;i2++) {
    3c1c:	4fef 0020      	lea 32(sp),sp
    3c20:	b9c7           	cmpa.l d7,a4
    3c22:	673a           	beq.s 3c5e <ZoomTest+0x2206>
    3c24:	244e           	movea.l a6,a2
    3c26:	2c48           	movea.l a0,a6
    3c28:	7800           	moveq #0,d4
    3c2a:	3806           	move.w d6,d4
    3c2c:	4646           	not.w d6
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    3c2e:	2f0c           	move.l a4,-(sp)
    3c30:	2f04           	move.l d4,-(sp)
    3c32:	2f0a           	move.l a2,-(sp)
    3c34:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3c3a:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    3c3c:	486c 0001      	pea 1(a4)
    3c40:	2f04           	move.l d4,-(sp)
    3c42:	486a 0030      	pea 48(a2)
    3c46:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3c4c:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3c4e:	3406           	move.w d6,d2
    3c50:	41ea 00c0      	lea 192(a2),a0
    3c54:	548c           	addq.l #2,a4
    for(int i2=0;i2<16;i2++) {
    3c56:	4fef 0020      	lea 32(sp),sp
    3c5a:	b9c7           	cmpa.l d7,a4
    3c5c:	66c6           	bne.s 3c24 <ZoomTest+0x21cc>
    3c5e:	47eb 0022      	lea 34(a3),a3
  for(int i=0;i<7;i++) {
    3c62:	b6fc 00fb      	cmpa.w #251,a3
    3c66:	674e           	beq.s 3cb6 <ZoomTest+0x225e>
    3c68:	2e0a           	move.l a2,d7
    3c6a:	0687 0000 0120 	addi.l #288,d7
    3c70:	2448           	movea.l a0,a2
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3c72:	2f0b           	move.l a3,-(sp)
    3c74:	7800           	moveq #0,d4
    3c76:	3802           	move.w d2,d4
    3c78:	2f04           	move.l d4,-(sp)
    3c7a:	2f0e           	move.l a6,-(sp)
    3c7c:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3c82:	4e95           	jsr (a5)
    3c84:	486b 0001      	pea 1(a3)
      mask = mask ^ 0xffff;
    3c88:	3c02           	move.w d2,d6
    3c8a:	4646           	not.w d6
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3c8c:	3f06           	move.w d6,-(sp)
    3c8e:	4267           	clr.w -(sp)
    3c90:	486e 0030      	pea 48(a6)
    3c94:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3c9a:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3c9c:	49eb 0003      	lea 3(a3),a4
    3ca0:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3ca4:	2c47           	movea.l d7,a6
    3ca6:	7e23           	moveq #35,d7
    3ca8:	de8b           	add.l a3,d7
    3caa:	6000 ff48      	bra.w 3bf4 <ZoomTest+0x219c>
    3cae:	7800           	moveq #0,d4
    3cb0:	3802           	move.w d2,d4
    3cb2:	6000 e754      	bra.w 2408 <ZoomTest+0x9b0>
    3cb6:	2845           	movea.l d5,a4
    3cb8:	2a08           	move.l a0,d5
    TestRow( valsupposed, valactual, mask, 251+i2);
    3cba:	2f0b           	move.l a3,-(sp)
    3cbc:	7c00           	moveq #0,d6
    3cbe:	3c02           	move.w d2,d6
    3cc0:	2f06           	move.l d6,-(sp)
    3cc2:	2f0e           	move.l a6,-(sp)
    3cc4:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3cca:	4e95           	jsr (a5)
    3ccc:	4878 00fc      	pea fc <main+0xf6>
    3cd0:	2f04           	move.l d4,-(sp)
    3cd2:	486a 0090      	pea 144(a2)
    3cd6:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3cdc:	4e95           	jsr (a5)
    3cde:	4fef 0020      	lea 32(sp),sp
    3ce2:	347c 00fd      	movea.w #253,a2
    3ce6:	2645           	movea.l d5,a3
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    3ce8:	2f0a           	move.l a2,-(sp)
    3cea:	2f06           	move.l d6,-(sp)
    3cec:	2f0b           	move.l a3,-(sp)
    3cee:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3cf4:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    3cf6:	486a 0001      	pea 1(a2)
    3cfa:	2f06           	move.l d6,-(sp)
    3cfc:	486b 0030      	pea 48(a3)
    3d00:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3d06:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3d08:	4642           	not.w d2
    3d0a:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3d0c:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<8;i2++) {
    3d10:	4fef 0020      	lea 32(sp),sp
    3d14:	b4fc 010d      	cmpa.w #269,a2
    3d18:	6736           	beq.s 3d50 <ZoomTest+0x22f8>
    3d1a:	7c00           	moveq #0,d6
    3d1c:	3c02           	move.w d2,d6
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    3d1e:	2f0a           	move.l a2,-(sp)
    3d20:	2f06           	move.l d6,-(sp)
    3d22:	2f0b           	move.l a3,-(sp)
    3d24:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3d2a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    3d2c:	486a 0001      	pea 1(a2)
    3d30:	2f06           	move.l d6,-(sp)
    3d32:	486b 0030      	pea 48(a3)
    3d36:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3d3c:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3d3e:	4642           	not.w d2
    3d40:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3d42:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<8;i2++) {
    3d46:	4fef 0020      	lea 32(sp),sp
    3d4a:	b4fc 010d      	cmpa.w #269,a2
    3d4e:	66ca           	bne.s 3d1a <ZoomTest+0x22c2>
  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    3d50:	4878 0001      	pea 1 <_start+0x1>
    3d54:	4878 0010      	pea 10 <main+0xa>
    3d58:	2f0c           	move.l a4,-(sp)
    3d5a:	2f03           	move.l d3,-(sp)
    3d5c:	4eba d2f4      	jsr 1052 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3d60:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    3d66:	4eae ff1c      	jsr -228(a6)
    3d6a:	4fef 0010      	lea 16(sp),sp
    3d6e:	347c 0001      	movea.w #1,a2
  mask = 0xffff;
    3d72:	7eff           	moveq #-1,d7
    3d74:	266f 0034      	movea.l 52(sp),a3
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3d78:	7400           	moveq #0,d2
    3d7a:	3407           	move.w d7,d2
    3d7c:	486a ffff      	pea -1(a2)
    3d80:	2f02           	move.l d2,-(sp)
    3d82:	2f0b           	move.l a3,-(sp)
    3d84:	4879 0001 6734 	pea 16734 <destlinezoom17>
    3d8a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3d8c:	2f0a           	move.l a2,-(sp)
    3d8e:	2f02           	move.l d2,-(sp)
    3d90:	486b 0030      	pea 48(a3)
    3d94:	4879 0001 6734 	pea 16734 <destlinezoom17>
    3d9a:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3d9c:	4647           	not.w d7
    3d9e:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3da0:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<5;i2++) {
    3da4:	4fef 0020      	lea 32(sp),sp
    3da8:	700b           	moveq #11,d0
    3daa:	b08a           	cmp.l a2,d0
    3dac:	66ca           	bne.s 3d78 <ZoomTest+0x2320>
    3dae:	2a0c           	move.l a4,d5
    3db0:	0685 0000 01e4 	addi.l #484,d5
    3db6:	367c 000a      	movea.w #10,a3
    3dba:	2f4c 0034      	move.l a4,52(sp)
    3dbe:	2c0a           	move.l a2,d6
    3dc0:	2445           	movea.l d5,a2
      TestRow( valsupposed, valactual, mask, 10+i*35);
    3dc2:	2f0b           	move.l a3,-(sp)
    3dc4:	3f07           	move.w d7,-(sp)
    3dc6:	4267           	clr.w -(sp)
    3dc8:	2f0a           	move.l a2,-(sp)
    3dca:	4879 0001 6734 	pea 16734 <destlinezoom17>
    3dd0:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3dd2:	4dea 0030      	lea 48(a2),a6
      mask = mask ^ 0xffff;
    3dd6:	3807           	move.w d7,d4
    3dd8:	4644           	not.w d4
    for(int i2=0;i2<17;i2++) {
    3dda:	49eb 0001      	lea 1(a3),a4
    3dde:	4fef 0010      	lea 16(sp),sp
    3de2:	45ea 0690      	lea 1680(a2),a2
    3de6:	2a0a           	move.l a2,d5
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3de8:	7400           	moveq #0,d2
    3dea:	3404           	move.w d4,d2
    3dec:	2f0c           	move.l a4,-(sp)
    3dee:	2f02           	move.l d2,-(sp)
    3df0:	2f0e           	move.l a6,-(sp)
    3df2:	4879 0001 6734 	pea 16734 <destlinezoom17>
    3df8:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3dfa:	486c 0001      	pea 1(a4)
    3dfe:	2f02           	move.l d2,-(sp)
    3e00:	486e 0030      	pea 48(a6)
    3e04:	4879 0001 6734 	pea 16734 <destlinezoom17>
    3e0a:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3e0c:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    3e10:	4644           	not.w d4
    3e12:	3e04           	move.w d4,d7
    3e14:	548c           	addq.l #2,a4
    for(int i2=0;i2<17;i2++) {
    3e16:	4fef 0020      	lea 32(sp),sp
    3e1a:	bdc5           	cmpa.l d5,a6
    3e1c:	66ca           	bne.s 3de8 <ZoomTest+0x2390>
    3e1e:	47eb 0023      	lea 35(a3),a3
  for(int i=0;i<7;i++) {
    3e22:	b6fc 00ff      	cmpa.w #255,a3
    3e26:	669a           	bne.s 3dc2 <ZoomTest+0x236a>
    3e28:	286f 0034      	movea.l 52(sp),a4
    3e2c:	2446           	movea.l d6,a2
  TestRow( valsupposed, valactual, mask, 255);
    3e2e:	2f0b           	move.l a3,-(sp)
    3e30:	3f04           	move.w d4,-(sp)
    3e32:	4267           	clr.w -(sp)
    3e34:	486c 2fd4      	pea 12244(a4)
    3e38:	4879 0001 6734 	pea 16734 <destlinezoom17>
    3e3e:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    3e40:	4dec 3004      	lea 12292(a4),a6
    3e44:	4fef 0010      	lea 16(sp),sp
    3e48:	367c 0100      	movea.w #256,a3
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3e4c:	2f0b           	move.l a3,-(sp)
    3e4e:	2f02           	move.l d2,-(sp)
    3e50:	2f0e           	move.l a6,-(sp)
    3e52:	4879 0001 6734 	pea 16734 <destlinezoom17>
    3e58:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3e5a:	486b 0001      	pea 1(a3)
    3e5e:	2f02           	move.l d2,-(sp)
    3e60:	486e 0030      	pea 48(a6)
    3e64:	4879 0001 6734 	pea 16734 <destlinezoom17>
    3e6a:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3e6c:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    3e6e:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<7;i2++) {
    3e72:	4fef 0020      	lea 32(sp),sp
    3e76:	b6fc 010e      	cmpa.w #270,a3
    3e7a:	6736           	beq.s 3eb2 <ZoomTest+0x245a>
    3e7c:	7400           	moveq #0,d2
    3e7e:	3404           	move.w d4,d2
    3e80:	4644           	not.w d4
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3e82:	2f0b           	move.l a3,-(sp)
    3e84:	2f02           	move.l d2,-(sp)
    3e86:	2f0e           	move.l a6,-(sp)
    3e88:	4879 0001 6734 	pea 16734 <destlinezoom17>
    3e8e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3e90:	486b 0001      	pea 1(a3)
    3e94:	2f02           	move.l d2,-(sp)
    3e96:	486e 0030      	pea 48(a6)
    3e9a:	4879 0001 6734 	pea 16734 <destlinezoom17>
    3ea0:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3ea2:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    3ea4:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<7;i2++) {
    3ea8:	4fef 0020      	lea 32(sp),sp
    3eac:	b6fc 010e      	cmpa.w #270,a3
    3eb0:	66ca           	bne.s 3e7c <ZoomTest+0x2424>
  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    3eb2:	4878 0001      	pea 1 <_start+0x1>
    3eb6:	4878 0011      	pea 11 <main+0xb>
    3eba:	2f03           	move.l d3,-(sp)
    3ebc:	2f0c           	move.l a4,-(sp)
    3ebe:	4eba d192      	jsr 1052 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3ec2:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    3ec8:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    3ecc:	42a7           	clr.l -(sp)
    3ece:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3ed4:	2f2f 0044      	move.l 68(sp),-(sp)
    3ed8:	4879 0001 6708 	pea 16708 <destlinezoom18>
    3ede:	4e95           	jsr (a5)
    3ee0:	4fef 0020      	lea 32(sp),sp
    3ee4:	367c 0001      	movea.w #1,a3
  mask = mask ^ 0xffff;
    3ee8:	4242           	clr.w d2
    3eea:	2a2f 0044      	move.l 68(sp),d5
    3eee:	2c6f 0040      	movea.l 64(sp),a6
    3ef2:	2c2f 0038      	move.l 56(sp),d6
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3ef6:	7800           	moveq #0,d4
    3ef8:	3802           	move.w d2,d4
    3efa:	2f0b           	move.l a3,-(sp)
    3efc:	2f04           	move.l d4,-(sp)
    3efe:	2f0e           	move.l a6,-(sp)
    3f00:	4879 0001 6708 	pea 16708 <destlinezoom18>
    3f06:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3f08:	486b 0001      	pea 1(a3)
    3f0c:	2f04           	move.l d4,-(sp)
    3f0e:	486e 0030      	pea 48(a6)
    3f12:	4879 0001 6708 	pea 16708 <destlinezoom18>
    3f18:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3f1a:	4642           	not.w d2
    3f1c:	200e           	move.l a6,d0
    3f1e:	0680 0000 0120 	addi.l #288,d0
    3f24:	548b           	addq.l #2,a3
    3f26:	2c46           	movea.l d6,a6
  for(int i2=0;i2<4;i2++) {
    3f28:	4fef 0020      	lea 32(sp),sp
    3f2c:	7209           	moveq #9,d1
    3f2e:	b28b           	cmp.l a3,d1
    3f30:	6740           	beq.s 3f72 <ZoomTest+0x251a>
    3f32:	2c05           	move.l d5,d6
    3f34:	2a00           	move.l d0,d5
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3f36:	7800           	moveq #0,d4
    3f38:	3802           	move.w d2,d4
    3f3a:	2f0b           	move.l a3,-(sp)
    3f3c:	2f04           	move.l d4,-(sp)
    3f3e:	2f0e           	move.l a6,-(sp)
    3f40:	4879 0001 6708 	pea 16708 <destlinezoom18>
    3f46:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3f48:	486b 0001      	pea 1(a3)
    3f4c:	2f04           	move.l d4,-(sp)
    3f4e:	486e 0030      	pea 48(a6)
    3f52:	4879 0001 6708 	pea 16708 <destlinezoom18>
    3f58:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3f5a:	4642           	not.w d2
    3f5c:	200e           	move.l a6,d0
    3f5e:	0680 0000 0120 	addi.l #288,d0
    3f64:	548b           	addq.l #2,a3
    3f66:	2c46           	movea.l d6,a6
  for(int i2=0;i2<4;i2++) {
    3f68:	4fef 0020      	lea 32(sp),sp
    3f6c:	7209           	moveq #9,d1
    3f6e:	b28b           	cmp.l a3,d1
    3f70:	66c0           	bne.s 3f32 <ZoomTest+0x24da>
    3f72:	2f45 0044      	move.l d5,68(sp)
    3f76:	2f46 0038      	move.l d6,56(sp)
    3f7a:	2805           	move.l d5,d4
    3f7c:	2646           	movea.l d6,a3
    3f7e:	2c4a           	movea.l a2,a6
    3f80:	2a00           	move.l d0,d5
    3f82:	7e24           	moveq #36,d7
    3f84:	de8a           	add.l a2,d7
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3f86:	7c00           	moveq #0,d6
    3f88:	3c02           	move.w d2,d6
    3f8a:	2f0e           	move.l a6,-(sp)
    3f8c:	2f06           	move.l d6,-(sp)
    3f8e:	2f0b           	move.l a3,-(sp)
    3f90:	4879 0001 6708 	pea 16708 <destlinezoom18>
    3f96:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3f98:	486e 0001      	pea 1(a6)
    3f9c:	2f06           	move.l d6,-(sp)
    3f9e:	486b 0030      	pea 48(a3)
    3fa2:	4879 0001 6708 	pea 16708 <destlinezoom18>
    3fa8:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3faa:	4642           	not.w d2
    3fac:	548e           	addq.l #2,a6
    for(int i2=0;i2<18;i2++) {
    3fae:	4fef 0020      	lea 32(sp),sp
    3fb2:	bdc7           	cmpa.l d7,a6
    3fb4:	673e           	beq.s 3ff4 <ZoomTest+0x259c>
    3fb6:	200b           	move.l a3,d0
    3fb8:	0680 0000 0120 	addi.l #288,d0
    3fbe:	2644           	movea.l d4,a3
    3fc0:	2805           	move.l d5,d4
    3fc2:	2a00           	move.l d0,d5
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3fc4:	7c00           	moveq #0,d6
    3fc6:	3c02           	move.w d2,d6
    3fc8:	2f0e           	move.l a6,-(sp)
    3fca:	2f06           	move.l d6,-(sp)
    3fcc:	2f0b           	move.l a3,-(sp)
    3fce:	4879 0001 6708 	pea 16708 <destlinezoom18>
    3fd4:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3fd6:	486e 0001      	pea 1(a6)
    3fda:	2f06           	move.l d6,-(sp)
    3fdc:	486b 0030      	pea 48(a3)
    3fe0:	4879 0001 6708 	pea 16708 <destlinezoom18>
    3fe6:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3fe8:	4642           	not.w d2
    3fea:	548e           	addq.l #2,a6
    for(int i2=0;i2<18;i2++) {
    3fec:	4fef 0020      	lea 32(sp),sp
    3ff0:	bdc7           	cmpa.l d7,a6
    3ff2:	66c2           	bne.s 3fb6 <ZoomTest+0x255e>
    3ff4:	45ea 0023      	lea 35(a2),a2
  for(int i=0;i<7;i++) {  
    3ff8:	b4fc 0100      	cmpa.w #256,a2
    3ffc:	6718           	beq.s 4016 <ZoomTest+0x25be>
    3ffe:	200b           	move.l a3,d0
    4000:	0680 0000 0120 	addi.l #288,d0
    4006:	2644           	movea.l d4,a3
    4008:	2805           	move.l d5,d4
  for(int i2=0;i2<4;i2++) {
    400a:	2c4a           	movea.l a2,a6
    400c:	2a00           	move.l d0,d5
    400e:	7e24           	moveq #36,d7
    4010:	de8a           	add.l a2,d7
    4012:	6000 ff72      	bra.w 3f86 <ZoomTest+0x252e>
    4016:	2644           	movea.l d4,a3
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    4018:	7800           	moveq #0,d4
    401a:	3802           	move.w d2,d4
    401c:	2f0a           	move.l a2,-(sp)
    401e:	2f04           	move.l d4,-(sp)
    4020:	2f0b           	move.l a3,-(sp)
    4022:	4879 0001 6708 	pea 16708 <destlinezoom18>
    4028:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    402a:	486a 0001      	pea 1(a2)
    402e:	2f04           	move.l d4,-(sp)
    4030:	486b 0030      	pea 48(a3)
    4034:	4879 0001 6708 	pea 16708 <destlinezoom18>
    403a:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    403c:	4642           	not.w d2
    403e:	548a           	addq.l #2,a2
  for(int i2=0;i2<4;i2++) {
    4040:	4fef 0020      	lea 32(sp),sp
    4044:	b4fc 0108      	cmpa.w #264,a2
    4048:	673e           	beq.s 4088 <ZoomTest+0x2630>
    404a:	200b           	move.l a3,d0
    404c:	0680 0000 00c0 	addi.l #192,d0
    4052:	2645           	movea.l d5,a3
    4054:	2a00           	move.l d0,d5
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    4056:	7800           	moveq #0,d4
    4058:	3802           	move.w d2,d4
    405a:	2f0a           	move.l a2,-(sp)
    405c:	2f04           	move.l d4,-(sp)
    405e:	2f0b           	move.l a3,-(sp)
    4060:	4879 0001 6708 	pea 16708 <destlinezoom18>
    4066:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    4068:	486a 0001      	pea 1(a2)
    406c:	2f04           	move.l d4,-(sp)
    406e:	486b 0030      	pea 48(a3)
    4072:	4879 0001 6708 	pea 16708 <destlinezoom18>
    4078:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    407a:	4642           	not.w d2
    407c:	548a           	addq.l #2,a2
  for(int i2=0;i2<4;i2++) {
    407e:	4fef 0020      	lea 32(sp),sp
    4082:	b4fc 0108      	cmpa.w #264,a2
    4086:	66c2           	bne.s 404a <ZoomTest+0x25f2>
  TestRow( valsupposed, valactual, mask, 0);
    4088:	42a7           	clr.l -(sp)
    408a:	3f02           	move.w d2,-(sp)
    408c:	4267           	clr.w -(sp)
    408e:	2f05           	move.l d5,-(sp)
    4090:	4879 0001 6708 	pea 16708 <destlinezoom18>
    4096:	4e95           	jsr (a5)
  FreeMem( source, (ZMLINESIZE+4)*272);
    4098:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    409e:	224c           	movea.l a4,a1
    40a0:	203c 0000 3740 	move.l #14144,d0
    40a6:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272);
    40aa:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    40b0:	2243           	movea.l d3,a1
    40b2:	203c 0000 3740 	move.l #14144,d0
    40b8:	4eae ff2e      	jsr -210(a6)
    40bc:	4fef 0010      	lea 16(sp),sp
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    40c0:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    40c6:	203c 0001 1440 	move.l #70720,d0
    40cc:	7202           	moveq #2,d1
    40ce:	4eae ff3a      	jsr -198(a6)
    40d2:	2f40 0034      	move.l d0,52(sp)
  if( source == 0) {
    40d6:	6700 0394      	beq.w 446c <ZoomTest+0x2a14>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    40da:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    40e0:	203c 0001 1440 	move.l #70720,d0
    40e6:	7202           	moveq #2,d1
    40e8:	4eae ff3a      	jsr -198(a6)
    40ec:	2f40 0038      	move.l d0,56(sp)
  if( destination == 0) {
    40f0:	6700 0408      	beq.w 44fa <ZoomTest+0x2aa2>
    40f4:	242f 0034      	move.l 52(sp),d2
    40f8:	0682 0000 ff00 	addi.l #65280,d2
    40fe:	246f 0034      	movea.l 52(sp),a2
    4102:	4878 00f0      	pea f0 <main+0xea>
    4106:	4878 0055      	pea 55 <main+0x4f>
    410a:	2f0a           	move.l a2,-(sp)
    410c:	4eba 04c8      	jsr 45d6 <memset>(pc)
    4110:	4878 00f0      	pea f0 <main+0xea>
    4114:	4878 00aa      	pea aa <main+0xa4>
    4118:	486a 00f0      	pea 240(a2)
    411c:	4eba 04b8      	jsr 45d6 <memset>(pc)
    4120:	45ea 01e0      	lea 480(a2),a2
  for(int i=0;i<128+8;i++) {
    4124:	4fef 0018      	lea 24(sp),sp
    4128:	b48a           	cmp.l a2,d2
    412a:	66d6           	bne.s 4102 <ZoomTest+0x26aa>
  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    412c:	4878 0005      	pea 5 <_start+0x5>
    4130:	42a7           	clr.l -(sp)
    4132:	2f2f 0040      	move.l 64(sp),-(sp)
    4136:	2f2f 0040      	move.l 64(sp),-(sp)
    413a:	4eba cf16      	jsr 1052 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    413e:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    4144:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<14;i++) {
    4148:	202f 0048      	move.l 72(sp),d0
    414c:	0680 0000 11d4 	addi.l #4564,d0
    4152:	2f40 003c      	move.l d0,60(sp)
    4156:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    415a:	7c12           	moveq #18,d6
  UWORD mask = 0xffff;
    415c:	7eff           	moveq #-1,d7
    415e:	4bfa c84e      	lea 9ae <TestRow>(pc),a5
    4162:	41ef 0078      	lea 120(sp),a0
    4166:	2f48 0048      	move.l a0,72(sp)
    416a:	2f4d 0030      	move.l a5,48(sp)
    416e:	2a46           	movea.l d6,a5
    4170:	282f 002c      	move.l 44(sp),d4
    4174:	0684 ffff ef4a 	addi.l #-4278,d4
    417a:	3c0d           	move.w a5,d6
    417c:	0646 ffee      	addi.w #-18,d6
    4180:	307c 002a      	movea.w #42,a0
    4184:	d1ef 002c      	adda.l 44(sp),a0
    4188:	2f48 0044      	move.l a0,68(sp)
    418c:	2f4d 003c      	move.l a5,60(sp)
    4190:	2844           	movea.l d4,a4
    4192:	49ec ff10      	lea -240(a4),a4
    4196:	41ec ffd6      	lea -42(a4),a0
    419a:	2f48 0040      	move.l a0,64(sp)
  char str[ 100] = { 0 };
    419e:	4878 0064      	pea 64 <main+0x5e>
    41a2:	42a7           	clr.l -(sp)
    41a4:	486f 0080      	pea 128(sp)
    41a8:	4eba 042c      	jsr 45d6 <memset>(pc)
  data[1] = numberofline;
    41ac:	3f46 0082      	move.w d6,130(sp)
    41b0:	4fef 000c      	lea 12(sp),sp
  for(int i=0;i<21;i++) {
    41b4:	7a00           	moveq #0,d5
  testpattern += 0;
    41b6:	4bf9 0001 69f4 	lea 169f4 <destlinezoom1>,a5
    if( (*testpattern++ ^ xormask) != *destination++) {
    41bc:	301d           	move.w (a5)+,d0
    41be:	bf40           	eor.w d7,d0
    41c0:	206f 0040      	movea.l 64(sp),a0
    41c4:	54af 0040      	addq.l #2,64(sp)
    41c8:	b058           	cmp.w (a0)+,d0
    41ca:	673c           	beq.s 4208 <ZoomTest+0x27b0>
      data[0] = i;
    41cc:	3f45 0074      	move.w d5,116(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    41d0:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    41d6:	41f9 0001 4ed5 	lea 14ed5 <incbin_startimage_end+0x49>,a0
    41dc:	43ef 0074      	lea 116(sp),a1
    41e0:	45f9 0000 47c4 	lea 47c4 <PutChar>,a2
    41e6:	47ef 0078      	lea 120(sp),a3
    41ea:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    41ee:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    41f4:	4eae ffc4      	jsr -60(a6)
    41f8:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    41fe:	2200           	move.l d0,d1
    4200:	240b           	move.l a3,d2
    4202:	7664           	moveq #100,d3
    4204:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    4208:	5285           	addq.l #1,d5
    420a:	bbfc 0001 6a1e 	cmpa.l #92702,a5
    4210:	66aa           	bne.s 41bc <ZoomTest+0x2764>
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    4212:	3039 0001 6a1e 	move.w 16a1e <destlinezoom1+0x2a>,d0
    4218:	bf40           	eor.w d7,d0
    421a:	3214           	move.w (a4),d1
    421c:	b340           	eor.w d1,d0
    421e:	0240 ff00      	andi.w #-256,d0
    4222:	6600 00b4      	bne.w 42d8 <ZoomTest+0x2880>
        valactual += ZMLINESIZE/2;
    4226:	49ec 0030      	lea 48(a4),a4
      for( int i3=0;i3<5;i3++) {
    422a:	b88c           	cmp.l a4,d4
    422c:	6600 ff68      	bne.w 4196 <ZoomTest+0x273e>
      mask = mask ^ 0xffff;
    4230:	4647           	not.w d7
    4232:	0684 0000 00f0 	addi.l #240,d4
    4238:	5246           	addq.w #1,d6
    for(int i2=0;i2<18;i2++) { 
    423a:	b8af 0044      	cmp.l 68(sp),d4
    423e:	6600 ff50      	bne.w 4190 <ZoomTest+0x2738>
    4242:	2a6f 003c      	movea.l 60(sp),a5
    4246:	246f 002c      	movea.l 44(sp),a2
    424a:	45ea ff10      	lea -240(a2),a2
    424e:	7600           	moveq #0,d3
    4250:	3607           	move.w d7,d3
      TestRow( valsupposed, valactual, mask, 18+i*19);
    4252:	2f0d           	move.l a5,-(sp)
    4254:	2f03           	move.l d3,-(sp)
    4256:	2f0a           	move.l a2,-(sp)
    4258:	4879 0001 69f4 	pea 169f4 <destlinezoom1>
    425e:	206f 0040      	movea.l 64(sp),a0
    4262:	4e90           	jsr (a0)
      valactual += ZMLINESIZE/2;
    4264:	45ea 0030      	lea 48(a2),a2
    for( int i3=0;i3<5;i3++) {
    4268:	4fef 0010      	lea 16(sp),sp
    426c:	b5ef 002c      	cmpa.l 44(sp),a2
    4270:	66e0           	bne.s 4252 <ZoomTest+0x27fa>
    4272:	45ea 11d0      	lea 4560(a2),a2
    4276:	2f4a 002c      	move.l a2,44(sp)
    427a:	4bed 0013      	lea 19(a5),a5
  for(int i=0;i<14;i++) {
    427e:	bafc 011c      	cmpa.w #284,a5
    4282:	6600 feec      	bne.w 4170 <ZoomTest+0x2718>
    4286:	2a6f 0030      	movea.l 48(sp),a5
    428a:	246f 0038      	movea.l 56(sp),a2
    428e:	d5fc 0000 f964 	adda.l #63844,a2
    4294:	243c 0000 0109 	move.l #265,d2
    429a:	280a           	move.l a2,d4
    429c:	0684 0000 00f0 	addi.l #240,d4
      TestRow( valsupposed, valactual, mask, i2+265);
    42a2:	2f02           	move.l d2,-(sp)
    42a4:	2f03           	move.l d3,-(sp)
    42a6:	2f0a           	move.l a2,-(sp)
    42a8:	4879 0001 69f4 	pea 169f4 <destlinezoom1>
    42ae:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    42b0:	45ea 0030      	lea 48(a2),a2
    for( int i3=0;i3<5;i3++) {
    42b4:	4fef 0010      	lea 16(sp),sp
    42b8:	b88a           	cmp.l a2,d4
    42ba:	66e6           	bne.s 42a2 <ZoomTest+0x284a>
    mask = mask ^ 0xffff;
    42bc:	4647           	not.w d7
    42be:	5282           	addq.l #1,d2
  for(int i2=0;i2<4;i2++) { 
    42c0:	0c82 0000 010d 	cmpi.l #269,d2
    42c6:	6700 009e      	beq.w 4366 <ZoomTest+0x290e>
    42ca:	7600           	moveq #0,d3
    42cc:	3607           	move.w d7,d3
    42ce:	280a           	move.l a2,d4
    42d0:	0684 0000 00f0 	addi.l #240,d4
    42d6:	60ca           	bra.s 42a2 <ZoomTest+0x284a>
    data[0] = 21;
    42d8:	3f7c 0015 0074 	move.w #21,116(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    42de:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    42e4:	41f9 0001 4ed5 	lea 14ed5 <incbin_startimage_end+0x49>,a0
    42ea:	43ef 0074      	lea 116(sp),a1
    42ee:	45f9 0000 47c4 	lea 47c4 <PutChar>,a2
    42f4:	47ef 0078      	lea 120(sp),a3
    42f8:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    42fc:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    4302:	4eae ffc4      	jsr -60(a6)
    4306:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    430c:	2200           	move.l d0,d1
    430e:	240b           	move.l a3,d2
    4310:	7664           	moveq #100,d3
    4312:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    4316:	7000           	moveq #0,d0
    4318:	3014           	move.w (a4),d0
    431a:	2f00           	move.l d0,-(sp)
    431c:	3039 0001 6a1e 	move.w 16a1e <destlinezoom1+0x2a>,d0
    4322:	2f00           	move.l d0,-(sp)
    4324:	4879 0001 4f05 	pea 14f05 <incbin_startimage_end+0x79>
    432a:	4eba c61a      	jsr 946 <KPrintF>(pc)
        valactual += ZMLINESIZE/2;
    432e:	49ec 0030      	lea 48(a4),a4
      for( int i3=0;i3<5;i3++) {
    4332:	4fef 000c      	lea 12(sp),sp
    4336:	b9c4           	cmpa.l d4,a4
    4338:	6700 fef6      	beq.w 4230 <ZoomTest+0x27d8>
    433c:	41ec ffd6      	lea -42(a4),a0
    4340:	2f48 0040      	move.l a0,64(sp)
  char str[ 100] = { 0 };
    4344:	4878 0064      	pea 64 <main+0x5e>
    4348:	42a7           	clr.l -(sp)
    434a:	486f 0080      	pea 128(sp)
    434e:	4eba 0286      	jsr 45d6 <memset>(pc)
  data[1] = numberofline;
    4352:	3f46 0082      	move.w d6,130(sp)
    4356:	4fef 000c      	lea 12(sp),sp
  for(int i=0;i<21;i++) {
    435a:	7a00           	moveq #0,d5
  testpattern += 0;
    435c:	4bf9 0001 69f4 	lea 169f4 <destlinezoom1>,a5
    4362:	6000 fe58      	bra.w 41bc <ZoomTest+0x2764>
  FreeMem( source, (ZMLINESIZE+4)*272*5);
    4366:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    436c:	226f 0034      	movea.l 52(sp),a1
    4370:	203c 0001 1440 	move.l #70720,d0
    4376:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272*5);
    437a:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    4380:	226f 0038      	movea.l 56(sp),a1
    4384:	203c 0001 1440 	move.l #70720,d0
    438a:	4eae ff2e      	jsr -210(a6)
}
    438e:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    4392:	4fef 00b0      	lea 176(sp),sp
    4396:	4e75           	rts
  if( TestZoom102Batch( cl2test, position+1) == 0)
    4398:	4878 004a      	pea 4a <main+0x44>
    439c:	2f02           	move.l d2,-(sp)
    439e:	49fa c74a      	lea aea <TestZoom102Batch>(pc),a4
    43a2:	4e94           	jsr (a4)
    43a4:	508f           	addq.l #8,sp
    43a6:	4a80           	tst.l d0
    43a8:	6700 db1e      	beq.w 1ec8 <ZoomTest+0x470>
  if( TestZoom102Batch( cl2test, position+36) == 0)
    43ac:	4878 006d      	pea 6d <main+0x67>
    43b0:	2f02           	move.l d2,-(sp)
    43b2:	4e94           	jsr (a4)
    43b4:	508f           	addq.l #8,sp
    43b6:	4a80           	tst.l d0
    43b8:	6700 db0e      	beq.w 1ec8 <ZoomTest+0x470>
  if( TestZoom102Batch( cl2test, position+69) == 0)
    43bc:	4878 008e      	pea 8e <main+0x88>
    43c0:	2f02           	move.l d2,-(sp)
    43c2:	4e94           	jsr (a4)
    43c4:	508f           	addq.l #8,sp
    43c6:	4a80           	tst.l d0
    43c8:	6700 dafe      	beq.w 1ec8 <ZoomTest+0x470>
  if( TestZoom102Batch( cl2test, position+101) == 0)
    43cc:	4878 00ae      	pea ae <main+0xa8>
    43d0:	2f02           	move.l d2,-(sp)
    43d2:	4e94           	jsr (a4)
    43d4:	508f           	addq.l #8,sp
    43d6:	4a80           	tst.l d0
    43d8:	6600 db0c      	bne.w 1ee6 <ZoomTest+0x48e>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 37);
    43dc:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    43e2:	4eae ffc4      	jsr -60(a6)
    43e6:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    43ec:	2200           	move.l d0,d1
    43ee:	243c 0001 51e7 	move.l #86503,d2
    43f4:	7625           	moveq #37,d3
    43f6:	4eae ffd0      	jsr -48(a6)
    43fa:	6000 daea      	bra.w 1ee6 <ZoomTest+0x48e>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    43fe:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    4404:	4eae ffc4      	jsr -60(a6)
    4408:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    440e:	2200           	move.l d0,d1
    4410:	243c 0001 52cc 	move.l #86732,d2
    4416:	7635           	moveq #53,d3
    4418:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    441c:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    4422:	203c 0000 3740 	move.l #14144,d0
    4428:	7202           	moveq #2,d1
    442a:	4eae ff3a      	jsr -198(a6)
    442e:	2600           	move.l d0,d3
  if( source == 0) {
    4430:	6600 dea4      	bne.w 22d6 <ZoomTest+0x87e>
    Write(  Output(), 
    4434:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    443a:	4eae ffc4      	jsr -60(a6)
    443e:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    4444:	2200           	move.l d0,d1
    4446:	243c 0001 5343 	move.l #86851,d2
    444c:	7639           	moveq #57,d3
    444e:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    4452:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    4458:	203c 0001 1440 	move.l #70720,d0
    445e:	7202           	moveq #2,d1
    4460:	4eae ff3a      	jsr -198(a6)
    4464:	2f40 0034      	move.l d0,52(sp)
  if( source == 0) {
    4468:	6600 fc70      	bne.w 40da <ZoomTest+0x2682>
    Write(  Output(), 
    446c:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    4472:	4eae ffc4      	jsr -60(a6)
    4476:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    447c:	2200           	move.l d0,d1
    447e:	243c 0001 5343 	move.l #86851,d2
    4484:	7639           	moveq #57,d3
    4486:	4eae ffd0      	jsr -48(a6)
}
    448a:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    448e:	4fef 00b0      	lea 176(sp),sp
    4492:	4e75           	rts
    Write(  Output(), 
    4494:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    449a:	4eae ffc4      	jsr -60(a6)
    449e:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    44a4:	2200           	move.l d0,d1
    44a6:	243c 0001 523f 	move.l #86591,d2
    44ac:	7636           	moveq #54,d3
    44ae:	4eae ffd0      	jsr -48(a6)
    return;
    44b2:	6000 dbd0      	bra.w 2084 <ZoomTest+0x62c>
    Write(  Output(), 
    44b6:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    44bc:	4eae ffc4      	jsr -60(a6)
    44c0:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    44c6:	2200           	move.l d0,d1
    44c8:	243c 0001 4fad 	move.l #85933,d2
    44ce:	7639           	moveq #57,d3
    44d0:	4eae ffd0      	jsr -48(a6)
    return;
    44d4:	6000 d77c      	bra.w 1c52 <ZoomTest+0x1fa>
    Write(  Output(), 
    44d8:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    44de:	4eae ffc4      	jsr -60(a6)
    44e2:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    44e8:	2200           	move.l d0,d1
    44ea:	243c 0001 537d 	move.l #86909,d2
    44f0:	763d           	moveq #61,d3
    44f2:	4eae ffd0      	jsr -48(a6)
    return;
    44f6:	6000 fbc8      	bra.w 40c0 <ZoomTest+0x2668>
    Write(  Output(), 
    44fa:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    4500:	4eae ffc4      	jsr -60(a6)
    4504:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    450a:	2200           	move.l d0,d1
    450c:	243c 0001 537d 	move.l #86909,d2
    4512:	763d           	moveq #61,d3
    4514:	4eae ffd0      	jsr -48(a6)
}
    4518:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    451c:	4fef 00b0      	lea 176(sp),sp
    4520:	4e75           	rts
    Write(  Output(), 
    4522:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    4528:	4eae ffc4      	jsr -60(a6)
    452c:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    4532:	2200           	move.l d0,d1
    4534:	243c 0001 4fe4 	move.l #85988,d2
    453a:	763d           	moveq #61,d3
    453c:	4eae ffd0      	jsr -48(a6)
    return;
    4540:	6000 d710      	bra.w 1c52 <ZoomTest+0x1fa>

00004544 <memcpy>:
{
    4544:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    4548:	202f 0014      	move.l 20(sp),d0
    454c:	226f 0018      	movea.l 24(sp),a1
    4550:	222f 001c      	move.l 28(sp),d1
	while(len--)
    4554:	2601           	move.l d1,d3
    4556:	5383           	subq.l #1,d3
    4558:	4a81           	tst.l d1
    455a:	6762           	beq.s 45be <memcpy+0x7a>
    455c:	2040           	movea.l d0,a0
    455e:	5888           	addq.l #4,a0
    4560:	b1c9           	cmpa.l a1,a0
    4562:	53c2           	sl.s d2
    4564:	4402           	neg.b d2
    4566:	41e9 0004      	lea 4(a1),a0
    456a:	b1c0           	cmpa.l d0,a0
    456c:	53c4           	sl.s d4
    456e:	4404           	neg.b d4
    4570:	8404           	or.b d4,d2
    4572:	7808           	moveq #8,d4
    4574:	b883           	cmp.l d3,d4
    4576:	55c4           	sc.s d4
    4578:	4404           	neg.b d4
    457a:	c404           	and.b d4,d2
    457c:	6746           	beq.s 45c4 <memcpy+0x80>
    457e:	2409           	move.l a1,d2
    4580:	8480           	or.l d0,d2
    4582:	7803           	moveq #3,d4
    4584:	c484           	and.l d4,d2
    4586:	663c           	bne.s 45c4 <memcpy+0x80>
    4588:	2049           	movea.l a1,a0
    458a:	2440           	movea.l d0,a2
    458c:	74fc           	moveq #-4,d2
    458e:	c481           	and.l d1,d2
    4590:	d489           	add.l a1,d2
		*d++ = *s++;
    4592:	24d8           	move.l (a0)+,(a2)+
    4594:	b488           	cmp.l a0,d2
    4596:	66fa           	bne.s 4592 <memcpy+0x4e>
    4598:	74fc           	moveq #-4,d2
    459a:	c481           	and.l d1,d2
    459c:	2040           	movea.l d0,a0
    459e:	d1c2           	adda.l d2,a0
    45a0:	d3c2           	adda.l d2,a1
    45a2:	9682           	sub.l d2,d3
    45a4:	b481           	cmp.l d1,d2
    45a6:	6716           	beq.s 45be <memcpy+0x7a>
    45a8:	1091           	move.b (a1),(a0)
	while(len--)
    45aa:	4a83           	tst.l d3
    45ac:	6710           	beq.s 45be <memcpy+0x7a>
		*d++ = *s++;
    45ae:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    45b4:	5383           	subq.l #1,d3
    45b6:	6706           	beq.s 45be <memcpy+0x7a>
		*d++ = *s++;
    45b8:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    45be:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    45c2:	4e75           	rts
    45c4:	2040           	movea.l d0,a0
    45c6:	d289           	add.l a1,d1
		*d++ = *s++;
    45c8:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    45ca:	b289           	cmp.l a1,d1
    45cc:	67f0           	beq.s 45be <memcpy+0x7a>
		*d++ = *s++;
    45ce:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    45d0:	b289           	cmp.l a1,d1
    45d2:	66f4           	bne.s 45c8 <memcpy+0x84>
    45d4:	60e8           	bra.s 45be <memcpy+0x7a>

000045d6 <memset>:
{
    45d6:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    45da:	202f 0024      	move.l 36(sp),d0
    45de:	2a2f 0028      	move.l 40(sp),d5
    45e2:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    45e6:	2809           	move.l a1,d4
    45e8:	5384           	subq.l #1,d4
    45ea:	b2fc 0000      	cmpa.w #0,a1
    45ee:	6f00 00b0      	ble.w 46a0 <memset+0xca>
    45f2:	1e05           	move.b d5,d7
    45f4:	2200           	move.l d0,d1
    45f6:	4481           	neg.l d1
    45f8:	7403           	moveq #3,d2
    45fa:	c282           	and.l d2,d1
    45fc:	7c05           	moveq #5,d6
		*ptr++ = val;
    45fe:	2440           	movea.l d0,a2
    4600:	bc84           	cmp.l d4,d6
    4602:	646a           	bcc.s 466e <memset+0x98>
    4604:	4a81           	tst.l d1
    4606:	6724           	beq.s 462c <memset+0x56>
    4608:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    460a:	5384           	subq.l #1,d4
    460c:	7401           	moveq #1,d2
    460e:	b481           	cmp.l d1,d2
    4610:	671a           	beq.s 462c <memset+0x56>
		*ptr++ = val;
    4612:	2440           	movea.l d0,a2
    4614:	548a           	addq.l #2,a2
    4616:	2040           	movea.l d0,a0
    4618:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    461c:	5384           	subq.l #1,d4
    461e:	7403           	moveq #3,d2
    4620:	b481           	cmp.l d1,d2
    4622:	6608           	bne.s 462c <memset+0x56>
		*ptr++ = val;
    4624:	528a           	addq.l #1,a2
    4626:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    462a:	5384           	subq.l #1,d4
    462c:	2609           	move.l a1,d3
    462e:	9681           	sub.l d1,d3
    4630:	7c00           	moveq #0,d6
    4632:	1c05           	move.b d5,d6
    4634:	2406           	move.l d6,d2
    4636:	4842           	swap d2
    4638:	4242           	clr.w d2
    463a:	2042           	movea.l d2,a0
    463c:	2406           	move.l d6,d2
    463e:	e14a           	lsl.w #8,d2
    4640:	4842           	swap d2
    4642:	4242           	clr.w d2
    4644:	e18e           	lsl.l #8,d6
    4646:	2646           	movea.l d6,a3
    4648:	2c08           	move.l a0,d6
    464a:	8486           	or.l d6,d2
    464c:	2c0b           	move.l a3,d6
    464e:	8486           	or.l d6,d2
    4650:	1407           	move.b d7,d2
    4652:	2040           	movea.l d0,a0
    4654:	d1c1           	adda.l d1,a0
    4656:	72fc           	moveq #-4,d1
    4658:	c283           	and.l d3,d1
    465a:	d288           	add.l a0,d1
		*ptr++ = val;
    465c:	20c2           	move.l d2,(a0)+
    465e:	b1c1           	cmpa.l d1,a0
    4660:	66fa           	bne.s 465c <memset+0x86>
    4662:	72fc           	moveq #-4,d1
    4664:	c283           	and.l d3,d1
    4666:	d5c1           	adda.l d1,a2
    4668:	9881           	sub.l d1,d4
    466a:	b283           	cmp.l d3,d1
    466c:	6732           	beq.s 46a0 <memset+0xca>
    466e:	1485           	move.b d5,(a2)
	while(len-- > 0)
    4670:	4a84           	tst.l d4
    4672:	6f2c           	ble.s 46a0 <memset+0xca>
		*ptr++ = val;
    4674:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    4678:	7201           	moveq #1,d1
    467a:	b284           	cmp.l d4,d1
    467c:	6c22           	bge.s 46a0 <memset+0xca>
		*ptr++ = val;
    467e:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    4682:	7402           	moveq #2,d2
    4684:	b484           	cmp.l d4,d2
    4686:	6c18           	bge.s 46a0 <memset+0xca>
		*ptr++ = val;
    4688:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    468c:	7c03           	moveq #3,d6
    468e:	bc84           	cmp.l d4,d6
    4690:	6c0e           	bge.s 46a0 <memset+0xca>
		*ptr++ = val;
    4692:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    4696:	7204           	moveq #4,d1
    4698:	b284           	cmp.l d4,d1
    469a:	6c04           	bge.s 46a0 <memset+0xca>
		*ptr++ = val;
    469c:	1545 0005      	move.b d5,5(a2)
}
    46a0:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    46a4:	4e75           	rts

000046a6 <strlen>:
{
    46a6:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    46aa:	7000           	moveq #0,d0
	while(*s++)
    46ac:	4a10           	tst.b (a0)
    46ae:	6708           	beq.s 46b8 <strlen+0x12>
		t++;
    46b0:	5280           	addq.l #1,d0
	while(*s++)
    46b2:	4a30 0800      	tst.b (0,a0,d0.l)
    46b6:	66f8           	bne.s 46b0 <strlen+0xa>
}
    46b8:	4e75           	rts
    46ba:	4e71           	nop

000046bc <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    46bc:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    46c0:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    46c4:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    46c8:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    46cc:	d041           	add.w d1,d0
	swap	d0
    46ce:	4840           	swap d0
	clrw	d0
    46d0:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    46d2:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    46d6:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    46da:	d081           	add.l d1,d0

	rts
    46dc:	4e75           	rts

000046de <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    46de:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    46e0:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    46e4:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    46e8:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    46ee:	6416           	bcc.s 4706 <__udivsi3+0x28>
	movel	d0, d2
    46f0:	2400           	move.l d0,d2
	clrw	d2
    46f2:	4242           	clr.w d2
	swap	d2
    46f4:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    46f6:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    46f8:	3002           	move.w d2,d0
	swap	d0
    46fa:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    46fc:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    4700:	84c1           	divu.w d1,d2
	movew	d2, d0
    4702:	3002           	move.w d2,d0
	jra	6f
    4704:	6030           	bra.s 4736 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    4706:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    4708:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    470a:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    470c:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    4712:	64f4           	bcc.s 4708 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    4714:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    4716:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    471c:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    471e:	c2c0           	mulu.w d0,d1
	swap	d2
    4720:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    4722:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    4724:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    4726:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    4728:	660a           	bne.s 4734 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    472a:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    472c:	6506           	bcs.s 4734 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    472e:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    4732:	6302           	bls.s 4736 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    4734:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    4736:	241f           	move.l (sp)+,d2
	rts
    4738:	4e75           	rts

0000473a <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    473a:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    473c:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    473e:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    4742:	6a04           	bpl.s 4748 <__divsi3+0xe>
	negl	d1
    4744:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    4746:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    4748:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    474c:	6a04           	bpl.s 4752 <__divsi3+0x18>
	negl	d0
    474e:	4480           	neg.l d0
	negb	d2
    4750:	4402           	neg.b d2

2:	movel	d1, sp@-
    4752:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4754:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    4756:	6186           	bsr.s 46de <__udivsi3>
	addql	IMM (8), sp
    4758:	508f           	addq.l #8,sp

	tstb	d2
    475a:	4a02           	tst.b d2
	jpl	3f
    475c:	6a02           	bpl.s 4760 <__divsi3+0x26>
	negl	d0
    475e:	4480           	neg.l d0

3:	movel	sp@+, d2
    4760:	241f           	move.l (sp)+,d2
	rts
    4762:	4e75           	rts

00004764 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    4764:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    4768:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    476c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    476e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    4770:	61c8           	bsr.s 473a <__divsi3>
	addql	IMM (8), sp
    4772:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    4774:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    4778:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    477a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    477c:	6100 ff3e      	bsr.w 46bc <__mulsi3>
	addql	IMM (8), sp
    4780:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    4782:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    4786:	9280           	sub.l d0,d1
	movel	d1, d0
    4788:	2001           	move.l d1,d0
	rts
    478a:	4e75           	rts

0000478c <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    478c:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    4790:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    4794:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4796:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    4798:	6100 ff44      	bsr.w 46de <__udivsi3>
	addql	IMM (8), sp
    479c:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    479e:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    47a2:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    47a4:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    47a6:	6100 ff14      	bsr.w 46bc <__mulsi3>
	addql	IMM (8), sp
    47aa:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    47ac:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    47b0:	9280           	sub.l d0,d1
	movel	d1, d0
    47b2:	2001           	move.l d1,d0
	rts
    47b4:	4e75           	rts

000047b6 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    47b6:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    47b8:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    47bc:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    47c0:	2c5f           	movea.l (sp)+,a6
    rts
    47c2:	4e75           	rts

000047c4 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    47c4:	16c0           	move.b d0,(a3)+
	rts
    47c6:	4e75           	rts

000047c8 <saveregs>:
	...

00004804 <font2distance>:
    4804:	0505           	btst d2,d5
    4806:	0505           	btst d2,d5
    4808:	0505           	btst d2,d5
    480a:	0505           	btst d2,d5
    480c:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    480e:	0505           	btst d2,d5
    4810:	0505           	btst d2,d5
    4812:	0005 0505      	ori.b #5,d5
    4816:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    4818:	0505           	btst d2,d5
    481a:	0505           	btst d2,d5
    481c:	0505           	btst d2,d5
    481e:	0505           	btst d2,d5
    4820:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    4822:	0505           	btst d2,d5
    4824:	0505           	btst d2,d5
    4826:	0505           	btst d2,d5
    4828:	0505           	btst d2,d5
    482a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    482c:	0500           	btst d2,d0
    482e:	0505           	btst d2,d5
    4830:	0505           	btst d2,d5
    4832:	0505           	btst d2,d5
    4834:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    4836:	0505           	btst d2,d5
    4838:	0505           	btst d2,d5
    483a:	0505           	btst d2,d5
    483c:	0505           	btst d2,d5
    483e:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    4840:	0505           	btst d2,d5
    4842:	0505           	btst d2,d5
    4844:	0503           	btst d2,d3
    4846:	0505           	btst d2,d5
    4848:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    484a:	0505           	btst d2,d5
    484c:	0500           	btst d2,d0
    484e:	0505           	btst d2,d5
    4850:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    4854:	0505           	btst d2,d5
    4856:	0503           	btst d2,d3
    4858:	0205 0507      	andi.b #7,d5
    485c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    485e:	0505           	btst d2,d5
    4860:	0505           	btst d2,d5
    4862:	0505           	btst d2,d5
    4864:	0505           	btst d2,d5
    4866:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4868:	0505           	btst d2,d5
    486a:	0505           	btst d2,d5
    486c:	0505           	btst d2,d5
    486e:	0505           	btst d2,d5
    4870:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4872:	0505           	btst d2,d5
    4874:	0505           	btst d2,d5
    4876:	0505           	btst d2,d5
    4878:	0505           	btst d2,d5
    487a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    487c:	0505           	btst d2,d5
    487e:	0505           	btst d2,d5
    4880:	0505           	btst d2,d5
    4882:	0505           	btst d2,d5
    4884:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4886:	0505           	btst d2,d5
    4888:	0505           	btst d2,d5
    488a:	0505           	btst d2,d5
    488c:	0505           	btst d2,d5
    488e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4890:	0505           	btst d2,d5
    4892:	0505           	btst d2,d5
    4894:	0505           	btst d2,d5
    4896:	0505           	btst d2,d5
    4898:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    489a:	0505           	btst d2,d5
    489c:	0505           	btst d2,d5
    489e:	0505           	btst d2,d5
    48a0:	0505           	btst d2,d5
    48a2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    48a4:	0505           	btst d2,d5
    48a6:	0505           	btst d2,d5
    48a8:	0505           	btst d2,d5
    48aa:	0505           	btst d2,d5
    48ac:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    48ae:	0505           	btst d2,d5
    48b0:	0505           	btst d2,d5
    48b2:	0505           	btst d2,d5
    48b4:	0505           	btst d2,d5
    48b6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    48b8:	0505           	btst d2,d5
    48ba:	0505           	btst d2,d5
    48bc:	0505           	btst d2,d5
    48be:	0505           	btst d2,d5
    48c0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    48c2:	0505           	btst d2,d5
    48c4:	0505           	btst d2,d5
    48c6:	0505           	btst d2,d5
    48c8:	0505           	btst d2,d5
    48ca:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    48cc:	0505           	btst d2,d5
    48ce:	0505           	btst d2,d5
    48d0:	0505           	btst d2,d5
    48d2:	0505           	btst d2,d5
    48d4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    48d6:	0505           	btst d2,d5
    48d8:	0505           	btst d2,d5
    48da:	0505           	btst d2,d5
    48dc:	0505           	btst d2,d5
    48de:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    48e0:	0505           	btst d2,d5
    48e2:	0505           	btst d2,d5
    48e4:	0505           	btst d2,d5
    48e6:	0505           	btst d2,d5
    48e8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    48ea:	0505           	btst d2,d5
    48ec:	0505           	btst d2,d5
    48ee:	0505           	btst d2,d5
    48f0:	0505           	btst d2,d5
    48f2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    48f4:	0505           	btst d2,d5
    48f6:	0505           	btst d2,d5
    48f8:	0505           	btst d2,d5
    48fa:	0505           	btst d2,d5
    48fc:	0505           	btst d2,d5

000048fe <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    48fe:	16c0           	move.b d0,(a3)+
  RTS
    4900:	4e75           	rts

00004902 <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    4902:	48f9 7fff 0000 	movem.l d0-a6,47c8 <saveregs>
    4908:	47c8 
  lea 0xdff000,a5
    490a:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xdd7216>,a5
  move.l sp@(4),a0  //Fontlocation
    4910:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    4914:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    4918:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    491c:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    491e:	082d 0006 0002 	btst #6,2(a5)

00004924 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    4924:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    492a:	66f8           	bne.s 4924 <st2wblit>

0000492c <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    492c:	7019           	moveq #25,d0
	sub.l d5,d5      
    492e:	9a85           	sub.l d5,d5

00004930 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    4930:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    4932:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    4934:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    4938:	9dce           	suba.l a6,a6
	move.l d2, a6
    493a:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    493c:	ddfc 0000 4804 	adda.l #18436,a6

	LSL  	#4,d2 	    //Fetch next char
    4942:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    4944:	2842           	movea.l d2,a4


	move.l  #0,d4
    4946:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    4948:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    494a:	3814           	move.w (a4),d4
	swap	d4
    494c:	4844           	swap d4
	lsr.l	d5, d4
    494e:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    4950:	8993           	or.l d4,(a3)
	clr.l	d4
    4952:	4284           	clr.l d4
	move.w  2(a4), d4
    4954:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    4958:	4844           	swap d4
	lsr.l	d5, d4
    495a:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    495c:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    4960:	4284           	clr.l d4
	move.w  4(a4), d4
    4962:	382c 0004      	move.w 4(a4),d4
	swap	d4
    4966:	4844           	swap d4
	lsr.l	d5, d4
    4968:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    496a:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    496e:	4284           	clr.l d4
	move.w  6(a4), d4
    4970:	382c 0006      	move.w 6(a4),d4
	swap	d4
    4974:	4844           	swap d4
	lsr.l	d5, d4
    4976:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    4978:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    497c:	4284           	clr.l d4
	move.w  8(a4), d4
    497e:	382c 0008      	move.w 8(a4),d4
	swap	d4
    4982:	4844           	swap d4
	lsr.l	d5, d4
    4984:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    4986:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    498a:	4284           	clr.l d4
	move.w  10(a4), d4
    498c:	382c 000a      	move.w 10(a4),d4
	swap	d4
    4990:	4844           	swap d4
	lsr.l	d5, d4
    4992:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    4994:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    4998:	4284           	clr.l d4
	move.w  12(a4), d4
    499a:	382c 000c      	move.w 12(a4),d4
	swap	d4
    499e:	4844           	swap d4
	lsr.l	d5, d4
    49a0:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    49a2:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    49a6:	4284           	clr.l d4
	move.w  14(a4), d4
    49a8:	382c 000e      	move.w 14(a4),d4
	swap	d4
    49ac:	4844           	swap d4
	lsr.l	d5, d4
    49ae:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    49b0:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    49b4:	4284           	clr.l d4

	add.b   (a6), d5
    49b6:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    49b8:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    49bc:	6500 0006      	bcs.w 49c4 <noadditionalchar>
	addq.w  #1, a3
    49c0:	524b           	addq.w #1,a3
	sub.w   #8,d5
    49c2:	5145           	subq.w #8,d5

000049c4 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    49c4:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    49c6:	51c8 ff68      	dbf d0,4930 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    49ca:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    49ce:	51cb ff5c      	dbf d3,492c <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    49d2:	4cfa 7fff fdf2 	movem.l 47c8 <saveregs>(pc),d0-a6

	RTS
    49d8:	4e75           	rts
