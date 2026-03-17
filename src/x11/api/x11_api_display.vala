[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
[CCode (cprefix = "GtkAuxX11", lower_case_cprefix = "gtkaux_x11_")]
	namespace X11Lib {
	//重要的基础工具
		public unowned X.Display? get_xdisplay(GLib.Object? window){
			if(window == null){return null;}
			else if(window is Gdk.Display){
				if (window is Gdk.X11.Display)
				{
					return ((Gdk.X11.Display)window).get_xdisplay();
				}
				else {
					return null;
				}
			}
			else {
				return get_xdisplay(get_display(window));
			}
		}

		public X.Window get_xid(GLib.Object? window){
			if(window == null){return X.None;}
			#if GTK3
			else if(window is Gdk.X11.Window){return ((Gdk.X11.Window)window).get_xid();}
			#elif GTK4
			else if(window is Gdk.X11.Surface){return ((Gdk.X11.Surface)window).get_xid();}
			#endif
			else if(window is Gtk.Window){
				#if GTK3
				return get_xid(((Gtk.Window)window).get_window());
				#elif GTK4
				return get_xid(((Gtk.Window)window).get_surface());
				#endif
			}
			else{return X.None;}
		}

		public X.WindowAttributes get_attrs(GLib.Object? window){
				return Internal.X11Lib.XDisplay.get_attrs(get_xdisplay(window),get_xid(window));
		}
	}
}
