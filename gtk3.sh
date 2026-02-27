#!/bin/sh
valac test.vala \
-D GTK3 \
--pkg gtk+-3.0 --pkg gdk-3.0 --pkg gdk-x11-3.0 \
public_basetool.vala public_enum.vala \
public_gdk.vala public_gdk_hint_base.vala public_gdk_hint_more.vala public_gdk_legacy.vala \
public_gtk.vala public_gtk_hint_base.vala public_gtk_hint_more.vala public_gtk_legacy.vala \
gtk_link.vala gtk_immediate.vala \
--pkg x11 \
x11_hint.vala x11_desktop_number.vala x11_override_redirect.vala x11_strut.vala x11_geometry.vala \
x11_display.vala x11_delegate.vala x11_atom.vala \
c_xrandr_get_screen_size.c c_xrandr_get_screen_size.vapi -X -lX11 -X -lXrandr

