#include "runtests.h"
#include "coppertests.h"
#include "zoomtest.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    ZoomTest();
    //SwScrollerTest();
}