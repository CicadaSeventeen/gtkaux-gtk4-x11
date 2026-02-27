namespace GdkAux {
	#if GTK3
	public void set_maximize(Gdk.Window gdkwindow,bool enable){
		if(enable == true){
			gdkwindow.maximize();
		}
		else{
			gdkwindow.unmaximize();
		}
	}
	public void set_fullscreen(Gdk.Window gdkwindow,bool enable){
		if(enable == true){
			gdkwindow.fullscreen();
		}
		else{
			gdkwindow.unfullscreen();
		}
	}
	public void set_minimize(Gdk.Window gdkwindow,bool enable){
		if(enable == true){
			gdkwindow.iconify();
		}
		else{
			gdkwindow.deiconify();
		}
	}
	public bool get_modal(Gdk.Window gdkwindow){
		Gtk.Window? win = get_gtk_window(gdkwindow);
		if(win != null){
			return win.get_modal();
		}
		else {return false;}
	}
	public void set_modal(Gdk.Window gdkwindow,bool enable){
		Gtk.Window? win = get_gtk_window(gdkwindow);
		if(win != null){
			win.set_modal(enable);
		}
	}

	namespace X11 {
		public void set_keep_above(Gdk.Window gdkwindow,bool enable){
			gdkwindow.set_keep_above(enable);
		}
		namespace Extra {
			public void set_keep_above(Gdk.Window gdkwindow,bool enable){
				set_state_hint(gdkwindow,WindowStateHint.ABOVE,enable);
			}

			public bool is_keep_above_supported(Gdk.Window gdkwindow){
				return is_state_hint_supported(gdkwindow,WindowStateHint.ABOVE);
			}
			public bool get_keep_above(Gdk.Window gdkwindow){
				return get_state_hint(gdkwindow,WindowStateHint.ABOVE);
			}
		}

		public void set_keep_below(Gdk.Window gdkwindow,bool enable){
			gdkwindow.set_keep_below(enable);
		}
		namespace Extra {
			public void set_keep_below(Gdk.Window gdkwindow,bool enable){
				set_state_hint(gdkwindow,WindowStateHint.BELOW,enable);
			}

			public bool is_keep_below_supported(Gdk.Window gdkwindow){
				return is_state_hint_supported(gdkwindow,WindowStateHint.BELOW);
			}
			public bool get_keep_below(Gdk.Window gdkwindow){
				return get_state_hint(gdkwindow,WindowStateHint.BELOW);
			}
		}

		public bool get_modal(Gdk.Window gdkwindow){
			return gdkwindow.get_modal_hint();
		}
		public void set_modal(Gdk.Window gdkwindow,bool enable){
			gdkwindow.set_modal_hint(enable);
		}
		namespace Extra {
			public bool get_modal(Gdk.Window gdkwindow){
				return get_state_hint(gdkwindow,WindowStateHint.MODAL);
			}
			public void set_modal(Gdk.Window gdkwindow,bool enable){
				set_state_hint(gdkwindow,WindowStateHint.MODAL,enable);
			}

			public bool is_modal_supported(Gdk.Window gdkwindow){
				return is_state_hint_supported(gdkwindow,WindowStateHint.MODAL);
			}
		}

		public void set_sticky(Gdk.Window gdkwindow,bool enable){
			if(enable == true){
				gdkwindow.stick();
			}
			else{
				gdkwindow.unstick();
			}
		}
		namespace Extra {
			public void set_sticky(Gdk.Window gdkwindow,bool enable){
				set_state_hint(gdkwindow,WindowStateHint.STICKY,enable);
				if (enable == true){
					GX11LegacyHelper.set_desktop_number(gdkwindow,-1);
				}else{GX11LegacyHelper.set_desktop_number(gdkwindow,0);}
			}
			// TODO
			// 这里绝对有bug
			public bool is_sticky_supported(Gdk.Window gdkwindow){
				return is_state_hint_supported(gdkwindow,WindowStateHint.STICKY);
			}
			public bool get_sticky(Gdk.Window gdkwindow){
				return get_state_hint(gdkwindow,WindowStateHint.STICKY);
			}
		}

		public bool is_shade_supported(Gdk.Window gdkwindow){
			return is_state_hint_supported(gdkwindow,WindowStateHint.SHADED);
		}
		public bool get_shade(Gdk.Window gdkwindow){
			return get_state_hint(gdkwindow,WindowStateHint.SHADED);
		}
		public void set_shade(Gdk.Window gdkwindow,bool enable){
			set_state_hint(gdkwindow,WindowStateHint.SHADED,enable);
		}

		public void set_skip_taskbar(Gdk.Window gdkwindow,bool enable){
			gdkwindow.set_skip_taskbar_hint(enable);
		}
		namespace Extra {
			public void set_skip_taskbar(Gdk.Window gdkwindow,bool enable){
				set_state_hint(gdkwindow,WindowStateHint.SKIP_TASKBAR,enable);
			}

			public bool is_skip_taskbar_supported(Gdk.Window gdkwindow){
				return is_state_hint_supported(gdkwindow,WindowStateHint.SKIP_TASKBAR);
			}
			public bool get_skip_taskbar_hint(Gdk.Window gdkwindow){
				return get_state_hint(gdkwindow,WindowStateHint.SKIP_TASKBAR);
			}
		}

		public void set_skip_pager(Gdk.Window gdkwindow,bool enable){
			gdkwindow.set_skip_pager_hint(enable);
		}
		namespace Extra {
			public void set_skip_pager(Gdk.Window gdkwindow,bool enable){
				set_state_hint(gdkwindow,WindowStateHint.SKIP_PAGER,enable);
			}

			public bool is_skip_pager_supported(Gdk.Window gdkwindow){
				return is_state_hint_supported(gdkwindow,WindowStateHint.SKIP_PAGER);
			}
			public bool get_skip_pager(Gdk.Window gdkwindow){
				return get_state_hint(gdkwindow,WindowStateHint.SKIP_PAGER);
			}
		}

		public bool is_maximize_vertical_supported(Gdk.Window gdkwindow){
			return is_state_hint_supported(gdkwindow,WindowStateHint.MAXIMIZED_VERT);
		}
		public bool get_maximize_vertical(Gdk.Window gdkwindow){
			return get_state_hint(gdkwindow,WindowStateHint.MAXIMIZED_VERT);
		}
		public void set_maximize_vertical(Gdk.Window gdkwindow,bool enable){
			set_state_hint(gdkwindow,WindowStateHint.MAXIMIZED_VERT,enable);
		}

		public bool is_maximize_horizontal_supported(Gdk.Window gdkwindow){
			return is_state_hint_supported(gdkwindow,WindowStateHint.MAXIMIZED_HORZ);
		}
		public bool get_maximize_horizontal(Gdk.Window gdkwindow){
			return get_state_hint(gdkwindow,WindowStateHint.MAXIMIZED_HORZ);
		}
		public void set_maximize_horizontal(Gdk.Window gdkwindow,bool enable){
			set_state_hint(gdkwindow,WindowStateHint.MAXIMIZED_HORZ,enable);
		}

		namespace Extra {
			public void set_maximize(Gdk.Window gdkwindow,bool enable){
				set_maximize_horizontal(gdkwindow,enable);
				set_maximize_vertical(gdkwindow,enable);
			}

			public bool is_maximize_supported(Gdk.Window gdkwindow){
				return (is_maximize_horizontal_supported(gdkwindow) && is_maximize_vertical_supported(gdkwindow));
			}
			public bool get_maximize(Gdk.Window gdkwindow){
				return (get_maximize_horizontal(gdkwindow) && get_maximize_vertical(gdkwindow));
			}
		}

		namespace Extra {
			public void set_minimize(Gdk.Window gdkwindow,bool enable){
				set_state_hint(gdkwindow,WindowStateHint.HIDDEN,enable);
			}

			public bool is_minimize_supported(Gdk.Window gdkwindow){
				return is_state_hint_supported(gdkwindow,WindowStateHint.HIDDEN);
			}
			public bool get_minimize(Gdk.Window gdkwindow){
				return get_state_hint(gdkwindow,WindowStateHint.HIDDEN);
			}
		}

		public void set_fullscreen_on_all_monitor(Gdk.Window gdkwindow,bool enable){
			if(enable == true){
				gdkwindow.set_fullscreen_mode((Gdk.FullscreenMode)1);
			}
			else{
				gdkwindow.set_fullscreen_mode((Gdk.FullscreenMode)0);
			}
		}
		public bool get_fullscreen_on_all_monitor(Gdk.Window gdkwindow){
			if((int)gdkwindow.get_fullscreen_mode() == 1){return true;}
			else {return false;}
		}
		namespace Extra {
			public void set_fullscreen(Gdk.Window gdkwindow,bool enable){
				set_state_hint(gdkwindow,WindowStateHint.FULLSCREEN,enable);
			}
			/* TODO
			* 尚未从X11 api直接实现
			public void set_fullscreen_on_all_monitor()
			public bool get_fullscreen_on_all_monitor()
			*/
			public bool is_fullscreen_supported(Gdk.Window gdkwindow){
				return is_state_hint_supported(gdkwindow,WindowStateHint.FULLSCREEN);
			}
			public bool get_fullscreen(Gdk.Window gdkwindow){
				return get_state_hint(gdkwindow,WindowStateHint.FULLSCREEN);
			}
		}

		public bool is_focus_supported(Gdk.Window gdkwindow){
			return is_state_hint_supported(gdkwindow,WindowStateHint.FOCUSED);
		}
		public bool get_focus(Gdk.Window gdkwindow){
			return get_state_hint(gdkwindow,WindowStateHint.FOCUSED);
		}
		public void set_focus(Gdk.Window gdkwindow,bool enable){
			set_state_hint(gdkwindow,WindowStateHint.FOCUSED,enable);
		}

		public bool is_attention_supported(Gdk.Window gdkwindow){
			return is_state_hint_supported(gdkwindow,WindowStateHint.DEMANDS_ATTENTION);
		}
		public bool get_attention(Gdk.Window gdkwindow){
			return get_state_hint(gdkwindow,WindowStateHint.DEMANDS_ATTENTION);
		}
		public void set_attention(Gdk.Window gdkwindow,bool enable){
			set_state_hint(gdkwindow,WindowStateHint.DEMANDS_ATTENTION,enable);
		}
	}
	#elif GTK4
	public void set_modal(Gdk.Surface surface,bool enable){
		if (surface is Gdk.Toplevel){
			((Gdk.Toplevel)surface).set_modal(true);
		}
		else{
			critical("Gdk surface is not toplevel.");
			return;
		}
	}

	namespace X11 {
		public bool is_keep_above_supported(Gdk.Surface surface){
			return is_state_hint_supported(surface,WindowStateHint.ABOVE);
		}
		public bool get_keep_above(Gdk.Surface surface){
			return get_state_hint(surface,WindowStateHint.ABOVE);
		}
		public void set_keep_above(Gdk.Surface surface,bool enable){
			set_state_hint(surface,WindowStateHint.ABOVE,enable);
		}

		public bool is_keep_below_supported(Gdk.Surface surface){
			return is_state_hint_supported(surface,WindowStateHint.BELOW);
		}
		public bool get_keep_below(Gdk.Surface surface){
			return get_state_hint(surface,WindowStateHint.BELOW);
		}
		public void set_keep_below(Gdk.Surface surface,bool enable){
			set_state_hint(surface,WindowStateHint.BELOW,enable);
		}

		namespace Extra {
			public bool get_modal(Gdk.Surface surface){
				return get_state_hint(surface,WindowStateHint.MODAL);
			}
			public void set_modal(Gdk.Surface surface,bool enable){
				set_state_hint(surface,WindowStateHint.MODAL,enable);
			}
			public bool is_modal_supported(Gdk.Surface surface){
				return is_state_hint_supported(surface,WindowStateHint.MODAL);
			}
		}

		//TODO
		// 需要从desktop number综合判断stick问题
		public bool is_sticky_supported(Gdk.Surface surface){
			return is_state_hint_supported(surface,WindowStateHint.STICKY);
		}
		public bool get_sticky(Gdk.Surface surface){
			return get_state_hint(surface,WindowStateHint.STICKY);
		}
		public void set_sticky(Gdk.Surface surface,bool enable){
			set_state_hint(surface,WindowStateHint.STICKY,enable);
			if (enable == true){
				GX11LegacyHelper.set_desktop_number(surface,-1);
			}else{GX11LegacyHelper.set_desktop_number(surface,0);}
		}

		public bool is_shade_supported(Gdk.Surface surface){
			return is_state_hint_supported(surface,WindowStateHint.SHADED);
		}
		public bool get_shade(Gdk.Surface surface){
			return get_state_hint(surface,WindowStateHint.SHADED);
		}
		public void set_shade(Gdk.Surface surface,bool enable){
			set_state_hint(surface,WindowStateHint.SHADED,enable);
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
		namespace Extra {
			public void set_skip_taskbar(Gdk.Surface surface,bool enable){
				set_state_hint(surface,WindowStateHint.SKIP_TASKBAR,enable);
			}
			public bool is_skip_taskbar_supported(Gdk.Surface surface){
				return is_state_hint_supported(surface,WindowStateHint.SKIP_TASKBAR);
			}
			public bool get_skip_taskbar(Gdk.Surface surface){
				return get_state_hint(surface,WindowStateHint.SKIP_TASKBAR);
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
		namespace Extra {
			public void set_skip_pager(Gdk.Surface surface,bool enable){
				set_state_hint(surface,WindowStateHint.SKIP_PAGER,enable);
			}

			public bool is_skip_pager_supported(Gdk.Surface surface){
				return is_state_hint_supported(surface,WindowStateHint.SKIP_PAGER);
			}
			public bool get_skip_pager(Gdk.Surface surface){
				return get_state_hint(surface,WindowStateHint.SKIP_PAGER);
			}
		}

		public bool is_maximize_vertical_supported(Gdk.Surface surface){
			return is_state_hint_supported(surface,WindowStateHint.MAXIMIZED_VERT);
		}
		public bool get_maximize_vertical(Gdk.Surface surface){
			return get_state_hint(surface,WindowStateHint.MAXIMIZED_VERT);
		}
		public void set_maximize_vertical(Gdk.Surface surface,bool enable){
			set_state_hint(surface,WindowStateHint.MAXIMIZED_VERT,enable);
		}

		public bool is_maximize_horizontal_supported(Gdk.Surface surface){
			return is_state_hint_supported(surface,WindowStateHint.MAXIMIZED_HORZ);
		}
		public bool get_maximize_horizontal(Gdk.Surface surface){
			return get_state_hint(surface,WindowStateHint.MAXIMIZED_HORZ);
		}
		public void set_maximize_horizontal(Gdk.Surface surface,bool enable){
			set_state_hint(surface,WindowStateHint.MAXIMIZED_HORZ,enable);
		}

		public void set_maximize(Gdk.Surface surface,bool enable){
			set_maximize_horizontal(surface,enable);
			set_maximize_vertical(surface,enable);
		}

		public bool is_maximize_supported(Gdk.Surface surface){
			return (is_maximize_horizontal_supported(surface) && is_maximize_vertical_supported(surface));
		}
		public bool get_maximize(Gdk.Surface surface){
			return (get_maximize_horizontal(surface) && get_maximize_vertical(surface));
		}

		public void set_minimize(Gdk.Surface surface,bool enable){
			set_state_hint(surface,WindowStateHint.HIDDEN,enable);
		}

		public bool is_minimize_supported(Gdk.Surface surface){
			return is_state_hint_supported(surface,WindowStateHint.HIDDEN);
		}
		public bool get_minimize(Gdk.Surface surface){
			return get_state_hint(surface,WindowStateHint.HIDDEN);
		}

		public bool is_fullscreen_supported(Gdk.Surface surface){
			return is_state_hint_supported(surface,WindowStateHint.FULLSCREEN);
		}
		public bool get_fullscreen(Gdk.Surface surface){
			return get_state_hint(surface,WindowStateHint.FULLSCREEN);
		}
		public void set_fullscreen(Gdk.Surface surface,bool enable){
			set_state_hint(surface,WindowStateHint.FULLSCREEN,enable);
		}
		/* TODO
		 * 尚未从X11 api直接实现
		public void set_fullscreen_on_all_monitor()
		public bool get_fullscreen_on_all_monitor()
		*/

		public bool is_focus_supported(Gdk.Surface surface){
			return is_state_hint_supported(surface,WindowStateHint.FOCUSED);
		}
		public bool get_focus(Gdk.Surface surface){
			return get_state_hint(surface,WindowStateHint.FOCUSED);
		}
		public void set_focus(Gdk.Surface surface,bool enable){
			set_state_hint(surface,WindowStateHint.FOCUSED,enable);
		}

		public bool is_attention_supported(Gdk.Surface surface){
			return is_state_hint_supported(surface,WindowStateHint.DEMANDS_ATTENTION);
		}
		public bool get_attention(Gdk.Surface surface){
			return get_state_hint(surface,WindowStateHint.DEMANDS_ATTENTION);
		}
		public void set_attention(Gdk.Surface surface,bool enable){
			set_state_hint(surface,WindowStateHint.DEMANDS_ATTENTION,enable);
		}
	}
	#endif
}

