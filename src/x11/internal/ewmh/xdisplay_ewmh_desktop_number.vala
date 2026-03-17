[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
	namespace Internal {
[CCode (cprefix = "GtkAuxInternalX11", lower_case_cprefix = "gtkaux_internal_x11_")]
		namespace X11Lib {
			// 在realize使用
			namespace XDisplay{
				namespace Ewmh {
					internal static void set_desktop_number(X.Display xdisplay, X.Window xid, int desktop, bool privilege) {
						if (desktop == -1) {
							Atom.set_atom_client_message_wm_desktop(xdisplay,xid,null,privilege);
						}
						else {
							Atom.set_atom_client_message_wm_desktop(xdisplay,xid,desktop,privilege);
						}
					}
					internal static int? get_desktop_number(X.Display xdisplay, X.Window xid) {
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
			}
		}
	}
}
