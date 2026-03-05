[CCode (cprefix = "gtkaux_", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
	namespace Internal {
		[CCode (cprefix = "gtkaux_internal_x11_", lower_case_cprefix = "gtkaux_internal_x11_")]
		namespace X11Lib {
			namespace XDisplay {
				namespace Ewmh {
					namespace Atom {
						internal enum PropMode {
							Append,
							Prepend,
							Replace;

							internal int to_XPropMode() {
								int ret;
								switch(this){
									case(PropMode.Append):
										ret = (int)X.PropMode.Append;break;
									case(PropMode.Prepend):
										ret = (int)X.PropMode.Prepend;break;
									case(PropMode.Replace):
										ret = (int)X.PropMode.Replace;break;
									default:
										ret = (int)X.PropMode.Append;break;
								}
								return ret;
							}
						}

						internal static X.Atom[]? get_atom_array(X.Display xdisplay, X.Window xid, X.Atom atom_prop) {
							if (atom_prop == X.None) {return null;}
							X.Atom actual_type;
							int actual_format;
							ulong nitems;
							ulong bytes_after;
							uchar* data;

							// 读取属性
							int ret_flag = xdisplay.get_window_property(
								xid,
								atom_prop,
								0,
								long.MAX, // 读取所有数据
								false,  // 不删除
								X.XA_ATOM,
								out actual_type,
								out actual_format,
								out nitems,
								out bytes_after,
								out data
							);
							Debug.bug_0();
							if (ret_flag == 0 && actual_type == X.XA_ATOM && actual_format == 32 && data != null) {
								X.Atom* atom_ptr = (X.Atom*) data;
								// 将 uchar[] 转换为 Atom[]
								X.Atom[] atom_array = new X.Atom[nitems];
								for (int i = 0; i < (int) nitems; i++) {
									atom_array[i] = (X.Atom) atom_ptr[i];
									//stdout.printf(" %d ",(int)atom_ptr[i]);
								}
								X.free(data);
								return atom_array;
							}
							if (data != null) X.free(data);
							return null;
						}

						internal static int[]? get_cardinal_array(X.Display xdisplay, X.Window xid, X.Atom atom_prop) {
							if (atom_prop == X.None) { return null; }
							X.Atom actual_type;
							int actual_format;
							ulong nitems;
							ulong bytes_after;
							uchar* data;

							int ret_flag = xdisplay.get_window_property(
								xid,
								atom_prop,
								0,
								long.MAX,
								false,
								X.XA_CARDINAL, // 期望获取的是 CARDINAL
								out actual_type,
								out actual_format,
								out nitems,
								out bytes_after,
								out data
							);
							Debug.bug_0();
							// 关键点：检查数据是否存在且格式正确
							if (ret_flag == 0 && data != null && nitems > 0) {
								int[] array = new int[nitems];
								if (actual_format == 32) {
									// 在 X11 中，format 32 对应的是 long* 指针
									// 无论是在 32 位还是 64 位系统上，这是 Xlib 的标准行为
									long* l_data = (long*) data;
									for (int i = 0; i < (int) nitems; i++) {
										array[i] = (int) l_data[i];
									}
								} else if (actual_format == 16) {
									short* s_data = (short*) data;
									for (int i = 0; i < (int) nitems; i++) {
										array[i] = (int) s_data[i];
									}
								} else if (actual_format == 8) {
									for (int i = 0; i < (int) nitems; i++) {
										array[i] = (int) data[i];
									}
								}
								X.free(data);
								return array;
							}
							if (data != null) X.free(data);
							return null;
						}

						internal static void internal_set_core(X.Display xdisplay, X.Window xid, X.Atom atom_prop, uchar[]? data_array, int length, X.Atom type, PropMode propmode) {
							if (data_array != null && data_array.length > 0) {
								xdisplay.change_property(
									xid,
									atom_prop,
									type,
									32,
									propmode.to_XPropMode(),
									data_array, // 将泛型数组强制转换为字节数组
									length
								);
							}
							else {
								xdisplay.change_property(
									xid,
									atom_prop,
									type,
									32,
									propmode.to_XPropMode(),
									new uchar[0],
									0 // 使用实例化一个空数组来规避 null 警告
								);
							}
						}
						internal static X.Atom get_atom_from_str(X.Display xdisplay, X.Window xid, string hint_str) {
							X.Atom atom = xdisplay.intern_atom(hint_str, false);
							if (atom == X.None) {
								warning("atom %s is not available.",hint_str);
								return X.None;
							}
							else {return atom;}
						}


						internal static bool if_atom_in_array(X.Display xdisplay, X.Window xid, X.Atom atom_target, X.Atom[]? atom_array) {
							if (atom_array == null || atom_target == X.None) {return false;}
							else {
								bool ret = false;
								foreach(X.Atom atom in atom_array){
									if (atom == atom_target) {ret = true;}
								}
								return ret;
							}
						}

						internal static bool if_atom_enabled(X.Display xdisplay, X.Window xid, X.Atom atom_target, X.Atom atom_prop) {
							X.Atom[]? atom_array = get_atom_array(xdisplay, xid, atom_prop);
							return if_atom_in_array(xdisplay,xid,atom_target,atom_array);
						}

						private static X.Window get_root_window(X.Display xdisplay, X.Window xid) {
							X.WindowAttributes attrs;
							xdisplay.get_window_attributes(xid, out attrs);
							return attrs.root;
						}

						// Use as fallback, because client message differs from different atom prop
						private static void internal_set_atom_manual(X.Display xdisplay, X.Window xid, X.Atom atom_target, X.Atom atom_prop, X.Atom[] atom_array, bool enable) {
							X.Atom[] new_array = {};
							bool already_exists = false;
							foreach (X.Atom a in atom_array) {
								if (a == atom_target) {
									already_exists = true;
									if (enable) {
										// 如果是要开启，且已经存在，保留它
										new_array += a;
									}
									// 如果是 enable=false，则不把这个 a 加到 new_atoms 里，相当于删除了
								} else {
									new_array += a;
								}
							}
							// 如果是要开启，且之前列表中没有，则追加到末尾
							if (enable && !already_exists) {
								new_array += atom_target;
								internal_set_core(xdisplay,xid,atom_prop,(uchar[])new_array,new_array.length,X.XA_ATOM,PropMode.Replace);
								xdisplay.flush();
							}
							else if (!enable && already_exists) {
								internal_set_core(xdisplay,xid,atom_prop,(uchar[])new_array,new_array.length,X.XA_ATOM,PropMode.Replace);
								xdisplay.flush();
							}
						}

						internal static void set_atom_manual(X.Display xdisplay, X.Window xid, X.Atom atom_target, X.Atom atom_prop, bool enable) {
							X.Atom[]? atom_array = get_atom_array(xdisplay,xid,atom_prop);
							if (atom_array != null) {internal_set_atom_manual(xdisplay,xid,atom_target,atom_prop,atom_array,enable);}
						}

						private static void send_client_message(X.Display xdisplay, X.Window xid, ref X.Event event) {
							X.Window root_window = get_root_window(xdisplay,xid);
							// 发送给 Root Window，让 WM 去处理
							xdisplay.send_event(
								root_window,
								false,
								X.EventMask.SubstructureRedirectMask | X.EventMask.SubstructureNotifyMask,
								ref event
							);
							xdisplay.flush();
						}

						private static X.Event get_event_wm_state(X.Display xdisplay, X.Window xid, X.Atom atom_target, bool enable, bool privilege) {
							/*const long _NET_WM_STATE_REMOVE = 0;
							const long _NET_WM_STATE_ADD = 1;
							const long _NET_WM_STATE_TOGGLE = 2;*/
							X.Event event = X.Event();
							event.xclient.display = xdisplay;
							event.xclient.type = X.EventType.ClientMessage;
							event.xclient.window = xid;
							event.xclient.message_type = get_atom_from_str(xdisplay,xid,"_NET_WM_STATE");
							event.xclient.format = 32;

							// 动作 (0=Remove, 1=Add, 2=Toggle)
							event.xclient.l[0] = enable ? 1 : 0;
							// 要修改的属性 Atom
							event.xclient.l[1] = (long)atom_target;
							// data[2]: 第二个属性 (通常设为0，除非你要同时修改两个)
							event.xclient.l[2] = 0;
							event.xclient.l[3] = privilege? 2 : 1;
							Debug.bug_0();
							return event;
						}

						internal static void set_atom_client_message_wm_state(X.Display xdisplay, X.Window xid, X.Atom atom_target, bool enable, bool privilege) {
							X.Event event = get_event_wm_state(xdisplay,xid,atom_target,enable,privilege);
							send_client_message(xdisplay,xid,ref event);
						}

						private static X.Event get_event_wm_desktop(X.Display xdisplay, X.Window xid, int? desktop, bool privilege) {
							X.Event event = X.Event();
							event.xclient.display = xdisplay;
							event.xclient.type = X.EventType.ClientMessage;
							event.xclient.window = xid;
							event.xclient.message_type = get_atom_from_str(xdisplay,xid,"_NET_WM_DESKTOP");
							event.xclient.format = 32;
							long desktop_number;
							if (desktop != null){
								desktop_number = (long)desktop;
							}
							else {
								desktop_number = (long)0xFFFFFFFF;
							}
							event.xclient.l[0] = desktop_number;
							event.xclient.l[1] = privilege? 2 : 1; // 来源标志：1 表示来自应用程序
							Debug.bug_0();
							return event;
						}

						internal static void set_atom_client_message_wm_desktop(X.Display xdisplay, X.Window xid, int? desktop, bool privilege) {
							X.Event event = get_event_wm_desktop(xdisplay,xid,desktop,privilege);
							send_client_message(xdisplay,xid,ref event);
						}

						internal static void set_atom_replace(X.Display xdisplay, X.Window xid, X.Atom atom_target, X.Atom atom_prop) {
							X.Atom new_array[1];
							new_array[0] = atom_target;
							internal_set_core(xdisplay,xid,atom_prop,(uchar[])new_array,new_array.length,X.XA_ATOM,PropMode.Replace);
							xdisplay.flush();
						}

						internal static void set_cardinal(X.Display xdisplay, X.Window xid, long[] cardinal_array, X.Atom atom_prop) {
							internal_set_core(xdisplay,xid,atom_prop,(uchar[])cardinal_array,cardinal_array.length,X.XA_CARDINAL,PropMode.Replace);
							xdisplay.flush();
						}

						private static string[]? get_atom_name_list_by_atom_array(X.Display xdisplay, X.Window xid, X.Atom[] atom_array){
							string[] name_list = new string[atom_array.length];
							if (atom_array.length == 0){
								return null;
							}
							else {
								for (int i = 0; i < atom_array.length; i++) {
								name_list[i] = xdisplay.get_atom_name(atom_array[i]);
								}
								return name_list;
							}
						}

						internal static string[]? get_atom_name_list(X.Display xdisplay, X.Window xid, X.Atom atom_prop) {
							X.Atom[]? atom_array = get_atom_array(xdisplay,xid,atom_prop);
							return get_atom_name_list_by_atom_array(xdisplay,xid,atom_array);
						}
					}
				}
			}
		}
	}
}
