
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
       6:	4fef fff4      	lea -12(sp),sp
       a:	48e7 3132      	movem.l d2-d3/d7/a2-a3/a6,-(sp)

  SysBase = *((struct ExecBase**)4UL);
       e:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      12:	23ce 0001 3270 	move.l a6,13270 <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,13246 <hw>
      1e:	0001 3246 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0001 1815 	lea 11815 <incbin_startimage_end+0x75>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0001 3242 	move.l d0,13242 <GfxBase>
	if (!GfxBase)
      34:	6700 0758      	beq.w 78e <main+0x788>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0001 3270 	movea.l 13270 <SysBase>,a6
      3e:	43f9 0001 1826 	lea 11826 <incbin_startimage_end+0x86>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0001 326c 	move.l d0,1326c <DOSBase>
	if (!DOSBase)
      50:	6700 0650      	beq.w 6a2 <main+0x69c>
		Exit(0);

	//KPrintF("Hello debugger from Amiga!\n");
	Write(Output(), "Hello console!\n", 15);
      54:	2c40           	movea.l d0,a6
      56:	4eae ffc4      	jsr -60(a6)
      5a:	2c79 0001 326c 	movea.l 1326c <DOSBase>,a6
      60:	2200           	move.l d0,d1
      62:	243c 0001 1832 	move.l #71730,d2
      68:	760f           	moveq #15,d3
      6a:	4eae ffd0      	jsr -48(a6)
	Delay(50);
      6e:	2c79 0001 326c 	movea.l 1326c <DOSBase>,a6
      74:	7232           	moveq #50,d1
      76:	4eae ff3a      	jsr -198(a6)
  Zoom_InitRun();
      7a:	4eb9 0000 0c92 	jsr c92 <Zoom_InitRun>
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
      80:	2c79 0001 3242 	movea.l 13242 <GfxBase>,a6
      86:	23ee 0022 0001 	move.l 34(a6),13230 <ActiView>
      8c:	3230 
	OwnBlitter();
      8e:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
      92:	2c79 0001 3242 	movea.l 13242 <GfxBase>,a6
      98:	4eae ff1c      	jsr -228(a6)
	Disable();
      9c:	2c79 0001 3270 	movea.l 13270 <SysBase>,a6
      a2:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
      a6:	2479 0001 3246 	movea.l 13246 <hw>,a2
      ac:	302a 0010      	move.w 16(a2),d0
      b0:	33c0 0001 3234 	move.w d0,13234 <SystemADKCON>
	SystemInts=hw->intenar;
      b6:	302a 001c      	move.w 28(a2),d0
      ba:	33c0 0001 3238 	move.w d0,13238 <SystemInts>
	SystemDMA=hw->dmaconr;
      c0:	302a 0002      	move.w 2(a2),d0
      c4:	33c0 0001 3236 	move.w d0,13236 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
      ca:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
      d0:	357c 7fff 009c 	move.w #32767,156(a2)
	
	WaitVbl();
      d6:	47f9 0000 0e12 	lea e12 <WaitVbl>,a3
      dc:	4e93           	jsr (a3)
	WaitVbl();
      de:	4e93           	jsr (a3)
	hw->dmacon=0x7fff;//Clear all DMA channels
      e0:	357c 7fff 0096 	move.w #32767,150(a2)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
      e6:	2c79 0001 3242 	movea.l 13242 <GfxBase>,a6
      ec:	93c9           	suba.l a1,a1
      ee:	4eae ff22      	jsr -222(a6)
	WaitTOF();
      f2:	2c79 0001 3242 	movea.l 13242 <GfxBase>,a6
      f8:	4eae fef2      	jsr -270(a6)
	WaitTOF();
      fc:	2c79 0001 3242 	movea.l 13242 <GfxBase>,a6
     102:	4eae fef2      	jsr -270(a6)

	WaitVbl();
     106:	4e93           	jsr (a3)
	WaitVbl();
     108:	4e93           	jsr (a3)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     10a:	3f7c 4e7a 001e 	move.w #20090,30(sp)
     110:	3f7c 0801 0020 	move.w #2049,32(sp)
     116:	3f7c 4e73 0022 	move.w #20083,34(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     11c:	2c79 0001 3270 	movea.l 13270 <SysBase>,a6
     122:	082e 0000 0129 	btst #0,297(a6)
     128:	6700 065e      	beq.w 788 <main+0x782>
		vbr = (APTR)Supervisor((void*)getvbr);
     12c:	7e1e           	moveq #30,d7
     12e:	de8f           	add.l sp,d7
     130:	cf8d           	exg d7,a5
     132:	4eae ffe2      	jsr -30(a6)
     136:	cf8d           	exg d7,a5

	VBR=GetVBR();
     138:	23c0 0001 323a 	move.l d0,1323a <VBR.lto_priv.1>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     13e:	2079 0001 323a 	movea.l 1323a <VBR.lto_priv.1>,a0
     144:	2c68 006c      	movea.l 108(a0),a6
	SystemIrq=GetInterruptHandler(); //store interrupt register
     148:	23ce 0001 323e 	move.l a6,1323e <SystemIrq>
	//warpmode(1);
	// TODO: precalc stuff here
	//warpmode(0);

	TakeSystem();
	WaitVbl();
     14e:	4e93           	jsr (a3)
	// DEMO - increment frameCounter
	frameCounter++;
}

void RunDemo() {
  hw->dmacon = 0b1001001111100000;
     150:	2479 0001 3246 	movea.l 13246 <hw>,a2
     156:	357c 93e0 0096 	move.w #-27680,150(a2)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     15c:	2079 0001 323a 	movea.l 1323a <VBR.lto_priv.1>,a0
     162:	217c 0000 0de8 	move.l #3560,108(a0)
     168:	006c 
	SetInterruptHandler((APTR)interruptHandler);
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     16a:	357c c020 009a 	move.w #-16352,154(a2)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     170:	357c 0020 009c 	move.w #32,156(a2)
  for( int i=0;i<size;i++) 
    *destination++ = *source++;  
}

short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
     176:	3039 00df f016 	move.w dff016 <gcc8_c_support.c.e9862530+0xdd7165>,d0
  //PrepareDisplay();

	while(!MouseRight()) {
     17c:	0800 000a      	btst #10,d0
     180:	6700 03fe      	beq.w 580 <main+0x57a>
     184:	2639 0001 3252 	move.l 13252 <DrawCopper>,d3
     18a:	2239 0001 324a 	move.l 1324a <ViewCopper>,d1
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     190:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd7153>,d0
     196:	2f40 001e      	move.l d0,30(sp)
		vpos&=0x1ff00;
     19a:	202f 001e      	move.l 30(sp),d0
     19e:	0280 0001 ff00 	andi.l #130816,d0
     1a4:	2f40 001e      	move.l d0,30(sp)
		if (vpos!=(311<<8))
     1a8:	202f 001e      	move.l 30(sp),d0
     1ac:	0c80 0001 3700 	cmpi.l #79616,d0
     1b2:	67dc           	beq.s 190 <main+0x18a>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     1b4:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd7153>,d0
     1ba:	2f40 001a      	move.l d0,26(sp)
		vpos&=0x1ff00;
     1be:	202f 001a      	move.l 26(sp),d0
     1c2:	0280 0001 ff00 	andi.l #130816,d0
     1c8:	2f40 001a      	move.l d0,26(sp)
		if (vpos==(311<<8))
     1cc:	202f 001a      	move.l 26(sp),d0
     1d0:	0c80 0001 3700 	cmpi.l #79616,d0
     1d6:	66dc           	bne.s 1b4 <main+0x1ae>
  }
  //ZoomHorizontal = 10;
}

void Zoom_SetBplPointers() {
  ULONG plane2set = DrawBuffer;
     1d8:	2079 0001 3256 	movea.l 13256 <DrawBuffer>,a0
  UWORD *posofcopper = (UWORD *)DrawCopper + ZMCOPBPL1HIGH;
     1de:	2243           	movea.l d3,a1
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    UWORD highword = (ULONG)plane2set >> 16;
     1e0:	2008           	move.l a0,d0
     1e2:	4240           	clr.w d0
     1e4:	4840           	swap d0
     1e6:	3340 0072      	move.w d0,114(a1)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     1ea:	3348 0076      	move.w a0,118(a1)
    *posofcopper = highword;
    posofcopper += 2;
    *posofcopper = lowword;
    posofcopper += 2;
    plane2set += ZMLINESIZE; //Next plane (interleaved)
     1ee:	7030           	moveq #48,d0
     1f0:	d088           	add.l a0,d0
    UWORD highword = (ULONG)plane2set >> 16;
     1f2:	2400           	move.l d0,d2
     1f4:	4242           	clr.w d2
     1f6:	4842           	swap d2
     1f8:	3342 007a      	move.w d2,122(a1)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     1fc:	3340 007e      	move.w d0,126(a1)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
     200:	7060           	moveq #96,d0
     202:	d088           	add.l a0,d0
    UWORD highword = (ULONG)plane2set >> 16;
     204:	2400           	move.l d0,d2
     206:	4242           	clr.w d2
     208:	4842           	swap d2
     20a:	3342 0082      	move.w d2,130(a1)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     20e:	3340 0086      	move.w d0,134(a1)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
     212:	2008           	move.l a0,d0
     214:	0680 0000 0090 	addi.l #144,d0
    UWORD highword = (ULONG)plane2set >> 16;
     21a:	2400           	move.l d0,d2
     21c:	4242           	clr.w d2
     21e:	4842           	swap d2
     220:	3342 008a      	move.w d2,138(a1)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     224:	3340 008e      	move.w d0,142(a1)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
     228:	2008           	move.l a0,d0
     22a:	0680 0000 00c0 	addi.l #192,d0
    UWORD highword = (ULONG)plane2set >> 16;
     230:	2400           	move.l d0,d2
     232:	4242           	clr.w d2
     234:	4842           	swap d2
     236:	3342 0092      	move.w d2,146(a1)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     23a:	3340 0096      	move.w d0,150(a1)
  }
  
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
     23e:	23f9 0001 324e 	move.l 1324e <ViewBuffer>,13256 <DrawBuffer>
     244:	0001 3256 
  ViewBuffer = (ULONG *) tmp;
     248:	23c8 0001 324e 	move.l a0,1324e <ViewBuffer>
  DrawCopper = ViewCopper;
     24e:	2041           	movea.l d1,a0
     250:	2601           	move.l d1,d3
     252:	23c1 0001 3252 	move.l d1,13252 <DrawCopper>
  ViewCopper = (ULONG *)tmp;
     258:	2209           	move.l a1,d1
     25a:	23c9 0001 324a 	move.l a1,1324a <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
     260:	2549 0080      	move.l a1,128(a2)
  hw->copjmp1 = tmp;
     264:	3549 0088      	move.w a1,136(a2)
