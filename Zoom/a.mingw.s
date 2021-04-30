
a.mingw.elf:     file format elf32-m68k


Disassembly of section .text:

00000000 <_start>:
extern void (*__init_array_start[])() __attribute__((weak));
extern void (*__init_array_end[])() __attribute__((weak));
extern void (*__fini_array_start[])() __attribute__((weak));
extern void (*__fini_array_end[])() __attribute__((weak));

__attribute__((used)) __attribute__((section(".text.unlikely"))) void _start() {
       0:	48e7 3020      	movem.l d2-d3/a2,-(sp)
	// initialize globals, ctors etc.
	unsigned long count;
	unsigned long i;

	count = __preinit_array_end - __preinit_array_start;
       4:	263c 0000 2000 	move.l #8192,d3
       a:	0483 0000 2000 	subi.l #8192,d3
      10:	e483           	asr.l #2,d3
	for (i = 0; i < count; i++)
      12:	6712           	beq.s 26 <_start+0x26>
      14:	45f9 0000 2000 	lea 2000 <Cl102ZoomRepeat>,a2
      1a:	7400           	moveq #0,d2
		__preinit_array_start[i]();
      1c:	205a           	movea.l (a2)+,a0
      1e:	4e90           	jsr (a0)
	for (i = 0; i < count; i++)
      20:	5282           	addq.l #1,d2
      22:	b483           	cmp.l d3,d2
      24:	66f6           	bne.s 1c <_start+0x1c>

	count = __init_array_end - __init_array_start;
      26:	263c 0000 2000 	move.l #8192,d3
      2c:	0483 0000 2000 	subi.l #8192,d3
      32:	e483           	asr.l #2,d3
	for (i = 0; i < count; i++)
      34:	6712           	beq.s 48 <_start+0x48>
      36:	45f9 0000 2000 	lea 2000 <Cl102ZoomRepeat>,a2
      3c:	7400           	moveq #0,d2
		__init_array_start[i]();
      3e:	205a           	movea.l (a2)+,a0
      40:	4e90           	jsr (a0)
	for (i = 0; i < count; i++)
      42:	5282           	addq.l #1,d2
      44:	b483           	cmp.l d3,d2
      46:	66f6           	bne.s 3e <_start+0x3e>

	main();
      48:	4eb9 0000 0074 	jsr 74 <main>

	// call dtors
	count = __fini_array_end - __fini_array_start;
      4e:	243c 0000 2000 	move.l #8192,d2
      54:	0482 0000 2000 	subi.l #8192,d2
      5a:	e482           	asr.l #2,d2
	for (i = count; i > 0; i--)
      5c:	6710           	beq.s 6e <_start+0x6e>
      5e:	45f9 0000 2000 	lea 2000 <Cl102ZoomRepeat>,a2
		__fini_array_start[i - 1]();
      64:	5382           	subq.l #1,d2
      66:	2062           	movea.l -(a2),a0
      68:	4e90           	jsr (a0)
	for (i = count; i > 0; i--)
      6a:	4a82           	tst.l d2
      6c:	66f6           	bne.s 64 <_start+0x64>
}
      6e:	4cdf 040c      	movem.l (sp)+,d2-d3/a2
      72:	4e75           	rts

00000074 <main>:
	return copListEnd;
}

//#define a3 REG (a3)

