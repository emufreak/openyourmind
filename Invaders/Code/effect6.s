Effect6_0:
  lea.l   CREDITSCHK,a0
  lea.l   BPLIMAGE,a1
  bsr.w   c2p1x1_4_c5_gen
  move.l #COPPERLISTROTATE1,$dff080
  move.l #BPLLOGO,draw_buffer
  move.l #BPLLOGO,view_buffer
  move.l #COPPERLISTROTATE1,view_copper
  move.l #COPPERLISTROTATE2,draw_copper
  move.l #COLRBITPLANEPOINTERS1,view_cprbitmap
  move.l #COLRBITPLANEPOINTERS2,draw_cprbitmap
  move.l #COLRLINESELECT1,view_cprlnsel
  move.l #COLRLINESELECT2,draw_cprlnsel
  bsr.w  DrawLines4Rotation
  move.b #$2c,d1
  move.w #255,d0
  move.l view_cprlnsel,a3
.lp1
  move.b d1,(a3)
  add.l  #9*4,a3
  add.b  #1,d1
  dbf    d0,.lp1
  move.b #$2c,d1
  move.w #255,d0
  move.l draw_cprlnsel,a3
.lp2
  move.b d1,(a3)
  add.l  #9*4,a3
  add.b  #1,d1
  dbf    d0,.lp2
  move.w #1,continue
  bra.w  mlgoon

Effect6_11:
  bsr.w  Effect6_1x
  lea.l  COLRBPLCON0_1,a0
  move.w #$2200,2(a0)
  lea.l  COLRBPLCON0_2,a0
  move.w #$2200,2(a0)
  sub.w  #1,.counter
  beq.s  .br1
  bra.w  mlgoon
.br1
  move.w #1,continue
  bra.w  mlgoon 

.counter: dc.w 2*50

Effect6_12:
  lea.l  COLRBPLCON0_1,a0
  move.w #$4200,2(a0)
  lea.l  COLRBPLCON0_2,a0
  move.w #$4200,2(a0)
  bsr.w  Effect6_1x
  sub.w  #1,.counter
  beq.s  .br1
  bra.w  mlgoon
.br1
  move.w #1,continue
  bra.w  mlgoon 

.counter: dc.w 2*50

Effect6_13:
  lea.l  COLRBPLCON0_1,a0
  move.w #$6200,2(a0)
  lea.l  COLRBPLCON0_2,a0
  move.w #$6200,2(a0)
  bsr.w  Effect6_1x
  sub.w  #1,.counter
  beq.s  .br1
  bra.w  mlgoon
.br1
  move.w #1,continue
  bra.w  mlgoon 

.counter: dc.w 2*50
  
Effect6_14:
  lea.l  COLRBPLCON0_1,a0
  move.w #$210,2(a0)
  lea.l  COLRBPLCON0_2,a0
  move.w #$210,2(a0)
  bsr.w  Effect6_1x
  sub.w  #1,.counter
  beq.s  .br1
  bra.w  mlgoon
.br1
  move.w #1,continue
  bra.w  mlgoon 

.counter: dc.w 2*50

Effect6_1x:

;a4 = copptr
;a5 = colptrhw
;a6 = copptrlw   

  movem.l empty,a0-a5/d0-d7
  move.w  #$c00,$dff106
  move.w  #$0,$dff180
  bsr.w   SetCopperList4Rotation  
  move.l  .colptr(pc),a5
  move.l  draw_cprpalh,a4
  move.l  draw_cprpall,a6 
  sub.l   d5,d5
  lea.l  .linesizepos,a0
  move.l  28(a0),a0
  move.l  (a0),d5
  lsl.l   #8,d5                   ;  intensity = frmdat[7].size*256/640
  divu.l  #640,d5
  and.l   #$ffff,d5
  move.w  #7,d2
  bsr.w   SetColDataFade
  move.l  .colptr(pc),a5
  cmp.l   #$0fffffff,(a5)   
  bne.s   .br5
  lea.l   EF61_COLORS1,a5
