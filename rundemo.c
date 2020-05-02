#include "rundemo.h"
#include "utils.h"
#include "zoomtest.h"
#include "zoom.h"
#include "zoom102.h"

volatile int frameCounter = 0;

static __attribute__((interrupt)) void interruptHandler() {
	hw->intreq=(1<<INTB_VERTB); hw->intreq=(1<<INTB_VERTB); //reset vbl req. twice for a4000 bug.
	// DEMO - increment frameCounter
	frameCounter++;
  UWORD *bp = 0x200;
  *bp = 0;
  //Zoom_VblankHandler();
}

void RunDemo() {
//               5432109876543210
  hw->dmacon = 0b1000011111111111;
  //             1001001111100000	; copper,bitplane,blitter DMA

  /*hw->dmacon =   
  0x87e0;*/
	//SetInterruptHandler((APTR)interruptHandler);
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
	hw->intreq=1<<INTB_VERTB;//reset vbl req
  //PrepareDisplay();

	while(!MouseRight()) {
		WaitVbl();
    RunFrame();
	}
	//SetInterruptHandler((APTR)interruptHandler);
}

void SetInterrupt() {
  SetInterruptHandler((APTR)interruptHandler);
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
	hw->intreq=1<<INTB_VERTB;//reset vbl req
}

void RunFrame() {
  Zoom_Blit4ZoomFinished = 0;
  UWORD tmp = Zoom_LevelOfZoom;
  if(Zoom_LevelOfZoom == 0)
    CopyMemQuick( Zoom_StartImage, DrawBuffer, ZMBPLSIZE);
  else
    Zoom_ZoomIntoPicture( (UWORD *)ViewBuffer, (UWORD *)DrawBuffer, Zoom_LevelOfZoom, 5 );

  Zoom_Blit4ZoomFinished = 1;
  /*UWORD *bp = 0x200;
  *bp = 0;*/
  while( tmp == Zoom_LevelOfZoom) { }
}