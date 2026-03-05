[CCode (cprefix = "gtkaux_", lower_case_cprefix = "gtkaux_")]
namespace GtkAux{
	namespace Internal {
		[CCode (cprefix = "gtkaux_internal_x11_", lower_case_cprefix = "gtkaux_internal_x11_")]
		namespace X11Lib {
			namespace XDisplay {
				internal static X.WindowAttributes get_attrs(X.Display xdisplay, X.Window xid) {
					X.WindowAttributes attrs;
					xdisplay.get_window_attributes(xid, out attrs);
					return attrs;
				}
			}
		}
	}
}
