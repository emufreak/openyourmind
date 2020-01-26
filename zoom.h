#define ZMCPSIZE (256*41+35)*4
#define ZMBPLDEPTH 5
#define ZMBPLSIZE 320*ZMLINESIZE*ZMBPLDEPTH
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
void Zoom_CopyColumn(UWORD *source, UWORD *destination, unsigned int colnr);
UWORD *Zoom_Source;
extern UWORD *font2;
