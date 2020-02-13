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

  Zoom_ZoomBlitLeft( Zoom_Source+1, (UWORD *)DrawBuffer, 8, 128);
  WaitBlit();
  UWORD *destination = (UWORD *)DrawBuffer+1;
  if( *destination != 0x0180) {
    Write(  Output(), "Zoomblitleft - First row wrong.\n",32);
  }
  destination += ZMLINESIZE/2;
  if( *destination != 0x1d88)
    Write(  Output(), "Zoomblitleft: Second row wrong.\n",32);

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
  destination++;
  if( *destination != 0x01ff) {
    Write(  Output(), "Zoomblitleft: Last row wrong.\n",40);
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

UWORD destline[] = { 0x0055, 0x5552, 0xaaaa, 0x9555, 0x58aa, 0xaaa5, 0x5555, 
        0x2aaa,  0xa955, 0x558a, 0xaaaa, 0x5555, 0x52aa, 0xaa95, 0x5558, 0xaaaa, 
                                0xa555, 0x552a, 0xaaa9, 0x5555, 0x8aaa, 0xaa00};
/*
9abc defg hijk l123 4567 89ab cdef ghij kl12 3456 789a bcde fghi jkl1 2345 6789
0101 0101 0101 0010 1010 1010 1010 1010 1001 0101 0101 0101 0101 0100 1010 1010 
5    5    5    2    a    a    a    a    9    5    5    5    5    8    a    a
abcd efgh ijkl 1234 5678 9abc defg hijk l123 4567 89ab cdef ghij kl12 3456 789a
1010 1010 1010 0101 0101 0101 0101 0101 0010 1010 1010 1010 1010 1001 0101 0101
a    a    a    5    5    5    5    5    2    a    a    a    a    9    5    5*/ 
void TestZoom4Picture() {
  UWORD *source =AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
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
  
  Zoom_ZoomIntoPicture( source, destination);
  WaitBlit();
  UWORD *valactual = destination+ZMLINESIZE/2-1; 
  UWORD *valsupposed = destline+ZMLINESIZE/2-1;
  for(int i=0;i<1;i++) {
    for(int i2=0;i2<16;i2+=2) {
      TestRow( valsupposed, valactual, 0x0000, i2);
      valactual += ZMLINESIZE/2;
      UWORD *bp = (UWORD *)0x200;
      *bp = 0;
      TestRow( valsupposed, valactual, 0xffff, i2+1);
      valactual += ZMLINESIZE/2;
    }
    TestRow( valsupposed, valactual, 0x0000, 16+i*16);
  }
}

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
  char str[ 100] = { 0 };
  UWORD data[2];
  data[0] = numberofline;

  if( ( (*testpattern++ ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    RawDoFmt( "TestZoom4Picture: Word 0 Row %d wrong.\n", data, PutChar, str);
    Write(  Output(), str, 100);
  }
  /*for(int i=1; i<2;i++) {
    data[0] = i;
    data[1] = numberofline;
    destination++;
    if( ( *testpattern++ & 0x00ff) != ( *destination ^ xormask)) {
      RawDoFmt( "TestZoom4Picture: Word %d Row %d wrong.\n", data, PutChar, str);
      Write(  Output(), str, 100);
    }
  }*/
}
