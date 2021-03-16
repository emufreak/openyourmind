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

#define	BPLX 336
#define BPLY 268
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
	FUNC(c2p1x1_8_c5_gen_init)
	.globl	SYM (c2p1x1_8_c5_gen_init)

SYM(c2p1x1_8_c5_gen_init):
	movem.l d0-d7/a0-a6, .gi_saveregs	
	move.l  4(sp),d0
	move.l	8(sp),d1
	move.l	12(sp),d2
	move.l	16(sp),d3
	move.l  20(sp),d4
	move.l	24(sp),d5
	andi.l	IMM (0xffff),d0
	mulu.w	d0,d3
	lsr.l	#3,d3
	move.l	d3,c2p1x1_8_c5_gen_scroffs
	mulu.w	d0,d1
	move.l	d1,c2p1x1_8_c5_gen_pixels
	movem.l	.gi_saveregs,d0-d7/a0-a6
	rts
	
.gi_saveregs: .dcb.b 60

// a0	c2pscreen
// a1	bitplanes


	.text
	FUNC(c2p1x1_8_c5_gen)
	.globl	SYM (c2p1x1_8_c5_gen)

SYM(c2p1x1_8_c5_gen):
	movem.l d0-d7/a0-a6,.c2p_saveregs	
	movem.l 4(sp),a0
	movem.l 8(sp),a1
    move.l	IMM (0x33333333),d5
	move.l	IMM (0x55555555),a6

	add.w	#BPLSIZE,a1
	add.l	c2p1x1_8_c5_gen_scroffs,a1

	move.l	c2p1x1_8_c5_gen_pixels,a2
	add.l	a0,a2
	cmp.l	a0,a2
	beq	.none

	movem.l	a0-a1,-(sp)

	move.l	(a0)+,d0
	move.l	(a0)+,d2
	move.l	(a0)+,d1
	move.l	(a0)+,d3

	move.l	IMM( 0x0f0f0f0f),d4		//; Merge 4x1, part 1
	and.l	d4,d0
	and.l	d4,d1
	and.l	d4,d2
	and.l	d4,d3
	lsl.l	#4,d0
	lsl.l	#4,d1
	or.l	d2,d0
	or.l	d3,d1

	move.l	(a0)+,d2
	move.l	(a0)+,d6
	move.l	(a0)+,d3
	move.l	(a0)+,d7

	and.l	d4,d2			//; Merge 4x1, part 2
	and.l	d4,d6
	and.l	d4,d3
	and.l	d4,d7
	lsl.l	#4,d2
	lsl.l	#4,d3
	or.l	d6,d2
	or.l	d7,d3

	move.w	d2,d6			//; Swap 16x2
	move.w	d3,d7
	move.w	d0,d2
	move.w	d1,d3
	swap	d2
	swap	d3
	move.w	d2,d0
	move.w	d3,d1
	move.w	d6,d2
	move.w	d7,d3

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

	move.l	IMM (0x00ff00ff),d4
	move.l	d1,d6			//; Swap 8x1
	move.l	d3,d7
	lsr.l	#8,d6
	lsr.l	#8,d7
	eor.l	d0,d6
	eor.l	d2,d7
	bra	.start1
.x1:
	move.l	(a0)+,d0
	move.l	(a0)+,d2
	move.l	(a0)+,d1
	move.l	(a0)+,d3
	move.l	d7,-BPLSIZE(a1)

	move.l	IMM( 0x0f0f0f0f),d4		//; Merge 4x1, part 1
	and.l	d4,d0
	and.l	d4,d1
	and.l	d4,d2
	and.l	d4,d3
	lsl.l	#4,d0
	lsl.l	#4,d1
	or.l	d2,d0
	or.l	d3,d1

	move.l	(a0)+,d2
	move.l	(a0)+,d6
	move.l	(a0)+,d3
	move.l	(a0)+,d7
	move.l	a3,BPLSIZE(a1)

	and.l	d4,d2			//; Merge 4x1, part 2
	and.l	d4,d6
	and.l	d4,d3
	and.l	d4,d7
	lsl.l	#4,d2
	lsl.l	#4,d3
	or.l	d6,d2
	or.l	d7,d3

	move.w	d2,d6			//; Swap 16x2
	move.w	d3,d7
	move.w	d0,d2
	move.w	d1,d3
	swap	d2
	swap	d3
	move.w	d2,d0
	move.w	d3,d1
	move.w	d6,d2
	move.w	d7,d3
	move.l	a4,BPLSIZE*2(a1)

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

	move.l	IMM (0x00ff00ff),d4
	move.l	d1,d6			//; Swap 8x1
	move.l	d3,d7
	lsr.l	#8,d6
	lsr.l	#8,d7
	eor.l	d0,d6
	eor.l	d2,d7
	move.l	a5,(a1)+
