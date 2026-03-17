[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
[CCode (cprefix = "GtkAuxGtkX11", lower_case_cprefix = "gtkaux_gtk_x11_")]
	namespace GtkX11Lib {
		public class GeometryTarget: X11Lib.GeometryTarget{
			public GeometryTarget(Gtk.Window window)
			{
				base(window);
			}
			public void queue_apply(){
				if(this.window is Gtk.Window && (!Internal.GtkLib.SignalMode.AFTER_MAP.is_done((Gtk.Window)this.window))){
					var helper = new Internal.GtkLib.WindowHelper_Geometry.with_data((Gtk.Window)this.window,this);
				}else{
					this.apply();
				}
			}
		}
		public class ScreenMarginTarget: X11Lib.ScreenMarginTarget{
			public ScreenMarginTarget(Gtk.Window window)
			{
				base(window);
			}
			public void queue_apply(){
				if(this.window is Gtk.Window && (!Internal.GtkLib.SignalMode.AFTER_REALIZE.is_done((Gtk.Window)this.window))){
					var helper = new Internal.GtkLib.WindowHelper_ScreenMargin.with_data((Gtk.Window)this.window,this);
				}else{
					this.apply();
				}
			}
		}

		public void set_screen_margin(Gtk.Window window,int top,int right,int bottom,int left){
			var tmp = new ScreenMarginTarget(window);
			tmp.top.as_int = top;
			tmp.bottom.as_int = bottom;
			tmp.left.as_int = left;
			tmp.right.as_int = right;
			tmp.queue_apply();
		}

		public void set_position(Gtk.Window window,int x,int y,int align_horz,int align_vert){
			var tmp = new GeometryTarget(window);
			tmp.x.as_int = x;
			tmp.y.as_int = y;
			tmp.align_horz = align_horz;
			tmp.align_vert = align_vert;
			tmp.queue_apply();
		}

		public void set_size(Gtk.Window window,int width,int height,int align_horz,int align_vert){
			var tmp = new GeometryTarget(window);
			tmp.width.as_int = width;
			tmp.height.as_int = height;
			tmp.align_horz = align_horz;
			tmp.align_vert = align_vert;
			tmp.queue_apply();
		}

		public void set_geometry(Gtk.Window window,int x,int y,int width,int height,int align_horz,int align_vert){
			var tmp = new GeometryTarget(window);
			tmp.x.as_int = x;
			tmp.y.as_int = y;
			tmp.width.as_int = width;
			tmp.height.as_int = height;
			tmp.align_horz = align_horz;
			tmp.align_vert = align_vert;
			tmp.queue_apply();
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
