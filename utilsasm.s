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

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
  lea 0xdff000,a5
  move.l sp@(4),a0  //Fontlocation
  move.l sp@(8),a3  //Destination
  move.l sp@(12),a2 //Textlocation
  sub.l  d3,d3      //Number of rows = 1
  btst #6,2(a5)     //Wait for blitter to finish
st2wblit:
	btst	#6,2(a5)
	bne.s	st2wblit

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
	sub.l d5,d5      
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char

	sub.l  a6, a6		  //Fetch width of next character
	move.l d2, a6
	add.l	 #font2distance, a6	

	LSL  	#4,d2 	    //Fetch next char
	MOVE.L	d2,a4


	move.l  #0,d4
	ADD.L	  a0,a4	  //Get character in font

	move.w  (a4), d4
	swap	d4
	lsr.l	d5, d4
	or.l	d4, (a3)
	clr.l	d4
	move.w  2(a4), d4
	swap.w  d4
	lsr.l	d5, d4
	or.l	d4, 80(a3)
	clr.l	d4
	move.w  4(a4), d4
	swap	d4
	lsr.l	d5, d4
	or.l  	d4, 80*2(a3)
	clr.l	d4
	move.w  6(a4), d4
	swap	d4
	lsr.l	d5, d4
	or.l	d4, 80*3(a3)
	clr.l	d4
	move.w  8(a4), d4
	swap	d4
	lsr.l	d5, d4
	or.l  	d4, 80*4(a3)
	clr.l	d4	
	move.w  10(a4), d4
	swap	d4
	lsr.l	d5, d4
	or.l  	d4, 80*5(a3)
	clr.l	d4
	move.w  12(a4), d4
	swap	d4
	lsr.l	d5, d4
	or.l  	d4, 80*6(a3)
	clr.l	d4
	move.w  14(a4), d4
	swap	d4
	lsr.l	d5, d4
	or.l  	d4, 80*7(a3)    
	clr.l	d4

	add.b   (a6), d5
	cmp.w   #8,d5
	bcs	noadditionalchar
	addq.w  #1, a3
	sub.w   #8,d5

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
  movem.l saveregs,d0-d7/a0-a6

	RTS
  