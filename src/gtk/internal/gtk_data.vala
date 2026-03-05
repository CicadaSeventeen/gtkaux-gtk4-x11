[CCode (cprefix = "gtkaux_", lower_case_cprefix = "gtkaux_")]
namespace GtkAux{
	namespace Internal {
		[CCode (cprefix = "gtkaux_internal_gtk_", lower_case_cprefix = "gtkaux_internal_gtk_")]
		namespace GtkLib {

			internal enum SignalMode{
				REALIZE, //尽量不要使用它，在realize之前，gdk层的可及没有保障
				AFTER_REALIZE,
				MAP,
				AFTER_MAP,
				NONE;
				public bool is_done(Gtk.Window window){
					switch(this){
						case SignalMode.REALIZE:
						case SignalMode.AFTER_REALIZE:
							return window.get_realized();
						case SignalMode.MAP:
						case SignalMode.AFTER_MAP:
							return window.get_mapped();
						default:
							return false;
					}
				}
			}

			internal class DataArray: Object{
				internal int[] array;
				internal DataArray(int length){
					this.array = new int[length];
				}
				internal DataArray.with_array(int[] array){
					this.set_array(array);
				}
				internal void set_array(int[] array){
					this.array = array;
				}
			}

			internal abstract class DataHelper<T>: Object{
				internal weak Gtk.Window window;
				internal string key;
				internal SignalMode signal_mode;

				internal DataHelper(Gtk.Window window,string key,SignalMode signal_mode){
					this.window = window;
					this.key = key;
					this.signal_mode = signal_mode;
				}
				internal unowned T? get_content(){
					return this.window.get_data<T>(this.key);
				}
				internal bool has_content(){
					return (this.get_content() == null)?false:true;
				}
				internal bool is_done(){
					return this.signal_mode.is_done(this.window);
				}
				internal void link(T content){
					this.window.set_data<T>(this.key,content);
					this.link_func();
				}
				internal abstract void func_exec();

				protected void link_func(){
					switch(this.signal_mode){
						case SignalMode.REALIZE:
							// 必须ref一次，不然因为DataHelper没有所有权，直接就被注销了
							this.ref();
							((Gtk.Widget)this.window).realize.connect(()=>{this.func_exec();this.unref();});
							//记得unref
							break;
						case SignalMode.AFTER_REALIZE:
							this.ref();
							((Gtk.Widget)this.window).realize.connect_after(()=>{this.func_exec();this.unref();});
							break;
						case SignalMode.MAP:
							this.ref();
							((Gtk.Widget)this.window).map.connect(()=>{this.func_exec();this.unref();});
							break;
						case SignalMode.AFTER_MAP:
							this.ref();
							((Gtk.Widget)this.window).map.connect_after(()=>{this.func_exec();this.unref();});
							break;
						default:
							;
							break;
					}
				}
			}

			internal abstract class ArrayHelper: DataHelper<DataArray> {
				internal ArrayHelper(Gtk.Window window,string key,SignalMode signal_mode){
					base(window,key,signal_mode);
				}
				internal unowned int[]? get_array(){
					if(this.has_content()){return this.get_content().array;}
					else{return null;}
				}
				internal int get_array_as_ref(out unowned int[]? array){
					if(this.has_content()){
						array = this.get_content().array;
						return 0;
					}
					else{
						array = null;
						return 1;
					}
				}
				private void link_array(int[] array){
					this.link(new DataArray.with_array(array));
				}
				private void reset_array(int[] array){
					this.get_content().set_array(array);
				}
				internal void set_array(int[] array){
					if(this.has_content()){
						this.reset_array(array);
					}else{
						this.link_array(array);
					}
				}
			}

			internal class OverrideRedirectHelper: ArrayHelper {
				internal OverrideRedirectHelper(Gtk.Window window){
					base(window,"OverrideRedirect",SignalMode.AFTER_REALIZE);
				}
				internal void set_(bool item){
					var tmp = new int[1];
					tmp[0] = (int)item;
					this.set_array(tmp);
				}
				internal bool get_(){
					unowned int[]? tmp = this.get_array();
					if(tmp!=null && tmp.length == 1){
						return (bool)tmp[0];
					}else{return false;}
				}
				internal override void func_exec(){
					var? tmp = this.get_();
					if(tmp!=null){GtkAux.X11Lib.set_override_redirect(this.window,tmp);}
				}

