# GtkAux X11 (Gtk4) Project Documentation

`GtkAux-X11` is a helper library designed for **Gtk4** that restores essential **X11 APIs** which were removed from the official Gtk4 core. **Gtk3** is also supported (**Please compile with `-Dgtk_version=3`**) but at less importance.

## Project Goals
Gtk4 removed many X11-specific APIs to favor modern display protocols like Wayland. This project does not aim to restore every removed API; instead, it focuses on **features that have similar functional counterparts in Wayland extension protocols**.

This project is part of `GtkAux` which aims to help to program Gtk easier.

> **Note:** If you require a specific API that is currently missing from this library, please feel free to contact me.

---

## Key Features

### For Gtk4 Users
Restores window management capabilities that are natively missing in Gtk4:
* **Move & Resize & Get Geometry:** Support for manual `move` and `resize` operations, as well as retrieving the current window position and dimensions.
* **EWMH Hints:** Set Window Type Hints and Window State Hints, such as:
    * **DESKTOP:** Make window work as as desktop.
    * **Keep Above:** Keep the window on top of others.
    * **Skip Taskbar:** Hide the window from the taskbar/dock.
* **Stick Mode:** Make the window visible across all virtual desktops/workspaces.
* **Override Redirect:** Set the window to bypass window manager control (useful for custom menus/tooltips).
* **Strut Implementation:** Define reserved screen space (e.g., for panels or docks) so other windows don't overlap them.

### For Gtk3 Users
While Gtk3 natively supports most of these APIs, this library remains useful for:
* **Strut Implementation:** Official Gtk3 does not provide a direct API for Strut. This library makes programming Dock/Panel applications significantly easier in Gtk3.

---

## API Classification & Naming Convention

The APIs are categorized by their abstraction level. Please refer to the header files for specific function signatures.
| Prefix / Category | Description |
| :--- | :--- |
| `gtkaux_x11_` | **Low-level functions.** Supports `GtkWindow` and `GdkSurface` (Gtk4) or `GdkWindow` (Gtk3). Improper use may result in a **segfault**. |
| `gtkaux_gdk_x11_` | Simple wrappers around the `gtkaux_x11_` functions with no structural changes. |
| `gtkaux_gtk_x11_` | **Flexible wrappers.** These can be called before a window is `realized`; they use GLib signals to apply settings once the window is ready. |
| `GTKAUX_X11_` | **Macros & Enums.** Used for magic numbers and EWMH-related function parameters. |
| `gtklegacy_` / `gdklegacy_` | **Migration wrappers.** These provide interfaces consistent with native Gtk3 APIs (`gtk_` and `gdk_`) to simplify code porting. |
| Others | Miscellaneous utility functions marked as external for niche use cases. |
