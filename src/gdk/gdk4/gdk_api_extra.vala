[CCode (cprefix = "gtkaux_", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
	[CCode (cprefix = "gtkaux_gdk_", lower_case_cprefix = "gtkaux_gdk_")]
	namespace GdkLib {
		public void set_modal(Gdk.Surface surface,bool enable){
			if (surface is Gdk.Toplevel){
				((Gdk.Toplevel)surface).set_modal(true);
			}
			else{
				critical("Gdk surface is not toplevel.");
				return;
			}
		}
	}
	[CCode (cprefix = "gtkaux_gdk_x11_", lower_case_cprefix = "gtkaux_gdk_x11_")]
	namespace GdkX11Lib {
		public bool is_keep_above_supported(Gdk.Surface surface){
			return is_window_state_hint_supported(surface,X11Lib.WindowStateHint.ABOVE);
		}
		public bool get_keep_above(Gdk.Surface surface){
			return get_window_state_hint(surface,X11Lib.WindowStateHint.ABOVE);
		}
		public void set_keep_above(Gdk.Surface surface,bool enable){
			set_window_state_hint(surface,X11Lib.WindowStateHint.ABOVE,enable);
		}

		public bool is_keep_below_supported(Gdk.Surface surface){
			return is_window_state_hint_supported(surface,X11Lib.WindowStateHint.BELOW);
		}
		public bool get_keep_below(Gdk.Surface surface){
			return get_window_state_hint(surface,X11Lib.WindowStateHint.BELOW);
		}
		public void set_keep_below(Gdk.Surface surface,bool enable){
			set_window_state_hint(surface,X11Lib.WindowStateHint.BELOW,enable);
		}

		// 需要从desktop number综合判断stick问题
		public bool is_sticky_supported(Gdk.Surface surface){
			return (is_window_state_hint_supported(surface,X11Lib.WindowStateHint.STICKY)
			&& is_hint_supported_by_string(surface,"_NET_WM_DESKTOP")
			);
		}
		public bool get_sticky(Gdk.Surface surface){
			return (get_window_state_hint(surface,X11Lib.WindowStateHint.STICKY)
			&& (get_desktop_number(surface) == -1)
			);
		}
		public void set_sticky(Gdk.Surface surface,bool enable){
			set_window_state_hint(surface,X11Lib.WindowStateHint.STICKY,enable);
			if (enable == true){
				set_desktop_number(surface,-1);
			}else{set_desktop_number(surface,0);}
		}
		public void set_skip_taskbar(Gdk.Surface surface,bool enable){
			if(surface is Gdk.X11.Surface){
				((Gdk.X11.Surface)surface).set_skip_taskbar_hint(enable);
			}
			else{
				warning("Surface is not X11.");
				return;
			}
		}
		public void set_skip_pager(Gdk.Surface surface,bool enable){
			if(surface is Gdk.X11.Surface){
				((Gdk.X11.Surface)surface).set_skip_pager_hint(enable);
			}
			else{
				warning("Surface is not X11.");
				return;
			}
		}
	}
}

