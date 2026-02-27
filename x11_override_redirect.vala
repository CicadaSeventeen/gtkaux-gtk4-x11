namespace GX11LegacyHelper {
	// override
	// 需要在realize的地方设置
	internal bool get_override_redirect(GLib.Object win_item) {
		return Delegate.get_func<bool?>(win_item,(a,b) => {return OverrideRedirect.get_override_redirect(a,b);})
		?? false;
	}
	internal void set_override_redirect(GLib.Object win_item, bool enable) {
		Delegate.set_func(win_item,(a,b) => {OverrideRedirect.set_override_redirect(a,b,enable);});
	}
	namespace OverrideRedirect {
		internal void set_override_redirect(X.Display xdisplay, X.Window xid, bool enable) {
			X.SetWindowAttributes attrs = {};
			attrs.override_redirect = enable;
			xdisplay.change_window_attributes(xid, X.CW.OverrideRedirect, attrs);
		}
		internal bool get_override_redirect(X.Display xdisplay, X.Window xid) {
			X.WindowAttributes attrs;
			xdisplay.get_window_attributes(xid, out attrs);
			return attrs.override_redirect;
		}
	}
}
