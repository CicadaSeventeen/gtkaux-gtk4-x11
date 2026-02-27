namespace GdkAux {
	public struct Pair {
		public int x;
		public int y;
	}
	namespace X11 {
		#if GTK3
		public bool get_override_redirect(Gdk.Window gdkwindow){
			return GX11LegacyHelper.get_override_redirect(gdkwindow);
		}
		public void set_override_redirect(Gdk.Window gdkwindow,bool enable){
			GX11LegacyHelper.set_override_redirect(gdkwindow,enable);
		}

		public Gtk.Border get_screen_margin(Gdk.Window gdkwindow){
			return GX11LegacyHelper.get_margin(gdkwindow);
		}
		public void set_screen_margin(Gdk.Window gdkwindow,Gtk.Border margin){
			GX11LegacyHelper.set_margin(gdkwindow,margin);
		}

		internal int? get_desktop_number(Gdk.Window gdkwindow){
			return GX11LegacyHelper.get_desktop_number(gdkwindow);

		}
		internal void set_desktop_number(Gdk.Window gdkwindow,int desktop_number){
			GX11LegacyHelper.set_desktop_number(gdkwindow,desktop_number);
		}

		public X.WindowAttributes get_attrs(Gdk.Window gdkwindow){
			return GX11LegacyHelper.get_attrs(gdkwindow);
		}

		public Pair get_position(Gdk.Window gdkwindow){
			Pair ret = {0};
			GX11LegacyHelper.get_position(gdkwindow,out ret.x,out ret.y);
			return ret;
		}
		public void set_position(Gdk.Window gdkwindow,Pair target){
			GX11LegacyHelper.move(gdkwindow,target.x,target.y);
		}

		public Pair get_size(Gdk.Window gdkwindow){
			Pair ret = {0};
			GX11LegacyHelper.get_size(gdkwindow,out ret.x,out ret.y);
			return ret;
		}
		public void set_size(Gdk.Window gdkwindow,Pair target){
			GX11LegacyHelper.resize(gdkwindow,target.x,target.y);
		}

		public Gdk.Rectangle get_geometry(Gdk.Window gdkwindow){
			return GX11LegacyHelper.get_geometry(gdkwindow);
		}
		public void set_geometry(Gdk.Window gdkwindow,Gdk.Rectangle target){
			GX11LegacyHelper.move_resize(gdkwindow,target);
		}

		public void move(Gdk.Window gdkwindow,Pair target){
			set_position(gdkwindow,target);
		}
		public void resize(Gdk.Window gdkwindow,Pair target){
			set_size(gdkwindow,target);
		}
		public void move_resize(Gdk.Window gdkwindow,Gdk.Rectangle target){
			set_geometry(gdkwindow,target);
		}
		#elif GTK4
		public bool get_override_redirect(Gdk.Surface surface){
			return GX11LegacyHelper.get_override_redirect(surface);
		}
		public void set_override_redirect(Gdk.Surface surface,bool enable){
			GX11LegacyHelper.set_override_redirect(surface,enable);
		}

		public Gtk.Border get_screen_margin(Gdk.Surface surface){
			return GX11LegacyHelper.get_margin(surface);
		}
		public void set_screen_margin(Gdk.Surface surface,Gtk.Border margin){
			GX11LegacyHelper.set_margin(surface,margin);
		}

		public int? get_desktop_number(Gdk.Surface surface){
			return GX11LegacyHelper.get_desktop_number(surface);

		}
		public void set_desktop_number(Gdk.Surface surface,int desktop_number){
			GX11LegacyHelper.set_desktop_number(surface,desktop_number);
		}

		public X.WindowAttributes get_attrs(Gdk.Surface surface){
			return GX11LegacyHelper.get_attrs(surface);
		}

		public Pair get_position(Gdk.Surface surface){
			Pair ret = {0};
			GX11LegacyHelper.get_position(surface,out ret.x,out ret.y);
			return ret;
		}
		public void set_position(Gdk.Surface surface,Pair target){
			GX11LegacyHelper.move(surface,target.x,target.y);
		}

		public Pair get_size(Gdk.Surface surface){
			Pair ret = {0};
			GX11LegacyHelper.get_size(surface,out ret.x,out ret.y);
			return ret;
		}
		public void set_size(Gdk.Surface surface,Pair target){
			GX11LegacyHelper.resize(surface,target.x,target.y);
		}

		public Gdk.Rectangle get_geometry(Gdk.Surface surface){
			return GX11LegacyHelper.get_geometry(surface);
		}
		public void set_geometry(Gdk.Surface surface,Gdk.Rectangle target){
			GX11LegacyHelper.move_resize(surface,target);
		}

		public void move(Gdk.Surface surface,Pair target){
			set_position(surface,target);
		}
		public void resize(Gdk.Surface surface,Pair target){
			set_size(surface,target);
		}
		public void move_resize(Gdk.Surface surface,Gdk.Rectangle target){
			set_geometry(surface,target);
		}
		#endif
	}
}