.start1:
	and.l	d4,d6
	and.l	d4,d7
	eor.l	d6,d0
	eor.l	d7,d2
	lsl.l	#8,d6
	lsl.l	#8,d7
	eor.l	d6,d1
	eor.l	d7,d3

	move.l	a6,d4
	move.l	d1,d6			//; Swap 1x1
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

	move.l	d0,a4
	move.l	d2,a5
	move.l	d6,a3

	cmpa.l	a0,a2
	bne	.x1
	move.l	d7,-BPLSIZE(a1)
	move.l	a3,BPLSIZE(a1)
	move.l	a4,BPLSIZE*2(a1)
	move.l	a5,(a1)+

	movem.l	(sp)+,a0-a1
	add.l	#BPLSIZE*4,a1

	move.l	(a0)+,d0
	move.l	(a0)+,d2
	move.l	(a0)+,d1
	move.l	(a0)+,d3

	move.l	IMM (0xf0f0f0f0),d4		//; Merge 4x1, part 1
	and.l	d4,d0
	and.l	d4,d1
	and.l	d4,d2
	and.l	d4,d3
	lsr.l	#4,d2
	lsr.l	#4,d3
	or.l	d2,d0
	or.l	d3,d1

	move.l	(a0)+,d2
	move.l	(a0)+,d6
	move.l	(a0)+,d3
	move.l	(a0)+,d7

	and.l	d4,d2			//; Merge 4x1, part 2
	and.l	d4,d6
	and.l	d4,d3
	and.l	d4,d7
	lsr.l	#4,d6
	lsr.l	#4,d7
	or.l	d6,d2
	or.l	d7,d3

	move.w	d2,d6			//; Swap 16x2
	move.w	d3,d7
	move.w	d0,d2
	move.w	d1,d3
	swap	d2
	swap	d3
	move.w	d2,d0
	move.w	d3,d1
	move.w	d6,d2
	move.w	d7,d3

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

	move.l	IMM (0x00ff00ff),d4
	move.l	d1,d6			//; Swap 8x1
	move.l	d3,d7
	lsr.l	#8,d6
	lsr.l	#8,d7
	eor.l	d0,d6
	eor.l	d2,d7
	bra	.start2
.x2:
	move.l	(a0)+,d0
	move.l	(a0)+,d2
	move.l	(a0)+,d1
	move.l	(a0)+,d3
	move.l	d7,-BPLSIZE(a1)

	move.l	IMM (0xf0f0f0f0),d4		//; Merge 4x1, part 1
	and.l	d4,d0
	and.l	d4,d1
	and.l	d4,d2
	and.l	d4,d3
	lsr.l	#4,d2
	lsr.l	#4,d3
	or.l	d2,d0
	or.l	d3,d1

	move.l	(a0)+,d2
	move.l	(a0)+,d6
	move.l	(a0)+,d3
	move.l	(a0)+,d7
	move.l	a3,BPLSIZE(a1)

	and.l	d4,d2			//; Merge 4x1, part 2
	and.l	d4,d6
	and.l	d4,d3
	and.l	d4,d7
	lsr.l	#4,d6
	lsr.l	#4,d7
	or.l	d6,d2
	or.l	d7,d3

	move.w	d2,d6			//; Swap 16x2
	move.w	d3,d7
	move.w	d0,d2
	move.w	d1,d3
	swap	d2
	swap	d3
	move.w	d2,d0
	move.w	d3,d1
	move.w	d6,d2
	move.w	d7,d3
	move.l	a4,BPLSIZE*2(a1)

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

	move.l	IMM (0x00ff00ff),d4
	move.l	d1,d6			//; Swap 8x1
	move.l	d3,d7
	lsr.l	#8,d6
	lsr.l	#8,d7
	eor.l	d0,d6
	eor.l	d2,d7
	move.l	a5,(a1)+
.start2:
	and.l	d4,d6
	and.l	d4,d7
	eor.l	d6,d0
	eor.l	d7,d2
	lsl.l	#8,d6
	lsl.l	#8,d7
	eor.l	d6,d1
	eor.l	d7,d3

	move.l	a6,d4
	move.l	d1,d6			//; Swap 1x1
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

	move.l	d0,a4
	move.l	d2,a5
	move.l	d6,a3

	cmpa.l	a0,a2
	bne	.x2
	move.l	d7,-BPLSIZE(a1)
	move.l	a3,BPLSIZE(a1)
	move.l	a4,BPLSIZE*2(a1)
	move.l	a5,(a1)+
.none:
	movem.l .c2p_saveregs,d0-d7/a0-a6
	rts

.c2p_saveregs: .dcb.b 60


c2p1x1_8_c5_gen_scroffs: dc.l	1
c2p1x1_8_c5_gen_pixels:	dc.l	1