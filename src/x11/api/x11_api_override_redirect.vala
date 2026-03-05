[CCode (cprefix = "gtkaux_", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
	[CCode (cprefix = "gtkaux_x11_", lower_case_cprefix = "gtkaux_x11_")]
	namespace X11Lib {
		// override
		// 需要在realize的地方设置
		public bool get_override_redirect(GLib.Object window) {
			return Internal.X11Lib.XDisplay.OverrideRedirect.get_override_redirect(get_xdisplay(window),get_xid(window));
		}
		public void set_override_redirect(GLib.Object window, bool enable) {
			Internal.X11Lib.XDisplay.OverrideRedirect.set_override_redirect(get_xdisplay(window),get_xid(window),enable);
		}
	}
}
