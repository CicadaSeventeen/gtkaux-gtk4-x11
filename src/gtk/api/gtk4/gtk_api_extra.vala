[CCode (cprefix = "gtkaux_", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
	[CCode (cprefix = "gtkaux_gtk_", lower_case_cprefix = "gtkaux_gtk_")]
	namespace GtkLib {
		// modal的set和get官方都有
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
				window.minimize();
			}
			else{
				window.unminimize();
			}
		}
	}


	[CCode (cprefix = "gtkaux_gtk_x11_", lower_case_cprefix = "gtkaux_gtk_x11_")]
	namespace GtkX11Lib {
		public bool get_keep_above(Gtk.Window window){
			return get_window_state_hint(window,X11Lib.WindowStateHint.ABOVE);
		}
		public void set_keep_above(Gtk.Window window,bool enable){
			set_window_state_hint(window,X11Lib.WindowStateHint.ABOVE,enable);
		}

		public bool get_keep_below(Gtk.Window window){
			return get_window_state_hint(window,X11Lib.WindowStateHint.BELOW);
		}
		public void set_keep_below(Gtk.Window window,bool enable){
			set_window_state_hint(window,X11Lib.WindowStateHint.BELOW,enable);
		}

		public bool get_sticky(Gtk.Window window){
			return (get_window_state_hint(window,X11Lib.WindowStateHint.STICKY)
			&& (get_desktop_number(window) == -1)
			);
		}
		public void set_sticky(Gtk.Window window,bool enable){
			set_window_state_hint(window,X11Lib.WindowStateHint.STICKY,enable);
			if (enable == true){
				set_desktop_number(window,-1);
			}else{set_desktop_number(window,0);}
		}

		public void set_skip_taskbar(Gtk.Window window,bool enable){
			if(window is Gdk.X11.Surface){
				((Gdk.X11.Surface)window).set_skip_taskbar_hint(enable);
			}
			else{
				warning("Surface is not X11.");
				return;
			}
		}

		public void set_skip_pager(Gtk.Window window,bool enable){
			if(window is Gdk.X11.Surface){
				((Gdk.X11.Surface)window).set_skip_pager_hint(enable);
			}
			else{
				warning("Surface is not X11.");
				return;
			}
		}
	}
}

