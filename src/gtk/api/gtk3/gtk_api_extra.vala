[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
[CCode (cprefix = "GtkAuxGtk", lower_case_cprefix = "gtkaux_gtk_")]
	namespace GtkLib {
		public void set_modal(Gtk.Window window,bool enable){window.set_modal(enable);}
		public bool get_modal(Gtk.Window window,bool enable){return window.get_modal();}

		public void set_maximize(Gtk.Window window,bool enable){
			if(enable == true){
				window.maximize();
			}
			else{
				window.unmaximize();
			}
		}
		public void set_fullscreen(Gtk.Window window,bool enable){
			if(enable == true){
				window.fullscreen();
			}
			else{
				window.unfullscreen();
			}
		}
		public void set_minimize(Gtk.Window window,bool enable){
			if(enable == true){
				window.iconify();
			}
			else{
				window.deiconify();
			}
		}
	}

[CCode (cprefix = "GtkAuxGtkX11", lower_case_cprefix = "gtkaux_gtk_x11_")]
	namespace GtkX11Lib {
		//官方gtk3只有set_keep_above和below
		public void set_keep_above(Gtk.Window window,bool enable){
			window.set_keep_above(enable);
		}

		public void set_keep_below(Gtk.Window window,bool enable){
			window.set_keep_below(enable);
		}

		//只有gtk3有
		public void set_sticky(Gtk.Window window,bool enable){
			if(enable == true){
				window.stick();
			}
			else{
				window.unstick();
			}
		}

		// gtk3 get和set都有 gtk4只有gdk层有set没有get(且在gdk.x11中)
		public void set_skip_taskbar(Gtk.Window window,bool enable){
			window.set_skip_taskbar_hint(enable);
		}
		public void set_skip_pager(Gtk.Window window,bool enable){
			window.set_skip_pager_hint(enable);
		}
		public void get_skip_taskbar(Gtk.Window window){
			window.get_skip_taskbar_hint();
		}
		public void get_skip_pager(Gtk.Window window){
			window.get_skip_pager_hint();
		}
	}
}
