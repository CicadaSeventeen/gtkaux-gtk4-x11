project(
	'gtkaux-x11',
	['vala', 'c'],
	version: '0.1.0'
)

gtk4_dep = dependency('gtk4')
gtk3_dep_list = [dependency('gtk+-3.0'),dependency('gdk-3.0'),dependency('gdk-x11-3.0')]
x11_dep  = dependency('x11')

vala_args_gtk4 = [
	'-D', 'GTK4'
]
vala_args_gtk3 = [
	'-D', 'GTK3'
]

link_args = [
	'-lX11', '-lXrandr'
]

vala_sources_base = files(
	'src/basic/basic_api_display.vala',
	'src/basic/debug.vala',
	'src/compatible/enum.vala',
	'src/compatible/gdk.vala',
	'src/compatible/gtk.vala',
	'src/gtk/api/gtk_api_basic.vala',
	'src/gtk/api/gtk_api_hint.vala',
	'src/gtk/api/gtk_api_tool.vala',
	'src/gtk/internal/gtk_data.vala',
	'src/x11/api/x11_api_desktop_number.vala',
	'src/x11/api/x11_api_display.vala',
	'src/x11/api/x11_api_enum_hint.vala',
	'src/x11/api/x11_api_geometry.vala',
	'src/x11/api/x11_api_hint.vala',
	'src/x11/api/x11_api_override_redirect.vala',
	'src/x11/api/x11_api_strut.vala',
	'src/x11/internal/xdisplay_display.vala',
	'src/x11/internal/xdisplay_ewmh_atom.vala',
	'src/x11/internal/xdisplay_ewmh_desktop_number.vala',
	'src/x11/internal/xdisplay_ewmh_hint.vala',
	'src/x11/internal/xdisplay_ewmh_strut.vala',
	'src/x11/internal/xdisplay_geometry.vala',
	'src/x11/internal/xdisplay_override_redirect.vala'
)

vala_sources_gtk4 = files(
	'src/gdk/gdk4/gdk_api_basic.vala',
	'src/gdk/gdk4/gdk_api_extra.vala',
	'src/gdk/gdk4/gdk_api_hint.vala',
	'src/gdk/gdk4/gdk_api_tool.vala',
	'src/gtk/api/gtk4/gtk_api_extra.vala',
)

vala_sources_gtk3 = files(
	'src/gdk/gdk3/gdk_api_basic.vala',
	'src/gdk/gdk3/gdk_api_extra.vala',
	'src/gdk/gdk3/gdk_api_hint.vala',
	'src/gdk/gdk3/gdk_api_tool.vala',
	'src/gtk/api/gtk3/gtk_api_extra.vala',
)

vapi_sources_base = files(
	'src/x11/internal/c/c_xrandr_get_screen_size.vapi',
)

vapi_sources_gtk4 = files(
	'src/patch/patch_gtk4-x11.vapi'
)

c_sources = files(
	'src/x11/internal/c/c_xrandr_get_screen_size.c'
)

xrandr_include = include_directories('src/x11/internal/c')

gtk_version = get_option('gtk_version')
if gtk_version == '4'
	name = 'gtk4aux-x11'
	gir_name = 'Gtk4auxX11-1.0.gir'
	vapi_name = 'gtk4aux-x11-1.0.vapi'
	header_name = 'gtk4aux-x11.h'
	dep = [gtk4_dep,x11_dep]
	vala_args = vala_args_gtk4
	vala_sources = vala_sources_base + vala_sources_gtk4
	vapi_sources = vapi_sources_base + vapi_sources_gtk4
	version = '0.1.0'
elif gtk_version == '3'
	name = 'gtk3aux-x11'
	gir_name = 'Gtk3auxX11-1.0.gir'
	vapi_name = 'gtk3aux-x11-1.0.vapi'
	header_name = 'gtk3aux-x11.h'
	dep = gtk3_dep_list + [x11_dep]
	vala_args = vala_args_gtk3
	vala_sources = vala_sources_base + vala_sources_gtk3
	vapi_sources = vapi_sources_base
	version = '0.1.0'
endif

lib = library(
	name,
	vala_sources + vapi_sources + c_sources,
	vala_args: vala_args,
	vala_gir: gir_name,
	vala_vapi: vapi_name,
	vala_header: header_name,
	link_args: link_args,
	include_directories: xrandr_include,
	dependencies: dep,
	install: true,
	version : version
)

