DEBUG = 0
SOUND    = 1
BLITTER  = 0
BPLWIDTH  = 40
BPLHEIGHT = 256
BPLCOUNT  = 2
MAXDEPTH = 8
CHKBLLINE = 0 ;Extra bit in map for empty line for fast processing
USEMAPHEIGHT = 1
AGA=1
MINLINE = 10 ;Min Number of Lines for Rotation

*****************************************************************************u

		    ;5432109876543210
DMASET	=	%1000001110111111	; copper,bitplane,blitter DMA



STARTPROG:    
    lea    $dff000,a6                  ;a6 shall point to graphics register
    ifeq DEBUG-0
    move.w 	#DMASET,$96(a6)		; DMACON - abilita bitplane,copper
    ;move.l 	view_copper,$80(a6)

    ;move.w	d0,$88(a6)		; restart copperlist
    IFEQ AGA-1
    move.w	#$3,$1fc(a6)
    move.w	#$c00,$106(a6)
    move.w	#$11,$10c(a6)
    ELSE
    move.w	#$0,$1fc(a6)		; 64bit Fetchmode for bpl and spr
    move.w	#$c00,$106(a6)		; disactivate AGA
    move.w	#$11,$10c(a6)		; disactivate AGA
    ENDC
    ENDC

MainLoop:
    move.l #$1ff00,d1	                    ; bits that contain vpos
    move.l #$13000,d2	                    ; line to wait for = $130
.mlwaity:
    move.l 4(a6),d0	                    ; read register with
    	                                    ; positions
    AND.L D1,D0		                    ; select vpos
    CMP.L D2,D0                            ; selected vpos reached
    BNE.S  .mlwaity


    lea    continue,a0
    cmp.w  #1,(a0)
    bne.s  .br1
    move.w #0,(a0)
    add.l  #4,jmplistpos
.br1
    move.l jmplistpos(pc),a0
    jmp    0(a0)

mlgoon:
    lea         $dff000,a6
    btst.b	#10,$16(a6)	; left mouse button clicked
    bne.s	MainLoop        ; if not continue programm
	bra.w   End

continue:
        dc.w 0

jmplistpos:
        dc.l  jmplist
jmplist:
        bra.w Effect1_0
		bra.w Effect1_2
		bra.w End


BLINCREMENT = 1
SPINCREMENT = 2
FRAMES=150

ColMultiplier: dc.w 0
Temporaneo: dc.l 0

Eff1ZoomIn:
  dc.w 0

End:
    move.w	#$0,$1fc(a6)		; 64bit Fetchmode for bpl and spr
	move.w	#$c00,$106(a6)		; disactivate AGA
    move.w	#$11,$10c(a6)		; disactivate AGA
	rts

PalCredits:
         include      "utils.s"

Effect1_0:
  move.l #bitplane,d0
  move.l #16,d1
  lsr.l  d1,d0
  addq.l #1,d0
  lsl.l  d1,d0
  move.l d0,draw_buffer
  add.l  #$8000,d0
  move.l d0,view_buffer
  move.w #1,continue
  bra.w mlgoon


Effect1_2:
  move.w #1,Eff1ZoomIn
  bsr.w  Effect1_Main

  sub.w  #1,.counter
  beq.s  .br1
  bra.w  mlgoon
.br1
  move.w #1,continue
  lea    EF1_PATTERNDATA0,a0
  move.l #PTR_CHECKERBOARD_DATA,(a0)
  bra.w  mlgoon

.counter dc.w 800


Eff2ZoomIn: dc.w 0

 include "invaders_dat.i"

StarField:
;a0 = drawposition
;a5 = drawbufferstart
;a1 = *posx
;a2= *posy
;a3 = a3offs
;a5 = backup plane
;d0 = posx
;d1 = posy
;d4 = backup posx1
;d5 = backup bosy1
;d6 = starcount    	
	movem d0-d7/a0-a6,.save
	move.l draw_buffer,a0
	add.l  #40*BPLWIDTH+40*256,a0
	move.l  #196,d0
	movem.l .buff(pc),d1-d7/a1-a6

.lp2
    movem.l  d1-d7/a1-a6,-(a0)
	dbf      d0,.lp2    
	
    move.l draw_buffer,a5
	add.l  #40*BPLWIDTH,a5

	lea sfposx,a1
	lea sfposy,a2
	lea sfposz,a3
	lea sfmult,a4
    
	move.w #8,d4
	move.w #600-1,d6
.lp1	
    move.l  a5,a0
	;load values
	move.w  (a1)+,d0
	move.w  (a2)+,d1
	move.w  (a3),d2
	cmp.w   #98,d2	
	bne.s   .br3
	clr.w   (a3)+
	bra.s   .br4
.br3
	add.w   #2,(a3)+
.br4	
	move.w  (a4,d2),d2
	;3d to 2d calc
	muls.w  d2,d0
	asr.l   d4,d0
	add.l   #160,d0
	muls.w  d2,d1
	asr.l   d4,d1
	add.l   #128,d1
    ;Reset x,y pos
	cmp.w  #0,d0
	ble.s  .br2
	cmp.w  #0,d1
	ble.s  .br2
	cmp.w  #320,d0
	bpl.s  .br2
	cmp.w  #256,d1
	bpl.s  .br2
.br1
    ;Show Pixel	
	bsr.w  drawPlanarPixel
.br2
	dbf     d6,.lp1
	movem   .save,d0-d7/a0-a6
	rts	
	
.save dcb.l 15,0
.posx: dcb.w 196,160
.posy: dcb.w 196,128
.buff dcb.l 15,0
		
