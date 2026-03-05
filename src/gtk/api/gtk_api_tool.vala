[CCode (cprefix = "gtkaux_", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
	[CCode (cprefix = "gtkaux_gtk_", lower_case_cprefix = "gtkaux_gtk_")]
	namespace GtkLib {
		public Gdk.Display get_display(Gtk.Window window){
			return get_display(window);
		}
	}
	[CCode (cprefix = "gtkaux_gtk_x11_", lower_case_cprefix = "gtkaux_gtk_x11_")]
	namespace GtkX11Lib {
		public unowned X.Display? get_xdisplay(Gtk.Window window){
			return X11Lib.get_xdisplay(window);
		}
		public X.Window get_xid(Gtk.Window window){
			return X11Lib.get_xid(window);
		}
		public void get_monitor_geometry(Gtk.Window window,out int x,out int y,out int width,out int height){
			X11Lib.get_monitor_geometry(window,out x,out y,out width,out height);
		}
	}
}

