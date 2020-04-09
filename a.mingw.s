
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
      10:	23ce 0001 76ce 	move.l a6,176ce <SysBase>
	hw = (struct Custom*)0xdff000;
      16:	23fc 00df f000 	move.l #14675968,176be <hw>
      1c:	0001 76be 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      20:	43f9 0001 4f3f 	lea 14f3f <incbin_startimage_end+0x50b>,a1
      26:	7000           	moveq #0,d0
      28:	4eae fdd8      	jsr -552(a6)
      2c:	23c0 0001 76c2 	move.l d0,176c2 <GfxBase>
	if (!GfxBase)
      32:	6700 0730      	beq.w 764 <main+0x75e>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      36:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
      3c:	43f9 0001 4f50 	lea 14f50 <incbin_startimage_end+0x51c>,a1
      42:	7000           	moveq #0,d0
      44:	4eae fdd8      	jsr -552(a6)
      48:	23c0 0001 76ca 	move.l d0,176ca <DOSBase>
	if (!DOSBase)
      4e:	6700 0708      	beq.w 758 <main+0x752>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      52:	4879 0001 4f5c 	pea 14f5c <incbin_startimage_end+0x528>
      58:	4eb9 0000 0946 	jsr 946 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      5e:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
      64:	4eae ffc4      	jsr -60(a6)
      68:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
      6e:	2200           	move.l d0,d1
      70:	243c 0001 4f78 	move.l #85880,d2
      76:	760f           	moveq #15,d3
      78:	4eae ffd0      	jsr -48(a6)
	Delay(50);
      7c:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
      82:	7232           	moveq #50,d1
      84:	4eae ff3a      	jsr -198(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      88:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
      8e:	4eae ffc4      	jsr -60(a6)
      92:	2079 0001 76be 	movea.l 176be <hw>,a0
      98:	2628 0080      	move.l 128(a0),d3
      9c:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
      a2:	2200           	move.l d0,d1
      a4:	243c 0001 4f88 	move.l #85896,d2
      aa:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      ae:	49f9 0000 0b14 	lea b14 <ClBuild>,a4
      b4:	4e94           	jsr (a4)
      b6:	2440           	movea.l d0,a2
      b8:	23c0 0001 76b0 	move.l d0,176b0 <Copperlist1>
  DrawCopper = Copperlist1;
      be:	23c0 0001 76a8 	move.l d0,176a8 <DrawCopper>
  Copperlist2 = ClBuild();
      c4:	4e94           	jsr (a4)
      c6:	23c0 0001 76a2 	move.l d0,176a2 <Copperlist2>
  ViewCopper = Copperlist2;
      cc:	23c0 0001 7696 	move.l d0,17696 <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      d2:	588f           	addq.l #4,sp
      d4:	2012           	move.l (a2),d0
      d6:	b0b9 0001 730c 	cmp.l 1730c <ClsSprites>,d0
      dc:	6600 060c      	bne.w 6ea <main+0x6e4>
      e0:	202a 0004      	move.l 4(a2),d0
      e4:	b0b9 0001 7310 	cmp.l 17310 <ClsSprites+0x4>,d0
      ea:	6600 05fe      	bne.w 6ea <main+0x6e4>
      ee:	202a 0008      	move.l 8(a2),d0
      f2:	b0b9 0001 7314 	cmp.l 17314 <ClsSprites+0x8>,d0
      f8:	6600 05f0      	bne.w 6ea <main+0x6e4>
      fc:	202a 000c      	move.l 12(a2),d0
     100:	b0b9 0001 7318 	cmp.l 17318 <ClsSprites+0xc>,d0
     106:	6600 05e2      	bne.w 6ea <main+0x6e4>
     10a:	202a 0010      	move.l 16(a2),d0
     10e:	b0b9 0001 731c 	cmp.l 1731c <ClsSprites+0x10>,d0
     114:	6600 05d4      	bne.w 6ea <main+0x6e4>
     118:	202a 0014      	move.l 20(a2),d0
     11c:	b0b9 0001 7320 	cmp.l 17320 <ClsSprites+0x14>,d0
     122:	6600 05c6      	bne.w 6ea <main+0x6e4>
     126:	202a 0018      	move.l 24(a2),d0
     12a:	b0b9 0001 7324 	cmp.l 17324 <ClsSprites+0x18>,d0
     130:	6600 05b8      	bne.w 6ea <main+0x6e4>
     134:	202a 001c      	move.l 28(a2),d0
     138:	b0b9 0001 7328 	cmp.l 17328 <ClsSprites+0x1c>,d0
     13e:	6600 05aa      	bne.w 6ea <main+0x6e4>
     142:	202a 0020      	move.l 32(a2),d0
     146:	b0b9 0001 732c 	cmp.l 1732c <ClsSprites+0x20>,d0
     14c:	6600 059c      	bne.w 6ea <main+0x6e4>
     150:	202a 0024      	move.l 36(a2),d0
     154:	b0b9 0001 7330 	cmp.l 17330 <ClsSprites+0x24>,d0
     15a:	6600 058e      	bne.w 6ea <main+0x6e4>
     15e:	202a 0028      	move.l 40(a2),d0
     162:	b0b9 0001 7334 	cmp.l 17334 <ClsSprites+0x28>,d0
     168:	6600 0580      	bne.w 6ea <main+0x6e4>
     16c:	202a 002c      	move.l 44(a2),d0
     170:	b0b9 0001 7338 	cmp.l 17338 <ClsSprites+0x2c>,d0
     176:	6600 0572      	bne.w 6ea <main+0x6e4>
     17a:	202a 0030      	move.l 48(a2),d0
     17e:	b0b9 0001 733c 	cmp.l 1733c <ClsSprites+0x30>,d0
     184:	6600 0564      	bne.w 6ea <main+0x6e4>
     188:	202a 0034      	move.l 52(a2),d0
     18c:	b0b9 0001 7340 	cmp.l 17340 <ClsSprites+0x34>,d0
     192:	6600 0556      	bne.w 6ea <main+0x6e4>
     196:	202a 0038      	move.l 56(a2),d0
     19a:	b0b9 0001 7344 	cmp.l 17344 <ClsSprites+0x38>,d0
     1a0:	6600 0548      	bne.w 6ea <main+0x6e4>
     1a4:	246a 003c      	movea.l 60(a2),a2
     1a8:	b5f9 0001 7348 	cmpa.l 17348 <ClsSprites+0x3c>,a2
     1ae:	6600 053a      	bne.w 6ea <main+0x6e4>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1b2:	2079 0001 76b0 	movea.l 176b0 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1b8:	2039 0001 72dc 	move.l 172dc <ClScreen>,d0
     1be:	b0a8 0040      	cmp.l 64(a0),d0
     1c2:	6600 0548      	bne.w 70c <main+0x706>
     1c6:	2039 0001 72e0 	move.l 172e0 <ClScreen+0x4>,d0
     1cc:	b0a8 0044      	cmp.l 68(a0),d0
     1d0:	6600 053a      	bne.w 70c <main+0x706>
     1d4:	2039 0001 72e4 	move.l 172e4 <ClScreen+0x8>,d0
     1da:	b0a8 0048      	cmp.l 72(a0),d0
     1de:	6600 052c      	bne.w 70c <main+0x706>
     1e2:	2028 004c      	move.l 76(a0),d0
     1e6:	b0b9 0001 72e8 	cmp.l 172e8 <ClScreen+0xc>,d0
     1ec:	6600 051e      	bne.w 70c <main+0x706>
     1f0:	2028 0050      	move.l 80(a0),d0
     1f4:	b0b9 0001 72ec 	cmp.l 172ec <ClScreen+0x10>,d0
     1fa:	6600 0510      	bne.w 70c <main+0x706>
     1fe:	2028 0054      	move.l 84(a0),d0
     202:	b0b9 0001 72f0 	cmp.l 172f0 <ClScreen+0x14>,d0
     208:	6600 0502      	bne.w 70c <main+0x706>
     20c:	2028 0058      	move.l 88(a0),d0
     210:	b0b9 0001 72f4 	cmp.l 172f4 <ClScreen+0x18>,d0
     216:	6600 04f4      	bne.w 70c <main+0x706>
     21a:	2028 005c      	move.l 92(a0),d0
     21e:	b0b9 0001 72f8 	cmp.l 172f8 <ClScreen+0x1c>,d0
     224:	6600 04e6      	bne.w 70c <main+0x706>
     228:	2028 0060      	move.l 96(a0),d0
     22c:	b0b9 0001 72fc 	cmp.l 172fc <ClScreen+0x20>,d0
     232:	6600 04d8      	bne.w 70c <main+0x706>
     236:	2028 0064      	move.l 100(a0),d0
     23a:	b0b9 0001 7300 	cmp.l 17300 <ClScreen+0x24>,d0
     240:	6600 04ca      	bne.w 70c <main+0x706>
     244:	2028 0068      	move.l 104(a0),d0
     248:	b0b9 0001 7304 	cmp.l 17304 <ClScreen+0x28>,d0
     24e:	6600 04bc      	bne.w 70c <main+0x706>
     252:	2068 006c      	movea.l 108(a0),a0
     256:	b1f9 0001 7308 	cmpa.l 17308 <ClScreen+0x2c>,a0
     25c:	6600 04ae      	bne.w 70c <main+0x706>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     260:	23fc 0004 0000 	move.l #262144,176b6 <DrawBuffer>
     266:	0001 76b6 
  ViewBuffer = (ULONG *)0x50000;
     26a:	23fc 0005 0000 	move.l #327680,176ac <ViewBuffer>
     270:	0001 76ac 
  
  SetBplPointers();
     274:	45f9 0000 160e 	lea 160e <SetBplPointers>,a2
     27a:	4e92           	jsr (a2)
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     27c:	0cb9 0005 0000 	cmpi.l #327680,176b6 <DrawBuffer>
     282:	0001 76b6 
     286:	6700 059a      	beq.w 822 <main+0x81c>
    Write( Output(), 
     28a:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     290:	4eae ffc4      	jsr -60(a6)
     294:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     29a:	2200           	move.l d0,d1
     29c:	243c 0001 4f8b 	move.l #85899,d2
     2a2:	763b           	moveq #59,d3
     2a4:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     2a8:	2079 0001 76b0 	movea.l 176b0 <Copperlist1>,a0
     2ae:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2b4:	0070 
     2b6:	6724           	beq.s 2dc <main+0x2d6>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2b8:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     2be:	4eae ffc4      	jsr -60(a6)
     2c2:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     2c8:	2200           	move.l d0,d1
     2ca:	243c 0001 4fc7 	move.l #85959,d2
     2d0:	763c           	moveq #60,d3
     2d2:	4eae ffd0      	jsr -48(a6)
     2d6:	2079 0001 76b0 	movea.l 176b0 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2dc:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2e2:	0074 
     2e4:	6724           	beq.s 30a <main+0x304>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2e6:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     2ec:	4eae ffc4      	jsr -60(a6)
     2f0:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     2f6:	2200           	move.l d0,d1
     2f8:	243c 0001 5004 	move.l #86020,d2
     2fe:	763c           	moveq #60,d3
     300:	4eae ffd0      	jsr -48(a6)
     304:	2079 0001 76b0 	movea.l 176b0 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     30a:	2028 0078      	move.l 120(a0),d0
     30e:	b0b9 0001 725c 	cmp.l 1725c <ClColor>,d0
     314:	6600 053c      	bne.w 852 <main+0x84c>
     318:	2028 007c      	move.l 124(a0),d0
     31c:	b0b9 0001 7260 	cmp.l 17260 <ClColor+0x4>,d0
     322:	6600 052e      	bne.w 852 <main+0x84c>
  if( instructions[pos] == value ) 
     326:	70fe           	moveq #-2,d0
     328:	b0a8 0080      	cmp.l 128(a0),d0
     32c:	671e           	beq.s 34c <main+0x346>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     32e:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     334:	4eae ffc4      	jsr -60(a6)
     338:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     33e:	2200           	move.l d0,d1
     340:	243c 0001 5063 	move.l #86115,d2
     346:	7622           	moveq #34,d3
     348:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     34c:	47f9 0000 15e8 	lea 15e8 <SwapCl>,a3
     352:	4e93           	jsr (a3)
  
  if( DrawCopper != Copperlist2)
     354:	2039 0001 76a8 	move.l 176a8 <DrawCopper>,d0
     35a:	b0b9 0001 76a2 	cmp.l 176a2 <Copperlist2>,d0
     360:	671e           	beq.s 380 <main+0x37a>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     362:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     368:	4eae ffc4      	jsr -60(a6)
     36c:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     372:	2200           	move.l d0,d1
     374:	243c 0001 5086 	move.l #86150,d2
     37a:	7615           	moveq #21,d3
     37c:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild( );
     380:	4e94           	jsr (a4)
     382:	23c0 0001 76b0 	move.l d0,176b0 <Copperlist1>
  Copperlist2 = ClBuild( );
     388:	4e94           	jsr (a4)
     38a:	23c0 0001 76a2 	move.l d0,176a2 <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
     390:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
     396:	203c 0000 c800 	move.l #51200,d0
     39c:	7202           	moveq #2,d1
     39e:	4eae ff3a      	jsr -198(a6)
     3a2:	23c0 0001 769e 	move.l d0,1769e <Bitplane1>
  if(Bitplane1 == 0) {
     3a8:	6700 0418      	beq.w 7c2 <main+0x7bc>
  ViewBuffer = Bitplane1;
     3ac:	23c0 0001 76ac 	move.l d0,176ac <ViewBuffer>
  ViewCopper = Copperlist1;
     3b2:	23f9 0001 76b0 	move.l 176b0 <Copperlist1>,17696 <ViewCopper>
     3b8:	0001 7696 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
     3bc:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
     3c2:	203c 0000 c800 	move.l #51200,d0
     3c8:	7202           	moveq #2,d1
     3ca:	4eae ff3a      	jsr -198(a6)
     3ce:	23c0 0001 769a 	move.l d0,1769a <Bitplane2>
  if(Bitplane2 == 0) {
     3d4:	6700 03b8      	beq.w 78e <main+0x788>
  DrawBuffer = Bitplane2;
     3d8:	23c0 0001 76b6 	move.l d0,176b6 <DrawBuffer>
  DrawCopper = Copperlist2;
     3de:	23f9 0001 76a2 	move.l 176a2 <Copperlist2>,176a8 <DrawCopper>
     3e4:	0001 76a8 
    Write( Output(), 
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
     3e8:	2039 0001 76ac 	move.l 176ac <ViewBuffer>,d0
     3ee:	b0b9 0001 769e 	cmp.l 1769e <Bitplane1>,d0
     3f4:	671e           	beq.s 414 <main+0x40e>
    Write( Output(), 
     3f6:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     3fc:	4eae ffc4      	jsr -60(a6)
     400:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     406:	2200           	move.l d0,d1
     408:	243c 0001 509c 	move.l #86172,d2
     40e:	7638           	moveq #56,d3
     410:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
     414:	2039 0001 7696 	move.l 17696 <ViewCopper>,d0
     41a:	b0b9 0001 76b0 	cmp.l 176b0 <Copperlist1>,d0
     420:	671e           	beq.s 440 <main+0x43a>
    Write( Output(), 
     422:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     428:	4eae ffc4      	jsr -60(a6)
     42c:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     432:	2200           	move.l d0,d1
     434:	243c 0001 50d5 	move.l #86229,d2
     43a:	763a           	moveq #58,d3
     43c:	4eae ffd0      	jsr -48(a6)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  SetBplPointers();
     440:	4e92           	jsr (a2)
  SwapCl();
     442:	4e93           	jsr (a3)
  UWORD *copword = ViewCopper;
     444:	2079 0001 7696 	movea.l 17696 <ViewCopper>,a0
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     44a:	7000           	moveq #0,d0
     44c:	3028 0072      	move.w 114(a0),d0
     450:	4840           	swap d0
     452:	4240           	clr.w d0
     454:	7200           	moveq #0,d1
     456:	3228 0076      	move.w 118(a0),d1
     45a:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     45c:	b0b9 0001 769a 	cmp.l 1769a <Bitplane2>,d0
     462:	671e           	beq.s 482 <main+0x47c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     464:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     46a:	4eae ffc4      	jsr -60(a6)
     46e:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     474:	2200           	move.l d0,d1
     476:	243c 0001 5110 	move.l #86288,d2
     47c:	7648           	moveq #72,d3
     47e:	4eae ffd0      	jsr -48(a6)
                                                   " after first frame.\n", 72);
  SetBplPointers();
     482:	4e92           	jsr (a2)
  SwapCl();
     484:	4e93           	jsr (a3)

  copword = (UWORD *) ViewCopper;
     486:	2079 0001 7696 	movea.l 17696 <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     48c:	7000           	moveq #0,d0
     48e:	3028 0072      	move.w 114(a0),d0
     492:	4840           	swap d0
     494:	4240           	clr.w d0
     496:	7200           	moveq #0,d1
     498:	3228 0076      	move.w 118(a0),d1
     49c:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     49e:	b0b9 0001 769e 	cmp.l 1769e <Bitplane1>,d0
     4a4:	671e           	beq.s 4c4 <main+0x4be>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     4a6:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     4ac:	4eae ffc4      	jsr -60(a6)
     4b0:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     4b6:	2200           	move.l d0,d1
     4b8:	243c 0001 5159 	move.l #86361,d2
     4be:	7649           	moveq #73,d3
     4c0:	4eae ffd0      	jsr -48(a6)
                                                  " after second frame.\n", 73);
  
  SetBplPointers();
     4c4:	4e92           	jsr (a2)
  SwapCl();
     4c6:	4e93           	jsr (a3)

  copword = (UWORD *) ViewCopper;
     4c8:	2079 0001 7696 	movea.l 17696 <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     4ce:	7000           	moveq #0,d0
     4d0:	3028 0072      	move.w 114(a0),d0
     4d4:	4840           	swap d0
     4d6:	4240           	clr.w d0
     4d8:	7200           	moveq #0,d1
     4da:	3228 0076      	move.w 118(a0),d1
     4de:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4e0:	b0b9 0001 769a 	cmp.l 1769a <Bitplane2>,d0
     4e6:	671e           	beq.s 506 <main+0x500>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4e8:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     4ee:	4eae ffc4      	jsr -60(a6)
     4f2:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     4f8:	2200           	move.l d0,d1
     4fa:	243c 0001 51a3 	move.l #86435,d2
     500:	7648           	moveq #72,d3
     502:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     506:	2f3c 0000 c800 	move.l #51200,-(sp)
     50c:	4878 0084      	pea 84 <main+0x7e>
     510:	4eb9 0000 163a 	jsr 163a <FreeDisplay>
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    ZoomTest();
     516:	4eb9 0000 16f2 	jsr 16f2 <ZoomTest>

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
     540:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
     546:	23ee 0022 0001 	move.l 34(a6),17684 <ActiView>
     54c:	7684 
	OwnBlitter();
     54e:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     552:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
     558:	4eae ff1c      	jsr -228(a6)
	Disable();
     55c:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
     562:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
     566:	2679 0001 76be 	movea.l 176be <hw>,a3
     56c:	302b 0010      	move.w 16(a3),d0
     570:	33c0 0001 7688 	move.w d0,17688 <SystemADKCON>
	SystemInts=hw->intenar;
     576:	302b 001c      	move.w 28(a3),d0
     57a:	33c0 0001 768c 	move.w d0,1768c <SystemInts>
	SystemDMA=hw->dmaconr;
     580:	302b 0002      	move.w 2(a3),d0
     584:	33c0 0001 768a 	move.w d0,1768a <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
     58a:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     590:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
     596:	45f9 0000 16ac 	lea 16ac <WaitVbl>,a2
     59c:	4e92           	jsr (a2)
	WaitVbl();
     59e:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
     5a0:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
     5a6:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
     5ac:	93c9           	suba.l a1,a1
     5ae:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     5b2:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
     5b8:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     5bc:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
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
     5dc:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
     5e2:	082e 0000 0129 	btst #0,297(a6)
     5e8:	6700 0290      	beq.w 87a <main+0x874>
		vbr = (APTR)Supervisor((void*)getvbr);
     5ec:	7e1e           	moveq #30,d7
     5ee:	de8f           	add.l sp,d7
     5f0:	cf8d           	exg d7,a5
     5f2:	4eae ffe2      	jsr -30(a6)
     5f6:	cf8d           	exg d7,a5

	VBR=GetVBR();
     5f8:	23c0 0001 768e 	move.l d0,1768e <VBR.lto_priv.3>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     5fe:	2079 0001 768e 	movea.l 1768e <VBR.lto_priv.3>,a0
     604:	2668 006c      	movea.l 108(a0),a3
	SystemIrq=GetInterruptHandler(); //store interrupt register
     608:	23cb 0001 7692 	move.l a3,17692 <SystemIrq>
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
     612:	2079 0001 76be 	movea.l 176be <hw>,a0
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
     638:	2279 0001 768e 	movea.l 1768e <VBR.lto_priv.3>,a1
     63e:	234b 006c      	move.l a3,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
     642:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
     648:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
     64e:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
     654:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
     65a:	3039 0001 768c 	move.w 1768c <SystemInts>,d0
     660:	0040 8000      	ori.w #-32768,d0
     664:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
     668:	3039 0001 768a 	move.w 1768a <SystemDMA>,d0
     66e:	0040 8000      	ori.w #-32768,d0
     672:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
     676:	3039 0001 7688 	move.w 17688 <SystemADKCON>,d0
     67c:	0040 8000      	ori.w #-32768,d0
     680:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
     684:	2279 0001 7684 	movea.l 17684 <ActiView>,a1
     68a:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     68e:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
     694:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     698:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
     69e:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     6a2:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
     6a8:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     6ac:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
     6b2:	4eae fe32      	jsr -462(a6)
	Enable();
     6b6:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
     6bc:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
     6c0:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
     6c6:	2279 0001 76ca 	movea.l 176ca <DOSBase>,a1
     6cc:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     6d0:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
     6d6:	2279 0001 76c2 	movea.l 176c2 <GfxBase>,a1
     6dc:	4eae fe62      	jsr -414(a6)
}
     6e0:	7000           	moveq #0,d0
     6e2:	4cdf 5c8c      	movem.l (sp)+,d2-d3/d7/a2-a4/a6
     6e6:	508f           	addq.l #8,sp
     6e8:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     6ea:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     6f0:	4eae ffc4      	jsr -60(a6)
     6f4:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     6fa:	2200           	move.l d0,d1
     6fc:	243c 0001 5223 	move.l #86563,d2
     702:	762c           	moveq #44,d3
     704:	4eae ffd0      	jsr -48(a6)
     708:	6000 faa8      	bra.w 1b2 <main+0x1ac>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
     70c:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     712:	4eae ffc4      	jsr -60(a6)
     716:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     71c:	2200           	move.l d0,d1
     71e:	243c 0001 51ec 	move.l #86508,d2
     724:	7636           	moveq #54,d3
     726:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
     72a:	23fc 0004 0000 	move.l #262144,176b6 <DrawBuffer>
     730:	0001 76b6 
  ViewBuffer = (ULONG *)0x50000;
     734:	23fc 0005 0000 	move.l #327680,176ac <ViewBuffer>
     73a:	0001 76ac 
  SetBplPointers();
     73e:	45f9 0000 160e 	lea 160e <SetBplPointers>,a2
     744:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     746:	0cb9 0005 0000 	cmpi.l #327680,176b6 <DrawBuffer>
     74c:	0001 76b6 
     750:	6600 fb38      	bne.w 28a <main+0x284>
     754:	6000 00cc      	bra.w 822 <main+0x81c>
		Exit(0);
     758:	9dce           	suba.l a6,a6
     75a:	7200           	moveq #0,d1
     75c:	4eae ff70      	jsr -144(a6)
     760:	6000 f8f0      	bra.w 52 <main+0x4c>
		Exit(0);
     764:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     76a:	7200           	moveq #0,d1
     76c:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     770:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
     776:	43f9 0001 4f50 	lea 14f50 <incbin_startimage_end+0x51c>,a1
     77c:	7000           	moveq #0,d0
     77e:	4eae fdd8      	jsr -552(a6)
     782:	23c0 0001 76ca 	move.l d0,176ca <DOSBase>
	if (!DOSBase)
     788:	6600 f8c8      	bne.w 52 <main+0x4c>
     78c:	60ca           	bra.s 758 <main+0x752>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     78e:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     794:	4eae ffc4      	jsr -60(a6)
     798:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     79e:	2200           	move.l d0,d1
     7a0:	243c 0001 4b20 	move.l #84768,d2
     7a6:	7626           	moveq #38,d3
     7a8:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     7ac:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     7b2:	7201           	moveq #1,d1
     7b4:	4eae ff70      	jsr -144(a6)
     7b8:	2039 0001 769a 	move.l 1769a <Bitplane2>,d0
     7be:	6000 fc18      	bra.w 3d8 <main+0x3d2>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     7c2:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     7c8:	4eae ffc4      	jsr -60(a6)
     7cc:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     7d2:	2200           	move.l d0,d1
     7d4:	243c 0001 4af9 	move.l #84729,d2
     7da:	7626           	moveq #38,d3
     7dc:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     7e0:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     7e6:	7201           	moveq #1,d1
     7e8:	4eae ff70      	jsr -144(a6)
     7ec:	2039 0001 769e 	move.l 1769e <Bitplane1>,d0
  ViewBuffer = Bitplane1;
     7f2:	23c0 0001 76ac 	move.l d0,176ac <ViewBuffer>
  ViewCopper = Copperlist1;
     7f8:	23f9 0001 76b0 	move.l 176b0 <Copperlist1>,17696 <ViewCopper>
     7fe:	0001 7696 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
     802:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
     808:	203c 0000 c800 	move.l #51200,d0
     80e:	7202           	moveq #2,d1
     810:	4eae ff3a      	jsr -198(a6)
     814:	23c0 0001 769a 	move.l d0,1769a <Bitplane2>
  if(Bitplane2 == 0) {
     81a:	6600 fbbc      	bne.w 3d8 <main+0x3d2>
     81e:	6000 ff6e      	bra.w 78e <main+0x788>
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     822:	0cb9 0004 0000 	cmpi.l #262144,176ac <ViewBuffer>
     828:	0001 76ac 
     82c:	6700 fa7a      	beq.w 2a8 <main+0x2a2>
    Write( Output(), 
     830:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     836:	4eae ffc4      	jsr -60(a6)
     83a:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     840:	2200           	move.l d0,d1
     842:	243c 0001 4f8b 	move.l #85899,d2
     848:	763b           	moveq #59,d3
     84a:	4eae ffd0      	jsr -48(a6)
     84e:	6000 fa58      	bra.w 2a8 <main+0x2a2>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     852:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     858:	4eae ffc4      	jsr -60(a6)
     85c:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     862:	2200           	move.l d0,d1
     864:	243c 0001 5041 	move.l #86081,d2
     86a:	7621           	moveq #33,d3
     86c:	4eae ffd0      	jsr -48(a6)
     870:	2079 0001 76b0 	movea.l 176b0 <Copperlist1>,a0
     876:	6000 faae      	bra.w 326 <main+0x320>
	APTR vbr = 0;
     87a:	7000           	moveq #0,d0
	VBR=GetVBR();
     87c:	23c0 0001 768e 	move.l d0,1768e <VBR.lto_priv.3>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     882:	2079 0001 768e 	movea.l 1768e <VBR.lto_priv.3>,a0
     888:	2668 006c      	movea.l 108(a0),a3
	SystemIrq=GetInterruptHandler(); //store interrupt register
     88c:	23cb 0001 7692 	move.l a3,17692 <SystemIrq>
	WaitVbl();
     892:	4e92           	jsr (a2)
	WaitVbl();
     894:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     896:	2079 0001 76be 	movea.l 176be <hw>,a0
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
     8ba:	4879 0001 4a68 	pea 14a68 <incbin_startimage_end+0x34>
     8c0:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdba52>
     8c4:	4878 0052      	pea 52 <main+0x4c>
     8c8:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeeb9b3>
     8ce:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     8d2:	203c 0001 4a4e 	move.l #84558,d0
     8d8:	4878 0001      	pea 1 <_start+0x1>
     8dc:	2f02           	move.l d2,-(sp)
     8de:	42a7           	clr.l -(sp)
     8e0:	2f00           	move.l d0,-(sp)
     8e2:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdba52>
     8e6:	4878 0052      	pea 52 <main+0x4c>
     8ea:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeeb9b3>
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
     906:	4879 0001 4a72 	pea 14a72 <incbin_startimage_end+0x3e>
     90c:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdba52>
     910:	4878 0052      	pea 52 <main+0x4c>
     914:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeeb9b3>
     91a:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     91e:	203c 0001 4a35 	move.l #84533,d0
     924:	4878 0001      	pea 1 <_start+0x1>
     928:	2f02           	move.l d2,-(sp)
     92a:	42a7           	clr.l -(sp)
     92c:	2f00           	move.l d0,-(sp)
     92e:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdba52>
     932:	4878 0052      	pea 52 <main+0x4c>
     936:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeeb9b3>
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
     94e:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeeb9b3>
     954:	6734           	beq.s 98a <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
     956:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
     95c:	206f 0090      	movea.l 144(sp),a0
     960:	43ef 0094      	lea 148(sp),a1
     964:	45f9 0000 436c 	lea 436c <PutChar>,a2
     96a:	47ef 000c      	lea 12(sp),a3
     96e:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
     972:	2f0b           	move.l a3,-(sp)
     974:	4878 0056      	pea 56 <main+0x50>
     978:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeeb9b3>
     97e:	508f           	addq.l #8,sp
}
     980:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     984:	4fef 0080      	lea 128(sp),sp
     988:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
     98a:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
     990:	206f 0090      	movea.l 144(sp),a0
     994:	43ef 0094      	lea 148(sp),a1
     998:	45f9 0000 435e 	lea 435e <KPutCharX>,a2
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
     9cc:	4eba 37b0      	jsr 417e <memset>(pc)
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
     9e4:	2e3c 0001 4a7d 	move.l #84605,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
     9ea:	301c           	move.w (a4)+,d0
     9ec:	bd40           	eor.w d6,d0
     9ee:	b05d           	cmp.w (a5)+,d0
     9f0:	6736           	beq.s a28 <TestRow+0x7a>
      data[0] = i;
     9f2:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
     9f6:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
     9fc:	2047           	movea.l d7,a0
     9fe:	43ef 0030      	lea 48(sp),a1
     a02:	45f9 0000 436c 	lea 436c <PutChar>,a2
     a08:	2645           	movea.l d5,a3
     a0a:	4eae fdf6      	jsr -522(a6)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
     a0e:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     a14:	4eae ffc4      	jsr -60(a6)
     a18:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
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
     a5e:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
     a64:	41f9 0001 4a7d 	lea 14a7d <incbin_startimage_end+0x49>,a0
     a6a:	43ef 0030      	lea 48(sp),a1
     a6e:	45f9 0000 436c 	lea 436c <PutChar>,a2
     a74:	47ef 0034      	lea 52(sp),a3
     a78:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
     a7c:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     a82:	4eae ffc4      	jsr -60(a6)
     a86:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
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
     aac:	4879 0001 4aad 	pea 14aad <incbin_startimage_end+0x79>
     ab2:	4eba fe92      	jsr 946 <KPrintF>(pc)
     ab6:	4fef 000c      	lea 12(sp),sp
}
     aba:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
     abe:	4fef 006c      	lea 108(sp),sp
     ac2:	4e75           	rts

00000ac4 <Vblankcounter>:
  Counter4Frames++;
     ac4:	52b9 0001 76c6 	addq.l #1,176c6 <Counter4Frames>
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
  for( int i=0;i<length;i++)
     aea:	226f 0008      	movea.l 8(sp),a1
     aee:	d3c9           	adda.l a1,a1
     af0:	d3c9           	adda.l a1,a1
     af2:	d3ef 0004      	adda.l 4(sp),a1
     af6:	206f 000c      	movea.l 12(sp),a0
     afa:	202f 0010      	move.l 16(sp),d0
     afe:	d080           	add.l d0,d0
     b00:	d080           	add.l d0,d0
     b02:	d088           	add.l a0,d0
    if( instructions[ pos+i] != batch[ i])
     b04:	b388           	cmpm.l (a0)+,(a1)+
     b06:	6608           	bne.s b10 <TestCopperlistBatch+0x26>
  for( int i=0;i<length;i++)
     b08:	b1c0           	cmpa.l d0,a0
     b0a:	66f8           	bne.s b04 <TestCopperlistBatch+0x1a>
  return 1;
     b0c:	7001           	moveq #1,d0
}
     b0e:	4e75           	rts
      return 0;
     b10:	7000           	moveq #0,d0
}
     b12:	4e75           	rts

00000b14 <ClBuild>:
ULONG * ClBuild() {
     b14:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
     b18:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
     b1e:	707b           	moveq #123,d0
     b20:	4600           	not.b d0
     b22:	7202           	moveq #2,d1
     b24:	4eae ff3a      	jsr -198(a6)
     b28:	2440           	movea.l d0,a2
  if( retval == 0) {
     b2a:	4a80           	tst.l d0
     b2c:	6700 010e      	beq.w c3c <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
     b30:	24b9 0001 730c 	move.l 1730c <ClsSprites>,(a2)
     b36:	2579 0001 7310 	move.l 17310 <ClsSprites+0x4>,4(a2)
     b3c:	0004 
     b3e:	2579 0001 7314 	move.l 17314 <ClsSprites+0x8>,8(a2)
     b44:	0008 
     b46:	2579 0001 7318 	move.l 17318 <ClsSprites+0xc>,12(a2)
     b4c:	000c 
     b4e:	2579 0001 731c 	move.l 1731c <ClsSprites+0x10>,16(a2)
     b54:	0010 
     b56:	2579 0001 7320 	move.l 17320 <ClsSprites+0x14>,20(a2)
     b5c:	0014 
     b5e:	2579 0001 7324 	move.l 17324 <ClsSprites+0x18>,24(a2)
     b64:	0018 
     b66:	2579 0001 7328 	move.l 17328 <ClsSprites+0x1c>,28(a2)
     b6c:	001c 
     b6e:	2579 0001 732c 	move.l 1732c <ClsSprites+0x20>,32(a2)
     b74:	0020 
     b76:	2579 0001 7330 	move.l 17330 <ClsSprites+0x24>,36(a2)
     b7c:	0024 
     b7e:	2579 0001 7334 	move.l 17334 <ClsSprites+0x28>,40(a2)
     b84:	0028 
     b86:	2579 0001 7338 	move.l 17338 <ClsSprites+0x2c>,44(a2)
     b8c:	002c 
     b8e:	2579 0001 733c 	move.l 1733c <ClsSprites+0x30>,48(a2)
     b94:	0030 
     b96:	2579 0001 7340 	move.l 17340 <ClsSprites+0x34>,52(a2)
     b9c:	0034 
     b9e:	2579 0001 7344 	move.l 17344 <ClsSprites+0x38>,56(a2)
     ba4:	0038 
     ba6:	2579 0001 7348 	move.l 17348 <ClsSprites+0x3c>,60(a2)
     bac:	003c 
    *cl++ = *clpartinstruction++;
     bae:	2579 0001 72dc 	move.l 172dc <ClScreen>,64(a2)
     bb4:	0040 
     bb6:	2579 0001 72e0 	move.l 172e0 <ClScreen+0x4>,68(a2)
     bbc:	0044 
     bbe:	2579 0001 72e4 	move.l 172e4 <ClScreen+0x8>,72(a2)
     bc4:	0048 
     bc6:	2579 0001 72e8 	move.l 172e8 <ClScreen+0xc>,76(a2)
     bcc:	004c 
     bce:	2579 0001 72ec 	move.l 172ec <ClScreen+0x10>,80(a2)
     bd4:	0050 
     bd6:	2579 0001 72f0 	move.l 172f0 <ClScreen+0x14>,84(a2)
     bdc:	0054 
     bde:	2579 0001 72f4 	move.l 172f4 <ClScreen+0x18>,88(a2)
     be4:	0058 
     be6:	2579 0001 72f8 	move.l 172f8 <ClScreen+0x1c>,92(a2)
     bec:	005c 
     bee:	2579 0001 72fc 	move.l 172fc <ClScreen+0x20>,96(a2)
     bf4:	0060 
     bf6:	2579 0001 7300 	move.l 17300 <ClScreen+0x24>,100(a2)
     bfc:	0064 
     bfe:	2579 0001 7304 	move.l 17304 <ClScreen+0x28>,104(a2)
     c04:	0068 
     c06:	2579 0001 7308 	move.l 17308 <ClScreen+0x2c>,108(a2)
     c0c:	006c 
  *cl++ = 0x00e00000;
     c0e:	257c 00e0 0000 	move.l #14680064,112(a2)
     c14:	0070 
  *cl++ = 0x00e20000;
     c16:	257c 00e2 0000 	move.l #14811136,116(a2)
     c1c:	0074 
    *cl++ = *clpartinstruction++;
     c1e:	2579 0001 725c 	move.l 1725c <ClColor>,120(a2)
     c24:	0078 
     c26:	2579 0001 7260 	move.l 17260 <ClColor+0x4>,124(a2)
     c2c:	007c 
  *cl = 0xfffffffe;
     c2e:	70fe           	moveq #-2,d0
     c30:	2540 0080      	move.l d0,128(a2)
}
     c34:	200a           	move.l a2,d0
     c36:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     c3a:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     c3c:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     c42:	4eae ffc4      	jsr -60(a6)
     c46:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     c4c:	2200           	move.l d0,d1
     c4e:	243c 0001 4ad3 	move.l #84691,d2
     c54:	7628           	moveq #40,d3
     c56:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     c5a:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
     c60:	7201           	moveq #1,d1
     c62:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
     c66:	24b9 0001 730c 	move.l 1730c <ClsSprites>,(a2)
     c6c:	2579 0001 7310 	move.l 17310 <ClsSprites+0x4>,4(a2)
     c72:	0004 
     c74:	2579 0001 7314 	move.l 17314 <ClsSprites+0x8>,8(a2)
     c7a:	0008 
     c7c:	2579 0001 7318 	move.l 17318 <ClsSprites+0xc>,12(a2)
     c82:	000c 
     c84:	2579 0001 731c 	move.l 1731c <ClsSprites+0x10>,16(a2)
     c8a:	0010 
     c8c:	2579 0001 7320 	move.l 17320 <ClsSprites+0x14>,20(a2)
     c92:	0014 
     c94:	2579 0001 7324 	move.l 17324 <ClsSprites+0x18>,24(a2)
     c9a:	0018 
     c9c:	2579 0001 7328 	move.l 17328 <ClsSprites+0x1c>,28(a2)
     ca2:	001c 
     ca4:	2579 0001 732c 	move.l 1732c <ClsSprites+0x20>,32(a2)
     caa:	0020 
     cac:	2579 0001 7330 	move.l 17330 <ClsSprites+0x24>,36(a2)
     cb2:	0024 
     cb4:	2579 0001 7334 	move.l 17334 <ClsSprites+0x28>,40(a2)
     cba:	0028 
     cbc:	2579 0001 7338 	move.l 17338 <ClsSprites+0x2c>,44(a2)
     cc2:	002c 
     cc4:	2579 0001 733c 	move.l 1733c <ClsSprites+0x30>,48(a2)
     cca:	0030 
     ccc:	2579 0001 7340 	move.l 17340 <ClsSprites+0x34>,52(a2)
     cd2:	0034 
     cd4:	2579 0001 7344 	move.l 17344 <ClsSprites+0x38>,56(a2)
     cda:	0038 
     cdc:	2579 0001 7348 	move.l 17348 <ClsSprites+0x3c>,60(a2)
     ce2:	003c 
    *cl++ = *clpartinstruction++;
     ce4:	2579 0001 72dc 	move.l 172dc <ClScreen>,64(a2)
     cea:	0040 
     cec:	2579 0001 72e0 	move.l 172e0 <ClScreen+0x4>,68(a2)
     cf2:	0044 
     cf4:	2579 0001 72e4 	move.l 172e4 <ClScreen+0x8>,72(a2)
     cfa:	0048 
     cfc:	2579 0001 72e8 	move.l 172e8 <ClScreen+0xc>,76(a2)
     d02:	004c 
     d04:	2579 0001 72ec 	move.l 172ec <ClScreen+0x10>,80(a2)
     d0a:	0050 
     d0c:	2579 0001 72f0 	move.l 172f0 <ClScreen+0x14>,84(a2)
     d12:	0054 
     d14:	2579 0001 72f4 	move.l 172f4 <ClScreen+0x18>,88(a2)
     d1a:	0058 
     d1c:	2579 0001 72f8 	move.l 172f8 <ClScreen+0x1c>,92(a2)
     d22:	005c 
     d24:	2579 0001 72fc 	move.l 172fc <ClScreen+0x20>,96(a2)
     d2a:	0060 
     d2c:	2579 0001 7300 	move.l 17300 <ClScreen+0x24>,100(a2)
     d32:	0064 
     d34:	2579 0001 7304 	move.l 17304 <ClScreen+0x28>,104(a2)
     d3a:	0068 
     d3c:	2579 0001 7308 	move.l 17308 <ClScreen+0x2c>,108(a2)
     d42:	006c 
  *cl++ = 0x00e00000;
     d44:	257c 00e0 0000 	move.l #14680064,112(a2)
     d4a:	0070 
  *cl++ = 0x00e20000;
     d4c:	257c 00e2 0000 	move.l #14811136,116(a2)
     d52:	0074 
    *cl++ = *clpartinstruction++;
     d54:	2579 0001 725c 	move.l 1725c <ClColor>,120(a2)
     d5a:	0078 
     d5c:	2579 0001 7260 	move.l 17260 <ClColor+0x4>,124(a2)
     d62:	007c 
  *cl = 0xfffffffe;
     d64:	70fe           	moveq #-2,d0
     d66:	2540 0080      	move.l d0,128(a2)
}
     d6a:	200a           	move.l a2,d0
     d6c:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     d70:	4e75           	rts

00000d72 <WaitBlt>:
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     d72:	2079 0001 76be 	movea.l 176be <hw>,a0
     d78:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     d7c:	3028 0002      	move.w 2(a0),d0
     d80:	0800 000e      	btst #14,d0
     d84:	66f6           	bne.s d7c <WaitBlt+0xa>
}
     d86:	4e75           	rts

00000d88 <Zoom_ZoomIntoPicture>:
  hw->bltcon0 = 0x9f0 + shiftright;
  hw->bltcon1 = 0;
}

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
     d88:	4fef ffe0      	lea -32(sp),sp
     d8c:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
     d90:	282f 0058      	move.l 88(sp),d4
     d94:	262f 005c      	move.l 92(sp),d3
     d98:	3404           	move.w d4,d2
  WaitBlit();
     d9a:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
     da0:	4eae ff1c      	jsr -228(a6)
  hw->bltafwm = 0xffff;
     da4:	2079 0001 76be 	movea.l 176be <hw>,a0
     daa:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     db0:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     db6:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     dbc:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     dc2:	317c 002c 0066 	move.w #44,102(a0)
  Init_Blit();
  WORD shiftright = 9;
  UWORD shifthoriz = 7;
  UWORD startofword = 21*16;
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
     dc8:	3044           	movea.w d4,a0
     dca:	d0c4           	adda.w d4,a0
     dcc:	3208           	move.w a0,d1
     dce:	d248           	add.w a0,d1
     dd0:	d244           	add.w d4,d1
     dd2:	3001           	move.w d1,d0
     dd4:	d041           	add.w d1,d0
     dd6:	0640 014c      	addi.w #332,d0
     dda:	3f40 0040      	move.w d0,64(sp)
  WORD shiftright = 9;
     dde:	3f7c 0009 0032 	move.w #9,50(sp)
  while( nextzoom > 22 * 16) {
     de4:	0c40 0160      	cmpi.w #352,d0
     de8:	631a           	bls.s e04 <Zoom_ZoomIntoPicture+0x7c>
  WORD shiftright = 9;
     dea:	327c 0009      	movea.w #9,a1
    nextzoom -= (19 + zoomnr);
     dee:	0640 ffed      	addi.w #-19,d0
     df2:	9042           	sub.w d2,d0
    shiftright--;
     df4:	5349           	subq.w #1,a1
  while( nextzoom > 22 * 16) {
     df6:	0c40 0160      	cmpi.w #352,d0
     dfa:	62f2           	bhi.s dee <Zoom_ZoomIntoPicture+0x66>
     dfc:	3f49 0032      	move.w a1,50(sp)
     e00:	3f40 0040      	move.w d0,64(sp)
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
     e04:	7012           	moveq #18,d0
     e06:	9041           	sub.w d1,d0
     e08:	3f40 0048      	move.w d0,72(sp)
  while( ZoomHorizontalStart < 0) {
     e0c:	6c00 0346      	bge.w 1154 <Zoom_ZoomIntoPicture+0x3cc>
     e10:	3200           	move.w d0,d1
  UWORD shifthoriz = 7;
     e12:	7007           	moveq #7,d0
      ZoomHorizontalStart += 1 + 18 + zoomnr;
     e14:	0641 0013      	addi.w #19,d1
     e18:	d242           	add.w d2,d1
      shifthoriz--;
     e1a:	5340           	subq.w #1,d0
  while( ZoomHorizontalStart < 0) {
     e1c:	4a41           	tst.w d1
     e1e:	6df4           	blt.s e14 <Zoom_ZoomIntoPicture+0x8c>
     e20:	3f41 0048      	move.w d1,72(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    /*UWORD size4blitsmall = ZMLINESIZE/2*ZoomHorizontal*planes;
    UWORD size4blitbig = ZMLINESIZE/2*(ZoomHorizontal+1)*planes;*/

    UWORD onestep = ZMLINESIZE/2*planes;
     e24:	3203           	move.w d3,d1
     e26:	d243           	add.w d3,d1
     e28:	d243           	add.w d3,d1
     e2a:	e749           	lsl.w #3,d1
     e2c:	3f41 0034      	move.w d1,52(sp)
  hw->bltsize = height*64+2;
     e30:	3e03           	move.w d3,d7
     e32:	ed4f           	lsl.w #6,d7
     e34:	3207           	move.w d7,d1
     e36:	5441           	addq.w #2,d1
     e38:	3f41 0036      	move.w d1,54(sp)
          linesleft--;
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
        pos4source += size4blit;
        pos4dest += size4blit + onestep;   
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     e3c:	90c4           	suba.w d4,a0
     e3e:	3a48           	movea.w a0,a5
     e40:	4bed 0012      	lea 18(a5),a5
     e44:	7200           	moveq #0,d1
     e46:	322f 0034      	move.w 52(sp),d1
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
     e4a:	c6c0           	mulu.w d0,d3
     e4c:	2003           	move.l d3,d0
     e4e:	d083           	add.l d3,d0
     e50:	d083           	add.l d3,d0
     e52:	e988           	lsl.l #4,d0
     e54:	206f 0050      	movea.l 80(sp),a0
     e58:	41f0 082c      	lea (44,a0,d0.l),a0
     e5c:	2f48 003c      	move.l a0,60(sp)
     e60:	702c           	moveq #44,d0
     e62:	d0af 0054      	add.l 84(sp),d0
     e66:	2f40 0038      	move.l d0,56(sp)
  UWORD shifttoleft = 0;
     e6a:	426f 0046      	clr.w 70(sp)
  UWORD startofword = 21*16;
     e6e:	3f7c 0150 0030 	move.w #336,48(sp)
      nextzoom -= (19 + zoomnr);
     e74:	70ed           	moveq #-19,d0
     e76:	9042           	sub.w d2,d0
     e78:	3f40 004a      	move.w d0,74(sp)
    ZoomBlit_Increment4SrcA = 1;
     e7c:	2841           	movea.l d1,a4
    ZoomHorizontal = ZoomHorizontalStart;
     e7e:	33ef 0048 0001 	move.w 72(sp),176a6 <ZoomHorizontal>
     e84:	76a6 
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
     e86:	242f 003c      	move.l 60(sp),d2
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
     e8a:	262f 0038      	move.l 56(sp),d3
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
     e8e:	7c00           	moveq #0,d6
     e90:	3c2f 0046      	move.w 70(sp),d6
     e94:	2a06           	move.l d6,d5
     e96:	da86           	add.l d6,d5
     e98:	3f6f 0032 002c 	move.w 50(sp),44(sp)
     e9e:	382f 0032      	move.w 50(sp),d4
     ea2:	720c           	moveq #12,d1
     ea4:	e36c           	lsl.w d1,d4
     ea6:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
     eac:	7000           	moveq #0,d0
     eae:	302f 0030      	move.w 48(sp),d0
     eb2:	306f 0040      	movea.w 64(sp),a0
     eb6:	b1c0           	cmpa.l d0,a0
     eb8:	6e00 00e8      	bgt.w fa2 <Zoom_ZoomIntoPicture+0x21a>
  WaitBlit();
     ebc:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
     ec0:	2079 0001 76be 	movea.l 176be <hw>,a0
     ec6:	0644 09f0      	addi.w #2544,d4
     eca:	3144 0040      	move.w d4,64(a0)
  hw->bltcon1 = 0;
     ece:	317c 0000 0042 	move.w #0,66(a0)
     ed4:	3239 0001 76a6 	move.w 176a6 <ZoomHorizontal>,d1
    WORD linesleft = 272;
     eda:	383c 0110      	move.w #272,d4
     ede:	2f46 002c      	move.l d6,44(sp)
     ee2:	2645           	movea.l d5,a3
     ee4:	3c2f 0034      	move.w 52(sp),d6
        if( linesleft >= ZoomHorizontal+1) {
     ee8:	b841           	cmp.w d1,d4
     eea:	6f00 009a      	ble.w f86 <Zoom_ZoomIntoPicture+0x1fe>
          linesleft -= ZoomHorizontal;
     eee:	9841           	sub.w d1,d4
        UWORD size4blit = ZoomHorizontal*onestep; 
     ef0:	3001           	move.w d1,d0
     ef2:	c1c6           	muls.w d6,d0
        if( linesleft>0) {
     ef4:	0280 0000 ffff 	andi.l #65535,d0
     efa:	2440           	movea.l d0,a2
     efc:	d5c0           	adda.l d0,a2
     efe:	4a44           	tst.w d4
     f00:	6f2c           	ble.s f2e <Zoom_ZoomIntoPicture+0x1a6>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
     f02:	226f 002c      	movea.l 44(sp),a1
     f06:	d3c0           	adda.l d0,a1
     f08:	d3c9           	adda.l a1,a1
     f0a:	d3c2           	adda.l d2,a1
          UWORD *tmpdest = pos4dest +  size4blit;
     f0c:	4df2 3800      	lea (0,a2,d3.l),a6
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     f10:	3a28 0002      	move.w 2(a0),d5
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     f14:	3a28 0002      	move.w 2(a0),d5
     f18:	0805 000e      	btst #14,d5
     f1c:	66f6           	bne.s f14 <Zoom_ZoomIntoPicture+0x18c>
  hw->bltapt = (UWORD *) source;
     f1e:	2149 0050      	move.l a1,80(a0)
  hw->bltdpt = (UWORD *) destination;
     f22:	214e 0054      	move.l a6,84(a0)
  hw->bltsize = height*64+2;
     f26:	316f 0036 0058 	move.w 54(sp),88(a0)
          linesleft--;
     f2c:	5344           	subq.w #1,d4
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     f2e:	43f3 2800      	lea (0,a3,d2.l),a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     f32:	3a28 0002      	move.w 2(a0),d5
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     f36:	3a28 0002      	move.w 2(a0),d5
     f3a:	0805 000e      	btst #14,d5
     f3e:	66f6           	bne.s f36 <Zoom_ZoomIntoPicture+0x1ae>
  hw->bltapt = (UWORD *) source;
     f40:	2149 0050      	move.l a1,80(a0)
  hw->bltdpt = (UWORD *) destination;
     f44:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
     f48:	c3c7           	muls.w d7,d1
     f4a:	5441           	addq.w #2,d1
     f4c:	3141 0058      	move.w d1,88(a0)
        pos4source += size4blit;
     f50:	d48a           	add.l a2,d2
        pos4dest += size4blit + onestep; 
     f52:	d08c           	add.l a4,d0
     f54:	d080           	add.l d0,d0
     f56:	d680           	add.l d0,d3
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     f58:	320d           	move.w a5,d1
      while(linesleft > 0) {
     f5a:	4a44           	tst.w d4
     f5c:	6e8a           	bgt.s ee8 <Zoom_ZoomIntoPicture+0x160>
     f5e:	33cd 0001 76a6 	move.w a5,176a6 <ZoomHorizontal>
      if(shiftright < 0) {
        shiftright += 16;
        shifttoleft = 1;
      }
    }
    startofword -= 16;
     f64:	066f fff0 0030 	addi.w #-16,48(sp)
     f6a:	55af 003c      	subq.l #2,60(sp)
     f6e:	55af 0038      	subq.l #2,56(sp)
  for(int i=0;i<22;i++) {
     f72:	0c6f fff0 0030 	cmpi.w #-16,48(sp)
     f78:	6600 ff04      	bne.w e7e <Zoom_ZoomIntoPicture+0xf6>
  }
  //ZoomHorizontal = 10;
}
     f7c:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
     f80:	4fef 0020      	lea 32(sp),sp
     f84:	4e75           	rts
        UWORD size4blit = ZoomHorizontal*onestep; 
     f86:	3006           	move.w d6,d0
     f88:	c1c4           	muls.w d4,d0
        if( linesleft>0) {
     f8a:	0280 0000 ffff 	andi.l #65535,d0
     f90:	2440           	movea.l d0,a2
     f92:	d5c0           	adda.l d0,a2
        UWORD size4blit = ZoomHorizontal*onestep; 
     f94:	3204           	move.w d4,d1
          linesleft = 0;
     f96:	4244           	clr.w d4
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     f98:	43f3 2800      	lea (0,a3,d2.l),a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     f9c:	3a28 0002      	move.w 2(a0),d5
     fa0:	6094           	bra.s f36 <Zoom_ZoomIntoPicture+0x1ae>
  UWORD colnr = nextzoom - startofword - 1;                                                                          
     fa2:	366f 0040      	movea.w 64(sp),a3
     fa6:	96ef 0030      	suba.w 48(sp),a3
     faa:	534b           	subq.w #1,a3
  if( shiftright == 0) {
     fac:	302f 002c      	move.w 44(sp),d0
     fb0:	5340           	subq.w #1,d0
     fb2:	3f40 0032      	move.w d0,50(sp)
     fb6:	4a6f 002c      	tst.w 44(sp)
     fba:	6600 013c      	bne.w 10f8 <Zoom_ZoomIntoPicture+0x370>
    ZoomBlit_Increment4SrcA = 1;
     fbe:	33fc 0001 0001 	move.w #1,176b4 <ZoomBlit_Increment4SrcA>
     fc4:	76b4 
     fc6:	347c fde4      	movea.w #-540,a2
  WaitBlit(); 
     fca:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     fce:	2079 0001 76be 	movea.l 176be <hw>,a0
     fd4:	3144 0042      	move.w d4,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
     fd8:	314a 0040      	move.w a2,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     fdc:	7000           	moveq #0,d0
     fde:	300b           	move.w a3,d0
     fe0:	7210           	moveq #16,d1
     fe2:	9280           	sub.l d0,d1
     fe4:	2001           	move.l d1,d0
     fe6:	7200           	moveq #0,d1
     fe8:	4641           	not.w d1
     fea:	e1a9           	lsl.l d0,d1
     fec:	3141 0070      	move.w d1,112(a0)
      nextzoom -= (19 + zoomnr);
     ff0:	302f 004a      	move.w 74(sp),d0
     ff4:	d16f 0040      	add.w d0,64(sp)
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
     ff8:	7000           	moveq #0,d0
     ffa:	3039 0001 76b4 	move.w 176b4 <ZoomBlit_Increment4SrcA>,d0
    1000:	2c40           	movea.l d0,a6
    1002:	ddc0           	adda.l d0,a6
    1004:	3239 0001 76a6 	move.w 176a6 <ZoomHorizontal>,d1
    WORD linesleft = 272;
    100a:	383c 0110      	move.w #272,d4
    100e:	2f46 0042      	move.l d6,66(sp)
        if( linesleft >= ZoomHorizontal+1) {
    1012:	b841           	cmp.w d1,d4
    1014:	6f00 00c2      	ble.w 10d8 <Zoom_ZoomIntoPicture+0x350>
          linesleft -= ZoomHorizontal;
    1018:	9841           	sub.w d1,d4
        UWORD size4blit = ZoomHorizontal*onestep;
    101a:	302f 0034      	move.w 52(sp),d0
    101e:	c1c1           	muls.w d1,d0
        if( linesleft>0) {
    1020:	0280 0000 ffff 	andi.l #65535,d0
    1026:	2440           	movea.l d0,a2
    1028:	d5c0           	adda.l d0,a2
    102a:	4a44           	tst.w d4
    102c:	6f34           	ble.s 1062 <Zoom_ZoomIntoPicture+0x2da>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    102e:	226f 0042      	movea.l 66(sp),a1
    1032:	d3c0           	adda.l d0,a1
    1034:	d3c9           	adda.l a1,a1
    1036:	d3c2           	adda.l d2,a1
          UWORD *tmpdest = pos4dest + size4blit;
    1038:	47f2 3800      	lea (0,a2,d3.l),a3
    103c:	3c28 0002      	move.w 2(a0),d6
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    1040:	3c28 0002      	move.w 2(a0),d6
    1044:	0806 000e      	btst #14,d6
    1048:	66f6           	bne.s 1040 <Zoom_ZoomIntoPicture+0x2b8>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    104a:	2c09           	move.l a1,d6
    104c:	dc8e           	add.l a6,d6
    104e:	2146 0050      	move.l d6,80(a0)
  hw->bltbpt = source;
    1052:	2149 004c      	move.l a1,76(a0)
  hw->bltdpt = destination;
    1056:	214b 0054      	move.l a3,84(a0)
  hw->bltsize = height*64+2;
    105a:	316f 0036 0058 	move.w 54(sp),88(a0)
          linesleft--;
    1060:	5344           	subq.w #1,d4
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1062:	2242           	movea.l d2,a1
    1064:	d3c5           	adda.l d5,a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1066:	3c28 0002      	move.w 2(a0),d6
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    106a:	3c28 0002      	move.w 2(a0),d6
    106e:	0806 000e      	btst #14,d6
    1072:	66f6           	bne.s 106a <Zoom_ZoomIntoPicture+0x2e2>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    1074:	2c09           	move.l a1,d6
    1076:	dc8e           	add.l a6,d6
    1078:	2146 0050      	move.l d6,80(a0)
  hw->bltbpt = source;
    107c:	2149 004c      	move.l a1,76(a0)
  hw->bltdpt = destination;
    1080:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
    1084:	c3c7           	muls.w d7,d1
    1086:	5441           	addq.w #2,d1
    1088:	3141 0058      	move.w d1,88(a0)
        pos4source += size4blit;
    108c:	d48a           	add.l a2,d2
        pos4dest += size4blit + onestep;   
    108e:	d08c           	add.l a4,d0
    1090:	d080           	add.l d0,d0
    1092:	d680           	add.l d0,d3
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1094:	320d           	move.w a5,d1
      while( linesleft > 0) {
    1096:	4a44           	tst.w d4
    1098:	6e00 ff78      	bgt.w 1012 <Zoom_ZoomIntoPicture+0x28a>
    109c:	33cd 0001 76a6 	move.w a5,176a6 <ZoomHorizontal>
      if(shiftright < 0) {
    10a2:	4a6f 0032      	tst.w 50(sp)
    10a6:	6c00 febc      	bge.w f64 <Zoom_ZoomIntoPicture+0x1dc>
        shiftright += 16;
    10aa:	322f 002c      	move.w 44(sp),d1
    10ae:	0641 000f      	addi.w #15,d1
    10b2:	3f41 0032      	move.w d1,50(sp)
        shifttoleft = 1;
    10b6:	3f7c 0001 0046 	move.w #1,70(sp)
    startofword -= 16;
    10bc:	066f fff0 0030 	addi.w #-16,48(sp)
    10c2:	55af 003c      	subq.l #2,60(sp)
    10c6:	55af 0038      	subq.l #2,56(sp)
  for(int i=0;i<22;i++) {
    10ca:	0c6f fff0 0030 	cmpi.w #-16,48(sp)
    10d0:	6600 fdac      	bne.w e7e <Zoom_ZoomIntoPicture+0xf6>
    10d4:	6000 fea6      	bra.w f7c <Zoom_ZoomIntoPicture+0x1f4>
        UWORD size4blit = ZoomHorizontal*onestep;
    10d8:	302f 0034      	move.w 52(sp),d0
    10dc:	c1c4           	muls.w d4,d0
        if( linesleft>0) {
    10de:	0280 0000 ffff 	andi.l #65535,d0
    10e4:	2440           	movea.l d0,a2
    10e6:	d5c0           	adda.l d0,a2
        UWORD size4blit = ZoomHorizontal*onestep;
    10e8:	3204           	move.w d4,d1
          linesleft = 0;
    10ea:	4244           	clr.w d4
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    10ec:	2242           	movea.l d2,a1
    10ee:	d3c5           	adda.l d5,a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    10f0:	3c28 0002      	move.w 2(a0),d6
    10f4:	6000 ff74      	bra.w 106a <Zoom_ZoomIntoPicture+0x2e2>
  ZoomBlit_Increment4SrcA = 0;
    10f8:	4279 0001 76b4 	clr.w 176b4 <ZoomBlit_Increment4SrcA>
    shifta = (shiftright - 1) << 12;
    10fe:	720c           	moveq #12,d1
    1100:	e368           	lsl.w d1,d0
    1102:	3440           	movea.w d0,a2
    1104:	45ea 0de4      	lea 3556(a2),a2
  WaitBlit(); 
    1108:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    110c:	2079 0001 76be 	movea.l 176be <hw>,a0
    1112:	3144 0042      	move.w d4,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1116:	314a 0040      	move.w a2,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    111a:	7000           	moveq #0,d0
    111c:	300b           	move.w a3,d0
    111e:	7210           	moveq #16,d1
    1120:	9280           	sub.l d0,d1
    1122:	2001           	move.l d1,d0
    1124:	7200           	moveq #0,d1
    1126:	4641           	not.w d1
    1128:	e1a9           	lsl.l d0,d1
    112a:	3141 0070      	move.w d1,112(a0)
      nextzoom -= (19 + zoomnr);
    112e:	302f 004a      	move.w 74(sp),d0
    1132:	d16f 0040      	add.w d0,64(sp)
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    1136:	7000           	moveq #0,d0
    1138:	3039 0001 76b4 	move.w 176b4 <ZoomBlit_Increment4SrcA>,d0
    113e:	2c40           	movea.l d0,a6
    1140:	ddc0           	adda.l d0,a6
    1142:	3239 0001 76a6 	move.w 176a6 <ZoomHorizontal>,d1
    WORD linesleft = 272;
    1148:	383c 0110      	move.w #272,d4
    114c:	2f46 0042      	move.l d6,66(sp)
    1150:	6000 fec0      	bra.w 1012 <Zoom_ZoomIntoPicture+0x28a>
  UWORD shifthoriz = 7;
    1154:	7007           	moveq #7,d0
    UWORD onestep = ZMLINESIZE/2*planes;
    1156:	3203           	move.w d3,d1
    1158:	d243           	add.w d3,d1
    115a:	d243           	add.w d3,d1
    115c:	e749           	lsl.w #3,d1
    115e:	3f41 0034      	move.w d1,52(sp)
  hw->bltsize = height*64+2;
    1162:	3e03           	move.w d3,d7
    1164:	ed4f           	lsl.w #6,d7
    1166:	3207           	move.w d7,d1
    1168:	5441           	addq.w #2,d1
    116a:	3f41 0036      	move.w d1,54(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    116e:	90c4           	suba.w d4,a0
    1170:	3a48           	movea.w a0,a5
    1172:	4bed 0012      	lea 18(a5),a5
    1176:	7200           	moveq #0,d1
    1178:	322f 0034      	move.w 52(sp),d1
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    117c:	c6c0           	mulu.w d0,d3
    117e:	2003           	move.l d3,d0
    1180:	d083           	add.l d3,d0
    1182:	d083           	add.l d3,d0
    1184:	e988           	lsl.l #4,d0
    1186:	206f 0050      	movea.l 80(sp),a0
    118a:	41f0 082c      	lea (44,a0,d0.l),a0
    118e:	2f48 003c      	move.l a0,60(sp)
    1192:	702c           	moveq #44,d0
    1194:	d0af 0054      	add.l 84(sp),d0
    1198:	2f40 0038      	move.l d0,56(sp)
  UWORD shifttoleft = 0;
    119c:	426f 0046      	clr.w 70(sp)
  UWORD startofword = 21*16;
    11a0:	3f7c 0150 0030 	move.w #336,48(sp)
      nextzoom -= (19 + zoomnr);
    11a6:	70ed           	moveq #-19,d0
    11a8:	9042           	sub.w d2,d0
    11aa:	3f40 004a      	move.w d0,74(sp)
    ZoomBlit_Increment4SrcA = 1;
    11ae:	2841           	movea.l d1,a4
    11b0:	6000 fccc      	bra.w e7e <Zoom_ZoomIntoPicture+0xf6>

000011b4 <Init_Blit>:
  hw->bltafwm = 0xffff;
    11b4:	2079 0001 76be 	movea.l 176be <hw>,a0
    11ba:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    11c0:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    11c6:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    11cc:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    11d2:	317c 002c 0066 	move.w #44,102(a0)
}
    11d8:	4e75           	rts

000011da <ClbuildZoom>:
ULONG * ClbuildZoom() {
    11da:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    11de:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    11e4:	203c 0000 a48c 	move.l #42124,d0
    11ea:	7202           	moveq #2,d1
    11ec:	4eae ff3a      	jsr -198(a6)
    11f0:	2440           	movea.l d0,a2
  if( retval == 0) {
    11f2:	4a80           	tst.l d0
    11f4:	6700 0152      	beq.w 1348 <ClbuildZoom+0x16e>
    *cl++ = *clpartinstruction++;
    11f8:	24b9 0001 730c 	move.l 1730c <ClsSprites>,(a2)
    11fe:	2579 0001 7310 	move.l 17310 <ClsSprites+0x4>,4(a2)
    1204:	0004 
    1206:	2579 0001 7314 	move.l 17314 <ClsSprites+0x8>,8(a2)
    120c:	0008 
    120e:	2579 0001 7318 	move.l 17318 <ClsSprites+0xc>,12(a2)
    1214:	000c 
    1216:	2579 0001 731c 	move.l 1731c <ClsSprites+0x10>,16(a2)
    121c:	0010 
    121e:	2579 0001 7320 	move.l 17320 <ClsSprites+0x14>,20(a2)
    1224:	0014 
    1226:	2579 0001 7324 	move.l 17324 <ClsSprites+0x18>,24(a2)
    122c:	0018 
    122e:	2579 0001 7328 	move.l 17328 <ClsSprites+0x1c>,28(a2)
    1234:	001c 
    1236:	2579 0001 732c 	move.l 1732c <ClsSprites+0x20>,32(a2)
    123c:	0020 
    123e:	2579 0001 7330 	move.l 17330 <ClsSprites+0x24>,36(a2)
    1244:	0024 
    1246:	2579 0001 7334 	move.l 17334 <ClsSprites+0x28>,40(a2)
    124c:	0028 
    124e:	2579 0001 7338 	move.l 17338 <ClsSprites+0x2c>,44(a2)
    1254:	002c 
    1256:	2579 0001 733c 	move.l 1733c <ClsSprites+0x30>,48(a2)
    125c:	0030 
    125e:	2579 0001 7340 	move.l 17340 <ClsSprites+0x34>,52(a2)
    1264:	0034 
    1266:	2579 0001 7344 	move.l 17344 <ClsSprites+0x38>,56(a2)
    126c:	0038 
    126e:	2579 0001 7348 	move.l 17348 <ClsSprites+0x3c>,60(a2)
    1274:	003c 
    *cl++ = *clpartinstruction++;
    1276:	2579 0001 72dc 	move.l 172dc <ClScreen>,64(a2)
    127c:	0040 
    127e:	2579 0001 72e0 	move.l 172e0 <ClScreen+0x4>,68(a2)
    1284:	0044 
    1286:	2579 0001 72e4 	move.l 172e4 <ClScreen+0x8>,72(a2)
    128c:	0048 
    128e:	2579 0001 72e8 	move.l 172e8 <ClScreen+0xc>,76(a2)
    1294:	004c 
    1296:	2579 0001 72ec 	move.l 172ec <ClScreen+0x10>,80(a2)
    129c:	0050 
    129e:	2579 0001 72f0 	move.l 172f0 <ClScreen+0x14>,84(a2)
    12a4:	0054 
    12a6:	2579 0001 72f4 	move.l 172f4 <ClScreen+0x18>,88(a2)
    12ac:	0058 
    12ae:	2579 0001 72f8 	move.l 172f8 <ClScreen+0x1c>,92(a2)
    12b4:	005c 
    12b6:	2579 0001 72fc 	move.l 172fc <ClScreen+0x20>,96(a2)
    12bc:	0060 
    12be:	2579 0001 7300 	move.l 17300 <ClScreen+0x24>,100(a2)
    12c4:	0064 
    12c6:	2579 0001 7304 	move.l 17304 <ClScreen+0x28>,104(a2)
    12cc:	0068 
    12ce:	2579 0001 7308 	move.l 17308 <ClScreen+0x2c>,108(a2)
    12d4:	006c 
  *cl++ = 0x00e00000;
    12d6:	257c 00e0 0000 	move.l #14680064,112(a2)
    12dc:	0070 
  *cl++ = 0x00e20000;
    12de:	257c 00e2 0000 	move.l #14811136,116(a2)
    12e4:	0074 
  *cl++ = 0x00e40000;
    12e6:	257c 00e4 0000 	move.l #14942208,120(a2)
    12ec:	0078 
  *cl++ = 0x00e60000;
    12ee:	257c 00e6 0000 	move.l #15073280,124(a2)
    12f4:	007c 
  *cl++ = 0x00e80000;
    12f6:	257c 00e8 0000 	move.l #15204352,128(a2)
    12fc:	0080 
  *cl++ = 0x00ea0000;
    12fe:	257c 00ea 0000 	move.l #15335424,132(a2)
    1304:	0084 
  *cl++ = 0x00ec0000;
    1306:	257c 00ec 0000 	move.l #15466496,136(a2)
    130c:	0088 
  *cl++ = 0x00ee0000;
    130e:	257c 00ee 0000 	move.l #15597568,140(a2)
    1314:	008c 
  *cl++ = 0x00f00000;
    1316:	257c 00f0 0000 	move.l #15728640,144(a2)
    131c:	0090 
  *cl++ = 0x00f20000;
    131e:	257c 00f2 0000 	move.l #15859712,148(a2)
    1324:	0094 
  for(int i=0; i<32;i++)
    1326:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
    132a:	41f9 0001 725c 	lea 1725c <ClColor>,a0
    *cl++ = *clpartinstruction++;
    1330:	22d8           	move.l (a0)+,(a1)+
  for(int i=0; i<32;i++)
    1332:	b1fc 0001 72dc 	cmpa.l #94940,a0
    1338:	66f6           	bne.s 1330 <ClbuildZoom+0x156>
   *cl = 0xfffffffe;
    133a:	70fe           	moveq #-2,d0
    133c:	2540 0118      	move.l d0,280(a2)
}
    1340:	200a           	move.l a2,d0
    1342:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1346:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1348:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    134e:	4eae ffc4      	jsr -60(a6)
    1352:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1358:	2200           	move.l d0,d1
    135a:	243c 0001 4ad3 	move.l #84691,d2
    1360:	7628           	moveq #40,d3
    1362:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1366:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    136c:	7201           	moveq #1,d1
    136e:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1372:	24b9 0001 730c 	move.l 1730c <ClsSprites>,(a2)
    1378:	2579 0001 7310 	move.l 17310 <ClsSprites+0x4>,4(a2)
    137e:	0004 
    1380:	2579 0001 7314 	move.l 17314 <ClsSprites+0x8>,8(a2)
    1386:	0008 
    1388:	2579 0001 7318 	move.l 17318 <ClsSprites+0xc>,12(a2)
    138e:	000c 
    1390:	2579 0001 731c 	move.l 1731c <ClsSprites+0x10>,16(a2)
    1396:	0010 
    1398:	2579 0001 7320 	move.l 17320 <ClsSprites+0x14>,20(a2)
    139e:	0014 
    13a0:	2579 0001 7324 	move.l 17324 <ClsSprites+0x18>,24(a2)
    13a6:	0018 
    13a8:	2579 0001 7328 	move.l 17328 <ClsSprites+0x1c>,28(a2)
    13ae:	001c 
    13b0:	2579 0001 732c 	move.l 1732c <ClsSprites+0x20>,32(a2)
    13b6:	0020 
    13b8:	2579 0001 7330 	move.l 17330 <ClsSprites+0x24>,36(a2)
    13be:	0024 
    13c0:	2579 0001 7334 	move.l 17334 <ClsSprites+0x28>,40(a2)
    13c6:	0028 
    13c8:	2579 0001 7338 	move.l 17338 <ClsSprites+0x2c>,44(a2)
    13ce:	002c 
    13d0:	2579 0001 733c 	move.l 1733c <ClsSprites+0x30>,48(a2)
    13d6:	0030 
    13d8:	2579 0001 7340 	move.l 17340 <ClsSprites+0x34>,52(a2)
    13de:	0034 
    13e0:	2579 0001 7344 	move.l 17344 <ClsSprites+0x38>,56(a2)
    13e6:	0038 
    13e8:	2579 0001 7348 	move.l 17348 <ClsSprites+0x3c>,60(a2)
    13ee:	003c 
    *cl++ = *clpartinstruction++;
    13f0:	2579 0001 72dc 	move.l 172dc <ClScreen>,64(a2)
    13f6:	0040 
    13f8:	2579 0001 72e0 	move.l 172e0 <ClScreen+0x4>,68(a2)
    13fe:	0044 
    1400:	2579 0001 72e4 	move.l 172e4 <ClScreen+0x8>,72(a2)
    1406:	0048 
    1408:	2579 0001 72e8 	move.l 172e8 <ClScreen+0xc>,76(a2)
    140e:	004c 
    1410:	2579 0001 72ec 	move.l 172ec <ClScreen+0x10>,80(a2)
    1416:	0050 
    1418:	2579 0001 72f0 	move.l 172f0 <ClScreen+0x14>,84(a2)
    141e:	0054 
    1420:	2579 0001 72f4 	move.l 172f4 <ClScreen+0x18>,88(a2)
    1426:	0058 
    1428:	2579 0001 72f8 	move.l 172f8 <ClScreen+0x1c>,92(a2)
    142e:	005c 
    1430:	2579 0001 72fc 	move.l 172fc <ClScreen+0x20>,96(a2)
    1436:	0060 
    1438:	2579 0001 7300 	move.l 17300 <ClScreen+0x24>,100(a2)
    143e:	0064 
    1440:	2579 0001 7304 	move.l 17304 <ClScreen+0x28>,104(a2)
    1446:	0068 
    1448:	2579 0001 7308 	move.l 17308 <ClScreen+0x2c>,108(a2)
    144e:	006c 
  *cl++ = 0x00e00000;
    1450:	257c 00e0 0000 	move.l #14680064,112(a2)
    1456:	0070 
  *cl++ = 0x00e20000;
    1458:	257c 00e2 0000 	move.l #14811136,116(a2)
    145e:	0074 
  *cl++ = 0x00e40000;
    1460:	257c 00e4 0000 	move.l #14942208,120(a2)
    1466:	0078 
  *cl++ = 0x00e60000;
    1468:	257c 00e6 0000 	move.l #15073280,124(a2)
    146e:	007c 
  *cl++ = 0x00e80000;
    1470:	257c 00e8 0000 	move.l #15204352,128(a2)
    1476:	0080 
  *cl++ = 0x00ea0000;
    1478:	257c 00ea 0000 	move.l #15335424,132(a2)
    147e:	0084 
  *cl++ = 0x00ec0000;
    1480:	257c 00ec 0000 	move.l #15466496,136(a2)
    1486:	0088 
  *cl++ = 0x00ee0000;
    1488:	257c 00ee 0000 	move.l #15597568,140(a2)
    148e:	008c 
  *cl++ = 0x00f00000;
    1490:	257c 00f0 0000 	move.l #15728640,144(a2)
    1496:	0090 
  *cl++ = 0x00f20000;
    1498:	257c 00f2 0000 	move.l #15859712,148(a2)
    149e:	0094 
  for(int i=0; i<32;i++)
    14a0:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
    14a4:	41f9 0001 725c 	lea 1725c <ClColor>,a0
    14aa:	6000 fe84      	bra.w 1330 <ClbuildZoom+0x156>

000014ae <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    14ae:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    14b2:	45fa fd26      	lea 11da <ClbuildZoom>(pc),a2
    14b6:	4e92           	jsr (a2)
    14b8:	23c0 0001 76b0 	move.l d0,176b0 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    14be:	4e92           	jsr (a2)
    14c0:	23c0 0001 76a2 	move.l d0,176a2 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    14c6:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    14cc:	203c 0001 6800 	move.l #92160,d0
    14d2:	7202           	moveq #2,d1
    14d4:	4eae ff3a      	jsr -198(a6)
    14d8:	23c0 0001 769e 	move.l d0,1769e <Bitplane1>
  if(Bitplane1 == 0) {
    14de:	6700 008c      	beq.w 156c <PrepareDisplayZoom+0xbe>
  DrawBuffer = Bitplane1;
    14e2:	23c0 0001 76b6 	move.l d0,176b6 <DrawBuffer>
  DrawCopper = Copperlist1;
    14e8:	23f9 0001 76b0 	move.l 176b0 <Copperlist1>,176a8 <DrawCopper>
    14ee:	0001 76a8 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    14f2:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    14f8:	203c 0001 6800 	move.l #92160,d0
    14fe:	7202           	moveq #2,d1
    1500:	4eae ff3a      	jsr -198(a6)
    1504:	23c0 0001 769a 	move.l d0,1769a <Bitplane2>
  if(Bitplane2 == 0) {
    150a:	6718           	beq.s 1524 <PrepareDisplayZoom+0x76>
  ViewBuffer = Bitplane2;
    150c:	23c0 0001 76ac 	move.l d0,176ac <ViewBuffer>
  ViewCopper = Copperlist2;
    1512:	23f9 0001 76a2 	move.l 176a2 <Copperlist2>,17696 <ViewCopper>
    1518:	0001 7696 
}
    151c:	7000           	moveq #0,d0
    151e:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1522:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    1524:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    152a:	4eae ffc4      	jsr -60(a6)
    152e:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1534:	2200           	move.l d0,d1
    1536:	243c 0001 4b20 	move.l #84768,d2
    153c:	7626           	moveq #38,d3
    153e:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1542:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1548:	7201           	moveq #1,d1
    154a:	4eae ff70      	jsr -144(a6)
    154e:	2039 0001 769a 	move.l 1769a <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    1554:	23c0 0001 76ac 	move.l d0,176ac <ViewBuffer>
  ViewCopper = Copperlist2;
    155a:	23f9 0001 76a2 	move.l 176a2 <Copperlist2>,17696 <ViewCopper>
    1560:	0001 7696 
}
    1564:	7000           	moveq #0,d0
    1566:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    156a:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    156c:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1572:	4eae ffc4      	jsr -60(a6)
    1576:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    157c:	2200           	move.l d0,d1
    157e:	243c 0001 4af9 	move.l #84729,d2
    1584:	7626           	moveq #38,d3
    1586:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    158a:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1590:	7201           	moveq #1,d1
    1592:	4eae ff70      	jsr -144(a6)
    1596:	2039 0001 769e 	move.l 1769e <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    159c:	23c0 0001 76b6 	move.l d0,176b6 <DrawBuffer>
  DrawCopper = Copperlist1;
    15a2:	23f9 0001 76b0 	move.l 176b0 <Copperlist1>,176a8 <DrawCopper>
    15a8:	0001 76a8 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    15ac:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    15b2:	203c 0001 6800 	move.l #92160,d0
    15b8:	7202           	moveq #2,d1
    15ba:	4eae ff3a      	jsr -198(a6)
    15be:	23c0 0001 769a 	move.l d0,1769a <Bitplane2>
  if(Bitplane2 == 0) {
    15c4:	6600 ff46      	bne.w 150c <PrepareDisplayZoom+0x5e>
    15c8:	6000 ff5a      	bra.w 1524 <PrepareDisplayZoom+0x76>

000015cc <Zoom_Init>:
void Zoom_Init() {
    15cc:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    15ce:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    15d4:	7004           	moveq #4,d0
    15d6:	7202           	moveq #2,d1
    15d8:	4eae ff3a      	jsr -198(a6)
  ZoomHorizontal = 16;
    15dc:	33fc 0010 0001 	move.w #16,176a6 <ZoomHorizontal>
    15e2:	76a6 
}
    15e4:	2c5f           	movea.l (sp)+,a6
    15e6:	4e75           	rts

000015e8 <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    15e8:	2039 0001 76a8 	move.l 176a8 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    15ee:	23f9 0001 7696 	move.l 17696 <ViewCopper>,176a8 <DrawCopper>
    15f4:	0001 76a8 
  ViewCopper = (ULONG *)tmp;
    15f8:	23c0 0001 7696 	move.l d0,17696 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    15fe:	2079 0001 76be 	movea.l 176be <hw>,a0
    1604:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    1608:	3140 0088      	move.w d0,136(a0)
}
    160c:	4e75           	rts

0000160e <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    160e:	2039 0001 76b6 	move.l 176b6 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    1614:	2079 0001 76a8 	movea.l 176a8 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    161a:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    161e:	2200           	move.l d0,d1
    1620:	4241           	clr.w d1
    1622:	4841           	swap d1
    1624:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    1628:	23f9 0001 76ac 	move.l 176ac <ViewBuffer>,176b6 <DrawBuffer>
    162e:	0001 76b6 
  ViewBuffer = (ULONG *) tmp;
    1632:	23c0 0001 76ac 	move.l d0,176ac <ViewBuffer>
}
    1638:	4e75           	rts

0000163a <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    163a:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    163e:	262f 0010      	move.l 16(sp),d3
    1642:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    1646:	2279 0001 76b0 	movea.l 176b0 <Copperlist1>,a1
    164c:	b2fc 0000      	cmpa.w #0,a1
    1650:	670c           	beq.s 165e <FreeDisplay+0x24>
    1652:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    1658:	2003           	move.l d3,d0
    165a:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    165e:	2279 0001 76a2 	movea.l 176a2 <Copperlist2>,a1
    1664:	b2fc 0000      	cmpa.w #0,a1
    1668:	670c           	beq.s 1676 <FreeDisplay+0x3c>
    166a:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    1670:	2003           	move.l d3,d0
    1672:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    1676:	2279 0001 769e 	movea.l 1769e <Bitplane1>,a1
    167c:	b2fc 0000      	cmpa.w #0,a1
    1680:	670c           	beq.s 168e <FreeDisplay+0x54>
    1682:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    1688:	2002           	move.l d2,d0
    168a:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    168e:	2279 0001 769a 	movea.l 1769a <Bitplane2>,a1
    1694:	b2fc 0000      	cmpa.w #0,a1
    1698:	670c           	beq.s 16a6 <FreeDisplay+0x6c>
    169a:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    16a0:	2002           	move.l d2,d0
    16a2:	4eae ff2e      	jsr -210(a6)
}
    16a6:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    16aa:	4e75           	rts

000016ac <WaitVbl>:
void WaitVbl() {
    16ac:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    16ae:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddaa57>,d0
    16b4:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    16b6:	2017           	move.l (sp),d0
    16b8:	0280 0001 ff00 	andi.l #130816,d0
    16be:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    16c0:	2017           	move.l (sp),d0
    16c2:	0c80 0001 3700 	cmpi.l #79616,d0
    16c8:	67e4           	beq.s 16ae <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    16ca:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddaa57>,d0
    16d0:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    16d4:	202f 0004      	move.l 4(sp),d0
    16d8:	0280 0001 ff00 	andi.l #130816,d0
    16de:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    16e2:	202f 0004      	move.l 4(sp),d0
    16e6:	0c80 0001 3700 	cmpi.l #79616,d0
    16ec:	66dc           	bne.s 16ca <WaitVbl+0x1e>
}
    16ee:	508f           	addq.l #8,sp
    16f0:	4e75           	rts

000016f2 <ZoomTest>:
void ZoomTest() {
    16f2:	4fef ff50      	lea -176(sp),sp
    16f6:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
  hw->dmacon = 0b1000010000000000; //Blitter nasty
    16fa:	2079 0001 76be 	movea.l 176be <hw>,a0
    1700:	317c 8400 0096 	move.w #-31744,150(a0)
  Counter4Frames = 0;
    1706:	42b9 0001 76c6 	clr.l 176c6 <Counter4Frames>
  if ((vbint = AllocMem(sizeof(struct Interrupt),    
    170c:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    1712:	7016           	moveq #22,d0
    1714:	223c 0001 0001 	move.l #65537,d1
    171a:	4eae ff3a      	jsr -198(a6)
    171e:	2440           	movea.l d0,a2
    1720:	4a80           	tst.l d0
    1722:	671a           	beq.s 173e <ZoomTest+0x4c>
    vbint->is_Node.ln_Type = NT_INTERRUPT;       
    1724:	357c 02c4 0008 	move.w #708,8(a2)
    vbint->is_Node.ln_Name = "VertB-Example";
    172a:	257c 0001 4b47 	move.l #84807,10(a2)
    1730:	000a 
    vbint->is_Data = NULL;
    1732:	42aa 000e      	clr.l 14(a2)
    vbint->is_Code = Vblankcounter;
    1736:	257c 0000 0ac4 	move.l #2756,18(a2)
    173c:	0012 
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    173e:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    1744:	203c 0001 1440 	move.l #70720,d0
    174a:	7202           	moveq #2,d1
    174c:	4eae ff3a      	jsr -198(a6)
    1750:	2800           	move.l d0,d4
  if( source == 0) {
    1752:	6700 290a      	beq.w 405e <ZoomTest+0x296c>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    1756:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    175c:	203c 0001 1440 	move.l #70720,d0
    1762:	7202           	moveq #2,d1
    1764:	4eae ff3a      	jsr -198(a6)
    1768:	2a00           	move.l d0,d5
  if( destination == 0) {
    176a:	6700 293c      	beq.w 40a8 <ZoomTest+0x29b6>
    176e:	2004           	move.l d4,d0
    1770:	0680 0000 3300 	addi.l #13056,d0
    1776:	2044           	movea.l d4,a0
      *tmp4source++ = 0x55555555;
    1778:	20bc 5555 5555 	move.l #1431655765,(a0)
    177e:	217c 5555 5555 	move.l #1431655765,4(a0)
    1784:	0004 
    1786:	217c 5555 5555 	move.l #1431655765,8(a0)
    178c:	0008 
    178e:	217c 5555 5555 	move.l #1431655765,12(a0)
    1794:	000c 
    1796:	217c 5555 5555 	move.l #1431655765,16(a0)
    179c:	0010 
    179e:	217c 5555 5555 	move.l #1431655765,20(a0)
    17a4:	0014 
    17a6:	217c 5555 5555 	move.l #1431655765,24(a0)
    17ac:	0018 
    17ae:	217c 5555 5555 	move.l #1431655765,28(a0)
    17b4:	001c 
    17b6:	217c 5555 5555 	move.l #1431655765,32(a0)
    17bc:	0020 
    17be:	217c 5555 5555 	move.l #1431655765,36(a0)
    17c4:	0024 
    17c6:	217c 5555 5555 	move.l #1431655765,40(a0)
    17cc:	0028 
    17ce:	217c 5555 5555 	move.l #1431655765,44(a0)
    17d4:	002c 
      *tmp4source++ = 0xaaaaaaaa;
    17d6:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
    17dc:	0030 
    17de:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
    17e4:	0034 
    17e6:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
    17ec:	0038 
    17ee:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
    17f4:	003c 
    17f6:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
    17fc:	0040 
    17fe:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
    1804:	0044 
    1806:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
    180c:	0048 
    180e:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
    1814:	004c 
    1816:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
    181c:	0050 
    181e:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
    1824:	0054 
    1826:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
    182c:	0058 
    182e:	41e8 0060      	lea 96(a0),a0
    1832:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
    1838:	fffc 
  for(int i=0;i<128+8;i++) {
    183a:	b1c0           	cmpa.l d0,a0
    183c:	6600 ff3a      	bne.w 1778 <ZoomTest+0x86>
  WaitVbl();
    1840:	4eba fe6a      	jsr 16ac <WaitVbl>(pc)
  Init_Blit();
    1844:	4eba f96e      	jsr 11b4 <Init_Blit>(pc)
    ZoomBlit_Increment4SrcA = 1;
    1848:	33fc 0001 0001 	move.w #1,176b4 <ZoomBlit_Increment4SrcA>
    184e:	76b4 
  WaitBlit(); 
    1850:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    1856:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    185a:	2079 0001 76be 	movea.l 176be <hw>,a0
    1860:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1866:	317c fde4 0040 	move.w #-540,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    186c:	317c fff8 0070 	move.w #-8,112(a0)
  AddIntServer(INTB_VERTB, vbint);
    1872:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    1878:	7005           	moveq #5,d0
    187a:	224a           	movea.l a2,a1
    187c:	4eae ff58      	jsr -168(a6)
  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    1880:	4878 0005      	pea 5 <_start+0x5>
    1884:	42a7           	clr.l -(sp)
    1886:	2f05           	move.l d5,-(sp)
    1888:	2f04           	move.l d4,-(sp)
    188a:	4eba f4fc      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  RemIntServer(INTB_VERTB, vbint);
    188e:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    1894:	7005           	moveq #5,d0
    1896:	224a           	movea.l a2,a1
    1898:	4eae ff52      	jsr -174(a6)
  if( Counter4Frames > 7)
    189c:	4fef 0010      	lea 16(sp),sp
    18a0:	7007           	moveq #7,d0
    18a2:	b0b9 0001 76c6 	cmp.l 176c6 <Counter4Frames>,d0
    18a8:	6c1e           	bge.s 18c8 <ZoomTest+0x1d6>
    Write( Output(), "TestSpeed4Zoom: Takes too long\n", 31);
    18aa:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    18b0:	4eae ffc4      	jsr -60(a6)
    18b4:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    18ba:	2200           	move.l d0,d1
    18bc:	243c 0001 4bc8 	move.l #84936,d2
    18c2:	761f           	moveq #31,d3
    18c4:	4eae ffd0      	jsr -48(a6)
  FreeMem( source, ( ZMLINESIZE+4)*272*5);
    18c8:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    18ce:	2244           	movea.l d4,a1
    18d0:	203c 0001 1440 	move.l #70720,d0
    18d6:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, ( ZMLINESIZE+4)*272*5);
    18da:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    18e0:	2245           	movea.l d5,a1
    18e2:	203c 0001 1440 	move.l #70720,d0
    18e8:	4eae ff2e      	jsr -210(a6)
  PrepareDisplayZoom();
    18ec:	4bfa fbc0      	lea 14ae <PrepareDisplayZoom>(pc),a5
    18f0:	4e95           	jsr (a5)
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    18f2:	4878 0010      	pea 10 <main+0xa>
    18f6:	4879 0001 730c 	pea 1730c <ClsSprites>
    18fc:	42a7           	clr.l -(sp)
    18fe:	2f39 0001 76b0 	move.l 176b0 <Copperlist1>,-(sp)
    1904:	47fa f1e4      	lea aea <TestCopperlistBatch>(pc),a3
    1908:	4e93           	jsr (a3)
    190a:	4fef 0010      	lea 16(sp),sp
    190e:	4a80           	tst.l d0
    1910:	661e           	bne.s 1930 <ZoomTest+0x23e>
    Write( Output(), 
    1912:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1918:	4eae ffc4      	jsr -60(a6)
    191c:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1922:	2200           	move.l d0,d1
    1924:	243c 0001 4be8 	move.l #84968,d2
    192a:	7645           	moveq #69,d3
    192c:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    1930:	4878 000c      	pea c <main+0x6>
    1934:	4879 0001 72dc 	pea 172dc <ClScreen>
    193a:	4878 0010      	pea 10 <main+0xa>
    193e:	2f39 0001 76b0 	move.l 176b0 <Copperlist1>,-(sp)
    1944:	4e93           	jsr (a3)
    1946:	4fef 0010      	lea 16(sp),sp
    194a:	4a80           	tst.l d0
    194c:	661e           	bne.s 196c <ZoomTest+0x27a>
    Write( Output(), 
    194e:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1954:	4eae ffc4      	jsr -60(a6)
    1958:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    195e:	2200           	move.l d0,d1
    1960:	243c 0001 4c2e 	move.l #85038,d2
    1966:	7646           	moveq #70,d3
    1968:	4eae ffd0      	jsr -48(a6)

void Zoom_SetBplPointers() {
  ULONG plane2set = DrawBuffer;
  UWORD *posofcopper = (UWORD *)DrawCopper + ZMCOPBPL1HIGH;
    196c:	2079 0001 76a8 	movea.l 176a8 <DrawCopper>,a0
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    UWORD highword = (ULONG)plane2set >> 16;
    UWORD lowword = (ULONG)plane2set & 0xffff;
    *posofcopper = highword;
    1972:	317c 0004 0072 	move.w #4,114(a0)
    posofcopper += 2;
    *posofcopper = lowword;
    1978:	4268 0076      	clr.w 118(a0)
    *posofcopper = highword;
    197c:	317c 0004 007a 	move.w #4,122(a0)
    *posofcopper = lowword;
    1982:	317c 0030 007e 	move.w #48,126(a0)
    *posofcopper = highword;
    1988:	317c 0004 0082 	move.w #4,130(a0)
    *posofcopper = lowword;
    198e:	317c 0060 0086 	move.w #96,134(a0)
    *posofcopper = highword;
    1994:	317c 0004 008a 	move.w #4,138(a0)
    *posofcopper = lowword;
    199a:	317c 0090 008e 	move.w #144,142(a0)
    *posofcopper = highword;
    19a0:	317c 0004 0092 	move.w #4,146(a0)
    *posofcopper = lowword;
    19a6:	317c 00c0 0096 	move.w #192,150(a0)
    posofcopper += 2;
    plane2set += ZMLINESIZE; //Next plane (interleaved)
  }
  
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
    19ac:	23fc 0005 0000 	move.l #327680,176b6 <DrawBuffer>
    19b2:	0001 76b6 
  ViewBuffer = (ULONG *) tmp;
    19b6:	23fc 0004 0000 	move.l #262144,176ac <ViewBuffer>
    19bc:	0001 76ac 
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    19c0:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    19c6:	4878 001c      	pea 1c <main+0x16>
    19ca:	2f39 0001 76b0 	move.l 176b0 <Copperlist1>,-(sp)
    19d0:	45fa f0fa      	lea acc <TestCopperlistPos>(pc),a2
    19d4:	4e92           	jsr (a2)
    19d6:	4fef 000c      	lea 12(sp),sp
    19da:	4a80           	tst.l d0
    19dc:	661e           	bne.s 19fc <ZoomTest+0x30a>
    Write(Output(), 
    19de:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    19e4:	4eae ffc4      	jsr -60(a6)
    19e8:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    19ee:	2200           	move.l d0,d1
    19f0:	243c 0001 4c75 	move.l #85109,d2
    19f6:	763c           	moveq #60,d3
    19f8:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    19fc:	2f3c 00e2 0000 	move.l #14811136,-(sp)
    1a02:	4878 001d      	pea 1d <main+0x17>
    1a06:	2f39 0001 76b0 	move.l 176b0 <Copperlist1>,-(sp)
    1a0c:	4e92           	jsr (a2)
    1a0e:	4fef 000c      	lea 12(sp),sp
    1a12:	4a80           	tst.l d0
    1a14:	661e           	bne.s 1a34 <ZoomTest+0x342>
    Write(Output(), 
    1a16:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1a1c:	4eae ffc4      	jsr -60(a6)
    1a20:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1a26:	2200           	move.l d0,d1
    1a28:	243c 0001 4cb2 	move.l #85170,d2
    1a2e:	763c           	moveq #60,d3
    1a30:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    1a34:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    1a3a:	4878 001e      	pea 1e <main+0x18>
    1a3e:	2f39 0001 76b0 	move.l 176b0 <Copperlist1>,-(sp)
    1a44:	4e92           	jsr (a2)
    1a46:	4fef 000c      	lea 12(sp),sp
    1a4a:	4a80           	tst.l d0
    1a4c:	661e           	bne.s 1a6c <ZoomTest+0x37a>
    Write(Output(), 
    1a4e:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1a54:	4eae ffc4      	jsr -60(a6)
    1a58:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1a5e:	2200           	move.l d0,d1
    1a60:	243c 0001 4cef 	move.l #85231,d2
    1a66:	763c           	moveq #60,d3
    1a68:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e60030) == 0)
    1a6c:	2f3c 00e6 0030 	move.l #15073328,-(sp)
    1a72:	4878 001f      	pea 1f <main+0x19>
    1a76:	2f39 0001 76b0 	move.l 176b0 <Copperlist1>,-(sp)
    1a7c:	4e92           	jsr (a2)
    1a7e:	4fef 000c      	lea 12(sp),sp
    1a82:	4a80           	tst.l d0
    1a84:	661e           	bne.s 1aa4 <ZoomTest+0x3b2>
    Write(Output(), 
    1a86:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1a8c:	4eae ffc4      	jsr -60(a6)
    1a90:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1a96:	2200           	move.l d0,d1
    1a98:	243c 0001 4d2c 	move.l #85292,d2
    1a9e:	763c           	moveq #60,d3
    1aa0:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistBatch(  Copperlist1, 38, ClColor, 32) == 0)
    1aa4:	4878 0020      	pea 20 <main+0x1a>
    1aa8:	4879 0001 725c 	pea 1725c <ClColor>
    1aae:	4878 0026      	pea 26 <main+0x20>
    1ab2:	2f39 0001 76b0 	move.l 176b0 <Copperlist1>,-(sp)
    1ab8:	4e93           	jsr (a3)
    1aba:	4fef 0010      	lea 16(sp),sp
    1abe:	4a80           	tst.l d0
    1ac0:	661e           	bne.s 1ae0 <ZoomTest+0x3ee>
    Write(Output(), "ZoomCopperlist: Colorpart messed up.\n", 37);
    1ac2:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1ac8:	4eae ffc4      	jsr -60(a6)
    1acc:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1ad2:	2200           	move.l d0,d1
    1ad4:	243c 0001 4d69 	move.l #85353,d2
    1ada:	7625           	moveq #37,d3
    1adc:	4eae ffd0      	jsr -48(a6)
  if( TestCopperlistPos( Copperlist1, 70, 0xfffffffe) == 0)
    1ae0:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdba51>
    1ae4:	4878 0046      	pea 46 <main+0x40>
    1ae8:	2f39 0001 76b0 	move.l 176b0 <Copperlist1>,-(sp)
    1aee:	4e92           	jsr (a2)
    1af0:	4fef 000c      	lea 12(sp),sp
    1af4:	4a80           	tst.l d0
    1af6:	661e           	bne.s 1b16 <ZoomTest+0x424>
    Write( Output(), "ZoomCopperlist: Copperlist End not correctly set.\n", 50);
    1af8:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1afe:	4eae ffc4      	jsr -60(a6)
    1b02:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1b08:	2200           	move.l d0,d1
    1b0a:	243c 0001 4d8f 	move.l #85391,d2
    1b10:	7632           	moveq #50,d3
    1b12:	4eae ffd0      	jsr -48(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    1b16:	2f3c 0001 6800 	move.l #92160,-(sp)
    1b1c:	2f3c 0000 a48c 	move.l #42124,-(sp)
    1b22:	47fa fb16      	lea 163a <FreeDisplay>(pc),a3
    1b26:	4e93           	jsr (a3)
  Zoom_Init();
    1b28:	49fa faa2      	lea 15cc <Zoom_Init>(pc),a4
    1b2c:	4e94           	jsr (a4)
  PrepareDisplayZoom();
    1b2e:	4e95           	jsr (a5)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    1b30:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    1b36:	203c 0000 c800 	move.l #51200,d0
    1b3c:	7202           	moveq #2,d1
    1b3e:	4eae ff3a      	jsr -198(a6)
    1b42:	2040           	movea.l d0,a0
    1b44:	23c0 0001 76ba 	move.l d0,176ba <Zoom_Source>
  if( Zoom_Source == 0) {
    1b4a:	508f           	addq.l #8,sp
    1b4c:	6700 24ee      	beq.w 403c <ZoomTest+0x294a>
  *tstsource++ = 0x0000;
    1b50:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    1b52:	317c 0080 0002 	move.w #128,2(a0)
  *tstsource = 0x1000;
    1b58:	317c 1000 0030 	move.w #4096,48(a0)
  *tstsource = 0x8e88;
    1b5e:	317c 8e88 0032 	move.w #-29048,50(a0)
  *tstsource++ = 0x0000;
    1b64:	4268 17d0      	clr.w 6096(a0)
  *tstsource = 0x00ff;
    1b68:	317c 00ff 17d2 	move.w #255,6098(a0)
  WaitBlit();
    1b6e:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    1b74:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    1b78:	4eba f63a      	jsr 11b4 <Init_Blit>(pc)
    ZoomBlit_Increment4SrcA = 1;
    1b7c:	33fc 0001 0001 	move.w #1,176b4 <ZoomBlit_Increment4SrcA>
    1b82:	76b4 
  WaitBlit(); 
    1b84:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    1b8a:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    1b8e:	2479 0001 76be 	movea.l 176be <hw>,a2
    1b94:	357c 0000 0042 	move.w #0,66(a2)
  hw->bltcon0 = 0xde4 + shifta;
    1b9a:	357c fde4 0040 	move.w #-540,64(a2)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1ba0:	357c ff00 0070 	move.w #-256,112(a2)
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    1ba6:	2639 0001 76b6 	move.l 176b6 <DrawBuffer>,d3
    1bac:	2439 0001 76ba 	move.l 176ba <Zoom_Source>,d2
  WaitBlt();
    1bb2:	4eba f1be      	jsr d72 <WaitBlt>(pc)
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    1bb6:	7000           	moveq #0,d0
    1bb8:	3039 0001 76b4 	move.w 176b4 <ZoomBlit_Increment4SrcA>,d0
    1bbe:	d080           	add.l d0,d0
    1bc0:	d082           	add.l d2,d0
    1bc2:	2540 0050      	move.l d0,80(a2)
  hw->bltbpt = source;
    1bc6:	2542 004c      	move.l d2,76(a2)
  hw->bltdpt = destination;
    1bca:	2543 0054      	move.l d3,84(a2)
  hw->bltsize = height*64+2;
    1bce:	357c 2002 0058 	move.w #8194,88(a2)
  WaitBlit();
    1bd4:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    1bda:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    1bde:	2479 0001 76b6 	movea.l 176b6 <DrawBuffer>,a2
  if( *destination != 0x0180) {
    1be4:	0c6a 0180 0002 	cmpi.w #384,2(a2)
    1bea:	671e           	beq.s 1c0a <ZoomTest+0x518>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    1bec:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1bf2:	4eae ffc4      	jsr -60(a6)
    1bf6:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1bfc:	2200           	move.l d0,d1
    1bfe:	243c 0001 4dfa 	move.l #85498,d2
    1c04:	761c           	moveq #28,d3
    1c06:	4eae ffd0      	jsr -48(a6)
  if( *destination != 0x1d88)
    1c0a:	0c6a 1d88 0032 	cmpi.w #7560,50(a2)
    1c10:	671e           	beq.s 1c30 <ZoomTest+0x53e>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    1c12:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1c18:	4eae ffc4      	jsr -60(a6)
    1c1c:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1c22:	2200           	move.l d0,d1
    1c24:	243c 0001 4e17 	move.l #85527,d2
    1c2a:	761c           	moveq #28,d3
    1c2c:	4eae ffd0      	jsr -48(a6)
  if( *destination != 0x01ff) {
    1c30:	2079 0001 76b6 	movea.l 176b6 <DrawBuffer>,a0
    1c36:	0c68 01ff 17d2 	cmpi.w #511,6098(a0)
    1c3c:	671e           	beq.s 1c5c <ZoomTest+0x56a>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    1c3e:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1c44:	4eae ffc4      	jsr -60(a6)
    1c48:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1c4e:	2200           	move.l d0,d1
    1c50:	243c 0001 4e34 	move.l #85556,d2
    1c56:	761a           	moveq #26,d3
    1c58:	4eae ffd0      	jsr -48(a6)
  FreeMem( Zoom_Source, 40*256*5);
    1c5c:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    1c62:	2279 0001 76ba 	movea.l 176ba <Zoom_Source>,a1
    1c68:	203c 0000 c800 	move.l #51200,d0
    1c6e:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    1c72:	2f3c 0001 6800 	move.l #92160,-(sp)
    1c78:	2f3c 0000 a48c 	move.l #42124,-(sp)
    1c7e:	4e93           	jsr (a3)
    1c80:	508f           	addq.l #8,sp
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    1c82:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    1c88:	203c 0000 05a0 	move.l #1440,d0
    1c8e:	7202           	moveq #2,d1
    1c90:	4eae ff3a      	jsr -198(a6)
    1c94:	2440           	movea.l d0,a2
  if( source == 0) {
    1c96:	4a80           	tst.l d0
    1c98:	6700 230c      	beq.w 3fa6 <ZoomTest+0x28b4>
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    1c9c:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    1ca2:	203c 0000 05a0 	move.l #1440,d0
    1ca8:	7202           	moveq #2,d1
    1caa:	4eae ff3a      	jsr -198(a6)
    1cae:	2640           	movea.l d0,a3
  if( destination == 0) {
    1cb0:	4a80           	tst.l d0
    1cb2:	6700 22f2      	beq.w 3fa6 <ZoomTest+0x28b4>
    *tmp++ = 0;
    1cb6:	4252           	clr.w (a2)
    *tmp++ = 0xaaaa;
    1cb8:	357c aaaa 0002 	move.w #-21846,2(a2)
    *tmp++ = 0xaaaa;
    1cbe:	357c aaaa 0004 	move.w #-21846,4(a2)
    *tmp = 0;
    1cc4:	426a 0006      	clr.w 6(a2)
    *tmp++ = 0;
    1cc8:	426a 0030      	clr.w 48(a2)
    *tmp++ = 0x5555;
    1ccc:	357c 5555 0032 	move.w #21845,50(a2)
    *tmp++ = 0x5555;
    1cd2:	357c 5555 0034 	move.w #21845,52(a2)
    *tmp = 0;
    1cd8:	426a 0036      	clr.w 54(a2)
    *tmp++ = 0;
    1cdc:	426a 0060      	clr.w 96(a2)
    *tmp++ = 0xaaaa;
    1ce0:	357c aaaa 0062 	move.w #-21846,98(a2)
    *tmp++ = 0xaaaa;
    1ce6:	357c aaaa 0064 	move.w #-21846,100(a2)
    *tmp = 0;
    1cec:	426a 0066      	clr.w 102(a2)
    *tmp++ = 0;
    1cf0:	426a 0090      	clr.w 144(a2)
    *tmp++ = 0x5555;
    1cf4:	357c 5555 0092 	move.w #21845,146(a2)
    *tmp++ = 0x5555;
    1cfa:	357c 5555 0094 	move.w #21845,148(a2)
    *tmp = 0;
    1d00:	426a 0096      	clr.w 150(a2)
    *tmp++ = 0;
    1d04:	426a 00c0      	clr.w 192(a2)
    *tmp++ = 0xaaaa;
    1d08:	357c aaaa 00c2 	move.w #-21846,194(a2)
    *tmp++ = 0xaaaa;
    1d0e:	357c aaaa 00c4 	move.w #-21846,196(a2)
    *tmp = 0;
    1d14:	426a 00c6      	clr.w 198(a2)
    *tmp++ = 0;
    1d18:	426a 00f0      	clr.w 240(a2)
    *tmp++ = 0x5555;
    1d1c:	357c 5555 00f2 	move.w #21845,242(a2)
    *tmp++ = 0x5555;
    1d22:	357c 5555 00f4 	move.w #21845,244(a2)
    *tmp = 0;
    1d28:	426a 00f6      	clr.w 246(a2)
    *tmp++ = 0;
    1d2c:	426a 0120      	clr.w 288(a2)
    *tmp++ = 0xaaaa;
    1d30:	357c aaaa 0122 	move.w #-21846,290(a2)
    *tmp++ = 0xaaaa;
    1d36:	357c aaaa 0124 	move.w #-21846,292(a2)
    *tmp = 0;
    1d3c:	426a 0126      	clr.w 294(a2)
    *tmp++ = 0;
    1d40:	426a 0150      	clr.w 336(a2)
    *tmp++ = 0x5555;
    1d44:	357c 5555 0152 	move.w #21845,338(a2)
    *tmp++ = 0x5555;
    1d4a:	357c 5555 0154 	move.w #21845,340(a2)
    *tmp = 0;
    1d50:	426a 0156      	clr.w 342(a2)
    *tmp++ = 0;
    1d54:	426a 0180      	clr.w 384(a2)
    *tmp++ = 0xaaaa;
    1d58:	357c aaaa 0182 	move.w #-21846,386(a2)
    *tmp++ = 0xaaaa;
    1d5e:	357c aaaa 0184 	move.w #-21846,388(a2)
    *tmp = 0;
    1d64:	426a 0186      	clr.w 390(a2)
    *tmp++ = 0;
    1d68:	426a 01b0      	clr.w 432(a2)
    *tmp++ = 0x5555;
    1d6c:	357c 5555 01b2 	move.w #21845,434(a2)
    *tmp++ = 0x5555;
    1d72:	357c 5555 01b4 	move.w #21845,436(a2)
    *tmp = 0;
    1d78:	426a 01b6      	clr.w 438(a2)
    *tmp++ = 0;
    1d7c:	426a 01e0      	clr.w 480(a2)
    *tmp++ = 0xaaaa;
    1d80:	357c aaaa 01e2 	move.w #-21846,482(a2)
    *tmp++ = 0xaaaa;
    1d86:	357c aaaa 01e4 	move.w #-21846,484(a2)
    *tmp = 0;
    1d8c:	426a 01e6      	clr.w 486(a2)
    *tmp++ = 0;
    1d90:	426a 0210      	clr.w 528(a2)
    *tmp++ = 0x5555;
    1d94:	357c 5555 0212 	move.w #21845,530(a2)
    *tmp++ = 0x5555;
    1d9a:	357c 5555 0214 	move.w #21845,532(a2)
    *tmp = 0;
    1da0:	426a 0216      	clr.w 534(a2)
    *tmp++ = 0;
    1da4:	426a 0240      	clr.w 576(a2)
    *tmp++ = 0xaaaa;
    1da8:	357c aaaa 0242 	move.w #-21846,578(a2)
    *tmp++ = 0xaaaa;
    1dae:	357c aaaa 0244 	move.w #-21846,580(a2)
    *tmp = 0;
    1db4:	426a 0246      	clr.w 582(a2)
    *tmp++ = 0;
    1db8:	426a 0270      	clr.w 624(a2)
    *tmp++ = 0x5555;
    1dbc:	357c 5555 0272 	move.w #21845,626(a2)
    *tmp++ = 0x5555;
    1dc2:	357c 5555 0274 	move.w #21845,628(a2)
    *tmp = 0;
    1dc8:	426a 0276      	clr.w 630(a2)
    *tmp++ = 0;
    1dcc:	426a 02a0      	clr.w 672(a2)
    *tmp++ = 0xaaaa;
    1dd0:	357c aaaa 02a2 	move.w #-21846,674(a2)
    *tmp++ = 0xaaaa;
    1dd6:	357c aaaa 02a4 	move.w #-21846,676(a2)
    *tmp = 0;
    1ddc:	426a 02a6      	clr.w 678(a2)
    *tmp++ = 0;
    1de0:	426a 02d0      	clr.w 720(a2)
    *tmp++ = 0x5555;
    1de4:	357c 5555 02d2 	move.w #21845,722(a2)
    *tmp++ = 0x5555;
    1dea:	357c 5555 02d4 	move.w #21845,724(a2)
    *tmp = 0;
    1df0:	426a 02d6      	clr.w 726(a2)
    tmp += ZMLINESIZE/2-3;
    1df4:	4878 05a0      	pea 5a0 <main+0x59a>
    1df8:	42a7           	clr.l -(sp)
    1dfa:	2f00           	move.l d0,-(sp)
    1dfc:	4eba 2380      	jsr 417e <memset>(pc)
  WaitBlit();
    1e00:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    1e06:	4eae ff1c      	jsr -228(a6)
  Zoom_Init();
    1e0a:	4e94           	jsr (a4)
  WaitBlit();
    1e0c:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    1e12:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
    1e16:	2879 0001 76be 	movea.l 176be <hw>,a4
    1e1c:	397c 39f0 0040 	move.w #14832,64(a4)
  hw->bltcon1 = 0;
    1e22:	397c 0000 0042 	move.w #0,66(a4)
  WaitBlt();
    1e28:	4eba ef48      	jsr d72 <WaitBlt>(pc)
  hw->bltapt = (UWORD *) source;
    1e2c:	200a           	move.l a2,d0
    1e2e:	5480           	addq.l #2,d0
    1e30:	2940 0050      	move.l d0,80(a4)
  hw->bltdpt = (UWORD *) destination;
    1e34:	294b 0054      	move.l a3,84(a4)
  hw->bltsize = height*64+2;
    1e38:	397c 0402 0058 	move.w #1026,88(a4)
  WaitBlit();
    1e3e:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    1e44:	4eae ff1c      	jsr -228(a6)
  if( *tmp != 0x5555) 
    1e48:	4fef 000c      	lea 12(sp),sp
    1e4c:	0c6b 5555 0002 	cmpi.w #21845,2(a3)
    1e52:	671e           	beq.s 1e72 <ZoomTest+0x780>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    1e54:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1e5a:	4eae ffc4      	jsr -60(a6)
    1e5e:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1e64:	2200           	move.l d0,d1
    1e66:	243c 0001 4e85 	move.l #85637,d2
    1e6c:	761f           	moveq #31,d3
    1e6e:	4eae ffd0      	jsr -48(a6)
  if( *tmp != 0xaaaa)
    1e72:	0c6b aaaa 0032 	cmpi.w #-21846,50(a3)
    1e78:	671e           	beq.s 1e98 <ZoomTest+0x7a6>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    1e7a:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1e80:	4eae ffc4      	jsr -60(a6)
    1e84:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    1e8a:	2200           	move.l d0,d1
    1e8c:	243c 0001 4ea5 	move.l #85669,d2
    1e92:	7620           	moveq #32,d3
    1e94:	4eae ffd0      	jsr -48(a6)
  FreeMem( source,ZMLINESIZE*30);
    1e98:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    1e9e:	224a           	movea.l a2,a1
    1ea0:	203c 0000 05a0 	move.l #1440,d0
    1ea6:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    1eaa:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    1eb0:	224b           	movea.l a3,a1
    1eb2:	203c 0000 05a0 	move.l #1440,d0
    1eb8:	4eae ff2e      	jsr -210(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    1ebc:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    1ec2:	203c 0000 3740 	move.l #14144,d0
    1ec8:	7202           	moveq #2,d1
    1eca:	4eae ff3a      	jsr -198(a6)
    1ece:	2600           	move.l d0,d3
  if( source == 0) {
    1ed0:	6700 210a      	beq.w 3fdc <ZoomTest+0x28ea>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    1ed4:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    1eda:	203c 0000 3740 	move.l #14144,d0
    1ee0:	7202           	moveq #2,d1
    1ee2:	4eae ff3a      	jsr -198(a6)
    1ee6:	2840           	movea.l d0,a4
  if( destination == 0) {
    1ee8:	4a80           	tst.l d0
    1eea:	6700 21de      	beq.w 40ca <ZoomTest+0x29d8>
    1eee:	2003           	move.l d3,d0
    1ef0:	0680 0000 3300 	addi.l #13056,d0
    1ef6:	2043           	movea.l d3,a0
      *tmp4source++ = 0x55555555;
    1ef8:	20bc 5555 5555 	move.l #1431655765,(a0)
    1efe:	217c 5555 5555 	move.l #1431655765,4(a0)
    1f04:	0004 
    1f06:	217c 5555 5555 	move.l #1431655765,8(a0)
    1f0c:	0008 
    1f0e:	217c 5555 5555 	move.l #1431655765,12(a0)
    1f14:	000c 
    1f16:	217c 5555 5555 	move.l #1431655765,16(a0)
    1f1c:	0010 
    1f1e:	217c 5555 5555 	move.l #1431655765,20(a0)
    1f24:	0014 
    1f26:	217c 5555 5555 	move.l #1431655765,24(a0)
    1f2c:	0018 
    1f2e:	217c 5555 5555 	move.l #1431655765,28(a0)
    1f34:	001c 
    1f36:	217c 5555 5555 	move.l #1431655765,32(a0)
    1f3c:	0020 
    1f3e:	217c 5555 5555 	move.l #1431655765,36(a0)
    1f44:	0024 
    1f46:	217c 5555 5555 	move.l #1431655765,40(a0)
    1f4c:	0028 
    1f4e:	217c 5555 5555 	move.l #1431655765,44(a0)
    1f54:	002c 
      *tmp4source++ = 0xaaaaaaaa;
    1f56:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
    1f5c:	0030 
    1f5e:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
    1f64:	0034 
    1f66:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
    1f6c:	0038 
    1f6e:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
    1f74:	003c 
    1f76:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
    1f7c:	0040 
    1f7e:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
    1f84:	0044 
    1f86:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
    1f8c:	0048 
    1f8e:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
    1f94:	004c 
    1f96:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
    1f9c:	0050 
    1f9e:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
    1fa4:	0054 
    1fa6:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
    1fac:	0058 
    1fae:	41e8 0060      	lea 96(a0),a0
    1fb2:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
    1fb8:	fffc 
  for(int i=0;i<128+8;i++) {
    1fba:	b1c0           	cmpa.l d0,a0
    1fbc:	6600 ff3a      	bne.w 1ef8 <ZoomTest+0x806>
  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    1fc0:	4878 0001      	pea 1 <_start+0x1>
    1fc4:	42a7           	clr.l -(sp)
    1fc6:	2f0c           	move.l a4,-(sp)
    1fc8:	2f03           	move.l d3,-(sp)
    1fca:	4eba edbc      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    1fce:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    1fd4:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    1fd8:	41ec 0004      	lea 4(a4),a0
    1fdc:	2f48 0044      	move.l a0,68(sp)
  for(int i=0;i<14;i++) {
    1fe0:	41ec 0364      	lea 868(a4),a0
    1fe4:	2f48 004c      	move.l a0,76(sp)
    1fe8:	2a08           	move.l a0,d5
    1fea:	4fef 0010      	lea 16(sp),sp
  UWORD *valactual = destination+2; 
    1fee:	367c 0012      	movea.w #18,a3
  UWORD mask = 0xffff;
    1ff2:	74ff           	moveq #-1,d2
    1ff4:	7800           	moveq #0,d4
    1ff6:	4644           	not.w d4
    1ff8:	4bfa e9b4      	lea 9ae <TestRow>(pc),a5
    1ffc:	2445           	movea.l d5,a2
    1ffe:	45ea fca0      	lea -864(a2),a2
    2002:	4deb ffee      	lea -18(a3),a6
      TestRow( valsupposed, valactual, mask, i2+i*19);
    2006:	2f0e           	move.l a6,-(sp)
    2008:	2f04           	move.l d4,-(sp)
    200a:	2f0a           	move.l a2,-(sp)
    200c:	4879 0001 7638 	pea 17638 <destlinezoom1>
    2012:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2014:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2018:	4642           	not.w d2
    201a:	528e           	addq.l #1,a6
    for(int i2=0;i2<18;i2++) { 
    201c:	4fef 0010      	lea 16(sp),sp
    2020:	ba8a           	cmp.l a2,d5
    2022:	6600 1898      	bne.w 38bc <ZoomTest+0x21ca>
    TestRow( valsupposed, valactual, mask, 18+i*19);
    2026:	2f0b           	move.l a3,-(sp)
    2028:	7800           	moveq #0,d4
    202a:	3802           	move.w d2,d4
    202c:	2f04           	move.l d4,-(sp)
    202e:	2f0a           	move.l a2,-(sp)
    2030:	4879 0001 7638 	pea 17638 <destlinezoom1>
    2036:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2038:	2a0a           	move.l a2,d5
    203a:	0685 0000 0390 	addi.l #912,d5
    2040:	47eb 0013      	lea 19(a3),a3
  for(int i=0;i<14;i++) {
    2044:	4fef 0010      	lea 16(sp),sp
    2048:	b6fc 011c      	cmpa.w #284,a3
    204c:	66ae           	bne.s 1ffc <ZoomTest+0x90a>
    204e:	41ec 31e4      	lea 12772(a4),a0
    2052:	2f48 0030      	move.l a0,48(sp)
    2056:	2448           	movea.l a0,a2
    2058:	2a3c 0000 0109 	move.l #265,d5
    TestRow( valsupposed, valactual, mask, i2+265);
    205e:	2f05           	move.l d5,-(sp)
    2060:	2f04           	move.l d4,-(sp)
    2062:	2f0a           	move.l a2,-(sp)
    2064:	4879 0001 7638 	pea 17638 <destlinezoom1>
    206a:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    206c:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2070:	4642           	not.w d2
    2072:	5285           	addq.l #1,d5
  for(int i2=0;i2<4;i2++) { 
    2074:	4fef 0010      	lea 16(sp),sp
    2078:	0c85 0000 010d 	cmpi.l #269,d5
    207e:	6726           	beq.s 20a6 <ZoomTest+0x9b4>
    2080:	7800           	moveq #0,d4
    2082:	3802           	move.w d2,d4
    TestRow( valsupposed, valactual, mask, i2+265);
    2084:	2f05           	move.l d5,-(sp)
    2086:	2f04           	move.l d4,-(sp)
    2088:	2f0a           	move.l a2,-(sp)
    208a:	4879 0001 7638 	pea 17638 <destlinezoom1>
    2090:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2092:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2096:	4642           	not.w d2
    2098:	5285           	addq.l #1,d5
  for(int i2=0;i2<4;i2++) { 
    209a:	4fef 0010      	lea 16(sp),sp
    209e:	0c85 0000 010d 	cmpi.l #269,d5
    20a4:	66da           	bne.s 2080 <ZoomTest+0x98e>
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    20a6:	4878 0001      	pea 1 <_start+0x1>
    20aa:	4878 0001      	pea 1 <_start+0x1>
    20ae:	2f03           	move.l d3,-(sp)
    20b0:	2f0c           	move.l a4,-(sp)
    20b2:	4eba ecd4      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    20b6:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    20bc:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    20c0:	2003           	move.l d3,d0
    20c2:	5880           	addq.l #4,d0
    20c4:	2f40 003c      	move.l d0,60(sp)
    20c8:	4fef 0010      	lea 16(sp),sp
    20cc:	2440           	movea.l d0,a2
  for(int i2=0;i2<11;i2++) { 
    20ce:	7800           	moveq #0,d4
  mask = 0x0000;
    20d0:	4242           	clr.w d2
    TestRow( valsupposed, valactual, mask, i2);
    20d2:	2f04           	move.l d4,-(sp)
    20d4:	3f02           	move.w d2,-(sp)
    20d6:	4267           	clr.w -(sp)
    20d8:	2f0a           	move.l a2,-(sp)
    20da:	4879 0001 760c 	pea 1760c <destlinezoom2>
    20e0:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    20e2:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    20e6:	4642           	not.w d2
  for(int i2=0;i2<11;i2++) { 
    20e8:	5284           	addq.l #1,d4
    20ea:	4fef 0010      	lea 16(sp),sp
    20ee:	720b           	moveq #11,d1
    20f0:	b284           	cmp.l d4,d1
    20f2:	66de           	bne.s 20d2 <ZoomTest+0x9e0>
  TestRow( valsupposed, valactual, 0xffff, 8);
    20f4:	4878 0008      	pea 8 <main+0x2>
    20f8:	2f3c 0000 ffff 	move.l #65535,-(sp)
    20fe:	2003           	move.l d3,d0
    2100:	0680 0000 0214 	addi.l #532,d0
    2106:	2f40 0068      	move.l d0,104(sp)
    210a:	2f00           	move.l d0,-(sp)
    210c:	4879 0001 760c 	pea 1760c <destlinezoom2>
    2112:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 9);
    2114:	4878 0009      	pea 9 <main+0x3>
    2118:	2f3c 0000 ffff 	move.l #65535,-(sp)
    211e:	2043           	movea.l d3,a0
    2120:	4868 0244      	pea 580(a0)
    2124:	4879 0001 760c 	pea 1760c <destlinezoom2>
    212a:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 10);
    212c:	4fef 0020      	lea 32(sp),sp
    2130:	4878 000a      	pea a <main+0x4>
    2134:	42a7           	clr.l -(sp)
    2136:	2043           	movea.l d3,a0
    2138:	4868 0274      	pea 628(a0)
    213c:	4879 0001 760c 	pea 1760c <destlinezoom2>
    2142:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 11);
    2144:	4878 000b      	pea b <main+0x5>
    2148:	42a7           	clr.l -(sp)
    214a:	2043           	movea.l d3,a0
    214c:	4868 02a4      	pea 676(a0)
    2150:	4879 0001 760c 	pea 1760c <destlinezoom2>
    2156:	4e95           	jsr (a5)
  for(int i=0;i<12;i++) {
    2158:	2c03           	move.l d3,d6
    215a:	0686 0000 05d4 	addi.l #1492,d6
    2160:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0x0000, 11);
    2164:	2e06           	move.l d6,d7
    2166:	367c 0018      	movea.w #24,a3
    216a:	7a00           	moveq #0,d5
    216c:	3a02           	move.w d2,d5
    216e:	2447           	movea.l d7,a2
    2170:	45ea fd00      	lea -768(a2),a2
    2174:	4deb fff3      	lea -13(a3),a6
    2178:	2805           	move.l d5,d4
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    217a:	2f0e           	move.l a6,-(sp)
    217c:	2f04           	move.l d4,-(sp)
    217e:	2f0a           	move.l a2,-(sp)
    2180:	4879 0001 760c 	pea 1760c <destlinezoom2>
    2186:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2188:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    218c:	4642           	not.w d2
    218e:	528e           	addq.l #1,a6
    for(int i2=0;i2<16;i2++) {  
    2190:	4fef 0010      	lea 16(sp),sp
    2194:	be8a           	cmp.l a2,d7
    2196:	6722           	beq.s 21ba <ZoomTest+0xac8>
    2198:	7800           	moveq #0,d4
    219a:	3802           	move.w d2,d4
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    219c:	2f0e           	move.l a6,-(sp)
    219e:	2f04           	move.l d4,-(sp)
    21a0:	2f0a           	move.l a2,-(sp)
    21a2:	4879 0001 760c 	pea 1760c <destlinezoom2>
    21a8:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    21aa:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    21ae:	4642           	not.w d2
    21b0:	528e           	addq.l #1,a6
    for(int i2=0;i2<16;i2++) {  
    21b2:	4fef 0010      	lea 16(sp),sp
    21b6:	be8a           	cmp.l a2,d7
    21b8:	66de           	bne.s 2198 <ZoomTest+0xaa6>
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    21ba:	7a00           	moveq #0,d5
    21bc:	3a02           	move.w d2,d5
    21be:	2f0b           	move.l a3,-(sp)
    21c0:	2f05           	move.l d5,-(sp)
    21c2:	2f0a           	move.l a2,-(sp)
    21c4:	4879 0001 760c 	pea 1760c <destlinezoom2>
    21ca:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    21cc:	486b 0001      	pea 1(a3)
    21d0:	2f05           	move.l d5,-(sp)
    21d2:	486a 0030      	pea 48(a2)
    21d6:	4879 0001 760c 	pea 1760c <destlinezoom2>
    21dc:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    21de:	4fef 0020      	lea 32(sp),sp
    21e2:	486b 0002      	pea 2(a3)
    21e6:	2f04           	move.l d4,-(sp)
    21e8:	486a 0060      	pea 96(a2)
    21ec:	4879 0001 760c 	pea 1760c <destlinezoom2>
    21f2:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    21f4:	486b 0003      	pea 3(a3)
    21f8:	2f04           	move.l d4,-(sp)
    21fa:	486a 0090      	pea 144(a2)
    21fe:	4879 0001 760c 	pea 1760c <destlinezoom2>
    2204:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2206:	2e0a           	move.l a2,d7
    2208:	0687 0000 03c0 	addi.l #960,d7
    220e:	47eb 0011      	lea 17(a3),a3
  for(int i=0;i<12;i++) {
    2212:	4fef 0020      	lea 32(sp),sp
    2216:	b6fc 00e4      	cmpa.w #228,a3
    221a:	6600 ff52      	bne.w 216e <ZoomTest+0xa7c>
    221e:	2003           	move.l d3,d0
    2220:	0680 0000 2fd4 	addi.l #12244,d0
    2226:	2f40 0064      	move.l d0,100(sp)
    222a:	2440           	movea.l d0,a2
  for(int i2=0;i2<15;i2++) { 
    222c:	7800           	moveq #0,d4
    TestRow( valsupposed, valactual, mask, i2);
    222e:	2f04           	move.l d4,-(sp)
    2230:	2f05           	move.l d5,-(sp)
    2232:	2f0a           	move.l a2,-(sp)
    2234:	4879 0001 760c 	pea 1760c <destlinezoom2>
    223a:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    223c:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2240:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    2242:	5284           	addq.l #1,d4
    2244:	4fef 0010      	lea 16(sp),sp
    2248:	720f           	moveq #15,d1
    224a:	b284           	cmp.l d4,d1
    224c:	6724           	beq.s 2272 <ZoomTest+0xb80>
    224e:	7a00           	moveq #0,d5
    2250:	3a02           	move.w d2,d5
    TestRow( valsupposed, valactual, mask, i2);
    2252:	2f04           	move.l d4,-(sp)
    2254:	2f05           	move.l d5,-(sp)
    2256:	2f0a           	move.l a2,-(sp)
    2258:	4879 0001 760c 	pea 1760c <destlinezoom2>
    225e:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2260:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2264:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    2266:	5284           	addq.l #1,d4
    2268:	4fef 0010      	lea 16(sp),sp
    226c:	720f           	moveq #15,d1
    226e:	b284           	cmp.l d4,d1
    2270:	66dc           	bne.s 224e <ZoomTest+0xb5c>
  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    2272:	4878 0001      	pea 1 <_start+0x1>
    2276:	4878 0002      	pea 2 <_start+0x2>
    227a:	2f0c           	move.l a4,-(sp)
    227c:	2f03           	move.l d3,-(sp)
    227e:	4eba eb08      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2282:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    2288:	4eae ff1c      	jsr -228(a6)
    228c:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    2290:	246f 0034      	movea.l 52(sp),a2
  for(int i2=0;i2<4;i2++) { 
    2294:	7400           	moveq #0,d2
  mask = 0xffff;
    2296:	78ff           	moveq #-1,d4
    TestRow( valsupposed, valactual, mask, i2);
    2298:	2f02           	move.l d2,-(sp)
    229a:	3f04           	move.w d4,-(sp)
    229c:	4267           	clr.w -(sp)
    229e:	2f0a           	move.l a2,-(sp)
    22a0:	4879 0001 75e0 	pea 175e0 <destlinezoom3>
    22a6:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    22a8:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    22ac:	4644           	not.w d4
  for(int i2=0;i2<4;i2++) { 
    22ae:	5282           	addq.l #1,d2
    22b0:	4fef 0010      	lea 16(sp),sp
    22b4:	7004           	moveq #4,d0
    22b6:	b082           	cmp.l d2,d0
    22b8:	66de           	bne.s 2298 <ZoomTest+0xba6>
  TestRow( valsupposed, valactual, 0xffff, 0+4);
    22ba:	4878 0004      	pea 4 <_start+0x4>
    22be:	2f3c 0000 ffff 	move.l #65535,-(sp)
    22c4:	486c 00c4      	pea 196(a4)
    22c8:	4879 0001 75e0 	pea 175e0 <destlinezoom3>
    22ce:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    22d0:	4878 0005      	pea 5 <_start+0x5>
    22d4:	2f3c 0000 ffff 	move.l #65535,-(sp)
    22da:	486c 00f4      	pea 244(a4)
    22de:	4879 0001 75e0 	pea 175e0 <destlinezoom3>
    22e4:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    22e6:	4fef 0020      	lea 32(sp),sp
    22ea:	4878 0006      	pea 6 <main>
    22ee:	42a7           	clr.l -(sp)
  valactual += ZMLINESIZE/2;
    22f0:	41ec 0124      	lea 292(a4),a0
    22f4:	2f48 005c      	move.l a0,92(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    22f8:	2f08           	move.l a0,-(sp)
    22fa:	4879 0001 75e0 	pea 175e0 <destlinezoom3>
    2300:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    2302:	4878 0007      	pea 7 <main+0x1>
    2306:	42a7           	clr.l -(sp)
    2308:	486c 0154      	pea 340(a4)
    230c:	4879 0001 75e0 	pea 175e0 <destlinezoom3>
    2312:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    2314:	4fef 0020      	lea 32(sp),sp
    2318:	4878 0008      	pea 8 <main+0x2>
    231c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2322:	486c 0184      	pea 388(a4)
    2326:	4879 0001 75e0 	pea 175e0 <destlinezoom3>
    232c:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    232e:	4878 0009      	pea 9 <main+0x3>
    2332:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2338:	486c 01b4      	pea 436(a4)
    233c:	4879 0001 75e0 	pea 175e0 <destlinezoom3>
    2342:	4e95           	jsr (a5)
  for(int i=0;i<12;i++) {
    2344:	280c           	move.l a4,d4
    2346:	0684 0000 04b4 	addi.l #1204,d4
    234c:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    2350:	367c 0018      	movea.w #24,a3
    2354:	7a00           	moveq #0,d5
    2356:	74ff           	moveq #-1,d2
    2358:	2444           	movea.l d4,a2
    235a:	45ea fd30      	lea -720(a2),a2
    235e:	4deb fff1      	lea -15(a3),a6
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    2362:	2f0e           	move.l a6,-(sp)
    2364:	2f05           	move.l d5,-(sp)
    2366:	2f0a           	move.l a2,-(sp)
    2368:	4879 0001 75e0 	pea 175e0 <destlinezoom3>
    236e:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2370:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2374:	528e           	addq.l #1,a6
    for(int i2=0;i2<15;i2++) {  
    2376:	4fef 0010      	lea 16(sp),sp
    237a:	b88a           	cmp.l a2,d4
    237c:	6722           	beq.s 23a0 <ZoomTest+0xcae>
    237e:	7a00           	moveq #0,d5
    2380:	3a02           	move.w d2,d5
    2382:	4642           	not.w d2
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    2384:	2f0e           	move.l a6,-(sp)
    2386:	2f05           	move.l d5,-(sp)
    2388:	2f0a           	move.l a2,-(sp)
    238a:	4879 0001 75e0 	pea 175e0 <destlinezoom3>
    2390:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2392:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2396:	528e           	addq.l #1,a6
    for(int i2=0;i2<15;i2++) {  
    2398:	4fef 0010      	lea 16(sp),sp
    239c:	b88a           	cmp.l a2,d4
    239e:	66de           	bne.s 237e <ZoomTest+0xc8c>
    TestRow( valsupposed, valactual, mask, i*21+9+15);
    23a0:	7800           	moveq #0,d4
    23a2:	3802           	move.w d2,d4
    23a4:	2f0b           	move.l a3,-(sp)
    23a6:	2f04           	move.l d4,-(sp)
    23a8:	2f0a           	move.l a2,-(sp)
    23aa:	4879 0001 75e0 	pea 175e0 <destlinezoom3>
    23b0:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    23b2:	486b 0001      	pea 1(a3)
    23b6:	2f04           	move.l d4,-(sp)
    23b8:	486a 0030      	pea 48(a2)
    23bc:	4879 0001 75e0 	pea 175e0 <destlinezoom3>
    23c2:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    23c4:	4fef 0020      	lea 32(sp),sp
    23c8:	486b 0002      	pea 2(a3)
    23cc:	2f05           	move.l d5,-(sp)
    23ce:	486a 0060      	pea 96(a2)
    23d2:	4879 0001 75e0 	pea 175e0 <destlinezoom3>
    23d8:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    23da:	486b 0003      	pea 3(a3)
    23de:	2f05           	move.l d5,-(sp)
    23e0:	486a 0090      	pea 144(a2)
    23e4:	4879 0001 75e0 	pea 175e0 <destlinezoom3>
    23ea:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    23ec:	4fef 0020      	lea 32(sp),sp
    23f0:	486b 0004      	pea 4(a3)
    23f4:	2f04           	move.l d4,-(sp)
    23f6:	486a 00c0      	pea 192(a2)
    23fa:	4879 0001 75e0 	pea 175e0 <destlinezoom3>
    2400:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    2402:	486b 0005      	pea 5(a3)
    2406:	2f04           	move.l d4,-(sp)
    2408:	486a 00f0      	pea 240(a2)
    240c:	4879 0001 75e0 	pea 175e0 <destlinezoom3>
    2412:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2414:	280a           	move.l a2,d4
    2416:	0684 0000 03f0 	addi.l #1008,d4
    241c:	47eb 0015      	lea 21(a3),a3
  for(int i=0;i<12;i++) {
    2420:	4fef 0020      	lea 32(sp),sp
    2424:	b6fc 0114      	cmpa.w #276,a3
    2428:	6600 ff2e      	bne.w 2358 <ZoomTest+0xc66>
    242c:	45ec 3124      	lea 12580(a4),a2
    2430:	283c 0000 0105 	move.l #261,d4
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    2436:	2f04           	move.l d4,-(sp)
    2438:	2f05           	move.l d5,-(sp)
    243a:	2f0a           	move.l a2,-(sp)
    243c:	4879 0001 75e0 	pea 175e0 <destlinezoom3>
    2442:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2444:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2448:	5284           	addq.l #1,d4
  for(int i2=0;i2<8;i2++) {  
    244a:	4fef 0010      	lea 16(sp),sp
    244e:	0c84 0000 010d 	cmpi.l #269,d4
    2454:	6726           	beq.s 247c <ZoomTest+0xd8a>
    2456:	7a00           	moveq #0,d5
    2458:	3a02           	move.w d2,d5
    245a:	4642           	not.w d2
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    245c:	2f04           	move.l d4,-(sp)
    245e:	2f05           	move.l d5,-(sp)
    2460:	2f0a           	move.l a2,-(sp)
    2462:	4879 0001 75e0 	pea 175e0 <destlinezoom3>
    2468:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    246a:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    246e:	5284           	addq.l #1,d4
  for(int i2=0;i2<8;i2++) {  
    2470:	4fef 0010      	lea 16(sp),sp
    2474:	0c84 0000 010d 	cmpi.l #269,d4
    247a:	66da           	bne.s 2456 <ZoomTest+0xd64>
  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    247c:	4878 0001      	pea 1 <_start+0x1>
    2480:	4878 0003      	pea 3 <_start+0x3>
    2484:	2f03           	move.l d3,-(sp)
    2486:	2f0c           	move.l a4,-(sp)
    2488:	4eba e8fe      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    248c:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    2492:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    2496:	4878 0007      	pea 7 <main+0x1>
    249a:	42a7           	clr.l -(sp)
    249c:	2f2f 0044      	move.l 68(sp),-(sp)
    24a0:	4879 0001 75b4 	pea 175b4 <destlinezoom4>
    24a6:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    24a8:	7034           	moveq #52,d0
    24aa:	d083           	add.l d3,d0
    24ac:	2f40 0060      	move.l d0,96(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    24b0:	4fef 0020      	lea 32(sp),sp
    24b4:	4878 0008      	pea 8 <main+0x2>
    24b8:	2f3c 0000 ffff 	move.l #65535,-(sp)
    24be:	2f00           	move.l d0,-(sp)
    24c0:	4879 0001 75b4 	pea 175b4 <destlinezoom4>
    24c6:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    24c8:	7264           	moveq #100,d1
    24ca:	d283           	add.l d3,d1
    24cc:	2f41 0060      	move.l d1,96(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    24d0:	4878 0009      	pea 9 <main+0x3>
    24d4:	2f3c 0000 ffff 	move.l #65535,-(sp)
    24da:	2f01           	move.l d1,-(sp)
    24dc:	4879 0001 75b4 	pea 175b4 <destlinezoom4>
    24e2:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    24e4:	2003           	move.l d3,d0
    24e6:	0680 0000 0094 	addi.l #148,d0
    24ec:	2f40 0058      	move.l d0,88(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    24f0:	4fef 0020      	lea 32(sp),sp
    24f4:	4878 0008      	pea 8 <main+0x2>
    24f8:	42a7           	clr.l -(sp)
    24fa:	2f00           	move.l d0,-(sp)
    24fc:	4879 0001 75b4 	pea 175b4 <destlinezoom4>
    2502:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    2504:	4878 0009      	pea 9 <main+0x3>
    2508:	42a7           	clr.l -(sp)
    250a:	2043           	movea.l d3,a0
    250c:	4868 00c4      	pea 196(a0)
    2510:	4879 0001 75b4 	pea 175b4 <destlinezoom4>
    2516:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    2518:	2003           	move.l d3,d0
    251a:	0680 0000 00f4 	addi.l #244,d0
    2520:	2f40 0064      	move.l d0,100(sp)
  for(int i=0;i<12;i++) {
    2524:	2e03           	move.l d3,d7
    2526:	0687 0000 0394 	addi.l #916,d7
    252c:	4fef 0020      	lea 32(sp),sp
  valactual += ZMLINESIZE/2;
    2530:	367c 0018      	movea.w #24,a3
  mask = 0xffff;
    2534:	7aff           	moveq #-1,d5
    2536:	7400           	moveq #0,d2
    2538:	4642           	not.w d2
    253a:	2447           	movea.l d7,a2
    253c:	45ea fd60      	lea -672(a2),a2
    2540:	4deb fff1      	lea -15(a3),a6
    2544:	2802           	move.l d2,d4
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    2546:	2f0e           	move.l a6,-(sp)
    2548:	2f04           	move.l d4,-(sp)
    254a:	2f0a           	move.l a2,-(sp)
    254c:	4879 0001 75b4 	pea 175b4 <destlinezoom4>
    2552:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2554:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2558:	4645           	not.w d5
    255a:	528e           	addq.l #1,a6
    for(int i2=0;i2<14;i2++) {  
    255c:	4fef 0010      	lea 16(sp),sp
    2560:	be8a           	cmp.l a2,d7
    2562:	6722           	beq.s 2586 <ZoomTest+0xe94>
    2564:	7800           	moveq #0,d4
    2566:	3805           	move.w d5,d4
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    2568:	2f0e           	move.l a6,-(sp)
    256a:	2f04           	move.l d4,-(sp)
    256c:	2f0a           	move.l a2,-(sp)
    256e:	4879 0001 75b4 	pea 175b4 <destlinezoom4>
    2574:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2576:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    257a:	4645           	not.w d5
    257c:	528e           	addq.l #1,a6
    for(int i2=0;i2<14;i2++) {  
    257e:	4fef 0010      	lea 16(sp),sp
    2582:	be8a           	cmp.l a2,d7
    2584:	66de           	bne.s 2564 <ZoomTest+0xe72>
    TestRow( valsupposed, valactual, mask, i*21+9+15);
    2586:	7400           	moveq #0,d2
    2588:	3405           	move.w d5,d2
    258a:	2f0b           	move.l a3,-(sp)
    258c:	2f02           	move.l d2,-(sp)
    258e:	2f0a           	move.l a2,-(sp)
    2590:	4879 0001 75b4 	pea 175b4 <destlinezoom4>
    2596:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    2598:	486b 0001      	pea 1(a3)
    259c:	2f02           	move.l d2,-(sp)
    259e:	486a 0030      	pea 48(a2)
    25a2:	4879 0001 75b4 	pea 175b4 <destlinezoom4>
    25a8:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    25aa:	4fef 0020      	lea 32(sp),sp
    25ae:	486b 0002      	pea 2(a3)
    25b2:	2f04           	move.l d4,-(sp)
    25b4:	486a 0060      	pea 96(a2)
    25b8:	4879 0001 75b4 	pea 175b4 <destlinezoom4>
    25be:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    25c0:	486b 0003      	pea 3(a3)
    25c4:	2f04           	move.l d4,-(sp)
    25c6:	486a 0090      	pea 144(a2)
    25ca:	4879 0001 75b4 	pea 175b4 <destlinezoom4>
    25d0:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    25d2:	4deb 0004      	lea 4(a3),a6
    25d6:	4fef 001c      	lea 28(sp),sp
    25da:	2e8e           	move.l a6,(sp)
    25dc:	2f02           	move.l d2,-(sp)
    25de:	486a 00c0      	pea 192(a2)
    25e2:	4879 0001 75b4 	pea 175b4 <destlinezoom4>
    25e8:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    25ea:	2e0b           	move.l a3,d7
    25ec:	5a87           	addq.l #5,d7
    25ee:	2f07           	move.l d7,-(sp)
    25f0:	2f02           	move.l d2,-(sp)
    25f2:	486a 00f0      	pea 240(a2)
    25f6:	4879 0001 75b4 	pea 175b4 <destlinezoom4>
    25fc:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    25fe:	4fef 001c      	lea 28(sp),sp
    2602:	2e8e           	move.l a6,(sp)
    2604:	2f04           	move.l d4,-(sp)
    2606:	486a 0120      	pea 288(a2)
    260a:	4879 0001 75b4 	pea 175b4 <destlinezoom4>
    2610:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    2612:	2f07           	move.l d7,-(sp)
    2614:	2f04           	move.l d4,-(sp)
    2616:	486a 0150      	pea 336(a2)
    261a:	4879 0001 75b4 	pea 175b4 <destlinezoom4>
    2620:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2622:	2e0a           	move.l a2,d7
    2624:	0687 0000 0420 	addi.l #1056,d7
    262a:	47eb 0015      	lea 21(a3),a3
  for(int i=0;i<12;i++) {
    262e:	4fef 0020      	lea 32(sp),sp
    2632:	b6fc 0114      	cmpa.w #276,a3
    2636:	6600 ff02      	bne.w 253a <ZoomTest+0xe48>
  TestRow( valsupposed, valactual, mask, 269);
    263a:	4878 010d      	pea 10d <main+0x107>
    263e:	2f02           	move.l d2,-(sp)
    2640:	2043           	movea.l d3,a0
    2642:	4868 3274      	pea 12916(a0)
    2646:	4879 0001 75b4 	pea 175b4 <destlinezoom4>
    264c:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    264e:	4878 0001      	pea 1 <_start+0x1>
    2652:	4878 0004      	pea 4 <_start+0x4>
    2656:	2f0c           	move.l a4,-(sp)
    2658:	2f03           	move.l d3,-(sp)
    265a:	4eba e72c      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    265e:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    2664:	4eae ff1c      	jsr -228(a6)
    2668:	4fef 0020      	lea 32(sp),sp
  valactual = destination+2; 
    266c:	266f 0034      	movea.l 52(sp),a3
  for(int i2=0;i2<13;i2++) {  
    2670:	95ca           	suba.l a2,a2
  mask = 0x0000;
    2672:	4245           	clr.w d5
    TestRow( valsupposed, valactual, mask, i2);
    2674:	7400           	moveq #0,d2
    2676:	3405           	move.w d5,d2
    2678:	2f0a           	move.l a2,-(sp)
    267a:	2f02           	move.l d2,-(sp)
    267c:	2f0b           	move.l a3,-(sp)
    267e:	4879 0001 7588 	pea 17588 <destlinezoom5>
    2684:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2686:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    268a:	4645           	not.w d5
  for(int i2=0;i2<13;i2++) {  
    268c:	528a           	addq.l #1,a2
    268e:	4fef 0010      	lea 16(sp),sp
    2692:	700d           	moveq #13,d0
    2694:	b08a           	cmp.l a2,d0
    2696:	66dc           	bne.s 2674 <ZoomTest+0xf82>
    2698:	7800           	moveq #0,d4
    269a:	3805           	move.w d5,d4
  TestRow( valsupposed, valactual, mask, 12);   
    269c:	4878 000c      	pea c <main+0x6>
    26a0:	2f04           	move.l d4,-(sp)
    26a2:	486c 0274      	pea 628(a4)
    26a6:	4879 0001 7588 	pea 17588 <destlinezoom5>
    26ac:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 13);
    26ae:	4878 000d      	pea d <main+0x7>
    26b2:	2f04           	move.l d4,-(sp)
    26b4:	486c 02a4      	pea 676(a4)
    26b8:	4879 0001 7588 	pea 17588 <destlinezoom5>
    26be:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 14);
    26c0:	4fef 0020      	lea 32(sp),sp
    26c4:	4878 000e      	pea e <main+0x8>
    26c8:	2f02           	move.l d2,-(sp)
    26ca:	486c 02d4      	pea 724(a4)
    26ce:	4879 0001 7588 	pea 17588 <destlinezoom5>
    26d4:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 15);
    26d6:	4878 000f      	pea f <main+0x9>
    26da:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    26dc:	41ec 0304      	lea 772(a4),a0
    26e0:	2f48 0064      	move.l a0,100(sp)
  TestRow( valsupposed, valactual, mask, 15);
    26e4:	2f08           	move.l a0,-(sp)
    26e6:	4879 0001 7588 	pea 17588 <destlinezoom5>
    26ec:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 16);
    26ee:	4fef 0020      	lea 32(sp),sp
    26f2:	4878 0010      	pea 10 <main+0xa>
    26f6:	2f04           	move.l d4,-(sp)
    26f8:	486c 0334      	pea 820(a4)
    26fc:	4879 0001 7588 	pea 17588 <destlinezoom5>
    2702:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 17);
    2704:	4878 0011      	pea 11 <main+0xb>
    2708:	2f04           	move.l d4,-(sp)
    270a:	2f2f 0054      	move.l 84(sp),-(sp)
    270e:	4879 0001 7588 	pea 17588 <destlinezoom5>
    2714:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 18);
    2716:	4fef 0020      	lea 32(sp),sp
    271a:	4878 0012      	pea 12 <main+0xc>
    271e:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2720:	41ec 0394      	lea 916(a4),a0
    2724:	2f48 0070      	move.l a0,112(sp)
  TestRow( valsupposed, valactual, mask, 18);
    2728:	2f08           	move.l a0,-(sp)
    272a:	4879 0001 7588 	pea 17588 <destlinezoom5>
    2730:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 19);
    2732:	4878 0013      	pea 13 <main+0xd>
    2736:	2f02           	move.l d2,-(sp)
    2738:	486c 03c4      	pea 964(a4)
    273c:	4879 0001 7588 	pea 17588 <destlinezoom5>
    2742:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 20);
    2744:	4fef 0020      	lea 32(sp),sp
    2748:	4878 0014      	pea 14 <main+0xe>
    274c:	2f04           	move.l d4,-(sp)
    274e:	486c 03f4      	pea 1012(a4)
    2752:	4879 0001 7588 	pea 17588 <destlinezoom5>
    2758:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 21);
    275a:	4878 0015      	pea 15 <main+0xf>
    275e:	2f04           	move.l d4,-(sp)
    2760:	486c 0424      	pea 1060(a4)
    2764:	4879 0001 7588 	pea 17588 <destlinezoom5>
    276a:	4e95           	jsr (a5)
  for(int i=0;i<10;i++) {
    276c:	280c           	move.l a4,d4
    276e:	0684 0000 06c4 	addi.l #1732,d4
    2774:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, mask, 21);
    2778:	347c 0023      	movea.w #35,a2
    277c:	2644           	movea.l d4,a3
    277e:	47eb fd90      	lea -624(a3),a3
    2782:	4dea fff3      	lea -13(a2),a6
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    2786:	2f0e           	move.l a6,-(sp)
    2788:	2f02           	move.l d2,-(sp)
    278a:	2f0b           	move.l a3,-(sp)
    278c:	4879 0001 7588 	pea 17588 <destlinezoom5>
    2792:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2794:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    2798:	528e           	addq.l #1,a6
    for(int i2=0;i2<13;i2++) {  
    279a:	4fef 0010      	lea 16(sp),sp
    279e:	b88b           	cmp.l a3,d4
    27a0:	6722           	beq.s 27c4 <ZoomTest+0x10d2>
    27a2:	7400           	moveq #0,d2
    27a4:	3405           	move.w d5,d2
    27a6:	4645           	not.w d5
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    27a8:	2f0e           	move.l a6,-(sp)
    27aa:	2f02           	move.l d2,-(sp)
    27ac:	2f0b           	move.l a3,-(sp)
    27ae:	4879 0001 7588 	pea 17588 <destlinezoom5>
    27b4:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    27b6:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    27ba:	528e           	addq.l #1,a6
    for(int i2=0;i2<13;i2++) {  
    27bc:	4fef 0010      	lea 16(sp),sp
    27c0:	b88b           	cmp.l a3,d4
    27c2:	66de           	bne.s 27a2 <ZoomTest+0x10b0>
    TestRow( valsupposed, valactual, mask, i*21+22+13);
    27c4:	7800           	moveq #0,d4
    27c6:	3805           	move.w d5,d4
    27c8:	2f0a           	move.l a2,-(sp)
    27ca:	2f04           	move.l d4,-(sp)
    27cc:	2f0b           	move.l a3,-(sp)
    27ce:	4879 0001 7588 	pea 17588 <destlinezoom5>
    27d4:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    27d6:	486a 0001      	pea 1(a2)
    27da:	2f04           	move.l d4,-(sp)
    27dc:	486b 0030      	pea 48(a3)
    27e0:	4879 0001 7588 	pea 17588 <destlinezoom5>
    27e6:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    27e8:	4fef 0020      	lea 32(sp),sp
    27ec:	486a 0002      	pea 2(a2)
    27f0:	2f02           	move.l d2,-(sp)
    27f2:	486b 0060      	pea 96(a3)
    27f6:	4879 0001 7588 	pea 17588 <destlinezoom5>
    27fc:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    27fe:	486a 0003      	pea 3(a2)
    2802:	2f02           	move.l d2,-(sp)
    2804:	486b 0090      	pea 144(a3)
    2808:	4879 0001 7588 	pea 17588 <destlinezoom5>
    280e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    2810:	4fef 0020      	lea 32(sp),sp
    2814:	486a 0004      	pea 4(a2)
    2818:	2f04           	move.l d4,-(sp)
    281a:	486b 00c0      	pea 192(a3)
    281e:	4879 0001 7588 	pea 17588 <destlinezoom5>
    2824:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    2826:	486a 0005      	pea 5(a2)
    282a:	2f04           	move.l d4,-(sp)
    282c:	486b 00f0      	pea 240(a3)
    2830:	4879 0001 7588 	pea 17588 <destlinezoom5>
    2836:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    2838:	4fef 0020      	lea 32(sp),sp
    283c:	486a 0006      	pea 6(a2)
    2840:	2f02           	move.l d2,-(sp)
    2842:	486b 0120      	pea 288(a3)
    2846:	4879 0001 7588 	pea 17588 <destlinezoom5>
    284c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    284e:	486a 0007      	pea 7(a2)
    2852:	2f02           	move.l d2,-(sp)
    2854:	486b 0150      	pea 336(a3)
    2858:	4879 0001 7588 	pea 17588 <destlinezoom5>
    285e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    2860:	4fef 0020      	lea 32(sp),sp
    2864:	486a 0008      	pea 8(a2)
    2868:	2f04           	move.l d4,-(sp)
    286a:	486b 0180      	pea 384(a3)
    286e:	4879 0001 7588 	pea 17588 <destlinezoom5>
    2874:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    2876:	486a 0009      	pea 9(a2)
    287a:	2f04           	move.l d4,-(sp)
    287c:	486b 01b0      	pea 432(a3)
    2880:	4879 0001 7588 	pea 17588 <destlinezoom5>
    2886:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2888:	280b           	move.l a3,d4
    288a:	0684 0000 0450 	addi.l #1104,d4
    2890:	45ea 0015      	lea 21(a2),a2
  for(int i=0;i<10;i++) {
    2894:	4fef 0020      	lea 32(sp),sp
    2898:	b4fc 00f5      	cmpa.w #245,a2
    289c:	6600 fede      	bne.w 277c <ZoomTest+0x108a>
    28a0:	47ec 2f74      	lea 12148(a4),a3
    28a4:	7e02           	moveq #2,d7
    28a6:	4607           	not.b d7
    TestRow( valsupposed, valactual, mask, i2+253);
    28a8:	2f07           	move.l d7,-(sp)
    28aa:	2f02           	move.l d2,-(sp)
    28ac:	2f0b           	move.l a3,-(sp)
    28ae:	4879 0001 7588 	pea 17588 <destlinezoom5>
    28b4:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    28b6:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    28ba:	5287           	addq.l #1,d7
  for(int i2=0;i2<13;i2++) {  
    28bc:	4fef 0010      	lea 16(sp),sp
    28c0:	0c87 0000 010a 	cmpi.l #266,d7
    28c6:	6726           	beq.s 28ee <ZoomTest+0x11fc>
    28c8:	7400           	moveq #0,d2
    28ca:	3405           	move.w d5,d2
    28cc:	4645           	not.w d5
    TestRow( valsupposed, valactual, mask, i2+253);
    28ce:	2f07           	move.l d7,-(sp)
    28d0:	2f02           	move.l d2,-(sp)
    28d2:	2f0b           	move.l a3,-(sp)
    28d4:	4879 0001 7588 	pea 17588 <destlinezoom5>
    28da:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    28dc:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    28e0:	5287           	addq.l #1,d7
  for(int i2=0;i2<13;i2++) {  
    28e2:	4fef 0010      	lea 16(sp),sp
    28e6:	0c87 0000 010a 	cmpi.l #266,d7
    28ec:	66da           	bne.s 28c8 <ZoomTest+0x11d6>
    28ee:	0285 0000 ffff 	andi.l #65535,d5
  TestRow( valsupposed, valactual, mask, 266);
    28f4:	2f07           	move.l d7,-(sp)
    28f6:	2f05           	move.l d5,-(sp)
    28f8:	2f2f 0038      	move.l 56(sp),-(sp)
    28fc:	4879 0001 7588 	pea 17588 <destlinezoom5>
    2902:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 267);
    2904:	4878 010b      	pea 10b <main+0x105>
    2908:	2f05           	move.l d5,-(sp)
  valactual += ZMLINESIZE/2;
    290a:	41ec 3214      	lea 12820(a4),a0
    290e:	2f48 0070      	move.l a0,112(sp)
  TestRow( valsupposed, valactual, mask, 267);
    2912:	2f08           	move.l a0,-(sp)
    2914:	4879 0001 7588 	pea 17588 <destlinezoom5>
    291a:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 268);
    291c:	4fef 0020      	lea 32(sp),sp
    2920:	4878 010c      	pea 10c <main+0x106>
    2924:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2926:	41ec 3244      	lea 12868(a4),a0
    292a:	2f48 0064      	move.l a0,100(sp)
  TestRow( valsupposed, valactual, mask, 268);
    292e:	2f08           	move.l a0,-(sp)
    2930:	4879 0001 7588 	pea 17588 <destlinezoom5>
    2936:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 269);
    2938:	4878 010d      	pea 10d <main+0x107>
    293c:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    293e:	41ec 3274      	lea 12916(a4),a0
    2942:	2f48 0054      	move.l a0,84(sp)
  TestRow( valsupposed, valactual, mask, 269);
    2946:	2f08           	move.l a0,-(sp)
    2948:	4879 0001 7588 	pea 17588 <destlinezoom5>
    294e:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    2950:	4fef 0020      	lea 32(sp),sp
    2954:	4878 0001      	pea 1 <_start+0x1>
    2958:	4878 0005      	pea 5 <_start+0x5>
    295c:	2f03           	move.l d3,-(sp)
    295e:	2f0c           	move.l a4,-(sp)
    2960:	4eba e426      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2964:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    296a:	4eae ff1c      	jsr -228(a6)
    296e:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    2972:	266f 002c      	movea.l 44(sp),a3
  for(int i2=0;i2<7;i2++) {  
    2976:	7800           	moveq #0,d4
  mask = 0x0000;
    2978:	4242           	clr.w d2
    TestRow( valsupposed, valactual, mask, i2);
    297a:	2f04           	move.l d4,-(sp)
    297c:	3f02           	move.w d2,-(sp)
    297e:	4267           	clr.w -(sp)
    2980:	2f0b           	move.l a3,-(sp)
    2982:	4879 0001 755c 	pea 1755c <destlinezoom6>
    2988:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    298a:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    298e:	4642           	not.w d2
  for(int i2=0;i2<7;i2++) {  
    2990:	5284           	addq.l #1,d4
    2992:	4fef 0010      	lea 16(sp),sp
    2996:	7007           	moveq #7,d0
    2998:	b084           	cmp.l d4,d0
    299a:	66de           	bne.s 297a <ZoomTest+0x1288>
    299c:	2c43           	movea.l d3,a6
    299e:	4dee 0154      	lea 340(a6),a6
    29a2:	367c 0007      	movea.w #7,a3
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    29a6:	7800           	moveq #0,d4
    29a8:	3802           	move.w d2,d4
    29aa:	2f0b           	move.l a3,-(sp)
    29ac:	2f04           	move.l d4,-(sp)
    29ae:	2f0e           	move.l a6,-(sp)
    29b0:	4879 0001 755c 	pea 1755c <destlinezoom6>
    29b6:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    29b8:	486b 0001      	pea 1(a3)
    29bc:	2f04           	move.l d4,-(sp)
    29be:	486e 0030      	pea 48(a6)
    29c2:	4879 0001 755c 	pea 1755c <destlinezoom6>
    29c8:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    29ca:	4642           	not.w d2
    29cc:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    29ce:	4dee 0060      	lea 96(a6),a6
  for(int i=0;i<6;i++) {
    29d2:	4fef 0020      	lea 32(sp),sp
    29d6:	7213           	moveq #19,d1
    29d8:	b28b           	cmp.l a3,d1
    29da:	66ca           	bne.s 29a6 <ZoomTest+0x12b4>
    29dc:	2a0a           	move.l a2,d5
    29de:	2c46           	movea.l d6,a6
    29e0:	4dee fdc0      	lea -576(a6),a6
  for(int i2=0;i2<7;i2++) {  
    29e4:	280b           	move.l a3,d4
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    29e6:	2f04           	move.l d4,-(sp)
    29e8:	3f02           	move.w d2,-(sp)
    29ea:	4267           	clr.w -(sp)
    29ec:	2f0e           	move.l a6,-(sp)
    29ee:	4879 0001 755c 	pea 1755c <destlinezoom6>
    29f4:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    29f6:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    29fa:	4642           	not.w d2
    29fc:	5284           	addq.l #1,d4
    for(int i2=0;i2<12;i2++) {  
    29fe:	4fef 0010      	lea 16(sp),sp
    2a02:	bc8e           	cmp.l a6,d6
    2a04:	66e0           	bne.s 29e6 <ZoomTest+0x12f4>
    2a06:	347c 001f      	movea.w #31,a2
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    2a0a:	7800           	moveq #0,d4
    2a0c:	3802           	move.w d2,d4
    2a0e:	2f0a           	move.l a2,-(sp)
    2a10:	2f04           	move.l d4,-(sp)
    2a12:	2f0e           	move.l a6,-(sp)
    2a14:	4879 0001 755c 	pea 1755c <destlinezoom6>
    2a1a:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    2a1c:	486a 0001      	pea 1(a2)
    2a20:	2f04           	move.l d4,-(sp)
    2a22:	486e 0030      	pea 48(a6)
    2a26:	4879 0001 755c 	pea 1755c <destlinezoom6>
    2a2c:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    2a2e:	4642           	not.w d2
    2a30:	45ea 0018      	lea 24(a2),a2
      valactual += ZMLINESIZE/2;
    2a34:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<6;i++) {
    2a38:	4fef 0020      	lea 32(sp),sp
    2a3c:	b4fc 00af      	cmpa.w #175,a2
    2a40:	66c8           	bne.s 2a0a <ZoomTest+0x1318>
    2a42:	0686 0000 0480 	addi.l #1152,d6
    2a48:	47eb 0018      	lea 24(a3),a3
  for(int i=0;i<10;i++) {
    2a4c:	b6fc 0103      	cmpa.w #259,a3
    2a50:	668c           	bne.s 29de <ZoomTest+0x12ec>
    2a52:	2445           	movea.l d5,a2
    2a54:	2c43           	movea.l d3,a6
    2a56:	4dee 3094      	lea 12436(a6),a6
    2a5a:	283c 0000 0102 	move.l #258,d4
    TestRow( valsupposed, valactual, mask, 258+i2);
    2a60:	2f04           	move.l d4,-(sp)
    2a62:	3f02           	move.w d2,-(sp)
    2a64:	4267           	clr.w -(sp)
    2a66:	2f0e           	move.l a6,-(sp)
    2a68:	4879 0001 755c 	pea 1755c <destlinezoom6>
    2a6e:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2a70:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2a74:	4642           	not.w d2
    2a76:	5284           	addq.l #1,d4
  for(int i2=0;i2<11;i2++) {  
    2a78:	4fef 0010      	lea 16(sp),sp
    2a7c:	0c84 0000 010d 	cmpi.l #269,d4
    2a82:	66dc           	bne.s 2a60 <ZoomTest+0x136e>
  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    2a84:	4878 0001      	pea 1 <_start+0x1>
    2a88:	4878 0006      	pea 6 <main>
    2a8c:	2f0c           	move.l a4,-(sp)
    2a8e:	2f03           	move.l d3,-(sp)
    2a90:	4eba e2f6      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2a94:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    2a9a:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2a9e:	42a7           	clr.l -(sp)
    2aa0:	42a7           	clr.l -(sp)
    2aa2:	2f2f 004c      	move.l 76(sp),-(sp)
    2aa6:	4879 0001 7530 	pea 17530 <destlinezoom7>
    2aac:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    2aae:	41ec 0034      	lea 52(a4),a0
    2ab2:	2f48 0068      	move.l a0,104(sp)
    2ab6:	4fef 0020      	lea 32(sp),sp
    2aba:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    2abe:	7eff           	moveq #-1,d7
    2ac0:	280a           	move.l a2,d4
    2ac2:	2448           	movea.l a0,a2
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2ac4:	7400           	moveq #0,d2
    2ac6:	3407           	move.w d7,d2
    2ac8:	2f0e           	move.l a6,-(sp)
    2aca:	2f02           	move.l d2,-(sp)
    2acc:	2f0a           	move.l a2,-(sp)
    2ace:	4879 0001 7530 	pea 17530 <destlinezoom7>
    2ad4:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2ad6:	486e 0001      	pea 1(a6)
    2ada:	2f02           	move.l d2,-(sp)
    2adc:	486a 0030      	pea 48(a2)
    2ae0:	4879 0001 7530 	pea 17530 <destlinezoom7>
    2ae6:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2ae8:	4647           	not.w d7
    2aea:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2aec:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<7;i++) {
    2af0:	4fef 0020      	lea 32(sp),sp
    2af4:	700f           	moveq #15,d0
    2af6:	b08e           	cmp.l a6,d0
    2af8:	66ca           	bne.s 2ac4 <ZoomTest+0x13d2>
    2afa:	240c           	move.l a4,d2
    2afc:	0682 0000 04e4 	addi.l #1252,d2
    2b02:	2a0b           	move.l a3,d5
    2b04:	2c04           	move.l d4,d6
    2b06:	264e           	movea.l a6,a3
    2b08:	2c42           	movea.l d2,a6
    2b0a:	4dee fdf0      	lea -528(a6),a6
  mask = mask ^ 0xffff;
    2b0e:	280b           	move.l a3,d4
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    2b10:	2f04           	move.l d4,-(sp)
    2b12:	3f07           	move.w d7,-(sp)
    2b14:	4267           	clr.w -(sp)
    2b16:	2f0e           	move.l a6,-(sp)
    2b18:	4879 0001 7530 	pea 17530 <destlinezoom7>
    2b1e:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2b20:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2b24:	4647           	not.w d7
    2b26:	5284           	addq.l #1,d4
    for(int i2=0;i2<11;i2++) {  
    2b28:	4fef 0010      	lea 16(sp),sp
    2b2c:	b48e           	cmp.l a6,d2
    2b2e:	66e0           	bne.s 2b10 <ZoomTest+0x141e>
    2b30:	347c 001a      	movea.w #26,a2
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    2b34:	7800           	moveq #0,d4
    2b36:	3807           	move.w d7,d4
    2b38:	2f0a           	move.l a2,-(sp)
    2b3a:	2f04           	move.l d4,-(sp)
    2b3c:	2f0e           	move.l a6,-(sp)
    2b3e:	4879 0001 7530 	pea 17530 <destlinezoom7>
    2b44:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    2b46:	2f0a           	move.l a2,-(sp)
    2b48:	2f04           	move.l d4,-(sp)
    2b4a:	486e 0030      	pea 48(a6)
    2b4e:	4879 0001 7530 	pea 17530 <destlinezoom7>
    2b54:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    2b56:	4647           	not.w d7
    2b58:	45ea 0019      	lea 25(a2),a2
      valactual += ZMLINESIZE/2;
    2b5c:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<7;i++) {
    2b60:	4fef 0020      	lea 32(sp),sp
    2b64:	b4fc 00c9      	cmpa.w #201,a2
    2b68:	66ca           	bne.s 2b34 <ZoomTest+0x1442>
    2b6a:	0682 0000 04b0 	addi.l #1200,d2
    2b70:	47eb 0019      	lea 25(a3),a3
  for(int i=0;i<10;i++) {
    2b74:	b6fc 0109      	cmpa.w #265,a3
    2b78:	668e           	bne.s 2b08 <ZoomTest+0x1416>
    2b7a:	2645           	movea.l d5,a3
    2b7c:	2446           	movea.l d6,a2
    2b7e:	4dec 31b4      	lea 12724(a4),a6
    2b82:	243c 0000 0100 	move.l #256,d2
    TestRow( valsupposed, valactual, mask, 256+i2);
    2b88:	2f02           	move.l d2,-(sp)
    2b8a:	3f07           	move.w d7,-(sp)
    2b8c:	4267           	clr.w -(sp)
    2b8e:	2f0e           	move.l a6,-(sp)
    2b90:	4879 0001 7530 	pea 17530 <destlinezoom7>
    2b96:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2b98:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2b9c:	4647           	not.w d7
    2b9e:	5282           	addq.l #1,d2
  for(int i2=0;i2<5;i2++) {  
    2ba0:	4fef 0010      	lea 16(sp),sp
    2ba4:	0c82 0000 0105 	cmpi.l #261,d2
    2baa:	66dc           	bne.s 2b88 <ZoomTest+0x1496>
  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    2bac:	4878 0001      	pea 1 <_start+0x1>
    2bb0:	4878 0007      	pea 7 <main+0x1>
    2bb4:	2f03           	move.l d3,-(sp)
    2bb6:	2f0c           	move.l a4,-(sp)
    2bb8:	4eba e1ce      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2bbc:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    2bc2:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2bc6:	42a7           	clr.l -(sp)
    2bc8:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2bce:	2f2f 0044      	move.l 68(sp),-(sp)
    2bd2:	4879 0001 7504 	pea 17504 <destlinezoom8>
    2bd8:	4e95           	jsr (a5)
    2bda:	4fef 0020      	lea 32(sp),sp
    2bde:	2f6f 0038 0030 	move.l 56(sp),48(sp)
  valactual += ZMLINESIZE/2;
    2be4:	242f 0040      	move.l 64(sp),d2
  TestRow( valsupposed, valactual, mask, 0);
    2be8:	7801           	moveq #1,d4
  mask = mask ^ 0xffff;
    2bea:	4245           	clr.w d5
    2bec:	2c44           	movea.l d4,a6
    2bee:	2c2f 0030      	move.l 48(sp),d6
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2bf2:	7800           	moveq #0,d4
    2bf4:	3805           	move.w d5,d4
    2bf6:	2f0e           	move.l a6,-(sp)
    2bf8:	2f04           	move.l d4,-(sp)
    2bfa:	2f02           	move.l d2,-(sp)
    2bfc:	4879 0001 7504 	pea 17504 <destlinezoom8>
    2c02:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2c04:	486e 0001      	pea 1(a6)
    2c08:	2f04           	move.l d4,-(sp)
    2c0a:	2042           	movea.l d2,a0
    2c0c:	4868 0030      	pea 48(a0)
    2c10:	4879 0001 7504 	pea 17504 <destlinezoom8>
    2c16:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2c18:	4645           	not.w d5
    2c1a:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    2c1c:	4fef 0020      	lea 32(sp),sp
    2c20:	700b           	moveq #11,d0
    2c22:	b08e           	cmp.l a6,d0
    2c24:	6740           	beq.s 2c66 <ZoomTest+0x1574>
    2c26:	2002           	move.l d2,d0
    2c28:	0680 0000 00c0 	addi.l #192,d0
    2c2e:	2406           	move.l d6,d2
    2c30:	2c00           	move.l d0,d6
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2c32:	7800           	moveq #0,d4
    2c34:	3805           	move.w d5,d4
    2c36:	2f0e           	move.l a6,-(sp)
    2c38:	2f04           	move.l d4,-(sp)
    2c3a:	2f02           	move.l d2,-(sp)
    2c3c:	4879 0001 7504 	pea 17504 <destlinezoom8>
    2c42:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2c44:	486e 0001      	pea 1(a6)
    2c48:	2f04           	move.l d4,-(sp)
    2c4a:	2042           	movea.l d2,a0
    2c4c:	4868 0030      	pea 48(a0)
    2c50:	4879 0001 7504 	pea 17504 <destlinezoom8>
    2c56:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2c58:	4645           	not.w d5
    2c5a:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    2c5c:	4fef 0020      	lea 32(sp),sp
    2c60:	700b           	moveq #11,d0
    2c62:	b08e           	cmp.l a6,d0
    2c64:	66c0           	bne.s 2c26 <ZoomTest+0x1534>
    2c66:	280e           	move.l a6,d4
    2c68:	2f46 0030      	move.l d6,48(sp)
    2c6c:	2e06           	move.l d6,d7
    2c6e:	0687 0000 01e0 	addi.l #480,d7
    2c74:	327c 0015      	movea.w #21,a1
    2c78:	2f4b 006c      	move.l a3,108(sp)
    2c7c:	2f4a 0070      	move.l a2,112(sp)
    2c80:	2449           	movea.l a1,a2
    2c82:	2c47           	movea.l d7,a6
    2c84:	4dee fe20      	lea -480(a6),a6
    2c88:	47ea fff6      	lea -10(a2),a3
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    2c8c:	2f0b           	move.l a3,-(sp)
    2c8e:	3f05           	move.w d5,-(sp)
    2c90:	4267           	clr.w -(sp)
    2c92:	2f0e           	move.l a6,-(sp)
    2c94:	4879 0001 7504 	pea 17504 <destlinezoom8>
    2c9a:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2c9c:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2ca0:	4645           	not.w d5
    2ca2:	528b           	addq.l #1,a3
    for(int i2=0;i2<10;i2++) {  
    2ca4:	4fef 0010      	lea 16(sp),sp
    2ca8:	be8e           	cmp.l a6,d7
    2caa:	66e0           	bne.s 2c8c <ZoomTest+0x159a>
    2cac:	240a           	move.l a2,d2
    2cae:	2c0e           	move.l a6,d6
    2cb0:	0686 0000 0300 	addi.l #768,d6
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    2cb6:	7200           	moveq #0,d1
    2cb8:	3205           	move.w d5,d1
    2cba:	2641           	movea.l d1,a3
    2cbc:	2f02           	move.l d2,-(sp)
    2cbe:	2f0b           	move.l a3,-(sp)
    2cc0:	2f0e           	move.l a6,-(sp)
    2cc2:	4879 0001 7504 	pea 17504 <destlinezoom8>
    2cc8:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    2cca:	2f02           	move.l d2,-(sp)
    2ccc:	2f0b           	move.l a3,-(sp)
    2cce:	486e 0030      	pea 48(a6)
    2cd2:	4879 0001 7504 	pea 17504 <destlinezoom8>
    2cd8:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2cda:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    2cde:	4645           	not.w d5
    2ce0:	5282           	addq.l #1,d2
    for(int i2=0;i2<8;i2++) {
    2ce2:	4fef 0020      	lea 32(sp),sp
    2ce6:	bc8e           	cmp.l a6,d6
    2ce8:	66cc           	bne.s 2cb6 <ZoomTest+0x15c4>
    2cea:	0687 0000 04e0 	addi.l #1248,d7
    2cf0:	45ea 001a      	lea 26(a2),a2
  for(int i=0;i<9;i++) {
    2cf4:	b4fc 00ff      	cmpa.w #255,a2
    2cf8:	6688           	bne.s 2c82 <ZoomTest+0x1590>
    2cfa:	266f 006c      	movea.l 108(sp),a3
    2cfe:	246f 0070      	movea.l 112(sp),a2
    2d02:	2c2f 0030      	move.l 48(sp),d6
    2d06:	0686 0000 2be0 	addi.l #11232,d6
    2d0c:	240a           	move.l a2,d2
    2d0e:	2c46           	movea.l d6,a6
    TestRow( valsupposed, valactual, mask, 245+i2);
    2d10:	2f02           	move.l d2,-(sp)
    2d12:	3f05           	move.w d5,-(sp)
    2d14:	4267           	clr.w -(sp)
    2d16:	2f0e           	move.l a6,-(sp)
    2d18:	4879 0001 7504 	pea 17504 <destlinezoom8>
    2d1e:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2d20:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2d24:	4645           	not.w d5
    2d26:	5282           	addq.l #1,d2
  for(int i2=0;i2<10;i2++) {  
    2d28:	4fef 0010      	lea 16(sp),sp
    2d2c:	0c82 0000 00ff 	cmpi.l #255,d2
    2d32:	66dc           	bne.s 2d10 <ZoomTest+0x161e>
    2d34:	2c2f 0030      	move.l 48(sp),d6
    2d38:	0686 0000 2dc0 	addi.l #11712,d6
    2d3e:	2c42           	movea.l d2,a6
    2d40:	2e0a           	move.l a2,d7
    2d42:	2446           	movea.l d6,a2
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    2d44:	7c00           	moveq #0,d6
    2d46:	3c05           	move.w d5,d6
    2d48:	2f0e           	move.l a6,-(sp)
    2d4a:	2f06           	move.l d6,-(sp)
    2d4c:	2f0a           	move.l a2,-(sp)
    2d4e:	4879 0001 7504 	pea 17504 <destlinezoom8>
    2d54:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    2d56:	486e 0001      	pea 1(a6)
    2d5a:	2f06           	move.l d6,-(sp)
    2d5c:	486a 0030      	pea 48(a2)
    2d60:	4879 0001 7504 	pea 17504 <destlinezoom8>
    2d66:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2d68:	4645           	not.w d5
    2d6a:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2d6c:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<7;i++) {
    2d70:	4fef 0020      	lea 32(sp),sp
    2d74:	bcfc 010d      	cmpa.w #269,a6
    2d78:	66ca           	bne.s 2d44 <ZoomTest+0x1652>
    2d7a:	2447           	movea.l d7,a2
  TestRow( valsupposed, valactual, mask, 269);
    2d7c:	2f0e           	move.l a6,-(sp)
    2d7e:	3f05           	move.w d5,-(sp)
    2d80:	4267           	clr.w -(sp)
    2d82:	206f 0038      	movea.l 56(sp),a0
    2d86:	4868 3060      	pea 12384(a0)
    2d8a:	4879 0001 7504 	pea 17504 <destlinezoom8>
    2d90:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    2d92:	4878 0001      	pea 1 <_start+0x1>
    2d96:	4878 0008      	pea 8 <main+0x2>
    2d9a:	2f0c           	move.l a4,-(sp)
    2d9c:	2f03           	move.l d3,-(sp)
    2d9e:	4eba dfe8      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2da2:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    2da8:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2dac:	4fef 001c      	lea 28(sp),sp
    2db0:	4297           	clr.l (sp)
    2db2:	42a7           	clr.l -(sp)
    2db4:	2f2f 003c      	move.l 60(sp),-(sp)
    2db8:	4879 0001 74d8 	pea 174d8 <destlinezoom9>
    2dbe:	4e95           	jsr (a5)
    2dc0:	4fef 0010      	lea 16(sp),sp
    2dc4:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    2dc8:	7cff           	moveq #-1,d6
    2dca:	2e0a           	move.l a2,d7
    2dcc:	246f 0048      	movea.l 72(sp),a2
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2dd0:	7a00           	moveq #0,d5
    2dd2:	3a06           	move.w d6,d5
    2dd4:	2f0e           	move.l a6,-(sp)
    2dd6:	2f05           	move.l d5,-(sp)
    2dd8:	2f0a           	move.l a2,-(sp)
    2dda:	4879 0001 74d8 	pea 174d8 <destlinezoom9>
    2de0:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2de2:	486e 0001      	pea 1(a6)
    2de6:	2f05           	move.l d5,-(sp)
    2de8:	486a 0030      	pea 48(a2)
    2dec:	4879 0001 74d8 	pea 174d8 <destlinezoom9>
    2df2:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2df4:	4646           	not.w d6
    2df6:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2df8:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<3;i++) {
    2dfc:	4fef 0020      	lea 32(sp),sp
    2e00:	7007           	moveq #7,d0
    2e02:	b08e           	cmp.l a6,d0
    2e04:	66ca           	bne.s 2dd0 <ZoomTest+0x16de>
    2e06:	2a2f 004c      	move.l 76(sp),d5
    2e0a:	307c 0014      	movea.w #20,a0
    2e0e:	2f43 0030      	move.l d3,48(sp)
    2e12:	2f4b 0048      	move.l a3,72(sp)
    2e16:	2f47 004c      	move.l d7,76(sp)
    2e1a:	2448           	movea.l a0,a2
    2e1c:	2004           	move.l d4,d0
    2e1e:	2802           	move.l d2,d4
    2e20:	3406           	move.w d6,d2
    2e22:	2c00           	move.l d0,d6
    2e24:	2c45           	movea.l d5,a6
    2e26:	4dee fe50      	lea -432(a6),a6
    2e2a:	47ea fff7      	lea -9(a2),a3
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    2e2e:	2f0b           	move.l a3,-(sp)
    2e30:	3f02           	move.w d2,-(sp)
    2e32:	4267           	clr.w -(sp)
    2e34:	2f0e           	move.l a6,-(sp)
    2e36:	4879 0001 74d8 	pea 174d8 <destlinezoom9>
    2e3c:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2e3e:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2e42:	4642           	not.w d2
    2e44:	528b           	addq.l #1,a3
    for(int i2=0;i2<9;i2++) {  
    2e46:	4fef 0010      	lea 16(sp),sp
    2e4a:	ba8e           	cmp.l a6,d5
    2e4c:	66e0           	bne.s 2e2e <ZoomTest+0x173c>
    2e4e:	2e0a           	move.l a2,d7
    2e50:	47ea 0009      	lea 9(a2),a3
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    2e54:	7600           	moveq #0,d3
    2e56:	3602           	move.w d2,d3
    2e58:	2f07           	move.l d7,-(sp)
    2e5a:	2f03           	move.l d3,-(sp)
    2e5c:	2f0e           	move.l a6,-(sp)
    2e5e:	4879 0001 74d8 	pea 174d8 <destlinezoom9>
    2e64:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    2e66:	5287           	addq.l #1,d7
    2e68:	2f07           	move.l d7,-(sp)
    2e6a:	2f03           	move.l d3,-(sp)
    2e6c:	486e 0030      	pea 48(a6)
    2e70:	4879 0001 74d8 	pea 174d8 <destlinezoom9>
    2e76:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    2e78:	4642           	not.w d2
      valactual += ZMLINESIZE/2;
    2e7a:	4dee 0060      	lea 96(a6),a6
    for(int i2=0;i2<9;i2++) {
    2e7e:	4fef 0020      	lea 32(sp),sp
    2e82:	be8b           	cmp.l a3,d7
    2e84:	66ce           	bne.s 2e54 <ZoomTest+0x1762>
    2e86:	0685 0000 0510 	addi.l #1296,d5
    2e8c:	45ea 001b      	lea 27(a2),a2
  for(int i=0;i<9;i++) {
    2e90:	b4fc 0107      	cmpa.w #263,a2
    2e94:	668e           	bne.s 2e24 <ZoomTest+0x1732>
    2e96:	262f 0030      	move.l 48(sp),d3
    2e9a:	266f 0048      	movea.l 72(sp),a3
    2e9e:	246f 004c      	movea.l 76(sp),a2
    2ea2:	2006           	move.l d6,d0
    2ea4:	3c02           	move.w d2,d6
    2ea6:	2404           	move.l d4,d2
    2ea8:	2800           	move.l d0,d4
    2eaa:	41ec 2ee4      	lea 12004(a4),a0
    2eae:	2f48 0030      	move.l a0,48(sp)
    2eb2:	2c48           	movea.l a0,a6
    TestRow( valsupposed, valactual, mask, 245+i2);
    2eb4:	2f0a           	move.l a2,-(sp)
    2eb6:	3f06           	move.w d6,-(sp)
    2eb8:	4267           	clr.w -(sp)
    2eba:	2f0e           	move.l a6,-(sp)
    2ebc:	4879 0001 74d8 	pea 174d8 <destlinezoom9>
    2ec2:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2ec4:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2ec8:	4646           	not.w d6
    2eca:	528a           	addq.l #1,a2
  for(int i2=0;i2<9;i2++) {  
    2ecc:	4fef 0010      	lea 16(sp),sp
    2ed0:	b4fc 00fe      	cmpa.w #254,a2
    2ed4:	66de           	bne.s 2eb4 <ZoomTest+0x17c2>
    2ed6:	45ec 3094      	lea 12436(a4),a2
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    2eda:	7a00           	moveq #0,d5
    2edc:	3a06           	move.w d6,d5
    2ede:	2f0b           	move.l a3,-(sp)
    2ee0:	2f05           	move.l d5,-(sp)
    2ee2:	2f0a           	move.l a2,-(sp)
    2ee4:	4879 0001 74d8 	pea 174d8 <destlinezoom9>
    2eea:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    2eec:	486b 0001      	pea 1(a3)
    2ef0:	2f05           	move.l d5,-(sp)
    2ef2:	486a 0030      	pea 48(a2)
    2ef6:	4879 0001 74d8 	pea 174d8 <destlinezoom9>
    2efc:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2efe:	4646           	not.w d6
    2f00:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    2f02:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<5;i++) {
    2f06:	4fef 0020      	lea 32(sp),sp
    2f0a:	b6fc 010d      	cmpa.w #269,a3
    2f0e:	66ca           	bne.s 2eda <ZoomTest+0x17e8>
  TestRow( valsupposed, valactual, mask, 269);
    2f10:	2f0b           	move.l a3,-(sp)
    2f12:	3f06           	move.w d6,-(sp)
    2f14:	4267           	clr.w -(sp)
    2f16:	2f2f 0044      	move.l 68(sp),-(sp)
    2f1a:	4879 0001 74d8 	pea 174d8 <destlinezoom9>
    2f20:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    2f22:	4878 0001      	pea 1 <_start+0x1>
    2f26:	4878 0009      	pea 9 <main+0x3>
    2f2a:	2f03           	move.l d3,-(sp)
    2f2c:	2f0c           	move.l a4,-(sp)
    2f2e:	4eba de58      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2f32:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    2f38:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2f3c:	4fef 001c      	lea 28(sp),sp
    2f40:	4297           	clr.l (sp)
    2f42:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2f48:	2f2f 0034      	move.l 52(sp),-(sp)
    2f4c:	4879 0001 74ac 	pea 174ac <destlinezoom10>
    2f52:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 1);   
    2f54:	4878 0001      	pea 1 <_start+0x1>
    2f58:	42a7           	clr.l -(sp)
    2f5a:	2f2f 0058      	move.l 88(sp),-(sp)
    2f5e:	4879 0001 74ac 	pea 174ac <destlinezoom10>
    2f64:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 2);
    2f66:	4fef 0020      	lea 32(sp),sp
    2f6a:	4878 0002      	pea 2 <_start+0x2>
    2f6e:	42a7           	clr.l -(sp)
    2f70:	2f2f 0058      	move.l 88(sp),-(sp)
    2f74:	4879 0001 74ac 	pea 174ac <destlinezoom10>
    2f7a:	4e95           	jsr (a5)
  for(int i=0;i<9;i++) {
    2f7c:	2a2f 0070      	move.l 112(sp),d5
    2f80:	4fef 0010      	lea 16(sp),sp
  mask = mask ^ 0xffff;
    2f84:	7eff           	moveq #-1,d7
    2f86:	2644           	movea.l d4,a3
    2f88:	2445           	movea.l d5,a2
    2f8a:	45ea fe80      	lea -384(a2),a2
    2f8e:	280b           	move.l a3,d4
    2f90:	5184           	subq.l #8,d4
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    2f92:	2f04           	move.l d4,-(sp)
    2f94:	3f07           	move.w d7,-(sp)
    2f96:	4267           	clr.w -(sp)
    2f98:	2f0a           	move.l a2,-(sp)
    2f9a:	4879 0001 74ac 	pea 174ac <destlinezoom10>
    2fa0:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2fa2:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2fa6:	4647           	not.w d7
    2fa8:	5284           	addq.l #1,d4
    for(int i2=0;i2<8;i2++) {  
    2faa:	4fef 0010      	lea 16(sp),sp
    2fae:	ba8a           	cmp.l a2,d5
    2fb0:	66e0           	bne.s 2f92 <ZoomTest+0x18a0>
    2fb2:	280b           	move.l a3,d4
    2fb4:	4dea 03c0      	lea 960(a2),a6
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    2fb8:	7c00           	moveq #0,d6
    2fba:	3c07           	move.w d7,d6
    2fbc:	2f04           	move.l d4,-(sp)
    2fbe:	2f06           	move.l d6,-(sp)
    2fc0:	2f0a           	move.l a2,-(sp)
    2fc2:	4879 0001 74ac 	pea 174ac <destlinezoom10>
    2fc8:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    2fca:	2f04           	move.l d4,-(sp)
    2fcc:	2f06           	move.l d6,-(sp)
    2fce:	486a 0030      	pea 48(a2)
    2fd2:	4879 0001 74ac 	pea 174ac <destlinezoom10>
    2fd8:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2fda:	45ea 0060      	lea 96(a2),a2
      mask = mask ^ 0xffff;
    2fde:	4647           	not.w d7
    2fe0:	5284           	addq.l #1,d4
    for(int i2=0;i2<10;i2++) {
    2fe2:	4fef 0020      	lea 32(sp),sp
    2fe6:	bdca           	cmpa.l a2,a6
    2fe8:	66ce           	bne.s 2fb8 <ZoomTest+0x18c6>
    2fea:	0685 0000 0540 	addi.l #1344,d5
    2ff0:	47eb 001c      	lea 28(a3),a3
  for(int i=0;i<9;i++) {
    2ff4:	b6fc 0107      	cmpa.w #263,a3
    2ff8:	668e           	bne.s 2f88 <ZoomTest+0x1896>
    2ffa:	246f 0064      	movea.l 100(sp),a2
    TestRow( valsupposed, valactual, mask, 255+i2);
    2ffe:	2f02           	move.l d2,-(sp)
    3000:	3f07           	move.w d7,-(sp)
    3002:	4267           	clr.w -(sp)
    3004:	2f0a           	move.l a2,-(sp)
    3006:	4879 0001 74ac 	pea 174ac <destlinezoom10>
    300c:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    300e:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    3012:	4647           	not.w d7
    3014:	5282           	addq.l #1,d2
  for(int i2=0;i2<8;i2++) {  
    3016:	4fef 0010      	lea 16(sp),sp
    301a:	0c82 0000 0107 	cmpi.l #263,d2
    3020:	66dc           	bne.s 2ffe <ZoomTest+0x190c>
    3022:	2c43           	movea.l d3,a6
    3024:	4dee 3154      	lea 12628(a6),a6
    3028:	347c 0108      	movea.w #264,a2
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    302c:	7400           	moveq #0,d2
    302e:	3407           	move.w d7,d2
    3030:	486a ffff      	pea -1(a2)
    3034:	2f02           	move.l d2,-(sp)
    3036:	2f0e           	move.l a6,-(sp)
    3038:	4879 0001 74ac 	pea 174ac <destlinezoom10>
    303e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    3040:	2f0a           	move.l a2,-(sp)
    3042:	2f02           	move.l d2,-(sp)
    3044:	486e 0030      	pea 48(a6)
    3048:	4879 0001 74ac 	pea 174ac <destlinezoom10>
    304e:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3050:	4647           	not.w d7
    3052:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3054:	4dee 0060      	lea 96(a6),a6
  for(int i=0;i<3;i++) {
    3058:	4fef 0020      	lea 32(sp),sp
    305c:	b4fc 010e      	cmpa.w #270,a2
    3060:	66ca           	bne.s 302c <ZoomTest+0x193a>
  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    3062:	4878 0001      	pea 1 <_start+0x1>
    3066:	4878 000a      	pea a <main+0x4>
    306a:	2f0c           	move.l a4,-(sp)
    306c:	2f03           	move.l d3,-(sp)
    306e:	4eba dd18      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3072:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    3078:	4eae ff1c      	jsr -228(a6)
    307c:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    3080:	246f 0034      	movea.l 52(sp),a2
  for(int i2=0;i2<6;i2++) {  
    3084:	7800           	moveq #0,d4
  mask = 0xffff;
    3086:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, i2);
    3088:	2f04           	move.l d4,-(sp)
    308a:	3f02           	move.w d2,-(sp)
    308c:	4267           	clr.w -(sp)
    308e:	2f0a           	move.l a2,-(sp)
    3090:	4879 0001 7480 	pea 17480 <destlinezoom11>
    3096:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3098:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    309c:	4642           	not.w d2
  for(int i2=0;i2<6;i2++) {  
    309e:	5284           	addq.l #1,d4
    30a0:	4fef 0010      	lea 16(sp),sp
    30a4:	7006           	moveq #6,d0
    30a6:	b084           	cmp.l d4,d0
    30a8:	66de           	bne.s 3088 <ZoomTest+0x1996>
    30aa:	266f 0054      	movea.l 84(sp),a3
    30ae:	347c 0006      	movea.w #6,a2
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    30b2:	7800           	moveq #0,d4
    30b4:	3802           	move.w d2,d4
    30b6:	2f0a           	move.l a2,-(sp)
    30b8:	2f04           	move.l d4,-(sp)
    30ba:	2f0b           	move.l a3,-(sp)
    30bc:	4879 0001 7480 	pea 17480 <destlinezoom11>
    30c2:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    30c4:	486a 0001      	pea 1(a2)
    30c8:	2f04           	move.l d4,-(sp)
    30ca:	486b 0030      	pea 48(a3)
    30ce:	4879 0001 7480 	pea 17480 <destlinezoom11>
    30d4:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    30d6:	4642           	not.w d2
    30d8:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    30da:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<11;i2++) {
    30de:	4fef 0020      	lea 32(sp),sp
    30e2:	721c           	moveq #28,d1
    30e4:	b28a           	cmp.l a2,d1
    30e6:	66ca           	bne.s 30b2 <ZoomTest+0x19c0>
    30e8:	280c           	move.l a4,d4
    30ea:	0684 0000 0694 	addi.l #1684,d4
    30f0:	347c 0023      	movea.w #35,a2
    30f4:	2644           	movea.l d4,a3
    30f6:	47eb feb0      	lea -336(a3),a3
    30fa:	2a0a           	move.l a2,d5
    30fc:	5f85           	subq.l #7,d5
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    30fe:	2f05           	move.l d5,-(sp)
    3100:	3f02           	move.w d2,-(sp)
    3102:	4267           	clr.w -(sp)
    3104:	2f0b           	move.l a3,-(sp)
    3106:	4879 0001 7480 	pea 17480 <destlinezoom11>
    310c:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    310e:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    3112:	4642           	not.w d2
    3114:	5285           	addq.l #1,d5
    for(int i2=0;i2<7;i2++) {  
    3116:	4fef 0010      	lea 16(sp),sp
    311a:	b88b           	cmp.l a3,d4
    311c:	66e0           	bne.s 30fe <ZoomTest+0x1a0c>
    311e:	2c4a           	movea.l a2,a6
    3120:	2c0b           	move.l a3,d6
    3122:	0686 0000 0420 	addi.l #1056,d6
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    3128:	7a00           	moveq #0,d5
    312a:	3a02           	move.w d2,d5
    312c:	2f0e           	move.l a6,-(sp)
    312e:	2f05           	move.l d5,-(sp)
    3130:	2f0b           	move.l a3,-(sp)
    3132:	4879 0001 7480 	pea 17480 <destlinezoom11>
    3138:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    313a:	486e ffe8      	pea -24(a6)
    313e:	2f05           	move.l d5,-(sp)
    3140:	486b 0030      	pea 48(a3)
    3144:	4879 0001 7480 	pea 17480 <destlinezoom11>
    314a:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    314c:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    3150:	4642           	not.w d2
    3152:	548e           	addq.l #2,a6
    for(int i2=0;i2<11;i2++) {
    3154:	4fef 0020      	lea 32(sp),sp
    3158:	bc8b           	cmp.l a3,d6
    315a:	66cc           	bne.s 3128 <ZoomTest+0x1a36>
    315c:	0684 0000 0570 	addi.l #1392,d4
    3162:	45ea 001d      	lea 29(a2),a2
  for(int i=0;i<8;i++) {
    3166:	b4fc 010b      	cmpa.w #267,a2
    316a:	6688           	bne.s 30f4 <ZoomTest+0x1a02>
    316c:	45ec 30c4      	lea 12484(a4),a2
    3170:	2a3c 0000 0104 	move.l #260,d5
    TestRow( valsupposed, valactual, mask, 260+i2);
    3176:	7800           	moveq #0,d4
    3178:	3802           	move.w d2,d4
    317a:	2f05           	move.l d5,-(sp)
    317c:	2f04           	move.l d4,-(sp)
    317e:	2f0a           	move.l a2,-(sp)
    3180:	4879 0001 7480 	pea 17480 <destlinezoom11>
    3186:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3188:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    318c:	4642           	not.w d2
    318e:	5285           	addq.l #1,d5
  for(int i2=0;i2<7;i2++) {  
    3190:	4fef 0010      	lea 16(sp),sp
    3194:	0c85 0000 010b 	cmpi.l #267,d5
    319a:	66da           	bne.s 3176 <ZoomTest+0x1a84>
    319c:	0282 0000 ffff 	andi.l #65535,d2
  TestRow( valsupposed, valactual, mask, 267);   
    31a2:	2f05           	move.l d5,-(sp)
    31a4:	2f02           	move.l d2,-(sp)
    31a6:	2f2f 0060      	move.l 96(sp),-(sp)
    31aa:	4879 0001 7480 	pea 17480 <destlinezoom11>
    31b0:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 268);
    31b2:	4878 010c      	pea 10c <main+0x106>
    31b6:	2f02           	move.l d2,-(sp)
    31b8:	2f2f 0074      	move.l 116(sp),-(sp)
    31bc:	4879 0001 7480 	pea 17480 <destlinezoom11>
    31c2:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 269);
    31c4:	4fef 0020      	lea 32(sp),sp
    31c8:	4878 010d      	pea 10d <main+0x107>
    31cc:	2f04           	move.l d4,-(sp)
    31ce:	2f2f 0044      	move.l 68(sp),-(sp)
    31d2:	4879 0001 7480 	pea 17480 <destlinezoom11>
    31d8:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    31da:	4878 0001      	pea 1 <_start+0x1>
    31de:	4878 000b      	pea b <main+0x5>
    31e2:	2f03           	move.l d3,-(sp)
    31e4:	2f0c           	move.l a4,-(sp)
    31e6:	4eba dba0      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    31ea:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    31f0:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    31f4:	4fef 001c      	lea 28(sp),sp
    31f8:	4297           	clr.l (sp)
    31fa:	42a7           	clr.l -(sp)
    31fc:	2f2f 0034      	move.l 52(sp),-(sp)
    3200:	4879 0001 7454 	pea 17454 <destlinezoom12>
    3206:	4e95           	jsr (a5)
    3208:	4fef 0010      	lea 16(sp),sp
    320c:	282f 0038      	move.l 56(sp),d4
  valactual += ZMLINESIZE/2;
    3210:	266f 0040      	movea.l 64(sp),a3
  TestRow( valsupposed, valactual, mask, 0);
    3214:	347c 0001      	movea.w #1,a2
  mask = mask ^ 0xffff;
    3218:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    321a:	7a00           	moveq #0,d5
    321c:	3a02           	move.w d2,d5
    321e:	2f0a           	move.l a2,-(sp)
    3220:	2f05           	move.l d5,-(sp)
    3222:	2f0b           	move.l a3,-(sp)
    3224:	4879 0001 7454 	pea 17454 <destlinezoom12>
    322a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    322c:	486a 0001      	pea 1(a2)
    3230:	2f05           	move.l d5,-(sp)
    3232:	486b 0030      	pea 48(a3)
    3236:	4879 0001 7454 	pea 17454 <destlinezoom12>
    323c:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    323e:	4642           	not.w d2
    3240:	548a           	addq.l #2,a2
  for(int i2=0;i2<12;i2++) {
    3242:	4fef 0020      	lea 32(sp),sp
    3246:	7019           	moveq #25,d0
    3248:	b08a           	cmp.l a2,d0
    324a:	673e           	beq.s 328a <ZoomTest+0x1b98>
    324c:	200b           	move.l a3,d0
    324e:	0680 0000 00c0 	addi.l #192,d0
    3254:	2644           	movea.l d4,a3
    3256:	2800           	move.l d0,d4
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3258:	7a00           	moveq #0,d5
    325a:	3a02           	move.w d2,d5
    325c:	2f0a           	move.l a2,-(sp)
    325e:	2f05           	move.l d5,-(sp)
    3260:	2f0b           	move.l a3,-(sp)
    3262:	4879 0001 7454 	pea 17454 <destlinezoom12>
    3268:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    326a:	486a 0001      	pea 1(a2)
    326e:	2f05           	move.l d5,-(sp)
    3270:	486b 0030      	pea 48(a3)
    3274:	4879 0001 7454 	pea 17454 <destlinezoom12>
    327a:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    327c:	4642           	not.w d2
    327e:	548a           	addq.l #2,a2
  for(int i2=0;i2<12;i2++) {
    3280:	4fef 0020      	lea 32(sp),sp
    3284:	7019           	moveq #25,d0
    3286:	b08a           	cmp.l a2,d0
    3288:	66c2           	bne.s 324c <ZoomTest+0x1b5a>
    328a:	2a04           	move.l d4,d5
    328c:	0685 0000 0120 	addi.l #288,d5
    3292:	347c 001f      	movea.w #31,a2
    3296:	2645           	movea.l d5,a3
    3298:	47eb fee0      	lea -288(a3),a3
    329c:	2c0a           	move.l a2,d6
    329e:	5d86           	subq.l #6,d6
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    32a0:	2f06           	move.l d6,-(sp)
    32a2:	3f02           	move.w d2,-(sp)
    32a4:	4267           	clr.w -(sp)
    32a6:	2f0b           	move.l a3,-(sp)
    32a8:	4879 0001 7454 	pea 17454 <destlinezoom12>
    32ae:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    32b0:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    32b4:	4642           	not.w d2
    32b6:	5286           	addq.l #1,d6
    for(int i2=0;i2<6;i2++) {  
    32b8:	4fef 0010      	lea 16(sp),sp
    32bc:	ba8b           	cmp.l a3,d5
    32be:	66e0           	bne.s 32a0 <ZoomTest+0x1bae>
    32c0:	2c4a           	movea.l a2,a6
    32c2:	2e0b           	move.l a3,d7
    32c4:	0687 0000 0480 	addi.l #1152,d7
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    32ca:	7c00           	moveq #0,d6
    32cc:	3c02           	move.w d2,d6
    32ce:	2f0e           	move.l a6,-(sp)
    32d0:	2f06           	move.l d6,-(sp)
    32d2:	2f0b           	move.l a3,-(sp)
    32d4:	4879 0001 7454 	pea 17454 <destlinezoom12>
    32da:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    32dc:	486e 0001      	pea 1(a6)
    32e0:	2f06           	move.l d6,-(sp)
    32e2:	486b 0030      	pea 48(a3)
    32e6:	4879 0001 7454 	pea 17454 <destlinezoom12>
    32ec:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    32ee:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    32f2:	4642           	not.w d2
    32f4:	548e           	addq.l #2,a6
    for(int i2=0;i2<12;i2++) {
    32f6:	4fef 0020      	lea 32(sp),sp
    32fa:	be8b           	cmp.l a3,d7
    32fc:	66cc           	bne.s 32ca <ZoomTest+0x1bd8>
    32fe:	0685 0000 05a0 	addi.l #1440,d5
    3304:	45ea 001e      	lea 30(a2),a2
  for(int i=0;i<8;i++) {
    3308:	b4fc 010f      	cmpa.w #271,a2
    330c:	6688           	bne.s 3296 <ZoomTest+0x1ba4>
    330e:	2444           	movea.l d4,a2
    3310:	45ea 2d00      	lea 11520(a2),a2
    3314:	283c 0000 0104 	move.l #260,d4
    TestRow( valsupposed, valactual, mask, 260+i2);
    331a:	2f04           	move.l d4,-(sp)
    331c:	3f02           	move.w d2,-(sp)
    331e:	4267           	clr.w -(sp)
    3320:	2f0a           	move.l a2,-(sp)
    3322:	4879 0001 7454 	pea 17454 <destlinezoom12>
    3328:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    332a:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    332e:	4642           	not.w d2
    3330:	5284           	addq.l #1,d4
  for(int i2=0;i2<5;i2++) {  
    3332:	4fef 0010      	lea 16(sp),sp
    3336:	0c84 0000 0109 	cmpi.l #265,d4
    333c:	66dc           	bne.s 331a <ZoomTest+0x1c28>
  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    333e:	4878 0001      	pea 1 <_start+0x1>
    3342:	4878 000c      	pea c <main+0x6>
    3346:	2f0c           	move.l a4,-(sp)
    3348:	2f03           	move.l d3,-(sp)
    334a:	4eba da3c      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    334e:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    3354:	4eae ff1c      	jsr -228(a6)
    3358:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    335c:	266f 0034      	movea.l 52(sp),a3
  WaitBlit();
    3360:	347c 0001      	movea.w #1,a2
  mask = 0xffff;
    3364:	7cff           	moveq #-1,d6
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3366:	7400           	moveq #0,d2
    3368:	3406           	move.w d6,d2
    336a:	486a ffff      	pea -1(a2)
    336e:	2f02           	move.l d2,-(sp)
    3370:	2f0b           	move.l a3,-(sp)
    3372:	4879 0001 7428 	pea 17428 <destlinezoom13>
    3378:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    337a:	2f0a           	move.l a2,-(sp)
    337c:	2f02           	move.l d2,-(sp)
    337e:	486b 0030      	pea 48(a3)
    3382:	4879 0001 7428 	pea 17428 <destlinezoom13>
    3388:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    338a:	4646           	not.w d6
    338c:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    338e:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<11;i2++) {
    3392:	4fef 0020      	lea 32(sp),sp
    3396:	7217           	moveq #23,d1
    3398:	b28a           	cmp.l a2,d1
    339a:	66ca           	bne.s 3366 <ZoomTest+0x1c74>
    339c:	240c           	move.l a4,d2
    339e:	0682 0000 0514 	addi.l #1300,d2
    33a4:	3c7c 001b      	movea.w #27,a6
    33a8:	2a0a           	move.l a2,d5
    33aa:	2642           	movea.l d2,a3
    33ac:	47eb ff10      	lea -240(a3),a3
    33b0:	280e           	move.l a6,d4
    33b2:	5b84           	subq.l #5,d4
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    33b4:	2f04           	move.l d4,-(sp)
    33b6:	3f06           	move.w d6,-(sp)
    33b8:	4267           	clr.w -(sp)
    33ba:	2f0b           	move.l a3,-(sp)
    33bc:	4879 0001 7428 	pea 17428 <destlinezoom13>
    33c2:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    33c4:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    33c8:	4646           	not.w d6
    33ca:	5284           	addq.l #1,d4
    for(int i2=0;i2<5;i2++) {  
    33cc:	4fef 0010      	lea 16(sp),sp
    33d0:	b48b           	cmp.l a3,d2
    33d2:	66e0           	bne.s 33b4 <ZoomTest+0x1cc2>
    33d4:	244e           	movea.l a6,a2
    33d6:	2e0b           	move.l a3,d7
    33d8:	0687 0000 04e0 	addi.l #1248,d7
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    33de:	7800           	moveq #0,d4
    33e0:	3806           	move.w d6,d4
    33e2:	2f0a           	move.l a2,-(sp)
    33e4:	2f04           	move.l d4,-(sp)
    33e6:	2f0b           	move.l a3,-(sp)
    33e8:	4879 0001 7428 	pea 17428 <destlinezoom13>
    33ee:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    33f0:	486a 0001      	pea 1(a2)
    33f4:	2f04           	move.l d4,-(sp)
    33f6:	486b 0030      	pea 48(a3)
    33fa:	4879 0001 7428 	pea 17428 <destlinezoom13>
    3400:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3402:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    3406:	4646           	not.w d6
    3408:	548a           	addq.l #2,a2
    for(int i2=0;i2<13;i2++) {
    340a:	4fef 0020      	lea 32(sp),sp
    340e:	be8b           	cmp.l a3,d7
    3410:	66cc           	bne.s 33de <ZoomTest+0x1cec>
    3412:	0682 0000 05d0 	addi.l #1488,d2
    3418:	4dee 001f      	lea 31(a6),a6
  for(int i=0;i<8;i++) {
    341c:	bcfc 0113      	cmpa.w #275,a6
    3420:	6688           	bne.s 33aa <ZoomTest+0x1cb8>
    3422:	2445           	movea.l d5,a2
  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    3424:	4878 0001      	pea 1 <_start+0x1>
    3428:	4878 000d      	pea d <main+0x7>
    342c:	2f03           	move.l d3,-(sp)
    342e:	2f0c           	move.l a4,-(sp)
    3430:	4eba d956      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3434:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    343a:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);   
    343e:	42a7           	clr.l -(sp)
    3440:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3446:	2f2f 0044      	move.l 68(sp),-(sp)
    344a:	4879 0001 73fc 	pea 173fc <destlinezoom14>
    3450:	4e95           	jsr (a5)
    3452:	4fef 0020      	lea 32(sp),sp
    3456:	242f 0038      	move.l 56(sp),d2
  valactual += ZMLINESIZE/2; 
    345a:	2c6f 0040      	movea.l 64(sp),a6
  TestRow( valsupposed, valactual, mask, 0);   
    345e:	367c 0001      	movea.w #1,a3
  mask = mask ^ 0xffff; 
    3462:	4247           	clr.w d7
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3464:	7800           	moveq #0,d4
    3466:	3807           	move.w d7,d4
    3468:	2f0b           	move.l a3,-(sp)
    346a:	2f04           	move.l d4,-(sp)
    346c:	2f0e           	move.l a6,-(sp)
    346e:	4879 0001 73fc 	pea 173fc <destlinezoom14>
    3474:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3476:	486b 0001      	pea 1(a3)
    347a:	2f04           	move.l d4,-(sp)
    347c:	486e 0030      	pea 48(a6)
    3480:	4879 0001 73fc 	pea 173fc <destlinezoom14>
    3486:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3488:	4647           	not.w d7
    348a:	548b           	addq.l #2,a3
  for(int i2=0;i2<9;i2++) {
    348c:	4fef 0020      	lea 32(sp),sp
    3490:	7013           	moveq #19,d0
    3492:	b08b           	cmp.l a3,d0
    3494:	673e           	beq.s 34d4 <ZoomTest+0x1de2>
    3496:	200e           	move.l a6,d0
    3498:	0680 0000 00c0 	addi.l #192,d0
    349e:	2c42           	movea.l d2,a6
    34a0:	2400           	move.l d0,d2
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    34a2:	7800           	moveq #0,d4
    34a4:	3807           	move.w d7,d4
    34a6:	2f0b           	move.l a3,-(sp)
    34a8:	2f04           	move.l d4,-(sp)
    34aa:	2f0e           	move.l a6,-(sp)
    34ac:	4879 0001 73fc 	pea 173fc <destlinezoom14>
    34b2:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    34b4:	486b 0001      	pea 1(a3)
    34b8:	2f04           	move.l d4,-(sp)
    34ba:	486e 0030      	pea 48(a6)
    34be:	4879 0001 73fc 	pea 173fc <destlinezoom14>
    34c4:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    34c6:	4647           	not.w d7
    34c8:	548b           	addq.l #2,a3
  for(int i2=0;i2<9;i2++) {
    34ca:	4fef 0020      	lea 32(sp),sp
    34ce:	7013           	moveq #19,d0
    34d0:	b08b           	cmp.l a3,d0
    34d2:	66c2           	bne.s 3496 <ZoomTest+0x1da4>
    34d4:	2802           	move.l d2,d4
    34d6:	0684 0000 00c0 	addi.l #192,d4
    34dc:	2c0b           	move.l a3,d6
    34de:	2c44           	movea.l d4,a6
    34e0:	4dee ff40      	lea -192(a6),a6
    34e4:	2a0a           	move.l a2,d5
    34e6:	5985           	subq.l #4,d5
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    34e8:	2f05           	move.l d5,-(sp)
    34ea:	3f07           	move.w d7,-(sp)
    34ec:	4267           	clr.w -(sp)
    34ee:	2f0e           	move.l a6,-(sp)
    34f0:	4879 0001 73fc 	pea 173fc <destlinezoom14>
    34f6:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    34f8:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    34fc:	4647           	not.w d7
    34fe:	5285           	addq.l #1,d5
    for(int i2=0;i2<4;i2++) {  
    3500:	4fef 0010      	lea 16(sp),sp
    3504:	b88e           	cmp.l a6,d4
    3506:	66e0           	bne.s 34e8 <ZoomTest+0x1df6>
    3508:	264a           	movea.l a2,a3
    350a:	41ee 0540      	lea 1344(a6),a0
    350e:	2f48 003c      	move.l a0,60(sp)
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    3512:	7a00           	moveq #0,d5
    3514:	3a07           	move.w d7,d5
    3516:	2f0b           	move.l a3,-(sp)
    3518:	2f05           	move.l d5,-(sp)
    351a:	2f0e           	move.l a6,-(sp)
    351c:	4879 0001 73fc 	pea 173fc <destlinezoom14>
    3522:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    3524:	486b 0001      	pea 1(a3)
    3528:	2f05           	move.l d5,-(sp)
    352a:	486e 0030      	pea 48(a6)
    352e:	4879 0001 73fc 	pea 173fc <destlinezoom14>
    3534:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3536:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    353a:	4647           	not.w d7
    353c:	548b           	addq.l #2,a3
    for(int i2=0;i2<14;i2++) {
    353e:	4fef 0020      	lea 32(sp),sp
    3542:	bdef 003c      	cmpa.l 60(sp),a6
    3546:	66ca           	bne.s 3512 <ZoomTest+0x1e20>
    3548:	0684 0000 0600 	addi.l #1536,d4
    354e:	45ea 0020      	lea 32(a2),a2
  for(int i=0;i<7;i++) {
    3552:	b4fc 00f7      	cmpa.w #247,a2
    3556:	6686           	bne.s 34de <ZoomTest+0x1dec>
    3558:	2646           	movea.l d6,a3
    355a:	2c42           	movea.l d2,a6
    355c:	4dee 2a00      	lea 10752(a6),a6
    3560:	347c 00f3      	movea.w #243,a2
    TestRow( valsupposed, valactual, mask, 243+i2);
    3564:	2f0a           	move.l a2,-(sp)
    3566:	3f07           	move.w d7,-(sp)
    3568:	4267           	clr.w -(sp)
    356a:	2f0e           	move.l a6,-(sp)
    356c:	4879 0001 73fc 	pea 173fc <destlinezoom14>
    3572:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3574:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    3578:	4647           	not.w d7
    357a:	528a           	addq.l #1,a2
  for(int i2=0;i2<4;i2++) {  
    357c:	4fef 0010      	lea 16(sp),sp
    3580:	b4fc 00f7      	cmpa.w #247,a2
    3584:	66de           	bne.s 3564 <ZoomTest+0x1e72>
    3586:	0682 0000 2ac0 	addi.l #10944,d2
    358c:	2c4a           	movea.l a2,a6
    358e:	280a           	move.l a2,d4
    3590:	2442           	movea.l d2,a2
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    3592:	7400           	moveq #0,d2
    3594:	3407           	move.w d7,d2
    3596:	2f0e           	move.l a6,-(sp)
    3598:	2f02           	move.l d2,-(sp)
    359a:	2f0a           	move.l a2,-(sp)
    359c:	4879 0001 73fc 	pea 173fc <destlinezoom14>
    35a2:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    35a4:	486e 0001      	pea 1(a6)
    35a8:	2f02           	move.l d2,-(sp)
    35aa:	486a 0030      	pea 48(a2)
    35ae:	4879 0001 73fc 	pea 173fc <destlinezoom14>
    35b4:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    35b6:	4647           	not.w d7
    35b8:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    35ba:	45ea 0060      	lea 96(a2),a2
  for(int i2=0;i2<12;i2++) {
    35be:	4fef 0020      	lea 32(sp),sp
    35c2:	bcfc 010f      	cmpa.w #271,a6
    35c6:	66ca           	bne.s 3592 <ZoomTest+0x1ea0>
  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    35c8:	4878 0001      	pea 1 <_start+0x1>
    35cc:	4878 000e      	pea e <main+0x8>
    35d0:	2f0c           	move.l a4,-(sp)
    35d2:	2f03           	move.l d3,-(sp)
    35d4:	4eba d7b2      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    35d8:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    35de:	4eae ff1c      	jsr -228(a6)
    35e2:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    35e6:	242f 0034      	move.l 52(sp),d2
  WaitBlit();
    35ea:	3c7c 0001      	movea.w #1,a6
  mask = 0x0000;
    35ee:	4246           	clr.w d6
    35f0:	2442           	movea.l d2,a2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    35f2:	7400           	moveq #0,d2
    35f4:	3406           	move.w d6,d2
    35f6:	486e ffff      	pea -1(a6)
    35fa:	2f02           	move.l d2,-(sp)
    35fc:	2f0a           	move.l a2,-(sp)
    35fe:	4879 0001 73d0 	pea 173d0 <destlinezoom15>
    3604:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3606:	2f0e           	move.l a6,-(sp)
    3608:	2f02           	move.l d2,-(sp)
    360a:	486a 0030      	pea 48(a2)
    360e:	4879 0001 73d0 	pea 173d0 <destlinezoom15>
    3614:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3616:	4646           	not.w d6
    3618:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    361a:	45ea 0060      	lea 96(a2),a2
  for(int i2=0;i2<8;i2++) {
    361e:	4fef 0020      	lea 32(sp),sp
    3622:	7011           	moveq #17,d0
    3624:	b08e           	cmp.l a6,d0
    3626:	66ca           	bne.s 35f2 <ZoomTest+0x1f00>
    3628:	2444           	movea.l d4,a2
    362a:	242f 0068      	move.l 104(sp),d2
    362e:	2c42           	movea.l d2,a6
    3630:	4dee ff70      	lea -144(a6),a6
    3634:	280b           	move.l a3,d4
    3636:	5784           	subq.l #3,d4
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    3638:	2f04           	move.l d4,-(sp)
    363a:	3f06           	move.w d6,-(sp)
    363c:	4267           	clr.w -(sp)
    363e:	2f0e           	move.l a6,-(sp)
    3640:	4879 0001 73d0 	pea 173d0 <destlinezoom15>
    3646:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3648:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    364c:	4646           	not.w d6
    364e:	5284           	addq.l #1,d4
    for(int i2=0;i2<3;i2++) {  
    3650:	4fef 0010      	lea 16(sp),sp
    3654:	b48e           	cmp.l a6,d2
    3656:	66e0           	bne.s 3638 <ZoomTest+0x1f46>
    3658:	280b           	move.l a3,d4
    365a:	2e0e           	move.l a6,d7
    365c:	0687 0000 05a0 	addi.l #1440,d7
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    3662:	7a00           	moveq #0,d5
    3664:	3a06           	move.w d6,d5
    3666:	2f04           	move.l d4,-(sp)
    3668:	2f05           	move.l d5,-(sp)
    366a:	2f0e           	move.l a6,-(sp)
    366c:	4879 0001 73d0 	pea 173d0 <destlinezoom15>
    3672:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    3674:	2f04           	move.l d4,-(sp)
    3676:	2f05           	move.l d5,-(sp)
    3678:	486e 0030      	pea 48(a6)
    367c:	4879 0001 73d0 	pea 173d0 <destlinezoom15>
    3682:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3684:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    3688:	4646           	not.w d6
    368a:	5484           	addq.l #2,d4
    for(int i2=0;i2<15;i2++) {
    368c:	4fef 0020      	lea 32(sp),sp
    3690:	be8e           	cmp.l a6,d7
    3692:	66ce           	bne.s 3662 <ZoomTest+0x1f70>
    3694:	0682 0000 0630 	addi.l #1584,d2
    369a:	47eb 0021      	lea 33(a3),a3
  for(int i=0;i<7;i++) {
    369e:	b6fc 00fa      	cmpa.w #250,a3
    36a2:	668a           	bne.s 362e <ZoomTest+0x1f3c>
    36a4:	47ec 2e54      	lea 11860(a4),a3
    TestRow( valsupposed, valactual, mask, 247+i2);
    36a8:	2f0a           	move.l a2,-(sp)
    36aa:	3f06           	move.w d6,-(sp)
    36ac:	4267           	clr.w -(sp)
    36ae:	2f0b           	move.l a3,-(sp)
    36b0:	4879 0001 73d0 	pea 173d0 <destlinezoom15>
    36b6:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    36b8:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    36bc:	4646           	not.w d6
    36be:	528a           	addq.l #1,a2
  for(int i2=0;i2<3;i2++) {  
    36c0:	4fef 0010      	lea 16(sp),sp
    36c4:	b4fc 00fa      	cmpa.w #250,a2
    36c8:	66de           	bne.s 36a8 <ZoomTest+0x1fb6>
    36ca:	266f 0030      	movea.l 48(sp),a3
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    36ce:	7400           	moveq #0,d2
    36d0:	3406           	move.w d6,d2
    36d2:	2f0a           	move.l a2,-(sp)
    36d4:	2f02           	move.l d2,-(sp)
    36d6:	2f0b           	move.l a3,-(sp)
    36d8:	4879 0001 73d0 	pea 173d0 <destlinezoom15>
    36de:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    36e0:	486a 0001      	pea 1(a2)
    36e4:	2f02           	move.l d2,-(sp)
    36e6:	486b 0030      	pea 48(a3)
    36ea:	4879 0001 73d0 	pea 173d0 <destlinezoom15>
    36f0:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    36f2:	4646           	not.w d6
    36f4:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    36f6:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<10;i2++) {
    36fa:	4fef 0020      	lea 32(sp),sp
    36fe:	b4fc 010e      	cmpa.w #270,a2
    3702:	66ca           	bne.s 36ce <ZoomTest+0x1fdc>
  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    3704:	4878 0001      	pea 1 <_start+0x1>
    3708:	4878 000f      	pea f <main+0x9>
    370c:	2f03           	move.l d3,-(sp)
    370e:	2f0c           	move.l a4,-(sp)
    3710:	4eba d676      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3714:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    371a:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);   
    371e:	42a7           	clr.l -(sp)
    3720:	42a7           	clr.l -(sp)
    3722:	2f2f 0044      	move.l 68(sp),-(sp)
    3726:	4879 0001 73a4 	pea 173a4 <destlinezoom16>
    372c:	4e95           	jsr (a5)
    372e:	4fef 0020      	lea 32(sp),sp
    3732:	246f 0044      	movea.l 68(sp),a2
    3736:	2c6f 0038      	movea.l 56(sp),a6
  valactual += ZMLINESIZE/2;
    373a:	282f 0040      	move.l 64(sp),d4
  TestRow( valsupposed, valactual, mask, 0);   
    373e:	97cb           	suba.l a3,a3
  mask = mask ^ 0xffff;
    3740:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3742:	7a00           	moveq #0,d5
    3744:	3a02           	move.w d2,d5
    3746:	2f0b           	move.l a3,-(sp)
    3748:	2f05           	move.l d5,-(sp)
    374a:	2f04           	move.l d4,-(sp)
    374c:	4879 0001 73a4 	pea 173a4 <destlinezoom16>
    3752:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3754:	486b 0001      	pea 1(a3)
    3758:	2f05           	move.l d5,-(sp)
    375a:	2044           	movea.l d4,a0
    375c:	4868 0030      	pea 48(a0)
    3760:	4879 0001 73a4 	pea 173a4 <destlinezoom16>
    3766:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3768:	4642           	not.w d2
    376a:	2004           	move.l d4,d0
    376c:	0680 0000 0120 	addi.l #288,d0
    3772:	548b           	addq.l #2,a3
    3774:	280e           	move.l a6,d4
  for(int i2=0;i2<6;i2++) {
    3776:	4fef 0020      	lea 32(sp),sp
    377a:	720c           	moveq #12,d1
    377c:	b28b           	cmp.l a3,d1
    377e:	6742           	beq.s 37c2 <ZoomTest+0x20d0>
    3780:	2c4a           	movea.l a2,a6
    3782:	2440           	movea.l d0,a2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3784:	7a00           	moveq #0,d5
    3786:	3a02           	move.w d2,d5
    3788:	2f0b           	move.l a3,-(sp)
    378a:	2f05           	move.l d5,-(sp)
    378c:	2f04           	move.l d4,-(sp)
    378e:	4879 0001 73a4 	pea 173a4 <destlinezoom16>
    3794:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3796:	486b 0001      	pea 1(a3)
    379a:	2f05           	move.l d5,-(sp)
    379c:	2044           	movea.l d4,a0
    379e:	4868 0030      	pea 48(a0)
    37a2:	4879 0001 73a4 	pea 173a4 <destlinezoom16>
    37a8:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    37aa:	4642           	not.w d2
    37ac:	2004           	move.l d4,d0
    37ae:	0680 0000 0120 	addi.l #288,d0
    37b4:	548b           	addq.l #2,a3
    37b6:	280e           	move.l a6,d4
  for(int i2=0;i2<6;i2++) {
    37b8:	4fef 0020      	lea 32(sp),sp
    37bc:	720c           	moveq #12,d1
    37be:	b28b           	cmp.l a3,d1
    37c0:	66be           	bne.s 3780 <ZoomTest+0x208e>
    37c2:	367c 000d      	movea.w #13,a3
    37c6:	2a0c           	move.l a4,d5
    37c8:	2e00           	move.l d0,d7
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    37ca:	2f0b           	move.l a3,-(sp)
    37cc:	7800           	moveq #0,d4
    37ce:	3802           	move.w d2,d4
    37d0:	2f04           	move.l d4,-(sp)
    37d2:	2f0e           	move.l a6,-(sp)
    37d4:	4879 0001 73a4 	pea 173a4 <destlinezoom16>
    37da:	4e95           	jsr (a5)
    37dc:	486b 0001      	pea 1(a3)
      mask = mask ^ 0xffff;
    37e0:	3c02           	move.w d2,d6
    37e2:	4646           	not.w d6
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    37e4:	3f06           	move.w d6,-(sp)
    37e6:	4267           	clr.w -(sp)
    37e8:	486e 0030      	pea 48(a6)
    37ec:	4879 0001 73a4 	pea 173a4 <destlinezoom16>
    37f2:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    37f4:	49eb 0003      	lea 3(a3),a4
    37f8:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    37fc:	2c47           	movea.l d7,a6
    37fe:	7e23           	moveq #35,d7
    3800:	de8b           	add.l a3,d7
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    3802:	2f0c           	move.l a4,-(sp)
    3804:	2f04           	move.l d4,-(sp)
    3806:	2f0a           	move.l a2,-(sp)
    3808:	4879 0001 73a4 	pea 173a4 <destlinezoom16>
    380e:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    3810:	486c 0001      	pea 1(a4)
    3814:	2f04           	move.l d4,-(sp)
    3816:	486a 0030      	pea 48(a2)
    381a:	4879 0001 73a4 	pea 173a4 <destlinezoom16>
    3820:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3822:	3406           	move.w d6,d2
    3824:	41ea 00c0      	lea 192(a2),a0
    3828:	548c           	addq.l #2,a4
    for(int i2=0;i2<16;i2++) {
    382a:	4fef 0020      	lea 32(sp),sp
    382e:	b9c7           	cmpa.l d7,a4
    3830:	673a           	beq.s 386c <ZoomTest+0x217a>
    3832:	244e           	movea.l a6,a2
    3834:	2c48           	movea.l a0,a6
    3836:	7800           	moveq #0,d4
    3838:	3806           	move.w d6,d4
    383a:	4646           	not.w d6
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    383c:	2f0c           	move.l a4,-(sp)
    383e:	2f04           	move.l d4,-(sp)
    3840:	2f0a           	move.l a2,-(sp)
    3842:	4879 0001 73a4 	pea 173a4 <destlinezoom16>
    3848:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    384a:	486c 0001      	pea 1(a4)
    384e:	2f04           	move.l d4,-(sp)
    3850:	486a 0030      	pea 48(a2)
    3854:	4879 0001 73a4 	pea 173a4 <destlinezoom16>
    385a:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    385c:	3406           	move.w d6,d2
    385e:	41ea 00c0      	lea 192(a2),a0
    3862:	548c           	addq.l #2,a4
    for(int i2=0;i2<16;i2++) {
    3864:	4fef 0020      	lea 32(sp),sp
    3868:	b9c7           	cmpa.l d7,a4
    386a:	66c6           	bne.s 3832 <ZoomTest+0x2140>
    386c:	47eb 0022      	lea 34(a3),a3
  for(int i=0;i<7;i++) {
    3870:	b6fc 00fb      	cmpa.w #251,a3
    3874:	674e           	beq.s 38c4 <ZoomTest+0x21d2>
    3876:	2e0a           	move.l a2,d7
    3878:	0687 0000 0120 	addi.l #288,d7
    387e:	2448           	movea.l a0,a2
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3880:	2f0b           	move.l a3,-(sp)
    3882:	7800           	moveq #0,d4
    3884:	3802           	move.w d2,d4
    3886:	2f04           	move.l d4,-(sp)
    3888:	2f0e           	move.l a6,-(sp)
    388a:	4879 0001 73a4 	pea 173a4 <destlinezoom16>
    3890:	4e95           	jsr (a5)
    3892:	486b 0001      	pea 1(a3)
      mask = mask ^ 0xffff;
    3896:	3c02           	move.w d2,d6
    3898:	4646           	not.w d6
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    389a:	3f06           	move.w d6,-(sp)
    389c:	4267           	clr.w -(sp)
    389e:	486e 0030      	pea 48(a6)
    38a2:	4879 0001 73a4 	pea 173a4 <destlinezoom16>
    38a8:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    38aa:	49eb 0003      	lea 3(a3),a4
    38ae:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    38b2:	2c47           	movea.l d7,a6
    38b4:	7e23           	moveq #35,d7
    38b6:	de8b           	add.l a3,d7
    38b8:	6000 ff48      	bra.w 3802 <ZoomTest+0x2110>
    38bc:	7800           	moveq #0,d4
    38be:	3802           	move.w d2,d4
    38c0:	6000 e744      	bra.w 2006 <ZoomTest+0x914>
    38c4:	2845           	movea.l d5,a4
    38c6:	2a08           	move.l a0,d5
    TestRow( valsupposed, valactual, mask, 251+i2);
    38c8:	2f0b           	move.l a3,-(sp)
    38ca:	7c00           	moveq #0,d6
    38cc:	3c02           	move.w d2,d6
    38ce:	2f06           	move.l d6,-(sp)
    38d0:	2f0e           	move.l a6,-(sp)
    38d2:	4879 0001 73a4 	pea 173a4 <destlinezoom16>
    38d8:	4e95           	jsr (a5)
    38da:	4878 00fc      	pea fc <main+0xf6>
    38de:	2f04           	move.l d4,-(sp)
    38e0:	486a 0090      	pea 144(a2)
    38e4:	4879 0001 73a4 	pea 173a4 <destlinezoom16>
    38ea:	4e95           	jsr (a5)
    38ec:	4fef 0020      	lea 32(sp),sp
    38f0:	347c 00fd      	movea.w #253,a2
    38f4:	2645           	movea.l d5,a3
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    38f6:	2f0a           	move.l a2,-(sp)
    38f8:	2f06           	move.l d6,-(sp)
    38fa:	2f0b           	move.l a3,-(sp)
    38fc:	4879 0001 73a4 	pea 173a4 <destlinezoom16>
    3902:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    3904:	486a 0001      	pea 1(a2)
    3908:	2f06           	move.l d6,-(sp)
    390a:	486b 0030      	pea 48(a3)
    390e:	4879 0001 73a4 	pea 173a4 <destlinezoom16>
    3914:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3916:	4642           	not.w d2
    3918:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    391a:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<8;i2++) {
    391e:	4fef 0020      	lea 32(sp),sp
    3922:	b4fc 010d      	cmpa.w #269,a2
    3926:	6736           	beq.s 395e <ZoomTest+0x226c>
    3928:	7c00           	moveq #0,d6
    392a:	3c02           	move.w d2,d6
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    392c:	2f0a           	move.l a2,-(sp)
    392e:	2f06           	move.l d6,-(sp)
    3930:	2f0b           	move.l a3,-(sp)
    3932:	4879 0001 73a4 	pea 173a4 <destlinezoom16>
    3938:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    393a:	486a 0001      	pea 1(a2)
    393e:	2f06           	move.l d6,-(sp)
    3940:	486b 0030      	pea 48(a3)
    3944:	4879 0001 73a4 	pea 173a4 <destlinezoom16>
    394a:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    394c:	4642           	not.w d2
    394e:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3950:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<8;i2++) {
    3954:	4fef 0020      	lea 32(sp),sp
    3958:	b4fc 010d      	cmpa.w #269,a2
    395c:	66ca           	bne.s 3928 <ZoomTest+0x2236>
  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    395e:	4878 0001      	pea 1 <_start+0x1>
    3962:	4878 0010      	pea 10 <main+0xa>
    3966:	2f0c           	move.l a4,-(sp)
    3968:	2f03           	move.l d3,-(sp)
    396a:	4eba d41c      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    396e:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    3974:	4eae ff1c      	jsr -228(a6)
    3978:	4fef 0010      	lea 16(sp),sp
    397c:	347c 0001      	movea.w #1,a2
  mask = 0xffff;
    3980:	7eff           	moveq #-1,d7
    3982:	266f 0034      	movea.l 52(sp),a3
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3986:	7400           	moveq #0,d2
    3988:	3407           	move.w d7,d2
    398a:	486a ffff      	pea -1(a2)
    398e:	2f02           	move.l d2,-(sp)
    3990:	2f0b           	move.l a3,-(sp)
    3992:	4879 0001 7378 	pea 17378 <destlinezoom17>
    3998:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    399a:	2f0a           	move.l a2,-(sp)
    399c:	2f02           	move.l d2,-(sp)
    399e:	486b 0030      	pea 48(a3)
    39a2:	4879 0001 7378 	pea 17378 <destlinezoom17>
    39a8:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    39aa:	4647           	not.w d7
    39ac:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    39ae:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<5;i2++) {
    39b2:	4fef 0020      	lea 32(sp),sp
    39b6:	700b           	moveq #11,d0
    39b8:	b08a           	cmp.l a2,d0
    39ba:	66ca           	bne.s 3986 <ZoomTest+0x2294>
    39bc:	2a0c           	move.l a4,d5
    39be:	0685 0000 01e4 	addi.l #484,d5
    39c4:	367c 000a      	movea.w #10,a3
    39c8:	2f4c 0034      	move.l a4,52(sp)
    39cc:	2c0a           	move.l a2,d6
    39ce:	2445           	movea.l d5,a2
      TestRow( valsupposed, valactual, mask, 10+i*35);
    39d0:	2f0b           	move.l a3,-(sp)
    39d2:	3f07           	move.w d7,-(sp)
    39d4:	4267           	clr.w -(sp)
    39d6:	2f0a           	move.l a2,-(sp)
    39d8:	4879 0001 7378 	pea 17378 <destlinezoom17>
    39de:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    39e0:	4dea 0030      	lea 48(a2),a6
      mask = mask ^ 0xffff;
    39e4:	3807           	move.w d7,d4
    39e6:	4644           	not.w d4
    for(int i2=0;i2<17;i2++) {
    39e8:	49eb 0001      	lea 1(a3),a4
    39ec:	4fef 0010      	lea 16(sp),sp
    39f0:	45ea 0690      	lea 1680(a2),a2
    39f4:	2a0a           	move.l a2,d5
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    39f6:	7400           	moveq #0,d2
    39f8:	3404           	move.w d4,d2
    39fa:	2f0c           	move.l a4,-(sp)
    39fc:	2f02           	move.l d2,-(sp)
    39fe:	2f0e           	move.l a6,-(sp)
    3a00:	4879 0001 7378 	pea 17378 <destlinezoom17>
    3a06:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3a08:	486c 0001      	pea 1(a4)
    3a0c:	2f02           	move.l d2,-(sp)
    3a0e:	486e 0030      	pea 48(a6)
    3a12:	4879 0001 7378 	pea 17378 <destlinezoom17>
    3a18:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3a1a:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    3a1e:	4644           	not.w d4
    3a20:	3e04           	move.w d4,d7
    3a22:	548c           	addq.l #2,a4
    for(int i2=0;i2<17;i2++) {
    3a24:	4fef 0020      	lea 32(sp),sp
    3a28:	bdc5           	cmpa.l d5,a6
    3a2a:	66ca           	bne.s 39f6 <ZoomTest+0x2304>
    3a2c:	47eb 0023      	lea 35(a3),a3
  for(int i=0;i<7;i++) {
    3a30:	b6fc 00ff      	cmpa.w #255,a3
    3a34:	669a           	bne.s 39d0 <ZoomTest+0x22de>
    3a36:	286f 0034      	movea.l 52(sp),a4
    3a3a:	2446           	movea.l d6,a2
  TestRow( valsupposed, valactual, mask, 255);
    3a3c:	2f0b           	move.l a3,-(sp)
    3a3e:	3f04           	move.w d4,-(sp)
    3a40:	4267           	clr.w -(sp)
    3a42:	486c 2fd4      	pea 12244(a4)
    3a46:	4879 0001 7378 	pea 17378 <destlinezoom17>
    3a4c:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    3a4e:	4dec 3004      	lea 12292(a4),a6
    3a52:	4fef 0010      	lea 16(sp),sp
    3a56:	367c 0100      	movea.w #256,a3
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3a5a:	2f0b           	move.l a3,-(sp)
    3a5c:	2f02           	move.l d2,-(sp)
    3a5e:	2f0e           	move.l a6,-(sp)
    3a60:	4879 0001 7378 	pea 17378 <destlinezoom17>
    3a66:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3a68:	486b 0001      	pea 1(a3)
    3a6c:	2f02           	move.l d2,-(sp)
    3a6e:	486e 0030      	pea 48(a6)
    3a72:	4879 0001 7378 	pea 17378 <destlinezoom17>
    3a78:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3a7a:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    3a7c:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<7;i2++) {
    3a80:	4fef 0020      	lea 32(sp),sp
    3a84:	b6fc 010e      	cmpa.w #270,a3
    3a88:	6736           	beq.s 3ac0 <ZoomTest+0x23ce>
    3a8a:	7400           	moveq #0,d2
    3a8c:	3404           	move.w d4,d2
    3a8e:	4644           	not.w d4
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3a90:	2f0b           	move.l a3,-(sp)
    3a92:	2f02           	move.l d2,-(sp)
    3a94:	2f0e           	move.l a6,-(sp)
    3a96:	4879 0001 7378 	pea 17378 <destlinezoom17>
    3a9c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3a9e:	486b 0001      	pea 1(a3)
    3aa2:	2f02           	move.l d2,-(sp)
    3aa4:	486e 0030      	pea 48(a6)
    3aa8:	4879 0001 7378 	pea 17378 <destlinezoom17>
    3aae:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3ab0:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    3ab2:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<7;i2++) {
    3ab6:	4fef 0020      	lea 32(sp),sp
    3aba:	b6fc 010e      	cmpa.w #270,a3
    3abe:	66ca           	bne.s 3a8a <ZoomTest+0x2398>
  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    3ac0:	4878 0001      	pea 1 <_start+0x1>
    3ac4:	4878 0011      	pea 11 <main+0xb>
    3ac8:	2f03           	move.l d3,-(sp)
    3aca:	2f0c           	move.l a4,-(sp)
    3acc:	4eba d2ba      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3ad0:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    3ad6:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    3ada:	42a7           	clr.l -(sp)
    3adc:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3ae2:	2f2f 0044      	move.l 68(sp),-(sp)
    3ae6:	4879 0001 734c 	pea 1734c <destlinezoom18>
    3aec:	4e95           	jsr (a5)
    3aee:	4fef 0020      	lea 32(sp),sp
    3af2:	367c 0001      	movea.w #1,a3
  mask = mask ^ 0xffff;
    3af6:	4242           	clr.w d2
    3af8:	2c6f 0040      	movea.l 64(sp),a6
    3afc:	2a2f 0044      	move.l 68(sp),d5
    3b00:	2c2f 0038      	move.l 56(sp),d6
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3b04:	7800           	moveq #0,d4
    3b06:	3802           	move.w d2,d4
    3b08:	2f0b           	move.l a3,-(sp)
    3b0a:	2f04           	move.l d4,-(sp)
    3b0c:	2f0e           	move.l a6,-(sp)
    3b0e:	4879 0001 734c 	pea 1734c <destlinezoom18>
    3b14:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3b16:	486b 0001      	pea 1(a3)
    3b1a:	2f04           	move.l d4,-(sp)
    3b1c:	486e 0030      	pea 48(a6)
    3b20:	4879 0001 734c 	pea 1734c <destlinezoom18>
    3b26:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3b28:	4642           	not.w d2
    3b2a:	200e           	move.l a6,d0
    3b2c:	0680 0000 0120 	addi.l #288,d0
    3b32:	548b           	addq.l #2,a3
    3b34:	2c46           	movea.l d6,a6
  for(int i2=0;i2<4;i2++) {
    3b36:	4fef 0020      	lea 32(sp),sp
    3b3a:	7209           	moveq #9,d1
    3b3c:	b28b           	cmp.l a3,d1
    3b3e:	6740           	beq.s 3b80 <ZoomTest+0x248e>
    3b40:	2c05           	move.l d5,d6
    3b42:	2a00           	move.l d0,d5
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3b44:	7800           	moveq #0,d4
    3b46:	3802           	move.w d2,d4
    3b48:	2f0b           	move.l a3,-(sp)
    3b4a:	2f04           	move.l d4,-(sp)
    3b4c:	2f0e           	move.l a6,-(sp)
    3b4e:	4879 0001 734c 	pea 1734c <destlinezoom18>
    3b54:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3b56:	486b 0001      	pea 1(a3)
    3b5a:	2f04           	move.l d4,-(sp)
    3b5c:	486e 0030      	pea 48(a6)
    3b60:	4879 0001 734c 	pea 1734c <destlinezoom18>
    3b66:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3b68:	4642           	not.w d2
    3b6a:	200e           	move.l a6,d0
    3b6c:	0680 0000 0120 	addi.l #288,d0
    3b72:	548b           	addq.l #2,a3
    3b74:	2c46           	movea.l d6,a6
  for(int i2=0;i2<4;i2++) {
    3b76:	4fef 0020      	lea 32(sp),sp
    3b7a:	7209           	moveq #9,d1
    3b7c:	b28b           	cmp.l a3,d1
    3b7e:	66c0           	bne.s 3b40 <ZoomTest+0x244e>
    3b80:	2f45 0044      	move.l d5,68(sp)
    3b84:	2f46 0038      	move.l d6,56(sp)
    3b88:	2805           	move.l d5,d4
    3b8a:	2646           	movea.l d6,a3
    3b8c:	2c4a           	movea.l a2,a6
    3b8e:	2a00           	move.l d0,d5
    3b90:	7e24           	moveq #36,d7
    3b92:	de8a           	add.l a2,d7
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3b94:	7c00           	moveq #0,d6
    3b96:	3c02           	move.w d2,d6
    3b98:	2f0e           	move.l a6,-(sp)
    3b9a:	2f06           	move.l d6,-(sp)
    3b9c:	2f0b           	move.l a3,-(sp)
    3b9e:	4879 0001 734c 	pea 1734c <destlinezoom18>
    3ba4:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3ba6:	486e 0001      	pea 1(a6)
    3baa:	2f06           	move.l d6,-(sp)
    3bac:	486b 0030      	pea 48(a3)
    3bb0:	4879 0001 734c 	pea 1734c <destlinezoom18>
    3bb6:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3bb8:	4642           	not.w d2
    3bba:	548e           	addq.l #2,a6
    for(int i2=0;i2<18;i2++) {
    3bbc:	4fef 0020      	lea 32(sp),sp
    3bc0:	bdc7           	cmpa.l d7,a6
    3bc2:	673e           	beq.s 3c02 <ZoomTest+0x2510>
    3bc4:	200b           	move.l a3,d0
    3bc6:	0680 0000 0120 	addi.l #288,d0
    3bcc:	2644           	movea.l d4,a3
    3bce:	2805           	move.l d5,d4
    3bd0:	2a00           	move.l d0,d5
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3bd2:	7c00           	moveq #0,d6
    3bd4:	3c02           	move.w d2,d6
    3bd6:	2f0e           	move.l a6,-(sp)
    3bd8:	2f06           	move.l d6,-(sp)
    3bda:	2f0b           	move.l a3,-(sp)
    3bdc:	4879 0001 734c 	pea 1734c <destlinezoom18>
    3be2:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3be4:	486e 0001      	pea 1(a6)
    3be8:	2f06           	move.l d6,-(sp)
    3bea:	486b 0030      	pea 48(a3)
    3bee:	4879 0001 734c 	pea 1734c <destlinezoom18>
    3bf4:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3bf6:	4642           	not.w d2
    3bf8:	548e           	addq.l #2,a6
    for(int i2=0;i2<18;i2++) {
    3bfa:	4fef 0020      	lea 32(sp),sp
    3bfe:	bdc7           	cmpa.l d7,a6
    3c00:	66c2           	bne.s 3bc4 <ZoomTest+0x24d2>
    3c02:	45ea 0023      	lea 35(a2),a2
  for(int i=0;i<7;i++) {  
    3c06:	b4fc 0100      	cmpa.w #256,a2
    3c0a:	6718           	beq.s 3c24 <ZoomTest+0x2532>
    3c0c:	200b           	move.l a3,d0
    3c0e:	0680 0000 0120 	addi.l #288,d0
    3c14:	2644           	movea.l d4,a3
    3c16:	2805           	move.l d5,d4
  for(int i2=0;i2<4;i2++) {
    3c18:	2c4a           	movea.l a2,a6
    3c1a:	2a00           	move.l d0,d5
    3c1c:	7e24           	moveq #36,d7
    3c1e:	de8a           	add.l a2,d7
    3c20:	6000 ff72      	bra.w 3b94 <ZoomTest+0x24a2>
    3c24:	2644           	movea.l d4,a3
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3c26:	7800           	moveq #0,d4
    3c28:	3802           	move.w d2,d4
    3c2a:	2f0a           	move.l a2,-(sp)
    3c2c:	2f04           	move.l d4,-(sp)
    3c2e:	2f0b           	move.l a3,-(sp)
    3c30:	4879 0001 734c 	pea 1734c <destlinezoom18>
    3c36:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3c38:	486a 0001      	pea 1(a2)
    3c3c:	2f04           	move.l d4,-(sp)
    3c3e:	486b 0030      	pea 48(a3)
    3c42:	4879 0001 734c 	pea 1734c <destlinezoom18>
    3c48:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3c4a:	4642           	not.w d2
    3c4c:	548a           	addq.l #2,a2
  for(int i2=0;i2<4;i2++) {
    3c4e:	4fef 0020      	lea 32(sp),sp
    3c52:	b4fc 0108      	cmpa.w #264,a2
    3c56:	673e           	beq.s 3c96 <ZoomTest+0x25a4>
    3c58:	200b           	move.l a3,d0
    3c5a:	0680 0000 00c0 	addi.l #192,d0
    3c60:	2645           	movea.l d5,a3
    3c62:	2a00           	move.l d0,d5
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3c64:	7800           	moveq #0,d4
    3c66:	3802           	move.w d2,d4
    3c68:	2f0a           	move.l a2,-(sp)
    3c6a:	2f04           	move.l d4,-(sp)
    3c6c:	2f0b           	move.l a3,-(sp)
    3c6e:	4879 0001 734c 	pea 1734c <destlinezoom18>
    3c74:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3c76:	486a 0001      	pea 1(a2)
    3c7a:	2f04           	move.l d4,-(sp)
    3c7c:	486b 0030      	pea 48(a3)
    3c80:	4879 0001 734c 	pea 1734c <destlinezoom18>
    3c86:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3c88:	4642           	not.w d2
    3c8a:	548a           	addq.l #2,a2
  for(int i2=0;i2<4;i2++) {
    3c8c:	4fef 0020      	lea 32(sp),sp
    3c90:	b4fc 0108      	cmpa.w #264,a2
    3c94:	66c2           	bne.s 3c58 <ZoomTest+0x2566>
  TestRow( valsupposed, valactual, mask, 0);
    3c96:	42a7           	clr.l -(sp)
    3c98:	3f02           	move.w d2,-(sp)
    3c9a:	4267           	clr.w -(sp)
    3c9c:	2f05           	move.l d5,-(sp)
    3c9e:	4879 0001 734c 	pea 1734c <destlinezoom18>
    3ca4:	4e95           	jsr (a5)
  FreeMem( source, (ZMLINESIZE+4)*272);
    3ca6:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    3cac:	224c           	movea.l a4,a1
    3cae:	203c 0000 3740 	move.l #14144,d0
    3cb4:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272);
    3cb8:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    3cbe:	2243           	movea.l d3,a1
    3cc0:	203c 0000 3740 	move.l #14144,d0
    3cc6:	4eae ff2e      	jsr -210(a6)
    3cca:	4fef 0010      	lea 16(sp),sp
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3cce:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    3cd4:	203c 0001 1440 	move.l #70720,d0
    3cda:	7202           	moveq #2,d1
    3cdc:	4eae ff3a      	jsr -198(a6)
    3ce0:	2f40 0034      	move.l d0,52(sp)
  if( source == 0) {
    3ce4:	6700 032e      	beq.w 4014 <ZoomTest+0x2922>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3ce8:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    3cee:	203c 0001 1440 	move.l #70720,d0
    3cf4:	7202           	moveq #2,d1
    3cf6:	4eae ff3a      	jsr -198(a6)
    3cfa:	2f40 0038      	move.l d0,56(sp)
  if( destination == 0) {
    3cfe:	6700 0380      	beq.w 4080 <ZoomTest+0x298e>
    3d02:	242f 0034      	move.l 52(sp),d2
    3d06:	0682 0000 ff00 	addi.l #65280,d2
    3d0c:	246f 0034      	movea.l 52(sp),a2
    3d10:	4878 00f0      	pea f0 <main+0xea>
    3d14:	4878 0055      	pea 55 <main+0x4f>
    3d18:	2f0a           	move.l a2,-(sp)
    3d1a:	4eba 0462      	jsr 417e <memset>(pc)
    3d1e:	4878 00f0      	pea f0 <main+0xea>
    3d22:	4878 00aa      	pea aa <main+0xa4>
    3d26:	486a 00f0      	pea 240(a2)
    3d2a:	4eba 0452      	jsr 417e <memset>(pc)
    3d2e:	45ea 01e0      	lea 480(a2),a2
  for(int i=0;i<128+8;i++) {
    3d32:	4fef 0018      	lea 24(sp),sp
    3d36:	b48a           	cmp.l a2,d2
    3d38:	66d6           	bne.s 3d10 <ZoomTest+0x261e>
  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    3d3a:	4878 0005      	pea 5 <_start+0x5>
    3d3e:	42a7           	clr.l -(sp)
    3d40:	2f2f 0040      	move.l 64(sp),-(sp)
    3d44:	2f2f 0040      	move.l 64(sp),-(sp)
    3d48:	4eba d03e      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3d4c:	2c79 0001 76c2 	movea.l 176c2 <GfxBase>,a6
    3d52:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<14;i++) {
    3d56:	202f 0048      	move.l 72(sp),d0
    3d5a:	0680 0000 11d4 	addi.l #4564,d0
    3d60:	2f40 003c      	move.l d0,60(sp)
    3d64:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3d68:	7c12           	moveq #18,d6
  UWORD mask = 0xffff;
    3d6a:	7eff           	moveq #-1,d7
    3d6c:	4bfa cc40      	lea 9ae <TestRow>(pc),a5
    3d70:	41ef 0078      	lea 120(sp),a0
    3d74:	2f48 0048      	move.l a0,72(sp)
    3d78:	2f4d 0030      	move.l a5,48(sp)
    3d7c:	2a46           	movea.l d6,a5
    3d7e:	282f 002c      	move.l 44(sp),d4
    3d82:	0684 ffff ef4a 	addi.l #-4278,d4
    3d88:	3c0d           	move.w a5,d6
    3d8a:	0646 ffee      	addi.w #-18,d6
    3d8e:	307c 002a      	movea.w #42,a0
    3d92:	d1ef 002c      	adda.l 44(sp),a0
    3d96:	2f48 0044      	move.l a0,68(sp)
    3d9a:	2f4d 003c      	move.l a5,60(sp)
    3d9e:	2844           	movea.l d4,a4
    3da0:	49ec ff10      	lea -240(a4),a4
    3da4:	41ec ffd6      	lea -42(a4),a0
    3da8:	2f48 0040      	move.l a0,64(sp)
  char str[ 100] = { 0 };
    3dac:	4878 0064      	pea 64 <main+0x5e>
    3db0:	42a7           	clr.l -(sp)
    3db2:	486f 0080      	pea 128(sp)
    3db6:	4eba 03c6      	jsr 417e <memset>(pc)
  data[1] = numberofline;
    3dba:	3f46 0082      	move.w d6,130(sp)
    3dbe:	4fef 000c      	lea 12(sp),sp
  for(int i=0;i<21;i++) {
    3dc2:	7a00           	moveq #0,d5
  testpattern += 0;
    3dc4:	4bf9 0001 7638 	lea 17638 <destlinezoom1>,a5
    if( (*testpattern++ ^ xormask) != *destination++) {
    3dca:	301d           	move.w (a5)+,d0
    3dcc:	bf40           	eor.w d7,d0
    3dce:	206f 0040      	movea.l 64(sp),a0
    3dd2:	54af 0040      	addq.l #2,64(sp)
    3dd6:	b058           	cmp.w (a0)+,d0
    3dd8:	673c           	beq.s 3e16 <ZoomTest+0x2724>
      data[0] = i;
    3dda:	3f45 0074      	move.w d5,116(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    3dde:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    3de4:	41f9 0001 4a7d 	lea 14a7d <incbin_startimage_end+0x49>,a0
    3dea:	43ef 0074      	lea 116(sp),a1
    3dee:	45f9 0000 436c 	lea 436c <PutChar>,a2
    3df4:	47ef 0078      	lea 120(sp),a3
    3df8:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    3dfc:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    3e02:	4eae ffc4      	jsr -60(a6)
    3e06:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    3e0c:	2200           	move.l d0,d1
    3e0e:	240b           	move.l a3,d2
    3e10:	7664           	moveq #100,d3
    3e12:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    3e16:	5285           	addq.l #1,d5
    3e18:	bbfc 0001 7662 	cmpa.l #95842,a5
    3e1e:	66aa           	bne.s 3dca <ZoomTest+0x26d8>
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    3e20:	3039 0001 7662 	move.w 17662 <destlinezoom1+0x2a>,d0
    3e26:	bf40           	eor.w d7,d0
    3e28:	3214           	move.w (a4),d1
    3e2a:	b340           	eor.w d1,d0
    3e2c:	0240 ff00      	andi.w #-256,d0
    3e30:	6600 00b4      	bne.w 3ee6 <ZoomTest+0x27f4>
        valactual += ZMLINESIZE/2;
    3e34:	49ec 0030      	lea 48(a4),a4
      for( int i3=0;i3<5;i3++) {
    3e38:	b9c4           	cmpa.l d4,a4
    3e3a:	6600 ff68      	bne.w 3da4 <ZoomTest+0x26b2>
      mask = mask ^ 0xffff;
    3e3e:	4647           	not.w d7
    3e40:	0684 0000 00f0 	addi.l #240,d4
    3e46:	5246           	addq.w #1,d6
    for(int i2=0;i2<18;i2++) { 
    3e48:	b8af 0044      	cmp.l 68(sp),d4
    3e4c:	6600 ff50      	bne.w 3d9e <ZoomTest+0x26ac>
    3e50:	2a6f 003c      	movea.l 60(sp),a5
    3e54:	246f 002c      	movea.l 44(sp),a2
    3e58:	45ea ff10      	lea -240(a2),a2
    3e5c:	7600           	moveq #0,d3
    3e5e:	3607           	move.w d7,d3
      TestRow( valsupposed, valactual, mask, 18+i*19);
    3e60:	2f0d           	move.l a5,-(sp)
    3e62:	2f03           	move.l d3,-(sp)
    3e64:	2f0a           	move.l a2,-(sp)
    3e66:	4879 0001 7638 	pea 17638 <destlinezoom1>
    3e6c:	206f 0040      	movea.l 64(sp),a0
    3e70:	4e90           	jsr (a0)
      valactual += ZMLINESIZE/2;
    3e72:	45ea 0030      	lea 48(a2),a2
    for( int i3=0;i3<5;i3++) {
    3e76:	4fef 0010      	lea 16(sp),sp
    3e7a:	b5ef 002c      	cmpa.l 44(sp),a2
    3e7e:	66e0           	bne.s 3e60 <ZoomTest+0x276e>
    3e80:	45ea 11d0      	lea 4560(a2),a2
    3e84:	2f4a 002c      	move.l a2,44(sp)
    3e88:	4bed 0013      	lea 19(a5),a5
  for(int i=0;i<14;i++) {
    3e8c:	bafc 011c      	cmpa.w #284,a5
    3e90:	6600 feec      	bne.w 3d7e <ZoomTest+0x268c>
    3e94:	2a6f 0030      	movea.l 48(sp),a5
    3e98:	246f 0038      	movea.l 56(sp),a2
    3e9c:	d5fc 0000 f964 	adda.l #63844,a2
    3ea2:	243c 0000 0109 	move.l #265,d2
    3ea8:	280a           	move.l a2,d4
    3eaa:	0684 0000 00f0 	addi.l #240,d4
      TestRow( valsupposed, valactual, mask, i2+265);
    3eb0:	2f02           	move.l d2,-(sp)
    3eb2:	2f03           	move.l d3,-(sp)
    3eb4:	2f0a           	move.l a2,-(sp)
    3eb6:	4879 0001 7638 	pea 17638 <destlinezoom1>
    3ebc:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3ebe:	45ea 0030      	lea 48(a2),a2
    for( int i3=0;i3<5;i3++) {
    3ec2:	4fef 0010      	lea 16(sp),sp
    3ec6:	b88a           	cmp.l a2,d4
    3ec8:	66e6           	bne.s 3eb0 <ZoomTest+0x27be>
    mask = mask ^ 0xffff;
    3eca:	4647           	not.w d7
    3ecc:	5282           	addq.l #1,d2
  for(int i2=0;i2<4;i2++) { 
    3ece:	0c82 0000 010d 	cmpi.l #269,d2
    3ed4:	6700 009e      	beq.w 3f74 <ZoomTest+0x2882>
    3ed8:	7600           	moveq #0,d3
    3eda:	3607           	move.w d7,d3
    3edc:	280a           	move.l a2,d4
    3ede:	0684 0000 00f0 	addi.l #240,d4
    3ee4:	60ca           	bra.s 3eb0 <ZoomTest+0x27be>
    data[0] = 21;
    3ee6:	3f7c 0015 0074 	move.w #21,116(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    3eec:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    3ef2:	41f9 0001 4a7d 	lea 14a7d <incbin_startimage_end+0x49>,a0
    3ef8:	43ef 0074      	lea 116(sp),a1
    3efc:	45f9 0000 436c 	lea 436c <PutChar>,a2
    3f02:	47ef 0078      	lea 120(sp),a3
    3f06:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    3f0a:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    3f10:	4eae ffc4      	jsr -60(a6)
    3f14:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    3f1a:	2200           	move.l d0,d1
    3f1c:	240b           	move.l a3,d2
    3f1e:	7664           	moveq #100,d3
    3f20:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    3f24:	7000           	moveq #0,d0
    3f26:	3014           	move.w (a4),d0
    3f28:	2f00           	move.l d0,-(sp)
    3f2a:	3039 0001 7662 	move.w 17662 <destlinezoom1+0x2a>,d0
    3f30:	2f00           	move.l d0,-(sp)
    3f32:	4879 0001 4aad 	pea 14aad <incbin_startimage_end+0x79>
    3f38:	4eba ca0c      	jsr 946 <KPrintF>(pc)
        valactual += ZMLINESIZE/2;
    3f3c:	49ec 0030      	lea 48(a4),a4
      for( int i3=0;i3<5;i3++) {
    3f40:	4fef 000c      	lea 12(sp),sp
    3f44:	b9c4           	cmpa.l d4,a4
    3f46:	6700 fef6      	beq.w 3e3e <ZoomTest+0x274c>
    3f4a:	41ec ffd6      	lea -42(a4),a0
    3f4e:	2f48 0040      	move.l a0,64(sp)
  char str[ 100] = { 0 };
    3f52:	4878 0064      	pea 64 <main+0x5e>
    3f56:	42a7           	clr.l -(sp)
    3f58:	486f 0080      	pea 128(sp)
    3f5c:	4eba 0220      	jsr 417e <memset>(pc)
  data[1] = numberofline;
    3f60:	3f46 0082      	move.w d6,130(sp)
    3f64:	4fef 000c      	lea 12(sp),sp
  for(int i=0;i<21;i++) {
    3f68:	7a00           	moveq #0,d5
  testpattern += 0;
    3f6a:	4bf9 0001 7638 	lea 17638 <destlinezoom1>,a5
    3f70:	6000 fe58      	bra.w 3dca <ZoomTest+0x26d8>
  FreeMem( source, (ZMLINESIZE+4)*272*5);
    3f74:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    3f7a:	226f 0034      	movea.l 52(sp),a1
    3f7e:	203c 0001 1440 	move.l #70720,d0
    3f84:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272*5);
    3f88:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    3f8e:	226f 0038      	movea.l 56(sp),a1
    3f92:	203c 0001 1440 	move.l #70720,d0
    3f98:	4eae ff2e      	jsr -210(a6)
}
    3f9c:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    3fa0:	4fef 00b0      	lea 176(sp),sp
    3fa4:	4e75           	rts
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    3fa6:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    3fac:	4eae ffc4      	jsr -60(a6)
    3fb0:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    3fb6:	2200           	move.l d0,d1
    3fb8:	243c 0001 4e4f 	move.l #85583,d2
    3fbe:	7635           	moveq #53,d3
    3fc0:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3fc4:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    3fca:	203c 0000 3740 	move.l #14144,d0
    3fd0:	7202           	moveq #2,d1
    3fd2:	4eae ff3a      	jsr -198(a6)
    3fd6:	2600           	move.l d0,d3
  if( source == 0) {
    3fd8:	6600 defa      	bne.w 1ed4 <ZoomTest+0x7e2>
    Write(  Output(), 
    3fdc:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    3fe2:	4eae ffc4      	jsr -60(a6)
    3fe6:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    3fec:	2200           	move.l d0,d1
    3fee:	243c 0001 4ec6 	move.l #85702,d2
    3ff4:	7639           	moveq #57,d3
    3ff6:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3ffa:	2c79 0001 76ce 	movea.l 176ce <SysBase>,a6
    4000:	203c 0001 1440 	move.l #70720,d0
    4006:	7202           	moveq #2,d1
    4008:	4eae ff3a      	jsr -198(a6)
    400c:	2f40 0034      	move.l d0,52(sp)
  if( source == 0) {
    4010:	6600 fcd6      	bne.w 3ce8 <ZoomTest+0x25f6>
    Write(  Output(), 
    4014:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    401a:	4eae ffc4      	jsr -60(a6)
    401e:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    4024:	2200           	move.l d0,d1
    4026:	243c 0001 4ec6 	move.l #85702,d2
    402c:	7639           	moveq #57,d3
    402e:	4eae ffd0      	jsr -48(a6)
}
    4032:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    4036:	4fef 00b0      	lea 176(sp),sp
    403a:	4e75           	rts
    Write(  Output(), 
    403c:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    4042:	4eae ffc4      	jsr -60(a6)
    4046:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    404c:	2200           	move.l d0,d1
    404e:	243c 0001 4dc2 	move.l #85442,d2
    4054:	7636           	moveq #54,d3
    4056:	4eae ffd0      	jsr -48(a6)
    return;
    405a:	6000 dc26      	bra.w 1c82 <ZoomTest+0x590>
    Write(  Output(), 
    405e:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    4064:	4eae ffc4      	jsr -60(a6)
    4068:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    406e:	2200           	move.l d0,d1
    4070:	243c 0001 4b55 	move.l #84821,d2
    4076:	7639           	moveq #57,d3
    4078:	4eae ffd0      	jsr -48(a6)
    return;
    407c:	6000 d86e      	bra.w 18ec <ZoomTest+0x1fa>
    Write(  Output(), 
    4080:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    4086:	4eae ffc4      	jsr -60(a6)
    408a:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    4090:	2200           	move.l d0,d1
    4092:	243c 0001 4f00 	move.l #85760,d2
    4098:	763d           	moveq #61,d3
    409a:	4eae ffd0      	jsr -48(a6)
}
    409e:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    40a2:	4fef 00b0      	lea 176(sp),sp
    40a6:	4e75           	rts
    Write(  Output(), 
    40a8:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    40ae:	4eae ffc4      	jsr -60(a6)
    40b2:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    40b8:	2200           	move.l d0,d1
    40ba:	243c 0001 4b8c 	move.l #84876,d2
    40c0:	763d           	moveq #61,d3
    40c2:	4eae ffd0      	jsr -48(a6)
    return;
    40c6:	6000 d824      	bra.w 18ec <ZoomTest+0x1fa>
    Write(  Output(), 
    40ca:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    40d0:	4eae ffc4      	jsr -60(a6)
    40d4:	2c79 0001 76ca 	movea.l 176ca <DOSBase>,a6
    40da:	2200           	move.l d0,d1
    40dc:	243c 0001 4f00 	move.l #85760,d2
    40e2:	763d           	moveq #61,d3
    40e4:	4eae ffd0      	jsr -48(a6)
    return;
    40e8:	6000 fbe4      	bra.w 3cce <ZoomTest+0x25dc>

000040ec <memcpy>:
{
    40ec:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    40f0:	202f 0014      	move.l 20(sp),d0
    40f4:	226f 0018      	movea.l 24(sp),a1
    40f8:	222f 001c      	move.l 28(sp),d1
	while(len--)
    40fc:	2601           	move.l d1,d3
    40fe:	5383           	subq.l #1,d3
    4100:	4a81           	tst.l d1
    4102:	6762           	beq.s 4166 <memcpy+0x7a>
    4104:	2040           	movea.l d0,a0
    4106:	5888           	addq.l #4,a0
    4108:	b1c9           	cmpa.l a1,a0
    410a:	53c2           	sl.s d2
    410c:	4402           	neg.b d2
    410e:	41e9 0004      	lea 4(a1),a0
    4112:	b1c0           	cmpa.l d0,a0
    4114:	53c4           	sl.s d4
    4116:	4404           	neg.b d4
    4118:	8404           	or.b d4,d2
    411a:	7808           	moveq #8,d4
    411c:	b883           	cmp.l d3,d4
    411e:	55c4           	sc.s d4
    4120:	4404           	neg.b d4
    4122:	c404           	and.b d4,d2
    4124:	6746           	beq.s 416c <memcpy+0x80>
    4126:	2409           	move.l a1,d2
    4128:	8480           	or.l d0,d2
    412a:	7803           	moveq #3,d4
    412c:	c484           	and.l d4,d2
    412e:	663c           	bne.s 416c <memcpy+0x80>
    4130:	2049           	movea.l a1,a0
    4132:	2440           	movea.l d0,a2
    4134:	74fc           	moveq #-4,d2
    4136:	c481           	and.l d1,d2
    4138:	d489           	add.l a1,d2
		*d++ = *s++;
    413a:	24d8           	move.l (a0)+,(a2)+
    413c:	b488           	cmp.l a0,d2
    413e:	66fa           	bne.s 413a <memcpy+0x4e>
    4140:	74fc           	moveq #-4,d2
    4142:	c481           	and.l d1,d2
    4144:	2040           	movea.l d0,a0
    4146:	d1c2           	adda.l d2,a0
    4148:	d3c2           	adda.l d2,a1
    414a:	9682           	sub.l d2,d3
    414c:	b481           	cmp.l d1,d2
    414e:	6716           	beq.s 4166 <memcpy+0x7a>
    4150:	1091           	move.b (a1),(a0)
	while(len--)
    4152:	4a83           	tst.l d3
    4154:	6710           	beq.s 4166 <memcpy+0x7a>
		*d++ = *s++;
    4156:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    415c:	5383           	subq.l #1,d3
    415e:	6706           	beq.s 4166 <memcpy+0x7a>
		*d++ = *s++;
    4160:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    4166:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    416a:	4e75           	rts
    416c:	2040           	movea.l d0,a0
    416e:	d289           	add.l a1,d1
		*d++ = *s++;
    4170:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    4172:	b289           	cmp.l a1,d1
    4174:	67f0           	beq.s 4166 <memcpy+0x7a>
		*d++ = *s++;
    4176:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    4178:	b289           	cmp.l a1,d1
    417a:	66f4           	bne.s 4170 <memcpy+0x84>
    417c:	60e8           	bra.s 4166 <memcpy+0x7a>

0000417e <memset>:
{
    417e:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    4182:	202f 0024      	move.l 36(sp),d0
    4186:	2a2f 0028      	move.l 40(sp),d5
    418a:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    418e:	2809           	move.l a1,d4
    4190:	5384           	subq.l #1,d4
    4192:	b2fc 0000      	cmpa.w #0,a1
    4196:	6f00 00b0      	ble.w 4248 <memset+0xca>
    419a:	1e05           	move.b d5,d7
    419c:	2200           	move.l d0,d1
    419e:	4481           	neg.l d1
    41a0:	7403           	moveq #3,d2
    41a2:	c282           	and.l d2,d1
    41a4:	7c05           	moveq #5,d6
		*ptr++ = val;
    41a6:	2440           	movea.l d0,a2
    41a8:	bc84           	cmp.l d4,d6
    41aa:	646a           	bcc.s 4216 <memset+0x98>
    41ac:	4a81           	tst.l d1
    41ae:	6724           	beq.s 41d4 <memset+0x56>
    41b0:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    41b2:	5384           	subq.l #1,d4
    41b4:	7401           	moveq #1,d2
    41b6:	b481           	cmp.l d1,d2
    41b8:	671a           	beq.s 41d4 <memset+0x56>
		*ptr++ = val;
    41ba:	2440           	movea.l d0,a2
    41bc:	548a           	addq.l #2,a2
    41be:	2040           	movea.l d0,a0
    41c0:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    41c4:	5384           	subq.l #1,d4
    41c6:	7403           	moveq #3,d2
    41c8:	b481           	cmp.l d1,d2
    41ca:	6608           	bne.s 41d4 <memset+0x56>
		*ptr++ = val;
    41cc:	528a           	addq.l #1,a2
    41ce:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    41d2:	5384           	subq.l #1,d4
    41d4:	2609           	move.l a1,d3
    41d6:	9681           	sub.l d1,d3
    41d8:	7c00           	moveq #0,d6
    41da:	1c05           	move.b d5,d6
    41dc:	2406           	move.l d6,d2
    41de:	4842           	swap d2
    41e0:	4242           	clr.w d2
    41e2:	2042           	movea.l d2,a0
    41e4:	2406           	move.l d6,d2
    41e6:	e14a           	lsl.w #8,d2
    41e8:	4842           	swap d2
    41ea:	4242           	clr.w d2
    41ec:	e18e           	lsl.l #8,d6
    41ee:	2646           	movea.l d6,a3
    41f0:	2c08           	move.l a0,d6
    41f2:	8486           	or.l d6,d2
    41f4:	2c0b           	move.l a3,d6
    41f6:	8486           	or.l d6,d2
    41f8:	1407           	move.b d7,d2
    41fa:	2040           	movea.l d0,a0
    41fc:	d1c1           	adda.l d1,a0
    41fe:	72fc           	moveq #-4,d1
    4200:	c283           	and.l d3,d1
    4202:	d288           	add.l a0,d1
		*ptr++ = val;
    4204:	20c2           	move.l d2,(a0)+
    4206:	b1c1           	cmpa.l d1,a0
    4208:	66fa           	bne.s 4204 <memset+0x86>
    420a:	72fc           	moveq #-4,d1
    420c:	c283           	and.l d3,d1
    420e:	d5c1           	adda.l d1,a2
    4210:	9881           	sub.l d1,d4
    4212:	b283           	cmp.l d3,d1
    4214:	6732           	beq.s 4248 <memset+0xca>
    4216:	1485           	move.b d5,(a2)
	while(len-- > 0)
    4218:	4a84           	tst.l d4
    421a:	6f2c           	ble.s 4248 <memset+0xca>
		*ptr++ = val;
    421c:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    4220:	7201           	moveq #1,d1
    4222:	b284           	cmp.l d4,d1
    4224:	6c22           	bge.s 4248 <memset+0xca>
		*ptr++ = val;
    4226:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    422a:	7402           	moveq #2,d2
    422c:	b484           	cmp.l d4,d2
    422e:	6c18           	bge.s 4248 <memset+0xca>
		*ptr++ = val;
    4230:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    4234:	7c03           	moveq #3,d6
    4236:	bc84           	cmp.l d4,d6
    4238:	6c0e           	bge.s 4248 <memset+0xca>
		*ptr++ = val;
    423a:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    423e:	7204           	moveq #4,d1
    4240:	b284           	cmp.l d4,d1
    4242:	6c04           	bge.s 4248 <memset+0xca>
		*ptr++ = val;
    4244:	1545 0005      	move.b d5,5(a2)
}
    4248:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    424c:	4e75           	rts

0000424e <strlen>:
{
    424e:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    4252:	7000           	moveq #0,d0
	while(*s++)
    4254:	4a10           	tst.b (a0)
    4256:	6708           	beq.s 4260 <strlen+0x12>
		t++;
    4258:	5280           	addq.l #1,d0
	while(*s++)
    425a:	4a30 0800      	tst.b (0,a0,d0.l)
    425e:	66f8           	bne.s 4258 <strlen+0xa>
}
    4260:	4e75           	rts
    4262:	4e71           	nop

00004264 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    4264:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    4268:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    426c:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    4270:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    4274:	d041           	add.w d1,d0
	swap	d0
    4276:	4840           	swap d0
	clrw	d0
    4278:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    427a:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    427e:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    4282:	d081           	add.l d1,d0

	rts
    4284:	4e75           	rts

00004286 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    4286:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    4288:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    428c:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    4290:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    4296:	6416           	bcc.s 42ae <__udivsi3+0x28>
	movel	d0, d2
    4298:	2400           	move.l d0,d2
	clrw	d2
    429a:	4242           	clr.w d2
	swap	d2
    429c:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    429e:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    42a0:	3002           	move.w d2,d0
	swap	d0
    42a2:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    42a4:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    42a8:	84c1           	divu.w d1,d2
	movew	d2, d0
    42aa:	3002           	move.w d2,d0
	jra	6f
    42ac:	6030           	bra.s 42de <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    42ae:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    42b0:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    42b2:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    42b4:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    42ba:	64f4           	bcc.s 42b0 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    42bc:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    42be:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    42c4:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    42c6:	c2c0           	mulu.w d0,d1
	swap	d2
    42c8:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    42ca:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    42cc:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    42ce:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    42d0:	660a           	bne.s 42dc <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    42d2:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    42d4:	6506           	bcs.s 42dc <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    42d6:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    42da:	6302           	bls.s 42de <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    42dc:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    42de:	241f           	move.l (sp)+,d2
	rts
    42e0:	4e75           	rts

000042e2 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    42e2:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    42e4:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    42e6:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    42ea:	6a04           	bpl.s 42f0 <__divsi3+0xe>
	negl	d1
    42ec:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    42ee:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    42f0:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    42f4:	6a04           	bpl.s 42fa <__divsi3+0x18>
	negl	d0
    42f6:	4480           	neg.l d0
	negb	d2
    42f8:	4402           	neg.b d2

2:	movel	d1, sp@-
    42fa:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    42fc:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    42fe:	6186           	bsr.s 4286 <__udivsi3>
	addql	IMM (8), sp
    4300:	508f           	addq.l #8,sp

	tstb	d2
    4302:	4a02           	tst.b d2
	jpl	3f
    4304:	6a02           	bpl.s 4308 <__divsi3+0x26>
	negl	d0
    4306:	4480           	neg.l d0

3:	movel	sp@+, d2
    4308:	241f           	move.l (sp)+,d2
	rts
    430a:	4e75           	rts

0000430c <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    430c:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    4310:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    4314:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4316:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    4318:	61c8           	bsr.s 42e2 <__divsi3>
	addql	IMM (8), sp
    431a:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    431c:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    4320:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4322:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    4324:	6100 ff3e      	bsr.w 4264 <__mulsi3>
	addql	IMM (8), sp
    4328:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    432a:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    432e:	9280           	sub.l d0,d1
	movel	d1, d0
    4330:	2001           	move.l d1,d0
	rts
    4332:	4e75           	rts

00004334 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    4334:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    4338:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    433c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    433e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    4340:	6100 ff44      	bsr.w 4286 <__udivsi3>
	addql	IMM (8), sp
    4344:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    4346:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    434a:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    434c:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    434e:	6100 ff14      	bsr.w 4264 <__mulsi3>
	addql	IMM (8), sp
    4352:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    4354:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    4358:	9280           	sub.l d0,d1
	movel	d1, d0
    435a:	2001           	move.l d1,d0
	rts
    435c:	4e75           	rts

0000435e <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    435e:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    4360:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    4364:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    4368:	2c5f           	movea.l (sp)+,a6
    rts
    436a:	4e75           	rts

0000436c <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    436c:	16c0           	move.b d0,(a3)+
	rts
    436e:	4e75           	rts

00004370 <saveregs>:
	...

000043ac <font2distance>:
    43ac:	0505           	btst d2,d5
    43ae:	0505           	btst d2,d5
    43b0:	0505           	btst d2,d5
    43b2:	0505           	btst d2,d5
    43b4:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    43b6:	0505           	btst d2,d5
    43b8:	0505           	btst d2,d5
    43ba:	0005 0505      	ori.b #5,d5
    43be:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    43c0:	0505           	btst d2,d5
    43c2:	0505           	btst d2,d5
    43c4:	0505           	btst d2,d5
    43c6:	0505           	btst d2,d5
    43c8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    43ca:	0505           	btst d2,d5
    43cc:	0505           	btst d2,d5
    43ce:	0505           	btst d2,d5
    43d0:	0505           	btst d2,d5
    43d2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    43d4:	0500           	btst d2,d0
    43d6:	0505           	btst d2,d5
    43d8:	0505           	btst d2,d5
    43da:	0505           	btst d2,d5
    43dc:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    43de:	0505           	btst d2,d5
    43e0:	0505           	btst d2,d5
    43e2:	0505           	btst d2,d5
    43e4:	0505           	btst d2,d5
    43e6:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    43e8:	0505           	btst d2,d5
    43ea:	0505           	btst d2,d5
    43ec:	0503           	btst d2,d3
    43ee:	0505           	btst d2,d5
    43f0:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    43f2:	0505           	btst d2,d5
    43f4:	0500           	btst d2,d0
    43f6:	0505           	btst d2,d5
    43f8:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    43fc:	0505           	btst d2,d5
    43fe:	0503           	btst d2,d3
    4400:	0205 0507      	andi.b #7,d5
    4404:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    4406:	0505           	btst d2,d5
    4408:	0505           	btst d2,d5
    440a:	0505           	btst d2,d5
    440c:	0505           	btst d2,d5
    440e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4410:	0505           	btst d2,d5
    4412:	0505           	btst d2,d5
    4414:	0505           	btst d2,d5
    4416:	0505           	btst d2,d5
    4418:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    441a:	0505           	btst d2,d5
    441c:	0505           	btst d2,d5
    441e:	0505           	btst d2,d5
    4420:	0505           	btst d2,d5
    4422:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4424:	0505           	btst d2,d5
    4426:	0505           	btst d2,d5
    4428:	0505           	btst d2,d5
    442a:	0505           	btst d2,d5
    442c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    442e:	0505           	btst d2,d5
    4430:	0505           	btst d2,d5
    4432:	0505           	btst d2,d5
    4434:	0505           	btst d2,d5
    4436:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4438:	0505           	btst d2,d5
    443a:	0505           	btst d2,d5
    443c:	0505           	btst d2,d5
    443e:	0505           	btst d2,d5
    4440:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4442:	0505           	btst d2,d5
    4444:	0505           	btst d2,d5
    4446:	0505           	btst d2,d5
    4448:	0505           	btst d2,d5
    444a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    444c:	0505           	btst d2,d5
    444e:	0505           	btst d2,d5
    4450:	0505           	btst d2,d5
    4452:	0505           	btst d2,d5
    4454:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4456:	0505           	btst d2,d5
    4458:	0505           	btst d2,d5
    445a:	0505           	btst d2,d5
    445c:	0505           	btst d2,d5
    445e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4460:	0505           	btst d2,d5
    4462:	0505           	btst d2,d5
    4464:	0505           	btst d2,d5
    4466:	0505           	btst d2,d5
    4468:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    446a:	0505           	btst d2,d5
    446c:	0505           	btst d2,d5
    446e:	0505           	btst d2,d5
    4470:	0505           	btst d2,d5
    4472:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4474:	0505           	btst d2,d5
    4476:	0505           	btst d2,d5
    4478:	0505           	btst d2,d5
    447a:	0505           	btst d2,d5
    447c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    447e:	0505           	btst d2,d5
    4480:	0505           	btst d2,d5
    4482:	0505           	btst d2,d5
    4484:	0505           	btst d2,d5
    4486:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4488:	0505           	btst d2,d5
    448a:	0505           	btst d2,d5
    448c:	0505           	btst d2,d5
    448e:	0505           	btst d2,d5
    4490:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4492:	0505           	btst d2,d5
    4494:	0505           	btst d2,d5
    4496:	0505           	btst d2,d5
    4498:	0505           	btst d2,d5
    449a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    449c:	0505           	btst d2,d5
    449e:	0505           	btst d2,d5
    44a0:	0505           	btst d2,d5
    44a2:	0505           	btst d2,d5
    44a4:	0505           	btst d2,d5

000044a6 <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    44a6:	16c0           	move.b d0,(a3)+
  RTS
    44a8:	4e75           	rts

000044aa <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    44aa:	48f9 7fff 0000 	movem.l d0-a6,4370 <saveregs>
    44b0:	4370 
  lea 0xdff000,a5
    44b2:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddaa53>,a5
  move.l sp@(4),a0  //Fontlocation
    44b8:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    44bc:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    44c0:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    44c4:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    44c6:	082d 0006 0002 	btst #6,2(a5)

000044cc <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    44cc:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    44d2:	66f8           	bne.s 44cc <st2wblit>

000044d4 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    44d4:	7019           	moveq #25,d0
	sub.l d5,d5      
    44d6:	9a85           	sub.l d5,d5

000044d8 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    44d8:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    44da:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    44dc:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    44e0:	9dce           	suba.l a6,a6
	move.l d2, a6
    44e2:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    44e4:	ddfc 0000 43ac 	adda.l #17324,a6

	LSL  	#4,d2 	    //Fetch next char
    44ea:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    44ec:	2842           	movea.l d2,a4


	move.l  #0,d4
    44ee:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    44f0:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    44f2:	3814           	move.w (a4),d4
	swap	d4
    44f4:	4844           	swap d4
	lsr.l	d5, d4
    44f6:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    44f8:	8993           	or.l d4,(a3)
	clr.l	d4
    44fa:	4284           	clr.l d4
	move.w  2(a4), d4
    44fc:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    4500:	4844           	swap d4
	lsr.l	d5, d4
    4502:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    4504:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    4508:	4284           	clr.l d4
	move.w  4(a4), d4
    450a:	382c 0004      	move.w 4(a4),d4
	swap	d4
    450e:	4844           	swap d4
	lsr.l	d5, d4
    4510:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    4512:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    4516:	4284           	clr.l d4
	move.w  6(a4), d4
    4518:	382c 0006      	move.w 6(a4),d4
	swap	d4
    451c:	4844           	swap d4
	lsr.l	d5, d4
    451e:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    4520:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    4524:	4284           	clr.l d4
	move.w  8(a4), d4
    4526:	382c 0008      	move.w 8(a4),d4
	swap	d4
    452a:	4844           	swap d4
	lsr.l	d5, d4
    452c:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    452e:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    4532:	4284           	clr.l d4
	move.w  10(a4), d4
    4534:	382c 000a      	move.w 10(a4),d4
	swap	d4
    4538:	4844           	swap d4
	lsr.l	d5, d4
    453a:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    453c:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    4540:	4284           	clr.l d4
	move.w  12(a4), d4
    4542:	382c 000c      	move.w 12(a4),d4
	swap	d4
    4546:	4844           	swap d4
	lsr.l	d5, d4
    4548:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    454a:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    454e:	4284           	clr.l d4
	move.w  14(a4), d4
    4550:	382c 000e      	move.w 14(a4),d4
	swap	d4
    4554:	4844           	swap d4
	lsr.l	d5, d4
    4556:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    4558:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    455c:	4284           	clr.l d4

	add.b   (a6), d5
    455e:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    4560:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    4564:	6500 0006      	bcs.w 456c <noadditionalchar>
	addq.w  #1, a3
    4568:	524b           	addq.w #1,a3
	sub.w   #8,d5
    456a:	5145           	subq.w #8,d5

0000456c <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    456c:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    456e:	51c8 ff68      	dbf d0,44d8 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    4572:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    4576:	51cb ff5c      	dbf d3,44d4 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    457a:	4cfa 7fff fdf2 	movem.l 4370 <saveregs>(pc),d0-a6

	RTS
    4580:	4e75           	rts
