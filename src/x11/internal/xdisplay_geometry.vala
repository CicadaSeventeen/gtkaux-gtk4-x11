[CCode (cprefix = "gtkaux_", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
	namespace Internal {
		[CCode (cprefix = "gtkaux_internal_x11_", lower_case_cprefix = "gtkaux_internal_x11_")]
		namespace X11Lib {
			namespace XDisplay {
				namespace Geometry {
					internal static void move(X.Display xdisplay, X.Window xid, int x, int y) {
						xdisplay.move_window(xid,x,y);
						xdisplay.flush();
					}
					internal static void resize(X.Display xdisplay, X.Window xid, int width, int height) {
						xdisplay.resize_window(xid,width,height);
						xdisplay.flush();
					}
					internal static void move_resize(X.Display xdisplay, X.Window xid, int x, int y, int width, int height) {
						xdisplay.move_resize_window(xid,x,y,width,height);
						xdisplay.flush();
					}
				}
			}
		}
	}
}
