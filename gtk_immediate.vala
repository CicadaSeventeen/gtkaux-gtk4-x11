namespace GtkAux{
	namespace X11{
		namespace Helper{
			namespace Immediate{
				internal const string window_type_hint_type_str = "_NET_WM_WINDOW_TYPE";
				internal const string window_state_hint_type_str = "_NET_WM_STATE";
				internal static bool is_hint_supported_by_string(Gtk.Window window,string hint_str){
					return GX11LegacyHelper.if_hint_available(window,hint_str);
				}
				internal static bool is_hint_enabled_by_string(Gtk.Window window,string hint_str,string hint_type_str){
					return GX11LegacyHelper.if_hint_enabled(window,hint_str,hint_type_str);
				}
				internal static void set_hint_by_string(Gtk.Window window,string hint_str,string hint_type_str,bool enable){
					GX11LegacyHelper.set_hint(window,hint_str,hint_type_str,enable);
				}

				// window type hint
				internal static bool is_type_hint_supported(Gtk.Window window,GdkAux.X11.WindowTypeHint window_type_hint){
					return is_type_hint_supported_by_string(window,window_type_hint.to_string());
				}
				internal static GdkAux.X11.WindowTypeHint get_type_hint(Gtk.Window window){
					return GdkAux.X11.WindowTypeHint.parse(get_type_hint_by_string(window));
				}
				internal static void set_type_hint(Gtk.Window window,GdkAux.X11.WindowTypeHint window_type_hint){
					set_type_hint_by_string(window,window_type_hint.to_string());
				}

				internal static bool is_type_hint_supported_by_string(Gtk.Window window,string window_type_hint_str){
					return (is_hint_supported_by_string(window,window_type_hint_str) && is_hint_supported_by_string(window,window_type_hint_type_str));
				}
				internal static string get_type_hint_by_string(Gtk.Window window){
					if(!is_hint_supported_by_string(window,window_type_hint_type_str)){critical("Window type %s not supported.",window_type_hint_type_str);return "";}
					return GX11LegacyHelper.get_window_type(window);
				}
				internal static void set_type_hint_by_string(Gtk.Window window,string window_type_hint_str){
					if (!is_type_hint_supported_by_string(window,window_type_hint_str)){critical("Window type %s not supported.",window_type_hint_str);return;}
					GX11LegacyHelper.set_window_type(window,window_type_hint_str);
				}

				// window state hint
				internal static bool is_state_hint_supported(Gtk.Window window,GdkAux.X11.WindowStateHint window_state_hint){
					return is_state_hint_supported_by_string(window,window_state_hint.to_string());
				}
				internal static bool get_state_hint(Gtk.Window window,GdkAux.X11.WindowStateHint window_state_hint){
					return get_state_hint_by_string(window,window_state_hint.to_string());
				}
				internal static void set_state_hint(Gtk.Window window,GdkAux.X11.WindowStateHint window_state_hint,bool enable){
					set_state_hint_by_string(window,window_state_hint.to_string(),enable);
				}

				internal static bool is_state_hint_supported_by_string(Gtk.Window window,string window_state_hint_str){
					return (is_hint_supported_by_string(window,window_state_hint_str) && is_hint_supported_by_string(window,window_state_hint_type_str));
				}
				internal static bool get_state_hint_by_string(Gtk.Window window,string window_state_hint_str){
					if(!is_hint_supported_by_string(window,window_state_hint_type_str)){critical("Window state %s not supported.",window_state_hint_type_str);return false;}
					return is_hint_enabled_by_string(window,window_state_hint_str,window_state_hint_type_str);
				}
				internal static void set_state_hint_by_string(Gtk.Window window,string window_state_hint_str,bool enable){
					if(!is_state_hint_supported_by_string(window,window_state_hint_str)){critical("Window state %s not supported.",window_state_hint_str);return;}
					GX11LegacyHelper.set_hint(window,window_state_hint_str,window_state_hint_type_str,enable);
				}
				internal static bool get_override_redirect(Gtk.Window window){
					return GX11LegacyHelper.get_override_redirect(window);
				}
				internal static void set_override_redirect(Gtk.Window window,bool enable){
					GX11LegacyHelper.set_override_redirect(window,enable);
				}

				internal static Gtk.Border get_screen_margin(Gtk.Window window){
					return GX11LegacyHelper.get_margin(window);
				}
				internal static void set_screen_margin(Gtk.Window window,Gtk.Border margin){
					GX11LegacyHelper.set_margin(window,margin);
				}

				internal static int? get_desktop_number(Gtk.Window window){
					return GX11LegacyHelper.get_desktop_number(window);

				}
				internal static void set_desktop_number(Gtk.Window window,int desktop_number){
					GX11LegacyHelper.set_desktop_number(window,desktop_number);
				}

				internal static X.WindowAttributes get_attrs(Gtk.Window window){
					return GX11LegacyHelper.get_attrs(window);
				}

				internal static GdkAux.Pair get_position(Gtk.Window window){
					GdkAux.Pair ret = {0};
					GX11LegacyHelper.get_position(window,out ret.x,out ret.y);
					return ret;
				}
				internal static void move(Gtk.Window window,GdkAux.Pair target){
					GX11LegacyHelper.move(window,target.x,target.y);
				}

				internal static GdkAux.Pair get_size(Gtk.Window window){
					GdkAux.Pair ret = {0};
					GX11LegacyHelper.get_size(window,out ret.x,out ret.y);
					return ret;
				}
				internal static void resize(Gtk.Window window,GdkAux.Pair target){
					GX11LegacyHelper.resize(window,target.x,target.y);
				}

				internal static Gdk.Rectangle get_geometry(Gtk.Window window){
					return GX11LegacyHelper.get_geometry(window);
				}
				internal static void move_resize(Gtk.Window window,Gdk.Rectangle target){
					GX11LegacyHelper.move_resize(window,target);
				}
			}
		}
	}
}
