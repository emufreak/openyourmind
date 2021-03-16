#define SWCPSIZE 33*4
#define SWBPLSIZE 640*80

#include "support/gcc8_c_support.h"
#include <proto/exec.h>
#include <proto/dos.h>
#include <proto/graphics.h>
#include <graphics/gfxbase.h>
#include <graphics/view.h>
#include <exec/execbase.h>
#include <hardware/custom.h>
#include <hardware/intbits.h>

int PrepareDisplaySW();
ULONG *ClbuildSW();
void WriteFont();