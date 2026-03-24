[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
	[CCode (cprefix = "GtkAuxX11", lower_case_cprefix = "gtkaux_gdk_x11_")]
namespace GdkX11Lib {
		public void get_position(Gdk.Window window,out int x,out int y){
			X11Lib.get_position(window,out x,out y);
		}
		public void set_position(Gdk.Window window,int x,int y,int align_horz,int align_vert){
			X11Lib.set_position(window,x,y,align_horz,align_vert);
		}

		public void get_size(Gdk.Window window,out int width,out int height){
			X11Lib.get_size(window,out width,out height);
		}
		public void set_size(Gdk.Window window,int width,int height,int align_horz,int align_vert){
			X11Lib.set_size(window,width,height,align_horz,align_vert);
		}

		public void get_geometry(Gdk.Window window,out int x,out int y,out int width,out int height){
			X11Lib.get_geometry(window,out x,out y,out width,out height);
		}
		public void set_geometry(Gdk.Window window,int x,int y,int width,int height,int align_horz,int align_vert){
			X11Lib.set_geometry(window,x,y,width,height,align_horz,align_vert);
		}

		public void move(Gdk.Window window,int x,int y){
			X11Lib.move(window,x,y);
		}
		public void resize(Gdk.Window window,int width,int height){
			X11Lib.resize(window,width,height);
		}
		public void move_resize(Gdk.Window window,int x,int y,int width,int height){
			X11Lib.move_resize(window,x,y,width,height);
		}

		public void set_position_advanced(Gdk.Window window,
			GLib.Value? x,GLib.Value? y,
			GLib.Value? margin_top,GLib.Value? margin_right,GLib.Value? margin_bottom,GLib.Value? margin_left,
			int align_horz,int align_vert
		){
			X11Lib.set_position_advanced(window,x,y,margin_top,margin_right,margin_bottom,margin_left,align_horz,align_vert);
		}

		public void set_size_advanced(Gdk.Window window,
			GLib.Value? width,GLib.Value? height,
			GLib.Value? margin_top,GLib.Value? margin_right,GLib.Value? margin_bottom,GLib.Value? margin_left,
			int align_horz,int align_vert
		){
			X11Lib.set_size_advanced(window,width,height,margin_top,margin_right,margin_bottom,margin_left,align_horz,align_vert);
		}

		public void set_geometry_advanced(Gdk.Window window,
			GLib.Value? x,GLib.Value? y,GLib.Value? width,GLib.Value? height,
			GLib.Value? margin_top,GLib.Value? margin_right,GLib.Value? margin_bottom,GLib.Value? margin_left,
			int align_horz,int align_vert
		){
			X11Lib.set_geometry_advanced(window,x,y,width,height,margin_top,margin_right,margin_bottom,margin_left,align_horz,align_vert);
		}

		public void set_screen_margin_advanced(Gdk.Window window,
			GLib.Value? margin_top,GLib.Value? margin_right,GLib.Value? margin_bottom,GLib.Value? margin_left
		){
			X11Lib.set_screen_margin_advanced(window,margin_top,margin_right,margin_bottom,margin_left);
		}

		/*
		public class GeometryTarget: X11Lib.GeometryTarget{
			public GeometryTarget(Gdk.Window window)
			{
				base(window);
			}
		}
		public class ScreenMarginTarget: X11Lib.ScreenMarginTarget{
			public ScreenMarginTarget(Gdk.Window window)
			{
				base(window);
			}
		}
		public int get_width_int_from_percent(Gdk.Window window,double width_percent,int margin_left,int margin_right){
			return X11Lib.get_width_int_from_percent(window,width_percent,margin_left,margin_right);
		}
		public int get_x_int_from_percent(Gdk.Window window,double x_percent,int margin_left,int margin_right){
			return X11Lib.get_x_int_from_percent(window,x_percent,margin_left,margin_right);
		}
		public int get_height_int_from_percent(Gdk.Window window,double height_percent,int margin_top,int margin_bottom){
			return X11Lib.get_height_int_from_percent(window,height_percent,margin_top,margin_bottom);
		}
		public int get_y_int_from_percent(Gdk.Window window,double y_percent,int margin_top,int margin_bottom){
			return X11Lib.get_y_int_from_percent(window,y_percent,margin_top,margin_bottom);
		}
		public int get_horz_margin_int_from_percent(Gdk.Window window,double margin_percent){
			return X11Lib.get_horz_margin_int_from_percent(window,margin_percent);
		}
		public int get_vert_margin_int_from_percent(Gdk.Window window,double margin_percent){
			return X11Lib.get_vert_margin_int_from_percent(window,margin_percent);
		}

		public double get_width_percent_from_int(Gdk.Window window,int width,int margin_left,int margin_right){
			return X11Lib.get_width_percent_from_int(window,width,margin_left,margin_right);
		}
		public double get_x_percent_from_int(Gdk.Window window,int x,int margin_left,int margin_right){
			return X11Lib.get_x_percent_from_int(window,x,margin_left,margin_right);
		}
		public double get_height_percent_from_int(Gdk.Window window,int height,int margin_top,int margin_bottom){
			return X11Lib.get_width_percent_from_int(window,height,margin_top,margin_bottom);
		}
		public double get_y_percent_from_int(Gdk.Window window,int y,int margin_top,int margin_bottom){
			return X11Lib.get_y_percent_from_int(window,y,margin_top,margin_bottom);
		}
		public double get_horz_margin_percent_from_int(Gdk.Window window,int margin){
			return X11Lib.get_horz_margin_percent_from_int(window,margin);
		}
		public double get_vert_margin_percent_from_int(Gdk.Window window,int margin){
			return X11Lib.get_horz_margin_percent_from_int(window,margin);
		}*/
	}
}
