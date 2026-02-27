namespace GX11LegacyHelper {
	// move 用在after map
	internal void move(GLib.Object? win_item, int x, int y) {
		Delegate.set_func(win_item,(a,b) => {
			Geometry.move(a,b,x,y);
		});
	}
	internal void resize(GLib.Object? win_item, int width, int height) {
		Delegate.set_func(win_item,(a,b) => {
			Geometry.resize(a,b,width,height);
		});
	}
	internal void move_resize(GLib.Object? win_item,Gdk.Rectangle target) {
		Delegate.set_func(win_item,(a,b) => {
			Geometry.move_resize(a,b,target);
		});
	}
	internal void get_position(GLib.Object? win_item,out int x,out int y) {
		var tmp = get_attrs(win_item);
		x = tmp.x;
		y = tmp.y;
	}
	internal void get_size(GLib.Object? win_item,out int width,out int height) {
		var tmp = get_attrs(win_item);
		width = tmp.width;
		height = tmp.height;
	}
	internal Gdk.Rectangle get_geometry(GLib.Object? win_item) {
		var tmp = get_attrs(win_item);
		Gdk.Rectangle ret = {0};
		ret.x = tmp.x;
		ret.y = tmp.y;
		ret.width = tmp.width;
		ret.height = tmp.height;
		return ret;
	}

	namespace Geometry {
		internal void move(X.Display xdisplay, X.Window xid, int x, int y) {
			xdisplay.move_window(xid,x,y);
			xdisplay.flush();
		}
		internal void resize(X.Display xdisplay, X.Window xid, int width, int height) {
			xdisplay.resize_window(xid,width,height);
			xdisplay.flush();
		}
		internal void move_resize(X.Display xdisplay, X.Window xid,Gdk.Rectangle target) {
			xdisplay.move_resize_window(xid,target.x,target.y,target.width,target.height);
			xdisplay.flush();
		}

	}
}
