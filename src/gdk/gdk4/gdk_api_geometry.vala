[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
	[CCode (cprefix = "GtkAuxX11", lower_case_cprefix = "gtkaux_gdk_x11_")]
namespace GdkX11Lib {
		public void get_position(Gdk.Surface surface,out int x,out int y){
			X11Lib.get_position(surface,out x,out y);
		}
		public void set_position(Gdk.Surface surface,int x,int y,int align_horz,int align_vert){
			X11Lib.set_position(surface,x,y,align_horz,align_vert);
		}

		public void get_size(Gdk.Surface surface,out int width,out int height){
			X11Lib.get_size(surface,out width,out height);
		}
		public void set_size(Gdk.Surface surface,int width,int height,int align_horz,int align_vert){
			X11Lib.set_size(surface,width,height,align_horz,align_vert);
		}

		public void get_geometry(Gdk.Surface surface,out int x,out int y,out int width,out int height){
			X11Lib.get_geometry(surface,out x,out y,out width,out height);
		}
		public void set_geometry(Gdk.Surface surface,int x,int y,int width,int height,int align_horz,int align_vert){
			X11Lib.set_geometry(surface,x,y,width,height,align_horz,align_vert);
		}

		public void move(Gdk.Surface surface,int x,int y){
			X11Lib.move(surface,x,y);
		}
		public void resize(Gdk.Surface surface,int width,int height){
			X11Lib.resize(surface,width,height);
		}
		public void move_resize(Gdk.Surface surface,int x,int y,int width,int height){
			X11Lib.move_resize(surface,x,y,width,height);
		}
		public class GeometryTarget: X11Lib.GeometryTarget{
			public GeometryTarget(Gdk.Surface surface)
			{
				base(surface);
			}
		}
		public class ScreenMarginTarget: X11Lib.ScreenMarginTarget{
			public ScreenMarginTarget(Gdk.Surface surface)
			{
				base(surface);
			}
		}
		public int get_width_int_from_percent(Gdk.Surface surface,double width_percent,int margin_left,int margin_right){
			return X11Lib.get_width_int_from_percent(surface,width_percent,margin_left,margin_right);
		}
		public int get_x_int_from_percent(Gdk.Surface surface,double x_percent,int margin_left,int margin_right){
			return X11Lib.get_x_int_from_percent(surface,x_percent,margin_left,margin_right);
		}
		public int get_height_int_from_percent(Gdk.Surface surface,double height_percent,int margin_top,int margin_bottom){
			return X11Lib.get_height_int_from_percent(surface,height_percent,margin_top,margin_bottom);
		}
		public int get_y_int_from_percent(Gdk.Surface surface,double y_percent,int margin_top,int margin_bottom){
			return X11Lib.get_y_int_from_percent(surface,y_percent,margin_top,margin_bottom);
		}
		public int get_horz_margin_int_from_percent(Gdk.Surface surface,double margin_percent){
			return X11Lib.get_horz_margin_int_from_percent(surface,margin_percent);
		}
		public int get_vert_margin_int_from_percent(Gdk.Surface surface,double margin_percent){
			return X11Lib.get_vert_margin_int_from_percent(surface,margin_percent);
		}

		public double get_width_percent_from_int(Gdk.Surface surface,int width,int margin_left,int margin_right){
			return X11Lib.get_width_percent_from_int(surface,width,margin_left,margin_right);
		}
		public double get_x_percent_from_int(Gdk.Surface surface,int x,int margin_left,int margin_right){
			return X11Lib.get_x_percent_from_int(surface,x,margin_left,margin_right);
		}
		public double get_height_percent_from_int(Gdk.Surface surface,int height,int margin_top,int margin_bottom){
			return X11Lib.get_width_percent_from_int(surface,height,margin_top,margin_bottom);
		}
		public double get_y_percent_from_int(Gdk.Surface surface,int y,int margin_top,int margin_bottom){
			return X11Lib.get_y_percent_from_int(surface,y,margin_top,margin_bottom);
		}
		public double get_horz_margin_percent_from_int(Gdk.Surface surface,int margin){
			return X11Lib.get_horz_margin_percent_from_int(surface,margin);
		}
		public double get_vert_margin_percent_from_int(Gdk.Surface surface,int margin){
			return X11Lib.get_horz_margin_percent_from_int(surface,margin);
		}
	}
}
