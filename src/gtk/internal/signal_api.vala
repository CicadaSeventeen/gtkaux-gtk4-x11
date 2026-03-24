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

			internal class WindowHelper_ScreenMargin: WindowHelper_Array<GLib.Value?> {
				internal override void func_exec(){
					var? data = this.content_ref;
					if(data!=null&&data.length >= 4){
						GtkAux.X11Lib.set_screen_margin_advanced(this.window,data[0],data[1],data[2],data[3]);
					}
				}
				internal void make_new(){
					GLib.Value?[] tmp = new GLib.Value?[4];
					for(int index = 0;index < tmp.length;index++){
						tmp[index] = null;
					}
					this.content = tmp;
				}
				internal void set_info(
					GLib.Value? margin_top,GLib.Value? margin_right,GLib.Value? margin_bottom,GLib.Value? margin_left
				){
					if(!this.has_content()||this.content_ref.length < 4){
						this.make_new();
					}
					this.content_ref[0] = margin_top;
					this.content_ref[1] = margin_right;
					this.content_ref[2] = margin_bottom;
					this.content_ref[3] = margin_left;
				}
				internal WindowHelper_ScreenMargin(Gtk.Window window){
					base(window,"ScreenMargin",SignalMode.AFTER_REALIZE);
					if(!this.has_content()){
						this.make_new();
					}
				}
				internal WindowHelper_ScreenMargin.with_data(Gtk.Window window,GLib.Value?[] data){
					base.with_data(window,"ScreenMargin",SignalMode.AFTER_REALIZE,data);
				}
			}

			internal class WindowHelper_Geometry: WindowHelper_Array<GLib.Value?> {
				internal override void func_exec(){
					var? data = this.content_ref;
					if(data!=null&&data.length >= 10){
						bool move = true;
						bool resize = true;
						if(data[0] == null && data[1] == null){move = false;}
						if(data[2] == null && data[3] == null){resize = false;}
						int align_horz,align_vert;
						if(data[8].type() == GLib.Type.INT){
							align_horz = data[8].get_int();
						}else{
							align_horz = 0;
						}
						if(data[9].type() == GLib.Type.INT){
							align_vert = data[8].get_int();
						}else{
							align_vert = 0;
						}
						if(move == true){
							if(resize == true){
								GtkAux.X11Lib.set_geometry_advanced(this.window,data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7],align_horz,align_vert);
							}else{
								GtkAux.X11Lib.set_position_advanced(this.window,data[0],data[1],data[4],data[5],data[6],data[7],align_horz,align_vert);
							}
						}else{
							if(resize == true){
								GtkAux.X11Lib.set_size_advanced(this.window,data[2],data[3],data[4],data[5],data[6],data[7],align_horz,align_vert);
							}
						}
					}
				}
				internal void make_new(){
					GLib.Value?[] tmp = new GLib.Value?[10];
					for(int index = 0;index < tmp.length;index++){
						tmp[index] = null;
					}
					this.content = tmp;
				}
				internal void set_info(
					GLib.Value? x,GLib.Value? y,GLib.Value? width,GLib.Value? height,
					GLib.Value? margin_top,GLib.Value? margin_right,GLib.Value? margin_bottom,GLib.Value? margin_left,
					int align_horz,int align_vert
				){
					if(!this.has_content()||this.content_ref.length < 10){
						this.make_new();
					}
					this.content_ref[0] = x;
					this.content_ref[1] = y;
					this.content_ref[2] = width;
					this.content_ref[3] = height;
					this.content_ref[4] = margin_top;
					this.content_ref[5] = margin_right;
					this.content_ref[6] = margin_bottom;
					this.content_ref[7] = margin_left;
					GLib.Value tmp_horz = Value(GLib.Type.INT);
					GLib.Value tmp_vert = Value(GLib.Type.INT);
					tmp_horz.set_int(align_horz);
					tmp_vert.set_int(align_vert);
					this.content_ref[8] = tmp_horz;
					this.content_ref[9] = tmp_vert;
				}
				internal WindowHelper_Geometry(Gtk.Window window){
					base(window,"Geometry",SignalMode.AFTER_MAP);
					if(!this.has_content()){
						this.make_new();
					}
				}
				internal WindowHelper_Geometry.with_data(Gtk.Window window,GLib.Value?[] data){
					base.with_data(window,"Geometry",SignalMode.AFTER_MAP,data);
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
