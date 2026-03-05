[CCode (cprefix = "gtkaux_", lower_case_cprefix = "gtkaux_")]
namespace GtkAux{
	internal static Gdk.Display? get_display(GLib.Object? win_item){
		if(win_item == null){return null;}
		#if GTK3
		else if(win_item is Gdk.Window){return ((Gdk.Window)win_item).get_display();}
		#elif GTK4
		else if(win_item is Gdk.Surface){return ((Gdk.Surface)win_item).get_display();}
		#endif
		else if(win_item is Gtk.Window){
			#if GTK3
			return get_display(((Gtk.Window)win_item).get_window());
			#elif GTK4
			return get_display(((Gtk.Window)win_item).get_surface());
			#endif
		}
		else if(win_item is Gdk.Display){return (Gdk.Display)win_item;}
		else{return null;}
	}
}
