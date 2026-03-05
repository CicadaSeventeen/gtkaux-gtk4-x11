project(
	'gtkaux-x11',
	['vala', 'c'],
	version: '0.1.0'
)

gtk4_dep_list = [dependency('gtk4'),dependency('gtk4-x11')]
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


vapi_sources_gtk4 = files(
	'src/patch/patch_gtk4-x11.vapi'
)

c_sources = files(
	'src/x11/internal/c/c_xrandr_get_screen_size.c'
)

c_vala_sources = files(
	'src/x11/internal/c/c_xrandr_get_screen_size.vala'
)

xrandr_include = include_directories('src/x11/internal/c')

gtk_version = get_option('gtk_version')
if gtk_version == '4'
	name = 'gtk4aux-x11'
	gir_name = 'Gtk4auxX11-1.0.gir'
	vapi_name = 'gtk4aux-x11-1.0.vapi'
	header_name = 'gtk4aux-x11.h'
	dep = gtk4_dep_list + [x11_dep]
	vala_args = vala_args_gtk4 + [ '--library=' + name ]
	vala_sources = vala_sources_base + vala_sources_gtk4 + c_vala_sources
	version = '0.1.0'
elif gtk_version == '3'
	name = 'gtk3aux-x11'
	gir_name = 'Gtk3auxX11-1.0.gir'
	vapi_name = 'gtk3aux-x11-1.0.vapi'
	header_name = 'gtk3aux-x11.h'
	dep = gtk3_dep_list + [x11_dep]
	vala_args = vala_args_gtk3  + [ '--library=' + name ]
	vala_sources = vala_sources_base + vala_sources_gtk3 + c_vala_sources
	version = '0.1.0'
endif
sources = vala_sources + c_sources

pkg = import('pkgconfig')
lib = library(
	name,
	sources,
	vala_args: vala_args,
	link_args: link_args,
	dependencies: dep,
	install: true,
	install_dir: [true, true, true],
	version : version
)
pkg.generate(
	lib,
	description: 'GTK-Auxiliary X11 library',
	filebase: name,
	subdirs: name
)



