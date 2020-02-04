#define ZMCPSIZE (256*41+35)*4
#define ZMBPLDEPTH 5
#define ZMCOLHEIGHT 128*3
#define ZMBPLSIZE ZMCOLHEIGHT*ZMLINESIZE*ZMBPLDEPTH
#define ZMBPLPTRS 56
#define ZMLINESIZE 40


#include "support/gcc8_c_support.h"
#include <proto/exec.h>
#include <proto/dos.h>
#include <proto/graphics.h>
#include <graphics/gfxbase.h>
#include <graphics/view.h>
#include <exec/execbase.h>
#include <hardware/custom.h>
#include <hardware/intbits.h>

int PrepareDisplayZoom();
ULONG ClScreenZoom[12];
void Zoom_CopyColumn(UWORD *source, UWORD *destination, UWORD srccolnr,
                                                               UWORD destcolnr);

void Zoom_ZoomBlitLeft(UWORD *source, UWORD *destinatiln, UWORD colnr,
                                                                    UWORD size);
void Zoom_Init();
ULONG *Zoom_ZoomBlitMask;
UWORD *Zoom_Source;
void Zoom_SetBplPointers();
extern UWORD *font2;
