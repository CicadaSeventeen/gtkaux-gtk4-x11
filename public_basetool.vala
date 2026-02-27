namespace GdkAux {
	#if GTK3
	public Gdk.Display get_display(Gdk.Window gdkwindow){
		return GX11LegacyHelper.get_display(gdkwindow);
	}
	public Gtk.Window? get_gtk_window(Gdk.Window gdkwindow){
		void* tmp;
		gdkwindow.get_user_data(out tmp);
		if((GLib.Object)tmp is Gtk.Window){return (Gtk.Window)tmp;}
		else{
			critical("Getting gtk window failed.");
			return null;
		}
	}
	#elif GTK4
	public Gdk.Display get_display(Gdk.Surface surface){
		return GX11LegacyHelper.get_display(surface);
	}
	#endif
	namespace X11 {
		#if GTK3
		public unowned X.Display? get_xdisplay(Gdk.Window gdkwindow){
			return GX11LegacyHelper.get_xdisplay(gdkwindow);
		}
		public X.Window get_xid(Gdk.Window gdkwindow){
			return GX11LegacyHelper.get_xid(gdkwindow);
		}
		public Gdk.Rectangle get_monitor_geometry(Gdk.Window gdkwindow){
			return GX11LegacyHelper.get_monitor_geometry(gdkwindow);
		}

		#elif GTK4
		public unowned X.Display? get_xdisplay(Gdk.Surface surface){
			return GX11LegacyHelper.get_xdisplay(surface);
		}
		public X.Window get_xid(Gdk.Surface surface){
			return GX11LegacyHelper.get_xid(surface);
		}
		public Gdk.Rectangle get_monitor_geometry(Gdk.Surface surface){
			return GX11LegacyHelper.get_monitor_geometry(surface);
		}
		#endif
	}
}
namespace GtkAux{
	public Gdk.Display get_display(Gtk.Window window){
		return GX11LegacyHelper.get_display(window);
	}
	namespace X11 {
		public unowned X.Display? get_xdisplay(Gtk.Window window){
			return GX11LegacyHelper.get_xdisplay(window);
		}
		public X.Window get_xid(Gtk.Window window){
			return GX11LegacyHelper.get_xid(window);
		}
		public Gdk.Rectangle get_monitor_geometry(Gtk.Window window){
			return GX11LegacyHelper.get_monitor_geometry(window);
		}
	}
}
