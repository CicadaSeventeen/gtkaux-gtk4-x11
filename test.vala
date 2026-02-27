public class MyPanel : Gtk.ApplicationWindow {

	public MyPanel(Gtk.Application app) {
			// 1. 基础设置：无边框，设为 Dock 类型
			Object(application: app);
			this.title = "Vala Top Panel";
			//this.decorated = false;
			this.set_default_size(100, 40);


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
			//GtkAux.X11.set_type_hint(this,GdkAux.X11.WindowTypeHint.DOCK);
			GtkAux.X11.set_state_hint(this,GdkAux.X11.WindowStateHint.SHADED,true);
			GtkAux.X11.set_state_hint(this,GdkAux.X11.WindowStateHint.SKIP_PAGER,true);
			GtkAux.X11.set_state_hint(this,GdkAux.X11.WindowStateHint.SKIP_TASKBAR,true);
			GtkAux.X11.set_desktop_number(this,-1);
			//GtkAux.link.moveTarget_geoRect.init(this,tmp);
			//GtkAux.link..init(this,true);
			GtkAux.X11.set_override_redirect(this,false);
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
			/*print(GtkAux.link.stateHint_stateHintEnum[(int)GdkAux.X11.WindowStateHint.FULLSCREEN].if_has_data(win).to_string());
			print(GtkAux.link.stateHint_stateHintEnum[(int)GdkAux.X11.WindowStateHint.FULLSCREEN].get_data(win).to_string());
			print(GtkAux.link.stateHint_stateHintEnum[(int)GdkAux.X11.WindowStateHint.HIDDEN].if_has_data(win).to_string());
			print(GtkAux.link.stateHint_stateHintEnum[(int)GdkAux.X11.WindowStateHint.HIDDEN].get_data(win).to_string());
			//print(GtkAux.link.stateHint_stateHintEnum[(int)GdkAux.X11.WindowStateHint.STICKY].if_has_data(win).to_string());
			//print(GtkAux.link.stateHint_stateHintEnum[(int)GdkAux.X11.WindowStateHint.STICKY].get_data(win).to_string());*/
	});
	app.run();
	return 0;
}

