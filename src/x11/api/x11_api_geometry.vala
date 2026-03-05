[CCode (cprefix = "gtkaux_", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
	[CCode (cprefix = "gtkaux_x11_", lower_case_cprefix = "gtkaux_x11_")]
	namespace X11Lib {
		// move 用在after map
		public void move(GLib.Object? window, int x, int y) {
			Internal.X11Lib.XDisplay.Geometry.move(get_xdisplay(window),get_xid(window),x,y);
		}
		public void resize(GLib.Object? window, int width, int height) {
			Internal.X11Lib.XDisplay.Geometry.resize(get_xdisplay(window),get_xid(window),width,height);
		}
		public void move_resize(GLib.Object? window,  int x, int y, int width, int height) {
			Internal.X11Lib.XDisplay.Geometry.move_resize(get_xdisplay(window),get_xid(window),x,y,width,height);
		}
		public void get_position(GLib.Object? window,out int x,out int y) {
			var tmp = get_attrs(window);
			x = tmp.x;
			y = tmp.y;
		}
		public void get_size(GLib.Object? window,out int width,out int height) {
			var tmp = get_attrs(window);
			width = tmp.width;
			height = tmp.height;
		}
		public void get_geometry(GLib.Object? window,out int x,out int y,out int width,out int height) {
			var tmp = get_attrs(window);
			x = tmp.x;
			y = tmp.y;
			width = tmp.width;
			height = tmp.height;
		}
		public void get_monitor_geometry(GLib.Object? window,out int x,out int y,out int width,out int height){
			Internal.X11Lib.XDisplay.C.Xrandr.get_monitor_geometry(get_xdisplay(window),get_xid(window),out x,out y,out width,out height);
		}
	}
}
