DUMMY equ 0

view_buffer:
        dc.l    0

draw_buffer:
        dc.l    0

view_copper:
        dc.l    copperlist

draw_copper:
        dc.l    copperlist+OFFSNEXTCOPPER

view_cprbitmap:
		dc.l    copperlist+OFFSBPLPOINTERS
		
draw_cprbitmap:
        dc.l    copperlist+OFFSBPLPOINTERS+OFFSNEXTCOPPER

view_cprlnsel:
		dc.l    COLRLINESELECT1
		
draw_cprlnsel:
        dc.l    COLRLINESELECT2
		
view_cprpalh:
       dc.l COLCOLORSHIGH1+2
draw_cprpalh:
       dc.l COLCOLORSHIGH2+2

view_cprpall:
       ;dc.l COLCOLORSLOW1+2
draw_cprpall:
       ;dc.l COLCOLORSLOW2+2

	SECTION COPPER,DATA_C

SIZEPALETTE  equ  32
OFFSCLPALETTE  equ  52*2+4+4
OFFSBPLPOINTERS equ  OFFSCLPALETTE+16 
OFFSCLBLOCKDRAW  equ  OFFSBPLPOINTERS+32*2
OFFSNEXTCOPPER  equ  OFFSCLBLOCKDRAW+4*255+4*BPLCOUNT*255+4
OFFSCLPALETTELW  equ  OFFSCLPALETTE+(SIZEPALETTE+1)*4*8 
 
  CNOP 0,8

COPPERLISTROTATE1:

    ;Sprpointers
    dc.w    $120,0,$122,0,$124,0,$126,0,$128,0,$12a,0
    dc.w    $12c,0,$12e,0,$130,0,$132,0,$134,0,$136,0
    dc.w    $138,0,$13a,0,$13c,0,$13e,0

    dc.w    $1fc, $1
	dc.w	$96, $83FF

	dc.w	$8E,$2c81	                 ; DiwStrt
	dc.w	$90,$2cc1	                 ; DiwStop
	dc.w	$92,$38		                 ; DdfStarte

	dc.w	$94,$d0		                 ; DdfStop
	dc.w	$102,0		                 ; BplCon1
	dc.w	$104,$200	                 ; BplCon2
	dc.w	$108,0                       ; Bpl1Mod
	dc.w	$10a,0                       ; Bpl2Mod

COLRBPLCON0_1	dc.w	$100,$1200;                   ; bplcon0

COLRBITPLANEPOINTERS1:
	dc.w $e0,$0000,$e2,$0000	;primo	 bitplane
	dc.w $e4,$0000,$e6,$0000
    dc.w $e8,$0000,$ea,$0000
    dc.w $ec,$0000,$ee,$0000
    dc.w $f0,$0000,$f2,$0000
    dc.w $f4,$0000,$f6,$0000
    dc.w $f8,$0000,$fa,$0000
	dc.w $fc,$0000,$fe,$0000

	dc.w	$106, $0c00

COLCOLORSHIGH1:
	dc.w	$180,$000    ;Dummy operation as placeholder
        dc.w    $182,$000    ;01
        dc.w    $184,$000    ;10
        dc.w    $186,$000    ;11
		
COLRLINESELECT1:
        REPT 256
        dc.w $00d9,$fffe
        ;dc.w $e0,0
        dc.w $e2,0
		;dc.w $e4,0
        dc.w $e6,0
        ;dc.w $e8,0
        dc.w $ea,0
		;dc.w $ec,0
        dc.w $ee,0
		;dc.w $f0,0
        dc.w $f2,0
        ;dc.w $f4,0
		dc.w $f6,0
		;dc.w $f8,0
        dc.w $fa,0
		;cd.w $fc,0
        dc.w $fe,0
        ENDR		

		DC.W	$ffff,$FFFE


COPPERLISTROTATE2:

    ;Sprpointers
    dc.w    $120,0,$122,0,$124,0,$126,0,$128,0,$12a,0
    dc.w    $12c,0,$12e,0,$130,0,$132,0,$134,0,$136,0
    dc.w    $138,0,$13a,0,$13c,0,$13e,0

    dc.w    $1fc, $1
	dc.w	$96, $83FF

	dc.w	$8E,$2c81	                 ; DiwStrt
	dc.w	$90,$2cc1	                 ; DiwStop
	dc.w	$92,$38		                 ; DdfStarte

	dc.w	$94,$d0		                 ; DdfStop
	dc.w	$102,0		                 ; BplCon1
	dc.w	$104,$200	                 ; BplCon2
	dc.w	$108,0                       ; Bpl1Mod
	dc.w	$10a,0                       ; Bpl2Mod

