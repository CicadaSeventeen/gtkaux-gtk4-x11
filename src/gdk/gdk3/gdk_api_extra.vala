[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
	[CCode (cprefix = "GtkAuxGdk", lower_case_cprefix = "gtkaux_gdk_")]
	namespace GdkLib {
		public void set_maximize(Gdk.Window window,bool enable){
			if(enable == true){
				window.maximize();
			}
			else{
				window.unmaximize();
			}
		}
		public void set_fullscreen(Gdk.Window window,bool enable){
			if(enable == true){
				window.fullscreen();
			}
			else{
				window.unfullscreen();
			}
		}
		public void set_minimize(Gdk.Window window,bool enable){
			if(enable == true){
				window.iconify();
			}
			else{
				window.deiconify();
			}
		}
		public bool get_modal(Gdk.Window window){
			Gtk.Window? win = get_gtk_window(window);
			if(win != null){
				return win.get_modal();
			}
			else {return false;}
		}
		public void set_modal(Gdk.Window window,bool enable){
			Gtk.Window? win = get_gtk_window(window);
			if(win != null){
				win.set_modal(enable);
			}
		}
	}

	[CCode (cprefix = "GtkAuxGdkX11", lower_case_cprefix = "gtkaux_gdk_x11_")]
	namespace GdkX11Lib {
		public bool get_modal(Gdk.Window window){
			return window.get_modal_hint();
		}
		public void set_modal(Gdk.Window window,bool enable){
			window.set_modal_hint(enable);
		}

		public void set_keep_above(Gdk.Window window,bool enable){
			window.set_keep_above(enable);
		}

		public void set_keep_below(Gdk.Window window,bool enable){
			window.set_keep_below(enable);
		}

		public void set_sticky(Gdk.Window window,bool enable){
			if(enable == true){
				window.stick();
			}
			else{
				window.unstick();
			}
		}

		public void set_skip_taskbar(Gdk.Window window,bool enable){
			window.set_skip_taskbar_hint(enable);
		}
		public void set_skip_pager(Gdk.Window window,bool enable){
			window.set_skip_pager_hint(enable);
		}
	}
}
