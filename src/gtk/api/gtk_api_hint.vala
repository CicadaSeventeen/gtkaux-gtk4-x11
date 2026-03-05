[CCode (cprefix = "gtkaux_", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
	[CCode (cprefix = "gtkaux_gtk_x11_", lower_case_cprefix = "gtkaux_gtk_x11_")]
	namespace GtkX11Lib {
		// window type hint
		public int get_window_type_hint(Gtk.Window window){
			var helper = new Internal.GtkLib.WindowTypeHintHelper(window);
			return helper.get_smart()?? (int)X11Lib.WindowTypeHint.NONE;
		}
		public void set_window_type_hint(Gtk.Window window,int window_type_hint){
			var helper = new Internal.GtkLib.WindowTypeHintHelper(window);
			helper.set_smart(window_type_hint);
		}

		// window state hint
		public bool get_window_state_hint(Gtk.Window window,int window_state_hint){
			var helper = new Internal.GtkLib.WindowStateHintHelper(window);
			bool? ret = helper.get_smart(window_state_hint);
			if(ret!=null){return ret;}
			else{return false;}
		}
		public void set_window_state_hint(Gtk.Window window,int window_state_hint,bool enable){
			var helper = new Internal.GtkLib.WindowStateHintHelper(window);
			helper.set_smart(window_state_hint,enable);
		}
	}
}
