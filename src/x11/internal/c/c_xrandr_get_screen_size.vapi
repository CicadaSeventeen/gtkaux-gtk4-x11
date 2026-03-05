/* xrandr_helper.vapi */
[CCode (cprefix = "gtkaux_", lower_case_cprefix = "gtkaux_",cheader_filename = "X11/Xlib.h,c_xrandr_get_screen_size.h")]
namespace GtkAux{
	namespace Internal {
		[CCode (cprefix = "gtkaux_internal_x11_", lower_case_cprefix = "gtkaux_internal_x11_")]
		namespace X11Lib {
			namespace XDisplay {
				namespace C {
					namespace Xrandr {
						/**
						* @param display X.Display
						* @param window X.Window ID
						*/
						[CCode (cname = "get_monitor_geometry_from_window")]
						public bool get_monitor_geometry (
							X.Display display,
							X.Window window,
							out int x,
							out int y,
							out int width,
							out int height
						);
					}
				}
			}
		}
	}
}
