[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
	[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_gdk_")]
	namespace GdkLib {
		public Gdk.Display get_display(Gdk.Window window){
			return get_display(window);
		}
		public Gtk.Window? get_gtk_window(Gdk.Window window){
			void* tmp;
			window.get_user_data(out tmp);
			if((GLib.Object)tmp is Gtk.Window){return (Gtk.Window)tmp;}
			else{
				critical("Getting gtk window failed.");
				return null;
			}
		}
	}
	[CCode (cprefix = "GtkAuxGdkX11", lower_case_cprefix = "gtkaux_gdk_x11_")]
	namespace GdkX11Lib {
		public unowned X.Display? get_xdisplay(Gdk.Window window){
			return X11Lib.get_xdisplay(window);
		}
		public X.Window get_xid(Gdk.Window window){
			return X11Lib.get_xid(window);
		}
		public void get_monitor_geometry(Gdk.Window window,out int x,out int y,out int width,out int height){
			X11Lib.get_monitor_geometry(window,out x,out y,out width,out height);
		}
	}
}

