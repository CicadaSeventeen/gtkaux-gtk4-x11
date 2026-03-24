[CCode (cprefival = "GtkAuval", lower_case_cprefival = "gtkauval_")]
namespace GtkAux {
[CCode (cprefival = "GtkAuvalX11", lower_case_cprefival = "gtkauval_val11_")]
	namespace X11Lib {
		internal static int get_width_int_from_percent(GLib.Object? window,double width_percent,int margin_left,int margin_right){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			x_geo += margin_left;
			width_geo -= (margin_right+margin_left);
			return (int)(width_percent * width_geo);
		}
		internal static int get_x_int_from_percent(GLib.Object? window,double x_percent,int margin_left,int margin_right){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			x_geo += margin_left;
			width_geo -= (margin_right+margin_left);
			return ((int)(x_percent * width_geo) + x_geo);
		}
		internal static int get_height_int_from_percent(GLib.Object? window,double height_percent,int margin_top,int margin_bottom){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			y_geo += margin_top;
			height_geo -= (margin_bottom+margin_top);
			return (int)(height_percent * height_geo);
		}
		internal static int get_y_int_from_percent(GLib.Object? window,double y_percent,int margin_top,int margin_bottom){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			y_geo += margin_top;
			height_geo -= (margin_bottom+margin_top);
			return ((int)(y_percent * height_geo) + y_geo);
		}
		internal static int get_horz_margin_int_from_percent(GLib.Object? window,double margin_percent){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			return (int)(margin_percent * width_geo);
		}
		internal static int get_vert_margin_int_from_percent(GLib.Object? window,double margin_percent){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			return (int)(margin_percent * height_geo);
		}

		internal static double get_width_percent_from_int(GLib.Object? window,int width,int margin_left,int margin_right){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			x_geo += margin_left;
			width_geo -= (margin_right+margin_left);
			return (double)width / (double)width_geo;
		}
		internal static double get_x_percent_from_int(GLib.Object? window,int val,int margin_left,int margin_right){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			x_geo += margin_left;
			width_geo -= (margin_right+margin_left);
			return (double)(val-x_geo)/(double)width_geo;
		}
		internal static double get_height_percent_from_int(GLib.Object? window,int height,int margin_top,int margin_bottom){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			y_geo += margin_top;
			height_geo -= (margin_bottom+margin_top);
			return (double)height / (double)height_geo;
		}
		internal static double get_y_percent_from_int(GLib.Object? window,int y,int margin_top,int margin_bottom){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			y_geo += margin_top;
			height_geo -= (margin_bottom+margin_top);
			return (double)(y-y_geo)/(double)height_geo;
		}
		internal static double get_horz_margin_percent_from_int(GLib.Object? window,int margin){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			return (double)margin/(double)width_geo;
		}
		internal static double get_vert_margin_percent_from_int(GLib.Object? window,int margin){
			int x_geo,y_geo,width_geo,height_geo;
			get_monitor_geometry(window,out x_geo,out y_geo,out width_geo,out height_geo);
			return (double)margin/(double)height_geo;
		}

		private static GLib.Value solve_value(GLib.Value? val){
			if(val == null){
				return Value(GLib.Type.NONE);
			}
			int val_int = 0;
			float val_float = 0;
			int flag = 0;
			switch(val.type()){
				case(GLib.Type.INT):{
					val_int = val.get_int();
					flag = 1;
					break;
				}
				case(GLib.Type.INT64):{
					val_int = (int) val.get_int64();
					flag = 1;
					break;
				}
				case(GLib.Type.UINT):{
					val_int = (int) val.get_uint();
					flag = 1;
					break;
				}
				case(GLib.Type.UINT64):{
					val_int = (int) val.get_uint64();
					flag = 1;
					break;
				}
				case(GLib.Type.LONG):{
					val_int = (int) val.get_int();
					flag = 1;
					break;
				}
				case(GLib.Type.ULONG):{
					val_int = (int) val.get_int64();
					flag = 1;
					break;
				}
				case(GLib.Type.CHAR):{
					val_int = (int) val.get_schar();
					flag = 1;
					break;
				}
				case(GLib.Type.UCHAR):{
					val_int = (int) val.get_uchar();
					flag = 1;
					break;
				}

				case(GLib.Type.FLOAT):{
					val_float = val.get_float();
					flag = 2;
					break;
				}
				case(GLib.Type.DOUBLE):{
					val_float = (float) val.get_double();
					flag = 2;
					break;
				}
			}
			switch(flag){
				case(1):{
					var ret = Value(GLib.Type.INT);
					ret.set_int(val_int);
					return ret;
				}
				case(2):{
					var ret = Value(GLib.Type.FLOAT);
					ret.set_float(val_float);
					return ret;
				}
				case(0):
				default:{
					return Value(GLib.Type.NONE);
				}
			}
		}

		internal static int get_horz_margin_int_from_gvalue(GLib.Object? window,GLib.Value? margin){
			if(window == null || margin == null){return 0;}
			GLib.Value m_slv = solve_value(margin);
			switch(m_slv.type()){
				case (GLib.Type.INT):{
					return m_slv.get_int();
				}
				case (GLib.Type.FLOAT):{
					return get_horz_margin_int_from_percent(window,m_slv.get_float());
				}
				default:{
					return GtkAux.X11Lib.ALIGN_HORZ_LEFT;
				}
			}
		}