				internal void set_smart(bool enable){
					if(this.is_done()){
						GtkAux.X11Lib.set_override_redirect(this.window,enable);
					}
					else{
						this.set_(enable);
					}
				}
				internal bool? get_smart(){
					if(this.is_done()){
						return GtkAux.X11Lib.get_override_redirect(this.window);
					}
					else{
						return this.get_();
					}
				}
			}

			internal class DesktopNumberHelper: ArrayHelper {
				internal DesktopNumberHelper(Gtk.Window window){
					base(window,"DesktopNumber",SignalMode.MAP);
				}
				internal void set_(int item){
					var tmp = new int[1];
					tmp[0] = item;
					this.set_array(tmp);
				}
				internal int? get_(){
					unowned int[]? tmp = this.get_array();
					if(tmp!=null && tmp.length == 1){
						return tmp[0];
					}else{return null;}
				}
				internal override void func_exec(){
					var? tmp = this.get_();
					if(tmp!=null){GtkAux.X11Lib.set_desktop_number(this.window,tmp);}
				}

				internal void set_smart(int desktop_number){
					if(this.is_done()){
						GtkAux.X11Lib.set_desktop_number(this.window,desktop_number);
					}
					else{
						this.set_(desktop_number);
					}
				}
				internal int? get_smart(){
					if(this.is_done()){
						return GtkAux.X11Lib.get_desktop_number(this.window);
					}
					else{
						return this.get_();
					}
				}
			}

			internal class ScreenMarginHelper: ArrayHelper {
				internal ScreenMarginHelper(Gtk.Window window){
					base(window,"ScreenMargin",SignalMode.AFTER_REALIZE);
				}
				internal void set_by_array(int[] item){
					if(item.length!=4){warning("length not expected.");}
					this.set_array(item);
				}
				internal int[]? get_by_array(){
					int[]? tmp = this.get_array();
					if(tmp!=null && tmp.length == 4){
						return tmp;
					}else{return null;}
				}
				internal void set_(int top,int right,int bottom,int left){
					int[] tmp = new int[4];
					tmp[0] = top;
					tmp[1] = right;
					tmp[2] = bottom;
					tmp[3] = left;
					this.set_by_array(tmp);
				}
				internal void get_(out int top,out int right,out int bottom,out int left){
					int[]? tmp = this.get_by_array();
					if(tmp!=null && tmp.length == 4){
						top = tmp[0];
						right = tmp[1];
						bottom = tmp[2];
						left = tmp[3];
					}
					else{
						top = 0;
						right = 0;
						bottom = 0;
						left = 0;
					}
				}
				internal override void func_exec(){
					int top,right,bottom,left;
					this.get_(out top,out right,out bottom,out left);
					GtkAux.X11Lib.set_screen_margin(this.window,top,right,bottom,left);
				}

				internal void set_smart(int top,int right,int bottom,int left){
					if(this.is_done()){
						GtkAux.X11Lib.set_screen_margin(this.window,top,right,bottom,left);
					}
					else{
						this.set_(top,right,bottom,left);
					}
				}
				internal void get_smart(out int top,out int right,out int bottom,out int left){
					if(this.is_done()){
						GtkAux.X11Lib.get_screen_margin(this.window,out top,out right,out bottom,out left);
					}
					else{
						this.get_(out top,out right,out bottom,out left);
					}
				}
			}

			internal class MoveGeometryHelper: ArrayHelper {
				internal MoveGeometryHelper(Gtk.Window window){
					base(window,"MoveGeometry",SignalMode.AFTER_MAP);
				}
				internal void set_by_array(int[] item){
					if(item.length!=6){warning("length not expected.");}
					this.set_array(item);
				}
				internal int[]? get_by_array(){
					int[]? tmp = this.get_array();
					if(tmp!=null && tmp.length == 6){
						return tmp;
					}else{return null;}
				}
				internal void set_(int x,int y,int width,int height,bool move,bool resize){
					unowned int[]? tmp;
					this.get_array_as_ref(out tmp);
					if(tmp!=null && tmp.length == 6){
						if(move==true){
							tmp[0] = x;
							tmp[1] = y;
							tmp[4] = 1;
						}
						if(resize==true){
							tmp[2] = width;
							tmp[3] = height;
							tmp[5] = 1;
						}
					}
					else{
						int[] new_array = {x,y,width,height,(int)move,(int)resize};
						this.set_by_array(new_array);
					}

				}
				internal void get_(out int x,out int y,out int width,out int height,out bool move,out bool resize){
					int[]? tmp = this.get_by_array();
					if(tmp!=null && tmp.length == 6){
						x = tmp[0];
						y = tmp[1];
						width = tmp[2];
						height = tmp[3];
						move = (bool)tmp[4];
						resize = (bool)tmp[5];
					}
					else{
						x = 0;
						y = 0;
						width = 0;
						height = 0;
						move = false;
						resize = false;
					}
				}
				internal override void func_exec(){
					int x,y,width,height;
					bool move,resize;
					this.get_(out x,out y,out width,out height,out move,out resize);
					if(move == true && resize == true){
						GtkAux.X11Lib.move_resize(this.window,x,y,width,height);
					}
					else if(move == true && resize == false){
						GtkAux.X11Lib.move(this.window,x,y);
					}
					else if(move == false && resize == true){
						GtkAux.X11Lib.resize(this.window,width,height);
					}
				}

