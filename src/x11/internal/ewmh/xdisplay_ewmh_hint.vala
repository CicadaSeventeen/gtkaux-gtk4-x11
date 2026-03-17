[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux{
	namespace Internal {
[CCode (cprefix = "GtkAuxInternalX11", lower_case_cprefix = "gtkaux_internal_x11_")]
		namespace X11Lib {
			namespace XDisplay {
				namespace Ewmh {
					internal static bool if_hint_supported(X.Display xdisplay, X.Window xid, string hint_str) {
						var atom = Atom.get_atom_from_str(xdisplay,xid,hint_str);
						//stdout.printf(" %d ",(int)atom);
						if (atom == X.None) {return false;}
						else {return true;}
					}
					internal static bool if_hint_enabled(X.Display xdisplay, X.Window xid, string hint_str, string hint_type_str) {
						var atom_prop = Atom.get_atom_from_str(xdisplay,xid,hint_type_str);
						var atom_target = Atom.get_atom_from_str(xdisplay,xid,hint_str);
						if (atom_prop != X.None && atom_target != X.None) {
							return Atom.if_atom_enabled(xdisplay,xid,atom_target,atom_prop);
						}
						else {return false;}
					}
					internal static void set_hint(X.Display xdisplay, X.Window xid, string hint_str, string hint_type_str, bool enable, bool privilege, bool replace) {
						var atom_prop = Atom.get_atom_from_str(xdisplay,xid,hint_type_str);
						var atom_target = Atom.get_atom_from_str(xdisplay,xid,hint_str);
						if (atom_prop == X.None || atom_target == X.None) {
							warning("Hint %s of %s not supported.",hint_str,hint_type_str);
							return;
						}
						if (replace == false) {
							switch(hint_type_str) {
								case "_NET_WM_STATE":
									Atom.set_atom_client_message_wm_state(xdisplay,xid,atom_target,enable,privilege);
									break;
								case "_NET_WM_WINDOW_TYPE":
									Atom.set_atom_replace(xdisplay,xid,atom_target,atom_prop);
									break;
								default:
									Atom.set_atom_manual(xdisplay,xid,atom_target,atom_prop,enable);
									break;
							}
						}
						else {
							Atom.set_atom_replace(xdisplay,xid,atom_target,atom_prop);
						}
					}
					internal static string[]? get_hint_name_list(X.Display xdisplay, X.Window xid, string hint_type_str) {
						var atom_prop = Atom.get_atom_from_str(xdisplay,xid,hint_type_str);
						return (atom_prop == X.None)? null : Atom.get_atom_name_list(xdisplay,xid,atom_prop);
					}
					internal static string? get_window_type(X.Display xdisplay, X.Window xid) {
						string[]? type = get_hint_name_list(xdisplay,xid,"_NET_WM_WINDOW_TYPE");
						if (type == null || type.length == 0) {
							return null;
						}
						else if (type.length > 1){
							warning("Unexepected length > 1.");
						}
						return type[0];
					}
				}
			}
		}
	}
}
