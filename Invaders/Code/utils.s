SetBitplanePointersDefault:
    move.l  draw_buffer(pc),a0
    move.l  view_buffer,draw_buffer
    move.l  a0,view_buffer
	;move.l 	#bitplane+4, d1
	move.l  draw_buffer,d1
	moveq	#BPLCOUNT-1,d2
	move.l  draw_cprbitmap,a2
.lp1
	move.w 	d1,6(a2)
	swap 	d1
	move.w	d1,2(a2)
	swap	d1
	add.l	#40*256,d1
	addq	#8,a2
	dbf	d2,.lp1
	rts

SetBitplanePointers:
        move.l  draw_buffer(pc),a0
        move.l  view_buffer,draw_buffer
        move.l  a0,view_buffer
	;move.l 	#bitplane+4, d1
	move.l  draw_buffer,d1
	moveq	#1,d2
	move.l  draw_copper,a2
	add.l   #OFFSBPLPOINTERS,a2
.lp1
	clr.w   $100
	move.w 	d1,6(a2)
	swap 	d1
	move.w	d1,2(a2)
	swap	d1
	add.l	#BPLWIDTH*40,d1
	addq	#8,a2
	dbf	    d2,.lp1
	rts

SetCopperList:
        move.l  draw_cprbitmap,d0
		move.l  view_cprbitmap,draw_cprbitmap
		move.l  d0,view_cprbitmap
        move.l  draw_copper,d0
        move.l  view_copper,draw_copper
        move.l  d0,view_copper
        IFEQ DEBUG-0
		move.l  view_copper,$dff080
        move.l  d1,$dff088
        ENDC
        rts         

.coplnsel_view: dc.l COLRLINESELECT1
.coplnsel_draw: dc.l COLRLINESELECT2
.copbplpntrs_view: dc.l COLRBITPLANEPOINTERS1
.copbplpntrs_draw: dc.l COLRBITPLANEPOINTERS2		