.br5  
  move.l   a5,.colptr    
  movem.l  empty,d0-d7              
  lea.l    EF4_STARTPOS1,a0
  move.l   draw_cprlnsel,a3
  move.l   draw_cprbitmap,a1
  move.l   #.frmpos,.curfrmpos
  move.l   #.lineshiftpos,.curlshiftpos
  move.l   #.linesizepos,.curlsizepos
  moveq.l  #8-1,d3
.lp2
  move.l   .curfrmpos,a5        ;load frame[curplane].linemultiplier[pos]
  move.l   (a5),a5
  move.l   .curlshiftpos,a6
  move.l   (a6),a6
  move.l    .curlsizepos,a2
  move.l   (a2),a2
  bsr.w    WriteCopper4Rotation
  addq.l   #4,a5
  addq.l   #4,a6
  cmp.l    #$0fffffff,(a5)          
  bne.s    .br3
  move.l   d3,d0
  lsr.w    d0
  btst.l   #0,d0
  beq.s    .br1
  lea.l    EF61_LINEMULTIPLIERS,a5
  lea.l    EF61_LINESHIFTS,a6
  bra.s    .br3
.br1
  lea.l    EF61_LINEMULTIPLIERS,a5
  lea.l    EF61_LINESHIFTSCCW,a6
.br3
  move.l   .curfrmpos,a4
  move.l   a5,(a4)
  add.l    #4,.curfrmpos
  move.l   .curlshiftpos,a4
  move.l   a6,(a4)
  add.l    #4,.curlshiftpos
  add.l    #4,.curlsizepos
  dbf      d3,.lp2
.br2
  move.w  #$c00,$dff106
  move.w  #$000,$dff180
  rts

.frmpos: 
  dc.l EF61_LINEMULTIPLIERS
  dc.l EF61_LINEMULTIPLIERS+134*4
  dc.l EF61_LINEMULTIPLIERS
  dc.l EF61_LINEMULTIPLIERS+134*4
  dc.l EF61_LINEMULTIPLIERS
  dc.l EF61_LINEMULTIPLIERS+134*4
  dc.l EF61_LINEMULTIPLIERS
  dc.l EF61_LINEMULTIPLIERS+134*4
  
.lineshiftpos: 
  dc.l EF61_LINESHIFTS
  dc.l EF61_LINESHIFTS+134*4
  dc.l EF61_LINESHIFTSCCW
  dc.l EF61_LINESHIFTSCCW+134*4
  dc.l EF61_LINESHIFTS
  dc.l EF61_LINESHIFTS+134*4
  dc.l EF61_LINESHIFTSCCW
  dc.l EF61_LINESHIFTSCCW+134*4

.linesizepos: 
  dc.l EF74_LINESIZE_0
  dc.l EF74_LINESIZE_0
  dc.l EF74_LINESIZE_2
  dc.l EF74_LINESIZE_2
  dc.l EF74_LINESIZE_4
  dc.l EF74_LINESIZE_4
  dc.l EF74_LINESIZE_6
  dc.l EF74_LINESIZE_6
  
.colptr dc.l EF61_COLORS1
.curfrmpos: dc.l 0
.curlshiftpos: dc.l 0
.curlsizepos: dc.l 0

ef6_colptr: dc.l EF61_COLORS1

Effect6_2:

;a4 = copptr
;a5 = colptrhw
;a6 = copptrlw   

  lea.l  COLRBPLCON0_1,a0
  move.w #$210,2(a0)
  lea.l  COLRBPLCON0_2,a0
  move.w #$210,2(a0)

  movem.l empty,a0-a5/d0-d7
  move.w  #$c00,$dff106
  move.w  #$000,$dff180
  bsr.w   SetCopperList4Rotation  
  move.l  ef6_colptr(pc),a5
  move.l  draw_cprpalh,a4
  move.l  draw_cprpall,a6 
  sub.l   d5,d5
  lea.l  .linesizepos,a0
  move.l  28(a0),a0
  move.l  (a0),d5
  lsl.l   #8,d5                   ;  intensity = frmdat[7].size*256/640
  divu.l  #640,d5
  and.l   #$ffff,d5
  move.w  #7,d2
  bsr.w   SetColDataFade
  move.l  ef6_colptr(pc),a5
  cmp.l   #$0fffffff,(a5)   
  bne.s   .br5
  lea.l   EF61_COLORS1,a5
