	idnt	"c:\Users\uersu\Documents\GitData\Cbmadness\WINTEL\prepare_eff6.c"
	opt	0
	opt	NQLPSMRBT
	section	"CODE",code
	public	_prepare_eff6
	cnop	0,4
_prepare_eff6
	sub.w	#60,a7
	movem.l	l3,-(a7)
	lea	l2,a0
	lea	(0+l5,a7),a1
	moveq.l	#2,d0
l6:
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	dbra	d0,l6
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	#10,-(a7)
	move.l	(60+l5,a7),-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d0,(56+l5,a7)
l1
l3	reg
l5	equ	0
	add.w	#60,a7
	rts
; stacksize=68
	cnop	0,4
l2
	dc.l	148220
	dc.l	98044
	dc.l	114172
	dc.l	196543
	dc.l	130685
	dc.l	392709
	dc.l	8257027
	dc.l	12582400
	dc.l	8257027
	dc.l	392709
	dc.l	130685
	dc.l	196543
	dc.l	114172
	dc.l	98044
