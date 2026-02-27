//和delegate相互依赖
namespace GX11LegacyHelper {
	//重要的基础工具
	internal Gdk.Display? get_display(GLib.Object? win_item){
		if(win_item == null){return null;}
		#if GTK3
		else if(win_item is Gdk.Window){return ((Gdk.Window)win_item).get_display();}
		#elif GTK4
		else if(win_item is Gdk.Surface){return ((Gdk.Surface)win_item).get_display();}
		#endif
		else if(win_item is Gtk.Window){
			#if GTK3
			return get_display(((Gtk.Window)win_item).get_window());
			#elif GTK4
			return get_display(((Gtk.Window)win_item).get_surface());
			#endif
		}
		else if(win_item is Gdk.Display){return (Gdk.Display)win_item;}
		else{return null;}
	}

	internal unowned X.Display? get_xdisplay(GLib.Object? win_item){
		if(win_item == null){return null;}
		else if(win_item is Gdk.Display){
			if (win_item is Gdk.X11.Display)
			{
				return ((Gdk.X11.Display)win_item).get_xdisplay();
			}
			else {
				return null;
			}
		}
		else {
			return get_xdisplay(get_display(win_item));
		}
	}

	internal X.Window get_xid(GLib.Object? win_item){
		if(win_item == null){return X.None;}
		#if GTK3
		else if(win_item is Gdk.X11.Window){return ((Gdk.X11.Window)win_item).get_xid();}
		#elif GTK4
		else if(win_item is Gdk.X11.Surface){return ((Gdk.X11.Surface)win_item).get_xid();}
		#endif
		else if(win_item is Gtk.Window){
			#if GTK3
			return get_xid(((Gtk.Window)win_item).get_window());
			#elif GTK4
			return get_xid(((Gtk.Window)win_item).get_surface());
			#endif
		}
		else{return X.None;}
	}

	//不重要的辅助函数
	internal Gdk.Rectangle get_monitor_geometry(GLib.Object? win_item){
		return Delegate.get_func<Gdk.Rectangle?>(win_item,(a,b) => {
			Gdk.Rectangle ret = {};
			C.XRandR.get_monitor_geometry(a,b,out ret.x,out ret.y,out ret.width,out ret.height);
			return ret;
		})
		??Gdk.Rectangle();
	}

	//这里有一个编译器的bug,导致无法适用前面搭建的泛型系统
	internal X.WindowAttributes x_get_attrs(X.Display xdisplay, X.Window xid) {
		X.WindowAttributes attrs;
		xdisplay.get_window_attributes(xid, out attrs);
		return attrs;
	}
	internal X.WindowAttributes get_attrs(GLib.Object? win_item){
		return x_get_attrs(get_xdisplay(win_item),get_xid(win_item));
	}
}
