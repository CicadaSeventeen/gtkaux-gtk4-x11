/* xrandr_helper.vapi */
[CCode (cheader_filename = "X11/Xlib.h,c_xrandr_get_screen_size.h")]
namespace GX11LegacyHelper {
	namespace C {
		namespace XRandR {
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
