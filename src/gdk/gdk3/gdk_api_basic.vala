[CCode (cprefix = "gtkaux_", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
	[CCode (cprefix = "gtkaux_gdk_x11_", lower_case_cprefix = "gtkaux_gdk_x11_")]
namespace GdkX11Lib {
		public bool get_override_redirect(Gdk.Window window){
			return X11Lib.get_override_redirect(window);
		}
		public void set_override_redirect(Gdk.Window window,bool enable){
			X11Lib.set_override_redirect(window,enable);
		}

		public void get_screen_margin(Gdk.Window window,out int top,out int right,out int bottom,out int left){
			X11Lib.get_screen_margin(window,out top,out right,out bottom,out left);
		}
		public void set_screen_margin(Gdk.Window window,int top,int right,int bottom,int left){
			X11Lib.set_screen_margin(window,top,right,bottom,left);
		}

		public int? get_desktop_number(Gdk.Window window){
			return X11Lib.get_desktop_number(window);

		}
		public void set_desktop_number(Gdk.Window window,int desktop_number){
			X11Lib.set_desktop_number(window,desktop_number);
		}

		public void get_position(Gdk.Window window,out int x,out int y){
			X11Lib.get_position(window,out x,out y);
		}
		public void set_position(Gdk.Window window,int x,int y){
			X11Lib.move(window,x,y);
		}

		public void get_size(Gdk.Window window,out int width,out int height){
			X11Lib.get_size(window,out width,out height);
		}
		public void set_size(Gdk.Window window,int width,int height){
			X11Lib.resize(window,width,height);
		}

		public void get_geometry(Gdk.Window window,out int x,out int y,out int width,out int height){
			X11Lib.get_geometry(window,out x,out y,out width,out height);
		}
		public void set_geometry(Gdk.Window window,int x,int y,int width,int height){
			X11Lib.move_resize(window,x,y,width,height);
		}

		public void move(Gdk.Window window,int x,int y){
			set_position(window,x,y);
		}
		public void resize(Gdk.Window window,int width,int height){
			set_size(window,width,height);
		}
		public void move_resize(Gdk.Window window,int x,int y,int width,int height){
			set_geometry(window,x,y,width,height);
		}
	}
}
