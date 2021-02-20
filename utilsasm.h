/* d0.w	chunkyx [chunky-pixels]
; d1.w	chunkyy [chunky-pixels]
; d2.w	(scroffsx) [screen-pixels]
; d3.w	scroffsy [screen-pixels]
; d4.w	(rowlen) [bytes] -- offset between one row and the next in a bpl
; d5.l	(bplsize) [bytes] -- offset between one row in one bpl and the next bpl*/

void c2p1x1_4_c5_gen_init( UWORD chunkyx, UWORD chunkyy, UWORD scroffsx,
                                  UWORD scroffsy, UWORD rowlen, UWORD bplsize);
void c2p1x1_4_c5_gen(UWORD *c2pscreen, UWORD *bitplanes);

int Testo();