short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
     268:	1039 00bf e001 	move.b bfe001 <gcc8_c_support.c.e9862530+0xbd6150>,d0

void RunFrame() {
  Zoom_SetBplPointers();
  SwapCl();
  //TestZoomSpeed();
  while( !MouseLeft()) {}
     26e:	0800 0006      	btst #6,d0
     272:	66f4           	bne.s 268 <main+0x262>
     274:	1039 00bf e001 	move.b bfe001 <gcc8_c_support.c.e9862530+0xbd6150>,d0
  while( MouseLeft()) {}
     27a:	0800 0006      	btst #6,d0
     27e:	67f4           	beq.s 274 <main+0x26e>
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
     280:	3439 0001 326a 	move.w 1326a <Zoom_LevelOf102Zoom>,d2
    copperlist += 2;
  }
}

void Zoom_Shrink102( UWORD levelofshrink, UWORD *copperlist )  {
  UWORD *values4shift = Values4Shift+levelofshrink*120;
     286:	3002           	move.w d2,d0
     288:	c0fc 00f0      	mulu.w #240,d0
     28c:	2240           	movea.l d0,a1
     28e:	d3fc 0001 2000 	adda.l #73728,a1
    *copperlist = *values4shift++;
     294:	3151 012a      	move.w (a1),298(a0)
     298:	3169 0002 012e 	move.w 2(a1),302(a0)
     29e:	3169 0004 0132 	move.w 4(a1),306(a0)
     2a4:	3169 0006 0136 	move.w 6(a1),310(a0)
     2aa:	3169 0008 013a 	move.w 8(a1),314(a0)
     2b0:	3169 000a 013e 	move.w 10(a1),318(a0)
  *copperlist++ = *values4shift++;
     2b6:	3169 000c 0140 	move.w 12(a1),320(a0)
  *copperlist = *values4shift++;
     2bc:	3169 000e 0142 	move.w 14(a1),322(a0)
    *copperlist = *values4shift++;
     2c2:	3169 0010 0146 	move.w 16(a1),326(a0)
     2c8:	3169 0012 014a 	move.w 18(a1),330(a0)
     2ce:	3169 0014 014e 	move.w 20(a1),334(a0)
     2d4:	3169 0016 0152 	move.w 22(a1),338(a0)
     2da:	3169 0018 0156 	move.w 24(a1),342(a0)
     2e0:	3169 001a 015a 	move.w 26(a1),346(a0)
     2e6:	3169 001c 015e 	move.w 28(a1),350(a0)
     2ec:	3169 001e 0162 	move.w 30(a1),354(a0)
     2f2:	3169 0020 0166 	move.w 32(a1),358(a0)
     2f8:	3169 0022 016a 	move.w 34(a1),362(a0)
  *copperlist++ = *values4shift++;
     2fe:	3169 0024 016c 	move.w 36(a1),364(a0)
  *copperlist = *values4shift++;
     304:	3169 0026 016e 	move.w 38(a1),366(a0)
    *copperlist = *values4shift++;
     30a:	3169 0028 0172 	move.w 40(a1),370(a0)
     310:	3169 002a 0176 	move.w 42(a1),374(a0)
     316:	3169 002c 017a 	move.w 44(a1),378(a0)
     31c:	3169 002e 017e 	move.w 46(a1),382(a0)
     322:	3169 0030 0182 	move.w 48(a1),386(a0)
     328:	3169 0032 0186 	move.w 50(a1),390(a0)
     32e:	3169 0034 018a 	move.w 52(a1),394(a0)
     334:	3169 0036 018e 	move.w 54(a1),398(a0)
     33a:	3169 0038 0192 	move.w 56(a1),402(a0)
     340:	3169 003a 0196 	move.w 58(a1),406(a0)
    *copperlist = *values4shift++;
     346:	3169 003c 01ae 	move.w 60(a1),430(a0)
     34c:	3169 003e 01b2 	move.w 62(a1),434(a0)
     352:	3169 0040 01b6 	move.w 64(a1),438(a0)
     358:	3169 0042 01ba 	move.w 66(a1),442(a0)
     35e:	3169 0044 01be 	move.w 68(a1),446(a0)
     364:	3169 0046 01c2 	move.w 70(a1),450(a0)
  *copperlist++ = *values4shift++;
     36a:	3169 0048 01c4 	move.w 72(a1),452(a0)
  *copperlist = *values4shift++;
     370:	3169 004a 01c6 	move.w 74(a1),454(a0)
    *copperlist = *values4shift++;
     376:	3169 004c 01ca 	move.w 76(a1),458(a0)
     37c:	3169 004e 01ce 	move.w 78(a1),462(a0)
     382:	3169 0050 01d2 	move.w 80(a1),466(a0)
     388:	3169 0052 01d6 	move.w 82(a1),470(a0)
     38e:	3169 0054 01da 	move.w 84(a1),474(a0)
     394:	3169 0056 01de 	move.w 86(a1),478(a0)
     39a:	3169 0058 01e2 	move.w 88(a1),482(a0)
     3a0:	3169 005a 01e6 	move.w 90(a1),486(a0)
     3a6:	3169 005c 01ea 	move.w 92(a1),490(a0)
     3ac:	3169 005e 01ee 	move.w 94(a1),494(a0)
  *copperlist++ = *values4shift++;
     3b2:	3169 0060 01f0 	move.w 96(a1),496(a0)
  *copperlist = *values4shift++;
     3b8:	3169 0062 01f2 	move.w 98(a1),498(a0)
    *copperlist = *values4shift++;
     3be:	3169 0064 01f6 	move.w 100(a1),502(a0)
     3c4:	3169 0066 01fa 	move.w 102(a1),506(a0)
     3ca:	3169 0068 01fe 	move.w 104(a1),510(a0)
     3d0:	3169 006a 0202 	move.w 106(a1),514(a0)
     3d6:	3169 006c 0206 	move.w 108(a1),518(a0)
     3dc:	3169 006e 020a 	move.w 110(a1),522(a0)
     3e2:	3169 0070 020e 	move.w 112(a1),526(a0)
     3e8:	3169 0072 0212 	move.w 114(a1),530(a0)
     3ee:	3169 0074 0216 	move.w 116(a1),534(a0)
     3f4:	3169 0076 021a 	move.w 118(a1),538(a0)
    *copperlist = *values4shift++;
     3fa:	3169 0078 022a 	move.w 120(a1),554(a0)
     400:	3169 007a 022e 	move.w 122(a1),558(a0)
     406:	3169 007c 0232 	move.w 124(a1),562(a0)
     40c:	3169 007e 0236 	move.w 126(a1),566(a0)
     412:	3169 0080 023a 	move.w 128(a1),570(a0)
     418:	3169 0082 023e 	move.w 130(a1),574(a0)
  *copperlist++ = *values4shift++;
     41e:	3169 0084 0240 	move.w 132(a1),576(a0)
  *copperlist = *values4shift++;
     424:	3169 0086 0242 	move.w 134(a1),578(a0)
    *copperlist = *values4shift++;
     42a:	3169 0088 0246 	move.w 136(a1),582(a0)
     430:	3169 008a 024a 	move.w 138(a1),586(a0)
     436:	3169 008c 024e 	move.w 140(a1),590(a0)
     43c:	3169 008e 0252 	move.w 142(a1),594(a0)
     442:	3169 0090 0256 	move.w 144(a1),598(a0)
     448:	3169 0092 025a 	move.w 146(a1),602(a0)
     44e:	3169 0094 025e 	move.w 148(a1),606(a0)
     454:	3169 0096 0262 	move.w 150(a1),610(a0)
     45a:	3169 0098 0266 	move.w 152(a1),614(a0)
     460:	3169 009a 026a 	move.w 154(a1),618(a0)
  *copperlist++ = *values4shift++;
     466:	3169 009c 026c 	move.w 156(a1),620(a0)
  *copperlist = *values4shift++;
     46c:	3169 009e 026e 	move.w 158(a1),622(a0)
    *copperlist = *values4shift++;
     472:	3169 00a0 0272 	move.w 160(a1),626(a0)
     478:	3169 00a2 0276 	move.w 162(a1),630(a0)
     47e:	3169 00a4 027a 	move.w 164(a1),634(a0)
     484:	3169 00a6 027e 	move.w 166(a1),638(a0)
     48a:	3169 00a8 0282 	move.w 168(a1),642(a0)
     490:	3169 00aa 0286 	move.w 170(a1),646(a0)
     496:	3169 00ac 028a 	move.w 172(a1),650(a0)
     49c:	3169 00ae 028e 	move.w 174(a1),654(a0)
     4a2:	3169 00b0 0292 	move.w 176(a1),658(a0)
     4a8:	3169 00b2 0296 	move.w 178(a1),662(a0)
    *copperlist = *values4shift++;
     4ae:	3169 00b4 02a6 	move.w 180(a1),678(a0)
     4b4:	3169 00b6 02aa 	move.w 182(a1),682(a0)
     4ba:	3169 00b8 02ae 	move.w 184(a1),686(a0)
     4c0:	3169 00ba 02b2 	move.w 186(a1),690(a0)
     4c6:	3169 00bc 02b6 	move.w 188(a1),694(a0)
     4cc:	3169 00be 02ba 	move.w 190(a1),698(a0)
  *copperlist++ = *values4shift++;
     4d2:	3169 00c0 02bc 	move.w 192(a1),700(a0)
  *copperlist = *values4shift++;
     4d8:	3169 00c2 02be 	move.w 194(a1),702(a0)
    *copperlist = *values4shift++;
     4de:	3169 00c4 02c2 	move.w 196(a1),706(a0)
     4e4:	3169 00c6 02c6 	move.w 198(a1),710(a0)
     4ea:	3169 00c8 02ca 	move.w 200(a1),714(a0)
     4f0:	3169 00ca 02ce 	move.w 202(a1),718(a0)
     4f6:	3169 00cc 02d2 	move.w 204(a1),722(a0)
     4fc:	3169 00ce 02d6 	move.w 206(a1),726(a0)
     502:	3169 00d0 02da 	move.w 208(a1),730(a0)
     508:	3169 00d2 02de 	move.w 210(a1),734(a0)
     50e:	3169 00d4 02e2 	move.w 212(a1),738(a0)
     514:	3169 00d6 02e6 	move.w 214(a1),742(a0)
  *copperlist++ = *values4shift++;
     51a:	3169 00d8 02e8 	move.w 216(a1),744(a0)
  *copperlist = *values4shift++;
     520:	3169 00da 02ea 	move.w 218(a1),746(a0)
    *copperlist = *values4shift++;
     526:	3169 00dc 02ee 	move.w 220(a1),750(a0)
     52c:	3169 00de 02f2 	move.w 222(a1),754(a0)
     532:	3169 00e0 02f6 	move.w 224(a1),758(a0)
     538:	3169 00e2 02fa 	move.w 226(a1),762(a0)
     53e:	3169 00e4 02fe 	move.w 228(a1),766(a0)
     544:	3169 00e6 0302 	move.w 230(a1),770(a0)
     54a:	3169 00e8 0306 	move.w 232(a1),774(a0)
     550:	3169 00ea 030a 	move.w 234(a1),778(a0)
     556:	3169 00ec 030e 	move.w 236(a1),782(a0)
     55c:	3169 00ee 0312 	move.w 238(a1),786(a0)
  //Zoom_ZoomIntoPicture( (UWORD *)ViewBuffer - 2, (UWORD *)DrawBuffer - 2, Zoom_LevelOfZoom, 5 );
  if( Zoom_LevelOf102Zoom == 15)
     562:	0c42 000f      	cmpi.w #15,d2
     566:	6700 00fc      	beq.w 664 <main+0x65e>
    Zoom_LevelOf102Zoom = 0;
  else
    Zoom_LevelOf102Zoom++;
     56a:	5242           	addq.w #1,d2
     56c:	33c2 0001 326a 	move.w d2,1326a <Zoom_LevelOf102Zoom>
     572:	3039 00df f016 	move.w dff016 <gcc8_c_support.c.e9862530+0xdd7165>,d0
	while(!MouseRight()) {
     578:	0800 000a      	btst #10,d0
     57c:	6600 fc12      	bne.w 190 <main+0x18a>
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     580:	2079 0001 323a 	movea.l 1323a <VBR.lto_priv.1>,a0
     586:	217c 0000 0de8 	move.l #3560,108(a0)
     58c:	006c 
	WaitVbl();
     58e:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     590:	302a 0002      	move.w 2(a2),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     594:	302a 0002      	move.w 2(a2),d0
     598:	0800 000e      	btst #14,d0
     59c:	66f6           	bne.s 594 <main+0x58e>
	hw->intena=0x7fff;//disable all interrupts
     59e:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     5a4:	357c 7fff 009c 	move.w #32767,156(a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
     5aa:	357c 7fff 0096 	move.w #32767,150(a2)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     5b0:	2079 0001 323a 	movea.l 1323a <VBR.lto_priv.1>,a0
     5b6:	214e 006c      	move.l a6,108(a0)
	hw->cop1lc=(ULONG)GfxBase->copinit;
     5ba:	2c79 0001 3242 	movea.l 13242 <GfxBase>,a6
     5c0:	256e 0026 0080 	move.l 38(a6),128(a2)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
     5c6:	256e 0032 0084 	move.l 50(a6),132(a2)
	hw->copjmp1=0x7fff; //start coppper
     5cc:	357c 7fff 0088 	move.w #32767,136(a2)
	hw->intena=SystemInts|0x8000;
     5d2:	3039 0001 3238 	move.w 13238 <SystemInts>,d0
     5d8:	0040 8000      	ori.w #-32768,d0
     5dc:	3540 009a      	move.w d0,154(a2)
	hw->dmacon=SystemDMA|0x8000;
     5e0:	3039 0001 3236 	move.w 13236 <SystemDMA>,d0
     5e6:	0040 8000      	ori.w #-32768,d0
     5ea:	3540 0096      	move.w d0,150(a2)
	hw->adkcon=SystemADKCON|0x8000;
     5ee:	3039 0001 3234 	move.w 13234 <SystemADKCON>,d0
     5f4:	0040 8000      	ori.w #-32768,d0
     5f8:	3540 009e      	move.w d0,158(a2)
	LoadView(ActiView);
     5fc:	2279 0001 3230 	movea.l 13230 <ActiView>,a1
     602:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     606:	2c79 0001 3242 	movea.l 13242 <GfxBase>,a6
     60c:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     610:	2c79 0001 3242 	movea.l 13242 <GfxBase>,a6
     616:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     61a:	2c79 0001 3242 	movea.l 13242 <GfxBase>,a6
     620:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     624:	2c79 0001 3242 	movea.l 13242 <GfxBase>,a6
     62a:	4eae fe32      	jsr -462(a6)
	Enable();
     62e:	2c79 0001 3270 	movea.l 13270 <SysBase>,a6
     634:	4eae ff82      	jsr -126(a6)

	RunDemo();	// END

	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
     638:	2c79 0001 3270 	movea.l 13270 <SysBase>,a6
     63e:	2279 0001 326c 	movea.l 1326c <DOSBase>,a1
     644:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     648:	2c79 0001 3270 	movea.l 13270 <SysBase>,a6
     64e:	2279 0001 3242 	movea.l 13242 <GfxBase>,a1
     654:	4eae fe62      	jsr -414(a6)
}
     658:	7000           	moveq #0,d0
     65a:	4cdf 4c8c      	movem.l (sp)+,d2-d3/d7/a2-a3/a6
     65e:	4fef 000c      	lea 12(sp),sp
     662:	4e75           	rts
    Zoom_LevelOf102Zoom = 0;
     664:	4279 0001 326a 	clr.w 1326a <Zoom_LevelOf102Zoom>
     66a:	3039 00df f016 	move.w dff016 <gcc8_c_support.c.e9862530+0xdd7165>,d0
	while(!MouseRight()) {
     670:	0800 000a      	btst #10,d0
     674:	6700 ff0a      	beq.w 580 <main+0x57a>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     678:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd7153>,d0
     67e:	2f40 001e      	move.l d0,30(sp)
		vpos&=0x1ff00;
     682:	202f 001e      	move.l 30(sp),d0
     686:	0280 0001 ff00 	andi.l #130816,d0
     68c:	2f40 001e      	move.l d0,30(sp)
		if (vpos!=(311<<8))
     690:	202f 001e      	move.l 30(sp),d0
     694:	0c80 0001 3700 	cmpi.l #79616,d0
     69a:	6700 faf4      	beq.w 190 <main+0x18a>
     69e:	6000 fb14      	bra.w 1b4 <main+0x1ae>
		Exit(0);
     6a2:	9dce           	suba.l a6,a6
     6a4:	7200           	moveq #0,d1
     6a6:	4eae ff70      	jsr -144(a6)
     6aa:	2039 0001 326c 	move.l 1326c <DOSBase>,d0
	Write(Output(), "Hello console!\n", 15);
     6b0:	2c40           	movea.l d0,a6
     6b2:	4eae ffc4      	jsr -60(a6)
     6b6:	2c79 0001 326c 	movea.l 1326c <DOSBase>,a6
     6bc:	2200           	move.l d0,d1
     6be:	243c 0001 1832 	move.l #71730,d2
     6c4:	760f           	moveq #15,d3
     6c6:	4eae ffd0      	jsr -48(a6)
	Delay(50);
     6ca:	2c79 0001 326c 	movea.l 1326c <DOSBase>,a6
     6d0:	7232           	moveq #50,d1
     6d2:	4eae ff3a      	jsr -198(a6)
  Zoom_InitRun();
     6d6:	4eb9 0000 0c92 	jsr c92 <Zoom_InitRun>
	ActiView=GfxBase->ActiView; //store current view
     6dc:	2c79 0001 3242 	movea.l 13242 <GfxBase>,a6
     6e2:	23ee 0022 0001 	move.l 34(a6),13230 <ActiView>
     6e8:	3230 
	OwnBlitter();
     6ea:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     6ee:	2c79 0001 3242 	movea.l 13242 <GfxBase>,a6
     6f4:	4eae ff1c      	jsr -228(a6)
	Disable();
     6f8:	2c79 0001 3270 	movea.l 13270 <SysBase>,a6
     6fe:	4eae ff88      	jsr -120(a6)
	SystemADKCON=hw->adkconr;
     702:	2479 0001 3246 	movea.l 13246 <hw>,a2
     708:	302a 0010      	move.w 16(a2),d0
     70c:	33c0 0001 3234 	move.w d0,13234 <SystemADKCON>
	SystemInts=hw->intenar;
     712:	302a 001c      	move.w 28(a2),d0
     716:	33c0 0001 3238 	move.w d0,13238 <SystemInts>
	SystemDMA=hw->dmaconr;
     71c:	302a 0002      	move.w 2(a2),d0
     720:	33c0 0001 3236 	move.w d0,13236 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
     726:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     72c:	357c 7fff 009c 	move.w #32767,156(a2)
	WaitVbl();
     732:	47f9 0000 0e12 	lea e12 <WaitVbl>,a3
     738:	4e93           	jsr (a3)
	WaitVbl();
     73a:	4e93           	jsr (a3)
	hw->dmacon=0x7fff;//Clear all DMA channels
     73c:	357c 7fff 0096 	move.w #32767,150(a2)
	LoadView(0);
     742:	2c79 0001 3242 	movea.l 13242 <GfxBase>,a6
     748:	93c9           	suba.l a1,a1
     74a:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     74e:	2c79 0001 3242 	movea.l 13242 <GfxBase>,a6
     754:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     758:	2c79 0001 3242 	movea.l 13242 <GfxBase>,a6
     75e:	4eae fef2      	jsr -270(a6)
	WaitVbl();
     762:	4e93           	jsr (a3)
	WaitVbl();
     764:	4e93           	jsr (a3)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     766:	3f7c 4e7a 001e 	move.w #20090,30(sp)
     76c:	3f7c 0801 0020 	move.w #2049,32(sp)
     772:	3f7c 4e73 0022 	move.w #20083,34(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     778:	2c79 0001 3270 	movea.l 13270 <SysBase>,a6
     77e:	082e 0000 0129 	btst #0,297(a6)
     784:	6600 f9a6      	bne.w 12c <main+0x126>
	APTR vbr = 0;
     788:	7000           	moveq #0,d0
     78a:	6000 f9ac      	bra.w 138 <main+0x132>
		Exit(0);
     78e:	2c79 0001 326c 	movea.l 1326c <DOSBase>,a6
     794:	7200           	moveq #0,d1
     796:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     79a:	2c79 0001 3270 	movea.l 13270 <SysBase>,a6
     7a0:	43f9 0001 1826 	lea 11826 <incbin_startimage_end+0x86>,a1
     7a6:	7000           	moveq #0,d0
     7a8:	4eae fdd8      	jsr -552(a6)
     7ac:	23c0 0001 326c 	move.l d0,1326c <DOSBase>
	if (!DOSBase)
     7b2:	6600 f8a0      	bne.w 54 <main+0x4e>
     7b6:	6000 feea      	bra.w 6a2 <main+0x69c>
     7ba:	4e71           	nop

000007bc <ClbuildZoom>:
ULONG * ClbuildZoom() {
     7bc:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
     7c0:	2c79 0001 3270 	movea.l 13270 <SysBase>,a6
     7c6:	203c 0000 591c 	move.l #22812,d0
     7cc:	7202           	moveq #2,d1
     7ce:	4eae ff3a      	jsr -198(a6)
     7d2:	2440           	movea.l d0,a2
  if( retval == 0) {
     7d4:	4a80           	tst.l d0
     7d6:	6700 01ee      	beq.w 9c6 <ClbuildZoom+0x20a>
    *cl++ = *clpartinstruction++;
     7da:	24b9 0001 31cc 	move.l 131cc <ClsSprites>,(a2)
     7e0:	2579 0001 31d0 	move.l 131d0 <ClsSprites+0x4>,4(a2)
     7e6:	0004 
     7e8:	2579 0001 31d4 	move.l 131d4 <ClsSprites+0x8>,8(a2)
     7ee:	0008 
     7f0:	2579 0001 31d8 	move.l 131d8 <ClsSprites+0xc>,12(a2)
     7f6:	000c 
     7f8:	2579 0001 31dc 	move.l 131dc <ClsSprites+0x10>,16(a2)
     7fe:	0010 
     800:	2579 0001 31e0 	move.l 131e0 <ClsSprites+0x14>,20(a2)
     806:	0014 
     808:	2579 0001 31e4 	move.l 131e4 <ClsSprites+0x18>,24(a2)
     80e:	0018 
     810:	2579 0001 31e8 	move.l 131e8 <ClsSprites+0x1c>,28(a2)
     816:	001c 
     818:	2579 0001 31ec 	move.l 131ec <ClsSprites+0x20>,32(a2)
     81e:	0020 
     820:	2579 0001 31f0 	move.l 131f0 <ClsSprites+0x24>,36(a2)
     826:	0024 
     828:	2579 0001 31f4 	move.l 131f4 <ClsSprites+0x28>,40(a2)
     82e:	0028 
     830:	2579 0001 31f8 	move.l 131f8 <ClsSprites+0x2c>,44(a2)
     836:	002c 
     838:	2579 0001 31fc 	move.l 131fc <ClsSprites+0x30>,48(a2)
     83e:	0030 
     840:	2579 0001 3200 	move.l 13200 <ClsSprites+0x34>,52(a2)
     846:	0034 
     848:	2579 0001 3204 	move.l 13204 <ClsSprites+0x38>,56(a2)
     84e:	0038 
     850:	2579 0001 3208 	move.l 13208 <ClsSprites+0x3c>,60(a2)
     856:	003c 
    *cl++ = *clpartinstruction++;
     858:	2579 0001 319c 	move.l 1319c <ClScreen>,64(a2)
     85e:	0040 
     860:	2579 0001 31a0 	move.l 131a0 <ClScreen+0x4>,68(a2)
     866:	0044 
     868:	2579 0001 31a4 	move.l 131a4 <ClScreen+0x8>,72(a2)
     86e:	0048 
     870:	2579 0001 31a8 	move.l 131a8 <ClScreen+0xc>,76(a2)
     876:	004c 
     878:	2579 0001 31ac 	move.l 131ac <ClScreen+0x10>,80(a2)
     87e:	0050 
     880:	2579 0001 31b0 	move.l 131b0 <ClScreen+0x14>,84(a2)
     886:	0054 
     888:	2579 0001 31b4 	move.l 131b4 <ClScreen+0x18>,88(a2)
     88e:	0058 
     890:	2579 0001 31b8 	move.l 131b8 <ClScreen+0x1c>,92(a2)
     896:	005c 
     898:	2579 0001 31bc 	move.l 131bc <ClScreen+0x20>,96(a2)
     89e:	0060 
     8a0:	2579 0001 31c0 	move.l 131c0 <ClScreen+0x24>,100(a2)
     8a6:	0064 
     8a8:	2579 0001 31c4 	move.l 131c4 <ClScreen+0x28>,104(a2)
     8ae:	0068 
     8b0:	2579 0001 31c8 	move.l 131c8 <ClScreen+0x2c>,108(a2)
     8b6:	006c 
  *cl++ = 0x00e00000;
     8b8:	257c 00e0 0000 	move.l #14680064,112(a2)
     8be:	0070 
  *cl++ = 0x00e20000;
     8c0:	257c 00e2 0000 	move.l #14811136,116(a2)
     8c6:	0074 
  *cl++ = 0x00e40000;
     8c8:	257c 00e4 0000 	move.l #14942208,120(a2)
     8ce:	0078 
  *cl++ = 0x00e60000;
     8d0:	257c 00e6 0000 	move.l #15073280,124(a2)
     8d6:	007c 
  *cl++ = 0x00e80000;
     8d8:	257c 00e8 0000 	move.l #15204352,128(a2)
     8de:	0080 
  *cl++ = 0x00ea0000;
     8e0:	257c 00ea 0000 	move.l #15335424,132(a2)
     8e6:	0084 
  *cl++ = 0x00ec0000;
     8e8:	257c 00ec 0000 	move.l #15466496,136(a2)
     8ee:	0088 
  *cl++ = 0x00ee0000;
     8f0:	257c 00ee 0000 	move.l #15597568,140(a2)
     8f6:	008c 
  *cl++ = 0x00f00000;
     8f8:	257c 00f0 0000 	move.l #15728640,144(a2)
     8fe:	0090 
  *cl++ = 0x00f20000;
     900:	257c 00f2 0000 	move.l #15859712,148(a2)
     906:	0094 
  for(int i=0; i<32;i++)
     908:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
     90c:	41f9 0001 311c 	lea 1311c <ClColor>,a0
    *cl++ = *clpartinstruction++;
     912:	22d8           	move.l (a0)+,(a1)+
  for(int i=0; i<32;i++)
     914:	b1fc 0001 319c 	cmpa.l #78236,a0
     91a:	66f6           	bne.s 912 <ClbuildZoom+0x156>
  ULONG cop2 = cl+3;
     91c:	200a           	move.l a2,d0
     91e:	0680 0000 0124 	addi.l #292,d0
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
     924:	2200           	move.l d0,d1
     926:	4241           	clr.w d1
     928:	4841           	swap d1
     92a:	0681 0084 0000 	addi.l #8650752,d1
     930:	2541 0118      	move.l d1,280(a2)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
     934:	2200           	move.l d0,d1
     936:	0281 0000 ffff 	andi.l #65535,d1
     93c:	0681 0086 0000 	addi.l #8781824,d1
     942:	2541 011c      	move.l d1,284(a2)
  *cl++ = 0x2c01ff00;
     946:	257c 2c01 ff00 	move.l #738328320,288(a2)
     94c:	0120 
  ULONG cop2br1 = cop2 + ( (33)<<2);
     94e:	2200           	move.l d0,d1
     950:	0681 0000 0084 	addi.l #132,d1
  clpartinstruction[31] = 0x00840000 + ( cop2br1 >> 16);
     956:	2401           	move.l d1,d2
     958:	4242           	clr.w d2
     95a:	4842           	swap d2
     95c:	0682 0084 0000 	addi.l #8650752,d2
     962:	23c2 0001 2f7c 	move.l d2,12f7c <Cl102ZoomRepeat+0x7c>
  clpartinstruction[32] = 0x00860000 + ( cop2br1 & 0xffff);
     968:	0281 0000 ffff 	andi.l #65535,d1
     96e:	0681 0086 0000 	addi.l #8781824,d1
     974:	23c1 0001 2f80 	move.l d1,12f80 <Cl102ZoomRepeat+0x80>
  clpartinstruction[93] = 0x00840000 + ( cop2br2 >> 16);
     97a:	220a           	move.l a2,d1
     97c:	0681 0000 02a0 	addi.l #672,d1
     982:	2401           	move.l d1,d2
     984:	4242           	clr.w d2
     986:	4842           	swap d2
     988:	0682 0084 0000 	addi.l #8650752,d2
     98e:	23c2 0001 3074 	move.l d2,13074 <Cl102ZoomRepeat+0x174>
  clpartinstruction[94] = 0x00860000 + ( cop2br2 & 0xffff);
     994:	0281 0000 ffff 	andi.l #65535,d1
     99a:	0681 0086 0000 	addi.l #8781824,d1
     9a0:	23c1 0001 3078 	move.l d1,13078 <Cl102ZoomRepeat+0x178>
  for(int i=0;i<26+27+27+26+27+1-8;i++)
     9a6:	2240           	movea.l d0,a1
  clpartinstruction = Cl102ZoomRepeat;
     9a8:	41f9 0001 2f00 	lea 12f00 <Cl102ZoomRepeat>,a0
    *cl++ = *clpartinstruction++;
     9ae:	22d8           	move.l (a0)+,(a1)+
  for(int i=0;i<26+27+27+26+27+1-8;i++)
     9b0:	b1fc 0001 30f8 	cmpa.l #78072,a0
     9b6:	66f6           	bne.s 9ae <ClbuildZoom+0x1f2>
   *cl++ = 0xfffffffe;
     9b8:	70fe           	moveq #-2,d0
     9ba:	2540 031c      	move.l d0,796(a2)
}
     9be:	200a           	move.l a2,d0
     9c0:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     9c4:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     9c6:	2c79 0001 326c 	movea.l 1326c <DOSBase>,a6
     9cc:	4eae ffc4      	jsr -60(a6)
     9d0:	2c79 0001 326c 	movea.l 1326c <DOSBase>,a6
     9d6:	2200           	move.l d0,d1
     9d8:	243c 0001 17a1 	move.l #71585,d2
     9de:	7628           	moveq #40,d3
     9e0:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     9e4:	2c79 0001 326c 	movea.l 1326c <DOSBase>,a6
     9ea:	7201           	moveq #1,d1
     9ec:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
     9f0:	24b9 0001 31cc 	move.l 131cc <ClsSprites>,(a2)
     9f6:	2579 0001 31d0 	move.l 131d0 <ClsSprites+0x4>,4(a2)
     9fc:	0004 
     9fe:	2579 0001 31d4 	move.l 131d4 <ClsSprites+0x8>,8(a2)
     a04:	0008 
     a06:	2579 0001 31d8 	move.l 131d8 <ClsSprites+0xc>,12(a2)
     a0c:	000c 
     a0e:	2579 0001 31dc 	move.l 131dc <ClsSprites+0x10>,16(a2)
     a14:	0010 
     a16:	2579 0001 31e0 	move.l 131e0 <ClsSprites+0x14>,20(a2)
     a1c:	0014 
     a1e:	2579 0001 31e4 	move.l 131e4 <ClsSprites+0x18>,24(a2)
     a24:	0018 
     a26:	2579 0001 31e8 	move.l 131e8 <ClsSprites+0x1c>,28(a2)
     a2c:	001c 
     a2e:	2579 0001 31ec 	move.l 131ec <ClsSprites+0x20>,32(a2)
     a34:	0020 
     a36:	2579 0001 31f0 	move.l 131f0 <ClsSprites+0x24>,36(a2)
     a3c:	0024 
     a3e:	2579 0001 31f4 	move.l 131f4 <ClsSprites+0x28>,40(a2)
     a44:	0028 
     a46:	2579 0001 31f8 	move.l 131f8 <ClsSprites+0x2c>,44(a2)
     a4c:	002c 
     a4e:	2579 0001 31fc 	move.l 131fc <ClsSprites+0x30>,48(a2)
     a54:	0030 
     a56:	2579 0001 3200 	move.l 13200 <ClsSprites+0x34>,52(a2)
     a5c:	0034 
     a5e:	2579 0001 3204 	move.l 13204 <ClsSprites+0x38>,56(a2)
     a64:	0038 
     a66:	2579 0001 3208 	move.l 13208 <ClsSprites+0x3c>,60(a2)
     a6c:	003c 
    *cl++ = *clpartinstruction++;
     a6e:	2579 0001 319c 	move.l 1319c <ClScreen>,64(a2)
     a74:	0040 
     a76:	2579 0001 31a0 	move.l 131a0 <ClScreen+0x4>,68(a2)
     a7c:	0044 
     a7e:	2579 0001 31a4 	move.l 131a4 <ClScreen+0x8>,72(a2)
     a84:	0048 
     a86:	2579 0001 31a8 	move.l 131a8 <ClScreen+0xc>,76(a2)
     a8c:	004c 
     a8e:	2579 0001 31ac 	move.l 131ac <ClScreen+0x10>,80(a2)
     a94:	0050 
     a96:	2579 0001 31b0 	move.l 131b0 <ClScreen+0x14>,84(a2)
     a9c:	0054 
     a9e:	2579 0001 31b4 	move.l 131b4 <ClScreen+0x18>,88(a2)
     aa4:	0058 
     aa6:	2579 0001 31b8 	move.l 131b8 <ClScreen+0x1c>,92(a2)
     aac:	005c 
     aae:	2579 0001 31bc 	move.l 131bc <ClScreen+0x20>,96(a2)
     ab4:	0060 
     ab6:	2579 0001 31c0 	move.l 131c0 <ClScreen+0x24>,100(a2)
     abc:	0064 
     abe:	2579 0001 31c4 	move.l 131c4 <ClScreen+0x28>,104(a2)
     ac4:	0068 
     ac6:	2579 0001 31c8 	move.l 131c8 <ClScreen+0x2c>,108(a2)
     acc:	006c 
  *cl++ = 0x00e00000;
     ace:	257c 00e0 0000 	move.l #14680064,112(a2)
     ad4:	0070 
  *cl++ = 0x00e20000;
     ad6:	257c 00e2 0000 	move.l #14811136,116(a2)
     adc:	0074 
  *cl++ = 0x00e40000;
     ade:	257c 00e4 0000 	move.l #14942208,120(a2)
     ae4:	0078 
  *cl++ = 0x00e60000;
     ae6:	257c 00e6 0000 	move.l #15073280,124(a2)
     aec:	007c 
  *cl++ = 0x00e80000;
     aee:	257c 00e8 0000 	move.l #15204352,128(a2)
     af4:	0080 
  *cl++ = 0x00ea0000;
     af6:	257c 00ea 0000 	move.l #15335424,132(a2)
     afc:	0084 
  *cl++ = 0x00ec0000;
     afe:	257c 00ec 0000 	move.l #15466496,136(a2)
     b04:	0088 
  *cl++ = 0x00ee0000;
     b06:	257c 00ee 0000 	move.l #15597568,140(a2)
     b0c:	008c 
  *cl++ = 0x00f00000;
     b0e:	257c 00f0 0000 	move.l #15728640,144(a2)
     b14:	0090 
  *cl++ = 0x00f20000;
     b16:	257c 00f2 0000 	move.l #15859712,148(a2)
     b1c:	0094 
  for(int i=0; i<32;i++)
     b1e:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
     b22:	41f9 0001 311c 	lea 1311c <ClColor>,a0
     b28:	6000 fde8      	bra.w 912 <ClbuildZoom+0x156>

00000b2c <Zoom_LoadImage>:
void Zoom_LoadImage( ULONG *destination) {  
     b2c:	206f 0004      	movea.l 4(sp),a0
  for( int i=0;i<256;i++) {
     b30:	2008           	move.l a0,d0
     b32:	0680 0000 f000 	addi.l #61440,d0
      *destination++ = 0xaaaaaaaa;                 
     b38:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
     b3e:	217c aaaa aaaa 	move.l #-1431655766,4(a0)
     b44:	0004 
     b46:	217c aaaa aaaa 	move.l #-1431655766,8(a0)
     b4c:	0008 
     b4e:	217c aaaa aaaa 	move.l #-1431655766,12(a0)
     b54:	000c 
     b56:	217c aaaa aaaa 	move.l #-1431655766,16(a0)
     b5c:	0010 
     b5e:	217c aaaa aaaa 	move.l #-1431655766,20(a0)
     b64:	0014 
     b66:	217c aaaa aaaa 	move.l #-1431655766,24(a0)
     b6c:	0018 
     b6e:	217c aaaa aaaa 	move.l #-1431655766,28(a0)
     b74:	001c 
     b76:	217c aaaa aaaa 	move.l #-1431655766,32(a0)
     b7c:	0020 
     b7e:	217c aaaa aaaa 	move.l #-1431655766,36(a0)
     b84:	0024 
     b86:	217c aaaa aaaa 	move.l #-1431655766,40(a0)
     b8c:	0028 
     b8e:	217c aaaa aaaa 	move.l #-1431655766,44(a0)
     b94:	002c 
      *destination++ = 0x33333333;        
     b96:	217c 3333 3333 	move.l #858993459,48(a0)
     b9c:	0030 
     b9e:	217c 3333 3333 	move.l #858993459,52(a0)
     ba4:	0034 
     ba6:	217c 3333 3333 	move.l #858993459,56(a0)
     bac:	0038 
     bae:	217c 3333 3333 	move.l #858993459,60(a0)
     bb4:	003c 
     bb6:	217c 3333 3333 	move.l #858993459,64(a0)
     bbc:	0040 
     bbe:	217c 3333 3333 	move.l #858993459,68(a0)
     bc4:	0044 
     bc6:	217c 3333 3333 	move.l #858993459,72(a0)
     bcc:	0048 
     bce:	217c 3333 3333 	move.l #858993459,76(a0)
     bd4:	004c 
     bd6:	217c 3333 3333 	move.l #858993459,80(a0)
     bdc:	0050 
     bde:	217c 3333 3333 	move.l #858993459,84(a0)
     be4:	0054 
     be6:	217c 3333 3333 	move.l #858993459,88(a0)
     bec:	0058 
     bee:	217c 3333 3333 	move.l #858993459,92(a0)
     bf4:	005c 
      *destination++ = 0x00000000;
     bf6:	42a8 0060      	clr.l 96(a0)
     bfa:	42a8 0064      	clr.l 100(a0)
     bfe:	42a8 0068      	clr.l 104(a0)
     c02:	42a8 006c      	clr.l 108(a0)
     c06:	42a8 0070      	clr.l 112(a0)
     c0a:	42a8 0074      	clr.l 116(a0)
     c0e:	42a8 0078      	clr.l 120(a0)
     c12:	42a8 007c      	clr.l 124(a0)
     c16:	42a8 0080      	clr.l 128(a0)
     c1a:	42a8 0084      	clr.l 132(a0)
     c1e:	42a8 0088      	clr.l 136(a0)
     c22:	42a8 008c      	clr.l 140(a0)
      *destination++ = 0x00000000;
     c26:	42a8 0090      	clr.l 144(a0)
     c2a:	42a8 0094      	clr.l 148(a0)
     c2e:	42a8 0098      	clr.l 152(a0)
     c32:	42a8 009c      	clr.l 156(a0)
     c36:	42a8 00a0      	clr.l 160(a0)
     c3a:	42a8 00a4      	clr.l 164(a0)
     c3e:	42a8 00a8      	clr.l 168(a0)
     c42:	42a8 00ac      	clr.l 172(a0)
     c46:	42a8 00b0      	clr.l 176(a0)
     c4a:	42a8 00b4      	clr.l 180(a0)
     c4e:	42a8 00b8      	clr.l 184(a0)
     c52:	42a8 00bc      	clr.l 188(a0)
      *destination++ = 0x00000000;
     c56:	42a8 00c0      	clr.l 192(a0)
     c5a:	42a8 00c4      	clr.l 196(a0)
     c5e:	42a8 00c8      	clr.l 200(a0)
     c62:	42a8 00cc      	clr.l 204(a0)
     c66:	42a8 00d0      	clr.l 208(a0)
     c6a:	42a8 00d4      	clr.l 212(a0)
     c6e:	42a8 00d8      	clr.l 216(a0)
     c72:	42a8 00dc      	clr.l 220(a0)
     c76:	42a8 00e0      	clr.l 224(a0)
     c7a:	42a8 00e4      	clr.l 228(a0)
     c7e:	42a8 00e8      	clr.l 232(a0)
     c82:	41e8 00f0      	lea 240(a0),a0
     c86:	42a8 fffc      	clr.l -4(a0)
  for( int i=0;i<256;i++) {
     c8a:	b088           	cmp.l a0,d0
     c8c:	6600 feaa      	bne.w b38 <Zoom_LoadImage+0xc>
}
     c90:	4e75           	rts

00000c92 <Zoom_InitRun>:
void Zoom_InitRun() {
     c92:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     c96:	2c79 0001 3270 	movea.l 13270 <SysBase>,a6
     c9c:	7004           	moveq #4,d0
     c9e:	7202           	moveq #2,d1
     ca0:	4eae ff3a      	jsr -198(a6)
  Zoom_LevelOf102Zoom = 0;
     ca4:	4279 0001 326a 	clr.w 1326a <Zoom_LevelOf102Zoom>
  Copperlist1 = ClbuildZoom( );
     caa:	45fa fb10      	lea 7bc <ClbuildZoom>(pc),a2
     cae:	4e92           	jsr (a2)
     cb0:	23c0 0001 325e 	move.l d0,1325e <Copperlist1>
  Copperlist2 = ClbuildZoom( );
     cb6:	4e92           	jsr (a2)
     cb8:	23c0 0001 325a 	move.l d0,1325a <Copperlist2>
  Bitplane1 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
     cbe:	2c79 0001 3270 	movea.l 13270 <SysBase>,a6
     cc4:	203c 0000 ff00 	move.l #65280,d0
     cca:	7202           	moveq #2,d1
     ccc:	4eae ff3a      	jsr -198(a6)
     cd0:	23c0 0001 3266 	move.l d0,13266 <Bitplane1>
  if(Bitplane1 == 0) {
     cd6:	6700 00ae      	beq.w d86 <Zoom_InitRun+0xf4>
  DrawBuffer = Bitplane1;
     cda:	23c0 0001 3256 	move.l d0,13256 <DrawBuffer>
  DrawCopper = Copperlist1;
     ce0:	23f9 0001 325e 	move.l 1325e <Copperlist1>,13252 <DrawCopper>
     ce6:	0001 3252 
  Bitplane2 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
     cea:	2c79 0001 3270 	movea.l 13270 <SysBase>,a6
     cf0:	203c 0000 ff00 	move.l #65280,d0
     cf6:	7202           	moveq #2,d1
     cf8:	4eae ff3a      	jsr -198(a6)
     cfc:	2400           	move.l d0,d2
     cfe:	23c0 0001 3262 	move.l d0,13262 <Bitplane2>
  if(Bitplane2 == 0) {
     d04:	6728           	beq.s d2e <Zoom_InitRun+0x9c>
  ViewBuffer = Bitplane2;
     d06:	23c2 0001 324e 	move.l d2,1324e <ViewBuffer>
  ViewCopper = Copperlist2;
     d0c:	23f9 0001 325a 	move.l 1325a <Copperlist2>,1324a <ViewCopper>
     d12:	0001 324a 
  Zoom_LoadImage( Bitplane1);
     d16:	2f39 0001 3266 	move.l 13266 <Bitplane1>,-(sp)
     d1c:	45fa fe0e      	lea b2c <Zoom_LoadImage>(pc),a2
     d20:	4e92           	jsr (a2)
  Zoom_LoadImage( Bitplane2);
     d22:	2f02           	move.l d2,-(sp)
     d24:	4e92           	jsr (a2)
     d26:	508f           	addq.l #8,sp
}
     d28:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     d2c:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     d2e:	2c79 0001 326c 	movea.l 1326c <DOSBase>,a6
     d34:	4eae ffc4      	jsr -60(a6)
     d38:	2c79 0001 326c 	movea.l 1326c <DOSBase>,a6
     d3e:	2200           	move.l d0,d1
     d40:	243c 0001 17ee 	move.l #71662,d2
     d46:	7626           	moveq #38,d3
     d48:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     d4c:	2c79 0001 326c 	movea.l 1326c <DOSBase>,a6
     d52:	7201           	moveq #1,d1
     d54:	4eae ff70      	jsr -144(a6)
     d58:	2439 0001 3262 	move.l 13262 <Bitplane2>,d2
  ViewBuffer = Bitplane2;
     d5e:	23c2 0001 324e 	move.l d2,1324e <ViewBuffer>
  ViewCopper = Copperlist2;
     d64:	23f9 0001 325a 	move.l 1325a <Copperlist2>,1324a <ViewCopper>
     d6a:	0001 324a 
  Zoom_LoadImage( Bitplane1);
     d6e:	2f39 0001 3266 	move.l 13266 <Bitplane1>,-(sp)
     d74:	45fa fdb6      	lea b2c <Zoom_LoadImage>(pc),a2
     d78:	4e92           	jsr (a2)
  Zoom_LoadImage( Bitplane2);
     d7a:	2f02           	move.l d2,-(sp)
     d7c:	4e92           	jsr (a2)
     d7e:	508f           	addq.l #8,sp
}
     d80:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     d84:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     d86:	2c79 0001 326c 	movea.l 1326c <DOSBase>,a6
     d8c:	4eae ffc4      	jsr -60(a6)
     d90:	2c79 0001 326c 	movea.l 1326c <DOSBase>,a6
     d96:	2200           	move.l d0,d1
     d98:	243c 0001 17c7 	move.l #71623,d2
     d9e:	7626           	moveq #38,d3
     da0:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     da4:	2c79 0001 326c 	movea.l 1326c <DOSBase>,a6
     daa:	7201           	moveq #1,d1
     dac:	4eae ff70      	jsr -144(a6)
     db0:	2039 0001 3266 	move.l 13266 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
     db6:	23c0 0001 3256 	move.l d0,13256 <DrawBuffer>
  DrawCopper = Copperlist1;
     dbc:	23f9 0001 325e 	move.l 1325e <Copperlist1>,13252 <DrawCopper>
     dc2:	0001 3252 
  Bitplane2 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
     dc6:	2c79 0001 3270 	movea.l 13270 <SysBase>,a6
     dcc:	203c 0000 ff00 	move.l #65280,d0
     dd2:	7202           	moveq #2,d1
     dd4:	4eae ff3a      	jsr -198(a6)
     dd8:	2400           	move.l d0,d2
     dda:	23c0 0001 3262 	move.l d0,13262 <Bitplane2>
  if(Bitplane2 == 0) {
     de0:	6600 ff24      	bne.w d06 <Zoom_InitRun+0x74>
     de4:	6000 ff48      	bra.w d2e <Zoom_InitRun+0x9c>

00000de8 <interruptHandler>:
static __attribute__((interrupt)) void interruptHandler() {
     de8:	2f08           	move.l a0,-(sp)
     dea:	2f00           	move.l d0,-(sp)
	hw->intreq=(1<<INTB_VERTB); hw->intreq=(1<<INTB_VERTB); //reset vbl req. twice for a4000 bug.
     dec:	2079 0001 3246 	movea.l 13246 <hw>,a0
     df2:	317c 0020 009c 	move.w #32,156(a0)
     df8:	317c 0020 009c 	move.w #32,156(a0)
	frameCounter++;
     dfe:	2039 0001 322c 	move.l 1322c <frameCounter>,d0
     e04:	5280           	addq.l #1,d0
     e06:	23c0 0001 322c 	move.l d0,1322c <frameCounter>
}
     e0c:	201f           	move.l (sp)+,d0
     e0e:	205f           	movea.l (sp)+,a0
     e10:	4e73           	rte

00000e12 <WaitVbl>:
void WaitVbl() {
     e12:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     e14:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd7153>,d0
     e1a:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
     e1c:	2017           	move.l (sp),d0
     e1e:	0280 0001 ff00 	andi.l #130816,d0
     e24:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
     e26:	2017           	move.l (sp),d0
     e28:	0c80 0001 3700 	cmpi.l #79616,d0
     e2e:	67e4           	beq.s e14 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     e30:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd7153>,d0
     e36:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
     e3a:	202f 0004      	move.l 4(sp),d0
     e3e:	0280 0001 ff00 	andi.l #130816,d0
     e44:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
     e48:	202f 0004      	move.l 4(sp),d0
     e4c:	0c80 0001 3700 	cmpi.l #79616,d0
     e52:	66dc           	bne.s e30 <WaitVbl+0x1e>
}
     e54:	508f           	addq.l #8,sp
     e56:	4e75           	rts

00000e58 <memcpy>:
{
     e58:	48e7 3820      	movem.l d2-d4/a2,-(sp)
     e5c:	202f 0014      	move.l 20(sp),d0
     e60:	226f 0018      	movea.l 24(sp),a1
     e64:	222f 001c      	move.l 28(sp),d1
	while(len--)
     e68:	2601           	move.l d1,d3
     e6a:	5383           	subq.l #1,d3
     e6c:	4a81           	tst.l d1
     e6e:	6762           	beq.s ed2 <memcpy+0x7a>
     e70:	2040           	movea.l d0,a0
     e72:	5888           	addq.l #4,a0
     e74:	b1c9           	cmpa.l a1,a0
     e76:	53c2           	sl.s d2
     e78:	4402           	neg.b d2
     e7a:	41e9 0004      	lea 4(a1),a0
     e7e:	b1c0           	cmpa.l d0,a0
     e80:	53c4           	sl.s d4
     e82:	4404           	neg.b d4
     e84:	8404           	or.b d4,d2
     e86:	7808           	moveq #8,d4
     e88:	b883           	cmp.l d3,d4
     e8a:	55c4           	sc.s d4
     e8c:	4404           	neg.b d4
     e8e:	c404           	and.b d4,d2
     e90:	6746           	beq.s ed8 <memcpy+0x80>
     e92:	2409           	move.l a1,d2
     e94:	8480           	or.l d0,d2
     e96:	7803           	moveq #3,d4
     e98:	c484           	and.l d4,d2
     e9a:	663c           	bne.s ed8 <memcpy+0x80>
     e9c:	2049           	movea.l a1,a0
     e9e:	2440           	movea.l d0,a2
     ea0:	74fc           	moveq #-4,d2
     ea2:	c481           	and.l d1,d2
     ea4:	d489           	add.l a1,d2
		*d++ = *s++;
     ea6:	24d8           	move.l (a0)+,(a2)+
     ea8:	b488           	cmp.l a0,d2
     eaa:	66fa           	bne.s ea6 <memcpy+0x4e>
     eac:	74fc           	moveq #-4,d2
     eae:	c481           	and.l d1,d2
     eb0:	2040           	movea.l d0,a0
     eb2:	d1c2           	adda.l d2,a0
     eb4:	d3c2           	adda.l d2,a1
     eb6:	9682           	sub.l d2,d3
     eb8:	b481           	cmp.l d1,d2
     eba:	6716           	beq.s ed2 <memcpy+0x7a>
     ebc:	1091           	move.b (a1),(a0)
	while(len--)
     ebe:	4a83           	tst.l d3
     ec0:	6710           	beq.s ed2 <memcpy+0x7a>
		*d++ = *s++;
     ec2:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
     ec8:	5383           	subq.l #1,d3
     eca:	6706           	beq.s ed2 <memcpy+0x7a>
		*d++ = *s++;
     ecc:	1169 0002 0002 	move.b 2(a1),2(a0)
}
     ed2:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
     ed6:	4e75           	rts
     ed8:	2040           	movea.l d0,a0
     eda:	d289           	add.l a1,d1
		*d++ = *s++;
     edc:	10d9           	move.b (a1)+,(a0)+
	while(len--)
     ede:	b289           	cmp.l a1,d1
     ee0:	67f0           	beq.s ed2 <memcpy+0x7a>
		*d++ = *s++;
     ee2:	10d9           	move.b (a1)+,(a0)+
	while(len--)
     ee4:	b289           	cmp.l a1,d1
     ee6:	66f4           	bne.s edc <memcpy+0x84>
     ee8:	60e8           	bra.s ed2 <memcpy+0x7a>

00000eea <memset>:
{
     eea:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
     eee:	202f 0024      	move.l 36(sp),d0
     ef2:	2a2f 0028      	move.l 40(sp),d5
     ef6:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
     efa:	2809           	move.l a1,d4
     efc:	5384           	subq.l #1,d4
     efe:	b2fc 0000      	cmpa.w #0,a1
     f02:	6f00 00b0      	ble.w fb4 <memset+0xca>
     f06:	1e05           	move.b d5,d7
     f08:	2200           	move.l d0,d1
     f0a:	4481           	neg.l d1
     f0c:	7403           	moveq #3,d2
     f0e:	c282           	and.l d2,d1
     f10:	7c05           	moveq #5,d6
		*ptr++ = val;
     f12:	2440           	movea.l d0,a2
     f14:	bc84           	cmp.l d4,d6
     f16:	646a           	bcc.s f82 <memset+0x98>
     f18:	4a81           	tst.l d1
     f1a:	6724           	beq.s f40 <memset+0x56>
     f1c:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
     f1e:	5384           	subq.l #1,d4
     f20:	7401           	moveq #1,d2
     f22:	b481           	cmp.l d1,d2
     f24:	671a           	beq.s f40 <memset+0x56>
		*ptr++ = val;
     f26:	2440           	movea.l d0,a2
     f28:	548a           	addq.l #2,a2
     f2a:	2040           	movea.l d0,a0
     f2c:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
     f30:	5384           	subq.l #1,d4
     f32:	7403           	moveq #3,d2
     f34:	b481           	cmp.l d1,d2
     f36:	6608           	bne.s f40 <memset+0x56>
		*ptr++ = val;
     f38:	528a           	addq.l #1,a2
     f3a:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
     f3e:	5384           	subq.l #1,d4
     f40:	2609           	move.l a1,d3
     f42:	9681           	sub.l d1,d3
     f44:	7c00           	moveq #0,d6
     f46:	1c05           	move.b d5,d6
     f48:	2406           	move.l d6,d2
     f4a:	4842           	swap d2
     f4c:	4242           	clr.w d2
     f4e:	2042           	movea.l d2,a0
     f50:	2406           	move.l d6,d2
     f52:	e14a           	lsl.w #8,d2
     f54:	4842           	swap d2
     f56:	4242           	clr.w d2
     f58:	e18e           	lsl.l #8,d6
     f5a:	2646           	movea.l d6,a3
     f5c:	2c08           	move.l a0,d6
     f5e:	8486           	or.l d6,d2
     f60:	2c0b           	move.l a3,d6
     f62:	8486           	or.l d6,d2
     f64:	1407           	move.b d7,d2
     f66:	2040           	movea.l d0,a0
     f68:	d1c1           	adda.l d1,a0
     f6a:	72fc           	moveq #-4,d1
     f6c:	c283           	and.l d3,d1
     f6e:	d288           	add.l a0,d1
		*ptr++ = val;
     f70:	20c2           	move.l d2,(a0)+
     f72:	b1c1           	cmpa.l d1,a0
     f74:	66fa           	bne.s f70 <memset+0x86>
     f76:	72fc           	moveq #-4,d1
     f78:	c283           	and.l d3,d1
     f7a:	d5c1           	adda.l d1,a2
     f7c:	9881           	sub.l d1,d4
     f7e:	b283           	cmp.l d3,d1
     f80:	6732           	beq.s fb4 <memset+0xca>
     f82:	1485           	move.b d5,(a2)
	while(len-- > 0)
     f84:	4a84           	tst.l d4
     f86:	6f2c           	ble.s fb4 <memset+0xca>
		*ptr++ = val;
     f88:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
     f8c:	7201           	moveq #1,d1
     f8e:	b284           	cmp.l d4,d1
     f90:	6c22           	bge.s fb4 <memset+0xca>
		*ptr++ = val;
     f92:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
     f96:	7402           	moveq #2,d2
     f98:	b484           	cmp.l d4,d2
     f9a:	6c18           	bge.s fb4 <memset+0xca>
		*ptr++ = val;
     f9c:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
     fa0:	7c03           	moveq #3,d6
     fa2:	bc84           	cmp.l d4,d6
     fa4:	6c0e           	bge.s fb4 <memset+0xca>
		*ptr++ = val;
     fa6:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
     faa:	7204           	moveq #4,d1
     fac:	b284           	cmp.l d4,d1
     fae:	6c04           	bge.s fb4 <memset+0xca>
		*ptr++ = val;
     fb0:	1545 0005      	move.b d5,5(a2)
}
     fb4:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
     fb8:	4e75           	rts

00000fba <strlen>:
{
     fba:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
     fbe:	7000           	moveq #0,d0
	while(*s++)
     fc0:	4a10           	tst.b (a0)
     fc2:	6708           	beq.s fcc <strlen+0x12>
		t++;
     fc4:	5280           	addq.l #1,d0
	while(*s++)
     fc6:	4a30 0800      	tst.b (0,a0,d0.l)
     fca:	66f8           	bne.s fc4 <strlen+0xa>
}
     fcc:	4e75           	rts
     fce:	4e71           	nop

00000fd0 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
     fd0:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
     fd4:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
     fd8:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
     fdc:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
     fe0:	d041           	add.w d1,d0
	swap	d0
     fe2:	4840           	swap d0
	clrw	d0
     fe4:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
     fe6:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
     fea:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
     fee:	d081           	add.l d1,d0

	rts
     ff0:	4e75           	rts

00000ff2 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
     ff2:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
     ff4:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
     ff8:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
     ffc:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    1002:	6416           	bcc.s 101a <__udivsi3+0x28>
	movel	d0, d2
    1004:	2400           	move.l d0,d2
	clrw	d2
    1006:	4242           	clr.w d2
	swap	d2
    1008:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    100a:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    100c:	3002           	move.w d2,d0
	swap	d0
    100e:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    1010:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    1014:	84c1           	divu.w d1,d2
	movew	d2, d0
    1016:	3002           	move.w d2,d0
	jra	6f
    1018:	6030           	bra.s 104a <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    101a:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    101c:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    101e:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    1020:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    1026:	64f4           	bcc.s 101c <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    1028:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    102a:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    1030:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    1032:	c2c0           	mulu.w d0,d1
	swap	d2
    1034:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    1036:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    1038:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    103a:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    103c:	660a           	bne.s 1048 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    103e:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    1040:	6506           	bcs.s 1048 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    1042:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    1046:	6302           	bls.s 104a <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    1048:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    104a:	241f           	move.l (sp)+,d2
	rts
    104c:	4e75           	rts

0000104e <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    104e:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    1050:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    1052:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    1056:	6a04           	bpl.s 105c <__divsi3+0xe>
	negl	d1
    1058:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    105a:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    105c:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    1060:	6a04           	bpl.s 1066 <__divsi3+0x18>
	negl	d0
    1062:	4480           	neg.l d0
	negb	d2
    1064:	4402           	neg.b d2

2:	movel	d1, sp@-
    1066:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1068:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    106a:	6186           	bsr.s ff2 <__udivsi3>
	addql	IMM (8), sp
    106c:	508f           	addq.l #8,sp

	tstb	d2
    106e:	4a02           	tst.b d2
	jpl	3f
    1070:	6a02           	bpl.s 1074 <__divsi3+0x26>
	negl	d0
    1072:	4480           	neg.l d0

3:	movel	sp@+, d2
    1074:	241f           	move.l (sp)+,d2
	rts
    1076:	4e75           	rts

00001078 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    1078:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    107c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    1080:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1082:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    1084:	61c8           	bsr.s 104e <__divsi3>
	addql	IMM (8), sp
    1086:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    1088:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    108c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    108e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    1090:	6100 ff3e      	bsr.w fd0 <__mulsi3>
	addql	IMM (8), sp
    1094:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    1096:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    109a:	9280           	sub.l d0,d1
	movel	d1, d0
    109c:	2001           	move.l d1,d0
	rts
    109e:	4e75           	rts

000010a0 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    10a0:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    10a4:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    10a8:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    10aa:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    10ac:	6100 ff44      	bsr.w ff2 <__udivsi3>
	addql	IMM (8), sp
    10b0:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    10b2:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    10b6:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    10b8:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    10ba:	6100 ff14      	bsr.w fd0 <__mulsi3>
	addql	IMM (8), sp
    10be:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    10c0:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    10c4:	9280           	sub.l d0,d1
	movel	d1, d0
    10c6:	2001           	move.l d1,d0
	rts
    10c8:	4e75           	rts

000010ca <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    10ca:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    10cc:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    10d0:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    10d4:	2c5f           	movea.l (sp)+,a6
    rts
    10d6:	4e75           	rts

000010d8 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    10d8:	16c0           	move.b d0,(a3)+
	rts
    10da:	4e75           	rts

000010dc <saveregs>:
	...

00001118 <font2distance>:
    1118:	0505           	btst d2,d5
    111a:	0505           	btst d2,d5
    111c:	0505           	btst d2,d5
    111e:	0505           	btst d2,d5
    1120:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    1122:	0505           	btst d2,d5
    1124:	0505           	btst d2,d5
    1126:	0005 0505      	ori.b #5,d5
    112a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    112c:	0505           	btst d2,d5
    112e:	0505           	btst d2,d5
    1130:	0505           	btst d2,d5
    1132:	0505           	btst d2,d5
    1134:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    1136:	0505           	btst d2,d5
    1138:	0505           	btst d2,d5
    113a:	0505           	btst d2,d5
    113c:	0505           	btst d2,d5
    113e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    1140:	0500           	btst d2,d0
    1142:	0505           	btst d2,d5
    1144:	0505           	btst d2,d5
    1146:	0505           	btst d2,d5
    1148:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    114a:	0505           	btst d2,d5
    114c:	0505           	btst d2,d5
    114e:	0505           	btst d2,d5
    1150:	0505           	btst d2,d5
    1152:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    1154:	0505           	btst d2,d5
    1156:	0505           	btst d2,d5
    1158:	0503           	btst d2,d3
    115a:	0505           	btst d2,d5
    115c:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    115e:	0505           	btst d2,d5
    1160:	0500           	btst d2,d0
    1162:	0505           	btst d2,d5
    1164:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    1168:	0505           	btst d2,d5
    116a:	0503           	btst d2,d3
    116c:	0205 0507      	andi.b #7,d5
    1170:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    1172:	0505           	btst d2,d5
    1174:	0505           	btst d2,d5
    1176:	0505           	btst d2,d5
    1178:	0505           	btst d2,d5
    117a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    117c:	0505           	btst d2,d5
    117e:	0505           	btst d2,d5
    1180:	0505           	btst d2,d5
    1182:	0505           	btst d2,d5
    1184:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1186:	0505           	btst d2,d5
    1188:	0505           	btst d2,d5
    118a:	0505           	btst d2,d5
    118c:	0505           	btst d2,d5
    118e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1190:	0505           	btst d2,d5
    1192:	0505           	btst d2,d5
    1194:	0505           	btst d2,d5
    1196:	0505           	btst d2,d5
    1198:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    119a:	0505           	btst d2,d5
    119c:	0505           	btst d2,d5
    119e:	0505           	btst d2,d5
    11a0:	0505           	btst d2,d5
    11a2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    11a4:	0505           	btst d2,d5
    11a6:	0505           	btst d2,d5
    11a8:	0505           	btst d2,d5
    11aa:	0505           	btst d2,d5
    11ac:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    11ae:	0505           	btst d2,d5
    11b0:	0505           	btst d2,d5
    11b2:	0505           	btst d2,d5
    11b4:	0505           	btst d2,d5
    11b6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    11b8:	0505           	btst d2,d5
    11ba:	0505           	btst d2,d5
    11bc:	0505           	btst d2,d5
    11be:	0505           	btst d2,d5
    11c0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    11c2:	0505           	btst d2,d5
    11c4:	0505           	btst d2,d5
    11c6:	0505           	btst d2,d5
    11c8:	0505           	btst d2,d5
    11ca:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    11cc:	0505           	btst d2,d5
    11ce:	0505           	btst d2,d5
    11d0:	0505           	btst d2,d5
    11d2:	0505           	btst d2,d5
    11d4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    11d6:	0505           	btst d2,d5
    11d8:	0505           	btst d2,d5
    11da:	0505           	btst d2,d5
    11dc:	0505           	btst d2,d5
    11de:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    11e0:	0505           	btst d2,d5
    11e2:	0505           	btst d2,d5
    11e4:	0505           	btst d2,d5
    11e6:	0505           	btst d2,d5
    11e8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    11ea:	0505           	btst d2,d5
    11ec:	0505           	btst d2,d5
    11ee:	0505           	btst d2,d5
    11f0:	0505           	btst d2,d5
    11f2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    11f4:	0505           	btst d2,d5
    11f6:	0505           	btst d2,d5
    11f8:	0505           	btst d2,d5
    11fa:	0505           	btst d2,d5
    11fc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    11fe:	0505           	btst d2,d5
    1200:	0505           	btst d2,d5
    1202:	0505           	btst d2,d5
    1204:	0505           	btst d2,d5
    1206:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1208:	0505           	btst d2,d5
    120a:	0505           	btst d2,d5
    120c:	0505           	btst d2,d5
    120e:	0505           	btst d2,d5
    1210:	0505           	btst d2,d5

00001212 <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    1212:	16c0           	move.b d0,(a3)+
  RTS
    1214:	4e75           	rts

00001216 <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    1216:	48f9 7fff 0000 	movem.l d0-a6,10dc <saveregs>
    121c:	10dc 
  lea 0xdff000,a5
    121e:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xdd714f>,a5
  move.l sp@(4),a0  //Fontlocation
    1224:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    1228:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    122c:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    1230:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    1232:	082d 0006 0002 	btst #6,2(a5)

00001238 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    1238:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    123e:	66f8           	bne.s 1238 <st2wblit>

00001240 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    1240:	7019           	moveq #25,d0
	sub.l d5,d5      
    1242:	9a85           	sub.l d5,d5

00001244 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    1244:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    1246:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    1248:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    124c:	9dce           	suba.l a6,a6
	move.l d2, a6
    124e:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    1250:	ddfc 0000 1118 	adda.l #4376,a6

	LSL  	#4,d2 	    //Fetch next char
    1256:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    1258:	2842           	movea.l d2,a4


	move.l  #0,d4
    125a:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    125c:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    125e:	3814           	move.w (a4),d4
	swap	d4
    1260:	4844           	swap d4
	lsr.l	d5, d4
    1262:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    1264:	8993           	or.l d4,(a3)
	clr.l	d4
    1266:	4284           	clr.l d4
	move.w  2(a4), d4
    1268:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    126c:	4844           	swap d4
	lsr.l	d5, d4
    126e:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    1270:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    1274:	4284           	clr.l d4
	move.w  4(a4), d4
    1276:	382c 0004      	move.w 4(a4),d4
	swap	d4
    127a:	4844           	swap d4
	lsr.l	d5, d4
    127c:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    127e:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    1282:	4284           	clr.l d4
	move.w  6(a4), d4
    1284:	382c 0006      	move.w 6(a4),d4
	swap	d4
    1288:	4844           	swap d4
	lsr.l	d5, d4
    128a:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    128c:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    1290:	4284           	clr.l d4
	move.w  8(a4), d4
    1292:	382c 0008      	move.w 8(a4),d4
	swap	d4
    1296:	4844           	swap d4
	lsr.l	d5, d4
    1298:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    129a:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    129e:	4284           	clr.l d4
	move.w  10(a4), d4
    12a0:	382c 000a      	move.w 10(a4),d4
	swap	d4
    12a4:	4844           	swap d4
	lsr.l	d5, d4
    12a6:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    12a8:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    12ac:	4284           	clr.l d4
	move.w  12(a4), d4
    12ae:	382c 000c      	move.w 12(a4),d4
	swap	d4
    12b2:	4844           	swap d4
	lsr.l	d5, d4
    12b4:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    12b6:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    12ba:	4284           	clr.l d4
	move.w  14(a4), d4
    12bc:	382c 000e      	move.w 14(a4),d4
	swap	d4
    12c0:	4844           	swap d4
	lsr.l	d5, d4
    12c2:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    12c4:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    12c8:	4284           	clr.l d4

	add.b   (a6), d5
    12ca:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    12cc:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    12d0:	6500 0006      	bcs.w 12d8 <noadditionalchar>
	addq.w  #1, a3
    12d4:	524b           	addq.w #1,a3
	sub.w   #8,d5
    12d6:	5145           	subq.w #8,d5

000012d8 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    12d8:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    12da:	51c8 ff68      	dbf d0,1244 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    12de:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    12e2:	51cb ff5c      	dbf d3,1240 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    12e6:	4cfa 7fff fdf2 	movem.l 10dc <saveregs>(pc),d0-a6

	RTS
    12ec:	4e75           	rts
