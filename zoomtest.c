#include "coppertests.h"
#include "zoomtest.h"
#include "zoom.h"
#include "utils.h"
#include "utilsasm.h"
#include <string.h>

void ZoomTest() {
  ZoomTestDisplay();
  TestBlitleftOfZoom();
  TestCopyColumnOfZoom();
  TestCopyWord();
  TestZoom4Picture();
}

void ZoomTestDisplay() {

  PrepareDisplayZoom();

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
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
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);

  ULONG clpart2[] = { 0x2d07fffe, 0x018200f0, 0x01820f00 };

  if( TestCopperlistBatch( Copperlist1, 75, clpart2, 3) == 0)
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);

  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
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

  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 0, 8, 128);
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

void TestCopyColumnOfZoom() {

  PrepareDisplayZoom();

  UWORD *destination = (UWORD *)DrawBuffer;
  *destination= 0x0000;
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
  if( Zoom_Source == 0) {
    Write(  Output(), 
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }

  UWORD *tstsource = Zoom_Source;
  *tstsource = 0xffff;
  tstsource += ZMLINESIZE/2;
  *tstsource = 0xffff;
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0xc000;
  Zoom_CopyColumn( Zoom_Source, (UWORD *)DrawBuffer, 1, 1);
  
  WaitBlit();
  destination = (UWORD *)DrawBuffer;
  if( *destination != 0x4000)
    Write(  Output(), "Zoomtest: CopyColumn2 - First row wrong.\n",41);

  destination+= ZMLINESIZE/2;
  if( *destination != 0x400f)
    Write(  Output(), "Zoomtest: CopyColumn2 - Second row wrong.\n",42);

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x400f)
    Write(  Output(), "Zoomtest: CopyColumn2 - Last row wrong.\n",40);

  destination = (UWORD *)DrawBuffer;
  *destination= 0x0000;
  destination += ZMLINESIZE/2;
  *destination= 0x000f;
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *destination = 0x000f;

  tstsource = Zoom_Source;
  *tstsource = 0xffff;
  tstsource += ZMLINESIZE/2;
  *tstsource = 0xffff;
  tstsource = (UWORD *)Zoom_Source + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  *tstsource = 0x8000;
  Zoom_CopyColumn( Zoom_Source, (UWORD *)DrawBuffer, 0, 0);
  
  WaitBlit();
  destination = (UWORD *)DrawBuffer;
  if( *destination != 0x8000)
    Write(  Output(), "Zoomtest: CopyColumn - First row wrong.\n",40);

  destination+= ZMLINESIZE/2;
  if( *destination != 0x800f)
    Write(  Output(), "Zoomtest: CopyColumn - Second row wrong.\n",41);

  
  destination = (UWORD *)DrawBuffer + (ZMCOLHEIGHT-1)*ZMLINESIZE/2;
  if( *destination != 0x800f)
    Write(  Output(), "Zoomtest: CopyColumn - Last row wrong.\n",39);

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

  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 3, 16);
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
UWORD destlinezoom2[] = { 0xd555, 0x5355, 0x554d, 0x5555, 0x3555, 0x54d5, 
    0x5553, 0x5555, 0x4d55, 0x5535, 0x5554, 0xd555,  0x5355, 0x554d, 0x5555, 
    0x3555, 0x54d5, 0x5553, 0x5555, 0x4d55, 0x5535, 0x5554 };

/*UWORD destlinezoom3 = { 0x5553, 0x2aaa, 0xa655, 0x554c, 0xaaaa, 0x9955, 0x5532,
   0xaaaa, 0x6555, 0x54cd, 0x5554, 0xcaaa, 0xa995, 0x5553, 0x2aaa, 0xa655, 
   0x554c, 0xaaaa, 0x9955, 0x5532, 0xaaaa, 0x6555 };*/

UWORD destlinezoom3[] = { 0x5553, 0x2aaa, 0xa655, 0x554c, 0xaaaa, 0x9955, 0x5532,
   0xaaaa, 0x6555, 0x54ca, 0xaaa9, 0x9555, 0x532a, 0xaaa6, 0x5555, 0x4caa, 
   0xaa99, 0x5555, 0x32aa, 0xaa65, 0x5554, 0xcaaa };