drawPlanarPixel:
	; drawing plane => a0 ...could be a buffer, too
	; X 		=> d0
	; Y 		=> d1
	; SCRAP 	=> d2,d3
	;movem.l	d0-d3/a0,-(a7)

	; manage the Y position
	move.w	d1,d2		; copy y
	lsl.w	#4,d1		; multiply by 40
	lsl.w	#3,d2
	add.w	d1,d1
	add.w	d2,d1
	add.w	d1,a0		; enter y pos first

	; manage the X position
	move.w	d0,d2		; copy x
	lsr.w	#3,d0		; divide by 8 to get the hardposition
	and.w	#$000f,d2	; mask the 4 lower bits for 0-15 softposition
	btst	#0,d0		; is the hardposition an odd value ?
	beq.s	.even		; nope ...skip the -1 action
	subq.w	#1,d0		; it's odd ...sub 1 to keep even steps (68000!)
.even:
	sub.w	#15,d2
	neg.w	d2
	add.w	d0,a0		; move to X hardposition
	move.w	(a0),d3		; take current screendata word aligned
	bset	d2,d3		; set the softposition pixel
	move.w	d3,(a0)		; put back the modified word

	;movem.l	(a7)+,d0-d3/a0
	rts

OFFSCOLORS=112
OFFSBANK2=1056+OFFSCOLORS
SetColors:
	movem  d0-d7/a0-a6,.save
	
	;Get invader color relative to size
	lea.l   blarraycont,a0
	sub.l   d5,d5
	move.w  CNTBLSIZE(a0),d0
	lsl.w   #1,d0
	lea     inv_colint,a1
	move.w  (a1,d0),d0
	move.w  #204,d1	
	mulu.w  d1,d0
	lsr.w   #8,d0 ;Color 1
	move.w  d0,d1
	lsr.w   #4,d0
	
	move.w  d0,d3
	lsr.w   #1,d3 ;Color 3 high
	add.w   #$766,d3
	move.w  d0,d4
	lsr.w   #1,d4 ;Color 3 low
	add.w   #$766,d4	
.br1		
	and.w   #$f,d1	
	
	move.l draw_copper,a0
	add.l  #OFFSCOLORS+2,a0
	move.w #$0,(a0) ;Color 0
	addq.l #4,a0
	move.w d0,(a0) ;Color 1
	addq.l #4,a0
	move.w #$fdc,(a0); Color 2
	addq.l #4,a0
	move.w d3,(a0); Color 3
	move.l draw_copper,a0
	;add.l  #OFFSBANK2+2,a0
	;move.w #$0,(a0) ;Color 0l
	;addq.l #4,a0
	;move.w d1,(a0) ;Color 1l
	;addq.l #4,a0
	;move.w #$fdc,(a0); Color 2l
	;addq.l #4,a0
	;move.w d4,(a0); Color 3l
	movem  .save,d0-d7/a0-a6
    rts

.save dcb.l 15,0

Effect1_Main:
;a0 = blarraydim
;a1 = frmdat[]
;a2 = laydat
;a3 = frame
;a4 = reserved SetColData
;a5 = colptr
;a6 = *blarraycont.data (temp)
        subq    #1,.counter		    ;if(counter-- == 0)
        bne.w   .br1				    ;{
		bsr.w   SetBitplanePointers     ;  SetBitplanePointers();
        bsr.w   SetCopperList
		bsr.w  StarField
        move.w  #1,.counter            ;  counter = 1; //50 fps		
		
		lea     .frame,a3              ;
		lea     EF1_PATTERNDATA0,a1	   ;  frmdat = EFF1_PATTERNDATA7
		;sub.l nam  #FRMSIZE*7,a1         ; DEBUG
		lea	    blarraycont,a2			;  laydat = blarraycont.data
		move.l  (a1),a6
		sub.l   #4,a6
		lea     blarraydim,a0			;  blarraydim.width =
		move.w  (a6),DIMWIDTH(a0)	;  	        *blarraycont.data.width;
		move.w  2(a6),DIMHEIGHT(a0)	;  blarraydim.height =
										;  		    blarraycont.data.height;
        move.w   #0,.i     		        ;  for(int i=0;i<8;i++)
		lea      EF1_MoveX,a5
		lea      EF1_MoveY,a6
.lp1  									;  {
		move.l  (a1),CNTBLMAP(a2)       ;    *frmdat.blmap = *laydat.blmap
		bsr.w   GetFrame        		;    GetFrame(  framedate,frmnr)
        ;bsr.w   MoveData
		bsr.w   SetFrame                ;    SetFrame(  input,laydat)
		addq.l  #2,a5
		addq.l  #2,a6
		sub.l   #FRMSIZE,a1		        ;  	 frmdat++; //Next object
		add.l   #CNTOBJSIZE,a2          ;    laydat++;
		sub.w   #1,.i
		bpl.s   .lp1			        ;  }

        bsr.w   MoveAdjust              ;  MoveAdjust( );
		;move.l  .colptr(pc),a5

		movem.l d0-d7/a0-a6,.save

		;move.l  #165,d4
		move.l  draw_copper,a4          ;  copptr = draw_buffer;
		add.l   #2,a4                   ;  copptr += 10;
		move.l  a4,a6                   ;  copptrlw = copptr;
		add.l   #OFFSCLPALETTE,a4       ;  copptr += offsclpalette;
		add.l   #OFFSCLPALETTELW,a6     ;  copptrlw += offsclpalettelw;
		lea.l   blarraycont,a0
		sub.l   d5,d5
		move.w  CNTBLSIZE(a0),d5
		mulu.w  #256*3,d5
		divu.l  #320,d5
		cmp.w   #255,d5
		ble.s   .br4
		move.w  #255,d5
.br4
		and.l   #$ffff,d5
		move.w  #7,d2
		bsr.w   SetColors
		;bsr.w   SetColDataFade		    ;  SetColDataFade(intensity);
    	movem.l .save,d0-d7/a0-a6
		cmp.w   #0,Eff1ZoomIn           ;  if(Eff1ZoomIn( )
		beq.s   .br3                    ;  {
		;lea	    .colptr,a5
	    add.l   #2,(a3)				    ;    frame++
		cmp.l   #150*2,(a3)               ;    if(frame > 66) {
	    bne.s   .br3                    ;      frame = 0
	    move.l  .ptrn1,a5
		move.l  .ptrn2,.ptrn1
		move.l  a5,.ptrn2
		move.w  .ptrnheight1,a5
		move.w  .ptrnheight2,.ptrnheight1
		move.w  a5,.ptrnheight2
		move.l  .ptrnheight1,CNTHEIGHT(a0)
		move.l  .ptrn1,EF1_PATTERNDATA0
		move.l  #0,(a3)
		
		move.l  (a5),a3
.br3                                    ;    }
                                        ;  }
		bsr.w  DrawLines                ;  DrawLines(blarraydim);			
