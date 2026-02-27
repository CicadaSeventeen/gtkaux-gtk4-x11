namespace GtkAux{
	namespace X11{
		public void set_override_redirect(Gtk.Window window,bool enable){
			GtkAux.X11.Helper.LinkType.overrideRedirect_bool.exec<bool,bool?>(window,enable,null);
		}
		internal void set_desktop_number(Gtk.Window window,int desktop_number){
			GtkAux.X11.Helper.LinkType.desktopNum_int.exec<int,bool?>(window,desktop_number,null);
		}
		public void set_screen_margin(Gtk.Window window,Gtk.Border margin){
			GtkAux.X11.Helper.LinkType.margin_gtkBorder.exec<Gtk.Border?,bool?>(window,margin,null);
		}

		public void set_position(Gtk.Window window,GdkAux.Pair target){
			GtkAux.X11.Helper.LinkType.moveTarget_geoRect.exec<GdkAux.Pair?,GtkAux.X11.Helper.MoveMode>(window,target,GtkAux.X11.Helper.MoveMode.MOVE);
		}
		public void set_size(Gtk.Window window,GdkAux.Pair target){
			GtkAux.X11.Helper.LinkType.moveTarget_geoRect.exec<GdkAux.Pair?,GtkAux.X11.Helper.MoveMode>(window,target,GtkAux.X11.Helper.MoveMode.RESIZE);
		}
		public void set_geometry(Gtk.Window window,Gdk.Rectangle target){
			GtkAux.X11.Helper.LinkType.moveTarget_geoRect.exec<Gdk.Rectangle?,GtkAux.X11.Helper.MoveMode>(window,target,GtkAux.X11.Helper.MoveMode.MOVE_RESIZE);
		}

		public void move(Gtk.Window window,GdkAux.Pair target){
			set_position(window,target);
		}

		public void set_type_hint(Gtk.Window window,GdkAux.X11.WindowTypeHint type_hint){
			GtkAux.X11.Helper.LinkType.typeHint_typeHintEnum.exec<GdkAux.X11.WindowTypeHint,bool?>(window,type_hint,null);
		}

		public void set_state_hint(Gtk.Window window,GdkAux.X11.WindowStateHint state_hint,bool enable){
			GtkAux.X11.Helper.LinkType.stateHint_byteInt.exec<GdkAux.X11.WindowStateHint,bool>(window,state_hint,enable);
		}

		public bool? get_override_redirect(Gtk.Window window){
			if(GtkAux.X11.Helper.LinkType.overrideRedirect_bool.is_done(window)){return GtkAux.X11.Helper.Immediate.get_override_redirect(window);}
			var? box = (GtkAux.X11.Helper.LinkType.overrideRedirect_bool.get_databox(window) as GtkAux.X11.Helper.OverrideRedirectBox);
			if(box != null){return box.get_item();}
			else{return null;}
		}
		internal int? get_desktop_number(Gtk.Window window,int desktop_number){
			if(GtkAux.X11.Helper.LinkType.desktopNum_int.is_done(window)){return GtkAux.X11.Helper.Immediate.get_desktop_number(window);}
			var? box = (GtkAux.X11.Helper.LinkType.desktopNum_int.get_databox(window) as GtkAux.X11.Helper.DesktopNumBox);
			if(box != null){return box.get_item();}
			else{return null;}
		}
		public Gtk.Border? get_screen_margin(Gtk.Window window){
			if(GtkAux.X11.Helper.LinkType.margin_gtkBorder.is_done(window)){return GtkAux.X11.Helper.Immediate.get_screen_margin(window);}
			var? box = (GtkAux.X11.Helper.LinkType.margin_gtkBorder.get_databox(window) as GtkAux.X11.Helper.MarginBorderBox);
			if(box != null){return box.get_item();}
			else{return null;}
		}

		public GdkAux.Pair? get_position(Gtk.Window window){
			if(GtkAux.X11.Helper.LinkType.moveTarget_geoRect.is_done(window)){return GtkAux.X11.Helper.Immediate.get_position(window);}
			var? box = (GtkAux.X11.Helper.LinkType.moveTarget_geoRect.get_databox(window) as GtkAux.X11.Helper.MoveRectBox);
			if(box != null){
				var? geo_item = box.get_item();
				if (geo_item.has_mode(GtkAux.X11.Helper.MoveMode.MOVE)){
					return geo_item.get_pos();
				}
			}
			return null;
		}
		public GdkAux.Pair? get_size(Gtk.Window window){
			if(GtkAux.X11.Helper.LinkType.moveTarget_geoRect.is_done(window)){return GtkAux.X11.Helper.Immediate.get_size(window);}
			var? box = (GtkAux.X11.Helper.LinkType.moveTarget_geoRect.get_databox(window) as GtkAux.X11.Helper.MoveRectBox);
			if(box != null){
				var? geo_item = box.get_item();
				if (geo_item.has_mode(GtkAux.X11.Helper.MoveMode.RESIZE)){
					return geo_item.get_size();
				}
			}
			return null;
		}
		public Gdk.Rectangle? get_geometry(Gtk.Window window){
			if(GtkAux.X11.Helper.LinkType.moveTarget_geoRect.is_done(window)){return GtkAux.X11.Helper.Immediate.get_geometry(window);}
			var? box = (GtkAux.X11.Helper.LinkType.moveTarget_geoRect.get_databox(window) as GtkAux.X11.Helper.MoveRectBox);
			if(box != null){
				var? geo_item = box.get_item();
				if (geo_item.has_mode(GtkAux.X11.Helper.MoveMode.MOVE_RESIZE)){
					return geo_item.get_geo();
				}
			}
			return null;
		}

		public GdkAux.X11.WindowTypeHint get_type_hint(Gtk.Window window){
			if(GtkAux.X11.Helper.LinkType.typeHint_typeHintEnum.is_done(window)){return GtkAux.X11.Helper.Immediate.get_type_hint(window);}
			var? box = (GtkAux.X11.Helper.LinkType.typeHint_typeHintEnum.get_databox(window) as GtkAux.X11.Helper.TypeHintBox);
			if (box != null){
				GdkAux.X11.WindowTypeHint? ret = box.get_item();
				return (ret == null)? GdkAux.X11.WindowTypeHint.NONE : ret;
			}else{return GdkAux.X11.WindowTypeHint.NONE;}
		}

		public bool get_state_hint(Gtk.Window window,GdkAux.X11.WindowStateHint state_hint){
			if(GtkAux.X11.Helper.LinkType.stateHint_byteInt.is_done(window)){return GtkAux.X11.Helper.Immediate.get_state_hint(window,state_hint);}
			var? box = (GtkAux.X11.Helper.LinkType.stateHint_byteInt.get_databox(window) as GtkAux.X11.Helper.StateHintBox);
			if (box != null){
				return box.if_hint_set(state_hint);
			}
			return false;
		}
	}
}

