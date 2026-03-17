[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
[CCode (cprefix = "GtkAuxX11", lower_case_cprefix = "gtkaux_x11_")]
	namespace X11Lib {
		public int? get_desktop_number(GLib.Object window) {
			if (is_hint_supported_by_string(window,"_NET_WM_DESKTOP")){
				return Internal.X11Lib.XDisplay.Ewmh.get_desktop_number(get_xdisplay(window),get_xid(window));
			}else{
				warning("EWMH desktop number not supported.");
				return null;
			}
		}

		public void set_desktop_number(GLib.Object window, int desktop_number) {
			if (is_hint_supported_by_string(window,"_NET_WM_DESKTOP")){
				Internal.X11Lib.XDisplay.Ewmh.set_desktop_number(get_xdisplay(window),get_xid(window),desktop_number,true);
			}else{
				warning("EWMH desktop number not supported.");
			}
		// 在realize使用
		}
	}
}
