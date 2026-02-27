namespace GX11LegacyHelper {
	namespace DesktopNumber{
		internal void set_desktop_number(X.Display xdisplay, X.Window xid, int desktop, bool privilege) {
			if (desktop == -1) {
				Atom.set_atom_client_message_wm_desktop(xdisplay,xid,null,privilege);
			}
			else {
				Atom.set_atom_client_message_wm_desktop(xdisplay,xid,desktop,privilege);
			}
		}
		internal int? get_desktop_number(X.Display xdisplay, X.Window xid) {
			var atom_prop = Atom.get_atom_from_str(xdisplay,xid,"_NET_WM_DESKTOP");
			if (atom_prop == X.None) {return null;}
			else {
				int[]? array = Atom.get_cardinal_array(xdisplay,xid,atom_prop);
				if (array == null || array.length == 0) {return null;}
				else if (array.length > 1) {warning("Unexpected length > 1.");}
				int ret = array[0];
				if (ret == 0xFFFFFFFF) {return -1;}
				else {return ret;}
			}
		}
	}
	// 在realize使用
	internal int? get_desktop_number(GLib.Object win_item) {
		return Delegate.get_func<int?>(win_item,(a,b) => {return DesktopNumber.get_desktop_number(a,b);});
	}

	internal void set_desktop_number(GLib.Object win_item, int desktop) {
		Delegate.set_func(win_item,(a,b) => {DesktopNumber.set_desktop_number(a,b,desktop,true);});
	}
}
