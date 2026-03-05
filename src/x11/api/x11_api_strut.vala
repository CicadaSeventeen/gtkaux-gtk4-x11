[CCode (cprefix = "gtkaux_", lower_case_cprefix = "gtkaux_")]
namespace GtkAux{
	[CCode (cprefix = "gtkaux_x11_", lower_case_cprefix = "gtkaux_x11_")]
	namespace X11Lib {
		public void get_screen_margin(GLib.Object window,out int top,out int right,out int bottom,out int left) {
			if (is_hint_supported_by_string(window,"_NET_WM_STRUT_PARTIAL")
				|| is_hint_supported_by_string(window,"_NET_WM_STRUT"))
			{
				int[]? tmp = Internal.X11Lib.XDisplay.Ewmh.get_strut(get_xdisplay(window),get_xid(window));
				if (tmp != null){
					left = tmp[0];
					right = tmp[1];
					top = tmp[2];
					bottom = tmp[3];
					return;
				}
				else {
					warning("Unexpected null here.");
				}
			}
			else{
				warning("EWMH struct and struct_partial not supported.");
			}
			left = 0;
			right = 0;
			top = 0;
			bottom = 0;
		}

		//ewmh顺序与css顺序不同，这里需要转换一下
		public void set_screen_margin(GLib.Object window, int top,int right,int bottom,int left) {
			if (is_hint_supported_by_string(window,"_NET_WM_STRUT_PARTIAL")
				|| is_hint_supported_by_string(window,"_NET_WM_STRUT"))
			{
				Internal.X11Lib.XDisplay.Ewmh.set_strut(get_xdisplay(window),get_xid(window),left,right,top,bottom);
			}
			else{
				warning("EWMH struct and struct_partial not supported.");
			}
		}
	}
}
