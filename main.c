#include "utils.h"
#include "runtests.h"
#include "rundemo.h"

int main() {

  SysBase = *((struct ExecBase**)4UL);
	hw = (struct Custom*)0xdff000;

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
	if (!GfxBase)
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
	if (!DOSBase)
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
	Write(Output(), "Hello console!\n", 15);
	Delay(50);
  Zoom_InitRun();
  //RunTests();
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();

	// DEMO
	RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
	CloseLibrary((struct Library*)GfxBase);
}
