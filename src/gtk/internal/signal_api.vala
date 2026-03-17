[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux{
	namespace Internal {
[CCode (cprefix = "GtkAuxInternalGtk", lower_case_cprefix = "gtkaux_internal_gtk_")]
		namespace GtkLib {
			internal class WindowHelper_OverrideRedirect: WindowHelper_Var<bool?> {
				internal override void func_exec(){
					var? enable = this.content_ref;
					if(enable!=null){

						GtkAux.X11Lib.set_override_redirect(this.window,enable);
					}
				}
				internal bool? get_info(){
					if(this.has_content()){return this.content;}
					else{return null;}
				}
				internal WindowHelper_OverrideRedirect(Gtk.Window window){
					base(window,"OverrideRedirect",SignalMode.AFTER_REALIZE);
				}
			}

			internal class WindowHelper_DesktopNumber: WindowHelper_Var<int?> {
				internal override void func_exec(){
					var? desktop_number = this.content_ref;
					if(desktop_number!=null){
						GtkAux.X11Lib.set_desktop_number(this.window,desktop_number);
					}
				}
				internal int? get_info(){
					if(this.has_content()){return this.content;}
					else{return null;}
				}
				internal WindowHelper_DesktopNumber(Gtk.Window window){
					base(window,"DesktopNumber",SignalMode.MAP);
				}
			}

			internal class WindowHelper_ScreenMargin: WindowHelper_GObject {
				internal override void func_exec(){
					var? data = this.content_ref;
					if(data!=null && (data is GtkAux.X11Lib.ScreenMarginTarget)){
						((GtkAux.X11Lib.ScreenMarginTarget)data).apply();
					}
				}
				internal WindowHelper_ScreenMargin(Gtk.Window window){
					base(window,"ScreenMargin",SignalMode.AFTER_REALIZE);
					if(!this.has_content()){
						this.box = new GtkAux.X11Lib.ScreenMarginTarget(window);
					}
				}
				internal WindowHelper_ScreenMargin.with_data(Gtk.Window window,GtkAux.X11Lib.ScreenMarginTarget data){
					base.with_data(window,"ScreenMargin",SignalMode.AFTER_REALIZE,data);
					this.smart_exec();
				}
			}

			internal class WindowHelper_Geometry: WindowHelper_GObject {
				internal override void func_exec(){
					var? data = this.content_ref;
					if(data!=null && (data is GtkAux.X11Lib.GeometryTarget)){
						((GtkAux.X11Lib.GeometryTarget)data).apply();
					}
				}
				internal WindowHelper_Geometry(Gtk.Window window){
					base(window,"Geometry",SignalMode.AFTER_MAP);
					if(!this.has_content()){
						this.box = new GtkAux.X11Lib.GeometryTarget(window);
					}
				}
				internal WindowHelper_Geometry.with_data(Gtk.Window window,GtkAux.X11Lib.GeometryTarget data){
					base.with_data(window,"Geometry",SignalMode.AFTER_MAP,data);
					this.smart_exec();
				}
			}

			internal class WindowHelper_TypeHint: WindowHelper_Var<int?> {
				internal override void func_exec(){
					var? hint = this.content_ref;
					if(hint!=null){
						GtkAux.X11Lib.set_window_type_hint(this.window,hint);
					}
				}
				internal int? get_info(){
					if(this.has_content()){return this.content;}
					else{return null;}
				}
				internal WindowHelper_TypeHint(Gtk.Window window){
					base(window,"WindowTypeHint",SignalMode.AFTER_REALIZE);
				}
			}

			internal class WindowHelper_StateHint: WindowHelper_Array<bool?> {
				internal override void func_exec(){
					bool?[]? array = this.content_ref;
					if(array != null){
						for(int index=0;index < array.length;index++){
							if(array[index] != null){
								GtkAux.X11Lib.set_window_state_hint(this.window,index,array[index]);
							}
						}
					}
				}
				internal bool get_info_by_index(int index){
					if(!this.has_content()||this.content_ref.length <= index){return false;}
					else{
						return this.content_ref[index];
					}
				}
				internal void set_info_by_index(int index,bool enable){
					if(!this.has_content()||this.content_ref.length <= index)
					{
						this.content = this.make_new();
					}
					unowned bool?[] tmp = this.content_ref;
					content_ref[index] = enable;
				}
				private bool?[] make_new(){
					bool?[] tmp = new bool?[GtkAux.X11Lib.WindowStateHint.length()];
					for(int index=0;index < tmp.length;index++){
						tmp[index] = null;
					}
					return tmp;
				}
				internal WindowHelper_StateHint(Gtk.Window window){
					base(window,"WindowStateHint",SignalMode.MAP);
					if(!this.has_content()){
						this.make_new();
					}
				}
			}
		}
	}
}
