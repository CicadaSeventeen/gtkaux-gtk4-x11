[CCode (cprefix = "gtkaux_", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
	[CCode (cprefix = "gtkaux_gtk_x11_", lower_case_cprefix = "gtkaux_gtk_x11_")]
namespace GtkX11Lib {
		public bool get_override_redirect(Gtk.Window window){
			var helper = new Internal.GtkLib.OverrideRedirectHelper(window);
			return helper.get_smart()?? false;
		}
		public void set_override_redirect(Gtk.Window window,bool enable){
			var helper = new Internal.GtkLib.OverrideRedirectHelper(window);
			helper.set_smart(enable);
		}

		public void get_screen_margin(Gtk.Window window,out int top,out int right,out int bottom,out int left){
			var helper = new Internal.GtkLib.ScreenMarginHelper(window);
			helper.get_smart(out top,out right,out bottom,out left);
		}
		public void set_screen_margin(Gtk.Window window,int top,int right,int bottom,int left){
			var helper = new Internal.GtkLib.ScreenMarginHelper(window);
			helper.set_smart(top,right,bottom,left);
		}

		public int? get_desktop_number(Gtk.Window window){
			var helper = new Internal.GtkLib.DesktopNumberHelper(window);
			return helper.get_smart();

		}
		public void set_desktop_number(Gtk.Window window,int desktop_number){
			var helper = new Internal.GtkLib.DesktopNumberHelper(window);
			helper.set_smart(desktop_number);
		}

		public void get_position(Gtk.Window window,out int x,out int y){
			var helper = new Internal.GtkLib.MoveGeometryHelper(window);
			int width,height;
			helper.get_smart(out x,out y,out width,out height);
		}
		public void set_position(Gtk.Window window,int x,int y){
			var helper = new Internal.GtkLib.MoveGeometryHelper(window);
			helper.set_smart(x,y,0,0,true,false);
		}

		public void get_size(Gtk.Window window,out int width,out int height){
			var helper = new Internal.GtkLib.MoveGeometryHelper(window);
			int x,y;
			helper.get_smart(out x,out y,out width,out height);
		}
		public void set_size(Gtk.Window window,int width,int height){
			var helper = new Internal.GtkLib.MoveGeometryHelper(window);
			helper.set_smart(0,0,width,height,false,true);
		}

		public void get_geometry(Gtk.Window window,out int x,out int y,out int width,out int height){
			var helper = new Internal.GtkLib.MoveGeometryHelper(window);
			helper.get_smart(out x,out y,out width,out height);
		}
		public void set_geometry(Gtk.Window window,int x,int y,int width,int height){
			var helper = new Internal.GtkLib.MoveGeometryHelper(window);
			helper.set_smart(x,y,width,height,true,true);
		}

		public void move(Gtk.Window window,int x,int y){
			set_position(window,x,y);
		}
		public void resize(Gtk.Window window,int width,int height){
			set_size(window,width,height);
		}
		public void move_resize(Gtk.Window window,int x,int y,int width,int height){
			set_geometry(window,x,y,width,height);
		}
	}
}
