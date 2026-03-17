[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux{
	namespace Internal {
[CCode (cprefix = "GtkAuxInternalX11", lower_case_cprefix = "gtkaux_internal_x11_")]
		namespace X11Lib {
			namespace XDisplay {
			namespace Ewmh {
					private static int[] get_cardinal_array_4(int left, int right, int top, int bottom) {
						int ret[4] = {left,right,top,bottom};
						return ret;
					}

					private static int[] get_cardinal_array_12(X.Display xdisplay, X.Window xid, int left, int right, int top, int bottom) {
						int ret[12] = {0};
						ret[0] = left;
						ret[1] = right;
						ret[2] = top;
						ret[3] = bottom;
						int x;
						int y;
						int width;
						int height;
						C.Xrandr.get_monitor_geometry(xdisplay,xid,out x,out y,out width,out height);
						if (left != 0) {
							ret[4] = y;
							ret[5] = height - 1;
						}
						if (right != 0) {
							ret[6] = y;
							ret[7] = height - 1;
						}
						if (top != 0) {
							ret[8] = x;
							ret[9] = width - 1;
						}
						if (bottom != 0) {
							ret[10] = x;
							ret[11] = width - 1;
						}
						return ret;
					}

					internal static void set_strut(X.Display xdisplay, X.Window xid, int left, int right, int top, int bottom) {
						X.Atom atom_strut_12 = Atom.get_atom_from_str(xdisplay,xid,"_NET_WM_STRUT_PARTIAL");
						X.Atom atom_strut_4 = Atom.get_atom_from_str(xdisplay,xid,"_NET_WM_STRUT");
						if (atom_strut_12 != X.None){
							set_strut_array(xdisplay,xid,"_NET_WM_STRUT_PARTIAL",get_cardinal_array_12(xdisplay,xid,left,right,top,bottom));
						}
						if (atom_strut_4 != X.None) {
							set_strut_array(xdisplay,xid,"_NET_WM_STRUT",get_cardinal_array_4(left,right,top,bottom));
						}
					}

					internal static int[]? get_strut(X.Display xdisplay, X.Window xid) {
						int[]? ret1 = get_strut_12(xdisplay,xid);
						if (ret1 != null) {return ret1;}
						int[]? ret2 = get_strut_4(xdisplay,xid);
						if (ret2 != null) {return ret2;}
						return null;
					}

					private static int[]? get_strut_12(X.Display xdisplay, X.Window xid) {
						X.Atom atom_strut_12 = Atom.get_atom_from_str(xdisplay,xid,"_NET_WM_STRUT_PARTIAL");
						return (atom_strut_12 != X.None)?
						get_strut_array(xdisplay,xid,"_NET_WM_STRUT_PARTIAL")
						:
						null;
					}

					private static int[]? get_strut_4(X.Display xdisplay, X.Window xid) {
						X.Atom atom_strut_4 = Atom.get_atom_from_str(xdisplay,xid,"_NET_WM_STRUT");
						return (atom_strut_4 != X.None)?
						get_strut_array(xdisplay,xid,"_NET_WM_STRUT")
						:
						null;
					}

					internal static int[]? get_strut_array(X.Display xdisplay, X.Window xid, string strut_type) {
						X.Atom atom_prop = Atom.get_atom_from_str(xdisplay,xid,strut_type);
						if (atom_prop == X.None){return null;}
						else {
							return Atom.get_cardinal_array(xdisplay,xid,atom_prop);
						}
					}
					internal static void set_strut_array(X.Display xdisplay, X.Window xid, string strut_type, int[] cardinal_array) {
						X.Atom atom_prop = Atom.get_atom_from_str(xdisplay,xid,strut_type);
						if (atom_prop == X.None) {warning("Strut type not available.");return;}
						else {
							long[] new_array = new long[cardinal_array.length];
							for(int i=0;i<cardinal_array.length;i++) {
								new_array[i] = (long) cardinal_array[i];
							}
							Atom.set_cardinal(xdisplay,xid,new_array,atom_prop);
						}
					}
				}
			}
		}
	}
}
