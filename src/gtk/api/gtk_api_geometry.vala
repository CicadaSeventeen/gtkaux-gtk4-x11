[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
[CCode (cprefix = "GtkAuxGtkX11", lower_case_cprefix = "gtkaux_gtk_x11_")]
	namespace GtkX11Lib {
// 		public class GeometryTarget: X11Lib.GeometryTarget{
// 			public GeometryTarget(Gtk.Window window)
// 			{
// 				base(window);
// 			}
// 			public void queue_apply(){
// 				if(this.window is Gtk.Window && (!Internal.GtkLib.SignalMode.AFTER_MAP.is_done((Gtk.Window)this.window))){
// 					var helper = new Internal.GtkLib.WindowHelper_Geometry.with_data((Gtk.Window)this.window,this);
// 				}else{
// 					this.apply();
// 				}
// 			}
// 		}
// 		public class ScreenMarginTarget: X11Lib.ScreenMarginTarget{
// 			public ScreenMarginTarget(Gtk.Window window)
// 			{
// 				base(window);
// 			}
// 			public void queue_apply(){
// 				if(this.window is Gtk.Window && (!Internal.GtkLib.SignalMode.AFTER_REALIZE.is_done((Gtk.Window)this.window))){
// 					var helper = new Internal.GtkLib.WindowHelper_ScreenMargin.with_data((Gtk.Window)this.window,this);
// 				}else{
// 					this.apply();
// 				}
// 			}
// 		}

		public void set_screen_margin_advanced(Gtk.Window window,GLib.Value? margin_top,GLib.Value? margin_right,GLib.Value? margin_bottom,GLib.Value? margin_left){
			var helper = new Internal.GtkLib.WindowHelper_ScreenMargin(window);
			if(helper.is_done()){
				X11Lib.set_screen_margin_advanced(window,margin_top,margin_right,margin_bottom,margin_left);
			}else{
				helper.set_info(margin_top,margin_right,margin_bottom,margin_left);
				helper.link_func();
			}
		}

		public void set_screen_margin(Gtk.Window window,int margin_top,int margin_right,int margin_bottom,int margin_left){
			var helper = new Internal.GtkLib.WindowHelper_ScreenMargin(window);
			if(helper.is_done()){
				X11Lib.set_screen_margin(window,margin_top,margin_right,margin_bottom,margin_left);
			}else{
				GLib.Value tmp_top = Value(GLib.Type.INT);
				GLib.Value tmp_right = Value(GLib.Type.INT);
				GLib.Value tmp_bottom = Value(GLib.Type.INT);
				GLib.Value tmp_left = Value(GLib.Type.INT);
				tmp_top.set_int(margin_top);
				tmp_right.set_int(margin_right);
				tmp_bottom.set_int(margin_bottom);
				tmp_left.set_int(margin_left);
				helper.set_info(tmp_top,tmp_right,tmp_bottom,tmp_left);
				helper.link_func();
			}
		}

		public void set_geometry_advanced(Gtk.Window window,
			GLib.Value? x,GLib.Value? y,GLib.Value? width,GLib.Value? height,
			GLib.Value? margin_top,GLib.Value? margin_right,GLib.Value? margin_bottom,GLib.Value? margin_left,
			int align_horz,int align_vert
		){
			var helper = new Internal.GtkLib.WindowHelper_Geometry(window);
			if(helper.is_done()){
				X11Lib.set_geometry_advanced(window,x,y,width,height,margin_top,margin_right,margin_bottom,margin_left,align_horz,align_vert);
			}else{
				helper.set_info(x,y,width,height,margin_top,margin_right,margin_bottom,margin_left,align_horz,align_vert);
				helper.link_func();
			}
		}

		public void set_geometry(Gtk.Window window,
			int x,int y,int width,int height,
			int align_horz,int align_vert
		){
			var helper = new Internal.GtkLib.WindowHelper_Geometry(window);
			if(helper.is_done()){
				X11Lib.set_geometry(window,x,y,width,height,align_horz,align_vert);
			}else{
				GLib.Value tmp_x = Value(GLib.Type.INT);
				GLib.Value tmp_y = Value(GLib.Type.INT);
				GLib.Value tmp_width = Value(GLib.Type.INT);
				GLib.Value tmp_height = Value(GLib.Type.INT);
				tmp_x.set_int(x);
				tmp_y.set_int(y);
				tmp_width.set_int(width);
				tmp_height.set_int(height);
				helper.set_info(tmp_x,tmp_y,tmp_width,tmp_height,null,null,null,null,align_horz,align_vert);
				helper.link_func();
			}
		}

		public void set_size_advanced(Gtk.Window window,
			GLib.Value? width,GLib.Value? height,
			GLib.Value? margin_top,GLib.Value? margin_right,GLib.Value? margin_bottom,GLib.Value? margin_left,
			int align_horz,int align_vert
		){
			var helper = new Internal.GtkLib.WindowHelper_Geometry(window);
			if(helper.is_done()){
				X11Lib.set_size_advanced(window,width,height,margin_top,margin_right,margin_bottom,margin_left,align_horz,align_vert);
			}else{
				GLib.Value? x;
				GLib.Value? y;
				helper.get_position(out x,out y);
				helper.set_info(x,y,width,height,margin_top,margin_right,margin_bottom,margin_left,align_horz,align_vert);
				helper.link_func();
			}
		}

		public void set_position_advanced(Gtk.Window window,
									  GLib.Value? x,GLib.Value? y,
									  GLib.Value? margin_top,GLib.Value? margin_right,GLib.Value? margin_bottom,GLib.Value? margin_left,
									  int align_horz,int align_vert
		){
			var helper = new Internal.GtkLib.WindowHelper_Geometry(window);
			if(helper.is_done()){
				X11Lib.set_size_advanced(window,x,y,margin_top,margin_right,margin_bottom,margin_left,align_horz,align_vert);
			}else{
				GLib.Value? width;
				GLib.Value? height;
				helper.get_size(out width,out height);
				helper.set_info(x,y,width,height,margin_top,margin_right,margin_bottom,margin_left,align_horz,align_vert);
				helper.link_func();
			}
		}

		public void set_size(Gtk.Window window,
								 int width,int height,
								 int align_horz,int align_vert
		){
			var helper = new Internal.GtkLib.WindowHelper_Geometry(window);
			if(helper.is_done()){
				X11Lib.set_size(window,width,height,align_horz,align_vert);
			}else{
				GLib.Value tmp_width = Value(GLib.Type.INT);
				GLib.Value tmp_height = Value(GLib.Type.INT);
				tmp_width.set_int(width);
				tmp_height.set_int(height);
				GLib.Value? x;
				GLib.Value? y;
				helper.get_position(out x,out y);
				helper.set_info(x,y,tmp_width,tmp_height,null,null,null,null,align_horz,align_vert);
				helper.link_func();
			}
		}

		public void set_position(Gtk.Window window,
			int x,int y,
			int align_horz,int align_vert
		){
			var helper = new Internal.GtkLib.WindowHelper_Geometry(window);
			if(helper.is_done()){
				X11Lib.set_position(window,x,y,align_horz,align_vert);
			}else{
				GLib.Value tmp_x = Value(GLib.Type.INT);
				GLib.Value tmp_y = Value(GLib.Type.INT);
				tmp_x.set_int(x);
				tmp_y.set_int(y);
				GLib.Value? width;
				GLib.Value? height;
				helper.get_size(out width,out height);
				helper.set_info(tmp_x,tmp_y,width,height,null,null,null,null,align_horz,align_vert);
				helper.link_func();
			}
		}

		public void move(Gtk.Window window,int x,int y){
			set_position(window,x,y,X11Lib.ALIGN_HORZ_LEFT,X11Lib.ALIGN_VERT_TOP);
		}
		public void resize(Gtk.Window window,int width,int height){
			set_size(window,width,height,X11Lib.ALIGN_HORZ_LEFT,X11Lib.ALIGN_VERT_TOP);
		}
		public void move_resize(Gtk.Window window,int x,int y,int width,int height){
			set_geometry(window,x,y,width,height,X11Lib.ALIGN_HORZ_LEFT,X11Lib.ALIGN_VERT_TOP);
		}
	}
}