.br5    
  movem.l  empty,d0-d7              
  lea.l    EF4_STARTPOS1,a0
  move.l   draw_cprlnsel,a3
  move.l   draw_cprbitmap,a1
  move.l   #.frmpos,.curfrmpos
  move.l   #.lineshiftpos,.curlshiftpos
  move.l   #.linesizepos,.curlsizepos
  moveq.l  #8-1,d3
.lp2
  move.l   .curfrmpos,a5        ;load frame[curplane].linemultiplier[pos]
  move.l   (a5),a5
  move.l   .curlshiftpos,a6
  move.l   (a6),a6
  move.l    .curlsizepos,a2
  move.l   (a2),a2
  bsr.w    WriteCopper4Rotation
  addq.l   #4,a5
  addq.l   #4,a6
  addq.l   #4,a2
  cmp.l    #$0fffffff,(a5)          
  bne.s    .br3
  sub.l    #536*4,a5
  sub.l    #536*4,a6
.br3
  move.l   .curfrmpos,a4
  move.l   a5,(a4)
  add.l    #4,.curfrmpos
  move.l   .curlshiftpos,a4
  add.l    #4,.curlshiftpos
  move.l   a6,(a4)
  move.l   .curlsizepos,a4
  move.l   a2,(a4)
  add.l    #4,.curlsizepos
  dbf      d3,.lp2

  cmp.l    #$0fffffff,(a2)         
  bne.w    .br4
  lea.l    .linesizepos,a0
  REPT 8
  sub.l    #134*4,(a0)+
  ENDR
  move.l   ef6_colptr(pc),a5
  add.l    #1024,a5
  cmp.l    #$0fffffff,(a5) 
  bne.s    .br6
  lea.l    EF61_COLORS1,a5
.br6
  move.l   a5,ef6_colptr 
  lea.l    .lineshiftpos,a0
  move.l   24(a0),d0
  move.l   28(a0),d1
  move.l   20(a0),28(a0)
  move.l   16(a0),24(a0)
  move.l   12(a0),20(a0)
  move.l   8(a0),16(a0)
  move.l   4(a0),12(a0)
  move.l   (a0),8(a0)
  move.l   d1,4(a0)
  move.l   d0,(a0)
.br4
  move.w #$c00,$dff106
  move.w #$000,$dff180 
  cmp.w  #20,P61_Pos
  bne.s  .br7
  move.l .frmpos,a5        ;load frame[curplane].linemultiplier[pos]
  cmp.l  #81920,(a5)
  beq.s  .br1
.br7 
  bra.w  mlgoon
.br1
  move.w #1,continue
  bra.w  mlgoon

.frmpos: 
  dc.l EF61_LINEMULTIPLIERS
  dc.l EF61_LINEMULTIPLIERS+134*4
  dc.l EF61_LINEMULTIPLIERS
  dc.l EF61_LINEMULTIPLIERS+134*4
  dc.l EF61_LINEMULTIPLIERS
  dc.l EF61_LINEMULTIPLIERS+134*4
  dc.l EF61_LINEMULTIPLIERS
  dc.l EF61_LINEMULTIPLIERS+134*4
  
.lineshiftpos: 
  dc.l EF61_LINESHIFTS
  dc.l EF61_LINESHIFTS+134*4
  dc.l EF61_LINESHIFTSCCW
  dc.l EF61_LINESHIFTSCCW+134*4
  dc.l EF61_LINESHIFTS
  dc.l EF61_LINESHIFTS+134*4
  dc.l EF61_LINESHIFTSCCW
  dc.l EF61_LINESHIFTSCCW+134*4