		internal static int get_vert_margin_int_from_gvalue(GLib.Object? window,GLib.Value? margin){
			if(window == null || margin == null){return 0;}
			GLib.Value m_slv = solve_value(margin);
			switch(m_slv.type()){
				case (GLib.Type.INT):{
					return m_slv.get_int();
				}
				case (GLib.Type.FLOAT):{
					return get_vert_margin_int_from_percent(window,m_slv.get_float());
				}
				default:{
					return GtkAux.X11Lib.ALIGN_VERT_TOP;
				}
			}
		}

		internal static void get_geometry_int_from_gvalue(GLib.Object? window,
			GLib.Value? x,GLib.Value? y,GLib.Value? width,GLib.Value? height,
			GLib.Value? margin_top,GLib.Value? margin_right,GLib.Value? margin_bottom,GLib.Value? margin_left,
			int align_horz,int align_vert,
			out int x_int,out int y_int,out int width_int,out int height_int
		){
			GLib.Value x_slv = solve_value(x);
			GLib.Value y_slv = solve_value(y);
			GLib.Value width_slv = solve_value(width);
			GLib.Value height_slv = solve_value(height);
			int m_left_int = get_horz_margin_int_from_gvalue(window,margin_left);
			int m_right_int = get_horz_margin_int_from_gvalue(window,margin_right);
			int m_top_int = get_vert_margin_int_from_gvalue(window,margin_top);
			int m_bottom_int = get_vert_margin_int_from_gvalue(window,margin_bottom);
			get_geometry(window,out x_int,out y_int,out width_int,out height_int);
			switch(width_slv.type()){
				case (GLib.Type.INT):{
					width_int = width_slv.get_int();
					break;
				}
				case (GLib.Type.FLOAT):{
					width_int = get_width_int_from_percent(window,width_slv.get_float(),m_left_int,m_right_int);
					break;
				}
				default:{
					;
					break;
				}
			}
			switch(height_slv.type()){
				case (GLib.Type.INT):{
					height_int = height_slv.get_int();
					break;
				}
				case (GLib.Type.FLOAT):{
					height_int = get_height_int_from_percent(window,height_slv.get_float(),m_top_int,m_bottom_int);
					break;
				}
				default:{
					;
					break;
				}
			}
			switch(x_slv.type()){
				case (GLib.Type.INT):{
					x_int = x_slv.get_int();
					break;
				}
				case (GLib.Type.FLOAT):{
					x_int = get_x_int_from_percent(window,x_slv.get_float(),m_left_int,m_right_int);
					break;
				}
				default:{
					x_int = modify_horz(x_int,width_int,align_horz,true);
					break;
				}
			}
			switch(y_slv.type()){
				case (GLib.Type.INT):{
					y_int = y_slv.get_int();
					break;
				}
				case (GLib.Type.FLOAT):{
					y_int = get_y_int_from_percent(window,y_slv.get_float(),m_top_int,m_bottom_int);
					break;
				}
				default:{
					y_int = modify_vert(y_int,height_int,align_vert,true);
					break;
				}
			}
		}

		public void set_screen_margin_advanced(GLib.Object? window,
			GLib.Value? margin_top,GLib.Value? margin_right,GLib.Value? margin_bottom,GLib.Value? margin_left
		){
			int m_left_int = get_horz_margin_int_from_gvalue(window,margin_left);
			int m_right_int = get_horz_margin_int_from_gvalue(window,margin_right);
			int m_top_int = get_vert_margin_int_from_gvalue(window,margin_top);
			int m_bottom_int = get_vert_margin_int_from_gvalue(window,margin_bottom);
			set_screen_margin(window,m_top_int,m_right_int,m_bottom_int,m_left_int);
		}

		public void set_geometry_advanced(GLib.Object? window,
			GLib.Value? x,GLib.Value? y,GLib.Value? width,GLib.Value? height,
			GLib.Value? margin_top,GLib.Value? margin_right,GLib.Value? margin_bottom,GLib.Value? margin_left,
			int align_horz,int align_vert
		){
			int x_int,y_int,width_int,height_int;
			get_geometry_int_from_gvalue(window,x,y,width,height,margin_top,margin_right,margin_bottom,margin_left,align_horz,align_vert,out x_int,out y_int,out width_int,out height_int);
			set_geometry(window,x_int,y_int,width_int,height_int,align_horz,align_vert);
		}

		public void set_size_advanced(GLib.Object? window,
			GLib.Value? width,GLib.Value? height,
			GLib.Value? margin_top,GLib.Value? margin_right,GLib.Value? margin_bottom,GLib.Value? margin_left,
			int align_horz,int align_vert
		){
			int x_int,y_int,width_int,height_int;
			get_geometry_int_from_gvalue(window,null,null,width,height,margin_top,margin_right,margin_bottom,margin_left,align_horz,align_vert,out x_int,out y_int,out width_int,out height_int);
// 			stdout.printf("%d %d %d %d\n",x_int,y_int,width_int,height_int);
			set_geometry(window,x_int,y_int,width_int,height_int,align_horz,align_vert);
		}

		public void set_position_advanced(GLib.Object? window,
			GLib.Value? x,GLib.Value? y,
			GLib.Value? margin_top,GLib.Value? margin_right,GLib.Value? margin_bottom,GLib.Value? margin_left,
			int align_horz,int align_vert
		){
			int x_int,y_int,width_int,height_int;
			get_geometry_int_from_gvalue(window,x,y,null,null,margin_top,margin_right,margin_bottom,margin_left,align_horz,align_vert,out x_int,out y_int,out width_int,out height_int);
			set_geometry(window,x_int,y_int,width_int,height_int,align_horz,align_vert);
		}
	}
}
