[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
	namespace Internal {
[CCode (cprefix = "GtkAuxInternalX11", lower_case_cprefix = "gtkaux_internal_x11_")]
		namespace X11Lib {
			namespace XDisplay {
				namespace OverrideRedirect {
					internal static void set_override_redirect(X.Display xdisplay, X.Window xid, bool enable) {
						X.SetWindowAttributes attrs = {};
						attrs.override_redirect = enable;
						xdisplay.change_window_attributes(xid, X.CW.OverrideRedirect, attrs);
					}
					internal static bool get_override_redirect(X.Display xdisplay, X.Window xid) {
						X.WindowAttributes attrs;
						xdisplay.get_window_attributes(xid, out attrs);
						return attrs.override_redirect;
					}
				}
			}
		}
	}
}
