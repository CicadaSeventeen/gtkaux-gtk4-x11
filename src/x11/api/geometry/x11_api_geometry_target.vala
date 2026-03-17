[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux{
[CCode (cprefix = "GtkAuxX11", lower_case_cprefix = "gtkaux_x11_")]
	namespace X11Lib {
		public abstract class Target: GLib.Object {
			internal weak GLib.Object window;
			internal Target(GLib.Object window){
				this.window = window;
			}
		}
		public abstract class Coord: Object{
			protected double _content;
			public bool? is_percent;
			public int as_int{
				get{
					if(this.is_percent == null){
						return 0;
					}
					else if(this.is_percent == true){
						return this.to_int();
					}else{
						return (int)this._content;
					}
				}
				set{
					this._content = (double)value;
					this.is_percent = false;
				}
			}
			public double as_percent{
				get{
					if(this.is_percent == null){
						return (double)0;
					}
					else if(this.is_percent){
						return (double)this._content;
					}else{
						return this.to_percent();
					}
				}
				set{
					this._content = (double)value;
					this.is_percent = true;
				}
			}
			protected abstract double to_percent();
			protected abstract int to_int();

			internal Coord(){
				this._content = 0.0;
				this.is_percent = null;
			}
		}
		public abstract class RectCoord: Coord {
			internal weak GtkAux.X11Lib.GeometryTarget mother;
			internal RectCoord(GtkAux.X11Lib.GeometryTarget mother){
				base();
				this.mother = mother;
			}
		}
		public abstract class MarginCoord: Coord {
			internal weak GtkAux.X11Lib.ScreenMarginTarget mother;
			internal MarginCoord(GtkAux.X11Lib.ScreenMarginTarget mother){
				base();
				this.mother = mother;
			}
		}
		public class XCoord: RectCoord{
			protected override double to_percent(){
				return GtkAux.X11Lib.get_x_percent_from_int(this.mother.window,this.as_int,this.mother.margin.left.as_int,this.mother.margin.right.as_int);
			}
			protected override int to_int(){
				return GtkAux.X11Lib.get_x_int_from_percent(this.mother.window,this.as_percent,this.mother.margin.left.as_int,this.mother.margin.right.as_int);
			}
			public XCoord(GtkAux.X11Lib.GeometryTarget mother){
				base(mother);
			}
		}
		public class YCoord: RectCoord{
			protected override double to_percent(){
				return GtkAux.X11Lib.get_y_percent_from_int(this.mother.window,this.as_int,this.mother.margin.top.as_int,this.mother.margin.bottom.as_int);
			}
			protected override int to_int(){
				return GtkAux.X11Lib.get_y_int_from_percent(this.mother.window,this.as_percent,this.mother.margin.top.as_int,this.mother.margin.bottom.as_int);
			}
			public YCoord(GtkAux.X11Lib.GeometryTarget mother){
				base(mother);
			}
		}
		public class WidthCoord: RectCoord{
			protected override double to_percent(){
				return GtkAux.X11Lib.get_width_percent_from_int(this.mother.window,this.as_int,this.mother.margin.left.as_int,this.mother.margin.right.as_int);
			}
			protected override int to_int(){
				return GtkAux.X11Lib.get_width_int_from_percent(this.mother.window,this.as_percent,this.mother.margin.left.as_int,this.mother.margin.right.as_int);
			}
			public WidthCoord(GtkAux.X11Lib.GeometryTarget mother){
				base(mother);
			}
		}
		public class HeightCoord: RectCoord{
			protected override double to_percent(){
				return GtkAux.X11Lib.get_height_percent_from_int(this.mother.window,this.as_int,this.mother.margin.top.as_int,this.mother.margin.bottom.as_int);
			}
			protected override int to_int(){
				return GtkAux.X11Lib.get_height_int_from_percent(this.mother.window,this.as_percent,this.mother.margin.top.as_int,this.mother.margin.bottom.as_int);
			}
			public HeightCoord(GtkAux.X11Lib.GeometryTarget mother){
				base(mother);
			}
		}
		public class HorzMarginCoord: MarginCoord{
			protected override double to_percent(){
				return GtkAux.X11Lib.get_horz_margin_percent_from_int(this.mother.window,this.as_int);
			}
			protected override int to_int(){
				return GtkAux.X11Lib.get_horz_margin_int_from_percent(this.mother.window,this.as_percent);
			}
			public HorzMarginCoord(GtkAux.X11Lib.ScreenMarginTarget mother){
				base(mother);
			}
		}
		public class VertMarginCoord: MarginCoord{
			protected override double to_percent(){
				return GtkAux.X11Lib.get_vert_margin_percent_from_int(this.mother.window,this.as_int);
			}
			protected override int to_int(){
				return GtkAux.X11Lib.get_vert_margin_int_from_percent(this.mother.window,this.as_percent);
			}
			public VertMarginCoord(GtkAux.X11Lib.ScreenMarginTarget mother){
				base(mother);
			}
		}

		public class GeometryTarget: Target {
			public XCoord x;
			public YCoord y;
			public WidthCoord width;
			public HeightCoord height;
			public int align_horz;
			public int align_vert;
			public bool use_display_strut;
			public ScreenMarginTarget margin;
			public GeometryTarget(GLib.Object window){
				base(window);
				this.margin = new ScreenMarginTarget(window);
				this.x = new XCoord(this);
				this.y = new YCoord(this);
				this.width = new WidthCoord(this);
				this.height = new HeightCoord(this);
				this.align_horz = GtkAux.X11Lib.ALIGN_HORZ_LEFT;
				this.align_vert = GtkAux.X11Lib.ALIGN_VERT_TOP;
				this.use_display_strut = false;
			}

			internal void cal_geometry_info(out int x,out int y,out int width,out int height,out int align_horz,out int align_vert,out bool move,out bool resize){
				if(this.use_display_strut == true){
					int margin_top,margin_right,margin_bottom,margin_left;
					GtkAux.X11Lib.get_total_margin(get_display(this.window),out margin_top,out margin_right,out margin_bottom,out margin_left);
					this.margin.top.as_int = margin_top;
					this.margin.right.as_int = margin_right;
					this.margin.bottom.as_int = margin_bottom;
					this.margin.left.as_int = margin_left;
				}
				align_vert = this.align_vert;
				align_horz = this.align_horz;
				int x_default,y_default,width_default,height_default;
				GtkAux.X11Lib.get_geometry(this.window,out x_default,out y_default,out width_default,out height_default);
				if(this.x.is_percent != null || this.y.is_percent != null){
					move = true;
					x = (this.x.is_percent != null)
					?this.x.as_int
					:x_default;
					y = (this.y.is_percent != null)
					?this.y.as_int
					:y_default;
				}else{
					x = x_default;
					y = y_default;
					move = false;
				}
				if(this.width.is_percent != null && this.height.is_percent != null){
					resize = true;
					width = (this.width.is_percent != null)
					?this.width.as_int
					:width_default;
					height = (this.height.is_percent != null)
					?this.height.as_int
					:height_default;
				}else{
					width = width_default;
					height = height_default;
					resize=false;
				}
			}
			internal void set_geometry(){
				int x_target,y_target,width_target,height_target;
				int align_horz,align_vert;
				bool move,resize;
				this.cal_geometry_info(out x_target,out y_target,out width_target,out height_target,out align_horz,out align_vert,out move,out resize);
				if(move == true){
					if(resize == true){
						GtkAux.X11Lib.set_geometry(this.window,x_target,y_target,width_target,height_target,this.align_horz,this.align_vert);
					}
					else{
						GtkAux.X11Lib.set_position(this.window,x_target,y_target,this.align_horz,this.align_vert);
					}
				}else{
					if(resize == true){
						GtkAux.X11Lib.set_size(this.window,width_target,height_target,this.align_horz,this.align_vert);
					}
				}
			}
			public void apply(){
				this.set_geometry();
			}
			public void queue_apply(){
				if(this.window is Gtk.Window){
					var helper = new Internal.GtkLib.WindowHelper_Geometry((Gtk.Window)this.window);
					helper.content = this;
					helper.link_func();
				}
			}
		}

		public class ScreenMarginTarget: Target {
			public HorzMarginCoord left;
			public HorzMarginCoord right;
			public VertMarginCoord top;
			public VertMarginCoord bottom;

			public ScreenMarginTarget(GLib.Object window){
				base(window);
				this.top = new VertMarginCoord(this);
				this.bottom = new VertMarginCoord(this);
				this.left = new HorzMarginCoord(this);
				this.right = new HorzMarginCoord(this);
				this.top.as_int = 0;
				this.bottom.as_int = 0;
				this.left.as_int = 0;
				this.right.as_int = 0;
			}
			internal void set_screen_margin(){
				GtkAux.X11Lib.set_screen_margin(this.window,this.top.as_int,this.right.as_int,this.bottom.as_int,this.left.as_int);
			}
			public void apply(){
				this.set_screen_margin();
			}
		}
	}
}