int main() {
      74:	518f           	subq.l #8,sp
      76:	48e7 313e      	movem.l d2-d3/d7/a2-a6,-(sp)

	UWORD *bp = 0x100;
	*bp = 0;
      7a:	4278 0100      	clr.w 100 <main+0x8c>

	//Get AMOS Params
	register ULONG *asmparams;
	asm("\t move.l %%a3,%0" : "=r"(asmparams));
      7e:	204b           	movea.l a3,a0
	Zoom_Rawany = *asmparams++;
      80:	23d0 0000 33ae 	move.l (a0),33ae <Zoom_Rawany>
	Zoom_Rawfast = *asmparams++;
      86:	23e8 0004 0000 	move.l 4(a0),33aa <Zoom_Rawfast>
      8c:	33aa 
	Zoom_Rawchip = *asmparams;
      8e:	23e8 0008 0000 	move.l 8(a0),33a6 <Zoom_Rawchip>
      94:	33a6 

	ULONG tmp = 4;
    SysBase = *((struct ExecBase**)tmp);
	hw = (struct Custom*)0xdff000;
      96:	23fc 00df f000 	move.l #14675968,339e <hw>
      9c:	0000 339e 

	SysBase = *((struct ExecBase**)4UL);
      a0:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      a4:	23ce 0000 33a2 	move.l a6,33a2 <SysBase>
	custom = (struct Custom*)0xdff000;

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
      aa:	43f9 0000 1a0a 	lea 1a0a <noadditionalchar+0x7c>,a1
      b0:	7000           	moveq #0,d0
      b2:	4eae fdd8      	jsr -552(a6)
	if (!GfxBase)
      b6:	4a80           	tst.l d0
      b8:	6700 03aa      	beq.w 464 <main+0x3f0>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
      bc:	2c79 0000 33a2 	movea.l 33a2 <SysBase>,a6
      c2:	43f9 0000 1a1b 	lea 1a1b <noadditionalchar+0x8d>,a1
      c8:	7000           	moveq #0,d0
      ca:	4eae fdd8      	jsr -552(a6)
      ce:	23c0 0000 339a 	move.l d0,339a <DOSBase>
	if (!DOSBase)
      d4:	6700 02d4      	beq.w 3aa <main+0x336>
		Exit(0);

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
      d8:	4879 0000 1a27 	pea 1a27 <noadditionalchar+0x99>
      de:	4eb9 0000 130e 	jsr 130e <KPrintF>
#endif
	Write(Output(), (APTR)"Hello console!\n", 15);
      e4:	2c79 0000 339a 	movea.l 339a <DOSBase>,a6
      ea:	4eae ffc4      	jsr -60(a6)
      ee:	2c79 0000 339a 	movea.l 339a <DOSBase>,a6
      f4:	2200           	move.l d0,d1
      f6:	243c 0000 1a43 	move.l #6723,d2
      fc:	760f           	moveq #15,d3
      fe:	4eae ffd0      	jsr -48(a6)
	Delay(50);
     102:	2c79 0000 339a 	movea.l 339a <DOSBase>,a6
     108:	7232           	moveq #50,d1
     10a:	4eae ff3a      	jsr -198(a6)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     10e:	3f7c 4e7a 0026 	move.w #20090,38(sp)
     114:	3f7c 0801 0028 	move.w #2049,40(sp)
     11a:	3f7c 4e73 002a 	move.w #20083,42(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     120:	2c79 0000 33a2 	movea.l 33a2 <SysBase>,a6
     126:	588f           	addq.l #4,sp
     128:	082e 0000 0129 	btst #0,297(a6)
     12e:	6700 02dc      	beq.w 40c <main+0x398>
		vbr = (APTR)Supervisor((ULONG (*)())getvbr);
     132:	7e22           	moveq #34,d7
     134:	de8f           	add.l sp,d7
     136:	cf8d           	exg d7,a5
     138:	4eae ffe2      	jsr -30(a6)
     13c:	cf8d           	exg d7,a5
	VBR=GetVBR();
     13e:	23c0 0000 3218 	move.l d0,3218 <VBR>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     144:	2079 0000 3218 	movea.l 3218 <VBR>,a0
     14a:	2028 006c      	move.l 108(a0),d0
	//warpmode(0);

	TakeSystem();


	WaitVbl();
     14e:	45f9 0000 072c 	lea 72c <WaitVbl>,a2
     154:	4e92           	jsr (a2)
	
    hw->dmacon = 0b1000011111111111;
     156:	2079 0000 339e 	movea.l 339e <hw>,a0
     15c:	317c 87ff 0096 	move.w #-30721,150(a0)
  Zoom_Rawfast = rawzoom_fast;*/

  int i = 0;

  for(;i<2;i++) {
    imgptrs[i] = Zoom_Rawchip + 56280*i;
     162:	2039 0000 33a6 	move.l 33a6 <Zoom_Rawchip>,d0
     168:	47f9 0000 322e 	lea 322e <imgptrs>,a3
     16e:	2680           	move.l d0,(a3)
     170:	0680 0000 dbd8 	addi.l #56280,d0
     176:	23c0 0000 3232 	move.l d0,3232 <imgptrs+0x4>
  }

  ULONG tmp = 11;
  for(;i<27;i++) {
    imgptrs[i] = Zoom_Rawany + tmp;
     17c:	2239 0000 33ae 	move.l 33ae <Zoom_Rawany>,d1
     182:	41f9 0000 3236 	lea 3236 <imgptrs+0x8>,a0
     188:	43f9 0000 1a6a 	lea 1a6a <Zoom_Lz4size+0x8>,a1
  ULONG tmp = 11;
     18e:	700b           	moveq #11,d0
    imgptrs[i] = Zoom_Rawany + tmp;
     190:	2400           	move.l d0,d2
     192:	d481           	add.l d1,d2
     194:	20c2           	move.l d2,(a0)+
    tmp += Zoom_Lz4size[i];
     196:	d099           	add.l (a1)+,d0
  for(;i<27;i++) {
     198:	b1fc 0000 329a 	cmpa.l #12954,a0
     19e:	66f0           	bne.s 190 <main+0x11c>
  }

  tmp = 11;
  for(;i<88;i++) {
    imgptrs[i] = Zoom_Rawfast + tmp;
     1a0:	2239 0000 33aa 	move.l 33aa <Zoom_Rawfast>,d1
     1a6:	43f9 0000 1ace 	lea 1ace <Zoom_Lz4size+0x6c>,a1
  tmp = 11;
     1ac:	700b           	moveq #11,d0
    imgptrs[i] = Zoom_Rawfast + tmp;
     1ae:	2400           	move.l d0,d2
     1b0:	d481           	add.l d1,d2
     1b2:	20c2           	move.l d2,(a0)+
    tmp += Zoom_Lz4size[i];
     1b4:	d099           	add.l (a1)+,d0
  for(;i<88;i++) {
     1b6:	b1fc 0000 338e 	cmpa.l #13198,a0
     1bc:	66f0           	bne.s 1ae <main+0x13a>
  }

  Zoom_Counter = 0;
     1be:	4279 0000 322c 	clr.w 322c <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     1c4:	2c79 0000 33a2 	movea.l 33a2 <SysBase>,a6
     1ca:	7004           	moveq #4,d0
     1cc:	7202           	moveq #2,d1
     1ce:	4eae ff3a      	jsr -198(a6)
  Zoom_LevelOf102Zoom = 15;
     1d2:	33fc 000f 0000 	move.w #15,322a <Zoom_LevelOf102Zoom>
     1d8:	322a 
  RemIntServer(INTB_VERTB, Zoom_vbint);
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
}
  
int Zoom_PrepareDisplay() {
  ViewBuffer = imgptrs[0];
     1da:	23d3 0000 3220 	move.l (a3),3220 <ViewBuffer>
  DrawBuffer = imgptrs[1];
     1e0:	23f9 0000 3232 	move.l 3232 <imgptrs+0x4>,338a <DrawBuffer>
     1e6:	0000 338a 
  /*ViewBuffer = AllocVec(268*42*5, MEMF_CHIP);  
  DrawBuffer = AllocVec(268*42*5, MEMF_CHIP);*/
  /*Utils_CopyMem( imgptrs[0], ViewBuffer, 14070);
  Utils_CopyMem( imgptrs[0], DrawBuffer, 14070);*/
  Copperlist1 = ClbuildZoom( );
     1ea:	49f9 0000 0fa2 	lea fa2 <ClbuildZoom>,a4
     1f0:	4e94           	jsr (a4)
     1f2:	2600           	move.l d0,d3
     1f4:	23c0 0000 3392 	move.l d0,3392 <Copperlist1>
  Copperlist2 = ClbuildZoom( );
     1fa:	4e94           	jsr (a4)
     1fc:	2400           	move.l d0,d2
     1fe:	23c0 0000 338e 	move.l d0,338e <Copperlist2>
  
  DrawCopper = Copperlist1;
     204:	23c3 0000 321c 	move.l d3,321c <DrawCopper>
  ViewCopper = Copperlist2;
     20a:	23c0 0000 3224 	move.l d0,3224 <ViewCopper>
  Zoom_Shrink102( 15, Copperlist1);
     210:	2f03           	move.l d3,-(sp)
     212:	4878 000f      	pea f <_start+0xf>
     216:	49f9 0000 0490 	lea 490 <Zoom_Shrink102>,a4
     21c:	4e94           	jsr (a4)
  Zoom_Shrink102( 15, Copperlist2);
     21e:	2f02           	move.l d2,-(sp)
     220:	4878 000f      	pea f <_start+0xf>
     224:	4e94           	jsr (a4)
  Zoom_LevelOfZoom = 1;
     226:	33fc 0001 0000 	move.w #1,3228 <Zoom_LevelOfZoom>
     22c:	3228 
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
     22e:	2c79 0000 33a2 	movea.l 33a2 <SysBase>,a6
     234:	7016           	moveq #22,d0
     236:	223c 0001 0001 	move.l #65537,d1
     23c:	4eae ff3a      	jsr -198(a6)
     240:	2240           	movea.l d0,a1
     242:	23c0 0000 3396 	move.l d0,3396 <Zoom_vbint>
     248:	4fef 0010      	lea 16(sp),sp
     24c:	671a           	beq.s 268 <main+0x1f4>
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
     24e:	337c 02c4 0008 	move.w #708,8(a1)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
     254:	237c 0000 1a53 	move.l #6739,10(a1)
     25a:	000a 
    Zoom_vbint->is_Data = NULL;
     25c:	42a9 000e      	clr.l 14(a1)
    Zoom_vbint->is_Code = Zoom_VblankHandler;
     260:	237c 0000 081a 	move.l #2074,18(a1)
     266:	0012 
  AddIntServer( INTB_VERTB, Zoom_vbint);
     268:	2c79 0000 33a2 	movea.l 33a2 <SysBase>,a6
     26e:	7005           	moveq #5,d0
     270:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
     274:	2639 0000 3224 	move.l 3224 <ViewCopper>,d3
     27a:	2a79 0000 3220 	movea.l 3220 <ViewBuffer>,a5
     280:	2f03           	move.l d3,-(sp)
     282:	2f0d           	move.l a5,-(sp)
     284:	49f9 0000 0772 	lea 772 <Zoom_SetBplPointers>,a4
     28a:	4e94           	jsr (a4)
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
     28c:	2439 0000 321c 	move.l 321c <DrawCopper>,d2
     292:	2f02           	move.l d2,-(sp)
     294:	2f0d           	move.l a5,-(sp)
     296:	4e94           	jsr (a4)
  ViewBuffer = (ULONG *) tmp;
}

void SwapCl() {
  ULONG tmp = (ULONG) DrawCopper;
  DrawCopper = ViewCopper;
     298:	23c3 0000 321c 	move.l d3,321c <DrawCopper>
  ViewCopper = (ULONG *)tmp;
     29e:	23c2 0000 3224 	move.l d2,3224 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
     2a4:	2079 0000 339e 	movea.l 339e <hw>,a0
     2aa:	2142 0080      	move.l d2,128(a0)
  hw->copjmp1 = tmp;
     2ae:	3142 0088      	move.w d2,136(a0)
        if( Zoom_Pic > 1) {
     2b2:	2439 0000 230c 	move.l 230c <Zoom_Pic>,d2
     2b8:	4fef 0010      	lea 16(sp),sp
     2bc:	7602           	moveq #2,d3
          __DecompressLZ4( imgptrs[Zoom_Pic], DrawBuffer, Zoom_Lz4size[Zoom_Pic]-19);
     2be:	4bf9 0000 1a62 	lea 1a62 <Zoom_Lz4size>,a5
     2c4:	49f9 0000 16f0 	lea 16f0 <__DecompressLZ4>,a4
      WaitVbl();
     2ca:	4e92           	jsr (a2)
      if( Zoom_DrawPicture == 1) {    
     2cc:	2039 0000 2310 	move.l 2310 <Zoom_DrawPicture>,d0
     2d2:	7201           	moveq #1,d1
     2d4:	b280           	cmp.l d0,d1
     2d6:	676a           	beq.s 342 <main+0x2ce>
      if(Zoom_Pic == 87 ) {
     2d8:	7057           	moveq #87,d0
     2da:	b082           	cmp.l d2,d0
     2dc:	66ec           	bne.s 2ca <main+0x256>
        Zoom_Pic = 10;
     2de:	720a           	moveq #10,d1
     2e0:	23c1 0000 230c 	move.l d1,230c <Zoom_Pic>
  for(int i=0;i <2; i++)
     2e6:	740a           	moveq #10,d2
     2e8:	5383           	subq.l #1,d3
     2ea:	6600 00aa      	bne.w 396 <main+0x322>
  RemIntServer(INTB_VERTB, Zoom_vbint);
     2ee:	2c79 0000 33a2 	movea.l 33a2 <SysBase>,a6
     2f4:	7005           	moveq #5,d0
     2f6:	2279 0000 3396 	movea.l 3396 <Zoom_vbint>,a1
     2fc:	4eae ff52      	jsr -174(a6)
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
     300:	2279 0000 3392 	movea.l 3392 <Copperlist1>,a1
     306:	b2fc 0000      	cmpa.w #0,a1
     30a:	6710           	beq.s 31c <main+0x2a8>
     30c:	2c79 0000 33a2 	movea.l 33a2 <SysBase>,a6
     312:	203c 0000 031c 	move.l #796,d0
     318:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
     31c:	2279 0000 338e 	movea.l 338e <Copperlist2>,a1
     322:	b2fc 0000      	cmpa.w #0,a1
     326:	6710           	beq.s 338 <main+0x2c4>
     328:	2c79 0000 33a2 	movea.l 33a2 <SysBase>,a6
     32e:	203c 0000 031c 	move.l #796,d0
     334:	4eae ff2e      	jsr -210(a6)
  	Zoom_InitRun();
	Zoom_Run();
	Zoom_Dealloc();
}
     338:	7000           	moveq #0,d0
     33a:	4cdf 7c8c      	movem.l (sp)+,d2-d3/d7/a2-a6
     33e:	508f           	addq.l #8,sp
     340:	4e75           	rts
        if( Zoom_Pic > 1) {
     342:	b282           	cmp.l d2,d1
     344:	6d1c           	blt.s 362 <main+0x2ee>
        Zoom_DrawPicture = 0;
     346:	7200           	moveq #0,d1
     348:	23c1 0000 2310 	move.l d1,2310 <Zoom_DrawPicture>
        Zoom_Pic++;
     34e:	5282           	addq.l #1,d2
     350:	23c2 0000 230c 	move.l d2,230c <Zoom_Pic>
      if(Zoom_Pic == 87 ) {
     356:	7057           	moveq #87,d0
     358:	b082           	cmp.l d2,d0
     35a:	6600 ff6e      	bne.w 2ca <main+0x256>
     35e:	6000 ff7e      	bra.w 2de <main+0x26a>
          __DecompressLZ4( imgptrs[Zoom_Pic], DrawBuffer, Zoom_Lz4size[Zoom_Pic]-19);
     362:	d482           	add.l d2,d2
     364:	d482           	add.l d2,d2
     366:	70ed           	moveq #-19,d0
     368:	d0b5 2800      	add.l (0,a5,d2.l),d0
     36c:	2f00           	move.l d0,-(sp)
     36e:	2f39 0000 338a 	move.l 338a <DrawBuffer>,-(sp)
     374:	2f33 2800      	move.l (0,a3,d2.l),-(sp)
     378:	4e94           	jsr (a4)
        Zoom_Pic++;
     37a:	2439 0000 230c 	move.l 230c <Zoom_Pic>,d2
     380:	4fef 000c      	lea 12(sp),sp
        Zoom_DrawPicture = 0;
     384:	7200           	moveq #0,d1
     386:	23c1 0000 2310 	move.l d1,2310 <Zoom_DrawPicture>
        Zoom_Pic++;
     38c:	5282           	addq.l #1,d2
     38e:	23c2 0000 230c 	move.l d2,230c <Zoom_Pic>
     394:	60c0           	bra.s 356 <main+0x2e2>
  for(int i=0;i <2; i++)
     396:	7601           	moveq #1,d3
      WaitVbl();
     398:	4e92           	jsr (a2)
      if( Zoom_DrawPicture == 1) {    
     39a:	2039 0000 2310 	move.l 2310 <Zoom_DrawPicture>,d0
     3a0:	7201           	moveq #1,d1
     3a2:	b280           	cmp.l d0,d1
     3a4:	6600 ff32      	bne.w 2d8 <main+0x264>
     3a8:	6098           	bra.s 342 <main+0x2ce>
		Exit(0);
     3aa:	9dce           	suba.l a6,a6
     3ac:	7200           	moveq #0,d1
     3ae:	4eae ff70      	jsr -144(a6)
	KPrintF("Hello debugger from Amiga!\n");
     3b2:	4879 0000 1a27 	pea 1a27 <noadditionalchar+0x99>
     3b8:	4eb9 0000 130e 	jsr 130e <KPrintF>
	Write(Output(), (APTR)"Hello console!\n", 15);
     3be:	2c79 0000 339a 	movea.l 339a <DOSBase>,a6
     3c4:	4eae ffc4      	jsr -60(a6)
     3c8:	2c79 0000 339a 	movea.l 339a <DOSBase>,a6
     3ce:	2200           	move.l d0,d1
     3d0:	243c 0000 1a43 	move.l #6723,d2
     3d6:	760f           	moveq #15,d3
     3d8:	4eae ffd0      	jsr -48(a6)
	Delay(50);
     3dc:	2c79 0000 339a 	movea.l 339a <DOSBase>,a6
     3e2:	7232           	moveq #50,d1
     3e4:	4eae ff3a      	jsr -198(a6)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     3e8:	3f7c 4e7a 0026 	move.w #20090,38(sp)
     3ee:	3f7c 0801 0028 	move.w #2049,40(sp)
     3f4:	3f7c 4e73 002a 	move.w #20083,42(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     3fa:	2c79 0000 33a2 	movea.l 33a2 <SysBase>,a6
     400:	588f           	addq.l #4,sp
     402:	082e 0000 0129 	btst #0,297(a6)
     408:	6600 fd28      	bne.w 132 <main+0xbe>
	APTR vbr = 0;
     40c:	7000           	moveq #0,d0
	VBR=GetVBR();
     40e:	23c0 0000 3218 	move.l d0,3218 <VBR>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     414:	2079 0000 3218 	movea.l 3218 <VBR>,a0
     41a:	2028 006c      	move.l 108(a0),d0
	WaitVbl();
     41e:	45f9 0000 072c 	lea 72c <WaitVbl>,a2
     424:	4e92           	jsr (a2)
    hw->dmacon = 0b1000011111111111;
     426:	2079 0000 339e 	movea.l 339e <hw>,a0
     42c:	317c 87ff 0096 	move.w #-30721,150(a0)
    imgptrs[i] = Zoom_Rawchip + 56280*i;
     432:	2039 0000 33a6 	move.l 33a6 <Zoom_Rawchip>,d0
     438:	47f9 0000 322e 	lea 322e <imgptrs>,a3
     43e:	2680           	move.l d0,(a3)
     440:	0680 0000 dbd8 	addi.l #56280,d0
     446:	23c0 0000 3232 	move.l d0,3232 <imgptrs+0x4>
    imgptrs[i] = Zoom_Rawany + tmp;
     44c:	2239 0000 33ae 	move.l 33ae <Zoom_Rawany>,d1
     452:	41f9 0000 3236 	lea 3236 <imgptrs+0x8>,a0
     458:	43f9 0000 1a6a 	lea 1a6a <Zoom_Lz4size+0x8>,a1
  ULONG tmp = 11;
     45e:	700b           	moveq #11,d0
     460:	6000 fd2e      	bra.w 190 <main+0x11c>
		Exit(0);
     464:	2c79 0000 339a 	movea.l 339a <DOSBase>,a6
     46a:	7200           	moveq #0,d1
     46c:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     470:	2c79 0000 33a2 	movea.l 33a2 <SysBase>,a6
     476:	43f9 0000 1a1b 	lea 1a1b <noadditionalchar+0x8d>,a1
     47c:	7000           	moveq #0,d0
     47e:	4eae fdd8      	jsr -552(a6)
     482:	23c0 0000 339a 	move.l d0,339a <DOSBase>
	if (!DOSBase)
     488:	6600 fc4e      	bne.w d8 <main+0x64>
     48c:	6000 ff1c      	bra.w 3aa <main+0x336>

00000490 <Zoom_Shrink102>:
    *copperlist = *values4shift++;
    copperlist += 2;
  }
}

void Zoom_Shrink102( UWORD levelofshrink, UWORD volatile *copperlist )  {
     490:	226f 0008      	movea.l 8(sp),a1

  
  UWORD *values4shift = Values4Shift+levelofshrink*108;
     494:	302f 0006      	move.w 6(sp),d0
     498:	c0fc 00d8      	mulu.w #216,d0
     49c:	2040           	movea.l d0,a0
     49e:	d1fc 0000 2314 	adda.l #8980,a0
    *copperlist = *values4shift++;
     4a4:	3350 012a      	move.w (a0),298(a1)
     4a8:	3368 0002 012e 	move.w 2(a0),302(a1)
     4ae:	3368 0004 0132 	move.w 4(a0),306(a1)
     4b4:	3368 0006 0136 	move.w 6(a0),310(a1)
     4ba:	3368 0008 013a 	move.w 8(a0),314(a1)
     4c0:	3368 000a 013e 	move.w 10(a0),318(a1)
  *copperlist++ = *values4shift++;
     4c6:	3368 000c 0140 	move.w 12(a0),320(a1)
  *copperlist = *values4shift++;
     4cc:	3368 000e 0142 	move.w 14(a0),322(a1)
    *copperlist = *values4shift++;
     4d2:	3368 0010 0146 	move.w 16(a0),326(a1)
     4d8:	3368 0012 014a 	move.w 18(a0),330(a1)
     4de:	3368 0014 014e 	move.w 20(a0),334(a1)
     4e4:	3368 0016 0152 	move.w 22(a0),338(a1)
     4ea:	3368 0018 0156 	move.w 24(a0),342(a1)
     4f0:	3368 001a 015a 	move.w 26(a0),346(a1)
     4f6:	3368 001c 015e 	move.w 28(a0),350(a1)
     4fc:	3368 001e 0162 	move.w 30(a0),354(a1)
     502:	3368 0020 0166 	move.w 32(a0),358(a1)
     508:	3368 0022 016a 	move.w 34(a0),362(a1)
  *copperlist++ = *values4shift++;
     50e:	3368 0024 016c 	move.w 36(a0),364(a1)
  *copperlist = *values4shift++;
     514:	3368 0026 016e 	move.w 38(a0),366(a1)
    *copperlist = *values4shift++;
     51a:	3368 0028 0172 	move.w 40(a0),370(a1)
     520:	3368 002a 0176 	move.w 42(a0),374(a1)
     526:	3368 002c 017a 	move.w 44(a0),378(a1)
     52c:	3368 002e 017e 	move.w 46(a0),382(a1)
     532:	3368 0030 0182 	move.w 48(a0),386(a1)
     538:	3368 0032 0186 	move.w 50(a0),390(a1)
     53e:	3368 0034 018a 	move.w 52(a0),394(a1)
    *copperlist = *values4shift++;
     544:	3368 0036 01a2 	move.w 54(a0),418(a1)
     54a:	3368 0038 01a6 	move.w 56(a0),422(a1)
     550:	3368 003a 01aa 	move.w 58(a0),426(a1)
     556:	3368 003c 01ae 	move.w 60(a0),430(a1)
     55c:	3368 003e 01b2 	move.w 62(a0),434(a1)
     562:	3368 0040 01b6 	move.w 64(a0),438(a1)
  *copperlist++ = *values4shift++;
     568:	3368 0042 01b8 	move.w 66(a0),440(a1)
  *copperlist = *values4shift++;
     56e:	3368 0044 01ba 	move.w 68(a0),442(a1)
    *copperlist = *values4shift++;
     574:	3368 0046 01be 	move.w 70(a0),446(a1)
     57a:	3368 0048 01c2 	move.w 72(a0),450(a1)
     580:	3368 004a 01c6 	move.w 74(a0),454(a1)
     586:	3368 004c 01ca 	move.w 76(a0),458(a1)
     58c:	3368 004e 01ce 	move.w 78(a0),462(a1)
     592:	3368 0050 01d2 	move.w 80(a0),466(a1)
     598:	3368 0052 01d6 	move.w 82(a0),470(a1)
     59e:	3368 0054 01da 	move.w 84(a0),474(a1)
     5a4:	3368 0056 01de 	move.w 86(a0),478(a1)
     5aa:	3368 0058 01e2 	move.w 88(a0),482(a1)
  *copperlist++ = *values4shift++;
     5b0:	3368 005a 01e4 	move.w 90(a0),484(a1)
  *copperlist = *values4shift++;
     5b6:	3368 005c 01e6 	move.w 92(a0),486(a1)
    *copperlist = *values4shift++;
     5bc:	3368 005e 01ea 	move.w 94(a0),490(a1)
     5c2:	3368 0060 01ee 	move.w 96(a0),494(a1)
     5c8:	3368 0062 01f2 	move.w 98(a0),498(a1)
     5ce:	3368 0064 01f6 	move.w 100(a0),502(a1)
     5d4:	3368 0066 01fa 	move.w 102(a0),506(a1)
     5da:	3368 0068 01fe 	move.w 104(a0),510(a1)
     5e0:	3368 006a 0202 	move.w 106(a0),514(a1)
    *copperlist = *values4shift++;
     5e6:	3368 006c 0212 	move.w 108(a0),530(a1)
     5ec:	3368 006e 0216 	move.w 110(a0),534(a1)
     5f2:	3368 0070 021a 	move.w 112(a0),538(a1)
     5f8:	3368 0072 021e 	move.w 114(a0),542(a1)
     5fe:	3368 0074 0222 	move.w 116(a0),546(a1)
     604:	3368 0076 0226 	move.w 118(a0),550(a1)
  *copperlist++ = *values4shift++;
     60a:	3368 0078 0228 	move.w 120(a0),552(a1)
  *copperlist = *values4shift++;
     610:	3368 007a 022a 	move.w 122(a0),554(a1)
    *copperlist = *values4shift++;
     616:	3368 007c 022e 	move.w 124(a0),558(a1)
     61c:	3368 007e 0232 	move.w 126(a0),562(a1)
     622:	3368 0080 0236 	move.w 128(a0),566(a1)
     628:	3368 0082 023a 	move.w 130(a0),570(a1)
     62e:	3368 0084 023e 	move.w 132(a0),574(a1)
     634:	3368 0086 0242 	move.w 134(a0),578(a1)
     63a:	3368 0088 0246 	move.w 136(a0),582(a1)
     640:	3368 008a 024a 	move.w 138(a0),586(a1)
     646:	3368 008c 024e 	move.w 140(a0),590(a1)
     64c:	3368 008e 0252 	move.w 142(a0),594(a1)
  *copperlist++ = *values4shift++;
     652:	3368 0090 0254 	move.w 144(a0),596(a1)
  *copperlist = *values4shift++;
     658:	3368 0092 0256 	move.w 146(a0),598(a1)
    *copperlist = *values4shift++;
     65e:	3368 0094 025a 	move.w 148(a0),602(a1)
     664:	3368 0096 025e 	move.w 150(a0),606(a1)
     66a:	3368 0098 0262 	move.w 152(a0),610(a1)
     670:	3368 009a 0266 	move.w 154(a0),614(a1)
     676:	3368 009c 026a 	move.w 156(a0),618(a1)
     67c:	3368 009e 026e 	move.w 158(a0),622(a1)
     682:	3368 00a0 0272 	move.w 160(a0),626(a1)
    *copperlist = *values4shift++;
     688:	3368 00a2 0282 	move.w 162(a0),642(a1)
     68e:	3368 00a4 0286 	move.w 164(a0),646(a1)
     694:	3368 00a6 028a 	move.w 166(a0),650(a1)
     69a:	3368 00a8 028e 	move.w 168(a0),654(a1)
     6a0:	3368 00aa 0292 	move.w 170(a0),658(a1)
     6a6:	3368 00ac 0296 	move.w 172(a0),662(a1)
  *copperlist++ = *values4shift++;
     6ac:	3368 00ae 0298 	move.w 174(a0),664(a1)
  *copperlist = *values4shift++;
     6b2:	3368 00b0 029a 	move.w 176(a0),666(a1)
    *copperlist = *values4shift++;
     6b8:	3368 00b2 029e 	move.w 178(a0),670(a1)
     6be:	3368 00b4 02a2 	move.w 180(a0),674(a1)
     6c4:	3368 00b6 02a6 	move.w 182(a0),678(a1)
     6ca:	3368 00b8 02aa 	move.w 184(a0),682(a1)
     6d0:	3368 00ba 02ae 	move.w 186(a0),686(a1)
     6d6:	3368 00bc 02b2 	move.w 188(a0),690(a1)
     6dc:	3368 00be 02b6 	move.w 190(a0),694(a1)
     6e2:	3368 00c0 02ba 	move.w 192(a0),698(a1)
     6e8:	3368 00c2 02be 	move.w 194(a0),702(a1)
     6ee:	3368 00c4 02c2 	move.w 196(a0),706(a1)
  *copperlist++ = *values4shift++;
     6f4:	3368 00c6 02c4 	move.w 198(a0),708(a1)
  *copperlist = *values4shift++;
     6fa:	3368 00c8 02c6 	move.w 200(a0),710(a1)
    *copperlist = *values4shift++;
     700:	3368 00ca 02ca 	move.w 202(a0),714(a1)
     706:	3368 00cc 02ce 	move.w 204(a0),718(a1)
     70c:	3368 00ce 02d2 	move.w 206(a0),722(a1)
     712:	3368 00d0 02d6 	move.w 208(a0),726(a1)
     718:	3368 00d2 02da 	move.w 210(a0),730(a1)
     71e:	3368 00d4 02de 	move.w 212(a0),734(a1)
     724:	3368 00d6 02e2 	move.w 214(a0),738(a1)
  for(int i = 0; i<30;i++) {
    *copperlist = *values4shift++;
    copperlist += 2;
  }*/
  
}
     72a:	4e75           	rts

0000072c <WaitVbl>:
void WaitVbl() {
     72c:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     72e:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.f93356b9+0xdf5490>,d0
     734:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
     736:	2017           	move.l (sp),d0
     738:	0280 0001 ff00 	andi.l #130816,d0
     73e:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
     740:	2017           	move.l (sp),d0
     742:	0c80 0001 3700 	cmpi.l #79616,d0
     748:	67e4           	beq.s 72e <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     74a:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.f93356b9+0xdf5490>,d0
     750:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
     754:	202f 0004      	move.l 4(sp),d0
     758:	0280 0001 ff00 	andi.l #130816,d0
     75e:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
     762:	202f 0004      	move.l 4(sp),d0
     766:	0c80 0001 3700 	cmpi.l #79616,d0
     76c:	66dc           	bne.s 74a <WaitVbl+0x1e>
}
     76e:	508f           	addq.l #8,sp
     770:	4e75           	rts

00000772 <Zoom_SetBplPointers>:
  ViewBuffer = Bitplane2;
  ViewCopper = Copperlist2; 
  return 0;
}

void Zoom_SetBplPointers( UWORD volatile *buffer, ULONG volatile *copper) {
     772:	4e55 ffc0      	link.w a5,#-64
     776:	2f0a           	move.l a2,-(sp)
     778:	2f02           	move.l d2,-(sp)
     77a:	246d 000c      	movea.l 12(a5),a2
  //                   0  1  1   1   1   0   1   1    1    1    0    1    1    0    1    1
  //int zoomoffset[] = { 0, 0, 42, 42, 84, 84, 84, 126, 126, 168, 168, 168, 210, 210, 210, 332};
  //int zoomoffset[] = { 252, 210, 210, 210, 168, 168, 168, 126, 126, 84, 84, 84, 42, 42, 0, 0 };
  int zoomoffset[] = { 126, 105, 105, 105, 84, 84, 84, 63, 63, 42, 42, 42, 21, 21, 0, 0 };
     77e:	4878 0040      	pea 40 <_start+0x40>
     782:	4879 0000 19a4 	pea 19a4 <noadditionalchar+0x16>
     788:	486d ffc0      	pea -64(a5)
     78c:	4eba 0cd4      	jsr 1462 <memcpy>(pc)

  ULONG plane2set = buffer + zoomoffset[Zoom_LevelOf102Zoom];//+1;
     790:	3039 0000 322a 	move.w 322a <Zoom_LevelOf102Zoom>,d0
     796:	0280 0000 ffff 	andi.l #65535,d0
     79c:	d080           	add.l d0,d0
     79e:	d080           	add.l d0,d0
     7a0:	2035 08c0      	move.l (-64,a5,d0.l),d0
     7a4:	d080           	add.l d0,d0
     7a6:	d0ad 0008      	add.l 8(a5),d0
  /*ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
                                                         *ZMLINESIZE*ZMBPLDEPTH/4;*/
  UWORD *posofcopper = (UWORD *)copper + ZMCOPBPL1HIGH;
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    UWORD highword = (ULONG)plane2set >> 16;
     7aa:	2200           	move.l d0,d1
     7ac:	4241           	clr.w d1
     7ae:	4841           	swap d1
     7b0:	3541 0072      	move.w d1,114(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     7b4:	3540 0076      	move.w d0,118(a2)
    *posofcopper = highword;
    posofcopper += 2;
    *posofcopper = lowword;
    posofcopper += 2;
    plane2set += 42*268; //Next plane
     7b8:	2200           	move.l d0,d1
     7ba:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
     7c0:	2401           	move.l d1,d2
     7c2:	4242           	clr.w d2
     7c4:	4842           	swap d2
     7c6:	3542 007a      	move.w d2,122(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     7ca:	3541 007e      	move.w d1,126(a2)
    plane2set += 42*268; //Next plane
     7ce:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
     7d4:	2401           	move.l d1,d2
     7d6:	4242           	clr.w d2
     7d8:	4842           	swap d2
     7da:	3542 0082      	move.w d2,130(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     7de:	3541 0086      	move.w d1,134(a2)
    plane2set += 42*268; //Next plane
     7e2:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
     7e8:	2401           	move.l d1,d2
     7ea:	4242           	clr.w d2
     7ec:	4842           	swap d2
     7ee:	3542 008a      	move.w d2,138(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     7f2:	3541 008e      	move.w d1,142(a2)
    plane2set += 42*268; //Next plane
     7f6:	0680 0000 afe0 	addi.l #45024,d0
    UWORD highword = (ULONG)plane2set >> 16;
     7fc:	2200           	move.l d0,d1
     7fe:	4241           	clr.w d1
     800:	4841           	swap d1
     802:	3541 0092      	move.w d1,146(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     806:	3540 0096      	move.w d0,150(a2)
  for(int i=0;i<ZMBPLDEPTH;i++) {
     80a:	4fef 000c      	lea 12(sp),sp
  }
  
}
     80e:	242d ffb8      	move.l -72(a5),d2
     812:	246d ffbc      	movea.l -68(a5),a2
     816:	4e5d           	unlk a5
     818:	4e75           	rts

0000081a <Zoom_VblankHandler>:
void Zoom_VblankHandler() {
     81a:	4e55 ffc0      	link.w a5,#-64
     81e:	2f0a           	move.l a2,-(sp)
     820:	2f02           	move.l d2,-(sp)
  hw->dmacon = 0b1000011111111111;
     822:	2079 0000 339e 	movea.l 339e <hw>,a0
     828:	317c 87ff 0096 	move.w #-30721,150(a0)
  Zoom_Counter++;
     82e:	5279 0000 322c 	addq.w #1,322c <Zoom_Counter>
  ULONG tmp = (ULONG) DrawCopper;
     834:	2039 0000 321c 	move.l 321c <DrawCopper>,d0
  DrawCopper = ViewCopper;
     83a:	2479 0000 3224 	movea.l 3224 <ViewCopper>,a2
     840:	23ca 0000 321c 	move.l a2,321c <DrawCopper>
  ViewCopper = (ULONG *)tmp;
     846:	23c0 0000 3224 	move.l d0,3224 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
     84c:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
     850:	3140 0088      	move.w d0,136(a0)
      *target++ = pattern;
    target += mod;
  }
}

short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
     854:	1039 00bf e001 	move.b bfe001 <gcc8_c_support.c.f93356b9+0xbf448d>,d0
  if( MouseLeft())
     85a:	0800 0006      	btst #6,d0
     85e:	6600 03a2      	bne.w c02 <Zoom_VblankHandler+0x3e8>
    Zoom_Mousepressed = 1;
     862:	33fc 0001 0000 	move.w #1,3216 <Zoom_Mousepressed>
     868:	3216 
     86a:	1039 00bf e001 	move.b bfe001 <gcc8_c_support.c.f93356b9+0xbf448d>,d0
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
     870:	0800 0006      	btst #6,d0
     874:	6600 0722      	bne.w f98 <Zoom_VblankHandler+0x77e>
      if( Zoom_LevelOf102Zoom <= 2) {
     878:	3239 0000 322a 	move.w 322a <Zoom_LevelOf102Zoom>,d1

void Zoom_SwapBuffers( UWORD zoomlevel) {
  //ViewBuffer = rawzoom + (42*268*5*zoomlevel);
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
     87e:	2039 0000 3220 	move.l 3220 <ViewBuffer>,d0
      if( Zoom_LevelOf102Zoom <= 2) {
     884:	0c41 0002      	cmpi.w #2,d1
     888:	6200 0398      	bhi.w c22 <Zoom_VblankHandler+0x408>
        if( Zoom_LevelOfZoom == 87)
     88c:	3239 0000 3228 	move.w 3228 <Zoom_LevelOfZoom>,d1
     892:	0c41 0057      	cmpi.w #87,d1
     896:	6700 06cc      	beq.w f64 <Zoom_VblankHandler+0x74a>
          Zoom_LevelOfZoom++;
     89a:	3239 0000 3228 	move.w 3228 <Zoom_LevelOfZoom>,d1
     8a0:	5241           	addq.w #1,d1
     8a2:	33c1 0000 3228 	move.w d1,3228 <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = 15;// MaxZoom102[ Zoom_LevelOfZoom] - 1;          
     8a8:	33fc 000f 0000 	move.w #15,322a <Zoom_LevelOf102Zoom>
     8ae:	322a 
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
     8b0:	3239 0000 3228 	move.w 3228 <Zoom_LevelOfZoom>,d1
  ULONG tmp = (ULONG) DrawBuffer;
     8b6:	2439 0000 338a 	move.l 338a <DrawBuffer>,d2
  DrawBuffer = ViewBuffer;
     8bc:	23c0 0000 338a 	move.l d0,338a <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
     8c2:	23c2 0000 3220 	move.l d2,3220 <ViewBuffer>
        Zoom_DrawPicture = 1;
     8c8:	7001           	moveq #1,d0
     8ca:	23c0 0000 2310 	move.l d0,2310 <Zoom_DrawPicture>
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
     8d0:	3039 0000 322a 	move.w 322a <Zoom_LevelOf102Zoom>,d0
  UWORD *values4shift = Values4Shift+levelofshrink*108;
     8d6:	c0fc 00d8      	mulu.w #216,d0
     8da:	2040           	movea.l d0,a0
     8dc:	d1fc 0000 2314 	adda.l #8980,a0
    *copperlist = *values4shift++;
     8e2:	3550 012a      	move.w (a0),298(a2)
     8e6:	3568 0002 012e 	move.w 2(a0),302(a2)
     8ec:	3568 0004 0132 	move.w 4(a0),306(a2)
     8f2:	3568 0006 0136 	move.w 6(a0),310(a2)
     8f8:	3568 0008 013a 	move.w 8(a0),314(a2)
     8fe:	3568 000a 013e 	move.w 10(a0),318(a2)
  *copperlist++ = *values4shift++;
     904:	3568 000c 0140 	move.w 12(a0),320(a2)
  *copperlist = *values4shift++;
     90a:	3568 000e 0142 	move.w 14(a0),322(a2)
    *copperlist = *values4shift++;
     910:	3568 0010 0146 	move.w 16(a0),326(a2)
     916:	3568 0012 014a 	move.w 18(a0),330(a2)
     91c:	3568 0014 014e 	move.w 20(a0),334(a2)
     922:	3568 0016 0152 	move.w 22(a0),338(a2)
     928:	3568 0018 0156 	move.w 24(a0),342(a2)
     92e:	3568 001a 015a 	move.w 26(a0),346(a2)
     934:	3568 001c 015e 	move.w 28(a0),350(a2)
     93a:	3568 001e 0162 	move.w 30(a0),354(a2)
     940:	3568 0020 0166 	move.w 32(a0),358(a2)
     946:	3568 0022 016a 	move.w 34(a0),362(a2)
  *copperlist++ = *values4shift++;
     94c:	3568 0024 016c 	move.w 36(a0),364(a2)
  *copperlist = *values4shift++;
     952:	3568 0026 016e 	move.w 38(a0),366(a2)
    *copperlist = *values4shift++;
     958:	3568 0028 0172 	move.w 40(a0),370(a2)
     95e:	3568 002a 0176 	move.w 42(a0),374(a2)
     964:	3568 002c 017a 	move.w 44(a0),378(a2)
     96a:	3568 002e 017e 	move.w 46(a0),382(a2)
     970:	3568 0030 0182 	move.w 48(a0),386(a2)
     976:	3568 0032 0186 	move.w 50(a0),390(a2)
     97c:	3568 0034 018a 	move.w 52(a0),394(a2)
    *copperlist = *values4shift++;
     982:	3568 0036 01a2 	move.w 54(a0),418(a2)
     988:	3568 0038 01a6 	move.w 56(a0),422(a2)
     98e:	3568 003a 01aa 	move.w 58(a0),426(a2)
     994:	3568 003c 01ae 	move.w 60(a0),430(a2)
     99a:	3568 003e 01b2 	move.w 62(a0),434(a2)
     9a0:	3568 0040 01b6 	move.w 64(a0),438(a2)
  *copperlist++ = *values4shift++;
     9a6:	3568 0042 01b8 	move.w 66(a0),440(a2)
  *copperlist = *values4shift++;
     9ac:	3568 0044 01ba 	move.w 68(a0),442(a2)
    *copperlist = *values4shift++;
     9b2:	3568 0046 01be 	move.w 70(a0),446(a2)
     9b8:	3568 0048 01c2 	move.w 72(a0),450(a2)
     9be:	3568 004a 01c6 	move.w 74(a0),454(a2)
     9c4:	3568 004c 01ca 	move.w 76(a0),458(a2)
     9ca:	3568 004e 01ce 	move.w 78(a0),462(a2)
     9d0:	3568 0050 01d2 	move.w 80(a0),466(a2)
     9d6:	3568 0052 01d6 	move.w 82(a0),470(a2)
     9dc:	3568 0054 01da 	move.w 84(a0),474(a2)
     9e2:	3568 0056 01de 	move.w 86(a0),478(a2)
     9e8:	3568 0058 01e2 	move.w 88(a0),482(a2)
  *copperlist++ = *values4shift++;
     9ee:	3568 005a 01e4 	move.w 90(a0),484(a2)
  *copperlist = *values4shift++;
     9f4:	3568 005c 01e6 	move.w 92(a0),486(a2)
    *copperlist = *values4shift++;
     9fa:	3568 005e 01ea 	move.w 94(a0),490(a2)
     a00:	3568 0060 01ee 	move.w 96(a0),494(a2)
     a06:	3568 0062 01f2 	move.w 98(a0),498(a2)
     a0c:	3568 0064 01f6 	move.w 100(a0),502(a2)
     a12:	3568 0066 01fa 	move.w 102(a0),506(a2)
     a18:	3568 0068 01fe 	move.w 104(a0),510(a2)
     a1e:	3568 006a 0202 	move.w 106(a0),514(a2)
    *copperlist = *values4shift++;
     a24:	3568 006c 0212 	move.w 108(a0),530(a2)
     a2a:	3568 006e 0216 	move.w 110(a0),534(a2)
     a30:	3568 0070 021a 	move.w 112(a0),538(a2)
     a36:	3568 0072 021e 	move.w 114(a0),542(a2)
     a3c:	3568 0074 0222 	move.w 116(a0),546(a2)
     a42:	3568 0076 0226 	move.w 118(a0),550(a2)
  *copperlist++ = *values4shift++;
     a48:	3568 0078 0228 	move.w 120(a0),552(a2)
  *copperlist = *values4shift++;
     a4e:	3568 007a 022a 	move.w 122(a0),554(a2)
    *copperlist = *values4shift++;
     a54:	3568 007c 022e 	move.w 124(a0),558(a2)
     a5a:	3568 007e 0232 	move.w 126(a0),562(a2)
     a60:	3568 0080 0236 	move.w 128(a0),566(a2)
     a66:	3568 0082 023a 	move.w 130(a0),570(a2)
     a6c:	3568 0084 023e 	move.w 132(a0),574(a2)
     a72:	3568 0086 0242 	move.w 134(a0),578(a2)
     a78:	3568 0088 0246 	move.w 136(a0),582(a2)
     a7e:	3568 008a 024a 	move.w 138(a0),586(a2)
     a84:	3568 008c 024e 	move.w 140(a0),590(a2)
     a8a:	3568 008e 0252 	move.w 142(a0),594(a2)
  *copperlist++ = *values4shift++;
     a90:	3568 0090 0254 	move.w 144(a0),596(a2)
  *copperlist = *values4shift++;
     a96:	3568 0092 0256 	move.w 146(a0),598(a2)
    *copperlist = *values4shift++;
     a9c:	3568 0094 025a 	move.w 148(a0),602(a2)
     aa2:	3568 0096 025e 	move.w 150(a0),606(a2)
     aa8:	3568 0098 0262 	move.w 152(a0),610(a2)
     aae:	3568 009a 0266 	move.w 154(a0),614(a2)
     ab4:	3568 009c 026a 	move.w 156(a0),618(a2)
     aba:	3568 009e 026e 	move.w 158(a0),622(a2)
     ac0:	3568 00a0 0272 	move.w 160(a0),626(a2)
    *copperlist = *values4shift++;
     ac6:	3568 00a2 0282 	move.w 162(a0),642(a2)
     acc:	3568 00a4 0286 	move.w 164(a0),646(a2)
     ad2:	3568 00a6 028a 	move.w 166(a0),650(a2)
     ad8:	3568 00a8 028e 	move.w 168(a0),654(a2)
     ade:	3568 00aa 0292 	move.w 170(a0),658(a2)
     ae4:	3568 00ac 0296 	move.w 172(a0),662(a2)
  *copperlist++ = *values4shift++;
     aea:	3568 00ae 0298 	move.w 174(a0),664(a2)
  *copperlist = *values4shift++;
     af0:	3568 00b0 029a 	move.w 176(a0),666(a2)
    *copperlist = *values4shift++;
     af6:	3568 00b2 029e 	move.w 178(a0),670(a2)
     afc:	3568 00b4 02a2 	move.w 180(a0),674(a2)
     b02:	3568 00b6 02a6 	move.w 182(a0),678(a2)
     b08:	3568 00b8 02aa 	move.w 184(a0),682(a2)
     b0e:	3568 00ba 02ae 	move.w 186(a0),686(a2)
     b14:	3568 00bc 02b2 	move.w 188(a0),690(a2)
     b1a:	3568 00be 02b6 	move.w 190(a0),694(a2)
     b20:	3568 00c0 02ba 	move.w 192(a0),698(a2)
     b26:	3568 00c2 02be 	move.w 194(a0),702(a2)
     b2c:	3568 00c4 02c2 	move.w 196(a0),706(a2)
  *copperlist++ = *values4shift++;
     b32:	3568 00c6 02c4 	move.w 198(a0),708(a2)
  *copperlist = *values4shift++;
     b38:	3568 00c8 02c6 	move.w 200(a0),710(a2)
    *copperlist = *values4shift++;
     b3e:	3568 00ca 02ca 	move.w 202(a0),714(a2)
     b44:	3568 00cc 02ce 	move.w 204(a0),718(a2)
     b4a:	3568 00ce 02d2 	move.w 206(a0),722(a2)
     b50:	3568 00d0 02d6 	move.w 208(a0),726(a2)
     b56:	3568 00d2 02da 	move.w 210(a0),730(a2)
     b5c:	3568 00d4 02de 	move.w 212(a0),734(a2)
     b62:	3568 00d6 02e2 	move.w 214(a0),738(a2)
  int zoomoffset[] = { 126, 105, 105, 105, 84, 84, 84, 63, 63, 42, 42, 42, 21, 21, 0, 0 };
     b68:	4878 0040      	pea 40 <_start+0x40>
     b6c:	4879 0000 19a4 	pea 19a4 <noadditionalchar+0x16>
     b72:	486d ffc0      	pea -64(a5)
     b76:	4eba 08ea      	jsr 1462 <memcpy>(pc)
  ULONG plane2set = buffer + zoomoffset[Zoom_LevelOf102Zoom];//+1;
     b7a:	3039 0000 322a 	move.w 322a <Zoom_LevelOf102Zoom>,d0
     b80:	0280 0000 ffff 	andi.l #65535,d0
     b86:	d080           	add.l d0,d0
     b88:	d080           	add.l d0,d0
     b8a:	2035 08c0      	move.l (-64,a5,d0.l),d0
     b8e:	d080           	add.l d0,d0
     b90:	d082           	add.l d2,d0
    UWORD highword = (ULONG)plane2set >> 16;
     b92:	2200           	move.l d0,d1
     b94:	4241           	clr.w d1
     b96:	4841           	swap d1
     b98:	3541 0072      	move.w d1,114(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     b9c:	3540 0076      	move.w d0,118(a2)
    plane2set += 42*268; //Next plane
     ba0:	2200           	move.l d0,d1
     ba2:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
     ba8:	2401           	move.l d1,d2
     baa:	4242           	clr.w d2
     bac:	4842           	swap d2
     bae:	3542 007a      	move.w d2,122(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     bb2:	3541 007e      	move.w d1,126(a2)
    plane2set += 42*268; //Next plane
     bb6:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
     bbc:	2401           	move.l d1,d2
     bbe:	4242           	clr.w d2
     bc0:	4842           	swap d2
     bc2:	3542 0082      	move.w d2,130(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     bc6:	3541 0086      	move.w d1,134(a2)
    plane2set += 42*268; //Next plane
     bca:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
     bd0:	2401           	move.l d1,d2
     bd2:	4242           	clr.w d2
     bd4:	4842           	swap d2
     bd6:	3542 008a      	move.w d2,138(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     bda:	3541 008e      	move.w d1,142(a2)
    plane2set += 42*268; //Next plane
     bde:	0680 0000 afe0 	addi.l #45024,d0
    UWORD highword = (ULONG)plane2set >> 16;
     be4:	2200           	move.l d0,d1
     be6:	4241           	clr.w d1
     be8:	4841           	swap d1
     bea:	3541 0092      	move.w d1,146(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     bee:	3540 0096      	move.w d0,150(a2)
     bf2:	4fef 000c      	lea 12(sp),sp
}
     bf6:	242d ffb8      	move.l -72(a5),d2
     bfa:	246d ffbc      	movea.l -68(a5),a2
     bfe:	4e5d           	unlk a5
     c00:	4e75           	rts
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
     c02:	0c79 0001 0000 	cmpi.w #1,3216 <Zoom_Mousepressed>
     c08:	3216 
     c0a:	6700 fc5e      	beq.w 86a <Zoom_VblankHandler+0x50>
      if( Zoom_LevelOf102Zoom <= 2) {
     c0e:	3239 0000 322a 	move.w 322a <Zoom_LevelOf102Zoom>,d1
  DrawBuffer = ViewBuffer;
     c14:	2039 0000 3220 	move.l 3220 <ViewBuffer>,d0
      if( Zoom_LevelOf102Zoom <= 2) {
     c1a:	0c41 0002      	cmpi.w #2,d1
     c1e:	6300 fc6c      	bls.w 88c <Zoom_VblankHandler+0x72>
        Zoom_LevelOf102Zoom-=2;
     c22:	3239 0000 322a 	move.w 322a <Zoom_LevelOf102Zoom>,d1
     c28:	5541           	subq.w #2,d1
     c2a:	33c1 0000 322a 	move.w d1,322a <Zoom_LevelOf102Zoom>
     c30:	2400           	move.l d0,d2
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
     c32:	3039 0000 322a 	move.w 322a <Zoom_LevelOf102Zoom>,d0
  UWORD *values4shift = Values4Shift+levelofshrink*108;
     c38:	c0fc 00d8      	mulu.w #216,d0
     c3c:	2040           	movea.l d0,a0
     c3e:	d1fc 0000 2314 	adda.l #8980,a0
    *copperlist = *values4shift++;
     c44:	3550 012a      	move.w (a0),298(a2)
     c48:	3568 0002 012e 	move.w 2(a0),302(a2)
     c4e:	3568 0004 0132 	move.w 4(a0),306(a2)
     c54:	3568 0006 0136 	move.w 6(a0),310(a2)
     c5a:	3568 0008 013a 	move.w 8(a0),314(a2)
     c60:	3568 000a 013e 	move.w 10(a0),318(a2)
  *copperlist++ = *values4shift++;
     c66:	3568 000c 0140 	move.w 12(a0),320(a2)
  *copperlist = *values4shift++;
     c6c:	3568 000e 0142 	move.w 14(a0),322(a2)
    *copperlist = *values4shift++;
     c72:	3568 0010 0146 	move.w 16(a0),326(a2)
     c78:	3568 0012 014a 	move.w 18(a0),330(a2)
     c7e:	3568 0014 014e 	move.w 20(a0),334(a2)
     c84:	3568 0016 0152 	move.w 22(a0),338(a2)
     c8a:	3568 0018 0156 	move.w 24(a0),342(a2)
     c90:	3568 001a 015a 	move.w 26(a0),346(a2)
     c96:	3568 001c 015e 	move.w 28(a0),350(a2)
     c9c:	3568 001e 0162 	move.w 30(a0),354(a2)
     ca2:	3568 0020 0166 	move.w 32(a0),358(a2)
     ca8:	3568 0022 016a 	move.w 34(a0),362(a2)
  *copperlist++ = *values4shift++;
     cae:	3568 0024 016c 	move.w 36(a0),364(a2)
  *copperlist = *values4shift++;
     cb4:	3568 0026 016e 	move.w 38(a0),366(a2)
    *copperlist = *values4shift++;
     cba:	3568 0028 0172 	move.w 40(a0),370(a2)
     cc0:	3568 002a 0176 	move.w 42(a0),374(a2)
     cc6:	3568 002c 017a 	move.w 44(a0),378(a2)
     ccc:	3568 002e 017e 	move.w 46(a0),382(a2)
     cd2:	3568 0030 0182 	move.w 48(a0),386(a2)
     cd8:	3568 0032 0186 	move.w 50(a0),390(a2)
     cde:	3568 0034 018a 	move.w 52(a0),394(a2)
    *copperlist = *values4shift++;
     ce4:	3568 0036 01a2 	move.w 54(a0),418(a2)
     cea:	3568 0038 01a6 	move.w 56(a0),422(a2)
     cf0:	3568 003a 01aa 	move.w 58(a0),426(a2)
     cf6:	3568 003c 01ae 	move.w 60(a0),430(a2)
     cfc:	3568 003e 01b2 	move.w 62(a0),434(a2)
     d02:	3568 0040 01b6 	move.w 64(a0),438(a2)
  *copperlist++ = *values4shift++;
     d08:	3568 0042 01b8 	move.w 66(a0),440(a2)
  *copperlist = *values4shift++;
     d0e:	3568 0044 01ba 	move.w 68(a0),442(a2)
    *copperlist = *values4shift++;
     d14:	3568 0046 01be 	move.w 70(a0),446(a2)
     d1a:	3568 0048 01c2 	move.w 72(a0),450(a2)
     d20:	3568 004a 01c6 	move.w 74(a0),454(a2)
     d26:	3568 004c 01ca 	move.w 76(a0),458(a2)
     d2c:	3568 004e 01ce 	move.w 78(a0),462(a2)
     d32:	3568 0050 01d2 	move.w 80(a0),466(a2)
     d38:	3568 0052 01d6 	move.w 82(a0),470(a2)
     d3e:	3568 0054 01da 	move.w 84(a0),474(a2)
     d44:	3568 0056 01de 	move.w 86(a0),478(a2)
     d4a:	3568 0058 01e2 	move.w 88(a0),482(a2)
  *copperlist++ = *values4shift++;
     d50:	3568 005a 01e4 	move.w 90(a0),484(a2)
  *copperlist = *values4shift++;
     d56:	3568 005c 01e6 	move.w 92(a0),486(a2)
    *copperlist = *values4shift++;
     d5c:	3568 005e 01ea 	move.w 94(a0),490(a2)
     d62:	3568 0060 01ee 	move.w 96(a0),494(a2)
     d68:	3568 0062 01f2 	move.w 98(a0),498(a2)
     d6e:	3568 0064 01f6 	move.w 100(a0),502(a2)
     d74:	3568 0066 01fa 	move.w 102(a0),506(a2)
     d7a:	3568 0068 01fe 	move.w 104(a0),510(a2)
     d80:	3568 006a 0202 	move.w 106(a0),514(a2)
    *copperlist = *values4shift++;
     d86:	3568 006c 0212 	move.w 108(a0),530(a2)
     d8c:	3568 006e 0216 	move.w 110(a0),534(a2)
     d92:	3568 0070 021a 	move.w 112(a0),538(a2)
     d98:	3568 0072 021e 	move.w 114(a0),542(a2)
     d9e:	3568 0074 0222 	move.w 116(a0),546(a2)
     da4:	3568 0076 0226 	move.w 118(a0),550(a2)
  *copperlist++ = *values4shift++;
     daa:	3568 0078 0228 	move.w 120(a0),552(a2)
  *copperlist = *values4shift++;
     db0:	3568 007a 022a 	move.w 122(a0),554(a2)
    *copperlist = *values4shift++;
     db6:	3568 007c 022e 	move.w 124(a0),558(a2)
     dbc:	3568 007e 0232 	move.w 126(a0),562(a2)
     dc2:	3568 0080 0236 	move.w 128(a0),566(a2)
     dc8:	3568 0082 023a 	move.w 130(a0),570(a2)
     dce:	3568 0084 023e 	move.w 132(a0),574(a2)
     dd4:	3568 0086 0242 	move.w 134(a0),578(a2)
     dda:	3568 0088 0246 	move.w 136(a0),582(a2)
     de0:	3568 008a 024a 	move.w 138(a0),586(a2)
     de6:	3568 008c 024e 	move.w 140(a0),590(a2)
     dec:	3568 008e 0252 	move.w 142(a0),594(a2)
  *copperlist++ = *values4shift++;
     df2:	3568 0090 0254 	move.w 144(a0),596(a2)
  *copperlist = *values4shift++;
     df8:	3568 0092 0256 	move.w 146(a0),598(a2)
    *copperlist = *values4shift++;
     dfe:	3568 0094 025a 	move.w 148(a0),602(a2)
     e04:	3568 0096 025e 	move.w 150(a0),606(a2)
     e0a:	3568 0098 0262 	move.w 152(a0),610(a2)
     e10:	3568 009a 0266 	move.w 154(a0),614(a2)
     e16:	3568 009c 026a 	move.w 156(a0),618(a2)
     e1c:	3568 009e 026e 	move.w 158(a0),622(a2)
     e22:	3568 00a0 0272 	move.w 160(a0),626(a2)
    *copperlist = *values4shift++;
     e28:	3568 00a2 0282 	move.w 162(a0),642(a2)
     e2e:	3568 00a4 0286 	move.w 164(a0),646(a2)
     e34:	3568 00a6 028a 	move.w 166(a0),650(a2)
     e3a:	3568 00a8 028e 	move.w 168(a0),654(a2)
     e40:	3568 00aa 0292 	move.w 170(a0),658(a2)
     e46:	3568 00ac 0296 	move.w 172(a0),662(a2)
  *copperlist++ = *values4shift++;
     e4c:	3568 00ae 0298 	move.w 174(a0),664(a2)
  *copperlist = *values4shift++;
     e52:	3568 00b0 029a 	move.w 176(a0),666(a2)
    *copperlist = *values4shift++;
     e58:	3568 00b2 029e 	move.w 178(a0),670(a2)
     e5e:	3568 00b4 02a2 	move.w 180(a0),674(a2)
     e64:	3568 00b6 02a6 	move.w 182(a0),678(a2)
     e6a:	3568 00b8 02aa 	move.w 184(a0),682(a2)
     e70:	3568 00ba 02ae 	move.w 186(a0),686(a2)
     e76:	3568 00bc 02b2 	move.w 188(a0),690(a2)
     e7c:	3568 00be 02b6 	move.w 190(a0),694(a2)
     e82:	3568 00c0 02ba 	move.w 192(a0),698(a2)
     e88:	3568 00c2 02be 	move.w 194(a0),702(a2)
     e8e:	3568 00c4 02c2 	move.w 196(a0),706(a2)
  *copperlist++ = *values4shift++;
     e94:	3568 00c6 02c4 	move.w 198(a0),708(a2)
  *copperlist = *values4shift++;
     e9a:	3568 00c8 02c6 	move.w 200(a0),710(a2)
    *copperlist = *values4shift++;
     ea0:	3568 00ca 02ca 	move.w 202(a0),714(a2)
     ea6:	3568 00cc 02ce 	move.w 204(a0),718(a2)
     eac:	3568 00ce 02d2 	move.w 206(a0),722(a2)
     eb2:	3568 00d0 02d6 	move.w 208(a0),726(a2)
     eb8:	3568 00d2 02da 	move.w 210(a0),730(a2)
     ebe:	3568 00d4 02de 	move.w 212(a0),734(a2)
     ec4:	3568 00d6 02e2 	move.w 214(a0),738(a2)
  int zoomoffset[] = { 126, 105, 105, 105, 84, 84, 84, 63, 63, 42, 42, 42, 21, 21, 0, 0 };
     eca:	4878 0040      	pea 40 <_start+0x40>
     ece:	4879 0000 19a4 	pea 19a4 <noadditionalchar+0x16>
     ed4:	486d ffc0      	pea -64(a5)
     ed8:	4eba 0588      	jsr 1462 <memcpy>(pc)
  ULONG plane2set = buffer + zoomoffset[Zoom_LevelOf102Zoom];//+1;
     edc:	3039 0000 322a 	move.w 322a <Zoom_LevelOf102Zoom>,d0
     ee2:	0280 0000 ffff 	andi.l #65535,d0
     ee8:	d080           	add.l d0,d0
     eea:	d080           	add.l d0,d0
     eec:	2035 08c0      	move.l (-64,a5,d0.l),d0
     ef0:	d080           	add.l d0,d0
     ef2:	d082           	add.l d2,d0
    UWORD highword = (ULONG)plane2set >> 16;
     ef4:	2200           	move.l d0,d1
     ef6:	4241           	clr.w d1
     ef8:	4841           	swap d1
     efa:	3541 0072      	move.w d1,114(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     efe:	3540 0076      	move.w d0,118(a2)
    plane2set += 42*268; //Next plane
     f02:	2200           	move.l d0,d1
     f04:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
     f0a:	2401           	move.l d1,d2
     f0c:	4242           	clr.w d2
     f0e:	4842           	swap d2
     f10:	3542 007a      	move.w d2,122(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     f14:	3541 007e      	move.w d1,126(a2)
    plane2set += 42*268; //Next plane
     f18:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
     f1e:	2401           	move.l d1,d2
     f20:	4242           	clr.w d2
     f22:	4842           	swap d2
     f24:	3542 0082      	move.w d2,130(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     f28:	3541 0086      	move.w d1,134(a2)
    plane2set += 42*268; //Next plane
     f2c:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
     f32:	2401           	move.l d1,d2
     f34:	4242           	clr.w d2
     f36:	4842           	swap d2
     f38:	3542 008a      	move.w d2,138(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     f3c:	3541 008e      	move.w d1,142(a2)
    plane2set += 42*268; //Next plane
     f40:	0680 0000 afe0 	addi.l #45024,d0
    UWORD highword = (ULONG)plane2set >> 16;
     f46:	2200           	move.l d0,d1
     f48:	4241           	clr.w d1
     f4a:	4841           	swap d1
     f4c:	3541 0092      	move.w d1,146(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     f50:	3540 0096      	move.w d0,150(a2)
     f54:	4fef 000c      	lea 12(sp),sp
}
     f58:	242d ffb8      	move.l -72(a5),d2
     f5c:	246d ffbc      	movea.l -68(a5),a2
     f60:	4e5d           	unlk a5
     f62:	4e75           	rts
          Zoom_LevelOfZoom = 10;
     f64:	33fc 000a 0000 	move.w #10,3228 <Zoom_LevelOfZoom>
     f6a:	3228 
        Zoom_LevelOf102Zoom = 15;// MaxZoom102[ Zoom_LevelOfZoom] - 1;          
     f6c:	33fc 000f 0000 	move.w #15,322a <Zoom_LevelOf102Zoom>
     f72:	322a 
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
     f74:	3239 0000 3228 	move.w 3228 <Zoom_LevelOfZoom>,d1
  ULONG tmp = (ULONG) DrawBuffer;
     f7a:	2439 0000 338a 	move.l 338a <DrawBuffer>,d2
  DrawBuffer = ViewBuffer;
     f80:	23c0 0000 338a 	move.l d0,338a <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
     f86:	23c2 0000 3220 	move.l d2,3220 <ViewBuffer>
        Zoom_DrawPicture = 1;
     f8c:	7001           	moveq #1,d0
     f8e:	23c0 0000 2310 	move.l d0,2310 <Zoom_DrawPicture>
     f94:	6000 f93a      	bra.w 8d0 <Zoom_VblankHandler+0xb6>
    Zoom_Mousepressed = 0;
     f98:	4279 0000 3216 	clr.w 3216 <Zoom_Mousepressed>
     f9e:	6000 f8d8      	bra.w 878 <Zoom_VblankHandler+0x5e>

00000fa2 <ClbuildZoom>:
ULONG * ClbuildZoom() {
     fa2:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
     fa6:	2c79 0000 33a2 	movea.l 33a2 <SysBase>,a6
     fac:	203c 0000 031c 	move.l #796,d0
     fb2:	7202           	moveq #2,d1
     fb4:	4eae ff3a      	jsr -198(a6)
     fb8:	2440           	movea.l d0,a2
  if( retval == 0) {
     fba:	4a80           	tst.l d0
     fbc:	6700 01ea      	beq.w 11a8 <ClbuildZoom+0x206>
    *cl++ = *clpartinstruction++;
     fc0:	24b9 0000 22cc 	move.l 22cc <ClsSprites>,(a2)
     fc6:	2579 0000 22d0 	move.l 22d0 <ClsSprites+0x4>,4(a2)
     fcc:	0004 
     fce:	2579 0000 22d4 	move.l 22d4 <ClsSprites+0x8>,8(a2)
     fd4:	0008 
     fd6:	2579 0000 22d8 	move.l 22d8 <ClsSprites+0xc>,12(a2)
     fdc:	000c 
     fde:	2579 0000 22dc 	move.l 22dc <ClsSprites+0x10>,16(a2)
     fe4:	0010 
     fe6:	2579 0000 22e0 	move.l 22e0 <ClsSprites+0x14>,20(a2)
     fec:	0014 
     fee:	2579 0000 22e4 	move.l 22e4 <ClsSprites+0x18>,24(a2)
     ff4:	0018 
     ff6:	2579 0000 22e8 	move.l 22e8 <ClsSprites+0x1c>,28(a2)
     ffc:	001c 
     ffe:	2579 0000 22ec 	move.l 22ec <ClsSprites+0x20>,32(a2)
    1004:	0020 
    1006:	2579 0000 22f0 	move.l 22f0 <ClsSprites+0x24>,36(a2)
    100c:	0024 
    100e:	2579 0000 22f4 	move.l 22f4 <ClsSprites+0x28>,40(a2)
    1014:	0028 
    1016:	2579 0000 22f8 	move.l 22f8 <ClsSprites+0x2c>,44(a2)
    101c:	002c 
    101e:	2579 0000 22fc 	move.l 22fc <ClsSprites+0x30>,48(a2)
    1024:	0030 
    1026:	2579 0000 2300 	move.l 2300 <ClsSprites+0x34>,52(a2)
    102c:	0034 
    102e:	2579 0000 2304 	move.l 2304 <ClsSprites+0x38>,56(a2)
    1034:	0038 
    1036:	2579 0000 2308 	move.l 2308 <ClsSprites+0x3c>,60(a2)
    103c:	003c 
    *cl++ = *clpartinstruction++;
    103e:	2579 0000 229c 	move.l 229c <ClScreen>,64(a2)
    1044:	0040 
    1046:	2579 0000 22a0 	move.l 22a0 <ClScreen+0x4>,68(a2)
    104c:	0044 
    104e:	2579 0000 22a4 	move.l 22a4 <ClScreen+0x8>,72(a2)
    1054:	0048 
    1056:	2579 0000 22a8 	move.l 22a8 <ClScreen+0xc>,76(a2)
    105c:	004c 
    105e:	2579 0000 22ac 	move.l 22ac <ClScreen+0x10>,80(a2)
    1064:	0050 
    1066:	2579 0000 22b0 	move.l 22b0 <ClScreen+0x14>,84(a2)
    106c:	0054 
    106e:	2579 0000 22b4 	move.l 22b4 <ClScreen+0x18>,88(a2)
    1074:	0058 
    1076:	2579 0000 22b8 	move.l 22b8 <ClScreen+0x1c>,92(a2)
    107c:	005c 
    107e:	2579 0000 22bc 	move.l 22bc <ClScreen+0x20>,96(a2)
    1084:	0060 
    1086:	2579 0000 22c0 	move.l 22c0 <ClScreen+0x24>,100(a2)
    108c:	0064 
    108e:	2579 0000 22c4 	move.l 22c4 <ClScreen+0x28>,104(a2)
    1094:	0068 
    1096:	2579 0000 22c8 	move.l 22c8 <ClScreen+0x2c>,108(a2)
    109c:	006c 
  *cl++ = 0x00e00000;
    109e:	257c 00e0 0000 	move.l #14680064,112(a2)
    10a4:	0070 
  *cl++ = 0x00e20000;
    10a6:	257c 00e2 0000 	move.l #14811136,116(a2)
    10ac:	0074 
  *cl++ = 0x00e40000;
    10ae:	257c 00e4 0000 	move.l #14942208,120(a2)
    10b4:	0078 
  *cl++ = 0x00e60000;
    10b6:	257c 00e6 0000 	move.l #15073280,124(a2)
    10bc:	007c 
  *cl++ = 0x00e80000;
    10be:	257c 00e8 0000 	move.l #15204352,128(a2)
    10c4:	0080 
  *cl++ = 0x00ea0000;
    10c6:	257c 00ea 0000 	move.l #15335424,132(a2)
    10cc:	0084 
  *cl++ = 0x00ec0000;
    10ce:	257c 00ec 0000 	move.l #15466496,136(a2)
    10d4:	0088 
  *cl++ = 0x00ee0000;
    10d6:	257c 00ee 0000 	move.l #15597568,140(a2)
    10dc:	008c 
  *cl++ = 0x00f00000;
    10de:	257c 00f0 0000 	move.l #15728640,144(a2)
    10e4:	0090 
  *cl++ = 0x00f20000;
    10e6:	257c 00f2 0000 	move.l #15859712,148(a2)
    10ec:	0094 
  for(int i=0; i<32;i++)
    10ee:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
    10f2:	41f9 0000 221c 	lea 221c <ClColor>,a0
    *cl++ = *clpartinstruction++;
    10f8:	22d8           	move.l (a0)+,(a1)+
  for(int i=0; i<32;i++)
    10fa:	b1fc 0000 229c 	cmpa.l #8860,a0
    1100:	66f6           	bne.s 10f8 <ClbuildZoom+0x156>
  ULONG cop2 = cl+3;
    1102:	220a           	move.l a2,d1
    1104:	0681 0000 0124 	addi.l #292,d1
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
    110a:	2001           	move.l d1,d0
    110c:	4240           	clr.w d0
    110e:	4840           	swap d0
    1110:	0680 0084 0000 	addi.l #8650752,d0
    1116:	2540 0118      	move.l d0,280(a2)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
    111a:	2001           	move.l d1,d0
    111c:	0280 0000 ffff 	andi.l #65535,d0
    1122:	0680 0086 0000 	addi.l #8781824,d0
    1128:	2540 011c      	move.l d0,284(a2)
  *cl++ = 0x2c01ff00;
    112c:	257c 2c01 ff00 	move.l #738328320,288(a2)
    1132:	0120 
  ULONG cop2br1 = cop2 + ( (30)<<2);
    1134:	7078           	moveq #120,d0
    1136:	d081           	add.l d1,d0
  clpartinstruction[28] = 0x00840000 + ( cop2br1 >> 16);
    1138:	2400           	move.l d0,d2
    113a:	4242           	clr.w d2
    113c:	4842           	swap d2
    113e:	0682 0084 0000 	addi.l #8650752,d2
    1144:	23c2 0000 2070 	move.l d2,2070 <Cl102ZoomRepeat+0x70>
  clpartinstruction[29] = 0x00860000 + ( cop2br1 & 0xffff);
    114a:	0280 0000 ffff 	andi.l #65535,d0
    1150:	0680 0086 0000 	addi.l #8781824,d0
    1156:	23c0 0000 2074 	move.l d0,2074 <Cl102ZoomRepeat+0x74>
  clpartinstruction[84] = 0x00840000 + ( cop2br2 >> 16);
    115c:	200a           	move.l a2,d0
    115e:	0680 0000 027c 	addi.l #636,d0
    1164:	2400           	move.l d0,d2
    1166:	4242           	clr.w d2
    1168:	4842           	swap d2
    116a:	0682 0084 0000 	addi.l #8650752,d2
    1170:	23c2 0000 2150 	move.l d2,2150 <Cl102ZoomRepeat+0x150>
  clpartinstruction[85] = 0x00860000 + ( cop2br2 & 0xffff);
    1176:	0280 0000 ffff 	andi.l #65535,d0
    117c:	0680 0086 0000 	addi.l #8781824,d0
    1182:	23c0 0000 2154 	move.l d0,2154 <Cl102ZoomRepeat+0x154>
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    1188:	2241           	movea.l d1,a1
  clpartinstruction = Cl102ZoomRepeat;
    118a:	41f9 0000 2000 	lea 2000 <Cl102ZoomRepeat>,a0
    *cl++ = *clpartinstruction++;
    1190:	22d8           	move.l (a0)+,(a1)+
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    1192:	b1fc 0000 21c8 	cmpa.l #8648,a0
    1198:	66f6           	bne.s 1190 <ClbuildZoom+0x1ee>
   *cl++ = 0xfffffffe;
    119a:	70fe           	moveq #-2,d0
    119c:	2540 02ec      	move.l d0,748(a2)
}
    11a0:	200a           	move.l a2,d0
    11a2:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    11a6:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    11a8:	2c79 0000 339a 	movea.l 339a <DOSBase>,a6
    11ae:	4eae ffc4      	jsr -60(a6)
    11b2:	2c79 0000 339a 	movea.l 339a <DOSBase>,a6
    11b8:	2200           	move.l d0,d1
    11ba:	243c 0000 19e4 	move.l #6628,d2
    11c0:	7628           	moveq #40,d3
    11c2:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    11c6:	2c79 0000 339a 	movea.l 339a <DOSBase>,a6
    11cc:	7201           	moveq #1,d1
    11ce:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    11d2:	24b9 0000 22cc 	move.l 22cc <ClsSprites>,(a2)
    11d8:	2579 0000 22d0 	move.l 22d0 <ClsSprites+0x4>,4(a2)
    11de:	0004 
    11e0:	2579 0000 22d4 	move.l 22d4 <ClsSprites+0x8>,8(a2)
    11e6:	0008 
    11e8:	2579 0000 22d8 	move.l 22d8 <ClsSprites+0xc>,12(a2)
    11ee:	000c 
    11f0:	2579 0000 22dc 	move.l 22dc <ClsSprites+0x10>,16(a2)
    11f6:	0010 
    11f8:	2579 0000 22e0 	move.l 22e0 <ClsSprites+0x14>,20(a2)
    11fe:	0014 
    1200:	2579 0000 22e4 	move.l 22e4 <ClsSprites+0x18>,24(a2)
    1206:	0018 
    1208:	2579 0000 22e8 	move.l 22e8 <ClsSprites+0x1c>,28(a2)
    120e:	001c 
    1210:	2579 0000 22ec 	move.l 22ec <ClsSprites+0x20>,32(a2)
    1216:	0020 
    1218:	2579 0000 22f0 	move.l 22f0 <ClsSprites+0x24>,36(a2)
    121e:	0024 
    1220:	2579 0000 22f4 	move.l 22f4 <ClsSprites+0x28>,40(a2)
    1226:	0028 
    1228:	2579 0000 22f8 	move.l 22f8 <ClsSprites+0x2c>,44(a2)
    122e:	002c 
    1230:	2579 0000 22fc 	move.l 22fc <ClsSprites+0x30>,48(a2)
    1236:	0030 
    1238:	2579 0000 2300 	move.l 2300 <ClsSprites+0x34>,52(a2)
    123e:	0034 
    1240:	2579 0000 2304 	move.l 2304 <ClsSprites+0x38>,56(a2)
    1246:	0038 
    1248:	2579 0000 2308 	move.l 2308 <ClsSprites+0x3c>,60(a2)
    124e:	003c 
    *cl++ = *clpartinstruction++;
    1250:	2579 0000 229c 	move.l 229c <ClScreen>,64(a2)
    1256:	0040 
    1258:	2579 0000 22a0 	move.l 22a0 <ClScreen+0x4>,68(a2)
    125e:	0044 
    1260:	2579 0000 22a4 	move.l 22a4 <ClScreen+0x8>,72(a2)
    1266:	0048 
    1268:	2579 0000 22a8 	move.l 22a8 <ClScreen+0xc>,76(a2)
    126e:	004c 
    1270:	2579 0000 22ac 	move.l 22ac <ClScreen+0x10>,80(a2)
    1276:	0050 
    1278:	2579 0000 22b0 	move.l 22b0 <ClScreen+0x14>,84(a2)
    127e:	0054 
    1280:	2579 0000 22b4 	move.l 22b4 <ClScreen+0x18>,88(a2)
    1286:	0058 
    1288:	2579 0000 22b8 	move.l 22b8 <ClScreen+0x1c>,92(a2)
    128e:	005c 
    1290:	2579 0000 22bc 	move.l 22bc <ClScreen+0x20>,96(a2)
    1296:	0060 
    1298:	2579 0000 22c0 	move.l 22c0 <ClScreen+0x24>,100(a2)
    129e:	0064 
    12a0:	2579 0000 22c4 	move.l 22c4 <ClScreen+0x28>,104(a2)
    12a6:	0068 
    12a8:	2579 0000 22c8 	move.l 22c8 <ClScreen+0x2c>,108(a2)
    12ae:	006c 
  *cl++ = 0x00e00000;
    12b0:	257c 00e0 0000 	move.l #14680064,112(a2)
    12b6:	0070 
  *cl++ = 0x00e20000;
    12b8:	257c 00e2 0000 	move.l #14811136,116(a2)
    12be:	0074 
  *cl++ = 0x00e40000;
    12c0:	257c 00e4 0000 	move.l #14942208,120(a2)
    12c6:	0078 
  *cl++ = 0x00e60000;
    12c8:	257c 00e6 0000 	move.l #15073280,124(a2)
    12ce:	007c 
  *cl++ = 0x00e80000;
    12d0:	257c 00e8 0000 	move.l #15204352,128(a2)
    12d6:	0080 
  *cl++ = 0x00ea0000;
    12d8:	257c 00ea 0000 	move.l #15335424,132(a2)
    12de:	0084 
  *cl++ = 0x00ec0000;
    12e0:	257c 00ec 0000 	move.l #15466496,136(a2)
    12e6:	0088 
  *cl++ = 0x00ee0000;
    12e8:	257c 00ee 0000 	move.l #15597568,140(a2)
    12ee:	008c 
  *cl++ = 0x00f00000;
    12f0:	257c 00f0 0000 	move.l #15728640,144(a2)
    12f6:	0090 
  *cl++ = 0x00f20000;
    12f8:	257c 00f2 0000 	move.l #15859712,148(a2)
    12fe:	0094 
  for(int i=0; i<32;i++)
    1300:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
    1304:	41f9 0000 221c 	lea 221c <ClColor>,a0
    130a:	6000 fdec      	bra.w 10f8 <ClbuildZoom+0x156>

0000130e <KPrintF>:
{
    130e:	4fef ff80      	lea -128(sp),sp
    1312:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    1316:	3039 00f0 ff60 	move.w f0ff60 <gcc8_c_support.c.f93356b9+0xf063ec>,d0
    131c:	0c40 4eb9      	cmpi.w #20153,d0
    1320:	672a           	beq.s 134c <KPrintF+0x3e>
    1322:	0c40 a00e      	cmpi.w #-24562,d0
    1326:	6724           	beq.s 134c <KPrintF+0x3e>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
    1328:	2c79 0000 33a2 	movea.l 33a2 <SysBase>,a6
    132e:	206f 0090      	movea.l 144(sp),a0
    1332:	43ef 0094      	lea 148(sp),a1
    1336:	45f9 0000 16a2 	lea 16a2 <KPutCharX>,a2
    133c:	97cb           	suba.l a3,a3
    133e:	4eae fdf6      	jsr -522(a6)
}
    1342:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    1346:	4fef 0080      	lea 128(sp),sp
    134a:	4e75           	rts
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
    134c:	2c79 0000 33a2 	movea.l 33a2 <SysBase>,a6
    1352:	206f 0090      	movea.l 144(sp),a0
    1356:	43ef 0094      	lea 148(sp),a1
    135a:	45f9 0000 16b0 	lea 16b0 <PutChar>,a2
    1360:	47ef 000c      	lea 12(sp),a3
    1364:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    1368:	2f0b           	move.l a3,-(sp)
    136a:	4878 0056      	pea 56 <_start+0x56>
    136e:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.f93356b9+0xf063ec>
    1374:	508f           	addq.l #8,sp
}
    1376:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    137a:	4fef 0080      	lea 128(sp),sp
    137e:	4e75           	rts

00001380 <strlen>:
{
    1380:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    1384:	7000           	moveq #0,d0
	while(*s++)
    1386:	4a10           	tst.b (a0)
    1388:	6708           	beq.s 1392 <strlen+0x12>
		t++;
    138a:	5280           	addq.l #1,d0
	while(*s++)
    138c:	4a30 0800      	tst.b (0,a0,d0.l)
    1390:	66f8           	bne.s 138a <strlen+0xa>
}
    1392:	4e75           	rts

00001394 <memset>:
{
    1394:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    1398:	202f 0024      	move.l 36(sp),d0
    139c:	282f 0028      	move.l 40(sp),d4
    13a0:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    13a4:	2a09           	move.l a1,d5
    13a6:	5385           	subq.l #1,d5
    13a8:	b2fc 0000      	cmpa.w #0,a1
    13ac:	6700 00ae      	beq.w 145c <memset+0xc8>
		*ptr++ = val;
    13b0:	1e04           	move.b d4,d7
    13b2:	2200           	move.l d0,d1
    13b4:	4481           	neg.l d1
    13b6:	7403           	moveq #3,d2
    13b8:	c282           	and.l d2,d1
    13ba:	7c05           	moveq #5,d6
    13bc:	2440           	movea.l d0,a2
    13be:	bc85           	cmp.l d5,d6
    13c0:	646a           	bcc.s 142c <memset+0x98>
    13c2:	4a81           	tst.l d1
    13c4:	6724           	beq.s 13ea <memset+0x56>
    13c6:	14c4           	move.b d4,(a2)+
	while(len-- > 0)
    13c8:	5385           	subq.l #1,d5
    13ca:	7401           	moveq #1,d2
    13cc:	b481           	cmp.l d1,d2
    13ce:	671a           	beq.s 13ea <memset+0x56>
		*ptr++ = val;
    13d0:	2440           	movea.l d0,a2
    13d2:	548a           	addq.l #2,a2
    13d4:	2040           	movea.l d0,a0
    13d6:	1144 0001      	move.b d4,1(a0)
	while(len-- > 0)
    13da:	5385           	subq.l #1,d5
    13dc:	7403           	moveq #3,d2
    13de:	b481           	cmp.l d1,d2
    13e0:	6608           	bne.s 13ea <memset+0x56>
		*ptr++ = val;
    13e2:	528a           	addq.l #1,a2
    13e4:	1144 0002      	move.b d4,2(a0)
	while(len-- > 0)
    13e8:	5385           	subq.l #1,d5
    13ea:	2609           	move.l a1,d3
    13ec:	9681           	sub.l d1,d3
    13ee:	7c00           	moveq #0,d6
    13f0:	1c04           	move.b d4,d6
    13f2:	2406           	move.l d6,d2
    13f4:	4842           	swap d2
    13f6:	4242           	clr.w d2
    13f8:	2042           	movea.l d2,a0
    13fa:	2404           	move.l d4,d2
    13fc:	e14a           	lsl.w #8,d2
    13fe:	4842           	swap d2
    1400:	4242           	clr.w d2
    1402:	e18e           	lsl.l #8,d6
    1404:	2646           	movea.l d6,a3
    1406:	2c08           	move.l a0,d6
    1408:	8486           	or.l d6,d2
    140a:	2c0b           	move.l a3,d6
    140c:	8486           	or.l d6,d2
    140e:	1407           	move.b d7,d2
    1410:	2040           	movea.l d0,a0
    1412:	d1c1           	adda.l d1,a0
    1414:	72fc           	moveq #-4,d1
    1416:	c283           	and.l d3,d1
    1418:	d288           	add.l a0,d1
		*ptr++ = val;
    141a:	20c2           	move.l d2,(a0)+
	while(len-- > 0)
    141c:	b1c1           	cmpa.l d1,a0
    141e:	66fa           	bne.s 141a <memset+0x86>
    1420:	72fc           	moveq #-4,d1
    1422:	c283           	and.l d3,d1
    1424:	d5c1           	adda.l d1,a2
    1426:	9a81           	sub.l d1,d5
    1428:	b283           	cmp.l d3,d1
    142a:	6730           	beq.s 145c <memset+0xc8>
		*ptr++ = val;
    142c:	1484           	move.b d4,(a2)
	while(len-- > 0)
    142e:	4a85           	tst.l d5
    1430:	672a           	beq.s 145c <memset+0xc8>
		*ptr++ = val;
    1432:	1544 0001      	move.b d4,1(a2)
	while(len-- > 0)
    1436:	7201           	moveq #1,d1
    1438:	b285           	cmp.l d5,d1
    143a:	6720           	beq.s 145c <memset+0xc8>
		*ptr++ = val;
    143c:	1544 0002      	move.b d4,2(a2)
	while(len-- > 0)
    1440:	7402           	moveq #2,d2
    1442:	b485           	cmp.l d5,d2
    1444:	6716           	beq.s 145c <memset+0xc8>
		*ptr++ = val;
    1446:	1544 0003      	move.b d4,3(a2)
	while(len-- > 0)
    144a:	7c03           	moveq #3,d6
    144c:	bc85           	cmp.l d5,d6
    144e:	670c           	beq.s 145c <memset+0xc8>
		*ptr++ = val;
    1450:	1544 0004      	move.b d4,4(a2)
	while(len-- > 0)
    1454:	5985           	subq.l #4,d5
    1456:	6704           	beq.s 145c <memset+0xc8>
		*ptr++ = val;
    1458:	1544 0005      	move.b d4,5(a2)
}
    145c:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    1460:	4e75           	rts

00001462 <memcpy>:
{
    1462:	48e7 3e00      	movem.l d2-d6,-(sp)
    1466:	202f 0018      	move.l 24(sp),d0
    146a:	222f 001c      	move.l 28(sp),d1
    146e:	262f 0020      	move.l 32(sp),d3
	while(len--)
    1472:	2803           	move.l d3,d4
    1474:	5384           	subq.l #1,d4
    1476:	4a83           	tst.l d3
    1478:	675e           	beq.s 14d8 <memcpy+0x76>
    147a:	2041           	movea.l d1,a0
    147c:	5288           	addq.l #1,a0
    147e:	2400           	move.l d0,d2
    1480:	9488           	sub.l a0,d2
    1482:	7a02           	moveq #2,d5
    1484:	ba82           	cmp.l d2,d5
    1486:	55c2           	sc.s d2
    1488:	4402           	neg.b d2
    148a:	7c08           	moveq #8,d6
    148c:	bc84           	cmp.l d4,d6
    148e:	55c5           	sc.s d5
    1490:	4405           	neg.b d5
    1492:	c405           	and.b d5,d2
    1494:	6748           	beq.s 14de <memcpy+0x7c>
    1496:	2400           	move.l d0,d2
    1498:	8481           	or.l d1,d2
    149a:	7a03           	moveq #3,d5
    149c:	c485           	and.l d5,d2
    149e:	663e           	bne.s 14de <memcpy+0x7c>
    14a0:	2041           	movea.l d1,a0
    14a2:	2240           	movea.l d0,a1
    14a4:	74fc           	moveq #-4,d2
    14a6:	c483           	and.l d3,d2
    14a8:	d481           	add.l d1,d2
		*d++ = *s++;
    14aa:	22d8           	move.l (a0)+,(a1)+
	while(len--)
    14ac:	b488           	cmp.l a0,d2
    14ae:	66fa           	bne.s 14aa <memcpy+0x48>
    14b0:	74fc           	moveq #-4,d2
    14b2:	c483           	and.l d3,d2
    14b4:	2040           	movea.l d0,a0
    14b6:	d1c2           	adda.l d2,a0
    14b8:	d282           	add.l d2,d1
    14ba:	9882           	sub.l d2,d4
    14bc:	b483           	cmp.l d3,d2
    14be:	6718           	beq.s 14d8 <memcpy+0x76>
		*d++ = *s++;
    14c0:	2241           	movea.l d1,a1
    14c2:	1091           	move.b (a1),(a0)
	while(len--)
    14c4:	4a84           	tst.l d4
    14c6:	6710           	beq.s 14d8 <memcpy+0x76>
		*d++ = *s++;
    14c8:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    14ce:	5384           	subq.l #1,d4
    14d0:	6706           	beq.s 14d8 <memcpy+0x76>
		*d++ = *s++;
    14d2:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    14d8:	4cdf 007c      	movem.l (sp)+,d2-d6
    14dc:	4e75           	rts
    14de:	2240           	movea.l d0,a1
    14e0:	d283           	add.l d3,d1
		*d++ = *s++;
    14e2:	12e8 ffff      	move.b -1(a0),(a1)+
	while(len--)
    14e6:	b288           	cmp.l a0,d1
    14e8:	67ee           	beq.s 14d8 <memcpy+0x76>
    14ea:	5288           	addq.l #1,a0
    14ec:	60f4           	bra.s 14e2 <memcpy+0x80>

000014ee <memmove>:
{
    14ee:	48e7 3c20      	movem.l d2-d5/a2,-(sp)
    14f2:	202f 0018      	move.l 24(sp),d0
    14f6:	222f 001c      	move.l 28(sp),d1
    14fa:	242f 0020      	move.l 32(sp),d2
		while (len--)
    14fe:	2242           	movea.l d2,a1
    1500:	5389           	subq.l #1,a1
	if (d < s) {
    1502:	b280           	cmp.l d0,d1
    1504:	636c           	bls.s 1572 <memmove+0x84>
		while (len--)
    1506:	4a82           	tst.l d2
    1508:	6762           	beq.s 156c <memmove+0x7e>
    150a:	2441           	movea.l d1,a2
    150c:	528a           	addq.l #1,a2
    150e:	2600           	move.l d0,d3
    1510:	968a           	sub.l a2,d3
    1512:	7802           	moveq #2,d4
    1514:	b883           	cmp.l d3,d4
    1516:	55c3           	sc.s d3
    1518:	4403           	neg.b d3
    151a:	7a08           	moveq #8,d5
    151c:	ba89           	cmp.l a1,d5
    151e:	55c4           	sc.s d4
    1520:	4404           	neg.b d4
    1522:	c604           	and.b d4,d3
    1524:	6770           	beq.s 1596 <memmove+0xa8>
    1526:	2600           	move.l d0,d3
    1528:	8681           	or.l d1,d3
    152a:	7803           	moveq #3,d4
    152c:	c684           	and.l d4,d3
    152e:	6666           	bne.s 1596 <memmove+0xa8>
    1530:	2041           	movea.l d1,a0
    1532:	2440           	movea.l d0,a2
    1534:	76fc           	moveq #-4,d3
    1536:	c682           	and.l d2,d3
    1538:	d681           	add.l d1,d3
			*d++ = *s++;
    153a:	24d8           	move.l (a0)+,(a2)+
		while (len--)
    153c:	b688           	cmp.l a0,d3
    153e:	66fa           	bne.s 153a <memmove+0x4c>
    1540:	76fc           	moveq #-4,d3
    1542:	c682           	and.l d2,d3
    1544:	2440           	movea.l d0,a2
    1546:	d5c3           	adda.l d3,a2
    1548:	2041           	movea.l d1,a0
    154a:	d1c3           	adda.l d3,a0
    154c:	93c3           	suba.l d3,a1
    154e:	b682           	cmp.l d2,d3
    1550:	671a           	beq.s 156c <memmove+0x7e>
			*d++ = *s++;
    1552:	1490           	move.b (a0),(a2)
		while (len--)
    1554:	b2fc 0000      	cmpa.w #0,a1
    1558:	6712           	beq.s 156c <memmove+0x7e>
			*d++ = *s++;
    155a:	1568 0001 0001 	move.b 1(a0),1(a2)
		while (len--)
    1560:	7a01           	moveq #1,d5
    1562:	ba89           	cmp.l a1,d5
    1564:	6706           	beq.s 156c <memmove+0x7e>
			*d++ = *s++;
    1566:	1568 0002 0002 	move.b 2(a0),2(a2)
}
    156c:	4cdf 043c      	movem.l (sp)+,d2-d5/a2
    1570:	4e75           	rts
		const char *lasts = s + (len - 1);
    1572:	41f1 1800      	lea (0,a1,d1.l),a0
		char *lastd = d + (len - 1);
    1576:	d3c0           	adda.l d0,a1
		while (len--)
    1578:	4a82           	tst.l d2
    157a:	67f0           	beq.s 156c <memmove+0x7e>
    157c:	2208           	move.l a0,d1
    157e:	9282           	sub.l d2,d1
			*lastd-- = *lasts--;
    1580:	1290           	move.b (a0),(a1)
		while (len--)
    1582:	5388           	subq.l #1,a0
    1584:	5389           	subq.l #1,a1
    1586:	b288           	cmp.l a0,d1
    1588:	67e2           	beq.s 156c <memmove+0x7e>
			*lastd-- = *lasts--;
    158a:	1290           	move.b (a0),(a1)
		while (len--)
    158c:	5388           	subq.l #1,a0
    158e:	5389           	subq.l #1,a1
    1590:	b288           	cmp.l a0,d1
    1592:	66ec           	bne.s 1580 <memmove+0x92>
    1594:	60d6           	bra.s 156c <memmove+0x7e>
    1596:	2240           	movea.l d0,a1
    1598:	d282           	add.l d2,d1
			*d++ = *s++;
    159a:	12ea ffff      	move.b -1(a2),(a1)+
		while (len--)
    159e:	b28a           	cmp.l a2,d1
    15a0:	67ca           	beq.s 156c <memmove+0x7e>
    15a2:	528a           	addq.l #1,a2
    15a4:	60f4           	bra.s 159a <memmove+0xac>
    15a6:	4e71           	nop

000015a8 <__mulsi3>:
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    15a8:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    15ac:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    15b0:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    15b4:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    15b8:	d041           	add.w d1,d0
	swap	d0
    15ba:	4840           	swap d0
	clrw	d0
    15bc:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    15be:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    15c2:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    15c6:	d081           	add.l d1,d0
	rts
    15c8:	4e75           	rts

000015ca <__udivsi3>:
	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	.cfi_startproc
	movel	d2, sp@-
    15ca:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    15cc:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    15d0:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    15d4:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    15da:	6416           	bcc.s 15f2 <__udivsi3+0x28>
	movel	d0, d2
    15dc:	2400           	move.l d0,d2
	clrw	d2
    15de:	4242           	clr.w d2
	swap	d2
    15e0:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    15e2:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    15e4:	3002           	move.w d2,d0
	swap	d0
    15e6:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    15e8:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    15ec:	84c1           	divu.w d1,d2
	movew	d2, d0
    15ee:	3002           	move.w d2,d0
	jra	6f
    15f0:	6030           	bra.s 1622 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    15f2:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    15f4:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    15f6:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    15f8:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    15fe:	64f4           	bcc.s 15f4 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    1600:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    1602:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    1608:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    160a:	c2c0           	mulu.w d0,d1
	swap	d2
    160c:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    160e:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    1610:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    1612:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    1614:	660a           	bne.s 1620 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    1616:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    1618:	6506           	bcs.s 1620 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    161a:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    161e:	6302           	bls.s 1622 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    1620:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    1622:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    1624:	4e75           	rts

00001626 <__divsi3>:
	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	.cfi_startproc
	movel	d2, sp@-
    1626:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    1628:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    162a:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    162e:	6a04           	bpl.s 1634 <__divsi3+0xe>
	negl	d1
    1630:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    1632:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    1634:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    1638:	6a04           	bpl.s 163e <__divsi3+0x18>
	negl	d0
    163a:	4480           	neg.l d0
	negb	d2
    163c:	4402           	neg.b d2

2:	movel	d1, sp@-
    163e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1640:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    1642:	6186           	bsr.s 15ca <__udivsi3>
	addql	IMM (8), sp
    1644:	508f           	addq.l #8,sp

	tstb	d2
    1646:	4a02           	tst.b d2
	jpl	3f
    1648:	6a02           	bpl.s 164c <__divsi3+0x26>
	negl	d0
    164a:	4480           	neg.l d0

3:	movel	sp@+, d2
    164c:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    164e:	4e75           	rts

00001650 <__modsi3>:
	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    1650:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    1654:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    1658:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    165a:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__divsi3)
    165c:	61c8           	bsr.s 1626 <__divsi3>
	addql	IMM (8), sp
    165e:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    1660:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    1664:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    1666:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    1668:	6100 ff3e      	bsr.w 15a8 <__mulsi3>
	addql	IMM (8), sp
    166c:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    166e:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    1672:	9280           	sub.l d0,d1
	movel	d1, d0
    1674:	2001           	move.l d1,d0
	rts
    1676:	4e75           	rts

00001678 <__umodsi3>:
	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    1678:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    167c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    1680:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    1682:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__udivsi3)
    1684:	6100 ff44      	bsr.w 15ca <__udivsi3>
	addql	IMM (8), sp
    1688:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    168a:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    168e:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    1690:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    1692:	6100 ff14      	bsr.w 15a8 <__mulsi3>
	addql	IMM (8), sp
    1696:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    1698:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    169c:	9280           	sub.l d0,d1
	movel	d1, d0
    169e:	2001           	move.l d1,d0
	rts
    16a0:	4e75           	rts

000016a2 <KPutCharX>:
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
	.cfi_startproc
    move.l  a6, -(sp)
    16a2:	2f0e           	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    16a4:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    16a8:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    16ac:	2c5f           	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    16ae:	4e75           	rts

000016b0 <PutChar>:
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	.cfi_startproc
	move.b d0, (a3)+
    16b0:	16c0           	move.b d0,(a3)+
	rts
    16b2:	4e75           	rts

000016b4 <saveregs>:
	...

000016f0 <__DecompressLZ4>:

.text
	FUNC(__DecompressLZ4)
	.globl	SYM (__DecompressLZ4)
SYM (__DecompressLZ4):
  movem.l d0-d7/a0-a6, saveregs
    16f0:	48f9 7fff 0000 	movem.l d0-a6,16b4 <saveregs>
    16f6:	16b4 
  move.l sp@(4),a0  //packed buffer
    16f8:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a1  //output buffer
    16fc:	226f 0008      	movea.l 8(sp),a1
  move.l sp@(12),d0 //Textlocation
    1700:	202f 000c      	move.l 12(sp),d0

00001704 <lz4_depack>:

lz4_depack:
			clr.w   0x100
    1704:	4278 0100      	clr.w 100 <main+0x8c>
			lea		0(a0,d0.l),a4	//packed buffer end
    1708:	49f0 0800      	lea (0,a0,d0.l),a4

			moveq	#0,d0
    170c:	7000           	moveq #0,d0
			moveq	#0,d2
    170e:	7400           	moveq #0,d2
			moveq	#0,d3
    1710:	7600           	moveq #0,d3
			moveq	#15,d4
    1712:	780f           	moveq #15,d4
			moveq   #0,d5
    1714:	7a00           	moveq #0,d5
			bra.s	.tokenLoop
    1716:	6056           	bra.s 176e <.tokenLoop>

00001718 <.lenOffset>:
			
.lenOffset:	
            move.b	(a0)+,d1
    1718:	1218           	move.b (a0)+,d1
			move.b	(a0)+,-(sp)
    171a:	1f18           	move.b (a0)+,-(sp)
			move.w	(sp)+,d3
    171c:	361f           	move.w (sp)+,d3
			move.b	d1,d3
    171e:	1601           	move.b d1,d3
			movea.l	a1,a3
    1720:	2649           	movea.l a1,a3
			sub.l	d3,a3
    1722:	97c3           	suba.l d3,a3
			moveq	#0xf,d1
    1724:	720f           	moveq #15,d1
			and.w	d0,d1
    1726:	c240           	and.w d0,d1
			cmp.b	d4,d1
    1728:	b204           	cmp.b d4,d1
			bne.s	.small
    172a:	6614           	bne.s 1740 <.small>

0000172c <.readLen0>:

.readLen0:	move.b	(a0)+,d2
    172c:	1418           	move.b (a0)+,d2
			add.l	d2,d1
    172e:	d282           	add.l d2,d1
			not.b	d2
    1730:	4602           	not.b d2
			beq.s	.readLen0
    1732:	67f8           	beq.s 172c <.readLen0>

			addq.l	#4,d1
    1734:	5881           	addq.l #4,d1

00001736 <.copy>:
.copy:		move.b	(a3)+,(a1)+
    1736:	12db           	move.b (a3)+,(a1)+
			subq.l	#1,d1
    1738:	5381           	subq.l #1,d1
			bne.s	.copy
    173a:	66fa           	bne.s 1736 <.copy>
			bra		.tokenLoop
    173c:	6000 0030      	bra.w 176e <.tokenLoop>

00001740 <.small>:
			
.small:		add.w	d1,d1
    1740:	d241           	add.w d1,d1
			neg.w	d1
    1742:	4441           	neg.w d1
			jmp		.copys(pc,d1.w)
    1744:	4efb 1020      	jmp (1766 <.copys>,pc,d1.w)
			move.b	(a3)+,(a1)+
    1748:	12db           	move.b (a3)+,(a1)+
			move.b	(a3)+,(a1)+
    174a:	12db           	move.b (a3)+,(a1)+
			move.b	(a3)+,(a1)+
    174c:	12db           	move.b (a3)+,(a1)+
			move.b	(a3)+,(a1)+
    174e:	12db           	move.b (a3)+,(a1)+
			move.b	(a3)+,(a1)+
    1750:	12db           	move.b (a3)+,(a1)+
			move.b	(a3)+,(a1)+
    1752:	12db           	move.b (a3)+,(a1)+
			move.b	(a3)+,(a1)+
    1754:	12db           	move.b (a3)+,(a1)+
			move.b	(a3)+,(a1)+
    1756:	12db           	move.b (a3)+,(a1)+
			move.b	(a3)+,(a1)+
    1758:	12db           	move.b (a3)+,(a1)+
			move.b	(a3)+,(a1)+
    175a:	12db           	move.b (a3)+,(a1)+
			move.b	(a3)+,(a1)+
    175c:	12db           	move.b (a3)+,(a1)+
			move.b	(a3)+,(a1)+
    175e:	12db           	move.b (a3)+,(a1)+
			move.b	(a3)+,(a1)+
    1760:	12db           	move.b (a3)+,(a1)+
			move.b	(a3)+,(a1)+
    1762:	12db           	move.b (a3)+,(a1)+
			move.b	(a3)+,(a1)+
    1764:	12db           	move.b (a3)+,(a1)+

00001766 <.copys>:
.copys:
			move.b	(a3)+,(a1)+
    1766:	12db           	move.b (a3)+,(a1)+
			move.b	(a3)+,(a1)+
    1768:	12db           	move.b (a3)+,(a1)+
			move.b	(a3)+,(a1)+
    176a:	12db           	move.b (a3)+,(a1)+
			move.b	(a3)+,(a1)+
    176c:	12db           	move.b (a3)+,(a1)+

0000176e <.tokenLoop>:
			
.tokenLoop:	move.b	(a0)+,d0
    176e:	1018           	move.b (a0)+,d0
			move.l	d0,d1
    1770:	2200           	move.l d0,d1
			lsr.b	#4,d1
    1772:	e809           	lsr.b #4,d1
			beq.s	.lenOffset
    1774:	67a2           	beq.s 1718 <.lenOffset>
			cmp.b	d4,d1
    1776:	b204           	cmp.b d4,d1
			beq.s	.readLen1
    1778:	6734           	beq.s 17ae <.readLen1>

0000177a <.litcopys>:

.litcopys:	move.w  d1,d5
    177a:	3a01           	move.w d1,d5
			lsr.w	#1,d5
    177c:	e24d           	lsr.w #1,d5
			bclr.l  #0,d5
    177e:	0885 0000      	bclr #0,d5
			neg.w   d5
    1782:	4445           	neg.w d5
			jmp     .copyslw(pc,d5.w)
    1784:	4efb 5008      	jmp (178e <.copyslw>,pc,d5.w)
			move.l  (a0)+,(a1)+
    1788:	22d8           	move.l (a0)+,(a1)+
			move.l  (a0)+,(a1)+
    178a:	22d8           	move.l (a0)+,(a1)+
			move.l  (a0)+,(a1)+
    178c:	22d8           	move.l (a0)+,(a1)+

0000178e <.copyslw>:
.copyslw:	
			and.w   #3,d1
    178e:	0241 0003      	andi.w #3,d1
			add.w	d1,d1
    1792:	d241           	add.w d1,d1
			neg.w	d1
    1794:	4441           	neg.w d1
			jmp		.copys2(pc,d1.w)
    1796:	4efb 1008      	jmp (17a0 <.copys2>,pc,d1.w)
			move.b	(a0)+,(a1)+
    179a:	12d8           	move.b (a0)+,(a1)+
			move.b	(a0)+,(a1)+
    179c:	12d8           	move.b (a0)+,(a1)+
			move.b	(a0)+,(a1)+
    179e:	12d8           	move.b (a0)+,(a1)+

000017a0 <.copys2>:
.copys2:
			cmpa.l	a0,a4
    17a0:	b9c8           	cmpa.l a0,a4
			bne		.lenOffset
    17a2:	6600 ff74      	bne.w 1718 <.lenOffset>
			movem.l saveregs, d0-d7/a0-a6
    17a6:	4cfa 7fff ff0a 	movem.l 16b4 <saveregs>(pc),d0-a6
			rts
    17ac:	4e75           	rts

000017ae <.readLen1>:
						
.readLen1:	move.b	(a0)+,d2
    17ae:	1418           	move.b (a0)+,d2
			add.l	d2,d1
    17b0:	d282           	add.l d2,d1
			not.b	d2
    17b2:	4602           	not.b d2
			beq.s	.readLen1
    17b4:	67f8           	beq.s 17ae <.readLen1>

000017b6 <.litcopy>:

.litcopy:	
			move.l  (a0)+,(a1)+
    17b6:	22d8           	move.l (a0)+,(a1)+
			subq.l 	#4,d1
    17b8:	5981           	subq.l #4,d1
			bhi.s   .litcopy
    17ba:	62fa           	bhi.s 17b6 <.litcopy>
			add.l   d1,a0
    17bc:	d1c1           	adda.l d1,a0
			add.l   d1,a1
    17be:	d3c1           	adda.l d1,a1
			//; end test is always done just after literals			
			cmpa.l	a0,a4
    17c0:	b9c8           	cmpa.l a0,a4
			bne		.lenOffset
    17c2:	6600 ff54      	bne.w 1718 <.lenOffset>

000017c6 <.over>:
			
.over:		

  movem.l saveregs, d0-d7/a0-a6
    17c6:	4cfa 7fff feea 	movem.l 16b4 <saveregs>(pc),d0-a6
  rts
    17cc:	4e75           	rts

000017ce <font2distance>:
    17ce:	0505           	btst d2,d5
    17d0:	0505           	btst d2,d5
    17d2:	0505           	btst d2,d5
    17d4:	0505           	btst d2,d5
    17d6:	0505           	btst d2,d5


font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    17d8:	0505           	btst d2,d5
    17da:	0505           	btst d2,d5
    17dc:	0005 0505      	ori.b #5,d5
    17e0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    17e2:	0505           	btst d2,d5
    17e4:	0505           	btst d2,d5
    17e6:	0505           	btst d2,d5
    17e8:	0505           	btst d2,d5
    17ea:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    17ec:	0505           	btst d2,d5
    17ee:	0505           	btst d2,d5
    17f0:	0505           	btst d2,d5
    17f2:	0505           	btst d2,d5
    17f4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    17f6:	0500           	btst d2,d0
    17f8:	0505           	btst d2,d5
    17fa:	0505           	btst d2,d5
    17fc:	0505           	btst d2,d5
    17fe:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    1800:	0505           	btst d2,d5
    1802:	0505           	btst d2,d5
    1804:	0505           	btst d2,d5
    1806:	0505           	btst d2,d5
    1808:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    180a:	0505           	btst d2,d5
    180c:	0505           	btst d2,d5
    180e:	0503           	btst d2,d3
    1810:	0505           	btst d2,d5
    1812:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    1814:	0505           	btst d2,d5
    1816:	0500           	btst d2,d0
    1818:	0505           	btst d2,d5
    181a:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    181e:	0505           	btst d2,d5
    1820:	0503           	btst d2,d3
    1822:	0205 0507      	andi.b #7,d5
    1826:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    1828:	0505           	btst d2,d5
    182a:	0505           	btst d2,d5
    182c:	0505           	btst d2,d5
    182e:	0505           	btst d2,d5
    1830:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1832:	0505           	btst d2,d5
    1834:	0505           	btst d2,d5
    1836:	0505           	btst d2,d5
    1838:	0505           	btst d2,d5
    183a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    183c:	0505           	btst d2,d5
    183e:	0505           	btst d2,d5
    1840:	0505           	btst d2,d5
    1842:	0505           	btst d2,d5
    1844:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1846:	0505           	btst d2,d5
    1848:	0505           	btst d2,d5
    184a:	0505           	btst d2,d5
    184c:	0505           	btst d2,d5
    184e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1850:	0505           	btst d2,d5
    1852:	0505           	btst d2,d5
    1854:	0505           	btst d2,d5
    1856:	0505           	btst d2,d5
    1858:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    185a:	0505           	btst d2,d5
    185c:	0505           	btst d2,d5
    185e:	0505           	btst d2,d5
    1860:	0505           	btst d2,d5
    1862:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1864:	0505           	btst d2,d5
    1866:	0505           	btst d2,d5
    1868:	0505           	btst d2,d5
    186a:	0505           	btst d2,d5
    186c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    186e:	0505           	btst d2,d5
    1870:	0505           	btst d2,d5
    1872:	0505           	btst d2,d5
    1874:	0505           	btst d2,d5
    1876:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1878:	0505           	btst d2,d5
    187a:	0505           	btst d2,d5
    187c:	0505           	btst d2,d5
    187e:	0505           	btst d2,d5
    1880:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1882:	0505           	btst d2,d5
    1884:	0505           	btst d2,d5
    1886:	0505           	btst d2,d5
    1888:	0505           	btst d2,d5
    188a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    188c:	0505           	btst d2,d5
    188e:	0505           	btst d2,d5
    1890:	0505           	btst d2,d5
    1892:	0505           	btst d2,d5
    1894:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1896:	0505           	btst d2,d5
    1898:	0505           	btst d2,d5
    189a:	0505           	btst d2,d5
    189c:	0505           	btst d2,d5
    189e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    18a0:	0505           	btst d2,d5
    18a2:	0505           	btst d2,d5
    18a4:	0505           	btst d2,d5
    18a6:	0505           	btst d2,d5
    18a8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    18aa:	0505           	btst d2,d5
    18ac:	0505           	btst d2,d5
    18ae:	0505           	btst d2,d5
    18b0:	0505           	btst d2,d5
    18b2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    18b4:	0505           	btst d2,d5
    18b6:	0505           	btst d2,d5
    18b8:	0505           	btst d2,d5
    18ba:	0505           	btst d2,d5
    18bc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    18be:	0505           	btst d2,d5
    18c0:	0505           	btst d2,d5
    18c2:	0505           	btst d2,d5
    18c4:	0505           	btst d2,d5
    18c6:	0505           	btst d2,d5

000018c8 <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    18c8:	16c0           	move.b d0,(a3)+
  RTS
    18ca:	4e75           	rts

000018cc <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    18cc:	48f9 7fff 0000 	movem.l d0-a6,16b4 <saveregs>
    18d2:	16b4 
  lea 0xdff000,a5
    18d4:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.f93356b9+0xdf548c>,a5
  move.l sp@(4),a0  //Fontlocation
    18da:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    18de:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    18e2:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    18e6:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    18e8:	082d 0006 0002 	btst #6,2(a5)

000018ee <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    18ee:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    18f4:	66f8           	bne.s 18ee <st2wblit>

000018f6 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    18f6:	7019           	moveq #25,d0
	sub.l d5,d5      
    18f8:	9a85           	sub.l d5,d5

000018fa <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    18fa:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    18fc:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    18fe:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    1902:	9dce           	suba.l a6,a6
	move.l d2, a6
    1904:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    1906:	ddfc 0000 17ce 	adda.l #6094,a6

	LSL  	#4,d2 	    //Fetch next char
    190c:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    190e:	2842           	movea.l d2,a4


	move.l  #0,d4
    1910:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    1912:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    1914:	3814           	move.w (a4),d4
	swap	d4
    1916:	4844           	swap d4
	lsr.l	d5, d4
    1918:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    191a:	8993           	or.l d4,(a3)
	clr.l	d4
    191c:	4284           	clr.l d4
	move.w  2(a4), d4
    191e:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    1922:	4844           	swap d4
	lsr.l	d5, d4
    1924:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    1926:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    192a:	4284           	clr.l d4
	move.w  4(a4), d4
    192c:	382c 0004      	move.w 4(a4),d4
	swap	d4
    1930:	4844           	swap d4
	lsr.l	d5, d4
    1932:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    1934:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    1938:	4284           	clr.l d4
	move.w  6(a4), d4
    193a:	382c 0006      	move.w 6(a4),d4
	swap	d4
    193e:	4844           	swap d4
	lsr.l	d5, d4
    1940:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    1942:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    1946:	4284           	clr.l d4
	move.w  8(a4), d4
    1948:	382c 0008      	move.w 8(a4),d4
	swap	d4
    194c:	4844           	swap d4
	lsr.l	d5, d4
    194e:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    1950:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    1954:	4284           	clr.l d4
	move.w  10(a4), d4
    1956:	382c 000a      	move.w 10(a4),d4
	swap	d4
    195a:	4844           	swap d4
	lsr.l	d5, d4
    195c:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    195e:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    1962:	4284           	clr.l d4
	move.w  12(a4), d4
    1964:	382c 000c      	move.w 12(a4),d4
	swap	d4
    1968:	4844           	swap d4
	lsr.l	d5, d4
    196a:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    196c:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    1970:	4284           	clr.l d4
	move.w  14(a4), d4
    1972:	382c 000e      	move.w 14(a4),d4
	swap	d4
    1976:	4844           	swap d4
	lsr.l	d5, d4
    1978:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    197a:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    197e:	4284           	clr.l d4

	add.b   (a6), d5
    1980:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    1982:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    1986:	6500 0006      	bcs.w 198e <noadditionalchar>
	addq.w  #1, a3
    198a:	524b           	addq.w #1,a3
	sub.w   #8,d5
    198c:	5145           	subq.w #8,d5

0000198e <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    198e:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    1990:	51c8 ff68      	dbf d0,18fa <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    1994:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    1998:	51cb ff5c      	dbf d3,18f6 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    199c:	4cfa 7fff fd14 	movem.l 16b4 <saveregs>(pc),d0-a6

	RTS
    19a2:	4e75           	rts
