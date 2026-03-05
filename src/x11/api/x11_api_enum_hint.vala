[CCode (cprefix = "gtkaux_", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
	[CCode (cprefix = "gtkaux_x11_", lower_case_cprefix = "gtkaux_x11_")]
	namespace X11Lib {
		public enum WindowTypeHint {
			NONE,

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
			DND;

			public string to_string(){
				switch(this){
					case WindowTypeHint.NORMAL:
						return "_NET_WM_WINDOW_TYPE_NORMAL";
					case WindowTypeHint.DIALOG:
						return "_NET_WM_WINDOW_TYPE_DIALOG";
					case WindowTypeHint.MENU:
						return "_NET_WM_WINDOW_TYPE_MENU";
					case WindowTypeHint.TOOLBAR:
						return "_NET_WM_WINDOW_TYPE_TOOLBAR";
					case WindowTypeHint.SPLASHSCREEN:
						return "_NET_WM_WINDOW_TYPE_SPLASHSCREEN";
					case WindowTypeHint.UTILITY:
						return "_NET_WM_WINDOW_TYPE_UTILITY";
					case WindowTypeHint.DOCK:
						return "_NET_WM_WINDOW_TYPE_DOCK";
					case WindowTypeHint.DESKTOP:
						return "_NET_WM_WINDOW_TYPE_DESKTOP";
					case WindowTypeHint.DROPDOWN_MENU:
						return "_NET_WM_WINDOW_TYPE_DROPDOWN_MENU";
					case WindowTypeHint.POPUP_MENU:
						return "_NET_WM_WINDOW_TYPE_POPUP_MENU";
					case WindowTypeHint.TOOLTIP:
						return "_NET_WM_WINDOW_TYPE_TOOLTIP";
					case WindowTypeHint.NOTIFICATION:
						return "_NET_WM_WINDOW_TYPE_NOTIFICATION";
					case WindowTypeHint.COMBO:
						return "_NET_WM_WINDOW_TYPE_COMBO";
					case WindowTypeHint.DND:
						return "_NET_WM_WINDOW_TYPE_DND";
					default:
						warning("Unknown enum value %d",(int)this);
						return "";

				}
			}

			public static WindowTypeHint parse(string window_type_str){
				switch(window_type_str){
					case "_NET_WM_WINDOW_TYPE_NORMAL":
						return WindowTypeHint.NORMAL;
					case "_NET_WM_WINDOW_TYPE_DIALOG":
						return WindowTypeHint.DIALOG;
					case "_NET_WM_WINDOW_TYPE_MENU":
						return WindowTypeHint.MENU;
					case "_NET_WM_WINDOW_TYPE_TOOLBAR":
						return WindowTypeHint.TOOLBAR;
					case "_NET_WM_WINDOW_TYPE_SPLASHSCREEN":
						return WindowTypeHint.SPLASHSCREEN;
					case "_NET_WM_WINDOW_TYPE_UTILITY":
						return WindowTypeHint.UTILITY;
					case "_NET_WM_WINDOW_TYPE_DOCK":
						return WindowTypeHint.DOCK;
					case "_NET_WM_WINDOW_TYPE_DESKTOP":
						return WindowTypeHint.DESKTOP;
					case "_NET_WM_WINDOW_TYPE_DROPDOWN_MENU":
						return WindowTypeHint.DROPDOWN_MENU;
					case "_NET_WM_WINDOW_TYPE_POPUP_MENU":
						return WindowTypeHint.POPUP_MENU;
					case "_NET_WM_WINDOW_TYPE_TOOLTIP":
						return WindowTypeHint.TOOLTIP;
					case "_NET_WM_WINDOW_TYPE_NOTIFICATION":
						return WindowTypeHint.NOTIFICATION;
					case "_NET_WM_WINDOW_TYPE_COMBO":
						return WindowTypeHint.COMBO;
					case "_NET_WM_WINDOW_TYPE_DND":
						return WindowTypeHint.DND;
					default:
						warning("Unknown or unsupported window type string: %s", window_type_str);
						return WindowTypeHint.NONE;
				}
			}
			public static string int_to_string(int window_type_hint){
				return ((WindowTypeHint)window_type_hint).to_string();
			}
			public static int parse_to_int(string window_type_str){
				return (int)parse(window_type_str);
			}
		}
		public const int EWMH_TYPE_HINT_NORMAL = WindowTypeHint.NORMAL;
		public const int EWMH_TYPE_HINT_DIALOG = WindowTypeHint.DIALOG;
		public const int EWMH_TYPE_HINT_MENU = WindowTypeHint.MENU;
		public const int EWMH_TYPE_HINT_TOOLBAR = WindowTypeHint.TOOLBAR;
		public const int EWMH_TYPE_HINT_SPLASHSCREEN = WindowTypeHint.SPLASHSCREEN;
		public const int EWMH_TYPE_HINT_UTILITY = WindowTypeHint.UTILITY;
		public const int EWMH_TYPE_HINT_DOCK = WindowTypeHint.DOCK;
		public const int EWMH_TYPE_HINT_DESKTOP = WindowTypeHint.DESKTOP;
		public const int EWMH_TYPE_HINT_DROPDOWN_MENU = WindowTypeHint.DROPDOWN_MENU;
		public const int EWMH_TYPE_HINT_POPUP_MENU = WindowTypeHint.POPUP_MENU;
		public const int EWMH_TYPE_HINT_TOOLTIP = WindowTypeHint.TOOLTIP;
		public const int EWMH_TYPE_HINT_NOTIFICATION = WindowTypeHint.NOTIFICATION;
		public const int EWMH_TYPE_HINT_COMBO = WindowTypeHint.COMBO;
		public const int EWMH_TYPE_HINT_DND = WindowTypeHint.DND;
		public const int EWMH_TYPE_HINT_NONE = WindowTypeHint.NONE;

		public enum WindowStateHint {
			NONE,

			ABOVE,
			BELOW,

			MODAL,
			STICKY,
			SHADED,

			SKIP_TASKBAR,
			SKIP_PAGER,

			MAXIMIZED_VERT,
			MAXIMIZED_HORZ,
			HIDDEN,
			FULLSCREEN,

			FOCUSED,
			DEMANDS_ATTENTION;

			public string to_string(){
				switch(this){
					case WindowStateHint.ABOVE:
						return "_NET_WM_STATE_ABOVE";
					case WindowStateHint.BELOW:
						return "_NET_WM_STATE_BELOW";

					case WindowStateHint.MODAL:
						return "_NET_WM_STATE_MODAL";
					case WindowStateHint.STICKY:
						return "_NET_WM_STATE_STICKY";
					case WindowStateHint.SHADED:
						return "_NET_WM_STATE_SHADED";

					case WindowStateHint.SKIP_TASKBAR:
						return "_NET_WM_STATE_SKIP_TASKBAR";
					case WindowStateHint.SKIP_PAGER:
						return "_NET_WM_STATE_SKIP_PAGER";

					case WindowStateHint.MAXIMIZED_VERT:
						return "_NET_WM_STATE_MAXIMIZED_VERT";
					case WindowStateHint.MAXIMIZED_HORZ:
						return "_NET_WM_STATE_MAXIMIZED_HORZ";
					case WindowStateHint.HIDDEN:
						return "_NET_WM_STATE_HIDDEN";
					case WindowStateHint.FULLSCREEN:
						return "_NET_WM_STATE_FULLSCREEN";

					case WindowStateHint.FOCUSED:
						return "_NET_WM_STATE_FOCUSED";
					case WindowStateHint.DEMANDS_ATTENTION:
						return "_NET_WM_STATE_DEMANDS_ATTENTION";
					default:
						warning("Unknown enum value %d",(int)this);
						return "";
				}
			}
			public static WindowStateHint parse(string window_state_str) {
				switch (window_state_str) {
					case "_NET_WM_STATE_ABOVE":
						return WindowStateHint.ABOVE;
					case "_NET_WM_STATE_BELOW":
						return WindowStateHint.BELOW;

					case "_NET_WM_STATE_MODAL":
						return WindowStateHint.MODAL;
					case "_NET_WM_STATE_STICKY":
						return WindowStateHint.STICKY;
					case "_NET_WM_STATE_SHADED":
						return WindowStateHint.SHADED;

					case "_NET_WM_STATE_SKIP_TASKBAR":
						return WindowStateHint.SKIP_TASKBAR;
					case "_NET_WM_STATE_SKIP_PAGER":
						return WindowStateHint.SKIP_PAGER;

					case "_NET_WM_STATE_MAXIMIZED_VERT":
						return WindowStateHint.MAXIMIZED_VERT;
					case "_NET_WM_STATE_MAXIMIZED_HORZ":
						return WindowStateHint.MAXIMIZED_HORZ;
					case "_NET_WM_STATE_HIDDEN":
						return WindowStateHint.HIDDEN;
					case "_NET_WM_STATE_FULLSCREEN":
						return WindowStateHint.FULLSCREEN;

					case "_NET_WM_STATE_FOCUSED":
						return WindowStateHint.FOCUSED;
					case "_NET_WM_STATE_DEMANDS_ATTENTION":
						return WindowStateHint.DEMANDS_ATTENTION;

					default:
						warning("Unknown window state string: %s", window_state_str);
						return WindowStateHint.NONE;
				}
			}
			public static string int_to_string(int window_state_hint){
				return ((WindowStateHint)window_state_hint).to_string();
			}
			public static int parse_to_int(string window_state_str){
				return (int)parse(window_state_str);
			}

			public static int length(){
				return (int)((EnumClass)typeof(WindowStateHint).class_ref()).n_values;
			}

			public static WindowStateHint[] array() {
				var tmp = (EnumClass)typeof(WindowStateHint).class_ref();
				WindowStateHint[] result = new WindowStateHint[tmp.n_values];
				for (int i = 0; i < tmp.n_values; i++) {
					result[i] = (WindowStateHint) tmp.values[i].value;
				}
				return result;
			}
		}
		public const int EWMH_STATE_HINT_NONE = WindowStateHint.NONE;

		public const int EWMH_STATE_HINT_ABOVE = WindowStateHint.ABOVE;
		public const int EWMH_STATE_HINT_BELOW = WindowStateHint.BELOW;

		public const int EWMH_STATE_HINT_MODAL = WindowStateHint.MODAL;
		public const int EWMH_STATE_HINT_STICKY = WindowStateHint.STICKY;
		public const int EWMH_STATE_HINT_SHADED = WindowStateHint.SHADED;

		public const int EWMH_STATE_HINT_SKIP_TASKBAR = WindowStateHint.SKIP_TASKBAR;
		public const int EWMH_STATE_HINT_SKIP_PAGER = WindowStateHint.SKIP_PAGER;

		public const int EWMH_STATE_HINT_MAXIMIZED_VERT = WindowStateHint.MAXIMIZED_VERT;
		public const int EWMH_STATE_HINT_MAXIMIZED_HORZ = WindowStateHint.MAXIMIZED_HORZ;
		public const int EWMH_STATE_HINT_HIDDEN = WindowStateHint.HIDDEN;
		public const int EWMH_STATE_HINT_FULLSCREEN = WindowStateHint.FULLSCREEN;

		public const int EWMH_STATE_HINT_FOCUSED = WindowStateHint.FOCUSED;
		public const int EWMH_STATE_HINT_DEMANDS_ATTENTION = WindowStateHint.DEMANDS_ATTENTION;

		// window type hint
		public bool is_window_type_hint_supported(GLib.Object? window,int window_type_hint){
			if(window_type_hint == EWMH_TYPE_HINT_NONE){return false;}
			return is_window_type_hint_supported_by_string(window,((WindowTypeHint)window_type_hint).to_string());
		}
		public int get_window_type_hint(GLib.Object? window){
			return WindowTypeHint.parse_to_int(get_window_type_hint_by_string(window));
		}
		public void set_window_type_hint(GLib.Object? window,int window_type_hint){
			if(window_type_hint == EWMH_TYPE_HINT_NONE){return;}
			set_window_type_hint_by_string(window,((WindowTypeHint)window_type_hint).to_string());
		}
		// window state hint
		public bool is_window_state_hint_supported(GLib.Object? window,int window_state_hint){
			if(window_state_hint == EWMH_STATE_HINT_NONE){return false;}
			return is_window_state_hint_supported_by_string(window,((WindowStateHint)window_state_hint).to_string());
		}
		public bool get_window_state_hint(GLib.Object? window,int window_state_hint){
			if(window_state_hint == EWMH_STATE_HINT_NONE){return false;}
			return get_window_state_hint_by_string(window,((WindowStateHint)window_state_hint).to_string());
		}
		public void set_window_state_hint(GLib.Object? window,int window_state_hint,bool enable){
			if(window_state_hint == EWMH_STATE_HINT_NONE){return;}
			set_window_state_hint_by_string(window,((WindowStateHint)window_state_hint).to_string(),enable);
		}
	}
}
