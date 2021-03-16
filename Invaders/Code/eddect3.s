Effect3_0:
  bsr.w  InitScreenBuffers
  move.l #BITPLANE,view_buffer
  move.l #BITPLANE+BPLWIDTH*40*BPLCOUNT,draw_buffer
  ;lea    EF2_PATTERNDATA7,a0
  ;move.l #PTR_EMPTY_DATA,(a0)
 ; lea    EF2_PATTERNDATA6,a0
  ;move.l #PTR_EMPTY_DATA,(a0)
  move.w #1,continue
  bra.w  mlgoon


Effect3_1:
  ;move.w #$00,$dff180
  move.w #1,Eff2ZoomIn        
  bsr.w  Effect3_Main
  ;move.w #$c00,$dff106
  ;move.w #$000,$dff180
  cmp.w  #51,ef3_moves
  bne.s  .br1 
  move.w #0,ef3_movepct
  lea    EF2_PATTERNDATA5,a0
  move.l #PTR_EMPTY_DATA,(a0)
  lea    EF2_PATTERNDATA0,a0
  move.l #PTR_EMPTY_DATA,(a0)
  move.w #1,continue
.br1
  bra.w  mlgoon

Effect3_21:
  ;move.w #$00,$dff180
  move.w #1,Eff2ZoomIn
  bsr.w  Effect3_Main
  ;move.w #$c00,$dff106
  ;move.w #$000,$dff180
  sub.w  #1,.counter
  beq.s  .br1
  bra.w  mlgoon
.br1
  lea    EF2_PATTERNDATA0,a0
  move.l #PTR_CHECKERBOARD_DATA,(a0)
  lea    EF2_PATTERNDATA1,a0
  move.l #PTR_EMPTY_DATA,(a0)
  lea    EF2_PATTERNDATA4,a0
  move.l #PTR_EMPTY_DATA,(a0)
  move.w #1,continue
  bra.w  mlgoon

.counter: dc.w 45 

Effect3_22:
  ;move.w #$00,$dff180
  move.w #1,Eff2ZoomIn
  bsr.w  Effect3_Main
  ;move.w #$c00,$dff106
  ;move.w #$000,$dff180
  sub.w  #1,.counter
  beq.s  .br1
  bra.w  mlgoon
.br1
  lea    EF2_PATTERNDATA0,a0
  move.l #PTR_EMPTY_DATA,(a0)
  lea    EF2_PATTERNDATA1,a0
  move.l #PTR_CHECKERBOARDINV_DATA,(a0)
  lea    EF2_PATTERNDATA2,a0
  move.l #PTR_EMPTY_DATA,(a0)
  lea    EF2_PATTERNDATA3,a0
  move.l #PTR_EMPTY_DATA,(a0)
  lea    EF2_PATTERNDATA4,a0
  move.l #PTR_CHECKERBOARD_DATA,(a0)
  lea    EF2_PATTERNDATA5,a0
  move.l #PTR_EMPTY_DATA,(a0)
  move.w #1,continue
  bra.w  mlgoon

.counter: dc.w 45 

Effect3_23:
  ;move.w #$00,$dff180
  move.w #1,Eff2ZoomIn
  bsr.w  Effect3_Main
  ;move.w #$c00,$dff106
  ;move.w #$000,$dff180
  sub.w  #1,.counter
  beq.s  .br1
  bra.w  mlgoon
.br1
  lea    EF2_PATTERNDATA0,a0
  move.l #PTR_CHECKERBOARD_DATA,(a0)
  lea    EF2_PATTERNDATA1,a0
  move.l #PTR_EMPTY_DATA,(a0)
  lea    EF2_PATTERNDATA2,a0
  move.l #PTR_EMPTY_DATA,(a0)
  lea    EF2_PATTERNDATA3,a0
  move.l #PTR_EMPTY_DATA,(a0)
  lea    EF2_PATTERNDATA4,a0
  move.l #PTR_EMPTY_DATA,(a0)
  lea    EF2_PATTERNDATA5,a0
  move.l #PTR_CHECKERBOARD_DATA,(a0)
  move.w #1,continue
  bra.w  mlgoon

.counter: dc.w 45 

Effect3_24:
  ;move.w #$00,$dff180
  move.w #1,Eff2ZoomIn
  bsr.w  Effect3_Main
  ;move.w #$c00,$dff106
  ;move.w #$000,$dff180
  sub.w  #1,.counter
  beq.s  .br1
  bra.w  mlgoon
.br1
  move.w #1,continue
  bra.w  mlgoon

.counter: dc.w 45 

ef3_dirchanges: dc.w 0
ef3_moves: dc.w 5
ef3_movepct: dc.w 5


