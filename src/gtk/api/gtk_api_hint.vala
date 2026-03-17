[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
[CCode (cprefix = "GtkAuxGtkX11", lower_case_cprefix = "gtkaux_gtk_x11_")]
	namespace GtkX11Lib {
		// window type hint
		public int get_window_type_hint(Gtk.Window window){
			var helper = new Internal.GtkLib.WindowHelper_TypeHint(window);
			if((!helper.is_done())){
				return helper.get_info();
			}else{
				return X11Lib.get_window_type_hint(window);
			}
		}
		public void set_window_type_hint(Gtk.Window window,int window_type_hint){
			var helper = new Internal.GtkLib.WindowHelper_TypeHint(window);
			if(helper.is_done()){
				X11Lib.set_window_type_hint(window,window_type_hint);
			}else{
				helper.content_ref = window_type_hint;
				helper.link_func();
			}
		}

		// window state hint
		public bool get_window_state_hint(Gtk.Window window,int window_state_hint){
			var helper = new Internal.GtkLib.WindowHelper_StateHint(window);
			if((!helper.is_done())){
				return helper.get_info_by_index(window_state_hint);
			}else{
				return X11Lib.get_window_state_hint(window,window_state_hint);
			}
		}
		public void set_window_state_hint(Gtk.Window window,int window_state_hint,bool enable){
			var helper = new Internal.GtkLib.WindowHelper_StateHint(window);
			if(helper.is_done()){
				X11Lib.set_window_state_hint(window,window_state_hint,enable);
			}else{
				helper.set_info_by_index(window_state_hint,enable);
				helper.link_func();
			}
		}
	}
}
