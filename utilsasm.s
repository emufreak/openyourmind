#define __USER_LABEL_PREFIX__ 
#define __REGISTER_PREFIX__ %
#define __IMMEDIATE_PREFIX__ #

#define CONCAT1(a, b) CONCAT2(a, b)
#define CONCAT2(a, b) a ## b
#define SYM(x) CONCAT1 (__USER_LABEL_PREFIX__, x)
#define FUNC(x) .type SYM(x),function
#define REG(x) CONCAT1 (__REGISTER_PREFIX__, x)
#define IMM(x) CONCAT1 (__IMMEDIATE_PREFIX__, x)
#define d0 REG (d0)
#define d1 REG (d1)
#define d2 REG (d2)
#define d3 REG (d3)
#define d4 REG (d4)
#define d5 REG (d5)
#define d6 REG (d6)
#define d7 REG (d7)
#define a0 REG (a0)
#define a1 REG (a1)
#define a2 REG (a2)
#define a3 REG (a3)
#define a4 REG (a4)
#define a5 REG (a5)
#define a6 REG (a6)
#define fp REG (fp)
#define sp REG (sp)
#define pc REG (pc)

#define	BPLX 320
#define BPLY 256
#define BPLSIZE BPLX*BPLY/8
#define CHUNKYXMAX BPLX
#define CHUNKYYMAX BPLY

/* d0.w	chunkyx [chunky-pixels]
; d1.w	chunkyy [chunky-pixels]
; d2.w	(scroffsx) [screen-pixels]
; d3.w	scroffsy [screen-pixels]
; d4.w	(rowlen) [bytes] -- offset between one row and the next in a bpl
; d5.l	(bplsize) [bytes] -- offset between one row in one bpl and the next bpl*/

	
	.text
	FUNC(c2p1x1_4_c5_gen_init)
	.globl	SYM (c2p1x1_4_c5_gen_init)

SYM(c2p1x1_4_c5_gen_init):
	movem.l	d2-d3,-(sp)
	andi.l	#$ffff,d0
	mulu.w	d0,d3
	lsr.l	#3,d3
	move.l	d3,c2p1x1_4_c5_gen_scroffs
	mulu.w	d0,d1
	move.l	d1,c2p1x1_4_c5_gen_pixels
	movem.l	(sp)+,d2-d3
	rts

// a0	c2pscreen
// a1	bitplanes


	.text
	FUNC(c2p1x1_4_c5_gen)
	.globl	SYM (c2p1x1_4_c5_gen)

SYM(c2p1x1_4_c5_gen):
	movem.l	d2-d7/a2-a6,-(sp)

	move.l	#$33333333,d5
	move.l	#$55555555,a5
	move.l	#$00ff00ff,a6

	add.w	#BPLSIZE,a1
	add.l	c2p1x1_4_c5_gen_scroffs,a1

	move.l	c2p1x1_4_c5_gen_pixels,a2
	add.l	a0,a2
	cmp.l	a0,a2
	beq	.quit

	move.l	(a0)+,d0		// Merge 4x1
	lsl.l	#4,d0
	or.l	(a0)+,d0
	move.l	(a0)+,d1
	lsl.l	#4,d1
	or.l	(a0)+,d1

	move.l	(a0)+,d2
	lsl.l	#4,d2
	or.l	(a0)+,d2
	move.l	(a0)+,d3
	lsl.l	#4,d3
	or.l	(a0)+,d3

	move.w	d2,d6			//; Swap 16x2
	move.w	d3,d4
	move.w	d0,d2
	move.w	d1,d3
	swap	d2
	swap	d3
	move.w	d2,d0
	move.w	d3,d1
	move.w	d6,d2
	move.w	d4,d3

	move.l	d2,d6			//; Swap 2x2
	move.l	d3,d7
	lsr.l	#2,d6
	lsr.l	#2,d7
	eor.l	d0,d6
	eor.l	d1,d7
	and.l	d5,d6
	and.l	d5,d7
	eor.l	d6,d0
	eor.l	d7,d1
	lsl.l	#2,d6
	lsl.l	#2,d7
	eor.l	d6,d2
	eor.l	d7,d3

	move.l	a6,d4			//; Swap 8x1
	move.l	d1,d6
	move.l	d3,d7
	lsr.l	#8,d6
	lsr.l	#8,d7
	eor.l	d0,d6
	eor.l	d2,d7
	and.l	d4,d6
	and.l	d4,d7
	eor.l	d6,d0
	eor.l	d7,d2
	lsl.l	#8,d6
	lsl.l	#8,d7
	eor.l	d6,d1
	eor.l	d7,d3

	bra.w	.start
.x:
	move.l	(a0)+,d0		//; Merge 4x1
	lsl.l	#4,d0
	or.l	(a0)+,d0
	move.l	(a0)+,d1
	lsl.l	#4,d1
	or.l	(a0)+,d1

	move.l	(a0)+,d2
	lsl.l	#4,d2
	or.l	(a0)+,d2
	move.l	(a0)+,d3
	lsl.l	#4,d3
	or.l	(a0)+,d3

	move.l	d6,BPLSIZE(a1)

	move.w	d2,d6			//; Swap 16x2
	move.w	d3,d4
	move.w	d0,d2
	move.w	d1,d3
	swap	d2
	swap	d3
	move.w	d2,d0
	move.w	d3,d1
	move.w	d6,d2
	move.w	d4,d3

	move.l	d7,-BPLSIZE(a1)

	move.l	d2,d6			//; Swap 2x2
	move.l	d3,d7
	lsr.l	#2,d6
	lsr.l	#2,d7
	eor.l	d0,d6
	eor.l	d1,d7
	and.l	d5,d6
	and.l	d5,d7
	eor.l	d6,d0
	eor.l	d7,d1
	lsl.l	#2,d6
	lsl.l	#2,d7
	eor.l	d6,d2
	eor.l	d7,d3

	move.l	a3,BPLSIZE*2(a1)

	move.l	a6,d4			//; Swap 8x1
	move.l	d1,d6
	move.l	d3,d7
	lsr.l	#8,d6
	lsr.l	#8,d7
	eor.l	d0,d6
	eor.l	d2,d7
	and.l	d4,d6
	and.l	d4,d7
	eor.l	d6,d0
	eor.l	d7,d2
	lsl.l	#8,d6
	lsl.l	#8,d7
	eor.l	d6,d1
	eor.l	d7,d3

	move.l	a4,(a1)+
.start:
	move.l	a5,d4			//; Swap 1x1
	move.l	d1,d6
	move.l	d3,d7
	lsr.l	#1,d6
	lsr.l	#1,d7
	eor.l	d0,d6
	eor.l	d2,d7
	and.l	d4,d6
	and.l	d4,d7
	eor.l	d6,d0
	eor.l	d7,d2
	add.l	d6,d6
	add.l	d7,d7
	eor.l	d1,d6
	eor.l	d3,d7

	move.l	d0,a3
	move.l	d2,a4

	cmpa.l	a0,a2
	bne	.x

	move.l	d6,BPLSIZE(a1)
	move.l	d7,-BPLSIZE(a1)
	move.l	a3,BPLSIZE*2(a1)
	move.l	a4,(a1)+
.quit:
	movem.l	(sp)+,d2-d7/a2-a6
	rts



c2p1x1_4_c5_gen_scroffs: dc.l	1
c2p1x1_4_c5_gen_pixels:	dc.l	1