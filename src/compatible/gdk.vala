namespace GtkAux {
	#if API_COMPATIBLE
[CCode (cprefix = "Gdk", lower_case_cprefix = "gdk_")]
	#else
[CCode (cprefix = "GdkLegacy", lower_case_cprefix = "gdklegacy_")]
	#endif
	namespace GdkLegacy {
	#if GTK3
		public void minimize(Gdk.Window self){
			self.iconify();
		}

		public void unminimize(Gdk.Window self){
			self.deiconify();
		}
	#elif GTK4
		public void set_modal_hint(Gdk.Surface self,bool modal){
			GdkX11Lib.set_window_state_hint(self,X11Lib.WindowStateHint.MODAL,modal);
		}
		public bool get_modal_hint(Gdk.Surface self){
			return GdkX11Lib.get_window_state_hint(self,X11Lib.WindowStateHint.MODAL);
		}

		public void set_keep_above(Gdk.Surface self,bool setting){
			GdkX11Lib.set_keep_above(self,setting);
		}

		public void set_keep_below(Gdk.Surface self,bool setting){
			GdkX11Lib.set_keep_below(self,setting);
		}

		public void sitck(Gdk.Surface self){
			GdkX11Lib.set_sticky(self,true);
		}
		public void unsitck(Gdk.Surface self){
			GdkX11Lib.set_sticky(self,false);
		}

		public void set_skip_taskbar_hint(Gdk.Surface self,bool skip_taskbar){
			GdkX11Lib.set_skip_taskbar(self,skip_taskbar);
		}
		public void set_skip_pager_hint(Gdk.Surface self,bool skip_pager){
			GdkX11Lib.set_skip_pager(self,skip_pager);
		}

		public int get_width(Gdk.Surface self){
			int width,height;
			GdkX11Lib.get_size(self,out width,out height);
			return width;
		}
		public int get_height(Gdk.Surface self){
			int width,height;
			GdkX11Lib.get_size(self,out width,out height);
			return height;
		}
		public void get_position(Gdk.Surface self,out int x,out int y){
			GdkX11Lib.get_position(self,out x,out y);
		}
		public void get_geometry(Gdk.Surface self,out int x,out int y,out int width,out int height){
			GdkX11Lib.get_geometry(self,out x,out y,out width,out height);
		}

		public void move(Gdk.Surface self,int x,int y){
			GdkX11Lib.move(self,x,y);
		}
		public void resize(Gdk.Surface self,int width,int height){
			GdkX11Lib.resize(self,width,height);
		}
		public void move_resize(Gdk.Surface self,int x,int y,int width,int height){
			GdkX11Lib.move_resize(self,x,y,width,height);
		}
	#endif
	}
}