.linesizepos: 
  dc.l EF61_LINESIZE_0
  dc.l EF61_LINESIZE_0
  dc.l EF61_LINESIZE_1
  dc.l EF61_LINESIZE_1
  dc.l EF61_LINESIZE_2
  dc.l EF61_LINESIZE_2
  dc.l EF61_LINESIZE_3
  dc.l EF61_LINESIZE_3
  
.curfrmpos: dc.l 0
.curlshiftpos: dc.l 0
.curlsizepos: dc.l 0


Effect6_4:

;a4 = copptr
;a5 = colptrhw
;a6 = copptrlw   

  lea.l  COLRBPLCON0_1,a0
  move.w #$210,2(a0)
  lea.l  COLRBPLCON0_2,a0
  move.w #$210,2(a0)

  movem.l empty,a0-a5/d0-d7
  move.w  #$c00,$dff106
  move.w  #$000,$dff180
  bsr.w   SetCopperList4Rotation  
  move.l  ef6_colptr(pc),a5
  move.l  draw_cprpalh,a4
  move.l  draw_cprpall,a6 
  sub.l   d5,d5
  lea.l  .linesizepos,a0
  move.l  28(a0),a0
  move.l  (a0),d5
  lsl.l   #8,d5                   ;  intensity = frmdat[7].size*256/640
  divu.l  #640,d5
  and.l   #$ffff,d5
  move.w  #7,d2
  bsr.w   SetColDataFade
  move.l  ef6_colptr(pc),a5
  cmp.l   #$0fffffff,(a5)   
  bne.s   .br5
  lea.l   EF61_COLORS1,a5
.br5  
  movem.l  empty,d0-d7              
  lea.l    EF4_STARTPOS1,a0
  move.l   draw_cprlnsel,a3
  move.l   draw_cprbitmap,a1
  move.l   #.frmpos,.curfrmpos
  move.l   #.lineshiftpos,.curlshiftpos
  move.l   #.linesizepos,.curlsizepos
  moveq.l  #8-1,d3
.lp2
  move.l   .curfrmpos,a5        ;load frame[curplane].linemultiplier[pos]
  move.l   (a5),a5
  move.l   .curlshiftpos,a6
  move.l   (a6),a6
  move.l    .curlsizepos,a2
  move.l   (a2),a2
  bsr.w    WriteCopper4Rotation
  btst.l   #0,d3
  beq.s    .br7
  addq.l   #4,a5
  addq.l   #4,a6
.br7
  addq.l   #4,a2
  cmp.l    #$0fffffff,(a5)          
  bne.s    .br3
  sub.l    #268*4,a5
  sub.l    #268*4,a6
.br3
  move.l   .curfrmpos,a4
  move.l   a5,(a4)
  add.l    #4,.curfrmpos
  move.l   .curlshiftpos,a4
  add.l    #4,.curlshiftpos
  move.l   a6,(a4)
  move.l   .curlsizepos,a4
  move.l   a2,(a4)
  add.l    #4,.curlsizepos
  dbf      d3,.lp2

  cmp.l    #$0fffffff,(a2)         
  bne.w    .br4
  lea.l    .linesizepos,a0
  REPT 8
  sub.l    #134*4,(a0)+
  ENDR
  move.l   ef6_colptr(pc),a5
  add.l    #1024,a5
  cmp.l    #$0fffffff,(a5) 
  bne.s    .br6
  lea.l    EF61_COLORS1,a5
.br6
  move.l   a5,ef6_colptr 
  lea.l    .lineshiftpos,a0
  move.l   24(a0),d0
  move.l   28(a0),d1
  move.l   20(a0),28(a0)
  move.l   16(a0),24(a0)
  move.l   12(a0),20(a0)
  move.l   8(a0),16(a0)
  move.l   4(a0),12(a0)
  move.l   (a0),8(a0)
  move.l   d1,4(a0)
  move.l   d0,(a0)
  lea.l    .frmpos,a0
  move.l   24(a0),d0
  move.l   28(a0),d1
  move.l   20(a0),28(a0)
  move.l   16(a0),24(a0)
  move.l   12(a0),20(a0)
  move.l   8(a0),16(a0)
  move.l   4(a0),12(a0)
  move.l   (a0),8(a0)
  move.l   d1,4(a0)
  move.l   d0,(a0)
