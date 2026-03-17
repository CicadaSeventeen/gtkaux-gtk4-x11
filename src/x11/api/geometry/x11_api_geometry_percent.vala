[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
[CCode (cprefix = "GtkAuxX11", lower_case_cprefix = "gtkaux_x11_")]
	namespace X11Lib {
		public int get_width_int_from_percent(GLib.Object? window,double width_percent,int margin_left,int margin_right){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			x_geo += margin_left;
			width_geo -= (margin_right+margin_left);
			return (int)(width_percent * width_geo);
		}
		public int get_x_int_from_percent(GLib.Object? window,double x_percent,int margin_left,int margin_right){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			x_geo += margin_left;
			width_geo -= (margin_right+margin_left);
			return ((int)(x_percent * width_geo) + x_geo);
		}
		public int get_height_int_from_percent(GLib.Object? window,double height_percent,int margin_top,int margin_bottom){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			y_geo += margin_top;
			height_geo -= (margin_bottom+margin_top);
			return (int)(height_percent * height_geo);
		}
		public int get_y_int_from_percent(GLib.Object? window,double y_percent,int margin_top,int margin_bottom){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			y_geo += margin_top;
			height_geo -= (margin_bottom+margin_top);
			return ((int)(y_percent * height_geo) + y_geo);
		}
		public int get_horz_margin_int_from_percent(GLib.Object? window,double margin_percent){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			return (int)(margin_percent * width_geo);
		}
		public int get_vert_margin_int_from_percent(GLib.Object? window,double margin_percent){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			return (int)(margin_percent * height_geo);
		}

		public double get_width_percent_from_int(GLib.Object? window,int width,int margin_left,int margin_right){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			x_geo += margin_left;
			width_geo -= (margin_right+margin_left);
			return (double)width / (double)width_geo;
		}
		public double get_x_percent_from_int(GLib.Object? window,int x,int margin_left,int margin_right){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			x_geo += margin_left;
			width_geo -= (margin_right+margin_left);
			return (double)(x-x_geo)/(double)width_geo;
		}
		public double get_height_percent_from_int(GLib.Object? window,int height,int margin_top,int margin_bottom){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			y_geo += margin_top;
			height_geo -= (margin_bottom+margin_top);
			return (double)height / (double)height_geo;
		}
		public double get_y_percent_from_int(GLib.Object? window,int y,int margin_top,int margin_bottom){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			y_geo += margin_top;
			height_geo -= (margin_bottom+margin_top);
			return (double)(y-y_geo)/(double)height_geo;
		}
		public double get_horz_margin_percent_from_int(GLib.Object? window,int margin){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			return (double)margin/(double)width_geo;
		}
		public double get_vert_margin_percent_from_int(GLib.Object? window,int margin){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			return (double)margin/(double)height_geo;
		}
	}
}
