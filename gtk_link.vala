namespace GtkAux{
	namespace X11{
		namespace Helper{
			internal enum LinkType{
				overrideRedirect_bool,
				desktopNum_int,
				margin_gtkBorder,
				moveTarget_geoRect,
				typeHint_typeHintEnum,
				stateHint_byteInt,
// 				//strut_intArray4; TODO
				internal string get_key(){
						return this.to_string();
				}
				internal unowned DataBox? get_databox(Gtk.Window window){
					return DataHelper(window,this).get_databox();
				}
				internal bool is_linked(Gtk.Window window){
					return DataHelper(window,this).has_data();
				}
				internal void exec<T1,T2>(Gtk.Window window,T1 item,T2 addon){
					var box = this.modify_box_or_init<T1,T2>(window,item,addon);
					if(this.is_done(window)){
						box.signal_func();
					}
					else{
						box.link();
					}
				}
				internal DataBox get_databox_or_init(Gtk.Window window){
					if(!this.is_linked(window))
					{
						return this.new_databox(window);
					}else{return this.get_databox(window);}
				}
				private DataBox? new_databox(Gtk.Window window){
					switch(this){
						case LinkType.overrideRedirect_bool:{
							var box = new OverrideRedirectBox(window);
							return (box as DataBox);
						}
						case LinkType.desktopNum_int:{
							var box = new DesktopNumBox(window);
							return (box as DataBox);
						}
						case LinkType.margin_gtkBorder:{
							var box = new MarginBorderBox(window);
							return (box as DataBox);
						}
						case LinkType.moveTarget_geoRect:{
							var box = new MoveRectBox(window);
							return (box as DataBox);
						}
						case LinkType.typeHint_typeHintEnum:{
							var box = new TypeHintBox(window);
							return (box as DataBox);
						}
						case LinkType.stateHint_byteInt:{
							var box = new StateHintBox(window);
							return (box as DataBox);
						}
						default:{
							warning("Type not supported.");
							return null;
						}
					}
				}
				internal SignalMode get_sig_mode(){
					switch(this){
						case LinkType.overrideRedirect_bool:{
							return SignalMode.AFTER_REALIZE;
						}
						case LinkType.desktopNum_int:{
							return SignalMode.AFTER_MAP;
						}
						case LinkType.margin_gtkBorder:{
							return SignalMode.AFTER_REALIZE;
						}
						case LinkType.moveTarget_geoRect:{
							return SignalMode.AFTER_MAP;
						}
						case LinkType.typeHint_typeHintEnum:{
							return SignalMode.AFTER_REALIZE;
						}
						case LinkType.stateHint_byteInt:{
							return SignalMode.MAP;
						}
						default:{
							warning("Type not supported.");
							return SignalMode.NONE;
						}
					}
				}
				internal bool is_done(Gtk.Window window){
					return this.get_sig_mode().is_done(window);
				}
				internal DataBox modify_box_or_init<T1,T2>(Gtk.Window window, T1 item, T2 addon){
					var box = this.get_databox_or_init(window);
					switch(this){
						case LinkType.overrideRedirect_bool:{
							((OverrideRedirectBox)box).set_item((bool)item);
							break;
						}
						case LinkType.desktopNum_int:{
							((DesktopNumBox)box).set_item((int)item);
							break;
						}
						case LinkType.margin_gtkBorder:{
							((MarginBorderBox)box).set_item((Gtk.Border?)item);
							break;
						}
						case LinkType.moveTarget_geoRect:{
							var? tmp = ((MoveRectBox)box).get_item();
							MoveMode mode = (MoveMode)addon;
							if(tmp != null){

								switch(mode){
									case MoveMode.MOVE:{
										var? target = (GdkAux.Pair?)item;
										if(target!=null){tmp.set_pos(target);}
										break;
									}
									case MoveMode.RESIZE:{
										var? target = (GdkAux.Pair?)item;
										if(target!=null){tmp.set_size(target);}
										break;
									}
									case MoveMode.MOVE_RESIZE:{
										var? target = (Gdk.Rectangle?)item;
										if(target!=null){tmp.set_geo(target);}
										break;
									}
									default:{
										;
										break;
									}
								}
							}else{
								warning("Unexpected behavior.");
							}
							break;
						}
						case LinkType.typeHint_typeHintEnum:{
							((TypeHintBox)box).set_item((GdkAux.X11.WindowTypeHint)item);
							break;
						}
						case LinkType.stateHint_byteInt:{
							if((bool)addon){
								((StateHintBox)box).add_hint((GdkAux.X11.WindowStateHint)item);
							}
							else {
								((StateHintBox)box).del_hint((GdkAux.X11.WindowStateHint)item);
							}
							break;
						}
						default:
							critical("Unsupport type.");
							break;
					}
					return box;
				}
			}
			internal struct DataHelper{
				public LinkType link_type;
				public weak Gtk.Window window;

				internal string key(){
					return this.link_type.get_key();
				}
				internal DataHelper(Gtk.Window window,LinkType link_type){
					this.window = window;
					this.link_type = link_type;
				}
				internal unowned DataBox? get_databox(){
					return this.window.get_data<DataBox>(this.key());
				}
				internal bool has_data(){
					return (this.get_databox() == null)?false:true;
				}
			}

			public enum SignalMode{
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
			internal abstract class DataBox<T>: Object {
				protected weak Gtk.Window window;
				internal SignalMode sig_mode;
				protected T item;
				private string key;
				internal virtual T? get_item(){
					return (this.item!=null)?this.item:null;
				}
				internal virtual void set_item(T? data){
					this.item = (data!=null)?data:null;
				}
				internal abstract void signal_func();


				internal DataBox(Gtk.Window window,LinkType link_type){
					this.window = window;
					this.key = link_type.get_key();
					this.sig_mode = link_type.get_sig_mode();
				}
				internal void link(){
					this.window.set_data<DataBox<T>>
					(this.key, this);
					this.connect_signal();
				}

				private void connect_signal(){
					switch(this.sig_mode){
						case SignalMode.REALIZE:
						{
							((Gtk.Widget)this.window).realize.connect(()=>{signal_func();});
							break;
						}
						case SignalMode.AFTER_REALIZE:
						{
							((Gtk.Widget)this.window).realize.connect_after(()=>{signal_func();});
							break;
						}
						case SignalMode.MAP:
						{
							((Gtk.Widget)this.window).map.connect(()=>{signal_func();});
							break;
						}
						case SignalMode.AFTER_MAP:
						{
							((Gtk.Widget)this.window).map.connect_after(()=>{signal_func();});
							break;
						}
						default:
							warning("Unsupport signal");
							break;
					}
				}
			}

			[Flags]
			internal enum MoveMode{
				NONE,

				MOVE,
				RESIZE,
				MOVE_RESIZE;
			}
			internal class GeoRect: Object{
				internal Gdk.Rectangle target;
				private MoveMode mode;
				internal GeoRect(){
					this.target = {};
					this.mode = MoveMode.NONE;
				}
				internal void add_mode(MoveMode mode){
					this.mode = (this.mode | mode);
				}
				internal MoveMode get_mode(){
					if (MoveMode.MOVE_RESIZE in this.mode){
						this.mode = MoveMode.MOVE_RESIZE;
						return this.mode;
					}
					if (MoveMode.MOVE in this.mode){
						if (MoveMode.RESIZE in this.mode){
							this.mode = MoveMode.MOVE_RESIZE;
							return this.mode;
						}else{
							this.mode = MoveMode.MOVE;
							return this.mode;
						}
					}else if (MoveMode.RESIZE in this.mode){
						this.mode = MoveMode.RESIZE;
						return this.mode;
					}else{
					this.mode = MoveMode.NONE;
					return this.mode;
					}
				}
				internal bool has_mode(MoveMode mode){
					switch(mode){
						case MoveMode.NONE:
							return false;
						case MoveMode.MOVE_RESIZE:
						{
							return (this.get_mode() == MoveMode.MOVE_RESIZE);
						}
						case MoveMode.MOVE:{
							return ((this.get_mode() == MoveMode.MOVE)||(this.get_mode() == MoveMode.MOVE_RESIZE));
						}
						case MoveMode.RESIZE:{
							return ((this.get_mode() == MoveMode.RESIZE)||(this.get_mode() == MoveMode.MOVE_RESIZE));
						}
						default:
							return false;
					}
				}
				internal void set_pos(GdkAux.Pair pos){
					this.target.x = pos.x;
					this.target.y = pos.y;
					this.add_mode(MoveMode.MOVE);
				}
				internal void set_size(GdkAux.Pair size){
					this.target.width = size.x;
					this.target.height = size.y;
					this.add_mode(MoveMode.RESIZE);
				}
				internal void set_geo(Gdk.Rectangle rect){
					this.target.x = rect.x;
					this.target.y = rect.y;
					this.target.width = rect.width;
					this.target.height = rect.height;
					this.add_mode(MoveMode.MOVE);
					this.add_mode(MoveMode.RESIZE);
				}
				internal GdkAux.Pair get_pos(){
					GdkAux.Pair tmp = {};
					tmp.x = this.target.x;
					tmp.y = this.target.y;
					return tmp;
				}
				internal GdkAux.Pair get_size(){
					GdkAux.Pair tmp = {};
					tmp.x = this.target.width;
					tmp.y = this.target.height;
					return tmp;
				}
				internal Gdk.Rectangle get_geo(){
					return this.target;
				}
			}

			internal class OverrideRedirectBox: DataBox<bool?>{
				internal override void signal_func(){
					if(this.get_item()!=null){Immediate.set_override_redirect(this.window,this.get_item());}
				}
				internal OverrideRedirectBox(Gtk.Window window){
					base(window,LinkType.overrideRedirect_bool);
				}
			}

			internal class DesktopNumBox: DataBox<int?>{
				internal override void signal_func(){
					if(this.get_item()!=null){Immediate.set_desktop_number(this.window,this.get_item());}
				}
				internal DesktopNumBox(Gtk.Window window){
					base(window,LinkType.desktopNum_int);
				}
			}

			internal class MarginBorderBox: DataBox<Gtk.Border?>{
				internal override void signal_func(){
					if(this.get_item()!=null){Immediate.set_screen_margin(this.window,this.get_item());}
				}
				internal MarginBorderBox(Gtk.Window window){
					base(window,LinkType.margin_gtkBorder);
				}
			}

			internal class MoveRectBox: DataBox<GeoRect?>{

				internal override void signal_func(){
					switch(this.get_item().get_mode()){
						case(MoveMode.MOVE):{
							Immediate.move(this.window,this.get_item().get_pos());
							break;
						}
						case(MoveMode.RESIZE):{
							Immediate.resize(this.window,this.get_item().get_size());
							break;
						}
						case(MoveMode.MOVE_RESIZE):{
							Immediate.move_resize(this.window,this.get_item().get_geo());
							break;
						}
						default:{
							warning("Move mode error");
							break;
						}
					}
				}
				internal MoveRectBox(Gtk.Window window){
					base(window,LinkType.moveTarget_geoRect);
					this.item = new GeoRect();
				}
			}

			internal class TypeHintBox: DataBox<GdkAux.X11.WindowTypeHint?>{
				internal override void signal_func(){
					if (this.get_item() != null){Immediate.set_type_hint(this.window,this.get_item());}
				}
				internal TypeHintBox(Gtk.Window window){
					base(window,LinkType.typeHint_typeHintEnum);
				}
			}

			//这里的int实际上是按位操作的
			internal class StateHintBox: DataBox<int>{
				internal override void signal_func(){
					foreach(unowned var enum_value in GdkAux.X11.WindowStateHint.array()){
						if(this.if_hint_set((GdkAux.X11.WindowStateHint)enum_value)){
							this.exec_for_one_hint((GdkAux.X11.WindowStateHint)enum_value);
						}
					}
				}
				private void exec_for_one_hint(GdkAux.X11.WindowStateHint hint){
					Immediate.set_state_hint(this.window,hint,true);
				}
				internal StateHintBox(Gtk.Window window){
					base(window,LinkType.stateHint_byteInt);
				}
				internal void add_hint(GdkAux.X11.WindowStateHint hint_enum){
					this.item = (this.item | hint_enum);
				}
				internal bool if_hint_set(GdkAux.X11.WindowStateHint hint_enum){
					return (hint_enum in this.item);
				}
				internal void del_hint(GdkAux.X11.WindowStateHint hint_enum){
					this.item = (this.item & (~hint_enum));
				}
			}
		}
	}
}