.br1        							;}
        rts

.save dcb.l 15,0
.i dc.w 7
.counter: dc.w 1
.frame: dc.l 0
;.colptr: dc.l EF1_COLORS1
;.colptr2: dc.l EF1_COLORS2
.ptrn1: dc.l PTR_INVADERS_DATA
.ptrn2: dc.l PTR_INVADERS2_DATA             
.ptrnheight1: dc.w 8
.ptrnheight2: dc.w 8

Break:
    rts

GetFrame:
;input
;a1 = frmdat[]
;a3 = frame
;output;    GetFrame(  framedate,frmnr)
;d1 = blposx
;d2 = blposy
;d3 = detposx
;d4 = drtposy
;d5 = size
		add.l   (a3),a1                ;  //Get to right frame
		move.w FDOPOSX(a1),d1          ;  blposx = *frmdat.blposx[frame]
		move.w FDOPOSY(a1),d2          ;  '
		move.w FDOPOSXDET(a1),d3       ;  '
		move.w FDOPOSYDET(a1),d4       ;  '
		move.w FDOBLSIZE(a1),d5        ;  '
		sub.l  (a3),a1                ;  //Get to right frame
        rts								;}

SetFrame:			        		    ;SetFrameDefault(  frmdat,
;a2 = laydat
		move.w d1,CNTBLPOSX(a2)      ;  *frmdat.posx[frame] = *frmdat.posx
		move.w d2,CNTBLPOSY(a2)      ;  '
		move.w d3,CNTPOSX(a2)        ;'
		move.w d4,CNTPOSY(a2)        ;'
		move.w d5,CNTBLSIZE(a2)      ;'
        rts							  ;}

.ptrtomap
	dc.l blarraycont+CNTBLMAP

SetColDataFade:                  ;SetColDataFade(intensity, layers, colorptr)
  ;d5 - intensity
  ;a5 - colors
  ;a4 - copperpos highwordcol
  ;a6 - copperpos lowword pos
  lea     .intstore,a0
  sub.l   d0,d0                   ;curvalue = 0
  moveq.l #64-1,d6                ;for i = 1 to 64
.lp2                              ;Write multiplication table
  move.l  d0,d1                   ;lwtowrite = curvalue / 256
  lsr.l   #8,d1
  moveq.l #24,d3                  ;lwtowrite <<= 24;
  lsl.l   d3,d1
  add.l   d5,d0                   ;curvalue += intensity
  move.l  d0,d3                   ;tmp = curvalue / 256
  lsr.l   #8,d3
  moveq.l #16,d4                  ;tmp <<= 16
  lsl.l   d4,d3
  add.l   d3,d1                   ;lwtowrite += tmp;
  add.l   d5,d0                   ;curvalue += intensity;
  move.l  d0,d3                   ;tmp = curvalue / 256;
  and.l   #$ff00,d3               ;tmp <<= 8;
  add.l   d3,d1                   ;lwtowrite += tmp;
  add.l   d5,d0                   ;curvalue += intensity;
  move.l  d0,d3                   ;tmp = curvalue / 256;
  lsr.l   #8,d3
  add.l   d3,d1                   ;lwtowrite += tmp;
  add.l   d5,d0                   ;curvalue += intensity;
  move.l  d1,(a0)+
  dbf     d6,.lp2

  ;moveq.l #7,d2			     ;  for(	x=0;x<=layers;x++)
  moveq.l #31,d1                 ;  // skip color 0 in loop
.lp1
  ;// red color
  move.l  (a5)+,d0               ;curcolor = *color++
  move.l  d0,d6                  ;bluepart = curcolor & $ff
  and.l   #$ff,d6                ;00bb
  lea.l   .intstore,a0
  move.b  (a0,d6),d6              ;bluepart *= intensity;
                                 ;00bb
  move.l  d6,d7                  ;colorhw = bluepart >> 4;
  lsr.l   #4,d7                  ;000b
  and.w   #$f,d6                 ;colorlw = bluepart & $f
                                 ;000b
  move.l  d0,d4                  ;greenpart = curcolor & $ff00
  and.l   #$ff00,d4              ;gg00
  lsr.l   #8,d4                  ;00gg
  move.b  (a0,d4),d4              ;greenpart *= intensity;
                                 ;00gg
  move.l  d4,d3                  ;colorhw += greenpart & $f0
  and.w   #$f0,d3                ;00g0
  add.w   d3,d7                  ;00gb
  lsl.w   #4,d4                  ;colorlw +=  (greenpart << 4) & $f0
                                 ;gg0
  and.w   #$f0,d4                ;00g0
  add.w   d4,d6                  ;00gb

  move.l  d0,d4                  ;redpart = (curcolor & $$ff0000) >> 8
                                 ;rr0000
  lsr.l	  #8,d4                  ;rrgg
  lsr.l	  #8,d4                  ;00rr
  move.b  (a0,d4),d4             ;redpart *= intensity;
                                 ;00rr
  lsl.l   #8,d4                  ;rr00

  move.l  d4,d3                  ;colorlw = redpart & $f00
  and.w   #$f00,d3               ;0r00
  add.w   d3,d6                  ;0rgb
  lsr.w   #4,d4                  ;colorhw +=  (redpart << 4) & $f00
                                 ;0rr0
  and.w   #$f00,d4               ;0r00
  add.w   d4,d7                  ;0rgb
  move.w  d6,(a6)
  move.w  d7,(a4)
  addq.l  #4,a4
  addq.l  #4,a6
  dbf     d1,.lp1
  move.w  #31,d1
  addq.l  #4,a4
  addq.l  #4,a6
  dbf     d2,.lp1
  rts

 cnop 0,4

