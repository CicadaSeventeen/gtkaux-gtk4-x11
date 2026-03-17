[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux{
[CCode (cprefix = "GtkAuxX11", lower_case_cprefix = "gtkaux_x11_")]
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

		public unowned GLib.Object[]? get_margin_array(Gdk.Display display){
			var tmp = new SetData_MarginWindowArray(display);
			if(tmp.has_content()){return tmp.content_ref.data;}
			else{return null;}
		}

		public void get_total_margin(Gdk.Display display,out int top,out int right,out int bottom,out int left) {
			left = 0;
			right = 0;
			top = 0;
			bottom = 0;
			unowned GLib.Object[]? tmp = get_margin_array(display);
			if(tmp!=null){
				foreach(GLib.Object item in tmp){
					int tmp_left,tmp_right,tmp_top,tmp_bottom;
					get_screen_margin(item,out tmp_top,out tmp_right,out tmp_bottom,out tmp_left);
					left += tmp_left;
					right += tmp_right;
					top += tmp_top;
					bottom += tmp_bottom;
				}
			}
		}

		//ewmh顺序与css顺序不同，这里需要转换一下
		public void set_screen_margin(GLib.Object window, int top,int right,int bottom,int left) {
			if (is_hint_supported_by_string(window,"_NET_WM_STRUT_PARTIAL")
				|| is_hint_supported_by_string(window,"_NET_WM_STRUT"))
			{
				Internal.X11Lib.XDisplay.Ewmh.set_strut(get_xdisplay(window),get_xid(window),left,right,top,bottom);
				var tmp = new SetData_MarginWindowArray(get_display(window));
				tmp.add_new(window);
			}
			else{
				warning("EWMH struct and struct_partial not supported.");
			}
		}

		internal class SetData_MarginWindowArray: Internal.SetDataHelper.SetData_GLibArray<GLib.Object> {
			internal SetData_MarginWindowArray(GLib.Object mother){
				base(mother,"MarginWindowOfDisplay");
			}
			internal void add_new(GLib.Object window){
				unowned GLib.GenericArray<GLib.Object> tmp = this.content_ref;
				if(tmp == null)
				{
					warning("array is null.");
					var array = new GLib.GenericArray<GLib.Object>();
					array.add(window);
					this.content = array;
				}
				else{
					tmp.add(window);
				}
			}
		}
	}
}
