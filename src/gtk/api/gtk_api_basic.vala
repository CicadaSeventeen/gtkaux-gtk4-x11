[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
[CCode (cprefix = "GtkAuxGtkX11", lower_case_cprefix = "gtkaux_gtk_x11_")]
	namespace GtkX11Lib {
		public bool get_override_redirect(Gtk.Window window){
			var helper = new Internal.GtkLib.WindowHelper_OverrideRedirect(window);
			if((!helper.is_done())){
				return helper.get_info();
			}else{
				return X11Lib.get_override_redirect(window);
			}
		}

		public void set_override_redirect(Gtk.Window window,bool enable){
			var helper = new Internal.GtkLib.WindowHelper_OverrideRedirect(window);
			if(helper.is_done()){
				X11Lib.set_override_redirect(window,enable);
			}else{
				helper.content_ref = enable;
				helper.link_func();
			}
		}

		public int? get_desktop_number(Gtk.Window window){
			var helper = new Internal.GtkLib.WindowHelper_DesktopNumber(window);
			if(!helper.is_done()){
				return helper.get_info();
			}else{
				return X11Lib.get_desktop_number(window);
			}
		}

		public void set_desktop_number(Gtk.Window window,int desktop_number){
			var helper = new Internal.GtkLib.WindowHelper_DesktopNumber(window);
			if(helper.is_done()){
				X11Lib.set_desktop_number(window,desktop_number);
			}else{
				helper.content_ref = desktop_number;
				helper.link_func();
			}
		}
	}
}