.intstore: dcb.b 256,255


percentage:
	dc.w 168;

MoveAdjust:
  move.w  percentage(pc),d7           ;    if(percentage <	200)
  cmp.w   #200,d7                      ;    {
  bge.s   .br4
  addq    #3,d7                        ;      percentage += 3;
  bra.s   .br5                          ;    } else
.br4                                    ;    {
  sub.w   d7,d7                         ;      percentage = 0;
.br5								    ;    }
  move.w  d7,percentage
  rts

mapypos:
        dc.w 0
blmappos:
        dc.l 0
bllnflagpos:
        dc.l 0

DrawBlankLine:
        IFEQ BLITTER-0
        move.l    currentdrawpos,a5
        REPT 10
        move.l    #0,(a5)+
        ENDR
        ENDC
        rts

DrawLines:
        ;input
        ;a0 - map dimension
        ;d0 - plane number

        ;processing
        ;a1 - dimcontent
        ;a2 - space size
        ;a3 - ypos
        ;a5 - bl map y
        ;a6 - bl map x
		sub.l    d5,d5
        move.w   DIMDEPTH(a0),d5
        subq     #1,d5
        lea      DIMCONTENT(a0),a1           ; load start of ptr list
        move.l   a1,.contentptr              ; save ptr list pos
.lp1
        move.l   (a1),a1                     ; load ptr to first layer
        move.l   draw_copper,copperpos
        add.l    #OFFSCLBLOCKDRAW,copperpos
        cmp.l    #0,d5
        beq.s    .br6
        addq.l   #6,copperpos
        move.l   d5,d0
        lsl.w    #2,d0
        add.l    d0,copperpos
.br6
        move.l   draw_buffer,a2
        move.l   d5,d0
        mulu.w   #BPLWIDTH*40,d0
        add.l    d0,a2
        move.l   a2,currentdrawpos

        lea      CNTPOSY(a1),a3
        lea      CNTBLPOSY(a1),a5
        lea      CNTBLPOSX(a1),a6
        lea      CNTSPSIZE(a1),a2

        ;calc map startpos
        sub.l    d1,d1
        move.w   (a6),d1
        lsr.w    #5,d1               ; divide through 32
        lsl.w    #2,d1               ; start pos for x in bytes rounded to lw
        move.w   d1,d6               ; save blxpos
        move.w   DIMWIDTH(a0),d0
        mulu.w   (a5),d0
        add.w    d1,d0
        move.l   CNTBLMAP(a1),blmappos
        move.l   CNTBLLNFLAG(a1),bllnflagpos
        add.l    d0,blmappos
        IFEQ CHKBLLINE-0
        move.w   (a5),d0
        lsl.w    d0                  ;word size it
        add.l    d0,bllnflagpos
        ENDC

        move.w   CNTBLSIZE(a1),d0
        cmp.w    #31,d0
        bne.s    .nodebug
        move.w   d0,d0
.nodebug
        move.w   (a2),d2
        add.w    d0,d2
        move.w   d2,.totsize
        movem.l  a0-a2/d1/d3-d7,.saveregs
        lea      DrawLine,a4
        cmp.w    #32,d2
        bhs.s    .br7
        move.w   CNTPOSX(a1),d1
        move.w   (a2),d5
        ;bsr.w    PreProcessDL
        ;lea      dldata,a4
		lea      DrawLine,a4
.br7
        movem.l  .saveregs(pc),a0-a2/d1/d3-d7

        move.w    (a5),mapypos

        ;d0 - temp use
        ;d1 - temp use
        ;d2 - number of lines to repeat
        ;d3 - gets cleared by subroutine
        ;d4 - temp use
        ;d5 - layer counter
        ;d6 - copperpos to draw

        IFEQ USEMAPHEIGHT-1
        ;save counter for mapheight. Subtract 1
        move.w   CNTHEIGHT(a1),.heightpos
        ENDC

        move.w   #255,d0
        move.b   #$2c,d6
        move.w   CNTBLSIZE(a1),d1
        IFEQ CHKBLLINE-1
        ;move.l   a4,.lfuncbak
        ENDC
        sub.w    (a3),d1
        beq.s    .linesleftspace
        bmi.s    .linesleftspace

.linesleftblock                        ;Still block to draw for this element

        IFEQ CHKBLLINE-1
        move.l   bllnflagpos(pc),a5
        cmp.w    #0,(a5)                 ; check for line marker empty
        beq.s    .br8
        ;lea        DrawBlankline,a4
        bsr.w      DrawBlankLine
        bra.s    .br10
.br8
        ;move.l    .lfuncbak,a4
        ENDC

        movem.l         a1-a3/a6/d0-d1/d4-d6,.saveregs
        move.w          (a6),d5                      ;load mapxpos for later
        lea             0(a2),a6
        lea             CNTPOSX(a1),a3
        move.l          currentdrawpos(pc),a2
        move.l          blmappos(pc),a5
        ;shift mapppos to exact position
        move.l          (a5)+,d0                         ;load mappos
        and.w           #%11111,d5                       ;get relevant part
        lsl.l           d5,d0                            ;shift map part 1
        move.l          (a5),d6                          ;load map part2
        sub.w           #32,d5
        neg.w           d5
        lsr.l           d5,d6                            ;rotate to right pos
        or.l            d6,d0                            ;combine words

        moveq           #0,d5
        jsr             0(a4)
        movem.l         .saveregs(pc),a1-a3/a6/d0-d1/d4-d6