.br4
  move.w  #$c00,$dff106
  move.w  #$000,$dff180
  cmp.w  #22,P61_Pos
  bne.s  .br8
  move.l .frmpos,a5        ;load frame[curplane].linemultiplier[pos]
  cmp.l  #98274,(a5)
  beq.s  .br1
.br8
  bra.w  mlgoon
.br1
  move.w #1,continue
  bra.w  mlgoon

.frmpos: 
  dc.l EF64_LINEMULTIPLIERS+34*4
  dc.l EF61_LINEMULTIPLIERS
  dc.l EF64_LINEMULTIPLIERS+232*4
  dc.l EF61_LINEMULTIPLIERS
  dc.l EF64_LINEMULTIPLIERS+34*4
  dc.l EF61_LINEMULTIPLIERS
  dc.l EF64_LINEMULTIPLIERS+232*4
  dc.l EF61_LINEMULTIPLIERS
  
.lineshiftpos: 
  dc.l EF64_LINESHIFTS+34*4
  dc.l EF61_LINESHIFTS
  dc.l EF64_LINESHIFTS+232*4
  dc.l EF61_LINESHIFTS
  dc.l EF64_LINESHIFTS+34*4
  dc.l EF61_LINESHIFTS
  dc.l EF64_LINESHIFTS+232*4
  dc.l EF61_LINESHIFTS

.linesizepos: 
  dc.l EF61_LINESIZE_0
  dc.l EF61_LINESIZE_0
  dc.l EF61_LINESIZE_1
  dc.l EF61_LINESIZE_1
  dc.l EF61_LINESIZE_2
  dc.l EF61_LINESIZE_2
  dc.l EF61_LINESIZE_3
  dc.l EF61_LINESIZE_3
  
.curfrmpos: dc.l 0
.curlshiftpos: dc.l 0
.curlsizepos: dc.l 0

Effect6_5:

;a4 = copptr
;a5 = colptrhw
;a6 = copptrlw   

  lea.l  COLRBPLCON0_1,a0
  move.w #$210,2(a0)
  lea.l  COLRBPLCON0_2,a0
  move.w #$210,2(a0)

  movem.l empty,a0-a5/d0-d7
  move.w  #$c00,$dff106
  move.w  #$000,$dff180
  bsr.w   SetCopperList4Rotation  
  move.l  ef6_colptr(pc),a5
  move.l  draw_cprpalh,a4
  move.l  draw_cprpall,a6 
  sub.l   d5,d5
  lea.l  .linesizepos,a0
  move.l  28(a0),a0
  move.l  (a0),d5
  lsl.l   #8,d5                   ;  intensity = frmdat[7].size*256/640
  divu.l  #640,d5
  and.l   #$ffff,d5
  move.w  #7,d2
  bsr.w   SetColDataFade
  move.l  ef6_colptr(pc),a5
  cmp.l   #$0fffffff,(a5)   
  bne.s   .br5
  lea.l   EF61_COLORS1,a5
.br5  
  movem.l  empty,d0-d7              
  lea.l    EF4_STARTPOS1,a0
  move.l   draw_cprlnsel,a3
  move.l   draw_cprbitmap,a1
  move.l   #.frmpos,.curfrmpos
  move.l   #.lineshiftpos,.curlshiftpos
  move.l   #.linesizepos,.curlsizepos
  moveq.l  #8-1,d3
.lp2
  move.l   .curfrmpos,a5        ;load frame[curplane].linemultiplier[pos]
  move.l   (a5),a5
  move.l   .curlshiftpos,a6
  move.l   (a6),a6
  move.l    .curlsizepos,a2
  move.l   (a2),a2
  bsr.w    WriteCopper4Rotation
  btst.l   #0,d3
  beq.s    .br7
  addq.l   #4,a5
  addq.l   #4,a6
