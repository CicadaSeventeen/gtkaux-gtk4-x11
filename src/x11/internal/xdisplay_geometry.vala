[CCode (cprefix = "GtkAux", lower_case_cprefix = "gtkaux_")]
namespace GtkAux {
	namespace Internal {
[CCode (cprefix = "GtkAuxInternalX11", lower_case_cprefix = "gtkaux_internal_x11_")]
		namespace X11Lib {
			namespace XDisplay {
				namespace Geometry {
					internal static void move(X.Display xdisplay, X.Window xid, int x, int y) {
						xdisplay.move_window(xid,x,y);
						xdisplay.flush();
					}
					internal static void resize(X.Display xdisplay, X.Window xid, int width, int height) {
						xdisplay.resize_window(xid,width,height);
						xdisplay.flush();
					}
					internal static void move_resize(X.Display xdisplay, X.Window xid, int x, int y, int width, int height) {
						xdisplay.move_resize_window(xid,x,y,width,height);
						xdisplay.flush();
					}

					/*
					internal static void get_percent_from_int(int x,int y,int x_geo,int y_geo,int width_geo,int height_geo,out float x_percent,out float y_percent){
						x_percent = ((float)(x-x_geo))/((float(width_geo-x_geo)));
						y_percent = ((float)(y-y_geo))/((float(height_geo-y_geo)));
					}

					internal static void get_int_from_percent(float x_percent,float y_percent,int x_geo,int y_geo,int width_geo,int height_geo,out int x,out int y){
						x = (int)(x_percent * (width_geo-x_geo)) + x_geo;
						y = (int)(y_percent * (height_geo-y_geo)) + y_geo;
					}
*/
				}
			}
		}
	}
}