.br10
        cmp.l           #0,d5
        bne.s           .br2
        bsr.w           WriteCopper
        bra.s           .br3
.br2
        bsr.w           WriteCopperPosAdd
.br3
        cmp.w           #0,d0
        beq.s           .br1
        add.l           #BPLWIDTH,currentdrawpos
.linesleftspace
        move.w          (a2),d4
		beq.s           .br11
.llftspcempty
        add.w           d4,d1             ;get pixels left to draw y for space
        bne.s           .next
        move.w          d1,d1
.next
        bsr.w           DrawBlankLine
        cmp.w           #0,d5
        bne.s           .br4
        bsr.w           WriteCopper
        bra.w           .br5
.br4
        bsr.w           WriteCopperPosAdd
.br5
        cmp.w           #0,d0
        beq.s           .br1
.br11
        IFEQ            USEMAPHEIGHT-1
        sub.w           #1,.heightpos
        bpl.s           .br9
        bsr.w           RepeatCopper
        bra.s           .br1
        ENDC
.br9
        add.l           #BPLWIDTH,currentdrawpos
        move.w          CNTBLSIZE(a1),d1
        sub.l           d7,d7
        move.w          DIMWIDTH(a0),d7
        IFEQ CHKBLLINE-1
        add.l           #2,bllnflagpos
        ENDC
        add.l           d7,blmappos
        bra.w           .linesleftblock
.br1
        lea             .contentptr,a1         ;load ptr pos
        addq.l          #4,(a1)               ;increase ptr
        move.l          (a1),a1              ;load content of ptr
                                              ;which is ptr to cont array

        dbf             d5,.lp1
        rts

.lfuncbak:
        dc.l 0
.saveregs
         dc.l     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

.totsize
         dc.w     0

.heightpos:
         dc.w     0

.contentptr
         dc.l     0

RepeatCopper:
         add.l    #BPLWIDTH,currentdrawpos
         sub.l    d4,d4
         ;Revert bitplanepointer
         move.w   CNTHEIGHT(a1),d7       ;Number of blocks
         move.w   d7,d4			         ;Copy to d7 we need d7 later
	 lsl      d4                         ;One block line and one block gap
	 mulu.w   #BPLWIDTH,d4               ;Get Number of Bytes

.lp2 ;Loop for whole map

         sub.l    d4,currentdrawpos         ;Revert bplpointer
	 subq.w   #1,d7                     ;Prepare use of d0 as loopcounter

.lp1 ; Loop for one lines of block
         ;Copper for Block
         move.w   CNTBLSIZE(a1),d1
         subq.w   #1,d1
	 ;Different Copperroutine for first plane
	 cmp.w    #0,d5
	 bne.s    .br1
         bsr.s    WriteCopper
         bra.s    .br2
.br1
         bsr.w    WriteCopperPosAdd
.br2
         cmp.w    #0,d0
         beq.s    .br3

         add.l    #BPLWIDTH,currentdrawpos

         ;Copper for Space
         move.w   CNTSPSIZE(a1),d1
		 beq.s    .br6
         subq.w   #1,d1
	 ;Different Copperroutine for first plane
	 cmp.w    #0,d5
	 bne.s    .br4
         bsr.s    WriteCopper
         bra.s    .br5
.br4
         bsr.s    WriteCopperPosAdd
.br5
         cmp.w    #0,d0
         beq.s    .br3                      ;End of screen reached
.br6
	 add.l    #BPLWIDTH,currentdrawpos
	 dbf      d7,.lp1
         move.w   CNTHEIGHT(a1),d7          ;Restore d7
	 bra.s    .lp2
.br3
	 rts

.backup:
         dc.w 0

WriteCopper:
        move.l   copperpos(pc),a5
        move.b   #$1,d3
        move.l   currentdrawpos,d2
.lp1
        move.b   d6,(a5)
        addq.w   #6,a5
        ;swap    d2
        ;move.w  d2,(a5)
        ;addq    #4,a5
        ;swap    d2
        move.w   d2,(a5)
        ;add.l   #(BPLCOUNT-1)*8+2,a5
        add.l    #(BPLCOUNT-1)*4+2,a5
        add.b    d3,d6
        bcs.s    .resetpos
.br1
        subq     #1,d0
        beq.s    .br2
        dbf      d1,.lp1
.br2
        move.l   a5,copperpos
        rts

.resetpos
        sub.w    d6,d6
        bra.s    .br1

copperpos:
        dc.l draw_copper+OFFSCLBLOCKDRAW

WriteCopperPosAdd:
        ;d1  number of lines
        ;d6 copperpos
        move.l   copperpos(pc),a5
        move.l   currentdrawpos,d2
.lp1
        ;swap     d2
        move.w   d2,(a5)
        ;addq.l   #4,a5
        ;swap     d2
        ;move.w   d2,(a5)
        add.l    #(BPLCOUNT)*4+4,a5
        subq     #1,d0
        beq.s    .br2
        dbf      d1,.lp1
.br2
        move.l   a5,copperpos
        rts