/* 1st part level3
9abc defg hijk 1122 3345 6789 abcd efgh ijk1 1223 3456 789a bcde fghi jk11 2233
0101 0101 0101 0011 0010 1010 1010 1010 1010 0110 0101 0101 0101 0101 0100 1100
5    5    5    3    2    a    a    a    a    6    5    5    5    5    4    c
4567 89ab cdef ghij k112 2334 5678 ....
1010 1010 1010 1010 1001 1001 0101
a    a    a    a    9    9    5
2nd Part Level 3
fghi jk11 2233 4456 789a bcde fghi jk11 2233 4567 89ab cdef ghij k112 2334 5678
0101 0100 1100 1101 0101 0101 0101 0100 1100 1010 1010 1010 1010 1001 1001 0101
5    4    c    d    5    5    5    4    c    a    a    a    a    9    9    5
9abc defg hijk 1122 3345 6789 abcd efgh ijk1 1223 3456 ...
0101 0101 0101 0011 0010 1010 1010 1010 1010 0110 0101 ...
5    5    5    3    2    a    a    a    a    6    5

2234 5678 9abc defg hijk 1122 3456 789a bcde fghi jk11 2234 ...
1101 0101 0101 0101 0101 0011 0101 0101 0101 0101 0100 1101 ...
d    5    5    5    5    3    5    5    5    5    4    d

9abc defg hijk l123 4567 89ab cdef ghij kl12 3456 789a bcde fghi jkl1 2345 6789
0101 0101 0101 0010 1010 1010 1010 1010 1001 0101 0101 0101 0101 0100 1010 1010 
5    5    5    2    a    a    a    a    9    5    5    5    5    4    a    a
abcd efgh ijkl 1234 5678 9abc defg hijk l123 4567 89ab cdef ghij kl12 3456 789a
1010 1010 1010 0101 0101 0101 0101 0101 0010 1010 1010 1010 1010 1001 0101 0101
a    a    a    5    5    5    5    5    2    a    a    a    a    9    5    5*/ 
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

  Zoom_ZoomIntoPicture( source, destination, 0);
  WaitBlit();
  UWORD *valactual = destination+2; 
  UWORD *valsupposed = destlinezoom1;
  UWORD mask = 0x0;
  for(int i=0;i<17;i++) {
    for(int i2=0;i2<15;i2++) { 
      UWORD *bp = (UWORD *)0x200;
      *bp = 0; 
      TestRow( valsupposed, valactual, mask, i2+i*16);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
    TestRow( valsupposed, valactual, mask, 15+i*16);
    valactual += ZMLINESIZE/2;
  }
  
  UWORD *tmp = source;
  source = destination;
  destination = tmp;
          //return;
  Zoom_ZoomIntoPicture( source, destination, 1);
  WaitBlit();
  valactual = destination+2; 
  valsupposed = destlinezoom2;
  for(int i=0;i<8;i+=2) {   
    TestRow( valsupposed, valactual, 0x0000, i);
    valactual += ZMLINESIZE/2;
     
    TestRow( valsupposed, valactual, 0xffff, i+1);
    valactual += ZMLINESIZE/2;
  }
  TestRow( valsupposed, valactual, 0x0000, 8);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 9);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 10);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 11);
  valactual += ZMLINESIZE/2;

  for(int i=0;i<14;i++) {
    for(int i2=0;i2<14;i2+=2) {
      TestRow( valsupposed, valactual, 0x0000, i2+i*18+12);
      valactual += ZMLINESIZE/2;
     
      TestRow( valsupposed, valactual, 0xffff, i2+1+i*18+12);
      valactual += ZMLINESIZE/2;
    }
    TestRow( valsupposed, valactual, 0x0000, 14+12+i*18);
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, 0x0000, 15+12+i*18);
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, 0xffff, 16+12+i*18);
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, 0xffff, 17+12+i*18);
    valactual += ZMLINESIZE/2;
  }
  for(int i=0;i<8;i+=2) {
    TestRow( valsupposed, valactual, 0x0000, 264+i);
    valactual += ZMLINESIZE/2;
     
    TestRow( valsupposed, valactual, 0xffff, 265+i);
    valactual += ZMLINESIZE/2;
  }

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 2);
  WaitBlit();
  valactual = destination+2; 
  valsupposed = destlinezoom3;
  
  TestRow( valsupposed, valactual, 0x0000, 0);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 1);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 2);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 3);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 4);
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 5);
  valactual += ZMLINESIZE/2;

  for(int i=0;i<14;i++) {
    mask = 0xffff;
    for(int i2=0;i2<13;i2++) {
      TestRow( valsupposed, valactual, mask, i2+6+i*19);
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    }
    TestRow( valsupposed, valactual, 0x0000, 19+i*19);
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, 0x0000, 19+i*19);
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, 0xffff, 19+i*19);
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, 0xffff, 19+i*19);
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, 0x0000, 19+i*19);
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, 0x0000, 19+i*19);
    valactual += ZMLINESIZE/2;
  }
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
