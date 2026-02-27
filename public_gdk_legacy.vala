#if API_COMPATIBLE
namespace Gdk{
#else
namespace GdkX11Legacy{
#endif
	#if GTK4
	public void set_modal_hint(Gdk.Surface self,bool modal){
		GdkAux.X11.Extra.set_modal(self,modal);
	}
	public bool get_modal_hint(Gdk.Surface self){
		return GdkAux.X11.Extra.get_modal(self);
	}

	public void set_keep_above(Gdk.Surface self,bool setting){
		GdkAux.X11.set_keep_above(self,setting);
	}

	public void set_keep_below(Gdk.Surface self,bool setting){
		GdkAux.X11.set_keep_below(self,setting);
	}

	public void sitck(Gdk.Surface self){
		GdkAux.X11.set_sticky(self,true);
	}
	public void unsitck(Gdk.Surface self){
		GdkAux.X11.set_sticky(self,false);
	}

	public void set_skip_taskbar_hint(Gdk.Surface self,bool skip_taskbar){
		GdkAux.X11.set_skip_taskbar(self,skip_taskbar);
	}
	public void set_skip_pager_hint(Gdk.Surface self,bool skip_pager){
		GdkAux.X11.set_skip_pager(self,skip_pager);
	}

	public int get_width(Gdk.Surface self){
		return GdkAux.X11.get_size(self).x;
	}
	public int get_height(Gdk.Surface self){
		return GdkAux.X11.get_size(self).y;
	}
	public void get_position(Gdk.Surface self,out int x,out int y){
		GdkAux.Pair tmp = GdkAux.X11.get_position(self);
		x = tmp.x;
		y = tmp.y;
	}
	public void get_geometry(Gdk.Surface self,out int x,out int y,out int width,out int height){
		Gdk.Rectangle tmp = GdkAux.X11.get_geometry(self);
		x = tmp.x;
		y = tmp.y;
		width = tmp.width;
		height = tmp.height;
	}

	public void move(Gdk.Surface self,int x,int y){
		GX11LegacyHelper.move(self,x,y);
	}
	public void resize(Gdk.Surface self,int width,int height){
		GX11LegacyHelper.resize(self,width,height);
	}
	public void move_resize(Gdk.Surface self,int x,int y,int width,int height){
		Gdk.Rectangle tmp = {};
		tmp.x = x;
		tmp.y = y;
		tmp.width = width;
		tmp.height = height;
		GX11LegacyHelper.move_resize(self,tmp);
	}

	#elif GTK3
	public void minimize(Gdk.Window self){
		GdkAux.set_minimize(self,true);
	}

	public void unminimize(Gdk.Window self){
		GdkAux.set_minimize(self,false);
	}
	#endif
}
