[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
	[CCode (cprefix = "GtkAuxGdkX11", lower_case_cprefix = "gtkaux_gdk_x11_")]
	namespace GdkX11Lib {
		// universal hint by string
		public bool is_hint_supported_by_string(Gdk.Surface surface,string hint_str){
			return X11Lib.is_hint_supported_by_string(surface,hint_str);
		}
		public bool is_hint_enabled_by_string(Gdk.Surface surface,string hint_str,string hint_type_str){
			return X11Lib.is_hint_enabled_by_string(surface,hint_str,hint_type_str);
		}
		public void set_hint_by_string(Gdk.Surface surface,string hint_str,string hint_type_str,bool enable){
			X11Lib.set_hint_by_string(surface,hint_str,hint_type_str,enable);
		}

		// window type hint
		public bool is_window_type_hint_supported(Gdk.Surface surface,int window_type_hint){
			return X11Lib.is_window_type_hint_supported(surface,window_type_hint);
		}
		public int get_window_type_hint(Gdk.Surface surface){
			return X11Lib.get_window_type_hint(surface);
		}
		public void set_window_type_hint(Gdk.Surface surface,int window_type_hint){
			X11Lib.set_window_type_hint(surface,window_type_hint);
		}

		// window state hint
		public bool is_window_state_hint_supported(Gdk.Surface surface,int window_state_hint){
			return X11Lib.is_window_state_hint_supported(surface,window_state_hint);
		}
		public bool get_window_state_hint(Gdk.Surface surface,int window_state_hint){
			return X11Lib.get_window_state_hint(surface,window_state_hint);
		}
		public void set_window_state_hint(Gdk.Surface surface,int window_state_hint,bool enable){
			X11Lib.set_window_state_hint(surface,window_state_hint,enable);
		}
	}
}
