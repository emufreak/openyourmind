#ifndef ZOOM_H
#define ZOOM_H

#include <proto/exec.h>

#define ZMCPSIZE (73+126)*4
#define ZMBPLDEPTH 5
#define ZMCOLHEIGHT 272
#define ZMBPLSIZE ZMCOLHEIGHT*ZMLINESIZE*ZMBPLDEPTH
#define ZMBPLPTRS 56
#define ZMLINESIZE 42
#define ZMLINESIZE2 44
//#define ZMBPLMOD ZMLINESIZE*(ZMBPLDEPTH-1)+6
#define ZMBPLMOD 0
#define ZMBPLMOD2 ZMLINESIZE
//#define ZMBPLMOD2 ZMBPLMOD+ZMLINESIZE*ZMBPLDEPTH
#define ZMCOPBPL1HIGH 57
#define ZMCOPBPL1LOW 59

#include "support/gcc8_c_support.h"
#include <proto/exec.h>
#include <proto/dos.h>
#include <proto/graphics.h>
#include <graphics/gfxbase.h>
#include <graphics/view.h>
#include <exec/execbase.h>
#include <hardware/custom.h>
#include <hardware/intbits.h>

extern UWORD *Zoom_StartImage;
extern UWORD Zoom_MouseReleased;
extern UWORD Zoom_Mousepressed;
extern UWORD Zoom_Blit4ZoomFinished;
extern UWORD volatile Zoom_LevelOfZoom;
extern UWORD volatile Zoom_LevelOf102Zoom;
extern WORD Zoom_Direction;
extern WORD ZoomHorizontal;
int PrepareDisplayZoom();
extern ULONG ClScreenZoom[12];

void c2p();
ULONG *ClbuildZoom();
void Zoom_CopyColumn(UWORD *source, UWORD *destination, UWORD srccolnr,
                                                               UWORD destcolnr);

void Zoom_ZoomBlit(UWORD *source, UWORD *destination, UWORD size);

void Zoom_CopyWord( UWORD *source, UWORD *destination, UWORD height);

void Zoom_ZoomBlit2( UWORD *src4a, UWORD *src4b, UWORD *dst, UWORD height,
                               UWORD bltamod, UWORD bltbmod, UWORD numofwords);

void Zoom_Init();
void Zoom_InitRun();
void Zoom_InitRunReverse();
void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                  UWORD planes);
void Zoom_ZoomIntoPicture2( UWORD *source1, UWORD *source2, UWORD *target, 
             UWORD levelofzoom, UWORD nrofplanes);
int Zoom_PrepareDisplay();
void Init_Copy( WORD shift);
void Init_ZoomBlit( UWORD startofword, WORD nextzoom, WORD shiftright);
void Init_Blit();
void Zoom_VblankHandler();
void Zoom_Dealloc();
void Zoom_Run();

extern UWORD *Zoom_Zl4Words;
extern ULONG *Zoom_ZoomBlitMask;
extern UWORD *Zoom_Source;
extern UWORD ZoomBlit_Increment4SrcA;
extern ULONG Zoom_Rawchip;
extern ULONG Zoom_Rawfast;
extern struct Interrupt *Zoom_vbint;

extern UWORD Zoom_Counter;
extern UWORD *font2;
void Zoom_SetBplPointers( UWORD volatile *buffer, ULONG volatile *copper);
//void Zoom_SwapBuffers();
void Zoom_SwapBuffers( UWORD Zoomlevel);

#endif