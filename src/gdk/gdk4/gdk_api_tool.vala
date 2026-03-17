[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
	[CCode (cprefix = "GtkAuxGdk", lower_case_cprefix = "gtkaux_gdk_")]
	namespace GdkLib {
		public Gdk.Display get_display(Gdk.Surface surface){
			return get_display(surface);
		}
	}
	[CCode (cprefix = "GtkAuxGdkX11", lower_case_cprefix = "gtkaux_gdk_x11_")]
	namespace GdkX11Lib {
		public unowned X.Display? get_xdisplay(Gdk.Surface surface){
			return X11Lib.get_xdisplay(surface);
		}
		public X.Window get_xid(Gdk.Surface surface){
			return X11Lib.get_xid(surface);
		}
		public void get_monitor_geometry(Gdk.Surface surface,out int x,out int y,out int width,out int height){
			X11Lib.get_monitor_geometry(surface,out x,out y,out width,out height);
		}
	}
}

