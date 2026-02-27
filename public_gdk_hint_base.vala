namespace GdkAux {
	namespace X11 {
		internal const string window_type_hint_type_str = "_NET_WM_WINDOW_TYPE";
		internal const string window_state_hint_type_str = "_NET_WM_STATE";
		#if GTK3
		public bool is_hint_supported_by_string(Gdk.Window gdkwindow,string hint_str){
			return GX11LegacyHelper.if_hint_available(gdkwindow,hint_str);
		}
		public bool is_hint_enabled_by_string(Gdk.Window gdkwindow,string hint_str,string hint_type_str){
			return GX11LegacyHelper.if_hint_enabled(gdkwindow,hint_str,hint_type_str);
		}
		public void set_hint_by_string(Gdk.Window gdkwindow,string hint_str,string hint_type_str,bool enable){
			GX11LegacyHelper.set_hint(gdkwindow,hint_str,hint_type_str,enable);
		}

		// window type hint
		public bool is_type_hint_supported(Gdk.Window gdkwindow,WindowTypeHint window_type_hint){
			return is_type_hint_supported_by_string(gdkwindow,window_type_hint.to_string());
		}
		public WindowTypeHint get_type_hint(Gdk.Window gdkwindow){
			return WindowTypeHint.parse(get_type_hint_by_string(gdkwindow));
		}
		public void set_type_hint(Gdk.Window gdkwindow,WindowTypeHint window_type_hint){
			set_type_hint_by_string(gdkwindow,window_type_hint.to_string());
		}

		internal static bool is_type_hint_supported_by_string(Gdk.Window gdkwindow,string window_type_hint_str){
			return (is_hint_supported_by_string(gdkwindow,window_type_hint_str) && is_hint_supported_by_string(gdkwindow,window_type_hint_type_str));
		}
		internal static string get_type_hint_by_string(Gdk.Window gdkwindow){
			if(!is_hint_supported_by_string(gdkwindow,window_type_hint_type_str)){critical("Window type %s not supported.",window_type_hint_type_str);return "";}
			return GX11LegacyHelper.get_window_type(gdkwindow);
		}
		internal static void set_type_hint_by_string(Gdk.Window gdkwindow,string window_type_hint_str){
			if (!is_type_hint_supported_by_string(gdkwindow,window_type_hint_str)){critical("Window type %s not supported.",window_type_hint_str);return;}
			GX11LegacyHelper.set_window_type(gdkwindow,window_type_hint_str);
		}

		// window state hint
		public bool is_state_hint_supported(Gdk.Window gdkwindow,WindowStateHint window_state_hint){
			return is_state_hint_supported_by_string(gdkwindow,window_state_hint.to_string());
		}
		public bool get_state_hint(Gdk.Window gdkwindow,WindowStateHint window_state_hint){
			return get_state_hint_by_string(gdkwindow,window_state_hint.to_string());
		}
		public void set_state_hint(Gdk.Window gdkwindow,WindowStateHint window_state_hint,bool enable){
			set_state_hint_by_string(gdkwindow,window_state_hint.to_string(),enable);
		}

		internal static bool is_state_hint_supported_by_string(Gdk.Window gdkwindow,string window_state_hint_str){
			return (is_hint_supported_by_string(gdkwindow,window_state_hint_str) && is_hint_supported_by_string(gdkwindow,window_state_hint_type_str));
		}
		internal static bool get_state_hint_by_string(Gdk.Window gdkwindow,string window_state_hint_str){
			if(!is_hint_supported_by_string(gdkwindow,window_state_hint_type_str)){critical("Window state %s not supported.",window_state_hint_type_str);return false;}
			return is_hint_enabled_by_string(gdkwindow,window_state_hint_str,window_state_hint_type_str);
		}
		internal static void set_state_hint_by_string(Gdk.Window gdkwindow,string window_state_hint_str,bool enable){
			if(!is_state_hint_supported_by_string(gdkwindow,window_state_hint_str)){critical("Window state %s not supported.",window_state_hint_str);return;}
			GX11LegacyHelper.set_hint(gdkwindow,window_state_hint_str,window_state_hint_type_str,enable);
		}



		#elif GTK4
		// universal hint by string
		public bool is_hint_supported_by_string(Gdk.Surface surface,string hint_str){
			return GX11LegacyHelper.if_hint_available(surface,hint_str);
		}
		public bool is_hint_enabled_by_string(Gdk.Surface surface,string hint_str,string hint_type_str){
			return GX11LegacyHelper.if_hint_enabled(surface,hint_str,hint_type_str);
		}
		public void set_hint_by_string(Gdk.Surface surface,string hint_str,string hint_type_str,bool enable){
			GX11LegacyHelper.set_hint(surface,hint_str,hint_type_str,enable);
		}

		// window type hint
		public bool is_type_hint_supported(Gdk.Surface surface,WindowTypeHint window_type_hint){
			return is_type_hint_supported_by_string(surface,window_type_hint.to_string());
		}
		public WindowTypeHint get_type_hint(Gdk.Surface surface){
			return WindowTypeHint.parse(get_type_hint_by_string(surface));
		}
		public void set_type_hint(Gdk.Surface surface,WindowTypeHint window_type_hint){
			set_type_hint_by_string(surface,window_type_hint.to_string());
		}

		internal static bool is_type_hint_supported_by_string(Gdk.Surface surface,string window_type_hint_str){
			return (is_hint_supported_by_string(surface,window_type_hint_str) && is_hint_supported_by_string(surface,window_type_hint_type_str));
		}
		internal static string get_type_hint_by_string(Gdk.Surface surface){
			if(!is_hint_supported_by_string(surface,window_type_hint_type_str)){critical("Window type %s not supported.",window_type_hint_type_str);return "";}
			return GX11LegacyHelper.get_window_type(surface);
		}
		internal static void set_type_hint_by_string(Gdk.Surface surface,string window_type_hint_str){
			if (!is_type_hint_supported_by_string(surface,window_type_hint_str)){critical("Window type %s not supported.",window_type_hint_str);return;}
			GX11LegacyHelper.set_window_type(surface,window_type_hint_str);
		}

		// window state hint
		public bool is_state_hint_supported(Gdk.Surface surface,WindowStateHint window_state_hint){
			return is_state_hint_supported_by_string(surface,window_state_hint.to_string());
		}
		public bool get_state_hint(Gdk.Surface surface,WindowStateHint window_state_hint){
			return get_state_hint_by_string(surface,window_state_hint.to_string());
		}
		public void set_state_hint(Gdk.Surface surface,WindowStateHint window_state_hint,bool enable){
			set_state_hint_by_string(surface,window_state_hint.to_string(),enable);
		}

		internal static bool is_state_hint_supported_by_string(Gdk.Surface surface,string window_state_hint_str){
			return (is_hint_supported_by_string(surface,window_state_hint_str) && is_hint_supported_by_string(surface,window_state_hint_type_str));
		}
		internal static bool get_state_hint_by_string(Gdk.Surface surface,string window_state_hint_str){
			if(!is_hint_supported_by_string(surface,window_state_hint_type_str)){critical("Window state %s not supported.",window_state_hint_type_str);return false;}
			return is_hint_enabled_by_string(surface,window_state_hint_str,window_state_hint_type_str);
		}
		internal static void set_state_hint_by_string(Gdk.Surface surface,string window_state_hint_str,bool enable){
			if(!is_state_hint_supported_by_string(surface,window_state_hint_str)){critical("Window state %s not supported.",window_state_hint_str);return;}
			GX11LegacyHelper.set_hint(surface,window_state_hint_str,window_state_hint_type_str,enable);
		}
		#endif
	}
}