.br7
  addq.l   #4,a2
  cmp.l    #$0fffffff,(a5)          
  bne.s    .br3
  sub.l    #268*4,a5
  sub.l    #268*4,a6
.br3
  move.l   .curfrmpos,a4
  move.l   a5,(a4)
  add.l    #4,.curfrmpos
  move.l   .curlshiftpos,a4
  add.l    #4,.curlshiftpos
  move.l   a6,(a4)
  move.l   .curlsizepos,a4
  move.l   a2,(a4)
  add.l    #4,.curlsizepos
  dbf      d3,.lp2

  cmp.l    #$0fffffff,(a2)         
  bne.w    .br4
  lea.l    .linesizepos,a0
  REPT 8
  sub.l    #134*4,(a0)+
  ENDR
  move.l   ef6_colptr(pc),a5
  add.l    #1024,a5
  cmp.l    #$0fffffff,(a5) 
  bne.s    .br6
  lea.l    EF61_COLORS1,a5
.br6
  move.l   a5,ef6_colptr 
  lea.l    .lineshiftpos,a0
  move.l   24(a0),d0
  move.l   28(a0),d1
  move.l   20(a0),28(a0)
  move.l   16(a0),24(a0)
  move.l   12(a0),20(a0)
  move.l   8(a0),16(a0)
  move.l   4(a0),12(a0)
  move.l   (a0),8(a0)
  move.l   d1,4(a0)
  move.l   d0,(a0)
  lea.l    .frmpos,a0
  move.l   24(a0),d0
  move.l   28(a0),d1
  move.l   20(a0),28(a0)
  move.l   16(a0),24(a0)
  move.l   12(a0),20(a0)
  move.l   8(a0),16(a0)
  move.l   4(a0),12(a0)
  move.l   (a0),8(a0)
  move.l   d1,4(a0)
  move.l   d0,(a0)
.br4
  move.w  #$c00,$dff106
  move.w  #$000,$dff180
  cmp.w  #23,P61_Pos
  bne.s  .br8
  move.l .lineshiftpos,a5        ;load frame[curplane].linemultiplier[pos]
  cmp.l  #0,(a5)
  beq.s  .br1
.br8
  bra.w  mlgoon
.br1
  move.l ef6_colptr,d0
  move.w #1,continue
  bra.w  mlgoon

.frmpos: 
  dc.l EF65_LINEMULTIPLIERS+67*4
  dc.l EF61_LINEMULTIPLIERS+134*4
  dc.l EF65_LINEMULTIPLIERS+199*4
  dc.l EF61_LINEMULTIPLIERS+134*4
  dc.l EF65_LINEMULTIPLIERS+67*4
  dc.l EF61_LINEMULTIPLIERS+134*4
  dc.l EF65_LINEMULTIPLIERS+199*4
  dc.l EF61_LINEMULTIPLIERS+134*4
  
.lineshiftpos: 
  dc.l EF65_LINESHIFTS+67*4
  dc.l EF61_LINESHIFTS+134*4
  dc.l EF65_LINESHIFTS+199*4
  dc.l EF61_LINESHIFTS+134*4
  dc.l EF65_LINESHIFTS+67*4
  dc.l EF61_LINESHIFTS+134*4
  dc.l EF65_LINESHIFTS+199*4
  dc.l EF61_LINESHIFTS+134*4

.linesizepos: 
  dc.l EF61_LINESIZE_0
  dc.l EF61_LINESIZE_0
  dc.l EF61_LINESIZE_1
  dc.l EF61_LINESIZE_1
  dc.l EF61_LINESIZE_2
  dc.l EF61_LINESIZE_2
  dc.l EF61_LINESIZE_3
  dc.l EF61_LINESIZE_3
  
.curfrmpos: dc.l 0
.curlshiftpos: dc.l 0
.curlsizepos: dc.l 0
 
 
 