PreProcessDL:
        ;d0 - Width / Width including space
        ;d1 - Offset / Width
        ;d2 - most left block
        ;d3 - recent block
        ;a1 - patternbit to test
        ;a2 - lwcount
        ;d5 - tempuse
        ;d6 - most right block
        ;d7 - old block
        ;d4 - position lw

        ;get start pattern
        move.w          #10,a2            ;lwcount = 10;
        moveq           #-1,d2            ;most_left_block = $ffff....,
        moveq           #32,d3            ;most_left_block << (32 - width)
        sub.w           d0,d3             ;
        lsl.l           d3,d2             ;
        move.l          d2,d6             ;most_right_block = most_left_block;
        rol.l           d0,d6             ;most_right_block =
        ;get lw pos                       ; rotateleft(most_left_block,width);
        ;calculate complete block size
        move.w          d0,d7             ;//move width to d7
        add.w           d5,d0             ;widthincspace = width + space;
        move.l          #31,a1            ;ptrntotest = 31;
        lea             dldata(pc),a0     ;
        move.w          .init(pc),(a0)+   ;binary = init;
        move.w          d1,d4             ;shift = offset
        ;get 1st block with offset
        move.l          d2,d3             ;recentblock = most_left_block
        lsl.l           d4,d3             ;recentblock =<< shift;
        ;Write Single block
        bsr.w           WriteBlock1       ;writeblock1();
        subq            #1,a1             ;ptrntotest--;
        move.l          d2,d3             ;recentblock = most_left_block;
        move.l          d0,d5             ;
        sub.l           d4,d5             ;positionlw = widthincspace -
        move.w          d5,d4             ;                           offset;
        move.l          d7,d1             ;//blocksize without space to d1
.lp1
        cmp.w           #-1,a1            ;do {
        beq.s           .resetmap
.br6
        move.l          d3,d7             ;  oldblock = recentblock;
        lsr.l           d5,d3             ;  recentblock =>> positionlw;
        beq.s           .br2              ;  if(	recentblock != 0) {
		;  //block at least partly in this lw
        cmp.l           d3,d6             ;    if(  recentblock >
        ble.s           .br5              ;          most_right_block) {
        ;//block partly in this lw
        cmp.w           #1,a2             ;      if(  lwcount == 1)
        bne.s           .br3              ;      {
        bsr.s           WriteBlock1       ;        writeblock1();
										  ;        finish_preprocess();
        bra.s           .br4              ;      } else {
										  ;			process_part_block();
										  ;      }
.br5                                      ;    } else {
                                          ;    //block completely in this lw
        bsr.s           WriteBlock1      ;     writeblock1();
        add.w           d0,d4             ;      offset += widthincspace;
        move.l          d0,d5             ;      positionlw = widthincspace;
        subq            #1,a1             ;      ptrntotest--;
        bra.s           .lp1              ;    }
.br2                                      ;  } else {
										  ;  //block in next lw
        subq            #1,a2             ;    lwcount--;
        cmp.w           #0,a2             ;    if(  lwcount > 0)
        beq.s           .br4              ;    {
        sub.w           #32,d4            ;      positionlw -= 32;
        move.w          .writelw(pc),(a0)+;      binary += writelw;
        move.w          .init(pc),(a0)+   ;      binary += init;
        ror.l           d0,d7             ;      oldblock =
										  ;        rotateright(	widthincspace)
        move.l          d7,d3             ;      recentblock = oldblock;
        bsr.s           WriteBlock1       ;      writeblock1();
        subq            #1,a1             ;      ptrntotest--;
        add.w           d0,d4             ;      offset += widthincspace;
        bra.s           .lp1              ;    } else finish_preprocess();
		                                  ;  }
										  ;  if(ptrntotest < 0)resetmap();
										  ;}

.br3                                      ;process_part_block() {
        add.w            d1,d4            ;  bitsoverflow   = positionlw
        sub.w            #32,d4           ;                       + width - 32;
        move.w           d1,d7            ;  shift = width - bitsoverflow;
        sub.w            d4,d7            ;
        move.l           d2,d5            ;  nextblock = most_left_block
        lsl.l            d7,d5            ;  						  << shift;
        add.w            d4,d7            ;  shift += bitsoverflow //width
        bsr.s            WriteBlock2      ;  writeblock2();
        sub.w            d1,d4            ;  positionlw -= width;
        add.w            d0,d4            ;  positionlw += widthincspace;
        subq             #1,a2            ;  lwcount--;
        beq.s            .br4             ;  if(lwcount == 0)
										  ;		finish_preprocess();
        subq             #1,a1  		  ;  ptrntotest--;
        move.l           d2,d3            ;  recentblock = most_left_block;
        move.l           d4,d5            ;  calc = positionlw;
        bra.s            .lp1             ;}
.br4                                      ;finish_preprocess() {
        move.w           .writelw(pc),(a0)+ ;binary += init;
        move.w           .end(pc),(a0)+   ;  binary += end;
        rts                               ;}

.resetmap
        move.w           .mapfwd,(a0)+    ;resetmap() {
        move.l           #31,a1           ;ptrntotest = 31;
        bra.w            .br6             ;}

.init
        sub.l           d4,d4

.end
        rts

.writelw
        move.l          d4,(a2)+

.mapfwd
        move.l          (a5)+,d0

WriteBlock1:                              ;writeblock1()
;input
;a1 - pattern position to test
;d3 - block data
                                          ;{
        move.w          .bl1(pc),(a0)+    ;  binary += bl1.readword();
        move.w          a1,(a0)+          ;  binary += (word) ptrntotest;
        move.l          .bl1+4(pc),(a0)+  ;  binary += bl1.readlw();
        move.l          d3,(a0)+          ;  binary += recentblock();
        rts                               ;}

.bl1
        btst.l          #31,d0
        beq.s           .br1
        or.l            #$fff00000,d4
.br1

