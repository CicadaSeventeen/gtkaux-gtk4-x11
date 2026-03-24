project(
	'gtkaux-x11',
	['vala', 'c'],
	version: '0.3.1'
)

gtk4_dep_list = [dependency('gtk4')]
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
	'src/basic/helper_setdata.vala'
)

vala_sources_legacy_api = files(
	'src/compatible/enum.vala',
	'src/compatible/gdk.vala',
	'src/compatible/gtk.vala'
)

vala_sources_x11 = files(
	'src/x11/api/x11_api_display.vala',
	'src/x11/api/x11_api_override_redirect.vala',
	'src/x11/api/x11_api_desktop_number.vala',
	'src/x11/api/hint/x11_api_hint.vala',
	'src/x11/api/hint/x11_api_hint_enum.vala',
	'src/x11/api/geometry/x11_api_geometry.vala',
	'src/x11/api/geometry/x11_api_strut.vala',
	'src/x11/api/geometry/x11_api_geometry_percent.vala',
	'src/x11/internal/xdisplay_display.vala',
	'src/x11/internal/ewmh/xdisplay_ewmh_atom.vala',
	'src/x11/internal/ewmh/xdisplay_ewmh_desktop_number.vala',
	'src/x11/internal/ewmh/xdisplay_ewmh_hint.vala',
	'src/x11/internal/ewmh/xdisplay_ewmh_strut.vala',
	'src/x11/internal/xdisplay_geometry.vala',
	'src/x11/internal/xdisplay_override_redirect.vala',
)

vala_sources_gtk = files(
	'src/gtk/internal/signal_core.vala',
	'src/gtk/internal/signal_api.vala',
	'src/gtk/api/gtk_api_tool.vala',
	'src/gtk/api/gtk_api_basic.vala',
	'src/gtk/api/gtk_api_hint.vala',
	'src/gtk/api/gtk_api_geometry.vala',
)

vala_sources_gtk3 = files(
	'src/gtk/api/gtk3/gtk_api_extra.vala'
)

vala_sources_gtk4 = files(
	'src/gtk/api/gtk4/gtk_api_extra.vala'
)

vala_sources_gdk3 = files(
	'src/gdk/gdk3/gdk_api_basic.vala',
	'src/gdk/gdk3/gdk_api_extra.vala',
	'src/gdk/gdk3/gdk_api_hint.vala',
	'src/gdk/gdk3/gdk_api_tool.vala',
	'src/gdk/gdk3/gdk_api_geometry.vala',
)

vala_sources_gdk4 = files(
	'src/gdk/gdk4/gdk_api_basic.vala',
	'src/gdk/gdk4/gdk_api_extra.vala',
	'src/gdk/gdk4/gdk_api_hint.vala',
	'src/gdk/gdk4/gdk_api_tool.vala',
	'src/gdk/gdk4/gdk_api_geometry.vala',
)

vapi_patches_gtk4 = files(
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
	version = '0.3.0'
	gir_name = 'Gtk4AuxX11-' + version + '.gir'
	typelib_name = 'Gtk4AuxX11-' + version + '.typelib'
	vapi_name = 'gtk4aux-x11-1.0.vapi'
	header_name = 'gtk4aux-x11.h'
	dep = gtk4_dep_list + [x11_dep]
	vala_args = vala_args_gtk4 + [ '--library=' + name ]
	vala_sources = vala_sources_base + vala_sources_x11 + vala_sources_legacy_api + vapi_patches_gtk4 + c_vala_sources + vala_sources_gtk + vala_sources_gtk4 + vala_sources_gdk4
elif gtk_version == '3'
	name = 'gtk3aux-x11'
	version = '0.3.0'
	gir_name = 'Gtk3AuxX11-' + version + '.gir'
	typelib_name = 'Gtk3AuxX11-' + version + '.typelib'
	header_name = 'gtk3aux-x11.h'
	dep = gtk3_dep_list + [x11_dep]
	vala_args = vala_args_gtk3 + [ '--library=' + name ]
	vala_sources = vala_sources_base + vala_sources_x11 + vala_sources_legacy_api + c_vala_sources + vala_sources_gtk + vala_sources_gtk3 + vala_sources_gdk3
endif
sources = vala_sources + c_sources

lib = library(
	name,
	sources,
	vala_args: vala_args,
	vala_header: header_name,
	vala_gir: gir_name,
	link_args: link_args,
	dependencies: dep,
	install: true,
	install_dir: [true, true, true, true],
	version : version
)
g_ir_compiler = find_program('g-ir-compiler')
custom_target(
	'gtkaux typelib', command: [g_ir_compiler, '--output', '@OUTPUT@', meson.current_build_dir() / gir_name],
	depends: lib,
	output: typelib_name,
	install: true,
	install_dir: get_option('libdir') / 'girepository-1.0'
)
pkg = import('pkgconfig')
pkg.generate(
	lib,
	description: 'GTK-Auxiliary X11 library',
	filebase: name,
	subdirs: name
)


