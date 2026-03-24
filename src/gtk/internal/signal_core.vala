[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux{
	namespace Internal {
[CCode (cprefix = "GtkAuxInternalGtk", lower_case_cprefix = "gtkaux_internal_gtk_")]
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

			internal interface WindowHelper: Object{
				internal abstract SignalMode signal_mode {get;set;}
				internal abstract Gtk.Window? window {get;}
				internal abstract void func_exec();
				internal virtual bool is_done(){
					return this.signal_mode.is_done(this.window);
				}
				protected abstract bool has_link {get;set;}
				internal virtual void link_func(){
					if(this.window == null){critical("window is null.");return;}
					if(this.has_link){message("signal as been connected.");return;}
					message("connecting signal.");
					switch(this.signal_mode){
						case SignalMode.REALIZE:
							// 必须ref一次，不然因为DataHelper没有所有权，直接就被注销了
							this.ref();
							((Gtk.Widget)this.window).realize.connect(()=>{this.func_exec();this.unref();});
							this.has_link = true;
							//记得unref
							break;
						case SignalMode.AFTER_REALIZE:
							this.ref();
							((Gtk.Widget)this.window).realize.connect_after(()=>{this.func_exec();this.unref();});
							this.has_link = true;
							break;
						case SignalMode.MAP:
							this.ref();
							((Gtk.Widget)this.window).map.connect(()=>{this.func_exec();this.unref();});
							this.has_link = true;
							break;
						case SignalMode.AFTER_MAP:
							this.ref();
							((Gtk.Widget)this.window).map.connect_after(()=>{this.func_exec();this.unref();});
							this.has_link = true;
							break;
						default:
							;
							break;
					}
				}

				internal virtual void smart_exec(){
					if(this.is_done()){
						this.func_exec();
					}else{
						this.link_func();
					}
				}
			}

			internal abstract class WindowHelper_Var<T>: SetDataHelper.SetData_Var<T>, WindowHelper {
				internal SignalMode signal_mode {get;set;}
				protected bool has_link{
					get {
						if(this.has_content()&&(this.flag == true)){
							return true;
						}else{return false;}
					}
					set {
						if(this.has_content()){
							this.flag = true;
						}
					}
				}
				internal weak Gtk.Window? window {
					get{
						return (Gtk.Window)(this.object);
					}
				}
				internal abstract void func_exec();
				internal WindowHelper_Var(Gtk.Window window,string key,SignalMode signal_mode){
					base(window,key);
					this.signal_mode = signal_mode;
				}
				internal WindowHelper_Var.with_data(Gtk.Window window,string key,SignalMode signal_mode,T data){
					base.with_data(window,data,key);
					this.signal_mode = signal_mode;
				}
			}

			internal abstract class WindowHelper_Array<T>: SetDataHelper.SetData_Array<T>, WindowHelper {
				internal SignalMode signal_mode {get;set;}
				protected bool has_link{
					get {
						if(this.has_content()&&(this.flag == true)){
							return true;
						}else{return false;}
					}
					set {
						if(this.has_content()){
							this.flag = true;
						}
					}
				}
				internal weak Gtk.Window? window {
					get{
						return (Gtk.Window)(this.object);
					}
				}
				internal abstract void func_exec();
				internal WindowHelper_Array(Gtk.Window window,string key,SignalMode signal_mode){
					base(window,key);
					this.signal_mode = signal_mode;
				}
				internal WindowHelper_Array.with_data(Gtk.Window window,string key,SignalMode signal_mode,T[]? data){
					base.with_data(window,data,key);
					this.signal_mode = signal_mode;
				}
			}

			internal abstract class WindowHelper_GObject: SetDataHelper.SetData_GObject, WindowHelper {
				internal SignalMode signal_mode {get;set;}
				protected bool has_link{
					get {
						if(this.has_content()&&(this.flag == true)){
							return true;
						}else{return false;}
					}
					set {
						if(this.has_content()){
							this.flag = true;
						}
					}
				}
				internal weak Gtk.Window? window {
					get{
						return (Gtk.Window)(this.object);
					}
				}
				internal abstract void func_exec();
				internal WindowHelper_GObject(Gtk.Window window,string key,SignalMode signal_mode){
					base(window,key);
					this.signal_mode = signal_mode;
				}
				internal WindowHelper_GObject.with_data(Gtk.Window window,string key,SignalMode signal_mode,GLib.Object? data){
					base.with_data(window,data,key);
					this.signal_mode = signal_mode;
				}
			}
		}
	}
}
