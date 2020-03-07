
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
      12:	23ce 0000 599c 	move.l a6,599c <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,5974 <hw>
      1e:	0000 5974 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 30f5 	lea 30f5 <incbin_swfont_end+0x113>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 5970 	move.l d0,5970 <GfxBase>
	if (!GfxBase)
      34:	6700 1670      	beq.w 16a6 <main+0x16a0>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
      3e:	43f9 0000 3106 	lea 3106 <incbin_swfont_end+0x124>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 5998 	move.l d0,5998 <DOSBase>
	if (!DOSBase)
      50:	6700 1648      	beq.w 169a <main+0x1694>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 3112 	pea 3112 <incbin_swfont_end+0x130>
      5a:	4eb9 0000 18d8 	jsr 18d8 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 312e 	move.l #12590,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      7e:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
      84:	4eae ffc4      	jsr -60(a6)
      88:	2079 0000 5974 	movea.l 5974 <hw>,a0
      8e:	2628 0080      	move.l 128(a0),d3
      92:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
      98:	2200           	move.l d0,d1
      9a:	243c 0000 313e 	move.l #12606,d2
      a0:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      a4:	47f9 0000 1c4a 	lea 1c4a <ClBuild>,a3
      aa:	4e93           	jsr (a3)
      ac:	2440           	movea.l d0,a2
      ae:	23c0 0000 5994 	move.l d0,5994 <Copperlist1>
  DrawCopper = Copperlist1;
      b4:	23c0 0000 5984 	move.l d0,5984 <DrawCopper>
  Copperlist2 = ClBuild();
      ba:	4e93           	jsr (a3)
      bc:	23c0 0000 5990 	move.l d0,5990 <Copperlist2>
  ViewCopper = Copperlist2;
      c2:	23c0 0000 5978 	move.l d0,5978 <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      c8:	588f           	addq.l #4,sp
      ca:	2039 0000 58ac 	move.l 58ac <ClsSprites>,d0
      d0:	b092           	cmp.l (a2),d0
      d2:	6600 12c0      	bne.w 1394 <main+0x138e>
      d6:	222a 0004      	move.l 4(a2),d1
      da:	b2b9 0000 58b0 	cmp.l 58b0 <ClsSprites+0x4>,d1
      e0:	6600 12b2      	bne.w 1394 <main+0x138e>
      e4:	206a 0008      	movea.l 8(a2),a0
      e8:	b1f9 0000 58b4 	cmpa.l 58b4 <ClsSprites+0x8>,a0
      ee:	6600 12a4      	bne.w 1394 <main+0x138e>
      f2:	202a 000c      	move.l 12(a2),d0
      f6:	b0b9 0000 58b8 	cmp.l 58b8 <ClsSprites+0xc>,d0
      fc:	6600 1296      	bne.w 1394 <main+0x138e>
     100:	222a 0010      	move.l 16(a2),d1
     104:	b2b9 0000 58bc 	cmp.l 58bc <ClsSprites+0x10>,d1
     10a:	6600 1288      	bne.w 1394 <main+0x138e>
     10e:	206a 0014      	movea.l 20(a2),a0
     112:	b1f9 0000 58c0 	cmpa.l 58c0 <ClsSprites+0x14>,a0
     118:	6600 127a      	bne.w 1394 <main+0x138e>
     11c:	202a 0018      	move.l 24(a2),d0
     120:	b0b9 0000 58c4 	cmp.l 58c4 <ClsSprites+0x18>,d0
     126:	6600 126c      	bne.w 1394 <main+0x138e>
     12a:	222a 001c      	move.l 28(a2),d1
     12e:	b2b9 0000 58c8 	cmp.l 58c8 <ClsSprites+0x1c>,d1
     134:	6600 125e      	bne.w 1394 <main+0x138e>
     138:	206a 0020      	movea.l 32(a2),a0
     13c:	b1f9 0000 58cc 	cmpa.l 58cc <ClsSprites+0x20>,a0
     142:	6600 1250      	bne.w 1394 <main+0x138e>
     146:	202a 0024      	move.l 36(a2),d0
     14a:	b0b9 0000 58d0 	cmp.l 58d0 <ClsSprites+0x24>,d0
     150:	6600 1242      	bne.w 1394 <main+0x138e>
     154:	222a 0028      	move.l 40(a2),d1
     158:	b2b9 0000 58d4 	cmp.l 58d4 <ClsSprites+0x28>,d1
     15e:	6600 1234      	bne.w 1394 <main+0x138e>
     162:	206a 002c      	movea.l 44(a2),a0
     166:	b1f9 0000 58d8 	cmpa.l 58d8 <ClsSprites+0x2c>,a0
     16c:	6600 1226      	bne.w 1394 <main+0x138e>
     170:	202a 0030      	move.l 48(a2),d0
     174:	b0b9 0000 58dc 	cmp.l 58dc <ClsSprites+0x30>,d0
     17a:	6600 1218      	bne.w 1394 <main+0x138e>
     17e:	222a 0034      	move.l 52(a2),d1
     182:	b2b9 0000 58e0 	cmp.l 58e0 <ClsSprites+0x34>,d1
     188:	6600 120a      	bne.w 1394 <main+0x138e>
     18c:	206a 0038      	movea.l 56(a2),a0
     190:	b1f9 0000 58e4 	cmpa.l 58e4 <ClsSprites+0x38>,a0
     196:	6600 11fc      	bne.w 1394 <main+0x138e>
     19a:	246a 003c      	movea.l 60(a2),a2
     19e:	b5f9 0000 58e8 	cmpa.l 58e8 <ClsSprites+0x3c>,a2
     1a4:	6600 11ee      	bne.w 1394 <main+0x138e>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1a8:	2079 0000 5994 	movea.l 5994 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ae:	2039 0000 587c 	move.l 587c <ClScreen>,d0
     1b4:	b0a8 0040      	cmp.l 64(a0),d0
     1b8:	6600 1224      	bne.w 13de <main+0x13d8>
     1bc:	2239 0000 5880 	move.l 5880 <ClScreen+0x4>,d1
     1c2:	b2a8 0044      	cmp.l 68(a0),d1
     1c6:	6600 1216      	bne.w 13de <main+0x13d8>
     1ca:	2028 0048      	move.l 72(a0),d0
     1ce:	b0b9 0000 5884 	cmp.l 5884 <ClScreen+0x8>,d0
     1d4:	6600 1208      	bne.w 13de <main+0x13d8>
     1d8:	2239 0000 5888 	move.l 5888 <ClScreen+0xc>,d1
     1de:	b2a8 004c      	cmp.l 76(a0),d1
     1e2:	6600 11fa      	bne.w 13de <main+0x13d8>
     1e6:	2039 0000 588c 	move.l 588c <ClScreen+0x10>,d0
     1ec:	b0a8 0050      	cmp.l 80(a0),d0
     1f0:	6600 11ec      	bne.w 13de <main+0x13d8>
     1f4:	2228 0054      	move.l 84(a0),d1
     1f8:	b2b9 0000 5890 	cmp.l 5890 <ClScreen+0x14>,d1
     1fe:	6600 11de      	bne.w 13de <main+0x13d8>
     202:	2039 0000 5894 	move.l 5894 <ClScreen+0x18>,d0
     208:	b0a8 0058      	cmp.l 88(a0),d0
     20c:	6600 11d0      	bne.w 13de <main+0x13d8>
     210:	2228 005c      	move.l 92(a0),d1
     214:	b2b9 0000 5898 	cmp.l 5898 <ClScreen+0x1c>,d1
     21a:	6600 11c2      	bne.w 13de <main+0x13d8>
     21e:	2039 0000 589c 	move.l 589c <ClScreen+0x20>,d0
     224:	b0a8 0060      	cmp.l 96(a0),d0
     228:	6600 11b4      	bne.w 13de <main+0x13d8>
     22c:	2239 0000 58a0 	move.l 58a0 <ClScreen+0x24>,d1
     232:	b2a8 0064      	cmp.l 100(a0),d1
     236:	6600 11a6      	bne.w 13de <main+0x13d8>
     23a:	2039 0000 58a4 	move.l 58a4 <ClScreen+0x28>,d0
     240:	b0a8 0068      	cmp.l 104(a0),d0
     244:	6600 1198      	bne.w 13de <main+0x13d8>
     248:	2068 006c      	movea.l 108(a0),a0
     24c:	b1f9 0000 58a8 	cmpa.l 58a8 <ClScreen+0x2c>,a0
     252:	6600 118a      	bne.w 13de <main+0x13d8>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     256:	23fc 0004 0000 	move.l #262144,5988 <DrawBuffer>
     25c:	0000 5988 
  ViewBuffer = (ULONG *)0x50000;
     260:	23fc 0005 0000 	move.l #327680,597c <ViewBuffer>
     266:	0000 597c 
  SetBplPointers();
     26a:	45f9 0000 237a 	lea 237a <SetBplPointers>,a2
     270:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     272:	0cb9 0005 0000 	cmpi.l #327680,5988 <DrawBuffer>
     278:	0000 5988 
     27c:	6700 13ec      	beq.w 166a <main+0x1664>
    Write( Output(), 
     280:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     286:	4eae ffc4      	jsr -60(a6)
     28a:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     290:	2200           	move.l d0,d1
     292:	243c 0000 3141 	move.l #12609,d2
     298:	763b           	moveq #59,d3
     29a:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     29e:	2079 0000 5994 	movea.l 5994 <Copperlist1>,a0
     2a4:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2aa:	0070 
     2ac:	6724           	beq.s 2d2 <main+0x2cc>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ae:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     2b4:	4eae ffc4      	jsr -60(a6)
     2b8:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     2be:	2200           	move.l d0,d1
     2c0:	243c 0000 317d 	move.l #12669,d2
     2c6:	763c           	moveq #60,d3
     2c8:	4eae ffd0      	jsr -48(a6)
     2cc:	2079 0000 5994 	movea.l 5994 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2d2:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2d8:	0074 
     2da:	6724           	beq.s 300 <main+0x2fa>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2dc:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     2e2:	4eae ffc4      	jsr -60(a6)
     2e6:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     2ec:	2200           	move.l d0,d1
     2ee:	243c 0000 31ba 	move.l #12730,d2
     2f4:	763c           	moveq #60,d3
     2f6:	4eae ffd0      	jsr -48(a6)
     2fa:	2079 0000 5994 	movea.l 5994 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     300:	2228 0078      	move.l 120(a0),d1
     304:	b2b9 0000 5874 	cmp.l 5874 <ClColor>,d1
     30a:	6600 10aa      	bne.w 13b6 <main+0x13b0>
     30e:	2028 007c      	move.l 124(a0),d0
     312:	b0b9 0000 5878 	cmp.l 5878 <ClColor+0x4>,d0
     318:	6600 109c      	bne.w 13b6 <main+0x13b0>
  if( instructions[pos] == value ) 
     31c:	72fe           	moveq #-2,d1
     31e:	b2a8 0080      	cmp.l 128(a0),d1
     322:	671e           	beq.s 342 <main+0x33c>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     324:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     32a:	4eae ffc4      	jsr -60(a6)
     32e:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     334:	2200           	move.l d0,d1
     336:	243c 0000 3219 	move.l #12825,d2
     33c:	7622           	moveq #34,d3
     33e:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     342:	47f9 0000 2172 	lea 2172 <SwapCl>,a3
     348:	4e93           	jsr (a3)
  if( DrawCopper != Copperlist2)
     34a:	2079 0000 5984 	movea.l 5984 <DrawCopper>,a0
     350:	b1f9 0000 5990 	cmpa.l 5990 <Copperlist2>,a0
     356:	671e           	beq.s 376 <main+0x370>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     358:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     35e:	4eae ffc4      	jsr -60(a6)
     362:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     368:	2200           	move.l d0,d1
     36a:	243c 0000 323c 	move.l #12860,d2
     370:	7615           	moveq #21,d3
     372:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     376:	49f9 0000 23a6 	lea 23a6 <PrepareDisplay>,a4
     37c:	4e94           	jsr (a4)
  if( DrawBuffer != Bitplane1) 
     37e:	2039 0000 5988 	move.l 5988 <DrawBuffer>,d0
     384:	b0b9 0000 598c 	cmp.l 598c <Bitplane1>,d0
     38a:	671e           	beq.s 3aa <main+0x3a4>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     38c:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     392:	4eae ffc4      	jsr -60(a6)
     396:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     39c:	2200           	move.l d0,d1
     39e:	243c 0000 3252 	move.l #12882,d2
     3a4:	7637           	moveq #55,d3
     3a6:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3aa:	2239 0000 5984 	move.l 5984 <DrawCopper>,d1
     3b0:	b2b9 0000 5994 	cmp.l 5994 <Copperlist1>,d1
     3b6:	671e           	beq.s 3d6 <main+0x3d0>
    Write( Output(), 
     3b8:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     3be:	4eae ffc4      	jsr -60(a6)
     3c2:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     3c8:	2200           	move.l d0,d1
     3ca:	243c 0000 328a 	move.l #12938,d2
     3d0:	7639           	moveq #57,d3
     3d2:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3d6:	4e94           	jsr (a4)

  if( ViewBuffer != Bitplane2) 
     3d8:	2079 0000 597c 	movea.l 597c <ViewBuffer>,a0
     3de:	b1f9 0000 5980 	cmpa.l 5980 <Bitplane2>,a0
     3e4:	671e           	beq.s 404 <main+0x3fe>
    Write( Output(), 
     3e6:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     3ec:	4eae ffc4      	jsr -60(a6)
     3f0:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     3f6:	2200           	move.l d0,d1
     3f8:	243c 0000 32c4 	move.l #12996,d2
     3fe:	7638           	moveq #56,d3
     400:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     404:	2039 0000 5978 	move.l 5978 <ViewCopper>,d0
     40a:	b0b9 0000 5990 	cmp.l 5990 <Copperlist2>,d0
     410:	671e           	beq.s 430 <main+0x42a>
    Write( Output(), 
     412:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     418:	4eae ffc4      	jsr -60(a6)
     41c:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     422:	2200           	move.l d0,d1
     424:	243c 0000 32fd 	move.l #13053,d2
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
     434:	2079 0000 5978 	movea.l 5978 <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     43a:	7000           	moveq #0,d0
     43c:	3028 0072      	move.w 114(a0),d0
     440:	4840           	swap d0
     442:	4240           	clr.w d0
     444:	7200           	moveq #0,d1
     446:	3228 0076      	move.w 118(a0),d1
     44a:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     44c:	b0b9 0000 5980 	cmp.l 5980 <Bitplane2>,d0
     452:	671e           	beq.s 472 <main+0x46c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     454:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     45a:	4eae ffc4      	jsr -60(a6)
     45e:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     464:	2200           	move.l d0,d1
     466:	243c 0000 3338 	move.l #13112,d2
     46c:	7648           	moveq #72,d3
     46e:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     472:	4e93           	jsr (a3)
  SetBplPointers();
     474:	4e92           	jsr (a2)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     476:	2079 0000 5978 	movea.l 5978 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     47c:	7000           	moveq #0,d0
     47e:	3028 0072      	move.w 114(a0),d0
     482:	4840           	swap d0
     484:	4240           	clr.w d0
     486:	7200           	moveq #0,d1
     488:	3228 0076      	move.w 118(a0),d1
     48c:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     48e:	b0b9 0000 598c 	cmp.l 598c <Bitplane1>,d0
     494:	671e           	beq.s 4b4 <main+0x4ae>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     496:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     49c:	4eae ffc4      	jsr -60(a6)
     4a0:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     4a6:	2200           	move.l d0,d1
     4a8:	243c 0000 3381 	move.l #13185,d2
     4ae:	7649           	moveq #73,d3
     4b0:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4b4:	4e93           	jsr (a3)
  SetBplPointers();
     4b6:	4e92           	jsr (a2)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     4b8:	2079 0000 5978 	movea.l 5978 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4be:	7000           	moveq #0,d0
     4c0:	3028 0072      	move.w 114(a0),d0
     4c4:	4840           	swap d0
     4c6:	4240           	clr.w d0
     4c8:	7200           	moveq #0,d1
     4ca:	3228 0076      	move.w 118(a0),d1
     4ce:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4d0:	b0b9 0000 5980 	cmp.l 5980 <Bitplane2>,d0
     4d6:	671e           	beq.s 4f6 <main+0x4f0>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4d8:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     4de:	4eae ffc4      	jsr -60(a6)
     4e2:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     4e8:	2200           	move.l d0,d1
     4ea:	243c 0000 33cb 	move.l #13259,d2
     4f0:	7648           	moveq #72,d3
     4f2:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     4f6:	2f3c 0000 c800 	move.l #51200,-(sp)
     4fc:	4878 0084      	pea 84 <main+0x7e>
     500:	4eb9 0000 24e4 	jsr 24e4 <FreeDisplay>
  TestZoom4Picture();
}

void ZoomTestDisplay() {

  PrepareDisplayZoom();
     506:	47f9 0000 2198 	lea 2198 <PrepareDisplayZoom>,a3
     50c:	4e93           	jsr (a3)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     50e:	4878 0010      	pea 10 <main+0xa>
     512:	4879 0000 58ac 	pea 58ac <ClsSprites>
     518:	42a7           	clr.l -(sp)
     51a:	2f39 0000 5994 	move.l 5994 <Copperlist1>,-(sp)
     520:	49f9 0000 1a74 	lea 1a74 <TestCopperlistBatch>,a4
     526:	4e94           	jsr (a4)
     528:	4fef 0018      	lea 24(sp),sp
     52c:	4a80           	tst.l d0
     52e:	661e           	bne.s 54e <main+0x548>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     530:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     536:	4eae ffc4      	jsr -60(a6)
     53a:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     540:	2200           	move.l d0,d1
     542:	243c 0000 3414 	move.l #13332,d2
     548:	762c           	moveq #44,d3
     54a:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
     54e:	4878 000c      	pea c <main+0x6>
     552:	4879 0000 5844 	pea 5844 <ClScreenZoom>
     558:	4878 0010      	pea 10 <main+0xa>
     55c:	2f39 0000 5994 	move.l 5994 <Copperlist1>,-(sp)
     562:	4e94           	jsr (a4)
     564:	4fef 0010      	lea 16(sp),sp
     568:	4a80           	tst.l d0
     56a:	661e           	bne.s 58a <main+0x584>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     56c:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     572:	4eae ffc4      	jsr -60(a6)
     576:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     57c:	2200           	move.l d0,d1
     57e:	243c 0000 344a 	move.l #13386,d2
     584:	7636           	moveq #54,d3
     586:	4eae ffd0      	jsr -48(a6)
  //ZoomHorizontal = 10;
}

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
  UWORD *copword = (UWORD *) DrawCopper;
     58a:	2079 0000 5984 	movea.l 5984 <DrawCopper>,a0
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
     5a6:	23fc 0005 0000 	move.l #327680,5988 <DrawBuffer>
     5ac:	0000 5988 
  ViewBuffer = (ULONG *) tmp;
     5b0:	23fc 0004 0000 	move.l #262144,597c <ViewBuffer>
     5b6:	0000 597c 
  Zoom_SetBplPointers();
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
     5ba:	2f3c 00e0 0004 	move.l #14680068,-(sp)
     5c0:	4878 001c      	pea 1c <main+0x16>
     5c4:	2f39 0000 5994 	move.l 5994 <Copperlist1>,-(sp)
     5ca:	4eb9 0000 1a56 	jsr 1a56 <TestCopperlistPos>
     5d0:	4fef 000c      	lea 12(sp),sp
     5d4:	4a80           	tst.l d0
     5d6:	661e           	bne.s 5f6 <main+0x5f0>
    Write(Output(), 
     5d8:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     5de:	4eae ffc4      	jsr -60(a6)
     5e2:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     5e8:	2200           	move.l d0,d1
     5ea:	243c 0000 317d 	move.l #12669,d2
     5f0:	763c           	moveq #60,d3
     5f2:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
     5f6:	2f3c 00e2 0000 	move.l #14811136,-(sp)
     5fc:	4878 001d      	pea 1d <main+0x17>
     600:	2f39 0000 5994 	move.l 5994 <Copperlist1>,-(sp)
     606:	4eb9 0000 1a56 	jsr 1a56 <TestCopperlistPos>
     60c:	4fef 000c      	lea 12(sp),sp
     610:	4a80           	tst.l d0
     612:	661e           	bne.s 632 <main+0x62c>
    Write(Output(), 
     614:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     61a:	4eae ffc4      	jsr -60(a6)
     61e:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     624:	2200           	move.l d0,d1
     626:	243c 0000 31ba 	move.l #12730,d2
     62c:	763c           	moveq #60,d3
     62e:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
     632:	2f3c 00e4 0004 	move.l #14942212,-(sp)
     638:	4878 001e      	pea 1e <main+0x18>
     63c:	2f39 0000 5994 	move.l 5994 <Copperlist1>,-(sp)
     642:	4eb9 0000 1a56 	jsr 1a56 <TestCopperlistPos>
     648:	4fef 000c      	lea 12(sp),sp
     64c:	4a80           	tst.l d0
     64e:	661e           	bne.s 66e <main+0x668>
    Write(Output(), 
     650:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     656:	4eae ffc4      	jsr -60(a6)
     65a:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     660:	2200           	move.l d0,d1
     662:	243c 0000 3481 	move.l #13441,d2
     668:	763c           	moveq #60,d3
     66a:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
     66e:	2f3c 00e6 2800 	move.l #15083520,-(sp)
     674:	4878 001f      	pea 1f <main+0x19>
     678:	2f39 0000 5994 	move.l 5994 <Copperlist1>,-(sp)
     67e:	4eb9 0000 1a56 	jsr 1a56 <TestCopperlistPos>
     684:	4fef 000c      	lea 12(sp),sp
     688:	4a80           	tst.l d0
     68a:	661e           	bne.s 6aa <main+0x6a4>
    Write(Output(), 
     68c:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     692:	4eae ffc4      	jsr -60(a6)
     696:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     69c:	2200           	move.l d0,d1
     69e:	243c 0000 34be 	move.l #13502,d2
     6a4:	763c           	moveq #60,d3
     6a6:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl2pl should be 2800\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
     6aa:	4878 0002      	pea 2 <_start+0x2>
     6ae:	4879 0000 5874 	pea 5874 <ClColor>
     6b4:	4878 0020      	pea 20 <main+0x1a>
     6b8:	2f39 0000 5994 	move.l 5994 <Copperlist1>,-(sp)
     6be:	4e94           	jsr (a4)
     6c0:	4fef 0010      	lea 16(sp),sp
     6c4:	4a80           	tst.l d0
     6c6:	661e           	bne.s 6e6 <main+0x6e0>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     6c8:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     6ce:	4eae ffc4      	jsr -60(a6)
     6d2:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     6d8:	2200           	move.l d0,d1
     6da:	243c 0000 31f7 	move.l #12791,d2
     6e0:	7621           	moveq #33,d3
     6e2:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     6e6:	4878 0040      	pea 40 <main+0x3a>
     6ea:	4879 0000 3804 	pea 3804 <incbin_swfont_end+0x822>
     6f0:	486d ffc0      	pea -64(a5)
     6f4:	4eb9 0000 259c 	jsr 259c <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
     6fa:	4878 0010      	pea 10 <main+0xa>
     6fe:	486d ffc0      	pea -64(a5)
     702:	4878 0022      	pea 22 <main+0x1c>
     706:	2f39 0000 5994 	move.l 5994 <Copperlist1>,-(sp)
     70c:	4e94           	jsr (a4)
     70e:	4fef 001c      	lea 28(sp),sp
     712:	4a80           	tst.l d0
     714:	661e           	bne.s 734 <main+0x72e>
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);
     716:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     71c:	4eae ffc4      	jsr -60(a6)
     720:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     726:	2200           	move.l d0,d1
     728:	243c 0000 34fb 	move.l #13563,d2
     72e:	7621           	moveq #33,d3
     730:	4eae ffd0      	jsr -48(a6)

  ULONG clpart2[] = { 0x2d07fffe, 0x018200f0, 0x01820f00 };
     734:	2b7c 2d07 fffe 	move.l #755499006,-76(a5)
     73a:	ffb4 
     73c:	2b7c 0182 00f0 	move.l #25297136,-72(a5)
     742:	ffb8 
     744:	2b7c 0182 0f00 	move.l #25300736,-68(a5)
     74a:	ffbc 

  if( TestCopperlistBatch( Copperlist1, 75, clpart2, 3) == 0)
     74c:	4878 0003      	pea 3 <_start+0x3>
     750:	486d ffb4      	pea -76(a5)
     754:	4878 004b      	pea 4b <main+0x45>
     758:	2f39 0000 5994 	move.l 5994 <Copperlist1>,-(sp)
     75e:	4e94           	jsr (a4)
     760:	4fef 0010      	lea 16(sp),sp
     764:	4a80           	tst.l d0
     766:	661e           	bne.s 786 <main+0x780>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     768:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     76e:	4eae ffc4      	jsr -60(a6)
     772:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     778:	2200           	move.l d0,d1
     77a:	243c 0000 351d 	move.l #13597,d2
     780:	762c           	moveq #44,d3
     782:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
     786:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdce33>
     78a:	4878 2922      	pea 2922 <font2distance+0xc6>
     78e:	2f39 0000 5994 	move.l 5994 <Copperlist1>,-(sp)
     794:	4eb9 0000 1a56 	jsr 1a56 <TestCopperlistPos>
     79a:	4fef 000c      	lea 12(sp),sp
     79e:	4a80           	tst.l d0
     7a0:	661e           	bne.s 7c0 <main+0x7ba>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     7a2:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     7a8:	4eae ffc4      	jsr -60(a6)
     7ac:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     7b2:	2200           	move.l d0,d1
     7b4:	243c 0000 3219 	move.l #12825,d2
     7ba:	7622           	moveq #34,d3
     7bc:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     7c0:	2f3c 0001 6800 	move.l #92160,-(sp)
     7c6:	2f3c 0000 a48c 	move.l #42124,-(sp)
     7cc:	4eb9 0000 24e4 	jsr 24e4 <FreeDisplay>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     7d2:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
     7d8:	7004           	moveq #4,d0
     7da:	7202           	moveq #2,d1
     7dc:	4eae ff3a      	jsr -198(a6)
  ZoomHorizontal = 16;
     7e0:	33fc 0010 0000 	move.w #16,595c <ZoomHorizontal>
     7e6:	595c 

}

void TestBlitleftOfZoom() {
  Zoom_Init();
  PrepareDisplayZoom();
     7e8:	4e93           	jsr (a3)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     7ea:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
     7f0:	203c 0000 c800 	move.l #51200,d0
     7f6:	7202           	moveq #2,d1
     7f8:	4eae ff3a      	jsr -198(a6)
     7fc:	2440           	movea.l d0,a2
     7fe:	23c0 0000 5958 	move.l d0,5958 <Zoom_Source>
  if( Zoom_Source == 0) {
     804:	508f           	addq.l #8,sp
     806:	6700 0f20      	beq.w 1728 <main+0x1722>
    return;
  }

  
  UWORD *tstsource = Zoom_Source;
  *tstsource++ = 0x0000;
     80a:	4252           	clr.w (a2)
  *tstsource = 0x0080;
     80c:	357c 0080 0002 	move.w #128,2(a2)
  tstsource += ZMLINESIZE/2-1;
  *tstsource = 0x1000;
     812:	357c 1000 0030 	move.w #4096,48(a2)
  tstsource++;
  *tstsource = 0x8e88;
     818:	357c 8e88 0032 	move.w #-29048,50(a2)
  tstsource += ZMLINESIZE/2-1;

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
  *tstsource++ = 0x0000;
     81e:	426a 17d0      	clr.w 6096(a2)
  *tstsource = 0x00ff;
     822:	357c 00ff 17d2 	move.w #255,6098(a2)

  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 0, 8, 128);
     828:	2439 0000 5988 	move.l 5988 <DrawBuffer>,d2
    srca = source + 1;
     82e:	2600           	move.l d0,d3
     830:	5483           	addq.l #2,d3
  WaitBlit();
     832:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
     838:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     83c:	2079 0000 5974 	movea.l 5974 <hw>,a0
     842:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
     848:	317c fde4 0040 	move.w #-540,64(a0)
  hw->bltafwm = 0xffff;
     84e:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     854:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     85a:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     860:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     866:	317c ff00 0070 	move.w #-256,112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     86c:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = srca;
     872:	2143 0050      	move.l d3,80(a0)
  hw->bltbpt = srcb;
     876:	214a 004c      	move.l a2,76(a0)
  hw->bltdpt = destination;
     87a:	2142 0054      	move.l d2,84(a0)
  hw->bltsize = height*64+2;
     87e:	317c 2002 0058 	move.w #8194,88(a0)
  WaitBlit();
     884:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
     88a:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
     88e:	2479 0000 5988 	movea.l 5988 <DrawBuffer>,a2
  if( *destination != 0x0180) {
     894:	0c6a 0180 0002 	cmpi.w #384,2(a2)
     89a:	671e           	beq.s 8ba <main+0x8b4>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
     89c:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     8a2:	4eae ffc4      	jsr -60(a6)
     8a6:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     8ac:	2200           	move.l d0,d1
     8ae:	243c 0000 3582 	move.l #13698,d2
     8b4:	761c           	moveq #28,d3
     8b6:	4eae ffd0      	jsr -48(a6)
  }
  destination += ZMLINESIZE/2;
  if( *destination != 0x1d88)
     8ba:	0c6a 1d88 0032 	cmpi.w #7560,50(a2)
     8c0:	671e           	beq.s 8e0 <main+0x8da>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
     8c2:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     8c8:	4eae ffc4      	jsr -60(a6)
     8cc:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     8d2:	2200           	move.l d0,d1
     8d4:	243c 0000 359f 	move.l #13727,d2
     8da:	761c           	moveq #28,d3
     8dc:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
  destination++;
  if( *destination != 0x01ff) {
     8e0:	2079 0000 5988 	movea.l 5988 <DrawBuffer>,a0
     8e6:	0c68 01ff 17d2 	cmpi.w #511,6098(a0)
     8ec:	671e           	beq.s 90c <main+0x906>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
     8ee:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     8f4:	4eae ffc4      	jsr -60(a6)
     8f8:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     8fe:	2200           	move.l d0,d1
     900:	243c 0000 35bc 	move.l #13756,d2
     906:	761a           	moveq #26,d3
     908:	4eae ffd0      	jsr -48(a6)
  }
  FreeMem( Zoom_Source, 40*256*5);
     90c:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
     912:	2279 0000 5958 	movea.l 5958 <Zoom_Source>,a1
     918:	203c 0000 c800 	move.l #51200,d0
     91e:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     922:	2f3c 0001 6800 	move.l #92160,-(sp)
     928:	2f3c 0000 a48c 	move.l #42124,-(sp)
     92e:	4eb9 0000 24e4 	jsr 24e4 <FreeDisplay>
     934:	508f           	addq.l #8,sp
}

void TestCopyColumnOfZoom() {

  PrepareDisplayZoom();
     936:	4e93           	jsr (a3)

  UWORD *destination = (UWORD *)DrawBuffer;
     938:	2079 0000 5988 	movea.l 5988 <DrawBuffer>,a0
  *destination= 0x0000;
     93e:	4250           	clr.w (a0)
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
     940:	317c 000f 0030 	move.w #15,48(a0)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     946:	317c 000f 47d0 	move.w #15,18384(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     94c:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
     952:	203c 0000 c800 	move.l #51200,d0
     958:	7202           	moveq #2,d1
     95a:	4eae ff3a      	jsr -198(a6)
     95e:	2440           	movea.l d0,a2
     960:	23c0 0000 5958 	move.l d0,5958 <Zoom_Source>
  if( Zoom_Source == 0) {
     966:	6700 0e12      	beq.w 177a <main+0x1774>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }

  UWORD *tstsource = Zoom_Source;
  *tstsource = 0xffff;
     96a:	34bc ffff      	move.w #-1,(a2)
  tstsource += ZMLINESIZE/2;
  *tstsource = 0xffff;
     96e:	357c ffff 0030 	move.w #-1,48(a2)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0xc000;
     974:	357c c000 47d0 	move.w #-16384,18384(a2)
  Zoom_CopyColumn( Zoom_Source, (UWORD *)DrawBuffer, 1, 1);
     97a:	2439 0000 5988 	move.l 5988 <DrawBuffer>,d2
  WaitBlit();
     980:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
     986:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     98a:	2079 0000 5974 	movea.l 5974 <hw>,a0
     990:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4;
     996:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltafwm = 0xffff;
     99c:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     9a2:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 2;
     9a8:	317c 002e 0064 	move.w #46,100(a0)
  hw->bltbmod = ZMLINESIZE - 2;
     9ae:	317c 002e 0062 	move.w #46,98(a0)
  hw->bltdmod = ZMLINESIZE - 2;
     9b4:	317c 002e 0066 	move.w #46,102(a0)
  hw->bltcdat = bltmask;
     9ba:	317c 4000 0070 	move.w #16384,112(a0)
  hw->bltapt = (UWORD *) sourcepos;
     9c0:	214a 0050      	move.l a2,80(a0)
  hw->bltbpt = (UWORD *) destpos;
     9c4:	2142 004c      	move.l d2,76(a0)
  hw->bltdpt = (UWORD *) destpos;
     9c8:	2142 0054      	move.l d2,84(a0)
  hw->bltsize = ZMCOLHEIGHT*64+1;
     9cc:	317c 6001 0058 	move.w #24577,88(a0)
  
  WaitBlit();
     9d2:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
     9d8:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     9dc:	2479 0000 5988 	movea.l 5988 <DrawBuffer>,a2
  if( *destination != 0x4000)
     9e2:	0c52 4000      	cmpi.w #16384,(a2)
     9e6:	671e           	beq.s a06 <main+0xa00>
    Write(  Output(), "Zoomtest: CopyColumn2 - First row wrong.\n",41);
     9e8:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     9ee:	4eae ffc4      	jsr -60(a6)
     9f2:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     9f8:	2200           	move.l d0,d1
     9fa:	243c 0000 35d7 	move.l #13783,d2
     a00:	7629           	moveq #41,d3
     a02:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x400f)
     a06:	0c6a 400f 0030 	cmpi.w #16399,48(a2)
     a0c:	671e           	beq.s a2c <main+0xa26>
    Write(  Output(), "Zoomtest: CopyColumn2 - Second row wrong.\n",42);
     a0e:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     a14:	4eae ffc4      	jsr -60(a6)
     a18:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     a1e:	2200           	move.l d0,d1
     a20:	243c 0000 3601 	move.l #13825,d2
     a26:	762a           	moveq #42,d3
     a28:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x400f)
     a2c:	2479 0000 5988 	movea.l 5988 <DrawBuffer>,a2
     a32:	0c6a 400f 47d0 	cmpi.w #16399,18384(a2)
     a38:	6724           	beq.s a5e <main+0xa58>
    Write(  Output(), "Zoomtest: CopyColumn2 - Last row wrong.\n",40);
     a3a:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     a40:	4eae ffc4      	jsr -60(a6)
     a44:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     a4a:	2200           	move.l d0,d1
     a4c:	243c 0000 362c 	move.l #13868,d2
     a52:	7628           	moveq #40,d3
     a54:	4eae ffd0      	jsr -48(a6)
     a58:	2479 0000 5988 	movea.l 5988 <DrawBuffer>,a2

  destination = (UWORD *)DrawBuffer;
  *destination= 0x0000;
     a5e:	4252           	clr.w (a2)
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
     a60:	357c 000f 0030 	move.w #15,48(a2)
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
     a66:	357c 000f 47d0 	move.w #15,18384(a2)

  tstsource = Zoom_Source;
     a6c:	2679 0000 5958 	movea.l 5958 <Zoom_Source>,a3
  *tstsource = 0xffff;
     a72:	36bc ffff      	move.w #-1,(a3)
  tstsource += ZMLINESIZE/2;
  *tstsource = 0xffff;
     a76:	377c ffff 0030 	move.w #-1,48(a3)
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0x8000;
     a7c:	377c 8000 47d0 	move.w #-32768,18384(a3)
  WaitBlit();
     a82:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
     a88:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     a8c:	2079 0000 5974 	movea.l 5974 <hw>,a0
     a92:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4;
     a98:	317c 0de4 0040 	move.w #3556,64(a0)
  hw->bltafwm = 0xffff;
     a9e:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     aa4:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 2;
     aaa:	317c 002e 0064 	move.w #46,100(a0)
  hw->bltbmod = ZMLINESIZE - 2;
     ab0:	317c 002e 0062 	move.w #46,98(a0)
  hw->bltdmod = ZMLINESIZE - 2;
     ab6:	317c 002e 0066 	move.w #46,102(a0)
  hw->bltcdat = bltmask;
     abc:	317c 8000 0070 	move.w #-32768,112(a0)
  hw->bltapt = (UWORD *) sourcepos;
     ac2:	214b 0050      	move.l a3,80(a0)
  hw->bltbpt = (UWORD *) destpos;
     ac6:	214a 004c      	move.l a2,76(a0)
  hw->bltdpt = (UWORD *) destpos;
     aca:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = ZMCOLHEIGHT*64+1;
     ace:	317c 6001 0058 	move.w #24577,88(a0)
  Zoom_CopyColumn( Zoom_Source, (UWORD *)DrawBuffer, 0, 0);
  
  WaitBlit();
     ad4:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
     ada:	4eae ff1c      	jsr -228(a6)
  destination = (UWORD *)DrawBuffer;
     ade:	2479 0000 5988 	movea.l 5988 <DrawBuffer>,a2
  if( *destination != 0x8000)
     ae4:	0c52 8000      	cmpi.w #-32768,(a2)
     ae8:	671e           	beq.s b08 <main+0xb02>
    Write(  Output(), "Zoomtest: CopyColumn - First row wrong.\n",40);
     aea:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     af0:	4eae ffc4      	jsr -60(a6)
     af4:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     afa:	2200           	move.l d0,d1
     afc:	243c 0000 3655 	move.l #13909,d2
     b02:	7628           	moveq #40,d3
     b04:	4eae ffd0      	jsr -48(a6)

  destination+= ZMLINESIZE/2;
  if( *destination != 0x800f)
     b08:	0c6a 800f 0030 	cmpi.w #-32753,48(a2)
     b0e:	671e           	beq.s b2e <main+0xb28>
    Write(  Output(), "Zoomtest: CopyColumn - Second row wrong.\n",41);
     b10:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     b16:	4eae ffc4      	jsr -60(a6)
     b1a:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     b20:	2200           	move.l d0,d1
     b22:	243c 0000 367e 	move.l #13950,d2
     b28:	7629           	moveq #41,d3
     b2a:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x800f)
     b2e:	2079 0000 5988 	movea.l 5988 <DrawBuffer>,a0
     b34:	0c68 800f 47d0 	cmpi.w #-32753,18384(a0)
     b3a:	671e           	beq.s b5a <main+0xb54>
    Write(  Output(), "Zoomtest: CopyColumn - Last row wrong.\n",39);
     b3c:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     b42:	4eae ffc4      	jsr -60(a6)
     b46:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     b4c:	2200           	move.l d0,d1
     b4e:	243c 0000 36a8 	move.l #13992,d2
     b54:	7627           	moveq #39,d3
     b56:	4eae ffd0      	jsr -48(a6)

  FreeMem( Zoom_Source, 40*256*5);
     b5a:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
     b60:	2279 0000 5958 	movea.l 5958 <Zoom_Source>,a1
     b66:	203c 0000 c800 	move.l #51200,d0
     b6c:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     b70:	2f3c 0001 6800 	move.l #92160,-(sp)
     b76:	2f3c 0000 a48c 	move.l #42124,-(sp)
     b7c:	4eb9 0000 24e4 	jsr 24e4 <FreeDisplay>
     b82:	508f           	addq.l #8,sp
}

void TestCopyWord() {
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
     b84:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
     b8a:	203c 0000 05a0 	move.l #1440,d0
     b90:	7202           	moveq #2,d1
     b92:	4eae ff3a      	jsr -198(a6)
     b96:	2440           	movea.l d0,a2
  if( source == 0) {
     b98:	4a80           	tst.l d0
     b9a:	6700 0b34      	beq.w 16d0 <main+0x16ca>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
     b9e:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
     ba4:	203c 0000 05a0 	move.l #1440,d0
     baa:	7202           	moveq #2,d1
     bac:	4eae ff3a      	jsr -198(a6)
     bb0:	2640           	movea.l d0,a3
  if( destination == 0) {
     bb2:	4a80           	tst.l d0
     bb4:	6700 0b1a      	beq.w 16d0 <main+0x16ca>
    return;
  }
  
  UWORD *tmp = source;
  for( int i=0; i<8;i++) {
    *tmp++ = 0;
     bb8:	4252           	clr.w (a2)
    *tmp++ = 0xaaaa;
     bba:	357c aaaa 0002 	move.w #-21846,2(a2)
    *tmp++ = 0xaaaa;
     bc0:	357c aaaa 0004 	move.w #-21846,4(a2)
    *tmp = 0;
     bc6:	426a 0006      	clr.w 6(a2)
    tmp += ZMLINESIZE/2-3;
    *tmp++ = 0;
     bca:	426a 0030      	clr.w 48(a2)
    *tmp++ = 0x5555;
     bce:	357c 5555 0032 	move.w #21845,50(a2)
    *tmp++ = 0x5555;
     bd4:	357c 5555 0034 	move.w #21845,52(a2)
    *tmp = 0;
     bda:	426a 0036      	clr.w 54(a2)
    *tmp++ = 0;
     bde:	426a 0060      	clr.w 96(a2)
    *tmp++ = 0xaaaa;
     be2:	357c aaaa 0062 	move.w #-21846,98(a2)
    *tmp++ = 0xaaaa;
     be8:	357c aaaa 0064 	move.w #-21846,100(a2)
    *tmp = 0;
     bee:	426a 0066      	clr.w 102(a2)
    *tmp++ = 0;
     bf2:	426a 0090      	clr.w 144(a2)
    *tmp++ = 0x5555;
     bf6:	357c 5555 0092 	move.w #21845,146(a2)
    *tmp++ = 0x5555;
     bfc:	357c 5555 0094 	move.w #21845,148(a2)
    *tmp = 0;
     c02:	426a 0096      	clr.w 150(a2)
    *tmp++ = 0;
     c06:	426a 00c0      	clr.w 192(a2)
    *tmp++ = 0xaaaa;
     c0a:	357c aaaa 00c2 	move.w #-21846,194(a2)
    *tmp++ = 0xaaaa;
     c10:	357c aaaa 00c4 	move.w #-21846,196(a2)
    *tmp = 0;
     c16:	426a 00c6      	clr.w 198(a2)
    *tmp++ = 0;
     c1a:	426a 00f0      	clr.w 240(a2)
    *tmp++ = 0x5555;
     c1e:	357c 5555 00f2 	move.w #21845,242(a2)
    *tmp++ = 0x5555;
     c24:	357c 5555 00f4 	move.w #21845,244(a2)
    *tmp = 0;
     c2a:	426a 00f6      	clr.w 246(a2)
    *tmp++ = 0;
     c2e:	426a 0120      	clr.w 288(a2)
    *tmp++ = 0xaaaa;
     c32:	357c aaaa 0122 	move.w #-21846,290(a2)
    *tmp++ = 0xaaaa;
     c38:	357c aaaa 0124 	move.w #-21846,292(a2)
    *tmp = 0;
     c3e:	426a 0126      	clr.w 294(a2)
    *tmp++ = 0;
     c42:	426a 0150      	clr.w 336(a2)
    *tmp++ = 0x5555;
     c46:	357c 5555 0152 	move.w #21845,338(a2)
    *tmp++ = 0x5555;
     c4c:	357c 5555 0154 	move.w #21845,340(a2)
    *tmp = 0;
     c52:	426a 0156      	clr.w 342(a2)
    *tmp++ = 0;
     c56:	426a 0180      	clr.w 384(a2)
    *tmp++ = 0xaaaa;
     c5a:	357c aaaa 0182 	move.w #-21846,386(a2)
    *tmp++ = 0xaaaa;
     c60:	357c aaaa 0184 	move.w #-21846,388(a2)
    *tmp = 0;
     c66:	426a 0186      	clr.w 390(a2)
    *tmp++ = 0;
     c6a:	426a 01b0      	clr.w 432(a2)
    *tmp++ = 0x5555;
     c6e:	357c 5555 01b2 	move.w #21845,434(a2)
    *tmp++ = 0x5555;
     c74:	357c 5555 01b4 	move.w #21845,436(a2)
    *tmp = 0;
     c7a:	426a 01b6      	clr.w 438(a2)
    *tmp++ = 0;
     c7e:	426a 01e0      	clr.w 480(a2)
    *tmp++ = 0xaaaa;
     c82:	357c aaaa 01e2 	move.w #-21846,482(a2)
    *tmp++ = 0xaaaa;
     c88:	357c aaaa 01e4 	move.w #-21846,484(a2)
    *tmp = 0;
     c8e:	426a 01e6      	clr.w 486(a2)
    *tmp++ = 0;
     c92:	426a 0210      	clr.w 528(a2)
    *tmp++ = 0x5555;
     c96:	357c 5555 0212 	move.w #21845,530(a2)
    *tmp++ = 0x5555;
     c9c:	357c 5555 0214 	move.w #21845,532(a2)
    *tmp = 0;
     ca2:	426a 0216      	clr.w 534(a2)
    *tmp++ = 0;
     ca6:	426a 0240      	clr.w 576(a2)
    *tmp++ = 0xaaaa;
     caa:	357c aaaa 0242 	move.w #-21846,578(a2)
    *tmp++ = 0xaaaa;
     cb0:	357c aaaa 0244 	move.w #-21846,580(a2)
    *tmp = 0;
     cb6:	426a 0246      	clr.w 582(a2)
    *tmp++ = 0;
     cba:	426a 0270      	clr.w 624(a2)
    *tmp++ = 0x5555;
     cbe:	357c 5555 0272 	move.w #21845,626(a2)
    *tmp++ = 0x5555;
     cc4:	357c 5555 0274 	move.w #21845,628(a2)
    *tmp = 0;
     cca:	426a 0276      	clr.w 630(a2)
    *tmp++ = 0;
     cce:	426a 02a0      	clr.w 672(a2)
    *tmp++ = 0xaaaa;
     cd2:	357c aaaa 02a2 	move.w #-21846,674(a2)
    *tmp++ = 0xaaaa;
     cd8:	357c aaaa 02a4 	move.w #-21846,676(a2)
    *tmp = 0;
     cde:	426a 02a6      	clr.w 678(a2)
    *tmp++ = 0;
     ce2:	426a 02d0      	clr.w 720(a2)
    *tmp++ = 0x5555;
     ce6:	357c 5555 02d2 	move.w #21845,722(a2)
    *tmp++ = 0x5555;
     cec:	357c 5555 02d4 	move.w #21845,724(a2)
    *tmp = 0;
     cf2:	426a 02d6      	clr.w 726(a2)
    tmp += ZMLINESIZE/2-3;
     cf6:	4878 05a0      	pea 5a0 <main+0x59a>
     cfa:	42a7           	clr.l -(sp)
     cfc:	2f00           	move.l d0,-(sp)
     cfe:	4eb9 0000 262e 	jsr 262e <memset>
  WaitBlit();
     d04:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
     d0a:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     d0e:	2079 0000 5974 	movea.l 5974 <hw>,a0
     d14:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
     d1a:	317c 39f0 0040 	move.w #14832,64(a0)
  hw->bltafwm = 0xffff;
     d20:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     d26:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     d2c:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     d32:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
     d38:	200a           	move.l a2,d0
     d3a:	5480           	addq.l #2,d0
     d3c:	2140 0050      	move.l d0,80(a0)
  hw->bltdpt = (UWORD *) destination;
     d40:	214b 0054      	move.l a3,84(a0)
  hw->bltsize = height*64+2;
     d44:	317c 0402 0058 	move.w #1026,88(a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    *tmp++ = 0;
  }

  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 3, 16);
  WaitBlit();
     d4a:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
     d50:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
  if( *tmp != 0x5555) 
     d54:	4fef 000c      	lea 12(sp),sp
     d58:	0c6b 5555 0002 	cmpi.w #21845,2(a3)
     d5e:	671e           	beq.s d7e <main+0xd78>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
     d60:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     d66:	4eae ffc4      	jsr -60(a6)
     d6a:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     d70:	2200           	move.l d0,d1
     d72:	243c 0000 3706 	move.l #14086,d2
     d78:	761f           	moveq #31,d3
     d7a:	4eae ffd0      	jsr -48(a6)
  tmp += ZMLINESIZE/2;
  if( *tmp != 0xaaaa)
     d7e:	0c6b aaaa 0032 	cmpi.w #-21846,50(a3)
     d84:	671e           	beq.s da4 <main+0xd9e>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
     d86:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     d8c:	4eae ffc4      	jsr -60(a6)
     d90:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
     d96:	2200           	move.l d0,d1
     d98:	243c 0000 3726 	move.l #14118,d2
     d9e:	7620           	moveq #32,d3
     da0:	4eae ffd0      	jsr -48(a6)
  
  FreeMem( source,ZMLINESIZE*30);
     da4:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
     daa:	224a           	movea.l a2,a1
     dac:	203c 0000 05a0 	move.l #1440,d0
     db2:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
     db6:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
     dbc:	224b           	movea.l a3,a1
     dbe:	203c 0000 05a0 	move.l #1440,d0
     dc4:	4eae ff2e      	jsr -210(a6)
5    5    5    2    a    a    a    a    9    5    5    5    5    4    a    a
abcd efgh ijkl 1234 5678 9abc defg hijk l123 4567 89ab cdef ghij kl12 3456 789a
1010 1010 1010 0101 0101 0101 0101 0101 0010 1010 1010 1010 1010 1001 0101 0101
a    a    a    5    5    5    5    5    2    a    a    a    a    9    5    5*/ 
void TestZoom4Picture() {
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     dc8:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
     dce:	203c 0000 3740 	move.l #14144,d0
     dd4:	7202           	moveq #2,d1
     dd6:	4eae ff3a      	jsr -198(a6)
     dda:	2400           	move.l d0,d2
  if( source == 0) {
     ddc:	6700 0928      	beq.w 1706 <main+0x1700>
    Write(  Output(), 
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     de0:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
     de6:	203c 0000 3740 	move.l #14144,d0
     dec:	7202           	moveq #2,d1
     dee:	4eae ff3a      	jsr -198(a6)
     df2:	2b40 ffac      	move.l d0,-84(a5)
  if( destination == 0) {
     df6:	6700 09ce      	beq.w 17c6 <main+0x17c0>
     dfa:	2002           	move.l d2,d0
     dfc:	0680 0000 3300 	addi.l #13056,d0
     e02:	2042           	movea.l d2,a0
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
  for(int i=0;i<128+8;i++) {
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0x55555555;
     e04:	20bc 5555 5555 	move.l #1431655765,(a0)
     e0a:	217c 5555 5555 	move.l #1431655765,4(a0)
     e10:	0004 
     e12:	217c 5555 5555 	move.l #1431655765,8(a0)
     e18:	0008 
     e1a:	217c 5555 5555 	move.l #1431655765,12(a0)
     e20:	000c 
     e22:	217c 5555 5555 	move.l #1431655765,16(a0)
     e28:	0010 
     e2a:	217c 5555 5555 	move.l #1431655765,20(a0)
     e30:	0014 
     e32:	217c 5555 5555 	move.l #1431655765,24(a0)
     e38:	0018 
     e3a:	217c 5555 5555 	move.l #1431655765,28(a0)
     e40:	001c 
     e42:	217c 5555 5555 	move.l #1431655765,32(a0)
     e48:	0020 
     e4a:	217c 5555 5555 	move.l #1431655765,36(a0)
     e50:	0024 
     e52:	217c 5555 5555 	move.l #1431655765,40(a0)
     e58:	0028 
     e5a:	217c 5555 5555 	move.l #1431655765,44(a0)
     e60:	002c 
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0xaaaaaaaa;
     e62:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
     e68:	0030 
     e6a:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
     e70:	0034 
     e72:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
     e78:	0038 
     e7a:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
     e80:	003c 
     e82:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
     e88:	0040 
     e8a:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
     e90:	0044 
     e92:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
     e98:	0048 
     e9a:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
     ea0:	004c 
     ea2:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
     ea8:	0050 
     eaa:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
     eb0:	0054 
     eb2:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
     eb8:	0058 
     eba:	41e8 0060      	lea 96(a0),a0
     ebe:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
     ec4:	fffc 
  for(int i=0;i<128+8;i++) {
     ec6:	b088           	cmp.l a0,d0
     ec8:	6600 ff3a      	bne.w e04 <main+0xdfe>
     ecc:	0682 0000 01ac 	addi.l #428,d2
     ed2:	2b42 ff96      	move.l d2,-106(a5)
     ed6:	307c 002c      	movea.w #44,a0
     eda:	d1ed ffac      	adda.l -84(a5),a0
     ede:	2b48 ff9e      	move.l a0,-98(a5)
  WORD shiftright = 9;
     ee2:	7609           	moveq #9,d3
  UWORD shifttoleft = 0;
     ee4:	426d ffb0      	clr.w -80(a5)
  UWORD nextzoom = 22*16 - 20 + (zoomnr << 3);
     ee8:	3b7c 014c ff94 	move.w #332,-108(a5)
  UWORD startofword = 21*16;
     eee:	3b7c 0150 ff92 	move.w #336,-110(a5)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*8-2-i;
     ef4:	282d ff96      	move.l -106(a5),d4
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
     ef8:	246d ff9e      	movea.l -98(a5),a2
    ZoomHorizontal = 15 - zoomnr * 6;
     efc:	33fc 000f 0000 	move.w #15,595c <ZoomHorizontal>
     f02:	595c 
     f04:	7000           	moveq #0,d0
     f06:	302d ffb0      	move.w -80(a5),d0
     f0a:	d080           	add.l d0,d0
     f0c:	2b40 ff8e      	move.l d0,-114(a5)
     f10:	3b43 ffb2      	move.w d3,-78(a5)
     f14:	3a03           	move.w d3,d5
     f16:	700c           	moveq #12,d0
     f18:	e16d           	lsl.w d0,d5
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
     f1a:	322d ff92      	move.w -110(a5),d1
     f1e:	b26d ff94      	cmp.w -108(a5),d1
     f22:	6500 0530      	bcs.w 1454 <main+0x144e>
  hw->bltcon0 = 0x9f0 + shiftright;
     f26:	0645 09f0      	addi.w #2544,d5
     f2a:	7c11           	moveq #17,d6
    UWORD linesleft = 272;
     f2c:	343c 0110      	move.w #272,d2
     f30:	2644           	movea.l d4,a3
     f32:	d7ed ff8e      	adda.l -114(a5),a3
        if( linesleft >= ZoomHorizontal+1) {
     f36:	0c42 000f      	cmpi.w #15,d2
     f3a:	6300 050a      	bls.w 1446 <main+0x1440>
          linesleft -= ZoomHorizontal;
     f3e:	0642 fff1      	addi.w #-15,d2
     f42:	7e0f           	moveq #15,d7
  WaitBlit();
     f44:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
     f4a:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     f4e:	2079 0000 5974 	movea.l 5974 <hw>,a0
     f54:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
     f5a:	3145 0040      	move.w d5,64(a0)
  hw->bltafwm = 0xffff;
     f5e:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     f64:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     f6a:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     f70:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
     f76:	214b 0050      	move.l a3,80(a0)
  hw->bltdpt = (UWORD *) destination;
     f7a:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
     f7e:	ed4f           	lsl.w #6,d7
     f80:	5447           	addq.w #2,d7
     f82:	3147 0058      	move.w d7,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
     f86:	7200           	moveq #0,d1
     f88:	3239 0000 595c 	move.w 595c <ZoomHorizontal>,d1
     f8e:	2001           	move.l d1,d0
     f90:	d081           	add.l d1,d0
     f92:	d081           	add.l d1,d0
     f94:	e988           	lsl.l #4,d0
     f96:	d880           	add.l d0,d4
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
     f98:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
     f9a:	4a42           	tst.w d2
     f9c:	6700 0494      	beq.w 1432 <main+0x142c>
          Zoom_CopyWord( pos4source+shifttoleft, pos4dest, shiftright, 1);
     fa0:	266d ff8e      	movea.l -114(a5),a3
     fa4:	d7c4           	adda.l d4,a3
  WaitBlit();
     fa6:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
     fac:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = 0; 
     fb0:	2079 0000 5974 	movea.l 5974 <hw>,a0
     fb6:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
     fbc:	3145 0040      	move.w d5,64(a0)
  hw->bltafwm = 0xffff;
     fc0:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     fc6:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     fcc:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     fd2:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = (UWORD *) source;
     fd8:	214b 0050      	move.l a3,80(a0)
  hw->bltdpt = (UWORD *) destination;
     fdc:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
     fe0:	317c 0042 0058 	move.w #66,88(a0)
          linesleft--;
     fe6:	5342           	subq.w #1,d2
          pos4dest += ZMLINESIZE/2;
     fe8:	45ea 0030      	lea 48(a2),a2
        ZoomHorizontal = 15 - zoomnr + (zoomnr << 1);
     fec:	33fc 000f 0000 	move.w #15,595c <ZoomHorizontal>
     ff2:	595c 
     ff4:	5386           	subq.l #1,d6
      for(int i=0;i<17;i++) {
     ff6:	6600 ff3e      	bne.w f36 <main+0xf30>
    startofword -= 16;
     ffa:	066d fff0 ff92 	addi.w #-16,-110(a5)
    1000:	55ad ff96      	subq.l #2,-106(a5)
    1004:	55ad ff9e      	subq.l #2,-98(a5)
  for(int i=0;i<22;i++) {
    1008:	0c6d fff0 ff92 	cmpi.w #-16,-110(a5)
    100e:	6600 fee4      	bne.w ef4 <main+0xeee>
  }

  Zoom_ZoomIntoPicture( source, destination, 0);
  WaitBlit();
    1012:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
    1018:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
  UWORD *valsupposed = destlinezoom1;
  UWORD mask = 0x0;
  for(int i=0;i<17;i++) {
    101c:	242d ffac      	move.l -84(a5),d2
    1020:	0682 0000 02d4 	addi.l #724,d2
  WaitBlit();
    1026:	347c 000f      	movea.w #15,a2
  UWORD mask = 0x0;
    102a:	4244           	clr.w d4
    102c:	7600           	moveq #0,d3
    102e:	4df9 0000 1940 	lea 1940 <TestRow.constprop.3>,a6
    1034:	2642           	movea.l d2,a3
    1036:	47eb fd30      	lea -720(a3),a3
    103a:	7af1           	moveq #-15,d5
    103c:	da8a           	add.l a2,d5
    for(int i2=0;i2<15;i2++) { 
      UWORD *bp = (UWORD *)0x200;
      *bp = 0; 
    103e:	4278 0200      	clr.w 200 <main+0x1fa>
      TestRow( valsupposed, valactual, mask, i2+i*16);
    1042:	2f05           	move.l d5,-(sp)
    1044:	2f03           	move.l d3,-(sp)
    1046:	2f0b           	move.l a3,-(sp)
    1048:	4e96           	jsr (a6)
      valactual += ZMLINESIZE/2;
    104a:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    104e:	4644           	not.w d4
    1050:	5285           	addq.l #1,d5
    for(int i2=0;i2<15;i2++) { 
    1052:	4fef 000c      	lea 12(sp),sp
    1056:	b48b           	cmp.l a3,d2
    1058:	6600 03d0      	bne.w 142a <main+0x1424>
    }
    TestRow( valsupposed, valactual, mask, 15+i*16);
    105c:	2f0a           	move.l a2,-(sp)
    105e:	7600           	moveq #0,d3
    1060:	3604           	move.w d4,d3
    1062:	2f03           	move.l d3,-(sp)
    1064:	2f02           	move.l d2,-(sp)
    1066:	4e96           	jsr (a6)
    valactual += ZMLINESIZE/2;
    1068:	0682 0000 0300 	addi.l #768,d2
    106e:	45ea 0010      	lea 16(a2),a2
  for(int i=0;i<17;i++) {
    1072:	4fef 000c      	lea 12(sp),sp
    1076:	b4fc 011f      	cmpa.w #287,a2
    107a:	66b8           	bne.s 1034 <main+0x102e>
char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
  PrepareDisplaySW();
    107c:	4eb9 0000 23a6 	jsr 23a6 <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    1082:	4878 0010      	pea 10 <main+0xa>
    1086:	4879 0000 58ac 	pea 58ac <ClsSprites>
    108c:	42a7           	clr.l -(sp)
    108e:	2f39 0000 5994 	move.l 5994 <Copperlist1>,-(sp)
    1094:	4e94           	jsr (a4)
    1096:	4fef 0010      	lea 16(sp),sp
    109a:	4a80           	tst.l d0
    109c:	661e           	bne.s 10bc <main+0x10b6>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    109e:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    10a4:	4eae ffc4      	jsr -60(a6)
    10a8:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    10ae:	2200           	move.l d0,d1
    10b0:	243c 0000 3414 	move.l #13332,d2
    10b6:	762c           	moveq #44,d3
    10b8:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    10bc:	4878 000c      	pea c <main+0x6>
    10c0:	4879 0000 587c 	pea 587c <ClScreen>
    10c6:	4878 0010      	pea 10 <main+0xa>
    10ca:	2f39 0000 5994 	move.l 5994 <Copperlist1>,-(sp)
    10d0:	4e94           	jsr (a4)
    10d2:	4fef 0010      	lea 16(sp),sp
    10d6:	4a80           	tst.l d0
    10d8:	661e           	bne.s 10f8 <main+0x10f2>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
    10da:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    10e0:	4eae ffc4      	jsr -60(a6)
    10e4:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    10ea:	2200           	move.l d0,d1
    10ec:	243c 0000 344a 	move.l #13386,d2
    10f2:	7636           	moveq #54,d3
    10f4:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    10f8:	4878 0002      	pea 2 <_start+0x2>
    10fc:	4879 0000 5874 	pea 5874 <ClColor>
    1102:	4878 001e      	pea 1e <main+0x18>
    1106:	2f39 0000 5994 	move.l 5994 <Copperlist1>,-(sp)
    110c:	4e94           	jsr (a4)
    110e:	4fef 0010      	lea 16(sp),sp
    1112:	4a80           	tst.l d0
    1114:	661e           	bne.s 1134 <main+0x112e>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    1116:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    111c:	4eae ffc4      	jsr -60(a6)
    1120:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    1126:	2200           	move.l d0,d1
    1128:	243c 0000 31f7 	move.l #12791,d2
    112e:	7621           	moveq #33,d3
    1130:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    1134:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdce33>
    1138:	4878 0020      	pea 20 <main+0x1a>
    113c:	2f39 0000 5994 	move.l 5994 <Copperlist1>,-(sp)
    1142:	4eb9 0000 1a56 	jsr 1a56 <TestCopperlistPos>
    1148:	4fef 000c      	lea 12(sp),sp
    114c:	4a80           	tst.l d0
    114e:	661e           	bne.s 116e <main+0x1168>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
    1150:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    1156:	4eae ffc4      	jsr -60(a6)
    115a:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    1160:	2200           	move.l d0,d1
    1162:	243c 0000 3219 	move.l #12825,d2
    1168:	7622           	moveq #34,d3
    116a:	4eae ffd0      	jsr -48(a6)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
    116e:	2479 0000 5988 	movea.l 5988 <DrawBuffer>,a2
    1174:	4879 0000 37c0 	pea 37c0 <incbin_swfont_end+0x7de>
    117a:	2f0a           	move.l a2,-(sp)
    117c:	4eb9 0000 17e8 	jsr 17e8 <WriteFont.constprop.4>

  UWORD *tstpointer = DrawBuffer;
  if( *tstpointer != 0xff00)
    1182:	508f           	addq.l #8,sp
    1184:	0c52 ff00      	cmpi.w #-256,(a2)
    1188:	671e           	beq.s 11a8 <main+0x11a2>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
    118a:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    1190:	4eae ffc4      	jsr -60(a6)
    1194:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    119a:	2200           	move.l d0,d1
    119c:	243c 0000 37d1 	move.l #14289,d2
    11a2:	7631           	moveq #49,d3
    11a4:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
    11a8:	2f3c 0000 c800 	move.l #51200,-(sp)
    11ae:	4878 0084      	pea 84 <main+0x7e>
    11b2:	4eb9 0000 24e4 	jsr 24e4 <FreeDisplay>
  RunTests();
	Delay(50);
    11b8:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    11be:	7232           	moveq #50,d1
    11c0:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
    11c4:	247c 00f0 ff60 	movea.l #15794016,a2
    11ca:	508f           	addq.l #8,sp
    11cc:	4a92           	tst.l (a2)
    11ce:	6718           	beq.s 11e8 <main+0x11e2>
    11d0:	4878 0001      	pea 1 <_start+0x1>
    11d4:	47f9 0000 1836 	lea 1836 <warpmode.part.0>,a3
    11da:	4e93           	jsr (a3)
    11dc:	588f           	addq.l #4,sp
    11de:	4a92           	tst.l (a2)
    11e0:	6706           	beq.s 11e8 <main+0x11e2>
    11e2:	42a7           	clr.l -(sp)
    11e4:	4e93           	jsr (a3)
    11e6:	588f           	addq.l #4,sp
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
    11e8:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
    11ee:	23ee 0022 0000 	move.l 34(a6),595e <ActiView>
    11f4:	595e 
	OwnBlitter();
    11f6:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
    11fa:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
    1200:	4eae ff1c      	jsr -228(a6)
	Disable();
    1204:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    120a:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
    120e:	2679 0000 5974 	movea.l 5974 <hw>,a3
    1214:	302b 0010      	move.w 16(a3),d0
    1218:	33c0 0000 5962 	move.w d0,5962 <SystemADKCON>
	SystemInts=hw->intenar;
    121e:	302b 001c      	move.w 28(a3),d0
    1222:	33c0 0000 5966 	move.w d0,5966 <SystemInts>
	SystemDMA=hw->dmaconr;
    1228:	302b 0002      	move.w 2(a3),d0
    122c:	33c0 0000 5964 	move.w d0,5964 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
    1232:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    1238:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
    123e:	45f9 0000 2556 	lea 2556 <WaitVbl>,a2
    1244:	4e92           	jsr (a2)
	WaitVbl();
    1246:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
    1248:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
    124e:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
    1254:	93c9           	suba.l a1,a1
    1256:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    125a:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
    1260:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    1264:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
    126a:	4eae fef2      	jsr -270(a6)

	WaitVbl();
    126e:	4e92           	jsr (a2)
	WaitVbl();
    1270:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
    1272:	3b7c 4e7a ffc0 	move.w #20090,-64(a5)
    1278:	3b7c 0801 ffc2 	move.w #2049,-62(a5)
    127e:	3b7c 4e73 ffc4 	move.w #20083,-60(a5)
	if (SysBase->AttnFlags & AFF_68010) 
    1284:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    128a:	082e 0000 0129 	btst #0,297(a6)
    1290:	6700 050a      	beq.w 179c <main+0x1796>
		vbr = (APTR)Supervisor((void*)getvbr);
    1294:	7ec0           	moveq #-64,d7
    1296:	de8d           	add.l a5,d7
    1298:	cf8d           	exg d7,a5
    129a:	4eae ffe2      	jsr -30(a6)
    129e:	cf8d           	exg d7,a5

	VBR=GetVBR();
    12a0:	23c0 0000 5968 	move.l d0,5968 <VBR.lto_priv.5>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    12a6:	2079 0000 5968 	movea.l 5968 <VBR.lto_priv.5>,a0
    12ac:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    12b0:	23c2 0000 596c 	move.l d2,596c <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
    12b6:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
    12b8:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    12ba:	2079 0000 5974 	movea.l 5974 <hw>,a0
    12c0:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    12c4:	3028 0002      	move.w 2(a0),d0
    12c8:	0800 000e      	btst #14,d0
    12cc:	66f6           	bne.s 12c4 <main+0x12be>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
    12ce:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    12d4:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
    12da:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
    12e0:	2279 0000 5968 	movea.l 5968 <VBR.lto_priv.5>,a1
    12e6:	2342 006c      	move.l d2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
    12ea:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
    12f0:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
    12f6:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
    12fc:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
    1302:	3039 0000 5966 	move.w 5966 <SystemInts>,d0
    1308:	0040 8000      	ori.w #-32768,d0
    130c:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
    1310:	3039 0000 5964 	move.w 5964 <SystemDMA>,d0
    1316:	0040 8000      	ori.w #-32768,d0
    131a:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
    131e:	3039 0000 5962 	move.w 5962 <SystemADKCON>,d0
    1324:	0040 8000      	ori.w #-32768,d0
    1328:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
    132c:	2279 0000 595e 	movea.l 595e <ActiView>,a1
    1332:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    1336:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
    133c:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    1340:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
    1346:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
    134a:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
    1350:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
    1354:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
    135a:	4eae fe32      	jsr -462(a6)
	Enable();
    135e:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    1364:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
    1368:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    136e:	2279 0000 5998 	movea.l 5998 <DOSBase>,a1
    1374:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
    1378:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    137e:	2279 0000 5970 	movea.l 5970 <GfxBase>,a1
    1384:	4eae fe62      	jsr -414(a6)
}
    1388:	7000           	moveq #0,d0
    138a:	4ced 5cfc ff64 	movem.l -156(a5),d2-d7/a2-a4/a6
    1390:	4e5d           	unlk a5
    1392:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    1394:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    139a:	4eae ffc4      	jsr -60(a6)
    139e:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    13a4:	2200           	move.l d0,d1
    13a6:	243c 0000 3414 	move.l #13332,d2
    13ac:	762c           	moveq #44,d3
    13ae:	4eae ffd0      	jsr -48(a6)
    13b2:	6000 edf4      	bra.w 1a8 <main+0x1a2>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    13b6:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    13bc:	4eae ffc4      	jsr -60(a6)
    13c0:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    13c6:	2200           	move.l d0,d1
    13c8:	243c 0000 31f7 	move.l #12791,d2
    13ce:	7621           	moveq #33,d3
    13d0:	4eae ffd0      	jsr -48(a6)
    13d4:	2079 0000 5994 	movea.l 5994 <Copperlist1>,a0
    13da:	6000 ef40      	bra.w 31c <main+0x316>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    13de:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    13e4:	4eae ffc4      	jsr -60(a6)
    13e8:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    13ee:	2200           	move.l d0,d1
    13f0:	243c 0000 344a 	move.l #13386,d2
    13f6:	7636           	moveq #54,d3
    13f8:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
    13fc:	23fc 0004 0000 	move.l #262144,5988 <DrawBuffer>
    1402:	0000 5988 
  ViewBuffer = (ULONG *)0x50000;
    1406:	23fc 0005 0000 	move.l #327680,597c <ViewBuffer>
    140c:	0000 597c 
  SetBplPointers();
    1410:	45f9 0000 237a 	lea 237a <SetBplPointers>,a2
    1416:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    1418:	0cb9 0005 0000 	cmpi.l #327680,5988 <DrawBuffer>
    141e:	0000 5988 
    1422:	6600 ee5c      	bne.w 280 <main+0x27a>
    1426:	6000 0242      	bra.w 166a <main+0x1664>
    142a:	7600           	moveq #0,d3
    142c:	3604           	move.w d4,d3
    142e:	6000 fc0e      	bra.w 103e <main+0x1038>
        ZoomHorizontal = 15 - zoomnr + (zoomnr << 1);
    1432:	33fc 000f 0000 	move.w #15,595c <ZoomHorizontal>
    1438:	595c 
    143a:	5386           	subq.l #1,d6
      for(int i=0;i<17;i++) {
    143c:	6700 fbbc      	beq.w ffa <main+0xff4>
    1440:	266d ff8e      	movea.l -114(a5),a3
    1444:	d7c4           	adda.l d4,a3
          ZoomHorizontal = linesleft;
    1446:	33c2 0000 595c 	move.w d2,595c <ZoomHorizontal>
          linesleft = 0;
    144c:	3e02           	move.w d2,d7
    144e:	4242           	clr.w d2
    1450:	6000 faf2      	bra.w f44 <main+0xf3e>
      UWORD colnr = nextzoom - startofword - 1; 
    1454:	302d ff94      	move.w -108(a5),d0
    1458:	5340           	subq.w #1,d0
    145a:	906d ff92      	sub.w -110(a5),d0
      nextzoom -= (19 + zoomnr);
    145e:	066d ffed ff94 	addi.w #-19,-108(a5)
    shifta = (shift - 1) << 12;
    1464:	3203           	move.w d3,d1
    1466:	5341           	subq.w #1,d1
    1468:	3b41 ffa6      	move.w d1,-90(a5)
    146c:	3401           	move.w d1,d2
    146e:	720c           	moveq #12,d1
    1470:	e36a           	lsl.w d1,d2
  hw->bltcon0 = 0xde4 + shifta;
    1472:	323c f000      	move.w #-4096,d1
    1476:	4a43           	tst.w d3
    1478:	6702           	beq.s 147c <main+0x1476>
    147a:	3202           	move.w d2,d1
    147c:	3641           	movea.w d1,a3
    147e:	47eb 0de4      	lea 3556(a3),a3
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, shiftright, colnr, 
    1482:	0280 0000 ffff 	andi.l #65535,d0
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1488:	7210           	moveq #16,d1
    148a:	9280           	sub.l d0,d1
    148c:	2001           	move.l d1,d0
    148e:	7200           	moveq #0,d1
    1490:	4641           	not.w d1
    1492:	e1a9           	lsl.l d0,d1
    1494:	3b41 ffaa      	move.w d1,-86(a5)
    1498:	7011           	moveq #17,d0
    149a:	2b40 ff9a      	move.l d0,-102(a5)
    UWORD linesleft = 272;
    149e:	343c 0110      	move.w #272,d2
    14a2:	3e05           	move.w d5,d7
        if( linesleft >= ZoomHorizontal+1) {
    14a4:	0c42 000f      	cmpi.w #15,d2
    14a8:	6300 01b2      	bls.w 165c <main+0x1656>
          linesleft -= ZoomHorizontal;
    14ac:	0642 fff1      	addi.w #-15,d2
    14b0:	7a0f           	moveq #15,d5
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, shiftright, colnr, 
    14b2:	2c2d ff8e      	move.l -114(a5),d6
    14b6:	dc84           	add.l d4,d6
  if( shift == 0) {
    14b8:	4a43           	tst.w d3
    14ba:	6600 012c      	bne.w 15e8 <main+0x15e2>
    srca = source + 1;
    14be:	2206           	move.l d6,d1
    14c0:	5481           	addq.l #2,d1
    14c2:	2b41 ffa2      	move.l d1,-94(a5)
  WaitBlit();
    14c6:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
    14cc:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    14d0:	2079 0000 5974 	movea.l 5974 <hw>,a0
    14d6:	3147 0042      	move.w d7,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    14da:	314b 0040      	move.w a3,64(a0)
  hw->bltafwm = 0xffff;
    14de:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    14e4:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    14ea:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    14f0:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    14f6:	316d ffaa 0070 	move.w -86(a5),112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    14fc:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = srca;
    1502:	216d ffa2 0050 	move.l -94(a5),80(a0)
  hw->bltbpt = srcb;
    1508:	2146 004c      	move.l d6,76(a0)
  hw->bltdpt = destination;
    150c:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    1510:	ed4d           	lsl.w #6,d5
    1512:	5445           	addq.w #2,d5
    1514:	3145 0058      	move.w d5,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    1518:	7200           	moveq #0,d1
    151a:	3239 0000 595c 	move.w 595c <ZoomHorizontal>,d1
    1520:	2001           	move.l d1,d0
    1522:	d081           	add.l d1,d0
    1524:	d081           	add.l d1,d0
    1526:	e988           	lsl.l #4,d0
    1528:	d880           	add.l d0,d4
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    152a:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    152c:	4a42           	tst.w d2
    152e:	6642           	bne.s 1572 <main+0x156c>
        ZoomHorizontal = 15 - zoomnr + (zoomnr << 1);
    1530:	33fc 000f 0000 	move.w #15,595c <ZoomHorizontal>
    1536:	595c 
    1538:	53ad ff9a      	subq.l #1,-102(a5)
      for(int i=0;i<17;i++) {
    153c:	6600 ff66      	bne.w 14a4 <main+0x149e>
      shiftright--;  
    1540:	362d ffa6      	move.w -90(a5),d3
      if(shiftright < 0) {
    1544:	6c00 fab4      	bge.w ffa <main+0xff4>
        shiftright += 16;
    1548:	362d ffb2      	move.w -78(a5),d3
    154c:	0643 000f      	addi.w #15,d3
        shifttoleft = 1;
    1550:	3b7c 0001 ffb0 	move.w #1,-80(a5)
    startofword -= 16;
    1556:	066d fff0 ff92 	addi.w #-16,-110(a5)
    155c:	55ad ff96      	subq.l #2,-106(a5)
    1560:	55ad ff9e      	subq.l #2,-98(a5)
  for(int i=0;i<22;i++) {
    1564:	0c6d fff0 ff92 	cmpi.w #-16,-110(a5)
    156a:	6600 f988      	bne.w ef4 <main+0xeee>
    156e:	6000 faa2      	bra.w 1012 <main+0x100c>
          Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, shiftright, colnr, 
    1572:	2a2d ff8e      	move.l -114(a5),d5
    1576:	da84           	add.l d4,d5
    srca = source + 1;
    1578:	2c05           	move.l d5,d6
  if( shift == 0) {
    157a:	4a43           	tst.w d3
    157c:	6602           	bne.s 1580 <main+0x157a>
    srca = source + 1;
    157e:	5486           	addq.l #2,d6
  WaitBlit();
    1580:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
    1586:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    158a:	2079 0000 5974 	movea.l 5974 <hw>,a0
    1590:	3147 0042      	move.w d7,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1594:	314b 0040      	move.w a3,64(a0)
  hw->bltafwm = 0xffff;
    1598:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    159e:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    15a4:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    15aa:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    15b0:	316d ffaa 0070 	move.w -86(a5),112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    15b6:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = srca;
    15bc:	2146 0050      	move.l d6,80(a0)
  hw->bltbpt = srcb;
    15c0:	2145 004c      	move.l d5,76(a0)
  hw->bltdpt = destination;
    15c4:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    15c8:	317c 0042 0058 	move.w #66,88(a0)
          pos4dest += ZMLINESIZE/2;
    15ce:	45ea 0030      	lea 48(a2),a2
          linesleft--;
    15d2:	5342           	subq.w #1,d2
        ZoomHorizontal = 15 - zoomnr + (zoomnr << 1);
    15d4:	33fc 000f 0000 	move.w #15,595c <ZoomHorizontal>
    15da:	595c 
    15dc:	53ad ff9a      	subq.l #1,-102(a5)
      for(int i=0;i<17;i++) {
    15e0:	6600 fec2      	bne.w 14a4 <main+0x149e>
    15e4:	6000 ff5a      	bra.w 1540 <main+0x153a>
    srca = source;
    15e8:	2b46 ffa2      	move.l d6,-94(a5)
  WaitBlit();
    15ec:	2c79 0000 5970 	movea.l 5970 <GfxBase>,a6
    15f2:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    15f6:	2079 0000 5974 	movea.l 5974 <hw>,a0
    15fc:	3147 0042      	move.w d7,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1600:	314b 0040      	move.w a3,64(a0)
  hw->bltafwm = 0xffff;
    1604:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    160a:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    1610:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    1616:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    161c:	316d ffaa 0070 	move.w -86(a5),112(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    1622:	317c 002c 0066 	move.w #44,102(a0)
  hw->bltapt = srca;
    1628:	216d ffa2 0050 	move.l -94(a5),80(a0)
  hw->bltbpt = srcb;
    162e:	2146 004c      	move.l d6,76(a0)
  hw->bltdpt = destination;
    1632:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    1636:	ed4d           	lsl.w #6,d5
    1638:	5445           	addq.w #2,d5
    163a:	3145 0058      	move.w d5,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    163e:	7200           	moveq #0,d1
    1640:	3239 0000 595c 	move.w 595c <ZoomHorizontal>,d1
    1646:	2001           	move.l d1,d0
    1648:	d081           	add.l d1,d0
    164a:	d081           	add.l d1,d0
    164c:	e988           	lsl.l #4,d0
    164e:	d880           	add.l d0,d4
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    1650:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    1652:	4a42           	tst.w d2
    1654:	6700 feda      	beq.w 1530 <main+0x152a>
    1658:	6000 ff18      	bra.w 1572 <main+0x156c>
          ZoomHorizontal = linesleft;
    165c:	33c2 0000 595c 	move.w d2,595c <ZoomHorizontal>
    1662:	3a02           	move.w d2,d5
          linesleft = 0;
    1664:	4242           	clr.w d2
    1666:	6000 fe4a      	bra.w 14b2 <main+0x14ac>
    166a:	0cb9 0004 0000 	cmpi.l #262144,597c <ViewBuffer>
    1670:	0000 597c 
    1674:	6700 ec28      	beq.w 29e <main+0x298>
    Write( Output(), 
    1678:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    167e:	4eae ffc4      	jsr -60(a6)
    1682:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    1688:	2200           	move.l d0,d1
    168a:	243c 0000 3141 	move.l #12609,d2
    1690:	763b           	moveq #59,d3
    1692:	4eae ffd0      	jsr -48(a6)
    1696:	6000 ec06      	bra.w 29e <main+0x298>
		Exit(0);
    169a:	9dce           	suba.l a6,a6
    169c:	7200           	moveq #0,d1
    169e:	4eae ff70      	jsr -144(a6)
    16a2:	6000 e9b0      	bra.w 54 <main+0x4e>
		Exit(0);
    16a6:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    16ac:	7200           	moveq #0,d1
    16ae:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
    16b2:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    16b8:	43f9 0000 3106 	lea 3106 <incbin_swfont_end+0x124>,a1
    16be:	7000           	moveq #0,d0
    16c0:	4eae fdd8      	jsr -552(a6)
    16c4:	23c0 0000 5998 	move.l d0,5998 <DOSBase>
	if (!DOSBase)
    16ca:	6600 e988      	bne.w 54 <main+0x4e>
    16ce:	60ca           	bra.s 169a <main+0x1694>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    16d0:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    16d6:	4eae ffc4      	jsr -60(a6)
    16da:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    16e0:	2200           	move.l d0,d1
    16e2:	243c 0000 36d0 	move.l #14032,d2
    16e8:	7635           	moveq #53,d3
    16ea:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    16ee:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    16f4:	203c 0000 3740 	move.l #14144,d0
    16fa:	7202           	moveq #2,d1
    16fc:	4eae ff3a      	jsr -198(a6)
    1700:	2400           	move.l d0,d2
  if( source == 0) {
    1702:	6600 f6dc      	bne.w de0 <main+0xdda>
    Write(  Output(), 
    1706:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    170c:	4eae ffc4      	jsr -60(a6)
    1710:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    1716:	2200           	move.l d0,d1
    1718:	243c 0000 3747 	move.l #14151,d2
    171e:	7639           	moveq #57,d3
    1720:	4eae ffd0      	jsr -48(a6)
    return;
    1724:	6000 f956      	bra.w 107c <main+0x1076>
    Write(  Output(), 
    1728:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    172e:	4eae ffc4      	jsr -60(a6)
    1732:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    1738:	2200           	move.l d0,d1
    173a:	243c 0000 354a 	move.l #13642,d2
    1740:	7636           	moveq #54,d3
    1742:	4eae ffd0      	jsr -48(a6)
  PrepareDisplayZoom();
    1746:	4e93           	jsr (a3)
  UWORD *destination = (UWORD *)DrawBuffer;
    1748:	2079 0000 5988 	movea.l 5988 <DrawBuffer>,a0
  *destination= 0x0000;
    174e:	4250           	clr.w (a0)
  *destination= 0x000f;
    1750:	317c 000f 0030 	move.w #15,48(a0)
  *destination = 0x000f;
    1756:	317c 000f 47d0 	move.w #15,18384(a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    175c:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    1762:	203c 0000 c800 	move.l #51200,d0
    1768:	7202           	moveq #2,d1
    176a:	4eae ff3a      	jsr -198(a6)
    176e:	2440           	movea.l d0,a2
    1770:	23c0 0000 5958 	move.l d0,5958 <Zoom_Source>
  if( Zoom_Source == 0) {
    1776:	6600 f1f2      	bne.w 96a <main+0x964>
    Write(  Output(), 
    177a:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    1780:	4eae ffc4      	jsr -60(a6)
    1784:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    178a:	2200           	move.l d0,d1
    178c:	243c 0000 354a 	move.l #13642,d2
    1792:	7636           	moveq #54,d3
    1794:	4eae ffd0      	jsr -48(a6)
    return;
    1798:	6000 f3ea      	bra.w b84 <main+0xb7e>
	APTR vbr = 0;
    179c:	7000           	moveq #0,d0
	VBR=GetVBR();
    179e:	23c0 0000 5968 	move.l d0,5968 <VBR.lto_priv.5>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    17a4:	2079 0000 5968 	movea.l 5968 <VBR.lto_priv.5>,a0
    17aa:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    17ae:	23c2 0000 596c 	move.l d2,596c <SystemIrq>
	WaitVbl();
    17b4:	4e92           	jsr (a2)
	WaitVbl();
    17b6:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    17b8:	2079 0000 5974 	movea.l 5974 <hw>,a0
    17be:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    17c2:	6000 fb00      	bra.w 12c4 <main+0x12be>
    Write(  Output(), 
    17c6:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    17cc:	4eae ffc4      	jsr -60(a6)
    17d0:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    17d6:	2200           	move.l d0,d1
    17d8:	243c 0000 3781 	move.l #14209,d2
    17de:	763d           	moveq #61,d3
    17e0:	4eae ffd0      	jsr -48(a6)
    return;
    17e4:	6000 f896      	bra.w 107c <main+0x1076>

000017e8 <WriteFont.constprop.4>:
  *cl = 0xfffffffe;

  return retval;
}

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
    17e8:	226f 0004      	movea.l 4(sp),a1
  UWORD *bmpptr = Destination;
  UWORD *fntptr = font;

  char charpos = *text;
  charpos -= 0x20;
    17ec:	206f 0008      	movea.l 8(sp),a0
    17f0:	1010           	move.b (a0),d0
    17f2:	0600 ffe0      	addi.b #-32,d0
  charpos = charpos<<3;
    17f6:	4880           	ext.w d0
    17f8:	48c0           	ext.l d0
    17fa:	e788           	lsl.l #3,d0
  fntptr += charpos;
    17fc:	4880           	ext.w d0
    17fe:	3040           	movea.w d0,a0
    1800:	d1c8           	adda.l a0,a0
    1802:	d1fc 0000 5918 	adda.l #22808,a0
  for(int i=1;i<=8;i++) {
    *bmpptr = *fntptr++;
    1808:	3290           	move.w (a0),(a1)
    180a:	3368 0002 0050 	move.w 2(a0),80(a1)
    1810:	3368 0004 00a0 	move.w 4(a0),160(a1)
    1816:	3368 0006 00f0 	move.w 6(a0),240(a1)
    181c:	3368 0008 0140 	move.w 8(a0),320(a1)
    1822:	3368 000a 0190 	move.w 10(a0),400(a1)
    1828:	3368 000c 01e0 	move.w 12(a0),480(a1)
    182e:	3368 000e 0230 	move.w 14(a0),560(a1)
    bmpptr += 40;
  }

}
    1834:	4e75           	rts

00001836 <warpmode.part.0>:
void warpmode(int on) 
    1836:	598f           	subq.l #4,sp
    1838:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    183a:	4aaf 000c      	tst.l 12(sp)
    183e:	674c           	beq.s 188c <warpmode.part.0+0x56>
    1840:	4878 0001      	pea 1 <_start+0x1>
    1844:	740b           	moveq #11,d2
    1846:	d48f           	add.l sp,d2
    1848:	2f02           	move.l d2,-(sp)
    184a:	42a7           	clr.l -(sp)
    184c:	4879 0000 3016 	pea 3016 <incbin_swfont_end+0x34>
    1852:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdce34>
    1856:	4878 0052      	pea 52 <main+0x4c>
    185a:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecd95>
    1860:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    1864:	203c 0000 2ffc 	move.l #12284,d0
    186a:	4878 0001      	pea 1 <_start+0x1>
    186e:	2f02           	move.l d2,-(sp)
    1870:	42a7           	clr.l -(sp)
    1872:	2f00           	move.l d0,-(sp)
    1874:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdce34>
    1878:	4878 0052      	pea 52 <main+0x4c>
    187c:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecd95>
	}
}
    1882:	4fef 0018      	lea 24(sp),sp
    1886:	241f           	move.l (sp)+,d2
    1888:	588f           	addq.l #4,sp
    188a:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    188c:	4878 0001      	pea 1 <_start+0x1>
    1890:	740b           	moveq #11,d2
    1892:	d48f           	add.l sp,d2
    1894:	2f02           	move.l d2,-(sp)
    1896:	42a7           	clr.l -(sp)
    1898:	4879 0000 3020 	pea 3020 <incbin_swfont_end+0x3e>
    189e:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdce34>
    18a2:	4878 0052      	pea 52 <main+0x4c>
    18a6:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecd95>
    18ac:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    18b0:	203c 0000 2fe3 	move.l #12259,d0
    18b6:	4878 0001      	pea 1 <_start+0x1>
    18ba:	2f02           	move.l d2,-(sp)
    18bc:	42a7           	clr.l -(sp)
    18be:	2f00           	move.l d0,-(sp)
    18c0:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdce34>
    18c4:	4878 0052      	pea 52 <main+0x4c>
    18c8:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecd95>
}
    18ce:	4fef 0018      	lea 24(sp),sp
    18d2:	241f           	move.l (sp)+,d2
    18d4:	588f           	addq.l #4,sp
    18d6:	4e75           	rts

000018d8 <KPrintF>:
{
    18d8:	4fef ff80      	lea -128(sp),sp
    18dc:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
    18e0:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeecd95>
    18e6:	6734           	beq.s 191c <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
    18e8:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    18ee:	206f 0090      	movea.l 144(sp),a0
    18f2:	43ef 0094      	lea 148(sp),a1
    18f6:	45f9 0000 281c 	lea 281c <PutChar>,a2
    18fc:	47ef 000c      	lea 12(sp),a3
    1900:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    1904:	2f0b           	move.l a3,-(sp)
    1906:	4878 0056      	pea 56 <main+0x50>
    190a:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeecd95>
    1910:	508f           	addq.l #8,sp
}
    1912:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    1916:	4fef 0080      	lea 128(sp),sp
    191a:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
    191c:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    1922:	206f 0090      	movea.l 144(sp),a0
    1926:	43ef 0094      	lea 148(sp),a1
    192a:	45f9 0000 280e 	lea 280e <KPutCharX>,a2
    1930:	97cb           	suba.l a3,a3
    1932:	4eae fdf6      	jsr -522(a6)
}
    1936:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    193a:	4fef 0080      	lea 128(sp),sp
    193e:	4e75           	rts

00001940 <TestRow.constprop.3>:
    TestRow( valsupposed, valactual, 0x0000, 19+i*19);
    valactual += ZMLINESIZE/2;
  }
}

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
    1940:	4fef ff94      	lea -108(sp),sp
    1944:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    1948:	2f6f 00a0 002c 	move.l 160(sp),44(sp)
    194e:	3c2f 002e      	move.w 46(sp),d6
                                                             int numberofline) {    
  char str[ 100] = { 0 };
    1952:	7a34           	moveq #52,d5
    1954:	da8f           	add.l sp,d5
    1956:	4878 0064      	pea 64 <main+0x5e>
    195a:	42a7           	clr.l -(sp)
    195c:	2f05           	move.l d5,-(sp)
    195e:	4eba 0cce      	jsr 262e <memset>(pc)
  UWORD data[2];
  data[1] = numberofline;
    1962:	3f6f 00b2 003e 	move.w 178(sp),62(sp)
    1968:	4fef 000c      	lea 12(sp),sp

  testpattern += 0;
  destination += 0;
    196c:	2a6f 009c      	movea.l 156(sp),a5

  for(int i=0;i<21;i++) {
    1970:	7800           	moveq #0,d4
  testpattern += 0;
    1972:	49f9 0000 58ec 	lea 58ec <destlinezoom1>,a4
    if( (*testpattern++ ^ xormask) != *destination++) {
      data[0] = i;
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    1978:	2e3c 0000 302b 	move.l #12331,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
    197e:	301c           	move.w (a4)+,d0
    1980:	bd40           	eor.w d6,d0
    1982:	b05d           	cmp.w (a5)+,d0
    1984:	6736           	beq.s 19bc <TestRow.constprop.3+0x7c>
      data[0] = i;
    1986:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    198a:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    1990:	2047           	movea.l d7,a0
    1992:	43ef 0030      	lea 48(sp),a1
    1996:	45f9 0000 281c 	lea 281c <PutChar>,a2
    199c:	2645           	movea.l d5,a3
    199e:	4eae fdf6      	jsr -522(a6)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    19a2:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    19a8:	4eae ffc4      	jsr -60(a6)
    19ac:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    19b2:	2200           	move.l d0,d1
    19b4:	2405           	move.l d5,d2
    19b6:	7664           	moveq #100,d3
    19b8:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    19bc:	5284           	addq.l #1,d4
    19be:	b9fc 0000 5916 	cmpa.l #22806,a4
    19c4:	66b8           	bne.s 197e <TestRow.constprop.3+0x3e>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    19c6:	3039 0000 5916 	move.w 5916 <destlinezoom1+0x2a>,d0
    19cc:	322f 002e      	move.w 46(sp),d1
    19d0:	b340           	eor.w d1,d0
    19d2:	206f 009c      	movea.l 156(sp),a0
    19d6:	3228 002a      	move.w 42(a0),d1
    19da:	b340           	eor.w d1,d0
    19dc:	0240 ff00      	andi.w #-256,d0
    19e0:	660a           	bne.s 19ec <TestRow.constprop.3+0xac>
    Write(  Output(), str, 100);
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
     
  }
}
    19e2:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    19e6:	4fef 006c      	lea 108(sp),sp
    19ea:	4e75           	rts
    data[0] = 21;
    19ec:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    19f2:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    19f8:	41f9 0000 302b 	lea 302b <incbin_swfont_end+0x49>,a0
    19fe:	43ef 0030      	lea 48(sp),a1
    1a02:	45f9 0000 281c 	lea 281c <PutChar>,a2
    1a08:	47ef 0034      	lea 52(sp),a3
    1a0c:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    1a10:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    1a16:	4eae ffc4      	jsr -60(a6)
    1a1a:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    1a20:	2200           	move.l d0,d1
    1a22:	240b           	move.l a3,d2
    1a24:	7664           	moveq #100,d3
    1a26:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    1a2a:	206f 009c      	movea.l 156(sp),a0
    1a2e:	7000           	moveq #0,d0
    1a30:	3028 002a      	move.w 42(a0),d0
    1a34:	2f00           	move.l d0,-(sp)
    1a36:	3039 0000 5916 	move.w 5916 <destlinezoom1+0x2a>,d0
    1a3c:	2f00           	move.l d0,-(sp)
    1a3e:	4879 0000 305b 	pea 305b <incbin_swfont_end+0x79>
    1a44:	4eba fe92      	jsr 18d8 <KPrintF>(pc)
    1a48:	4fef 000c      	lea 12(sp),sp
}
    1a4c:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1a50:	4fef 006c      	lea 108(sp),sp
    1a54:	4e75           	rts

00001a56 <TestCopperlistPos>:
  if( instructions[pos] == value ) 
    1a56:	202f 0008      	move.l 8(sp),d0
    1a5a:	d080           	add.l d0,d0
    1a5c:	d080           	add.l d0,d0
    1a5e:	206f 0004      	movea.l 4(sp),a0
    1a62:	2030 0800      	move.l (0,a0,d0.l),d0
    1a66:	b0af 000c      	cmp.l 12(sp),d0
    1a6a:	57c0           	seq d0
    1a6c:	4880           	ext.w d0
    1a6e:	48c0           	ext.l d0
}
    1a70:	4480           	neg.l d0
    1a72:	4e75           	rts

00001a74 <TestCopperlistBatch>:
                                                                  long length) {
    1a74:	48e7 2030      	movem.l d2/a2-a3,-(sp)
    1a78:	246f 0010      	movea.l 16(sp),a2
    1a7c:	206f 0014      	movea.l 20(sp),a0
    1a80:	226f 0018      	movea.l 24(sp),a1
    1a84:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
    1a88:	2008           	move.l a0,d0
    1a8a:	d088           	add.l a0,d0
    1a8c:	d080           	add.l d0,d0
    1a8e:	2411           	move.l (a1),d2
    1a90:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
    1a94:	6600 01ac      	bne.w 1c42 <TestCopperlistBatch+0x1ce>
    1a98:	2008           	move.l a0,d0
    1a9a:	5280           	addq.l #1,d0
    1a9c:	d080           	add.l d0,d0
    1a9e:	d080           	add.l d0,d0
    1aa0:	2032 0800      	move.l (0,a2,d0.l),d0
    1aa4:	b0a9 0004      	cmp.l 4(a1),d0
    1aa8:	6600 0198      	bne.w 1c42 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1aac:	7002           	moveq #2,d0
    1aae:	b081           	cmp.l d1,d0
    1ab0:	6700 0188      	beq.w 1c3a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1ab4:	2008           	move.l a0,d0
    1ab6:	5480           	addq.l #2,d0
    1ab8:	d080           	add.l d0,d0
    1aba:	d080           	add.l d0,d0
    1abc:	2032 0800      	move.l (0,a2,d0.l),d0
    1ac0:	b0a9 0008      	cmp.l 8(a1),d0
    1ac4:	6600 017c      	bne.w 1c42 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1ac8:	7403           	moveq #3,d2
    1aca:	b481           	cmp.l d1,d2
    1acc:	6700 016c      	beq.w 1c3a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1ad0:	2008           	move.l a0,d0
    1ad2:	5680           	addq.l #3,d0
    1ad4:	d080           	add.l d0,d0
    1ad6:	d080           	add.l d0,d0
    1ad8:	2032 0800      	move.l (0,a2,d0.l),d0
    1adc:	b0a9 000c      	cmp.l 12(a1),d0
    1ae0:	6600 0160      	bne.w 1c42 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1ae4:	7004           	moveq #4,d0
    1ae6:	b081           	cmp.l d1,d0
    1ae8:	6700 0150      	beq.w 1c3a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1aec:	2008           	move.l a0,d0
    1aee:	5880           	addq.l #4,d0
    1af0:	d080           	add.l d0,d0
    1af2:	d080           	add.l d0,d0
    1af4:	2032 0800      	move.l (0,a2,d0.l),d0
    1af8:	b0a9 0010      	cmp.l 16(a1),d0
    1afc:	6600 0144      	bne.w 1c42 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1b00:	7405           	moveq #5,d2
    1b02:	b481           	cmp.l d1,d2
    1b04:	6700 0134      	beq.w 1c3a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1b08:	2008           	move.l a0,d0
    1b0a:	5a80           	addq.l #5,d0
    1b0c:	d080           	add.l d0,d0
    1b0e:	d080           	add.l d0,d0
    1b10:	2032 0800      	move.l (0,a2,d0.l),d0
    1b14:	b0a9 0014      	cmp.l 20(a1),d0
    1b18:	6600 0128      	bne.w 1c42 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1b1c:	7006           	moveq #6,d0
    1b1e:	b081           	cmp.l d1,d0
    1b20:	6700 0118      	beq.w 1c3a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1b24:	2008           	move.l a0,d0
    1b26:	5c80           	addq.l #6,d0
    1b28:	d080           	add.l d0,d0
    1b2a:	d080           	add.l d0,d0
    1b2c:	2032 0800      	move.l (0,a2,d0.l),d0
    1b30:	b0a9 0018      	cmp.l 24(a1),d0
    1b34:	6600 010c      	bne.w 1c42 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1b38:	7407           	moveq #7,d2
    1b3a:	b481           	cmp.l d1,d2
    1b3c:	6700 00fc      	beq.w 1c3a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1b40:	2008           	move.l a0,d0
    1b42:	5e80           	addq.l #7,d0
    1b44:	d080           	add.l d0,d0
    1b46:	d080           	add.l d0,d0
    1b48:	2032 0800      	move.l (0,a2,d0.l),d0
    1b4c:	b0a9 001c      	cmp.l 28(a1),d0
    1b50:	6600 00f0      	bne.w 1c42 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1b54:	7008           	moveq #8,d0
    1b56:	b081           	cmp.l d1,d0
    1b58:	6700 00e0      	beq.w 1c3a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1b5c:	2008           	move.l a0,d0
    1b5e:	5080           	addq.l #8,d0
    1b60:	d080           	add.l d0,d0
    1b62:	d080           	add.l d0,d0
    1b64:	2032 0800      	move.l (0,a2,d0.l),d0
    1b68:	b0a9 0020      	cmp.l 32(a1),d0
    1b6c:	6600 00d4      	bne.w 1c42 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1b70:	7409           	moveq #9,d2
    1b72:	b481           	cmp.l d1,d2
    1b74:	6700 00c4      	beq.w 1c3a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1b78:	47e8 0009      	lea 9(a0),a3
    1b7c:	200b           	move.l a3,d0
    1b7e:	d08b           	add.l a3,d0
    1b80:	d080           	add.l d0,d0
    1b82:	2032 0800      	move.l (0,a2,d0.l),d0
    1b86:	b0a9 0024      	cmp.l 36(a1),d0
    1b8a:	6600 00b6      	bne.w 1c42 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1b8e:	700a           	moveq #10,d0
    1b90:	b081           	cmp.l d1,d0
    1b92:	6700 00a6      	beq.w 1c3a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1b96:	47e8 000a      	lea 10(a0),a3
    1b9a:	200b           	move.l a3,d0
    1b9c:	d08b           	add.l a3,d0
    1b9e:	d080           	add.l d0,d0
    1ba0:	2032 0800      	move.l (0,a2,d0.l),d0
    1ba4:	b0a9 0028      	cmp.l 40(a1),d0
    1ba8:	6600 0098      	bne.w 1c42 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1bac:	740b           	moveq #11,d2
    1bae:	b481           	cmp.l d1,d2
    1bb0:	6700 0088      	beq.w 1c3a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1bb4:	47e8 000b      	lea 11(a0),a3
    1bb8:	200b           	move.l a3,d0
    1bba:	d08b           	add.l a3,d0
    1bbc:	d080           	add.l d0,d0
    1bbe:	2032 0800      	move.l (0,a2,d0.l),d0
    1bc2:	b0a9 002c      	cmp.l 44(a1),d0
    1bc6:	667a           	bne.s 1c42 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1bc8:	700c           	moveq #12,d0
    1bca:	b081           	cmp.l d1,d0
    1bcc:	676c           	beq.s 1c3a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1bce:	47e8 000c      	lea 12(a0),a3
    1bd2:	200b           	move.l a3,d0
    1bd4:	d08b           	add.l a3,d0
    1bd6:	d080           	add.l d0,d0
    1bd8:	2032 0800      	move.l (0,a2,d0.l),d0
    1bdc:	b0a9 0030      	cmp.l 48(a1),d0
    1be0:	6660           	bne.s 1c42 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1be2:	740d           	moveq #13,d2
    1be4:	b481           	cmp.l d1,d2
    1be6:	6752           	beq.s 1c3a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1be8:	47e8 000d      	lea 13(a0),a3
    1bec:	200b           	move.l a3,d0
    1bee:	d08b           	add.l a3,d0
    1bf0:	d080           	add.l d0,d0
    1bf2:	2032 0800      	move.l (0,a2,d0.l),d0
    1bf6:	b0a9 0034      	cmp.l 52(a1),d0
    1bfa:	6646           	bne.s 1c42 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1bfc:	700e           	moveq #14,d0
    1bfe:	b081           	cmp.l d1,d0
    1c00:	6738           	beq.s 1c3a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1c02:	47e8 000e      	lea 14(a0),a3
    1c06:	200b           	move.l a3,d0
    1c08:	d08b           	add.l a3,d0
    1c0a:	d080           	add.l d0,d0
    1c0c:	2032 0800      	move.l (0,a2,d0.l),d0
    1c10:	b0a9 0038      	cmp.l 56(a1),d0
    1c14:	662c           	bne.s 1c42 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    1c16:	7410           	moveq #16,d2
    1c18:	b481           	cmp.l d1,d2
    1c1a:	661e           	bne.s 1c3a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    1c1c:	41e8 000f      	lea 15(a0),a0
    1c20:	d1c8           	adda.l a0,a0
    1c22:	d1c8           	adda.l a0,a0
    1c24:	2070 a800      	movea.l (0,a0,a2.l),a0
    1c28:	b1e9 003c      	cmpa.l 60(a1),a0
    1c2c:	57c0           	seq d0
    1c2e:	4880           	ext.w d0
    1c30:	48c0           	ext.l d0
    1c32:	4480           	neg.l d0
}
    1c34:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    1c38:	4e75           	rts
  return 1;
    1c3a:	7001           	moveq #1,d0
}
    1c3c:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    1c40:	4e75           	rts
      return 0;
    1c42:	7000           	moveq #0,d0
}
    1c44:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    1c48:	4e75           	rts

00001c4a <ClBuild>:
ULONG * ClbuildSW() {
    1c4a:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
    1c4e:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    1c54:	707b           	moveq #123,d0
    1c56:	4600           	not.b d0
    1c58:	7202           	moveq #2,d1
    1c5a:	4eae ff3a      	jsr -198(a6)
    1c5e:	2440           	movea.l d0,a2
  if( retval == 0) {
    1c60:	4a80           	tst.l d0
    1c62:	6700 010e      	beq.w 1d72 <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
    1c66:	24b9 0000 58ac 	move.l 58ac <ClsSprites>,(a2)
    1c6c:	2579 0000 58b0 	move.l 58b0 <ClsSprites+0x4>,4(a2)
    1c72:	0004 
    1c74:	2579 0000 58b4 	move.l 58b4 <ClsSprites+0x8>,8(a2)
    1c7a:	0008 
    1c7c:	2579 0000 58b8 	move.l 58b8 <ClsSprites+0xc>,12(a2)
    1c82:	000c 
    1c84:	2579 0000 58bc 	move.l 58bc <ClsSprites+0x10>,16(a2)
    1c8a:	0010 
    1c8c:	2579 0000 58c0 	move.l 58c0 <ClsSprites+0x14>,20(a2)
    1c92:	0014 
    1c94:	2579 0000 58c4 	move.l 58c4 <ClsSprites+0x18>,24(a2)
    1c9a:	0018 
    1c9c:	2579 0000 58c8 	move.l 58c8 <ClsSprites+0x1c>,28(a2)
    1ca2:	001c 
    1ca4:	2579 0000 58cc 	move.l 58cc <ClsSprites+0x20>,32(a2)
    1caa:	0020 
    1cac:	2579 0000 58d0 	move.l 58d0 <ClsSprites+0x24>,36(a2)
    1cb2:	0024 
    1cb4:	2579 0000 58d4 	move.l 58d4 <ClsSprites+0x28>,40(a2)
    1cba:	0028 
    1cbc:	2579 0000 58d8 	move.l 58d8 <ClsSprites+0x2c>,44(a2)
    1cc2:	002c 
    1cc4:	2579 0000 58dc 	move.l 58dc <ClsSprites+0x30>,48(a2)
    1cca:	0030 
    1ccc:	2579 0000 58e0 	move.l 58e0 <ClsSprites+0x34>,52(a2)
    1cd2:	0034 
    1cd4:	2579 0000 58e4 	move.l 58e4 <ClsSprites+0x38>,56(a2)
    1cda:	0038 
    1cdc:	2579 0000 58e8 	move.l 58e8 <ClsSprites+0x3c>,60(a2)
    1ce2:	003c 
    *cl++ = *clpartinstruction++;
    1ce4:	2579 0000 587c 	move.l 587c <ClScreen>,64(a2)
    1cea:	0040 
    1cec:	2579 0000 5880 	move.l 5880 <ClScreen+0x4>,68(a2)
    1cf2:	0044 
    1cf4:	2579 0000 5884 	move.l 5884 <ClScreen+0x8>,72(a2)
    1cfa:	0048 
    1cfc:	2579 0000 5888 	move.l 5888 <ClScreen+0xc>,76(a2)
    1d02:	004c 
    1d04:	2579 0000 588c 	move.l 588c <ClScreen+0x10>,80(a2)
    1d0a:	0050 
    1d0c:	2579 0000 5890 	move.l 5890 <ClScreen+0x14>,84(a2)
    1d12:	0054 
    1d14:	2579 0000 5894 	move.l 5894 <ClScreen+0x18>,88(a2)
    1d1a:	0058 
    1d1c:	2579 0000 5898 	move.l 5898 <ClScreen+0x1c>,92(a2)
    1d22:	005c 
    1d24:	2579 0000 589c 	move.l 589c <ClScreen+0x20>,96(a2)
    1d2a:	0060 
    1d2c:	2579 0000 58a0 	move.l 58a0 <ClScreen+0x24>,100(a2)
    1d32:	0064 
    1d34:	2579 0000 58a4 	move.l 58a4 <ClScreen+0x28>,104(a2)
    1d3a:	0068 
    1d3c:	2579 0000 58a8 	move.l 58a8 <ClScreen+0x2c>,108(a2)
    1d42:	006c 
  *cl++ = 0x00e00000;
    1d44:	257c 00e0 0000 	move.l #14680064,112(a2)
    1d4a:	0070 
  *cl++ = 0x00e20000;
    1d4c:	257c 00e2 0000 	move.l #14811136,116(a2)
    1d52:	0074 
    *cl++ = *clpartinstruction++;
    1d54:	2579 0000 5874 	move.l 5874 <ClColor>,120(a2)
    1d5a:	0078 
    1d5c:	2579 0000 5878 	move.l 5878 <ClColor+0x4>,124(a2)
    1d62:	007c 
  *cl = 0xfffffffe;
    1d64:	70fe           	moveq #-2,d0
    1d66:	2540 0080      	move.l d0,128(a2)
}
    1d6a:	200a           	move.l a2,d0
    1d6c:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1d70:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1d72:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    1d78:	4eae ffc4      	jsr -60(a6)
    1d7c:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    1d82:	2200           	move.l d0,d1
    1d84:	243c 0000 3081 	move.l #12417,d2
    1d8a:	7628           	moveq #40,d3
    1d8c:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1d90:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    1d96:	7201           	moveq #1,d1
    1d98:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1d9c:	24b9 0000 58ac 	move.l 58ac <ClsSprites>,(a2)
    1da2:	2579 0000 58b0 	move.l 58b0 <ClsSprites+0x4>,4(a2)
    1da8:	0004 
    1daa:	2579 0000 58b4 	move.l 58b4 <ClsSprites+0x8>,8(a2)
    1db0:	0008 
    1db2:	2579 0000 58b8 	move.l 58b8 <ClsSprites+0xc>,12(a2)
    1db8:	000c 
    1dba:	2579 0000 58bc 	move.l 58bc <ClsSprites+0x10>,16(a2)
    1dc0:	0010 
    1dc2:	2579 0000 58c0 	move.l 58c0 <ClsSprites+0x14>,20(a2)
    1dc8:	0014 
    1dca:	2579 0000 58c4 	move.l 58c4 <ClsSprites+0x18>,24(a2)
    1dd0:	0018 
    1dd2:	2579 0000 58c8 	move.l 58c8 <ClsSprites+0x1c>,28(a2)
    1dd8:	001c 
    1dda:	2579 0000 58cc 	move.l 58cc <ClsSprites+0x20>,32(a2)
    1de0:	0020 
    1de2:	2579 0000 58d0 	move.l 58d0 <ClsSprites+0x24>,36(a2)
    1de8:	0024 
    1dea:	2579 0000 58d4 	move.l 58d4 <ClsSprites+0x28>,40(a2)
    1df0:	0028 
    1df2:	2579 0000 58d8 	move.l 58d8 <ClsSprites+0x2c>,44(a2)
    1df8:	002c 
    1dfa:	2579 0000 58dc 	move.l 58dc <ClsSprites+0x30>,48(a2)
    1e00:	0030 
    1e02:	2579 0000 58e0 	move.l 58e0 <ClsSprites+0x34>,52(a2)
    1e08:	0034 
    1e0a:	2579 0000 58e4 	move.l 58e4 <ClsSprites+0x38>,56(a2)
    1e10:	0038 
    1e12:	2579 0000 58e8 	move.l 58e8 <ClsSprites+0x3c>,60(a2)
    1e18:	003c 
    *cl++ = *clpartinstruction++;
    1e1a:	2579 0000 587c 	move.l 587c <ClScreen>,64(a2)
    1e20:	0040 
    1e22:	2579 0000 5880 	move.l 5880 <ClScreen+0x4>,68(a2)
    1e28:	0044 
    1e2a:	2579 0000 5884 	move.l 5884 <ClScreen+0x8>,72(a2)
    1e30:	0048 
    1e32:	2579 0000 5888 	move.l 5888 <ClScreen+0xc>,76(a2)
    1e38:	004c 
    1e3a:	2579 0000 588c 	move.l 588c <ClScreen+0x10>,80(a2)
    1e40:	0050 
    1e42:	2579 0000 5890 	move.l 5890 <ClScreen+0x14>,84(a2)
    1e48:	0054 
    1e4a:	2579 0000 5894 	move.l 5894 <ClScreen+0x18>,88(a2)
    1e50:	0058 
    1e52:	2579 0000 5898 	move.l 5898 <ClScreen+0x1c>,92(a2)
    1e58:	005c 
    1e5a:	2579 0000 589c 	move.l 589c <ClScreen+0x20>,96(a2)
    1e60:	0060 
    1e62:	2579 0000 58a0 	move.l 58a0 <ClScreen+0x24>,100(a2)
    1e68:	0064 
    1e6a:	2579 0000 58a4 	move.l 58a4 <ClScreen+0x28>,104(a2)
    1e70:	0068 
    1e72:	2579 0000 58a8 	move.l 58a8 <ClScreen+0x2c>,108(a2)
    1e78:	006c 
  *cl++ = 0x00e00000;
    1e7a:	257c 00e0 0000 	move.l #14680064,112(a2)
    1e80:	0070 
  *cl++ = 0x00e20000;
    1e82:	257c 00e2 0000 	move.l #14811136,116(a2)
    1e88:	0074 
    *cl++ = *clpartinstruction++;
    1e8a:	2579 0000 5874 	move.l 5874 <ClColor>,120(a2)
    1e90:	0078 
    1e92:	2579 0000 5878 	move.l 5878 <ClColor+0x4>,124(a2)
    1e98:	007c 
  *cl = 0xfffffffe;
    1e9a:	70fe           	moveq #-2,d0
    1e9c:	2540 0080      	move.l d0,128(a2)
}
    1ea0:	200a           	move.l a2,d0
    1ea2:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1ea6:	4e75           	rts

00001ea8 <ClbuildZoom>:
ULONG * ClbuildZoom() {
    1ea8:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    1eac:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    1eb2:	203c 0000 a48c 	move.l #42124,d0
    1eb8:	7202           	moveq #2,d1
    1eba:	4eae ff3a      	jsr -198(a6)
    1ebe:	2440           	movea.l d0,a2
  if( retval == 0) {
    1ec0:	4a80           	tst.l d0
    1ec2:	6700 0160      	beq.w 2024 <ClbuildZoom+0x17c>
    *cl++ = *clpartinstruction++;
    1ec6:	24b9 0000 58ac 	move.l 58ac <ClsSprites>,(a2)
    1ecc:	2579 0000 58b0 	move.l 58b0 <ClsSprites+0x4>,4(a2)
    1ed2:	0004 
    1ed4:	2579 0000 58b4 	move.l 58b4 <ClsSprites+0x8>,8(a2)
    1eda:	0008 
    1edc:	2579 0000 58b8 	move.l 58b8 <ClsSprites+0xc>,12(a2)
    1ee2:	000c 
    1ee4:	2579 0000 58bc 	move.l 58bc <ClsSprites+0x10>,16(a2)
    1eea:	0010 
    1eec:	2579 0000 58c0 	move.l 58c0 <ClsSprites+0x14>,20(a2)
    1ef2:	0014 
    1ef4:	2579 0000 58c4 	move.l 58c4 <ClsSprites+0x18>,24(a2)
    1efa:	0018 
    1efc:	2579 0000 58c8 	move.l 58c8 <ClsSprites+0x1c>,28(a2)
    1f02:	001c 
    1f04:	2579 0000 58cc 	move.l 58cc <ClsSprites+0x20>,32(a2)
    1f0a:	0020 
    1f0c:	2579 0000 58d0 	move.l 58d0 <ClsSprites+0x24>,36(a2)
    1f12:	0024 
    1f14:	2579 0000 58d4 	move.l 58d4 <ClsSprites+0x28>,40(a2)
    1f1a:	0028 
    1f1c:	2579 0000 58d8 	move.l 58d8 <ClsSprites+0x2c>,44(a2)
    1f22:	002c 
    1f24:	2579 0000 58dc 	move.l 58dc <ClsSprites+0x30>,48(a2)
    1f2a:	0030 
    1f2c:	2579 0000 58e0 	move.l 58e0 <ClsSprites+0x34>,52(a2)
    1f32:	0034 
    1f34:	2579 0000 58e4 	move.l 58e4 <ClsSprites+0x38>,56(a2)
    1f3a:	0038 
    1f3c:	2579 0000 58e8 	move.l 58e8 <ClsSprites+0x3c>,60(a2)
    1f42:	003c 
    *cl++ = *clpartinstruction++;
    1f44:	2579 0000 5844 	move.l 5844 <ClScreenZoom>,64(a2)
    1f4a:	0040 
    1f4c:	2579 0000 5848 	move.l 5848 <ClScreenZoom+0x4>,68(a2)
    1f52:	0044 
    1f54:	2579 0000 584c 	move.l 584c <ClScreenZoom+0x8>,72(a2)
    1f5a:	0048 
    1f5c:	2579 0000 5850 	move.l 5850 <ClScreenZoom+0xc>,76(a2)
    1f62:	004c 
    1f64:	2579 0000 5854 	move.l 5854 <ClScreenZoom+0x10>,80(a2)
    1f6a:	0050 
    1f6c:	2579 0000 5858 	move.l 5858 <ClScreenZoom+0x14>,84(a2)
    1f72:	0054 
    1f74:	2579 0000 585c 	move.l 585c <ClScreenZoom+0x18>,88(a2)
    1f7a:	0058 
    1f7c:	2579 0000 5860 	move.l 5860 <ClScreenZoom+0x1c>,92(a2)
    1f82:	005c 
    1f84:	2579 0000 5864 	move.l 5864 <ClScreenZoom+0x20>,96(a2)
    1f8a:	0060 
    1f8c:	2579 0000 5868 	move.l 5868 <ClScreenZoom+0x24>,100(a2)
    1f92:	0064 
    1f94:	2579 0000 586c 	move.l 586c <ClScreenZoom+0x28>,104(a2)
    1f9a:	0068 
    1f9c:	2579 0000 5870 	move.l 5870 <ClScreenZoom+0x2c>,108(a2)
    1fa2:	006c 
  *cl++ = 0x00e00000;
    1fa4:	257c 00e0 0000 	move.l #14680064,112(a2)
    1faa:	0070 
  *cl++ = 0x00e20000;
    1fac:	257c 00e2 0000 	move.l #14811136,116(a2)
    1fb2:	0074 
  *cl++ = 0x00e40000;
    1fb4:	257c 00e4 0000 	move.l #14942208,120(a2)
    1fba:	0078 
  *cl++ = 0x00e60000;
    1fbc:	257c 00e6 0000 	move.l #15073280,124(a2)
    1fc2:	007c 
    *cl++ = *clpartinstruction++;
    1fc4:	2579 0000 5874 	move.l 5874 <ClColor>,128(a2)
    1fca:	0080 
    1fcc:	2579 0000 5878 	move.l 5878 <ClColor+0x4>,132(a2)
    1fd2:	0084 
    1fd4:	43ea 012c      	lea 300(a2),a1
    1fd8:	220a           	move.l a2,d1
    1fda:	0681 0000 a52c 	addi.l #42284,d1
    1fe0:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    1fe6:	41e9 ff60      	lea -160(a1),a0
    1fea:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    1fee:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    1ff4:	5088           	addq.l #8,a0
    1ff6:	217c 0182 0f00 	move.l #25300736,-4(a0)
    1ffc:	fffc 
    for(int i2=0;i2<20;i2++) {
    1ffe:	b3c8           	cmpa.l a0,a1
    2000:	66ec           	bne.s 1fee <ClbuildZoom+0x146>
    2002:	43e8 00a4      	lea 164(a0),a1
    2006:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    200c:	b3c1           	cmpa.l d1,a1
    200e:	66d6           	bne.s 1fe6 <ClbuildZoom+0x13e>
   *cl = 0xfffffffe;
    2010:	203c 0000 a488 	move.l #42120,d0
    2016:	72fe           	moveq #-2,d1
    2018:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    201c:	200a           	move.l a2,d0
    201e:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    2022:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    2024:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    202a:	4eae ffc4      	jsr -60(a6)
    202e:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    2034:	2200           	move.l d0,d1
    2036:	243c 0000 3081 	move.l #12417,d2
    203c:	7628           	moveq #40,d3
    203e:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2042:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    2048:	7201           	moveq #1,d1
    204a:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    204e:	24b9 0000 58ac 	move.l 58ac <ClsSprites>,(a2)
    2054:	2579 0000 58b0 	move.l 58b0 <ClsSprites+0x4>,4(a2)
    205a:	0004 
    205c:	2579 0000 58b4 	move.l 58b4 <ClsSprites+0x8>,8(a2)
    2062:	0008 
    2064:	2579 0000 58b8 	move.l 58b8 <ClsSprites+0xc>,12(a2)
    206a:	000c 
    206c:	2579 0000 58bc 	move.l 58bc <ClsSprites+0x10>,16(a2)
    2072:	0010 
    2074:	2579 0000 58c0 	move.l 58c0 <ClsSprites+0x14>,20(a2)
    207a:	0014 
    207c:	2579 0000 58c4 	move.l 58c4 <ClsSprites+0x18>,24(a2)
    2082:	0018 
    2084:	2579 0000 58c8 	move.l 58c8 <ClsSprites+0x1c>,28(a2)
    208a:	001c 
    208c:	2579 0000 58cc 	move.l 58cc <ClsSprites+0x20>,32(a2)
    2092:	0020 
    2094:	2579 0000 58d0 	move.l 58d0 <ClsSprites+0x24>,36(a2)
    209a:	0024 
    209c:	2579 0000 58d4 	move.l 58d4 <ClsSprites+0x28>,40(a2)
    20a2:	0028 
    20a4:	2579 0000 58d8 	move.l 58d8 <ClsSprites+0x2c>,44(a2)
    20aa:	002c 
    20ac:	2579 0000 58dc 	move.l 58dc <ClsSprites+0x30>,48(a2)
    20b2:	0030 
    20b4:	2579 0000 58e0 	move.l 58e0 <ClsSprites+0x34>,52(a2)
    20ba:	0034 
    20bc:	2579 0000 58e4 	move.l 58e4 <ClsSprites+0x38>,56(a2)
    20c2:	0038 
    20c4:	2579 0000 58e8 	move.l 58e8 <ClsSprites+0x3c>,60(a2)
    20ca:	003c 
    *cl++ = *clpartinstruction++;
    20cc:	2579 0000 5844 	move.l 5844 <ClScreenZoom>,64(a2)
    20d2:	0040 
    20d4:	2579 0000 5848 	move.l 5848 <ClScreenZoom+0x4>,68(a2)
    20da:	0044 
    20dc:	2579 0000 584c 	move.l 584c <ClScreenZoom+0x8>,72(a2)
    20e2:	0048 
    20e4:	2579 0000 5850 	move.l 5850 <ClScreenZoom+0xc>,76(a2)
    20ea:	004c 
    20ec:	2579 0000 5854 	move.l 5854 <ClScreenZoom+0x10>,80(a2)
    20f2:	0050 
    20f4:	2579 0000 5858 	move.l 5858 <ClScreenZoom+0x14>,84(a2)
    20fa:	0054 
    20fc:	2579 0000 585c 	move.l 585c <ClScreenZoom+0x18>,88(a2)
    2102:	0058 
    2104:	2579 0000 5860 	move.l 5860 <ClScreenZoom+0x1c>,92(a2)
    210a:	005c 
    210c:	2579 0000 5864 	move.l 5864 <ClScreenZoom+0x20>,96(a2)
    2112:	0060 
    2114:	2579 0000 5868 	move.l 5868 <ClScreenZoom+0x24>,100(a2)
    211a:	0064 
    211c:	2579 0000 586c 	move.l 586c <ClScreenZoom+0x28>,104(a2)
    2122:	0068 
    2124:	2579 0000 5870 	move.l 5870 <ClScreenZoom+0x2c>,108(a2)
    212a:	006c 
  *cl++ = 0x00e00000;
    212c:	257c 00e0 0000 	move.l #14680064,112(a2)
    2132:	0070 
  *cl++ = 0x00e20000;
    2134:	257c 00e2 0000 	move.l #14811136,116(a2)
    213a:	0074 
  *cl++ = 0x00e40000;
    213c:	257c 00e4 0000 	move.l #14942208,120(a2)
    2142:	0078 
  *cl++ = 0x00e60000;
    2144:	257c 00e6 0000 	move.l #15073280,124(a2)
    214a:	007c 
    *cl++ = *clpartinstruction++;
    214c:	2579 0000 5874 	move.l 5874 <ClColor>,128(a2)
    2152:	0080 
    2154:	2579 0000 5878 	move.l 5878 <ClColor+0x4>,132(a2)
    215a:	0084 
    215c:	43ea 012c      	lea 300(a2),a1
    2160:	220a           	move.l a2,d1
    2162:	0681 0000 a52c 	addi.l #42284,d1
    2168:	203c 2c07 fffe 	move.l #738721790,d0
    216e:	6000 fe76      	bra.w 1fe6 <ClbuildZoom+0x13e>

00002172 <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    2172:	2039 0000 5984 	move.l 5984 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    2178:	23f9 0000 5978 	move.l 5978 <ViewCopper>,5984 <DrawCopper>
    217e:	0000 5984 
  ViewCopper = (ULONG *)tmp;
    2182:	23c0 0000 5978 	move.l d0,5978 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    2188:	2079 0000 5974 	movea.l 5974 <hw>,a0
    218e:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    2192:	3140 0088      	move.w d0,136(a0)
}
    2196:	4e75           	rts

00002198 <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    2198:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    219c:	45fa fd0a      	lea 1ea8 <ClbuildZoom>(pc),a2
    21a0:	4e92           	jsr (a2)
    21a2:	23c0 0000 5994 	move.l d0,5994 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    21a8:	4e92           	jsr (a2)
    21aa:	23c0 0000 5990 	move.l d0,5990 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    21b0:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    21b6:	203c 0001 6800 	move.l #92160,d0
    21bc:	7202           	moveq #2,d1
    21be:	4eae ff3a      	jsr -198(a6)
    21c2:	23c0 0000 598c 	move.l d0,598c <Bitplane1>
  if(Bitplane1 == 0) {
    21c8:	6700 014e      	beq.w 2318 <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    21cc:	23c0 0000 5988 	move.l d0,5988 <DrawBuffer>
  DrawCopper = Copperlist1;
    21d2:	23f9 0000 5994 	move.l 5994 <Copperlist1>,5984 <DrawCopper>
    21d8:	0000 5984 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    21dc:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    21e2:	203c 0001 6800 	move.l #92160,d0
    21e8:	7202           	moveq #2,d1
    21ea:	4eae ff3a      	jsr -198(a6)
    21ee:	2400           	move.l d0,d2
    21f0:	23c0 0000 5980 	move.l d0,5980 <Bitplane2>
  if(Bitplane2 == 0) {
    21f6:	6778           	beq.s 2270 <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    21f8:	23f9 0000 5990 	move.l 5990 <Copperlist2>,5978 <ViewCopper>
    21fe:	0000 5978 
  SwapCl();
    2202:	45fa ff6e      	lea 2172 <SwapCl>(pc),a2
    2206:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    2208:	2039 0000 5988 	move.l 5988 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    220e:	2079 0000 5984 	movea.l 5984 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    2214:	2200           	move.l d0,d1
    2216:	4241           	clr.w d1
    2218:	4841           	swap d1
    221a:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    221e:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    2222:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    2228:	2200           	move.l d0,d1
    222a:	4241           	clr.w d1
    222c:	4841           	swap d1
    222e:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2232:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    2236:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    2238:	2079 0000 5984 	movea.l 5984 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    223e:	2002           	move.l d2,d0
    2240:	4240           	clr.w d0
    2242:	4840           	swap d0
    2244:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    2248:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    224c:	2002           	move.l d2,d0
    224e:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    2254:	2200           	move.l d0,d1
    2256:	4241           	clr.w d1
    2258:	4841           	swap d1
    225a:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    225e:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    2262:	23c2 0000 597c 	move.l d2,597c <ViewBuffer>
}
    2268:	7000           	moveq #0,d0
    226a:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    226e:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    2270:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    2276:	4eae ffc4      	jsr -60(a6)
    227a:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    2280:	2200           	move.l d0,d1
    2282:	243c 0000 30ce 	move.l #12494,d2
    2288:	7626           	moveq #38,d3
    228a:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    228e:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    2294:	7201           	moveq #1,d1
    2296:	4eae ff70      	jsr -144(a6)
    229a:	2439 0000 5980 	move.l 5980 <Bitplane2>,d2
  ViewCopper = Copperlist2;
    22a0:	23f9 0000 5990 	move.l 5990 <Copperlist2>,5978 <ViewCopper>
    22a6:	0000 5978 
  SwapCl();
    22aa:	45fa fec6      	lea 2172 <SwapCl>(pc),a2
    22ae:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    22b0:	2039 0000 5988 	move.l 5988 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    22b6:	2079 0000 5984 	movea.l 5984 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    22bc:	2200           	move.l d0,d1
    22be:	4241           	clr.w d1
    22c0:	4841           	swap d1
    22c2:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    22c6:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    22ca:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    22d0:	2200           	move.l d0,d1
    22d2:	4241           	clr.w d1
    22d4:	4841           	swap d1
    22d6:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    22da:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    22de:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    22e0:	2079 0000 5984 	movea.l 5984 <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    22e6:	2002           	move.l d2,d0
    22e8:	4240           	clr.w d0
    22ea:	4840           	swap d0
    22ec:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    22f0:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    22f4:	2002           	move.l d2,d0
    22f6:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    22fc:	2200           	move.l d0,d1
    22fe:	4241           	clr.w d1
    2300:	4841           	swap d1
    2302:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    2306:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    230a:	23c2 0000 597c 	move.l d2,597c <ViewBuffer>
}
    2310:	7000           	moveq #0,d0
    2312:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    2316:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    2318:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    231e:	4eae ffc4      	jsr -60(a6)
    2322:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    2328:	2200           	move.l d0,d1
    232a:	243c 0000 30a7 	move.l #12455,d2
    2330:	7626           	moveq #38,d3
    2332:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    2336:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    233c:	7201           	moveq #1,d1
    233e:	4eae ff70      	jsr -144(a6)
    2342:	2039 0000 598c 	move.l 598c <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    2348:	23c0 0000 5988 	move.l d0,5988 <DrawBuffer>
  DrawCopper = Copperlist1;
    234e:	23f9 0000 5994 	move.l 5994 <Copperlist1>,5984 <DrawCopper>
    2354:	0000 5984 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    2358:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    235e:	203c 0001 6800 	move.l #92160,d0
    2364:	7202           	moveq #2,d1
    2366:	4eae ff3a      	jsr -198(a6)
    236a:	2400           	move.l d0,d2
    236c:	23c0 0000 5980 	move.l d0,5980 <Bitplane2>
  if(Bitplane2 == 0) {
    2372:	6600 fe84      	bne.w 21f8 <PrepareDisplayZoom+0x60>
    2376:	6000 fef8      	bra.w 2270 <PrepareDisplayZoom+0xd8>

0000237a <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    237a:	2039 0000 5988 	move.l 5988 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    2380:	2079 0000 5984 	movea.l 5984 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    2386:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    238a:	2200           	move.l d0,d1
    238c:	4241           	clr.w d1
    238e:	4841           	swap d1
    2390:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    2394:	23f9 0000 597c 	move.l 597c <ViewBuffer>,5988 <DrawBuffer>
    239a:	0000 5988 
  ViewBuffer = (ULONG *) tmp;
    239e:	23c0 0000 597c 	move.l d0,597c <ViewBuffer>
}
    23a4:	4e75           	rts

000023a6 <PrepareDisplay>:
 int PrepareDisplaySW() {
    23a6:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClbuildSW();
    23aa:	45fa f89e      	lea 1c4a <ClBuild>(pc),a2
    23ae:	4e92           	jsr (a2)
    23b0:	23c0 0000 5994 	move.l d0,5994 <Copperlist1>
  Copperlist2 = ClbuildSW();
    23b6:	4e92           	jsr (a2)
    23b8:	23c0 0000 5990 	move.l d0,5990 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    23be:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    23c4:	203c 0000 c800 	move.l #51200,d0
    23ca:	7202           	moveq #2,d1
    23cc:	4eae ff3a      	jsr -198(a6)
    23d0:	23c0 0000 598c 	move.l d0,598c <Bitplane1>
  if(Bitplane1 == 0) {
    23d6:	6700 00ac      	beq.w 2484 <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    23da:	23c0 0000 5988 	move.l d0,5988 <DrawBuffer>
  DrawCopper = Copperlist1;
    23e0:	23f9 0000 5994 	move.l 5994 <Copperlist1>,5984 <DrawCopper>
    23e6:	0000 5984 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    23ea:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    23f0:	203c 0000 c800 	move.l #51200,d0
    23f6:	7202           	moveq #2,d1
    23f8:	4eae ff3a      	jsr -198(a6)
    23fc:	23c0 0000 5980 	move.l d0,5980 <Bitplane2>
  if(Bitplane2 == 0) {
    2402:	6728           	beq.s 242c <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    2404:	23c0 0000 597c 	move.l d0,597c <ViewBuffer>
  ViewCopper = Copperlist2;
    240a:	23f9 0000 5990 	move.l 5990 <Copperlist2>,5978 <ViewCopper>
    2410:	0000 5978 
  SwapCl();
    2414:	47fa fd5c      	lea 2172 <SwapCl>(pc),a3
    2418:	4e93           	jsr (a3)
  SetBplPointers();
    241a:	45fa ff5e      	lea 237a <SetBplPointers>(pc),a2
    241e:	4e92           	jsr (a2)
  SwapCl();
    2420:	4e93           	jsr (a3)
  SetBplPointers();
    2422:	4e92           	jsr (a2)
}
    2424:	7000           	moveq #0,d0
    2426:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    242a:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    242c:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    2432:	4eae ffc4      	jsr -60(a6)
    2436:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    243c:	2200           	move.l d0,d1
    243e:	243c 0000 30ce 	move.l #12494,d2
    2444:	7626           	moveq #38,d3
    2446:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    244a:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    2450:	7201           	moveq #1,d1
    2452:	4eae ff70      	jsr -144(a6)
    2456:	2039 0000 5980 	move.l 5980 <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    245c:	23c0 0000 597c 	move.l d0,597c <ViewBuffer>
  ViewCopper = Copperlist2;
    2462:	23f9 0000 5990 	move.l 5990 <Copperlist2>,5978 <ViewCopper>
    2468:	0000 5978 
  SwapCl();
    246c:	47fa fd04      	lea 2172 <SwapCl>(pc),a3
    2470:	4e93           	jsr (a3)
  SetBplPointers();
    2472:	45fa ff06      	lea 237a <SetBplPointers>(pc),a2
    2476:	4e92           	jsr (a2)
  SwapCl();
    2478:	4e93           	jsr (a3)
  SetBplPointers();
    247a:	4e92           	jsr (a2)
}
    247c:	7000           	moveq #0,d0
    247e:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    2482:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    2484:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    248a:	4eae ffc4      	jsr -60(a6)
    248e:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    2494:	2200           	move.l d0,d1
    2496:	243c 0000 30a7 	move.l #12455,d2
    249c:	7626           	moveq #38,d3
    249e:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    24a2:	2c79 0000 5998 	movea.l 5998 <DOSBase>,a6
    24a8:	7201           	moveq #1,d1
    24aa:	4eae ff70      	jsr -144(a6)
    24ae:	2039 0000 598c 	move.l 598c <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    24b4:	23c0 0000 5988 	move.l d0,5988 <DrawBuffer>
  DrawCopper = Copperlist1;
    24ba:	23f9 0000 5994 	move.l 5994 <Copperlist1>,5984 <DrawCopper>
    24c0:	0000 5984 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    24c4:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    24ca:	203c 0000 c800 	move.l #51200,d0
    24d0:	7202           	moveq #2,d1
    24d2:	4eae ff3a      	jsr -198(a6)
    24d6:	23c0 0000 5980 	move.l d0,5980 <Bitplane2>
  if(Bitplane2 == 0) {
    24dc:	6600 ff26      	bne.w 2404 <PrepareDisplay+0x5e>
    24e0:	6000 ff4a      	bra.w 242c <PrepareDisplay+0x86>

000024e4 <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    24e4:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    24e8:	262f 0010      	move.l 16(sp),d3
    24ec:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    24f0:	2279 0000 5994 	movea.l 5994 <Copperlist1>,a1
    24f6:	b2fc 0000      	cmpa.w #0,a1
    24fa:	670c           	beq.s 2508 <FreeDisplay+0x24>
    24fc:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    2502:	2003           	move.l d3,d0
    2504:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    2508:	2279 0000 5990 	movea.l 5990 <Copperlist2>,a1
    250e:	b2fc 0000      	cmpa.w #0,a1
    2512:	670c           	beq.s 2520 <FreeDisplay+0x3c>
    2514:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    251a:	2003           	move.l d3,d0
    251c:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    2520:	2279 0000 598c 	movea.l 598c <Bitplane1>,a1
    2526:	b2fc 0000      	cmpa.w #0,a1
    252a:	670c           	beq.s 2538 <FreeDisplay+0x54>
    252c:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    2532:	2002           	move.l d2,d0
    2534:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    2538:	2279 0000 5980 	movea.l 5980 <Bitplane2>,a1
    253e:	b2fc 0000      	cmpa.w #0,a1
    2542:	670c           	beq.s 2550 <FreeDisplay+0x6c>
    2544:	2c79 0000 599c 	movea.l 599c <SysBase>,a6
    254a:	2002           	move.l d2,d0
    254c:	4eae ff2e      	jsr -210(a6)
}
    2550:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2554:	4e75           	rts

00002556 <WaitVbl>:
void WaitVbl() {
    2556:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    2558:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddbe39>,d0
    255e:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    2560:	2017           	move.l (sp),d0
    2562:	0280 0001 ff00 	andi.l #130816,d0
    2568:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    256a:	2017           	move.l (sp),d0
    256c:	0c80 0001 3700 	cmpi.l #79616,d0
    2572:	67e4           	beq.s 2558 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    2574:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddbe39>,d0
    257a:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    257e:	202f 0004      	move.l 4(sp),d0
    2582:	0280 0001 ff00 	andi.l #130816,d0
    2588:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    258c:	202f 0004      	move.l 4(sp),d0
    2590:	0c80 0001 3700 	cmpi.l #79616,d0
    2596:	66dc           	bne.s 2574 <WaitVbl+0x1e>
}
    2598:	508f           	addq.l #8,sp
    259a:	4e75           	rts

0000259c <memcpy>:
{
    259c:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    25a0:	202f 0014      	move.l 20(sp),d0
    25a4:	226f 0018      	movea.l 24(sp),a1
    25a8:	222f 001c      	move.l 28(sp),d1
	while(len--)
    25ac:	2601           	move.l d1,d3
    25ae:	5383           	subq.l #1,d3
    25b0:	4a81           	tst.l d1
    25b2:	6762           	beq.s 2616 <memcpy+0x7a>
    25b4:	2040           	movea.l d0,a0
    25b6:	5888           	addq.l #4,a0
    25b8:	b1c9           	cmpa.l a1,a0
    25ba:	53c2           	sl.s d2
    25bc:	4402           	neg.b d2
    25be:	41e9 0004      	lea 4(a1),a0
    25c2:	b1c0           	cmpa.l d0,a0
    25c4:	53c4           	sl.s d4
    25c6:	4404           	neg.b d4
    25c8:	8404           	or.b d4,d2
    25ca:	7808           	moveq #8,d4
    25cc:	b883           	cmp.l d3,d4
    25ce:	55c4           	sc.s d4
    25d0:	4404           	neg.b d4
    25d2:	c404           	and.b d4,d2
    25d4:	6746           	beq.s 261c <memcpy+0x80>
    25d6:	2409           	move.l a1,d2
    25d8:	8480           	or.l d0,d2
    25da:	7803           	moveq #3,d4
    25dc:	c484           	and.l d4,d2
    25de:	663c           	bne.s 261c <memcpy+0x80>
    25e0:	2049           	movea.l a1,a0
    25e2:	2440           	movea.l d0,a2
    25e4:	74fc           	moveq #-4,d2
    25e6:	c481           	and.l d1,d2
    25e8:	d489           	add.l a1,d2
		*d++ = *s++;
    25ea:	24d8           	move.l (a0)+,(a2)+
    25ec:	b488           	cmp.l a0,d2
    25ee:	66fa           	bne.s 25ea <memcpy+0x4e>
    25f0:	74fc           	moveq #-4,d2
    25f2:	c481           	and.l d1,d2
    25f4:	2040           	movea.l d0,a0
    25f6:	d1c2           	adda.l d2,a0
    25f8:	d3c2           	adda.l d2,a1
    25fa:	9682           	sub.l d2,d3
    25fc:	b481           	cmp.l d1,d2
    25fe:	6716           	beq.s 2616 <memcpy+0x7a>
    2600:	1091           	move.b (a1),(a0)
	while(len--)
    2602:	4a83           	tst.l d3
    2604:	6710           	beq.s 2616 <memcpy+0x7a>
		*d++ = *s++;
    2606:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    260c:	5383           	subq.l #1,d3
    260e:	6706           	beq.s 2616 <memcpy+0x7a>
		*d++ = *s++;
    2610:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    2616:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    261a:	4e75           	rts
    261c:	2040           	movea.l d0,a0
    261e:	d289           	add.l a1,d1
		*d++ = *s++;
    2620:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    2622:	b289           	cmp.l a1,d1
    2624:	67f0           	beq.s 2616 <memcpy+0x7a>
		*d++ = *s++;
    2626:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    2628:	b289           	cmp.l a1,d1
    262a:	66f4           	bne.s 2620 <memcpy+0x84>
    262c:	60e8           	bra.s 2616 <memcpy+0x7a>

0000262e <memset>:
{
    262e:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    2632:	202f 0024      	move.l 36(sp),d0
    2636:	2a2f 0028      	move.l 40(sp),d5
    263a:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    263e:	2809           	move.l a1,d4
    2640:	5384           	subq.l #1,d4
    2642:	b2fc 0000      	cmpa.w #0,a1
    2646:	6f00 00b0      	ble.w 26f8 <memset+0xca>
    264a:	1e05           	move.b d5,d7
    264c:	2200           	move.l d0,d1
    264e:	4481           	neg.l d1
    2650:	7403           	moveq #3,d2
    2652:	c282           	and.l d2,d1
    2654:	7c05           	moveq #5,d6
		*ptr++ = val;
    2656:	2440           	movea.l d0,a2
    2658:	bc84           	cmp.l d4,d6
    265a:	646a           	bcc.s 26c6 <memset+0x98>
    265c:	4a81           	tst.l d1
    265e:	6724           	beq.s 2684 <memset+0x56>
    2660:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    2662:	5384           	subq.l #1,d4
    2664:	7401           	moveq #1,d2
    2666:	b481           	cmp.l d1,d2
    2668:	671a           	beq.s 2684 <memset+0x56>
		*ptr++ = val;
    266a:	2440           	movea.l d0,a2
    266c:	548a           	addq.l #2,a2
    266e:	2040           	movea.l d0,a0
    2670:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    2674:	5384           	subq.l #1,d4
    2676:	7403           	moveq #3,d2
    2678:	b481           	cmp.l d1,d2
    267a:	6608           	bne.s 2684 <memset+0x56>
		*ptr++ = val;
    267c:	528a           	addq.l #1,a2
    267e:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    2682:	5384           	subq.l #1,d4
    2684:	2609           	move.l a1,d3
    2686:	9681           	sub.l d1,d3
    2688:	7c00           	moveq #0,d6
    268a:	1c05           	move.b d5,d6
    268c:	2406           	move.l d6,d2
    268e:	4842           	swap d2
    2690:	4242           	clr.w d2
    2692:	2042           	movea.l d2,a0
    2694:	2406           	move.l d6,d2
    2696:	e14a           	lsl.w #8,d2
    2698:	4842           	swap d2
    269a:	4242           	clr.w d2
    269c:	e18e           	lsl.l #8,d6
    269e:	2646           	movea.l d6,a3
    26a0:	2c08           	move.l a0,d6
    26a2:	8486           	or.l d6,d2
    26a4:	2c0b           	move.l a3,d6
    26a6:	8486           	or.l d6,d2
    26a8:	1407           	move.b d7,d2
    26aa:	2040           	movea.l d0,a0
    26ac:	d1c1           	adda.l d1,a0
    26ae:	72fc           	moveq #-4,d1
    26b0:	c283           	and.l d3,d1
    26b2:	d288           	add.l a0,d1
		*ptr++ = val;
    26b4:	20c2           	move.l d2,(a0)+
    26b6:	b1c1           	cmpa.l d1,a0
    26b8:	66fa           	bne.s 26b4 <memset+0x86>
    26ba:	72fc           	moveq #-4,d1
    26bc:	c283           	and.l d3,d1
    26be:	d5c1           	adda.l d1,a2
    26c0:	9881           	sub.l d1,d4
    26c2:	b283           	cmp.l d3,d1
    26c4:	6732           	beq.s 26f8 <memset+0xca>
    26c6:	1485           	move.b d5,(a2)
	while(len-- > 0)
    26c8:	4a84           	tst.l d4
    26ca:	6f2c           	ble.s 26f8 <memset+0xca>
		*ptr++ = val;
    26cc:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    26d0:	7201           	moveq #1,d1
    26d2:	b284           	cmp.l d4,d1
    26d4:	6c22           	bge.s 26f8 <memset+0xca>
		*ptr++ = val;
    26d6:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    26da:	7402           	moveq #2,d2
    26dc:	b484           	cmp.l d4,d2
    26de:	6c18           	bge.s 26f8 <memset+0xca>
		*ptr++ = val;
    26e0:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    26e4:	7c03           	moveq #3,d6
    26e6:	bc84           	cmp.l d4,d6
    26e8:	6c0e           	bge.s 26f8 <memset+0xca>
		*ptr++ = val;
    26ea:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    26ee:	7204           	moveq #4,d1
    26f0:	b284           	cmp.l d4,d1
    26f2:	6c04           	bge.s 26f8 <memset+0xca>
		*ptr++ = val;
    26f4:	1545 0005      	move.b d5,5(a2)
}
    26f8:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    26fc:	4e75           	rts

000026fe <strlen>:
{
    26fe:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    2702:	7000           	moveq #0,d0
	while(*s++)
    2704:	4a10           	tst.b (a0)
    2706:	6708           	beq.s 2710 <strlen+0x12>
		t++;
    2708:	5280           	addq.l #1,d0
	while(*s++)
    270a:	4a30 0800      	tst.b (0,a0,d0.l)
    270e:	66f8           	bne.s 2708 <strlen+0xa>
}
    2710:	4e75           	rts
    2712:	4e71           	nop

00002714 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    2714:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    2718:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    271c:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    2720:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    2724:	d041           	add.w d1,d0
	swap	d0
    2726:	4840           	swap d0
	clrw	d0
    2728:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    272a:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    272e:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    2732:	d081           	add.l d1,d0

	rts
    2734:	4e75           	rts

00002736 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    2736:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    2738:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    273c:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    2740:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    2746:	6416           	bcc.s 275e <__udivsi3+0x28>
	movel	d0, d2
    2748:	2400           	move.l d0,d2
	clrw	d2
    274a:	4242           	clr.w d2
	swap	d2
    274c:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    274e:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    2750:	3002           	move.w d2,d0
	swap	d0
    2752:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    2754:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    2758:	84c1           	divu.w d1,d2
	movew	d2, d0
    275a:	3002           	move.w d2,d0
	jra	6f
    275c:	6030           	bra.s 278e <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    275e:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    2760:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    2762:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    2764:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    276a:	64f4           	bcc.s 2760 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    276c:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    276e:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    2774:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    2776:	c2c0           	mulu.w d0,d1
	swap	d2
    2778:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    277a:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    277c:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    277e:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    2780:	660a           	bne.s 278c <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    2782:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    2784:	6506           	bcs.s 278c <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    2786:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    278a:	6302           	bls.s 278e <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    278c:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    278e:	241f           	move.l (sp)+,d2
	rts
    2790:	4e75           	rts

00002792 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    2792:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    2794:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    2796:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    279a:	6a04           	bpl.s 27a0 <__divsi3+0xe>
	negl	d1
    279c:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    279e:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    27a0:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    27a4:	6a04           	bpl.s 27aa <__divsi3+0x18>
	negl	d0
    27a6:	4480           	neg.l d0
	negb	d2
    27a8:	4402           	neg.b d2

2:	movel	d1, sp@-
    27aa:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    27ac:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    27ae:	6186           	bsr.s 2736 <__udivsi3>
	addql	IMM (8), sp
    27b0:	508f           	addq.l #8,sp

	tstb	d2
    27b2:	4a02           	tst.b d2
	jpl	3f
    27b4:	6a02           	bpl.s 27b8 <__divsi3+0x26>
	negl	d0
    27b6:	4480           	neg.l d0

3:	movel	sp@+, d2
    27b8:	241f           	move.l (sp)+,d2
	rts
    27ba:	4e75           	rts

000027bc <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    27bc:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    27c0:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    27c4:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    27c6:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    27c8:	61c8           	bsr.s 2792 <__divsi3>
	addql	IMM (8), sp
    27ca:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    27cc:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    27d0:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    27d2:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    27d4:	6100 ff3e      	bsr.w 2714 <__mulsi3>
	addql	IMM (8), sp
    27d8:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    27da:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    27de:	9280           	sub.l d0,d1
	movel	d1, d0
    27e0:	2001           	move.l d1,d0
	rts
    27e2:	4e75           	rts

000027e4 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    27e4:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    27e8:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    27ec:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    27ee:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    27f0:	6100 ff44      	bsr.w 2736 <__udivsi3>
	addql	IMM (8), sp
    27f4:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    27f6:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    27fa:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    27fc:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    27fe:	6100 ff14      	bsr.w 2714 <__mulsi3>
	addql	IMM (8), sp
    2802:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    2804:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    2808:	9280           	sub.l d0,d1
	movel	d1, d0
    280a:	2001           	move.l d1,d0
	rts
    280c:	4e75           	rts

0000280e <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    280e:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    2810:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    2814:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    2818:	2c5f           	movea.l (sp)+,a6
    rts
    281a:	4e75           	rts

0000281c <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    281c:	16c0           	move.b d0,(a3)+
	rts
    281e:	4e75           	rts

00002820 <saveregs>:
	...

0000285c <font2distance>:
    285c:	0505           	btst d2,d5
    285e:	0505           	btst d2,d5
    2860:	0505           	btst d2,d5
    2862:	0505           	btst d2,d5
    2864:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    2866:	0505           	btst d2,d5
    2868:	0505           	btst d2,d5
    286a:	0005 0505      	ori.b #5,d5
    286e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    2870:	0505           	btst d2,d5
    2872:	0505           	btst d2,d5
    2874:	0505           	btst d2,d5
    2876:	0505           	btst d2,d5
    2878:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    287a:	0505           	btst d2,d5
    287c:	0505           	btst d2,d5
    287e:	0505           	btst d2,d5
    2880:	0505           	btst d2,d5
    2882:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    2884:	0500           	btst d2,d0
    2886:	0505           	btst d2,d5
    2888:	0505           	btst d2,d5
    288a:	0505           	btst d2,d5
    288c:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    288e:	0505           	btst d2,d5
    2890:	0505           	btst d2,d5
    2892:	0505           	btst d2,d5
    2894:	0505           	btst d2,d5
    2896:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    2898:	0505           	btst d2,d5
    289a:	0505           	btst d2,d5
    289c:	0503           	btst d2,d3
    289e:	0505           	btst d2,d5
    28a0:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    28a2:	0505           	btst d2,d5
    28a4:	0500           	btst d2,d0
    28a6:	0505           	btst d2,d5
    28a8:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    28ac:	0505           	btst d2,d5
    28ae:	0503           	btst d2,d3
    28b0:	0205 0507      	andi.b #7,d5
    28b4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    28b6:	0505           	btst d2,d5
    28b8:	0505           	btst d2,d5
    28ba:	0505           	btst d2,d5
    28bc:	0505           	btst d2,d5
    28be:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    28c0:	0505           	btst d2,d5
    28c2:	0505           	btst d2,d5
    28c4:	0505           	btst d2,d5
    28c6:	0505           	btst d2,d5
    28c8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    28ca:	0505           	btst d2,d5
    28cc:	0505           	btst d2,d5
    28ce:	0505           	btst d2,d5
    28d0:	0505           	btst d2,d5
    28d2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    28d4:	0505           	btst d2,d5
    28d6:	0505           	btst d2,d5
    28d8:	0505           	btst d2,d5
    28da:	0505           	btst d2,d5
    28dc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    28de:	0505           	btst d2,d5
    28e0:	0505           	btst d2,d5
    28e2:	0505           	btst d2,d5
    28e4:	0505           	btst d2,d5
    28e6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    28e8:	0505           	btst d2,d5
    28ea:	0505           	btst d2,d5
    28ec:	0505           	btst d2,d5
    28ee:	0505           	btst d2,d5
    28f0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    28f2:	0505           	btst d2,d5
    28f4:	0505           	btst d2,d5
    28f6:	0505           	btst d2,d5
    28f8:	0505           	btst d2,d5
    28fa:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    28fc:	0505           	btst d2,d5
    28fe:	0505           	btst d2,d5
    2900:	0505           	btst d2,d5
    2902:	0505           	btst d2,d5
    2904:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2906:	0505           	btst d2,d5
    2908:	0505           	btst d2,d5
    290a:	0505           	btst d2,d5
    290c:	0505           	btst d2,d5
    290e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2910:	0505           	btst d2,d5
    2912:	0505           	btst d2,d5
    2914:	0505           	btst d2,d5
    2916:	0505           	btst d2,d5
    2918:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    291a:	0505           	btst d2,d5
    291c:	0505           	btst d2,d5
    291e:	0505           	btst d2,d5
    2920:	0505           	btst d2,d5
    2922:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2924:	0505           	btst d2,d5
    2926:	0505           	btst d2,d5
    2928:	0505           	btst d2,d5
    292a:	0505           	btst d2,d5
    292c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    292e:	0505           	btst d2,d5
    2930:	0505           	btst d2,d5
    2932:	0505           	btst d2,d5
    2934:	0505           	btst d2,d5
    2936:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2938:	0505           	btst d2,d5
    293a:	0505           	btst d2,d5
    293c:	0505           	btst d2,d5
    293e:	0505           	btst d2,d5
    2940:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    2942:	0505           	btst d2,d5
    2944:	0505           	btst d2,d5
    2946:	0505           	btst d2,d5
    2948:	0505           	btst d2,d5
    294a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    294c:	0505           	btst d2,d5
    294e:	0505           	btst d2,d5
    2950:	0505           	btst d2,d5
    2952:	0505           	btst d2,d5
    2954:	0505           	btst d2,d5

00002956 <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    2956:	16c0           	move.b d0,(a3)+
  RTS
    2958:	4e75           	rts

0000295a <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    295a:	48f9 7fff 0000 	movem.l d0-a6,2820 <saveregs>
    2960:	2820 
  lea 0xdff000,a5
    2962:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddbe35>,a5
  move.l sp@(4),a0  //Fontlocation
    2968:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    296c:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    2970:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    2974:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    2976:	082d 0006 0002 	btst #6,2(a5)

0000297c <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    297c:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    2982:	66f8           	bne.s 297c <st2wblit>

00002984 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    2984:	7019           	moveq #25,d0
	sub.l d5,d5      
    2986:	9a85           	sub.l d5,d5

00002988 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    2988:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    298a:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    298c:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    2990:	9dce           	suba.l a6,a6
	move.l d2, a6
    2992:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    2994:	ddfc 0000 285c 	adda.l #10332,a6

	LSL  	#4,d2 	    //Fetch next char
    299a:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    299c:	2842           	movea.l d2,a4


	move.l  #0,d4
    299e:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    29a0:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    29a2:	3814           	move.w (a4),d4
	swap	d4
    29a4:	4844           	swap d4
	lsr.l	d5, d4
    29a6:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    29a8:	8993           	or.l d4,(a3)
	clr.l	d4
    29aa:	4284           	clr.l d4
	move.w  2(a4), d4
    29ac:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    29b0:	4844           	swap d4
	lsr.l	d5, d4
    29b2:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    29b4:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    29b8:	4284           	clr.l d4
	move.w  4(a4), d4
    29ba:	382c 0004      	move.w 4(a4),d4
	swap	d4
    29be:	4844           	swap d4
	lsr.l	d5, d4
    29c0:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    29c2:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    29c6:	4284           	clr.l d4
	move.w  6(a4), d4
    29c8:	382c 0006      	move.w 6(a4),d4
	swap	d4
    29cc:	4844           	swap d4
	lsr.l	d5, d4
    29ce:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    29d0:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    29d4:	4284           	clr.l d4
	move.w  8(a4), d4
    29d6:	382c 0008      	move.w 8(a4),d4
	swap	d4
    29da:	4844           	swap d4
	lsr.l	d5, d4
    29dc:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    29de:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    29e2:	4284           	clr.l d4
	move.w  10(a4), d4
    29e4:	382c 000a      	move.w 10(a4),d4
	swap	d4
    29e8:	4844           	swap d4
	lsr.l	d5, d4
    29ea:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    29ec:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    29f0:	4284           	clr.l d4
	move.w  12(a4), d4
    29f2:	382c 000c      	move.w 12(a4),d4
	swap	d4
    29f6:	4844           	swap d4
	lsr.l	d5, d4
    29f8:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    29fa:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    29fe:	4284           	clr.l d4
	move.w  14(a4), d4
    2a00:	382c 000e      	move.w 14(a4),d4
	swap	d4
    2a04:	4844           	swap d4
	lsr.l	d5, d4
    2a06:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    2a08:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    2a0c:	4284           	clr.l d4

	add.b   (a6), d5
    2a0e:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    2a10:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    2a14:	6500 0006      	bcs.w 2a1c <noadditionalchar>
	addq.w  #1, a3
    2a18:	524b           	addq.w #1,a3
	sub.w   #8,d5
    2a1a:	5145           	subq.w #8,d5

00002a1c <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    2a1c:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    2a1e:	51c8 ff68      	dbf d0,2988 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    2a22:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    2a26:	51cb ff5c      	dbf d3,2984 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    2a2a:	4cfa 7fff fdf2 	movem.l 2820 <saveregs>(pc),d0-a6

	RTS
    2a30:	4e75           	rts
