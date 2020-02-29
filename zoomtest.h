#include "support/gcc8_c_support.h"
#include <proto/exec.h>
#include <proto/dos.h>
#include <proto/graphics.h>
#include <graphics/gfxbase.h>
#include <graphics/view.h>
#include <exec/execbase.h>
#include <hardware/custom.h>
#include <hardware/intbits.h>


void TestZoom4Picture();
void TestRow( UWORD *source, UWORD *destination, UWORD xormask, 
                                                              int numberofline);
void ZoomTest();
void ZoomTestDisplay();
void TestBlitleftOfZoom();
void TestCopyColumnOfZoom();
void TestCopyWord();
extern void PutChar();
/*UWORD destlinezoom2[22];
UWORD destlinezoom1[22];*/