				internal void set_smart(int x,int y,int width,int height,bool move,bool resize){
					if(this.is_done()){
						if(move == true && resize == true){
							GtkAux.X11Lib.move_resize(this.window,x,y,width,height);
						}
						else if(move == true && resize == false){
							GtkAux.X11Lib.move(this.window,x,y);
						}
						else if(move == false && resize == true){
							GtkAux.X11Lib.resize(this.window,width,height);
						}
					}
					else{
						this.set_(x,y,width,height,move,resize);
					}
				}
				internal void get_smart(out int x,out int y,out int width,out int height){
					if(this.is_done()){
						GtkAux.X11Lib.get_geometry(this.window,out x,out y,out width,out height);
					}
					else{
						bool move,resize;
						this.get_(out x,out y,out width,out height,out move,out resize);
					}
				}
			}

			internal class WindowTypeHintHelper: ArrayHelper {
				internal WindowTypeHintHelper(Gtk.Window window){
					base(window,"WindowTypeHint",SignalMode.AFTER_REALIZE);
				}
				internal void set_(int item){
					var tmp = new int[1];
					tmp[0] = (int)item;
					this.set_array(tmp);
				}
				internal int? get_(){
					unowned int[]? tmp = this.get_array();
					if(tmp!=null && tmp.length == 1){
						return tmp[0];
					}else{return null;}
				}
				internal override void func_exec(){
					var? tmp = this.get_();
					if(tmp!=null){GtkAux.X11Lib.set_window_type_hint(this.window,tmp);}
				}


				internal void set_smart(int window_type_hint){
					if(this.is_done()){
						GtkAux.X11Lib.set_window_type_hint(this.window,window_type_hint);
					}
					else{
						this.set_(window_type_hint);
					}
				}
				internal int? get_smart(){
					if(this.is_done()){
						return GtkAux.X11Lib.get_window_type_hint(this.window);
					}
					else{
						return this.get_();
					}
				}
			}

			internal class WindowStateHintHelper: ArrayHelper {
				internal WindowStateHintHelper(Gtk.Window window){
					base(window,"WindowStateHint",SignalMode.MAP);
				}
				internal void set_(int index,bool enable){
					unowned int[]? tmp;
					this.get_array_as_ref(out tmp);
					if(tmp!=null && tmp.length == GtkAux.X11Lib.WindowStateHint.length()){
						tmp[index] = (int)enable;
					}else{
						int[] new_array = new int[GtkAux.X11Lib.WindowStateHint.length()];
						new_array[index] = (int)enable;
						this.set_array(new_array);
					}
				}
				internal bool? get_(int index){
					unowned int[]? tmp = this.get_array();
					if(tmp!=null && tmp.length == GtkAux.X11Lib.WindowStateHint.length()){
						return (bool)tmp[index];
					}else{return null;}
				}
				private int[]? get_by_array(){
					int[]? tmp = this.get_array();
					if(tmp!=null && tmp.length == GtkAux.X11Lib.WindowStateHint.length()){
						return tmp;
					}else{return null;}
				}
				internal override void func_exec(){
					var? tmp = this.get_by_array();
					if(tmp != null){
						for(int count = 0;count < tmp.length;count++){
							GtkAux.X11Lib.set_window_state_hint(this.window,count,(bool)tmp[count]);
						}
					}
				}

				internal void set_smart(int window_state_hint,bool enable){
					if(this.is_done()){
						GtkAux.X11Lib.set_window_state_hint(this.window,window_state_hint,enable);
					}
					else{
						this.set_(window_state_hint,enable);
					}
				}
				internal bool get_smart(int window_state_hint){
					if(this.is_done()){
						return GtkAux.X11Lib.get_window_state_hint(this.window,window_state_hint);
					}
					else{
						return this.get_(window_state_hint);
					}
				}
			}
		}
	}
}
