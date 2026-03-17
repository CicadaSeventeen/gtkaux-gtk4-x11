[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
	[CCode (cprefix = "GtkAuxGdkX11", lower_case_cprefix = "gtkaux_gdk_x11_")]
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
	}
}
