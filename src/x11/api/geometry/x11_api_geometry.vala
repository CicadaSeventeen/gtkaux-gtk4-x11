[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
[CCode (cprefix = "GtkAuxX11", lower_case_cprefix = "gtkaux_x11_")]
	namespace X11Lib {
		public enum AlignHorizontal{
			//NONE,
			LEFT,
			MID,
			RIGHT;
		}
		public enum AlignVertical{
			//NONE,
			TOP,
			MID,
			BOTTOM;
		}

		//public const int ALIGN_HORZ_NONE = AlignHorizontal.NONE;
		public const int ALIGN_HORZ_LEFT = AlignHorizontal.LEFT;
		public const int ALIGN_HORZ_MID = AlignHorizontal.MID;
		public const int ALIGN_HORZ_RIGHT = AlignHorizontal.RIGHT;

		//public const int ALIGN_VERT_NONE = AlignVertical.NONE;
		public const int ALIGN_VERT_TOP = AlignVertical.TOP;
		public const int ALIGN_VERT_MID = AlignVertical.MID;
		public const int ALIGN_VERT_BOTTOM = AlignVertical.BOTTOM;

		// move 用在after map
		public void move(GLib.Object? window, int x, int y) {
			Internal.X11Lib.XDisplay.Geometry.move(get_xdisplay(window),get_xid(window),x,y);
		}
		public void resize(GLib.Object? window, int width, int height) {
			Internal.X11Lib.XDisplay.Geometry.resize(get_xdisplay(window),get_xid(window),width,height);
		}
		public void move_resize(GLib.Object? window,  int x, int y, int width, int height) {
			Internal.X11Lib.XDisplay.Geometry.move_resize(get_xdisplay(window),get_xid(window),x,y,width,height);
		}
		public void get_position(GLib.Object? window,out int x,out int y) {
			var tmp = get_attrs(window);
			x = tmp.x;
			y = tmp.y;
		}
		public void get_size(GLib.Object? window,out int width,out int height) {
			var tmp = get_attrs(window);
			width = tmp.width;
			height = tmp.height;
		}
		public void get_geometry(GLib.Object? window,out int x,out int y,out int width,out int height) {
			var tmp = get_attrs(window);
			x = tmp.x;
			y = tmp.y;
			width = tmp.width;
			height = tmp.height;
		}
		public void get_monitor_geometry(GLib.Object? window,out int x,out int y,out int width,out int height){
			unowned var? xdisplay = get_xdisplay(window);
			var xid = get_xid(window);
			if(xdisplay == null|| xid == X.None){
				x = 0;
				y = 0;
				height = 0;
				width = 0;
			}
			else {
				Internal.X11Lib.XDisplay.C.Xrandr.get_monitor_geometry(xdisplay,xid,out x,out y,out width,out height);
			}
		}

		public void set_position(GLib.Object? window,int x,int y,int align_horz,int align_vert){
			int width,height;
			get_size(window,out width,out height);
			int x_tmp = modify_horz(x,width,align_horz,false);
			int y_tmp = modify_vert(y,height,align_vert,false);
			move(window,x_tmp,y_tmp);
		}

		public void set_size(GLib.Object? window,int width,int height,int align_horz,int align_vert){
			int x,y,width_old,height_old;
			get_geometry(window,out x,out y,out width_old,out height_old);
			int x_tmp = modify_horz(x,width_old,align_horz,true);
			int y_tmp = modify_vert(y,height_old,align_vert,true);
			int x_fin = modify_horz(x_tmp,width,align_horz,false);
			int y_fin = modify_vert(y_tmp,height,align_vert,false);
			move_resize(window,x_fin,y_fin,width,height);
		}

		public void set_geometry(GLib.Object? window,int x,int y,int width,int height,int align_horz,int align_vert){
			int x_tmp = modify_horz(x,width,align_horz,false);
			int y_tmp = modify_vert(y,height,align_vert,false);
// 			stdout.printf("%d %d %d %d\n",x_tmp,y_tmp,width,height);
			move_resize(window,x_tmp,y_tmp,width,height);
		}

		internal static int modify_horz(int x,int width,int align_horz,bool reverse){
			int symbol = (reverse == true)? 1 : -1;
			switch(align_horz){
				case (int)AlignHorizontal.RIGHT:{
					return x + width*symbol;
				}
				case (int)AlignHorizontal.MID:{
					return x + width*symbol/2;
				}
				case (int)AlignHorizontal.LEFT:
				default:{
					return x;
				}
			}
		}

		internal static int modify_vert(int y,int height,int align_vert,bool reverse){
			int symbol = (reverse == true)? 1 : -1;
			switch(align_vert){
				case (int)AlignVertical.BOTTOM:{
					return y + height*symbol;
				}
				case (int)AlignVertical.MID:{
					return y + height*symbol/2;
				}
				case (int)AlignVertical.TOP:
				default:{
					return y;
				}
			}
		}
	}
}
