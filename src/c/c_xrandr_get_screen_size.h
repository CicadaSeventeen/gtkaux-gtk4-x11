/* xrandr_helper.h */
#ifndef _XRANDR_HELPER_H
#define _XRANDR_HELPER_H

#include <X11/Xlib.h>

int get_monitor_geometry_from_window(Display *display, Window window, int *x, int *y, int *width, int *height);

#endif
