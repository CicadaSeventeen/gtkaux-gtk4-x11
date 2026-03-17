[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux{
[CCode (cprefix = "GtkAuxX11", lower_case_cprefix = "gtkaux_x11_")]
	namespace X11Lib {
		private const string window_type_hint_type_str = "_NET_WM_WINDOW_TYPE";
		private const string window_state_hint_type_str = "_NET_WM_STATE";
		public bool is_hint_supported_by_string(GLib.Object? window, string hint_str) {
			return Internal.X11Lib.XDisplay.Ewmh.if_hint_supported(get_xdisplay(window),get_xid(window),hint_str);
		}
		public bool is_hint_enabled_by_string(GLib.Object? window, string hint_str, string hint_type_str) {
			return Internal.X11Lib.XDisplay.Ewmh.if_hint_enabled(get_xdisplay(window),get_xid(window),hint_str,hint_type_str);
		}
		public void set_hint_by_string(GLib.Object? window, string hint_str, string hint_type_str, bool enable) {
			if(!is_hint_supported_by_string(window,hint_str) || !is_hint_supported_by_string(window,hint_type_str)){
				warning("Hint not support.");
				return;
			}
			Internal.X11Lib.XDisplay.Ewmh.set_hint(get_xdisplay(window),get_xid(window),hint_str,hint_type_str,enable,true,false);
		}

		// window type hint
		public bool is_window_type_hint_supported_by_string(GLib.Object? window,string window_type_hint_str){
			return (is_hint_supported_by_string(window,window_type_hint_str) && is_hint_supported_by_string(window,window_type_hint_type_str));
		}
		public string get_window_type_hint_by_string(GLib.Object? window){
			if(!is_hint_supported_by_string(window,window_type_hint_type_str)){critical("Window type %s not supported.",window_type_hint_type_str);return "";}
			return Internal.X11Lib.XDisplay.Ewmh.get_window_type(get_xdisplay(window),get_xid(window))?? "";
		}
		public void set_window_type_hint_by_string(GLib.Object? window,string window_type_hint_str){
			if (!is_window_type_hint_supported_by_string(window,window_type_hint_str)){critical("Window type %s not supported.",window_type_hint_str);return;}
			Internal.X11Lib.XDisplay.Ewmh.set_hint(get_xdisplay(window),get_xid(window),window_type_hint_str,window_type_hint_type_str,true,true,true);
		}

		// state hint
		public bool is_window_state_hint_supported_by_string(GLib.Object? window,string window_state_hint_str){
			return (is_hint_supported_by_string(window,window_state_hint_str) && is_hint_supported_by_string(window,window_state_hint_type_str));
		}
		public bool get_window_state_hint_by_string(GLib.Object? window,string window_state_hint_str){
			if(!is_hint_supported_by_string(window,window_state_hint_type_str)){critical("Window state %s not supported.",window_state_hint_type_str);return false;}
			return is_hint_enabled_by_string(window,window_state_hint_str,window_state_hint_type_str);
		}
		public void set_window_state_hint_by_string(GLib.Object? window,string window_state_hint_str,bool enable){
			if(!is_window_state_hint_supported_by_string(window,window_state_hint_str)){critical("Window state %s not supported.",window_state_hint_str);return;}
			Internal.X11Lib.XDisplay.Ewmh.set_hint(get_xdisplay(window),get_xid(window),window_state_hint_str,window_state_hint_type_str,enable,true,false);
		}
	}
}
