//和display相互依赖
namespace GX11LegacyHelper{
	namespace Delegate{
		/*internal delegate Ret GetFunc<Ret>(GLib.Object? win_item);
		internal delegate void SetFunc(GLib.Object? win_item);*/
		internal delegate Ret X11GetFunc<Ret>(X.Display xdisplay, X.Window xid);
		internal delegate void X11SetFunc(X.Display xdisplay, X.Window xid);

		internal Ret get_func<Ret>(GLib.Object? win_item, X11GetFunc<Ret> x11_get_func){
			if (win_item != null) {
				return x11_get_func(get_xdisplay(win_item),get_xid(win_item));
			}
			else{
				return null;
			}
		}
		internal void set_func(GLib.Object? win_item, X11SetFunc x11_set_func){
			if (win_item != null) {
				x11_set_func(get_xdisplay(win_item),get_xid(win_item));
			}
		}
	}
}
