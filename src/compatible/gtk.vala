namespace GtkAux {
	#if API_COMPATIBLE
[CCode (cprefix = "Gtk", lower_case_cprefix = "gtk_")]
	#else
[CCode (cprefix = "GtkLegacy", lower_case_cprefix = "gtklegacy_")]
	#endif
	namespace GtkLegacy {
		#if GTK3
		public void minimize(Gtk.Window self){
			self.iconify();
		}

		public void unminimize(Gtk.Window self){
			self.deiconify();
		}
		#elif GTK4

		public void set_keep_above(Gtk.Window self,bool setting){
			GtkX11Lib.set_keep_above(self,setting);
		}

		public void set_keep_below(Gtk.Window self,bool setting){
			GtkX11Lib.set_keep_below(self,setting);
		}

		public void sitck(Gtk.Window self){
			GtkX11Lib.set_sticky(self,true);
		}
		public void unsitck(Gtk.Window self){
			GtkX11Lib.set_sticky(self,false);
		}

		public void set_skip_taskbar_hint(Gtk.Window self,bool skip_taskbar){
			GtkX11Lib.set_window_state_hint(self,X11Lib.WindowStateHint.SKIP_TASKBAR,skip_taskbar);
		}
		public void set_skip_pager_hint(Gtk.Window self,bool skip_pager){
			GtkX11Lib.set_window_state_hint(self,X11Lib.WindowStateHint.SKIP_TASKBAR,skip_pager);
		}

		public bool get_skip_taskbar_hint(Gtk.Window self,bool skip_taskbar){
			return GtkX11Lib.get_window_state_hint(self,X11Lib.WindowStateHint.SKIP_TASKBAR);
		}
		public bool get_skip_pager_hint(Gtk.Window self,bool skip_pager){
			return GtkX11Lib.get_window_state_hint(self,X11Lib.WindowStateHint.SKIP_TASKBAR);
		}

		public void move(Gtk.Window self,int x,int y){
			GtkX11Lib.move(self,x,y);
		}
		public void resize(Gtk.Window self,int width,int height){
			GtkX11Lib.resize(self,width,height);
		}
		public void move_resize(Gtk.Window self,int x,int y,int width,int height){
			GtkX11Lib.move_resize(self,x,y,width,height);
		}
		public void iconify(Gtk.Window self){
			self.minimize();
		}

		public void unminimize(Gtk.Window self){
			self.unminimize();
		}
		#endif
	}
}
