public class MyPanel : Gtk.ApplicationWindow {

	public MyPanel(Gtk.Application app) {
			// 1. 基础设置：无边框，设为 Dock 类型
			Object(application: app);
			this.title = "Vala Top Panel";
			//this.decorated = false;
			this.set_default_size(100, 400);


			#if GTK3
			this.move(30, 40);
			// 添加一个按钮方便测试退出
			var btn = new Gtk.Button.with_label("Exit Panel");
			btn.clicked.connect(() => {app.quit();});
			btn.set_size_request(200,100);
			this.add(btn);
			#elif GTK4
			var btn = new Gtk.Button.with_label("Exit Panel");
			btn.clicked.connect(() => {app.quit();});
			btn.set_size_request(200,100);
			this.set_child(btn);
			#endif
			//GtkAux.X11.set_type_hint(this,GtkAux.X11Lib.WindowTypeHint.DOCK);
			this.set_decorated(false);
			var x = Value(GLib.Type.DOUBLE);
			var y = Value(GLib.Type.DOUBLE);
			x.set_double(0.5);
			y.set_double(0.5);
			var width = Value(GLib.Type.DOUBLE);
			var height = Value(GLib.Type.DOUBLE);
			width.set_double(1.0);
			height.set_double(1.0);
			var top = Value(GLib.Type.INT);
			var bottom = Value(GLib.Type.DOUBLE);
			var left = Value(GLib.Type.DOUBLE);
			var right = Value(GLib.Type.INT);
			top.set_int(10);
			bottom.set_double(0.2);
			left.set_double(0.5);
			right.set_int(5);
			//GtkAux.GtkX11Lib.set_window_state_hint(this,GtkAux.X11Lib.WindowStateHint.SKIP_PAGER,true);
			//GtkAux.GtkX11Lib.set_window_state_hint(this,GtkAux.X11Lib.WindowStateHint.SKIP_TASKBAR,true);
			GtkAux.GtkX11Lib.set_position(this,320,200,GtkAux.X11Lib.ALIGN_HORZ_LEFT,GtkAux.X11Lib.ALIGN_VERT_TOP);
			GtkAux.GtkX11Lib.set_size(this,400,400,GtkAux.X11Lib.ALIGN_HORZ_MID,GtkAux.X11Lib.ALIGN_VERT_MID);
			//GtkAux.link.moveTarget_geoRect.init(this,tmp);
			//GtkAux.link..init(this,true);
			//print(item.to_string());

			/*this.map.connect( () =>
			{
				this.on_test(this);
			}
			);
			((Gtk.Widget) this).realize.connect( () =>
			{
				this.on_test(this);
			}
			);*/
	}

	public void on_test(Gtk.Window window) {
			//GtkAux.link.stateHint_stateHintEnum[(int)GdkAux.X11.WindowStateHint.FULLSCREEN].init(this,true);
			//GtkAux.link.stateHint_stateHintEnum[(int)GdkAux.X11.WindowStateHint.HIDDEN].set_data(this,false);
			//GdkAux.X11.set_desktop_number(window.get_surface(),-1);
			;
	}


}

public static int main(string[] args) {
	var app = new Gtk.Application("com.example.gtk3demo",ApplicationFlags.FLAGS_NONE);
	app.activate.connect ( () => {
			var win = new MyPanel(app);
			#if GTK3
			win.show_all();
			#endif
			win.present();
	});
	app.run();
	return 0;
}

