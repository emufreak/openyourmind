#include "coppertests.h"
#include "zoomtest.h"
#include "zoom.h"
#include "utils.h"
#include "utilsasm.h"
#include <string.h>

void ZoomTest() {
  TestZoomSpeed();
  ZoomTestDisplay();
  TestBlitleftOfZoom();
  TestCopyWord();
  TestZoom4Picture();
}

int Counter4Frames;

void Vblankcounter() {
  Counter4Frames++;
}

void TestZoomSpeed() {

  hw->dmacon = 0b1000010000000000; //Blitter nasty
  Counter4Frames = 0;
  struct Interrupt *vbint;
                                                       
  if (vbint = AllocMem(sizeof(struct Interrupt),    
                         MEMF_PUBLIC|MEMF_CLEAR)) {
    vbint->is_Node.ln_Type = NT_INTERRUPT;       
    vbint->is_Node.ln_Pri = -60;
    vbint->is_Node.ln_Name = "VertB-Example";
    vbint->is_Data = NULL;
    vbint->is_Code = Vblankcounter;
  }

  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
  if( source == 0) {
    Write(  Output(), 
               "TestZoomSpeed: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
  if( destination == 0) {
    Write(  Output(), 
          "TestZoomSpeed: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
  for(int i=0;i<128+8;i++) {
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0x55555555;
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0xaaaaaaaa;
  }

  WaitVbl();
  Init_Blit();
  Init_ZoomBlit(322, 336, 0);
  AddIntServer(INTB_VERTB, vbint);
  
  Zoom_ZoomIntoPicture( source, destination, 0, 5);
  RemIntServer(INTB_VERTB, vbint);
  if( Counter4Frames > 6)
    Write( Output(), "TestSpeed4Zoom: Takes too long\n", 31);
  FreeMem( source, ( ZMLINESIZE+4)*272*5);
  FreeMem( destination, ( ZMLINESIZE+4)*272*5);
}

void ZoomTestDisplay() {

  PrepareDisplayZoom();

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);
  DrawBuffer = (ULONG *) 0x40000;
  ViewBuffer = (ULONG *) 0x50000;
  Zoom_SetBplPointers();
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    Write(Output(), 
           "SetBplPointers: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
    Write(Output(), 
           "SetBplpointers: Problem in Copperlist bpl2pl should be 2800\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
  
  /*ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);

  ULONG clpart2[] = { 0x2d07fffe, 0x018200f0, 0x01820f00 };

  if( TestCopperlistBatch( Copperlist1, 75, clpart2, 3) == 0)
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);*/

  if( TestCopperlistPos( Copperlist1, 34, 0xfffffffe) == 0)
    Write( Output(), "Copperlist End not correctly set.\n", 34);

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);

}

void TestBlitleftOfZoom() {
  Zoom_Init();
  PrepareDisplayZoom();

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
  if( Zoom_Source == 0) {
    Write(  Output(), 
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }

  
  UWORD *tstsource = Zoom_Source;
  *tstsource++ = 0x0000;
  *tstsource = 0x0080;
  tstsource += ZMLINESIZE/2-1;
  *tstsource = 0x1000;
  tstsource++;
  *tstsource = 0x8e88;
  tstsource += ZMLINESIZE/2-1;

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
  *tstsource++ = 0x0000;
  *tstsource = 0x00ff;
  WaitBlit();
  Init_Blit();
  Init_ZoomBlit( 7, 16, 0);
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
  WaitBlit();
  UWORD *destination = (UWORD *)DrawBuffer+1;
  if( *destination != 0x0180) {
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
  }
  destination += ZMLINESIZE/2;
  if( *destination != 0x1d88)
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
  destination++;
  if( *destination != 0x01ff) {
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
  }
  FreeMem( Zoom_Source, 40*256*5);
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
}

void TestCopyWord() {
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
  if( source == 0) {
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
  if( destination == 0) {
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
                                                                            53);
    return;
  }
  
  UWORD *tmp = source;
  for( int i=0; i<8;i++) {
    *tmp++ = 0;
    *tmp++ = 0xaaaa;
    *tmp++ = 0xaaaa;
    *tmp = 0;
    tmp += ZMLINESIZE/2-3;
    *tmp++ = 0;
    *tmp++ = 0x5555;
    *tmp++ = 0x5555;
    *tmp = 0;
    tmp += ZMLINESIZE/2-3;
  }
  tmp = destination;
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    *tmp++ = 0;
  }

  WaitBlit();

  Zoom_Init();
  Init_Copy( 3);
  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 16);
  WaitBlit();
  tmp = destination+1;
  if( *tmp != 0x5555) 
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
  tmp += ZMLINESIZE/2;
  if( *tmp != 0xaaaa)
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
  
  FreeMem( source,ZMLINESIZE*30);
  FreeMem( destination,ZMLINESIZE*30);
}

UWORD destlinezoom1[] = { 0xaa55, 0x554a, 0xaaa9, 0x5555, 0x2aaa, 0xa555, 
  0x54aa, 0xaa95, 0x5552, 0xaaaa, 0x5555, 0x4aaa, 0xa955, 0x552a, 0xaaa5, 
  0x5554, 0xaaaa, 0x9555, 0x52aa, 0xaa55, 0x554a, 0xaaa9 };

/* cdef ghi1 1234 5678 9abc defg hi11 2345 6789 abcd efgh i112 3456 789a bcde
   1010 1010 0101 0101 0101 0101 0100 1010 1010 1010 1010 1001 0101 0101 0101
   a    a    5    5    5    5    4    a    a    a    a    9    5    5    5
fghi 1123 4567 89ab ...
0101 0010 1010 1010
5    2    a    a */

UWORD destlinezoom2[] = { 0xd555, 0x4d55, 0x54d5, 0x554d, 0x5554, 0xd555, 
  0x4d55, 0x54d5, 0x554d, 0x5554, 0xd555, 0x4d55, 0x54d5, 0x554d, 0x5554, 
  0xd555, 0x4d55, 0x54d5, 0x554d, 0x5554, 0xd555, 0x4d55 };
   
/* 2234 5678 9abc defg hi11  ...
   0101 0101 0101 0101 0100 
   d    5    5    5    4    */

UWORD destlinezoom3[] = { 0x554c, 0xaaaa, 0x6555, 0x532a, 0xaa99, 0x5554,
  0xcaaa, 0xa655, 0x5532, 0xaaa9, 0x9555, 0x4caa, 0xaa65, 0x5553, 0x2aaa,
  0x9955, 0x54ca, 0xaaa6, 0x5555, 0x32aa, 0xa995, 0x554c };

/* 9abc defg hi11 2233 4567 89ab cdef ghi1 1223 3456 789a bcde fghi 1122 3345
   0101 0101 0100 1100 1010 1010 1010 1010 0110 0101 0101 0101 0101 0011 0010
   5    5    4    c    a    a    a    a    6    5    5    5    5    3    2

   6789 abcd efgh i112 2334 5678 ...
   1010 1010 1010 1001 1001 0101
   a    a    a    9    9    5         */

UWORD destlinezoom4[] = { 0x4cd5, 0x5533, 0x5554, 0xcd55, 0x5335, 0x554c, 
  0xd555, 0x3355, 0x54cd, 0x5553, 0x3555, 0x4cd5, 0x5533, 0x5554, 0xcd55, 
  0x5335, 0x554c, 0xd555, 0x3355, 0x54cd, 0x5553, 0x3555 };

/* hi11 2233 4456 789a bcde fghi 1122 3344 5678 9abc defg ...
   0100 1100 1101 0101 0101 0101 0011 0011 0101 0101 0101
   4    c    d    5    5    5    3    3    5    5    5
*/

UWORD destlinezoom5[] = { 0xcaaa, 0x9995, 0x5533, 0x2aaa, 0x6655, 0x54cc,
  0xaaa9, 0x9955, 0x5332, 0xaaa6, 0x6555, 0x4cca, 0xaa99, 0x9555, 0x332a,
  0xaa66, 0x5554, 0xccaa, 0xa999, 0x5553, 0x32aa, 0xa665 };

/* 4455 6789 abcd efgh i112 2334 4556 789a bcde fghi 1122 3344 5567 89ab cdef
   1100 1010 1010 1010 1001 1001 1001 0101 0101 0101 0011 0011 0010 1010 1010
   c    a    a    a    9    9    9    5    5    5    3    3    2    a    a

   ghi1 1223 3445 5678 9abc defg hi11 2233 ...
   1010 0110 0110 0101 0101 0101 0100 1100
   a    6    6    5    5    5    4    c
*/


UWORD destlinezoom6[] = { 0x554c, 0xcd55, 0x4ccd, 0x554c, 0xcd55, 0x4ccd,
  0x554c, 0xcd55, 0x4ccd, 0x554c, 0xcd55, 0x4ccd, 0x554c, 0xcd55, 0x4ccd,
  0x554c, 0xcd55, 0x4ccd, 0x554c, 0xcd55, 0x4ccd, 0x554c };

/* 9abc defg hi11 2233 4455 6678 ...
   0101 0101 0100 1100 1100 1101 ...
   5    5    4    c    c    d
*/

UWORD destlinezoom7[] = { 0xa666, 0x5553, 0x332a, 0xa999, 0x9554, 0xccca,
  0xaa66, 0x6555, 0x3332, 0xaa99, 0x9955, 0x4ccc, 0xaaa6, 0x6655, 0x5333,
  0x2aa9, 0x9995, 0x54cc, 0xcaaa, 0x6665, 0x5533, 0x32aa };
  
/* ghi1 1223 3445 5667 789a bcde fghi 1122 3344 5566 7789 abcd efgh i112
   1010 0110 0110 0110 0101 0101 0101 0011 0011 0011 0010 1010 1010 1001
   a    6    6    6    5    5    5    3    3    3    2    a    a    9

   2334 4556 6778 9abc defg hi11 2233 4455 6677 89ab cdef ...
   1001 1001 1001 0101 0101 0100 1100 1100 1100 1010 1010
   9    9    9    5    5    4    c    c    c    a    a
*/

UWORD destlinezoom8[] = { 0x3335, 0x54cc, 0xcd55, 0x3333, 0x554c, 0xccd5, 
  0x5333, 0x3554, 0xcccd, 0x5533, 0x3355, 0x4ccc, 0xd553, 0x3335, 0x54cc,
  0xcd55, 0x3333, 0x554c, 0xccd5, 0x5333, 0x3554, 0xcccd };
  
/* 3344 5566 7788 9abc defg hi11 2233 4455 6677 889a bcde fghi 1122 ...
   0011 0011 0011 0101 0101 0100 1100 1100 1100 1101 0101 0101 0011 ...
   3    3    3    5    5    4    c    c    c    d    5    5    3
*/


UWORD destlinezoom9[] = { 0x9955, 0x3333, 0x2aa6, 0x6665, 0x54cc, 0xccaa,
  0x9999, 0x9553, 0x3332, 0xaa66, 0x6655, 0x4ccc, 0xcaa9, 0x9999, 0x5533,
  0x332a, 0xa666, 0x6554, 0xcccc, 0xaa99, 0x9995, 0x5333 };
  
/* 6778 899a bcde fghi 1122 3344 5566 7788 99ab cdef ghi1 1223 3445 5667 ...
   1001 1001 0101 0101 0011 0011 0011 0011 0010 1010 1010 0110 0110 0110 ...
   9    9    5    5    3    3    3    3    2    a    a    6    6    6

   7889 9abc defg hi11 2233 4455 6677 8899 abcd efgh i112 2334 4556 ...
   0110 0101 0101 0100 1100 1100 1100 1100 1010 1010 1001 1001 1001 ...
   6    5    5    4    c    c    c    c    a    a    9    9    9
 
 */
UWORD destlinezoom10[] = { 0xd54c, 0xcccd, 0x54cc, 0xccd5, 0x4ccc, 0xcd54,  
  0xcccc, 0xd54c, 0xcccd, 0x54cc, 0xccd5, 0x4ccc, 0xcd54, 0xcccc, 0xd54c, 
  0xcccd, 0x54cc, 0xccd5, 0x4ccc, 0xcd54, 0xcccc, 0xd54c };

/* aabc defg hi11 2233 4455 6677 8899 ...
   1101 0101 0100 1100 1100 1100 1100 ...
   d    5    4    c    c    c    c
*/ 

UWORD destlinezoom11[] = { 0x5333, 0x332a, 0x9999, 0x9954, 0xcccc, 0xcaa6, 
   0x6666, 0x5533, 0x3332, 0xa999, 0x9995, 0x4ccc, 0xccaa, 0x6666, 0x6553,
   0x3333, 0x2a99, 0x9999, 0x54cc, 0xccca, 0xa666, 0x6655 };  

/* fghi 1122 3344 5566 7788 99aa bbcd efgh i112 2334 4556 6778 899a abbc
   0101 0011 0011 0011 0011 0011 0010 1010 1001 1001 1001 1001 1001 1001
   5    3    3    3    3    3    2    a    9    9    9    9    9    9

   defg hi11 2233 4455 6677 8899 aabb cdef ghi1 1223 3445 5667 7889 9aab
   0101 0100 1100 1100 1100 1100 1100 1010 1010 0110 0110 0110 0110 0110
   5    4    c    c    c    c    c    a    a    6    6    6    6    6

   bcde ...
   0101
   5         */

UWORD destlinezoom12[] = { 0xcccc, 0xcd53, 0x3333, 0x354c, 0xcccc, 0xd533,
 0x3333, 0x54cc, 0xcccd, 0x5333, 0x3335, 0x4ccc, 0xccd5, 0x3333, 0x3354,
 0xcccc, 0xcd53, 0x3333, 0x354c, 0xcccc, 0xd533, 0x3333 };

/* 2233 4455 6677 8899 aabb ccde fghi 1122 3344 5566 7788 99aa bbcc defg
   1100 1100 1100 1100 1100 1101 0101 0011 0011 0011 0011 0011 0011 0101
   c    c    c    c    c    d    5    3    3    3    3    3    3    5

   hi11 ...
   0100
   4 */

UWORD destlinezoom13[] = { 0x3333, 0x2a66, 0x6666, 0x54cc, 0xcccc, 0xa999,
   0x9999, 0x5333, 0x3332, 0xa666, 0x6665, 0x4ccc, 0xccca, 0x9999, 0x9995,
   0x3333, 0x332a, 0x6666, 0x6654, 0xcccc, 0xcca9, 0x9999 };

/* 5566 7788 99aa bbcc ddef ghi1 1223 3445 5667 7889 9aab bccd defg hi11
   0011 0011 0011 0011 0010 1010 0110 0110 0110 0110 0110 0110 0101 0100
   3    3    3    3    2    a    6    6    6    6    6    6    5    4

   2233 4455 6677 8899 aabb ccdd efgh i112 2334 4556 6778 899a abbc cdde
   1100 1100 1100 1100 1100 1100 1010 1001 1001 1001 1001 1001 1001 1001
   c    c    c    c    c    c    a    9    9    9    9    9    9    9

   fghi 1122 3344 ...
   0101 0011 0011
   5    3    3
 */
UWORD destlinezoom14[] = { 0xcccd, 0x4ccc, 0xcccd, 0x4ccc, 0xcccd, 0x4ccc,
   0xcccd, 0x4ccc, 0xcccd, 0x4ccc, 0xcccd, 0x4ccc, 0xcccd, 0x4ccc, 0xcccd,
   0x4ccc, 0xcccd, 0x4ccc, 0xcccd, 0x4ccc, 0xcccd, 0x4ccc };
 /* 8899 aabb ccdd eefg hi11 2233 4455 6677 ...
    1100 1100 1100 1101 0100 1100 1100 1100
    c    c    c    d    4    c    c    c

 */

UWORD destlinezoom15[] = { 0x3329, 0x9999, 0x9994, 0xcccc, 0xccca, 0x6666,
   0x6665, 0x3333, 0x3332, 0x9999, 0x9999, 0x4ccc, 0xcccc, 0xa666, 0x6666,
   0x5333, 0x3333, 0x2999, 0x9999, 0x94cc, 0xcccc, 0xca66 };

/* bbcc ddee ffgh i112 2334 4556 6778 899a abbc cdde effg hi11 2233 4455
   0011 0011 0010 1001 1001 1001 1001 1001 1001 1001 1001 0100 1100 1100
   3    3    2    9    9    9    9    9    9    9    9    4    c    c   
   6677 8899 aabb ccdd eeff ghi1 1223 3445 5667 7889 9aab bccd deef fghi
   1100 1100 1100 1100 1100 1010 0110 0110 0110 0110 0110 0110 0110 0101
   c    c    c    c    c    a    6    6    6    6    6    6    6    5   
   1122 3344 5566 7788 99aa ... 
   0011 0011 0011 0011 0011 
   3    3    3    3    3    */

UWORD destlinezoom16[] = { 0xcd33, 0x3333, 0x334c, 0xcccc, 0xccd3, 0x3333, 
   0x3334, 0xcccc, 0xcccd, 0x3333, 0x3333, 0x4ccc, 0xcccc, 0xd333, 0x3333, 
   0x34cc, 0xcccc, 0xcd33, 0x3333, 0x334c, 0xcccc, 0xccd3 };

/* eeff gghi 1122 3344 5566 7788 99aa bbcc ddee ffgg hi11 2233 4455 6677
   1100 1101 0011 0011 0011 0011 0011 0011 0011 0011 0100 1100 1100 1100
   a    b    3    3    3    3    3    3    3    3    4    a    a    a
   8899 aabb ccdd ...
   1100 1100 1100
   a    a    a */

UWORD destlinezoom17[] = { 0x2666, 0x6666, 0x64cc, 0xcccc, 0xcc99, 0x9999,
  0x9993, 0x3333, 0x3332, 0x6666, 0x6666, 0x4ccc, 0xcccc, 0xc999, 0x9999,
  0x9933, 0x3333, 0x3326, 0x6666, 0x6664, 0xcccc, 0xcccc };

/* hhi1 1223 3445 5667 7889 9aab bccd deef fggh hi11 2233 4455 6677 8899
   0010 0110 0110 0110 0110 0110 0110 0110 0110 0100 1100 1100 1100 1100
   2    6    6    6    6    6    6    6    6    4    c    c    c    c
   aabb ccdd eeff gghh i112 2334 4556 6778 899a abbc cdde effg ghhi 1122
   1100 1100 1100 1100 1001 1001 1001 1001 1001 1001 1001 1001 1001 0011
   c    c    c    c    9    9    9    9    9    9    9    9    9    3
   3344 5566 7788 99aa bbcc ddee ffgg ...
   0011 0011 0011 0011 0011 0011 0011 
   3    3    3    3    3    3    3 */

UWORD destlinezoom18[] = { 0xcccc, 0xcccc, 0xcccc, 0xcccc, 0xcccc, 0xcccc,
   0xcccc, 0xcccc, 0xcccc, 0xcccc, 0xcccc, 0xcccc, 0xcccc, 0xcccc, 0xcccc,
   0xcccc, 0xcccc, 0xcccc, 0xcccc, 0xcccc, 0xcccc, 0xcccc };

/* 2233 4455 6677 8899 aabb ccdd eeff gghh ii11 ...
   1100 1100 1100 1100 1100 1100 1100 1100 1100
   c    c    c    c    c    c    c    c    c */

void TestZoom4Picture() {
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
  if( source == 0) {
    Write(  Output(), 
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
  if( destination == 0) {
    Write(  Output(), 
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
  for(int i=0;i<128+8;i++) {
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0x55555555;
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0xaaaaaaaa;
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 1);
  WaitBlit();
  UWORD *valactual = destination+2; 
  UWORD *valsupposed = destlinezoom1;
  UWORD mask = 0xffff;
  for(int i=0;i<14;i++) {
    for(int i2=0;i2<18;i2++) { 
      TestRow( valsupposed, valactual, mask, i2+i*19);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
    TestRow( valsupposed, valactual, mask, 18+i*19);
    valactual += ZMLINESIZE/2;
  }

  for(int i2=0;i2<4;i2++) { 
    TestRow( valsupposed, valactual, mask, i2+265);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }
  
  UWORD *tmp = source;
  source = destination;
  destination = tmp;
  
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
  WaitBlit();
  valactual = destination+2; 
  valsupposed = destlinezoom2;
  mask = 0x0000;
  for(int i2=0;i2<11;i2++) { 
    TestRow( valsupposed, valactual, mask, i2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }
  TestRow( valsupposed, valactual, 0xffff, 8);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 9);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 10);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 11);

  valactual += ZMLINESIZE/2;
  for(int i=0;i<12;i++) {
    for(int i2=0;i2<16;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
  
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    
  }

  for(int i2=0;i2<15;i2++) { 
    TestRow( valsupposed, valactual, mask, i2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 2, 1);
  WaitBlit();
  valactual = destination+2; 
  valsupposed = destlinezoom3;
  mask = 0xffff;

  for(int i2=0;i2<4;i2++) { 
    TestRow( valsupposed, valactual, mask, i2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  TestRow( valsupposed, valactual, 0xffff, 0+4);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 1+4);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 2+4);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 3+4);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 4+4);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 5+4);
  valactual += ZMLINESIZE/2;

  mask = 0x0000;
  for(int i=0;i<12;i++) {
    for(int i2=0;i2<15;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  for(int i2=0;i2<8;i2++) {  
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 3,1 );
  WaitBlit();
  valactual = destination+2; 
  valsupposed = destlinezoom4;
  mask = 0x0000;
  
  TestRow( valsupposed, valactual, 0x0000, 3+4);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 4+4);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 5+4);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 4+4);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 5+4);
  valactual += ZMLINESIZE/2;

  mask = 0xffff;
  for(int i=0;i<12;i++) {
    for(int i2=0;i2<14;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  TestRow( valsupposed, valactual, mask, 269);
  valactual += ZMLINESIZE/2;
  
  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 4, 1);
  WaitBlit();

  valactual = destination+2; 
  valsupposed = destlinezoom5;
  mask = 0x0000;

  for(int i2=0;i2<13;i2++) {  
    TestRow( valsupposed, valactual, mask, i2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  TestRow( valsupposed, valactual, mask, 12);   
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 13);
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 14);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 15);
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 16);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 17);
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 18);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 19);
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 20);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 21);
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;


  for(int i=0;i<10;i++) {
    for(int i2=0;i2<13;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }

    TestRow( valsupposed, valactual, mask, i*21+22+13);
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  for(int i2=0;i2<13;i2++) {  
    TestRow( valsupposed, valactual, mask, i2+253);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  TestRow( valsupposed, valactual, mask, 266);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 267);
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 268);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 269);
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 5, 1);
  WaitBlit();
  valactual = destination+2; 
  valsupposed = destlinezoom6;
  mask = 0x0000;
 
  for(int i2=0;i2<7;i2++) {  
    TestRow( valsupposed, valactual, mask, i2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  for(int i=0;i<6;i++) {
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  for(int i=0;i<10;i++) {
    for(int i2=0;i2<12;i2++) {  
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
    for(int i=0;i<6;i++) {
      TestRow( valsupposed, valactual, mask, 31+i*24);   
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 32+i*24);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
  }

  for(int i2=0;i2<11;i2++) {  
    TestRow( valsupposed, valactual, mask, 258+i2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 6, 1);
  WaitBlit();
  valactual = destination+2; 
  valsupposed = destlinezoom7;
  mask = 0x0000;
 
  TestRow( valsupposed, valactual, mask, 0);
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  for(int i=0;i<7;i++) {
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  for(int i=0;i<10;i++) {
    for(int i2=0;i2<11;i2++) {  
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
    for(int i=0;i<7;i++) {
      TestRow( valsupposed, valactual, mask, 26+i*25);   
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 26+i*25);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
  }

  for(int i2=0;i2<5;i2++) {  
    TestRow( valsupposed, valactual, mask, 256+i2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 7, 1);
  WaitBlit();
  valactual = destination+2; 
  valsupposed = destlinezoom8;
  mask = 0xffff;
 
  TestRow( valsupposed, valactual, mask, 0);
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  for(int i=0;i<5;i++) {
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  for(int i=0;i<9;i++) {
    for(int i2=0;i2<10;i2++) {  
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
    for(int i2=0;i2<8;i2++) {
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
  }

  for(int i2=0;i2<10;i2++) {  
    TestRow( valsupposed, valactual, mask, 245+i2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }
  for(int i=0;i<7;i++) {
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 256+i*2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }
  TestRow( valsupposed, valactual, mask, 269);
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
 
  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 8, 1);
  WaitBlit();
  valactual = destination+2; 
  valsupposed = destlinezoom9;
  mask = 0x0000;
 
  TestRow( valsupposed, valactual, mask, 0);
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  
  for(int i=0;i<3;i++) {
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  for(int i=0;i<9;i++) {
    for(int i2=0;i2<9;i2++) {  
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
    
    for(int i2=0;i2<9;i2++) {
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
  }

  for(int i2=0;i2<9;i2++) {  
    TestRow( valsupposed, valactual, mask, 245+i2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }
  for(int i=0;i<5;i++) {
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 260+i*2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }
  TestRow( valsupposed, valactual, mask, 269);
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 9, 1);
  WaitBlit();
  valactual = destination+2; 
  valsupposed = destlinezoom10;

  mask = 0xffff;
  TestRow( valsupposed, valactual, mask, 0);
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 1);   
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 2);
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;

  for(int i=0;i<9;i++) {
    for(int i2=0;i2<8;i2++) {  
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
    
    for(int i2=0;i2<10;i2++) {
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
  }

  for(int i2=0;i2<8;i2++) {  
    TestRow( valsupposed, valactual, mask, 255+i2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }
  for(int i=0;i<3;i++) {
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 264+i*2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 10, 1);
  WaitBlit();
  valactual = destination+2; 
  valsupposed = destlinezoom11;

  mask = 0xffff;
 
  for(int i2=0;i2<6;i2++) {  
    TestRow( valsupposed, valactual, mask, i2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  for(int i2=0;i2<11;i2++) {
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  for(int i=0;i<8;i++) {
    for(int i2=0;i2<7;i2++) {  
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
    
    for(int i2=0;i2<11;i2++) {
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
  } 

  for(int i2=0;i2<7;i2++) {  
    TestRow( valsupposed, valactual, mask, 260+i2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }
  TestRow( valsupposed, valactual, mask, 267);   
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 268);
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 269);
  valactual += ZMLINESIZE/2;
  
  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 11, 1);
  WaitBlit();
  valactual = destination+2; 
  valsupposed = destlinezoom12;

  mask = 0x0;
   
  TestRow( valsupposed, valactual, mask, 0);
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;

  for(int i2=0;i2<12;i2++) {
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  } 

  for(int i=0;i<8;i++) {
    for(int i2=0;i2<6;i2++) {  
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
    
    for(int i2=0;i2<12;i2++) {
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
  } 

  for(int i2=0;i2<5;i2++) {  
    TestRow( valsupposed, valactual, mask, 260+i2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 12, 1);
  WaitBlit();
  valactual = destination+2; 
  valsupposed = destlinezoom13;

  mask = 0xffff;

  for(int i2=0;i2<11;i2++) {
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  } 

  for(int i=0;i<8;i++) {
    for(int i2=0;i2<5;i2++) {  
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
    
    for(int i2=0;i2<13;i2++) {
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
  } 

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 13, 1);
  WaitBlit();
  valactual = destination+2; 
  valsupposed = destlinezoom14;

  mask = 0xffff;

  TestRow( valsupposed, valactual, mask, 0);   
  valactual += ZMLINESIZE/2; 
  mask = mask ^ 0xffff; 

  for(int i2=0;i2<9;i2++) {
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  } 

  for(int i=0;i<7;i++) {
    for(int i2=0;i2<4;i2++) {  
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
    
    for(int i2=0;i2<14;i2++) {
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
  }

  for(int i2=0;i2<4;i2++) {  
    TestRow( valsupposed, valactual, mask, 243+i2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  for(int i2=0;i2<12;i2++) {
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 14, 1);
  WaitBlit();
  valactual = destination+2; 
  valsupposed = destlinezoom15;

  mask = 0x0000;

  for(int i2=0;i2<8;i2++) {
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  for(int i=0;i<7;i++) {
    for(int i2=0;i2<3;i2++) {  
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
    
    for(int i2=0;i2<15;i2++) {
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
  }

  for(int i2=0;i2<3;i2++) {  
    TestRow( valsupposed, valactual, mask, 247+i2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  for(int i2=0;i2<10;i2++) {
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 15, 1);
  WaitBlit();
  valactual = destination+2; 
  valsupposed = destlinezoom16;

  mask = 0x0000;

  TestRow( valsupposed, valactual, mask, 0);   
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  for(int i2=0;i2<6;i2++) {
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  for(int i=0;i<7;i++) {
    for(int i2=0;i2<2;i2++) {  
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
    
    for(int i2=0;i2<16;i2++) {
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
  }

  for(int i2=0;i2<2;i2++) {
    TestRow( valsupposed, valactual, mask, 251+i2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  for(int i2=0;i2<8;i2++) {
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 16, 1);
  WaitBlit();
  valactual = destination+2; 
  valsupposed = destlinezoom17;

  mask = 0xffff;

  for(int i2=0;i2<5;i2++) {
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  for(int i=0;i<7;i++) {
      TestRow( valsupposed, valactual, mask, 10+i*35);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    
    for(int i2=0;i2<17;i2++) {
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
  } 

  TestRow( valsupposed, valactual, mask, 255);
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;

  for(int i2=0;i2<7;i2++) {
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }   

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 17, 1);
  WaitBlit();
  valactual = destination+2; 
  valsupposed = destlinezoom18;

  mask = 0xffff;

  TestRow( valsupposed, valactual, mask, 0);
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;

  for(int i2=0;i2<4;i2++) {
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  for(int i=0;i<7;i++) {  
    for(int i2=0;i2<18;i2++) {
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
  } 

  for(int i2=0;i2<4;i2++) {
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }
  TestRow( valsupposed, valactual, mask, 0);
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;

}

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
  
  char str[ 100] = { 0 };
  UWORD data[2];
  data[1] = numberofline;

  testpattern += 0;
  destination += 0;

  for(int i=0;i<21;i++) {
    if( (*testpattern++ ^ xormask) != *destination++) {
      data[0] = i;
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    data[0] = 21;
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
                                                                           str);
    Write(  Output(), str, 100);
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
     
  }
}