WriteBlock2:                               ;WriteBlock2() {
;input
;a1 - pattern pos to test
;d3 - block data w
;d5 - block data lw
                                           ;{
        move.w          .bl2(pc),(a0)+     ;  byte += block2.readword();
        move.w          a1,(a0)+           ;  byte += ptrntotest;
        cmp.l           #$ffff,d3          ;  if(recentblock <= $ffff)
        bhi.s           .br3               ;  {
        move.l          .bl2+4,(a0)+       ;    byte += block2.readlw();
        move.w          d3,(a0)+           ;    byte += (word) recentblock;
        bra.s           .br4               ;  }
.br3                                       ;  else {
        move.b          .bl2+4,(a0)+       ;    byte +=  block2.readbyte();
        move.b          #$10,(a0)+         ;    byte +=  10;
        move.w          .writelw(pc),(a0)+ ;    byte +=  writelw;
        move.l          d3,(a0)+           ;    byte +=  recentblock;
.br4                                       ;  }
        move.l          .bl2+10,(a0)+      ;  byte += readbyte();
        move.l          d5,(a0)+           ;  byte += nextblock;
.br5                                       ;
        move.l          .bl2+18,(a0)+      ;  byte += block2.readlw();
        move.w          .bl2+22,(a0)+      ;  byte += block2.readword();
        rts                                ;}

.bl2
        btst.l          #31,d0
        beq.s           .br1
        or.w            #$03ff,d4
        move.l          d4,(a2)+           ;2
        move.l          #$c0000000,d4
        bra.s           .br2
.br1
        move.l          d4,(a2)+           ;2
        sub.l           d4,d4
.br2

.writelw:
        or.l            #$00fff000,d4

WriteBlock3:
;input
;a1 - pattern pos to test
;d3 - block data w
;d5 - block data lw

        move.w          .bl2(pc),(a0)+
        move.w          a1,(a0)+
        move.l          .bl2+4,(a0)+
        move.w          d3,(a0)+
        move.l          .bl2+10,(a0)+
        move.l          d5,(a0)+
        move.l          .bl2+18,(a0)+
        move.w          .bl2+22,(a0)+
        rts
.bl2
        btst.l          #31,d0
        beq.s           .br1
        or.w            #$03ff,d4
        move.l          d4,(a2)+           ;2
        move.l          #$c0000000,d4
        bra.s           .br2
.br1
        move.l          d4,(a2)+           ;2
        sub.l           d4,d4
.br2

LwMapLength:
        dc.w 0

DrawLine:
        ;d2 - number of lines to repeat
        ;d5 - layer counter
        ;a0 - blarraydim
        ;a1 - blarraycontent
        ;a2 - space size
        ;a5 - blmap
        ;a3 - bl map y

        move.w  #32,d7
        ;calculate map position
        move.w   #10,.lwrdcounter

        IFEQ BLITTER-0

        ;Line Calculation
        move.w   CNTBLSIZE(a1),d4      ;get width block
        move.w    (a3),d3              ;xpos (offset)
        lea      mapypos(pc),a3
        sub.w     d6,d6
        sub.l     d5,d5                ;lw to write
        sub.l     d1,d1                ;cleanup d1
.ldrawbl2
        move.w    d4,d1
        sub.l     d2,d2                ;full lw base for calc = 0
        btst.l    #31,d0               ;block to draw?
        beq.s       .br5
        subq.l    #1,d2                ;#ffffffff = d2
.br5
        sub.w     #32,d1               ;calculate empty ...
        sub.w     d3,d1                ;... space in this lw to the left
        bpl.s     .bigblock            ;Result > 32 ?
.br1
        neg.w     d1                   ;if not
        cmp.w     #32,d1
        bgt.s     .clearalllw          ;offset greater than than lw
        lsl.l     d1,d2                ;cut off part not visible and too much..
        lsr.l     d6,d2                ;.... or move to right
.br7
        ;prepare next block
        neg.w     d1                   ;offset to left (neg) ...
        add.w     #32,d1               ;....and size of lw
        add.w     d6,d1                ;....and lsr offset = last pos block
.br2
        or.l      d2,d5                ;write to register
        cmp.w     #32,d1               ;block ends in next lw?
        ble.s     .br3                 ;if no jump
.br6
        move.l    d5,(a2)+             ;write lw
        sub.w     #1,.lwrdcounter
        beq.s     .end
        sub.l     d5,d5                ;delete data
        sub.w     #32,d1
        sub.w     d4,d1                ;calc offset to left
        neg.w     d1
        move.w    d1,d3
        sub.w     d6,d6                ;lsr = 0
        bra.s     .ldrawbl2
.br3
        lsl.l     d0
        subq      #1,d7
        beq.s     .mapfwd
        add.w     (a6),d1   ;add blspace = startpos next block
        cmp.w     #32,d1
        blt.s     .br4
        move.l    d5,(a2)+
        sub.l     d5,d5
        sub.w     #1,.lwrdcounter
        beq.s     .end
        sub.w     #32,d1
        cmp.w     #32,d1
        bge.s     .bigspace
.br4
        and.w     #%11111,d1           ;get offset for lsr
        move.w    d1,d6
        sub.w     d3,d3                ;no loffset for block
        bra.s     .ldrawbl2
.end
        ENDC
        move.w    DIMWIDTH(a0),d7
        rts




.clearalllw:
        sub.l     d2,d2
        bra.s     .br7

.bigblock:
        add.l     d6,d1                      ;offset of block to draw later
        move.l    d2,d3                      ;d3 unused atm use this to save d2
        lsr.l     d6,d3                      ;offset to right for first lw
        or.l      d3,d5                      ;finish pattern this lw
        move.l    d5,(a2)+                   ;write to screenbuffer
        sub.w     #1,.lwrdcounter
        beq.s     .end
        sub.w     #32,d1
        bmi.s     .bb1
.bb2
        move.l    d2,(a2)+                   ;save complete block
        sub.w     #1,.lwrdcounter
        beq.s     .end
        sub.w     #32,d1
        bpl.s     .bb2
.bb1
        sub.l     d5,d5
        sub.l     d6,d6
        sub.l     d3,d3
        bra.w     .br1

.mapfwd:
        move.l     (a1)+,d0
        moveq.l     #32,d7
        bra.w      .br5

.bigspace
        moveq.l    #0,d2
.bs1
        move.l     d2,(a2)+
        sub.w      #1,.lwrdcounter
        beq.s      .end
        sub.w      #32,d1
        cmp.w      #32,d1
        bge.s      .bs1
        bra.s      .br4

.saveregs: dc.l 0,0,0,0,0,0,0,0
.savespacewidth: dc.w 0
.lwrdcounter: dc.w BPLWIDTH

currentdrawpos: dc.l 0
patternpos: dc.l 0


mpchkblline:
        dcb.w 4*60,0

bllnflag:
        REPT 5
        ;dcb.w 14,1
        dcb.w 11,0
        dcb.w 3,1
        ENDR
bllnflag2:
        REPT 5
        ;dcb.w 14,1
        dcb.w 5,1
        dcb.w 3,0
        dcb.w 2,1
        dcb.w 3,0
        dc.w 1
        ENDR
bllnflag3:
        REPT 5
        ;dcb.w 11,1
        dcb.w 4,0
        dcb.w 2,1
        dcb.w 2,0
        dcb.w 3,1
        ENDR
bllnflag4:
        REPT 5
        ;dcb.w 11,1
        dcb.w 4,1
        dcb.w 6,0
        dc.w 1
        ENDR
bllnflag5:
        REPT 5
        ;dcb.w 14,1
        dcb.w 1,1
        dcb.w 6,0
        dcb.w 1,1
        dcb.w 1,0
        dcb.w 1,1
        dcb.w 2,0
        dcb.w 2,1
        ENDR
bllnflag6:
        REPT 5
        ;dcb.w 14,1
        dcb.w 3,1
        dcb.w 11,0
        ENDR
bllnflag7:
        REPT 5
        ;dcb.w 11,1
        dcb.w 1,1
        dcb.w 7,0
        ENDR
bllnflag8:
        REPT 5
        ;dcb.w 11,1
        dcb.w 1,1
        dcb.w 3,0
        dcb.w 4,1
        ENDR



blmap:
	dcb.b 384,$ff
blmap2:
	dcb.b 384,$ff
blmap3:
	dcb.b 384,$ff
blmap4:
	dcb.b 384,$ff
blmap5:
	dcb.b 384,$ff
blmap6:
	dcb.b 384,$ff
blmap7:
	dcb.b 384,$ff
blmap8:
	dcb.b 384,$ff

blarraydim:
.blwidth: dc.w 6 ;width in bytes
.blheight: dc.w 14
.bldepth: dc.w 1
.frames: dc.w 130
.blstruct: dc.l blarraycont,blarraycont2,blarraycont3,blarraycont4
	   dc.l blarraycont5,blarraycont6,blarraycont7,blarraycont8

blarraycont:
.posx: dc.w 0
.posy: dc.w 0
.blsize: dc.w 7
.spsize: dc.w 0
.blposy: dc.w 1-1
.blposx: dc.w 1
.blpfrstrt: dc.w 99
.blmap: dc.l blmap8
.bllnflag: dc.l bllnflag8
.blheight: dc.w 8

blarraycont2:
.posx: dc.w 0
.posy: dc.w 0
.blsize: dc.w 8
.spsize: dc.w 0
.blposy: dc.w 1-1
.blposx: dc.w 1
.blfrstrt: dc.w 99
.blmap: dc.l blmap7
.bllnflag: dc.l bllnflag7
.blheight: dc.w 8

blarraycont3:
.posx: dc.w 0
.posy: dc.w 0
.blsize: dc.w 9
.spsize: dc.w 0
.blposy: dc.w 1-1
.blposx: dc.w 1
.blfrstart: dc.w 66
.blmap: dc.l blmap6
.bllnflag dc.l bllnflag6
.blheight: dc.w 8

blarraycont4:
.posx: dc.w 0
.posy: dc.w 0
.blsize: dc.w 10
.spsize: dc.w 0
.blposy: dc.w 1-1
.blposx: dc.w 1
.blfrstrt: dc.w 66
.blmap: dc.l blmap5
.bllnflag dc.l bllnflag5
.blheight: dc.w 8

blarraycont5:
.posx: dc.w 0
.posy: dc.w 0
.blsize: dc.w 14
.spsize: dc.w 0
.blposy: dc.w 1-1
.blposx: dc.w 1
.blpfrstrt: dc.w 34
.blmap: dc.l blmap4
.bllnflag: dc.l bllnflag4
.blheight: dc.w 8

blarraycont6:
.posx: dc.w 0
.posy: dc.w 0
.blsize: dc.w 14
.spsize: dc.w 0
.blposy: dc.w 1-1
.blposx: dc.w 1
.blfrstrt: dc.w 34
.blmap: dc.l blmap3
.bllnflag: dc.l bllnflag3
.blheight: dc.w 8

blarraycont7:
.posx: dc.w 0
.posy: dc.w 0
.blsize: dc.w 12
.spsize: dc.w 0
.blposy: dc.w 1-1
.blposx: dc.w 1
.blfrstart: dc.w 1
.blmap: dc.l blmap2
.bllnflag dc.l bllnflag2
.blheight: dc.w 8

blarraycont8:
.posx: dc.w 0
.posy: dc.w 0
.blsize: dc.w 12
.spsize: dc.w 0
.blposy: dc.w 1-1
.blposx: dc.w 1
.blfrstrt: dc.w 1
.blmap: dc.l blmap
.bllnflag dc.l bllnflag
.blheight: dc.w 8

dldata:dcb.b 2000

DIMWIDTH = 0
DIMHEIGHT = 2
DIMDEPTH = 4
DIMFRAMES = 6
DIMCONTENT = 8

CNTPOSX = 0
CNTPOSY = 2
CNTBLSIZE = 4
CNTSPSIZE = 6
CNTBLPOSY = 8
CNTBLPOSX = 10
CNTFRAME = 12
CNTBLMAP = 14
CNTBLLNFLAG = 18
CNTHEIGHT = 22
CNTOBJSIZE = 24

empty: dcb.l 52,0

      INCLUDE graphics.s

 END

