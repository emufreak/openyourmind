#include "rundemo.h"
#include "utils.h"
#include "zoomtest.h"

//INCBIN(colors, "colors.bin")

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

	while(!MouseLeft()) {
		WaitVbl();
		// DEMO - set colors from INCBIN (contains 64 colors)
    RunFrame();
		//hw->color[0] = ((UWORD*)colors)[frameCounter & 63];
	}
	SetInterruptHandler((APTR)interruptHandler);
}

void RunFrame() {
  //TestZoomSpeed();
  SwapCl();
  SetBplPointers();
}