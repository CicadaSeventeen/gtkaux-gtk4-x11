[CCode (cprefix = "gtkaux_", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
	[CCode (cprefix = "gtkaux_gdk_x11_", lower_case_cprefix = "gtkaux_gdk_x11_")]
namespace GdkX11Lib {
		public bool get_override_redirect(Gdk.Surface surface){
			return X11Lib.get_override_redirect(surface);
		}
		public void set_override_redirect(Gdk.Surface surface,bool enable){
			X11Lib.set_override_redirect(surface,enable);
		}

		public void get_screen_margin(Gdk.Surface surface,out int top,out int right,out int bottom,out int left){
			X11Lib.get_screen_margin(surface,out top,out right,out bottom,out left);
		}
		public void set_screen_margin(Gdk.Surface surface,int top,int right,int bottom,int left){
			X11Lib.set_screen_margin(surface,top,right,bottom,left);
		}

		public int? get_desktop_number(Gdk.Surface surface){
			return X11Lib.get_desktop_number(surface);

		}
		public void set_desktop_number(Gdk.Surface surface,int desktop_number){
			X11Lib.set_desktop_number(surface,desktop_number);
		}

		public void get_position(Gdk.Surface surface,out int x,out int y){
			X11Lib.get_position(surface,out x,out y);
		}
		public void set_position(Gdk.Surface surface,int x,int y){
			X11Lib.move(surface,x,y);
		}

		public void get_size(Gdk.Surface surface,out int width,out int height){
			X11Lib.get_size(surface,out width,out height);
		}
		public void set_size(Gdk.Surface surface,int width,int height){
			X11Lib.resize(surface,width,height);
		}

		public void get_geometry(Gdk.Surface surface,out int x,out int y,out int width,out int height){
			X11Lib.get_geometry(surface,out x,out y,out width,out height);
		}
		public void set_geometry(Gdk.Surface surface,int x,int y,int width,int height){
			X11Lib.move_resize(surface,x,y,width,height);
		}

		public void move(Gdk.Surface surface,int x,int y){
			set_position(surface,x,y);
		}
		public void resize(Gdk.Surface surface,int width,int height){
			set_size(surface,width,height);
		}
		public void move_resize(Gdk.Surface surface,int x,int y,int width,int height){
			set_geometry(surface,x,y,width,height);
		}
	}
}