COLRBPLCON0_2	dc.w	$100,$1200;                   ; bplcon0

COLRBITPLANEPOINTERS2:
	dc.w $e0,$0000,$e2,$0000	;primo	 bitplane
	dc.w $e4,$0000,$e6,$0000
    dc.w $e8,$0000,$ea,$0000
    dc.w $ec,$0000,$ee,$0000
    dc.w $f0,$0000,$f2,$0000
    dc.w $f4,$0000,$f6,$0000
    dc.w $f8,$0000,$fa,$0000
	dc.w $fc,$0000,$fe,$0000

	dc.w	$106, $0c00

COLCOLORSHIGH2:
	dc.w	$180,$000    ;Dummy operation as placeholder
        dc.w    $182,$000    ;01
        dc.w    $184,$000    ;10
        dc.w    $186,$000    ;11
		
COLRLINESELECT2:
        REPT 256
        dc.w $00d9,$fffe
        ;dc.w $e0,0
        dc.w $e2,0
		;dc.w $e4,0
        dc.w $e6,0
        ;dc.w $e8,0
        dc.w $ea,0
		;dc.w $ec,0
        dc.w $ee,0
		;dc.w $f0,0
        dc.w $f2,0
        ;dc.w $f4,0
		dc.w $f6,0
		;dc.w $f8,0
        dc.w $fa,0
		;cd.w $fc,0
        dc.w $fe,0
        ENDR		

		DC.W	$ffff,$FFFE



linebuffer:
copperlist:
	
        REPT 2       
        ;Sprpointers
        dc.w    $120,0,$122,0,$124,0,$126,0,$128,0,$12a,0
        dc.w    $12c,0,$12e,0,$130,0,$132,0,$134,0,$136,0
        dc.w    $138,0,$13a,0,$13c,0,$13e,0

	dc.w	$96, $83FF

    dc.w	$96, $83FF
	dc.w	$8E,$2c81	                 ; DiwStrt
	dc.w	$90,$2cc1	                 ; DiwStop
	dc.w	$92,$38		                 ; DdfStart
	dc.w	$94,$a0		                 ; DdfStop
	
	;dc.w	$8E,$2c81	                 ; DiwStrt
	;dc.w	$90,$2cc1	                 ; DiwStop
	;dc.w	$92,$38		                 ; DdfStart
	;dc.w	$94,$d0		                 ; DdfStop
	dc.w	$102,0		                 ; BplCon1
	dc.w	$104,$20	                 ; BplCon2
	dc.w	$108,BPLWIDTH-40                 ; Bpl1Mod
	dc.w	$10a,BPLWIDTH-40                 ; Bpl2Mod

	IFEQ BPLCOUNT-8
	dc.w	$100,$210
	ELSE
	dc.w	$100,BPLCOUNT*$1000+$200	 ; bplcon0
	ENDC
	;dc.w $100,$1200

        dc.w    $106,$c00    
	dc.w	$180,$000    ;Dummy operation as placeholder
        dc.w    $182,$000    ;01
        dc.w    $184,$f00    ;10
		dc.w    $186,$f00    ;11		

;bplpointers:
	dc.w $e0,0,$e2,$0000	; bitplane pointers
	dc.w $e4,0,$e6,$0000
        dc.w $e8,0,$ea,$0000
        dc.w $ec,0,$ee,$0000
        dc.w $f0,0,$f2,$0000
        dc.w $f4,0,$f6,$0000
        dc.w $f8,0,$fa,$0000
        dc.w $fc,0,$fe,$0000        

;clblockdraw:
        REPT 255
	dc.w $00df,$fffe
	IFGE BPLCOUNT-1
	dc.w $e2,0
	ENDC
	IFGE BPLCOUNT-2
	dc.w $ea,0
	ENDC 
	IFGE BPLCOUNT-3
	dc.w $ea,0
	ENDC
	IFGE BPLCOUNT-4
        dc.w $ee,0
        ENDC
        IFGE BPLCOUNT-5
        dc.w $f2,0
        ENDC
        IFGE BPLCOUNT-6
        dc.w $f6,0
        ENDC
        IFGE BPLCOUNT-7
        dc.w $fa,0
        ENDC
        IFGE BPLCOUNT-8
        dc.w $fe,0
        ENDC        

        ENDR		
        dc.l $fffffffe
        ENDR
		
bitplane:
BPLLOGO:
   dcb.b  $20000,0

      INCLUDE PatternData.i
	  INCLUDE FrameData.i 
	
  
  