Effect3_Main:
;a0 = blarraydim
;a1 = frmdat[]
;a2 = laydat
;a3 = frame
;a4 = reserved SetColData
;a5 = colptr
;a6 = *blarraycont.data (temp)

        bsr.w   SetCopperList			;  Setcopperlist();
        bsr.w   SetBitplanePointers     ;  SetBitplanePointers();
		lea     .frame,a3              ;
		lea     EF2_PATTERNDATA7,a1		;  frmdat = EFF1_PATTERNDATA7
		;sub.l nam  #FRMSIZE*7,a1         ; DEBUG
		lea	    blarraycont,a2			;  laydat = blarraycont.data
		move.l  (a1),a6
		sub.l   #4,a6
		lea     blarraydim,a0			;  blarraydim.width =
		move.w  (a6),DIMWIDTH(a0)	;  	        *blarraycont.data.width;
		move.w  2(a6),DIMHEIGHT(a0)	;  blarraydim.height =
										;  		    blarraycont.data.height;
	    move.w  ef3_movepct(pc),d0
	
	    lea     .counter,a5             
		add.w   #1,(a5) 
		cmp.w   #35,(a5)                ; frame < 35 no movement
		bls.s   .br7
		cmp.w   #55,(a5)                ; frame < 55 move
		beq.s   .br10
        bge.s   .br8  		
	    add.w   d0,.movement
		bra.s   .br7	
.br10
        add.w   #1,ef3_moves		
.br8
        cmp.w   #80,(a5)
        bls.s   .br7
        cmp.w   #99,(a5)                ; frame between 70 and 89 move to left
		bge.s   .br9       
        add.w   d0,.movement
        bra.s   .br7	
.br9
        add.w   #1,ef3_moves	
        move.w  #0,.movement
		move.l  (a3),d0
		lsr.l   d0
		move.w  d0,(a5)
.br7
        move.w  .movement,a5		
		sub.l   a6,a6
										
        move.w   #7,.i     		    ;  for(int i=0;i<8;i++)
.lp1  
								;  {	
		bsr.w   GetFrame2        		;    GetFrame(  framedate,frmnr)		        
		bsr.w   MoveDataV2
		bsr.w   SetFrame                ;    SetFrame(  input,laydat)
		cmp.w   #320,d5
		bhi.s   .br5
		move.l  (a1),CNTBLMAP(a2)      ;    *frmdat.blmap = *laydat.blmap
		bra.s   .br6
.br5
        move.l  #PTR_EMPTY_DATA,CNTBLMAP(a2)
.br6
		sub.l   #FRMSIZE2,a1		    ;  	 frmdat++; //Next object
		add.l   #CNTOBJSIZE,a2         ;    laydat++;
		sub.w   #1,.i
		bpl.s   .lp1			        ;  }
        ;bsr.w    MoveAdjust             ;  MoveAdjust( );
		move.l  .colptr(pc),a5
		movem.l d0-d7/a0-a6,.save
		move.l  draw_copper,a4          ;  copptr = draw_buffer;
		add.l   #2,a4                   ;  copptr += 10;
		move.l  a4,a6                   ;  copptrlw = copptr;
		add.l   #OFFSCLPALETTE,a4       ;  copptr += offsclpalette;
		add.l   #OFFSCLPALETTELW,a6     ;  copptrlw += offsclpalettelw;
        move.l  #255,d5
		move.l  #7,d2		
		bsr.w   SetColDataFade		    ;  SetColData(  colptr);
		movem.l .save,d0-d7/a0-a6
		cmp.w   #0,Eff2ZoomIn           ;  if(Eff1ZoomIn( )
		beq.s   .br3                    ;  {
		lea	   .colptr,a5
		move.l .direction,d1
	    add.l  d1,(a3)					;    frame += direction
		cmp.l  #90,(a3)                 ;    if(frame > 45
		beq.s  .br4                     ;                || frame == 0)
		cmp.l  #-2,(a3)                  ;    {
		bne.s  .br2
.br4             
        add.w   #1,ef3_dirchanges        
		neg.l   d1                      ;      direction =* -1;
		move.l  d1,.direction
		add.l   d1,(a3)                 ;      frame += direction;
		lea     EF2_PATTERNDATA0,a1
		move.w  #3,d1                   ;      for(int i=0;i<4;i++)
.lp2									;      {
		move.l  (a1),d3     			;        tmp = ptrndata[i*2];
		move.l  FRMSIZE2(a1),(a1)	    ;        ptrndata[i*2] =
		move.l  d3,FRMSIZE2(a1)		    ;             ptrndata[i*2+1];
		add.l   #FRMSIZE2*2,a1			;        ptrndata[i*2+1] = tmp;
		dbf     d1,.lp2				    ;      }   
.br2                                    
		add.l  #1024,(a5)          		;    colptr++
		move.l (a5),a1
		cmp.l  #$ffffffff,(a1)
		bne.s  .br3
		move.l #EF2_COLORS1,(a5) 
.br3                                    ;  }
		bsr.w  DrawLines                ;  DrawLines(blarraydim);
        ;move.w #$c00,$dff106           ;  Reg_Col0 = 00;
	    ;move.w #$0,$dff180
.br1        							;}
        rts

.save dcb.l 15,0
.i dc.w 7
.counter: dc.w 0
.frame: dc.l 0
.colptr: dc.l EF2_COLORS1
.direction: dc.l 2
.dircolor: dc.l 1024
.movement: dc.w 0

EffInvert: dc.w 0

Eff3ZoomIn: dc.w 0