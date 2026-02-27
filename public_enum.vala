#if API_COMPATIBLE
namespace Gdk{
#else
namespace GdkX11Legacy{
#endif
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
	internal static GdkAux.X11.WindowTypeHint window_type_hint_to_aux(WindowTypeHint window_type) {
		switch(window_type) {
			case WindowTypeHint.NORMAL:        return GdkAux.X11.WindowTypeHint.NORMAL;
			case WindowTypeHint.DIALOG:        return GdkAux.X11.WindowTypeHint.DIALOG;
			case WindowTypeHint.MENU:          return GdkAux.X11.WindowTypeHint.MENU;
			case WindowTypeHint.TOOLBAR:       return GdkAux.X11.WindowTypeHint.TOOLBAR;
			case WindowTypeHint.SPLASHSCREEN:  return GdkAux.X11.WindowTypeHint.SPLASHSCREEN;
			case WindowTypeHint.UTILITY:       return GdkAux.X11.WindowTypeHint.UTILITY;
			case WindowTypeHint.DOCK:          return GdkAux.X11.WindowTypeHint.DOCK;
			case WindowTypeHint.DESKTOP:       return GdkAux.X11.WindowTypeHint.DESKTOP;
			case WindowTypeHint.DROPDOWN_MENU: return GdkAux.X11.WindowTypeHint.DROPDOWN_MENU;
			case WindowTypeHint.POPUP_MENU:    return GdkAux.X11.WindowTypeHint.POPUP_MENU;
			case WindowTypeHint.TOOLTIP:       return GdkAux.X11.WindowTypeHint.TOOLTIP;
			case WindowTypeHint.NOTIFICATION:  return GdkAux.X11.WindowTypeHint.NOTIFICATION;
			case WindowTypeHint.COMBO:         return GdkAux.X11.WindowTypeHint.COMBO;
			case WindowTypeHint.DND:           return GdkAux.X11.WindowTypeHint.DND;
			default:
				warning("Not supported window type hint: %d. Falling back to NORMAL.", (int)window_type);
				return GdkAux.X11.WindowTypeHint.NORMAL;
		}
	}
	internal static WindowTypeHint window_type_hint_from_aux(GdkAux.X11.WindowTypeHint window_type) {
		switch(window_type) {
			case GdkAux.X11.WindowTypeHint.NORMAL:        return WindowTypeHint.NORMAL;
			case GdkAux.X11.WindowTypeHint.DIALOG:        return WindowTypeHint.DIALOG;
			case GdkAux.X11.WindowTypeHint.MENU:          return WindowTypeHint.MENU;
			case GdkAux.X11.WindowTypeHint.TOOLBAR:       return WindowTypeHint.TOOLBAR;
			case GdkAux.X11.WindowTypeHint.SPLASHSCREEN:  return WindowTypeHint.SPLASHSCREEN;
			case GdkAux.X11.WindowTypeHint.UTILITY:       return WindowTypeHint.UTILITY;
			case GdkAux.X11.WindowTypeHint.DOCK:          return WindowTypeHint.DOCK;
			case GdkAux.X11.WindowTypeHint.DESKTOP:       return WindowTypeHint.DESKTOP;
			case GdkAux.X11.WindowTypeHint.DROPDOWN_MENU: return WindowTypeHint.DROPDOWN_MENU;
			case GdkAux.X11.WindowTypeHint.POPUP_MENU:    return WindowTypeHint.POPUP_MENU;
			case GdkAux.X11.WindowTypeHint.TOOLTIP:       return WindowTypeHint.TOOLTIP;
			case GdkAux.X11.WindowTypeHint.NOTIFICATION:  return WindowTypeHint.NOTIFICATION;
			case GdkAux.X11.WindowTypeHint.COMBO:         return WindowTypeHint.COMBO;
			case GdkAux.X11.WindowTypeHint.DND:           return WindowTypeHint.DND;
			default:
				warning("Aux window type hint not recognized by Gdk: %d. Falling back to NORMAL.", (int)window_type);
				return WindowTypeHint.NORMAL;
		}
	}
	public string window_type_hint_to_string(WindowTypeHint window_type) {
		return window_type_hint_to_aux(window_type).to_string();
	}
	public WindowTypeHint window_type_hint_parse(string window_type_str) {
		return window_type_hint_from_aux(GdkAux.X11.WindowTypeHint.parse(window_type_str));
	}
}

namespace GdkAux {
	namespace X11 {
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
			DND,

			NONE;

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
		}
		[Flags]
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

			public static WindowStateHint[] array() {
				var tmp = (FlagsClass) typeof(WindowStateHint).class_ref();
				WindowStateHint[] result = new WindowStateHint[tmp.n_values];
				for (int i = 0; i < tmp.n_values; i++) {
					result[i] = (WindowStateHint) tmp.values[i].value;
				}
				return result;
			}
		}
	}
}
