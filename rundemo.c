#include "rundemo.h"
#include "utils.h"
#include "zoomtest.h"
#include "zoom.h"

volatile int frameCounter = 0;

static __attribute__((interrupt)) void interruptHandler() {
	hw->intreq=(1<<INTB_VERTB); hw->intreq=(1<<INTB_VERTB); //reset vbl req. twice for a4000 bug.
	// DEMO - increment frameCounter
	frameCounter++;
}

void RunDemo() {
  hw->dmacon = 0b1001001111100000;
	SetInterruptHandler((APTR)interruptHandler);
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
	hw->intreq=1<<INTB_VERTB;//reset vbl req
  //PrepareDisplay();

	while(!MouseRight()) {
		WaitVbl();
    RunFrame();
	}
	SetInterruptHandler((APTR)interruptHandler);
}



void RunFrame() {
  Zoom_SetBplPointers();
  SwapCl();
  //TestZoomSpeed();
  while( !MouseLeft()) {}
  Zoom_ZoomIntoPicture( (UWORD *)ViewBuffer - 2, (UWORD *)DrawBuffer - 2, Zoom_LevelOfZoom, 5 );
  if( Zoom_LevelOfZoom == 17)
    Zoom_LevelOfZoom = 0;
  else
    Zoom_LevelOfZoom++;
}