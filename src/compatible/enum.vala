namespace GtkAux {
	#if API_COMPATIBLE
	[CCode (cprefix = "gdk_", lower_case_cprefix = "gdk_")]
	#else
	[CCode (cprefix = "gdklegacy_", lower_case_cprefix = "gdklegacy_")]
	#endif
	namespace GdkLegacy {
		#if GTK3
		using Gdk;
		#elif GTK4
		public enum WindowTypeHint {
			NORMAL,
			DIALOG,
			MENU,
			TOOLBAR,
			SPLASHSCREEN,
			UTILITY,
			DOCK,
			DESKTOP,
			DROPDOWN_MENU,
			POPUP_MENU,
			TOOLTIP,
			NOTIFICATION,
			COMBO,
			DND
			}
		#endif
		internal static X11Lib.WindowTypeHint window_type_hint_to_aux(WindowTypeHint window_type) {
			switch(window_type) {
				case WindowTypeHint.NORMAL:        return X11Lib.WindowTypeHint.NORMAL;
				case WindowTypeHint.DIALOG:        return X11Lib.WindowTypeHint.DIALOG;
				case WindowTypeHint.MENU:          return X11Lib.WindowTypeHint.MENU;
				case WindowTypeHint.TOOLBAR:       return X11Lib.WindowTypeHint.TOOLBAR;
				case WindowTypeHint.SPLASHSCREEN:  return X11Lib.WindowTypeHint.SPLASHSCREEN;
				case WindowTypeHint.UTILITY:       return X11Lib.WindowTypeHint.UTILITY;
				case WindowTypeHint.DOCK:          return X11Lib.WindowTypeHint.DOCK;
				case WindowTypeHint.DESKTOP:       return X11Lib.WindowTypeHint.DESKTOP;
				case WindowTypeHint.DROPDOWN_MENU: return X11Lib.WindowTypeHint.DROPDOWN_MENU;
				case WindowTypeHint.POPUP_MENU:    return X11Lib.WindowTypeHint.POPUP_MENU;
				case WindowTypeHint.TOOLTIP:       return X11Lib.WindowTypeHint.TOOLTIP;
				case WindowTypeHint.NOTIFICATION:  return X11Lib.WindowTypeHint.NOTIFICATION;
				case WindowTypeHint.COMBO:         return X11Lib.WindowTypeHint.COMBO;
				case WindowTypeHint.DND:           return X11Lib.WindowTypeHint.DND;
				default:
					warning("Not supported window type hint: %d. Falling back to NORMAL.", (int)window_type);
					return X11Lib.WindowTypeHint.NORMAL;
			}
		}
		internal static WindowTypeHint window_type_hint_from_aux(X11Lib.WindowTypeHint window_type) {
			switch(window_type) {
				case X11Lib.WindowTypeHint.NORMAL:        return WindowTypeHint.NORMAL;
				case X11Lib.WindowTypeHint.DIALOG:        return WindowTypeHint.DIALOG;
				case X11Lib.WindowTypeHint.MENU:          return WindowTypeHint.MENU;
				case X11Lib.WindowTypeHint.TOOLBAR:       return WindowTypeHint.TOOLBAR;
				case X11Lib.WindowTypeHint.SPLASHSCREEN:  return WindowTypeHint.SPLASHSCREEN;
				case X11Lib.WindowTypeHint.UTILITY:       return WindowTypeHint.UTILITY;
				case X11Lib.WindowTypeHint.DOCK:          return WindowTypeHint.DOCK;
				case X11Lib.WindowTypeHint.DESKTOP:       return WindowTypeHint.DESKTOP;
				case X11Lib.WindowTypeHint.DROPDOWN_MENU: return WindowTypeHint.DROPDOWN_MENU;
				case X11Lib.WindowTypeHint.POPUP_MENU:    return WindowTypeHint.POPUP_MENU;
				case X11Lib.WindowTypeHint.TOOLTIP:       return WindowTypeHint.TOOLTIP;
				case X11Lib.WindowTypeHint.NOTIFICATION:  return WindowTypeHint.NOTIFICATION;
				case X11Lib.WindowTypeHint.COMBO:         return WindowTypeHint.COMBO;
				case X11Lib.WindowTypeHint.DND:           return WindowTypeHint.DND;
				default:
					warning("Aux window type hint not recognized by Gdk: %d. Falling back to NORMAL.", (int)window_type);
					return WindowTypeHint.NORMAL;
			}
		}
		public string window_type_hint_to_string(WindowTypeHint window_type) {
			return window_type_hint_to_aux(window_type).to_string();
		}
		public WindowTypeHint window_type_hint_parse(string window_type_str) {
			return window_type_hint_from_aux(X11Lib.WindowTypeHint.parse(window_type_str));
		}
	}
}
