/* xrandr_helper.c */
#include <X11/Xlib.h>
#include <X11/extensions/Xrandr.h>
#include <stdio.h>

// 返回 1 (true) 表示成功，0 (false) 表示失败
int get_monitor_geometry_from_window(void *dpy_ptr, unsigned long window_id, int *x, int *y, int *width, int *height) {
	Display *dpy = (Display *)dpy_ptr;
	Window win = (Window)window_id;
	Window root = DefaultRootWindow(dpy);

	// 1. 获取窗口属性 (为了计算宽高)
	XWindowAttributes wa;
	if (XGetWindowAttributes(dpy, win, &wa) == 0) {
		return 0; // 窗口无效
	}

	// 2. 将窗口坐标转换为 Root 坐标 (为了获取绝对位置)
	int abs_x, abs_y;
	Window child;
	if (XTranslateCoordinates(dpy, win, root, 0, 0, &abs_x, &abs_y, &child) == 0) {
		return 0; // 转换失败
	}

	// 3. 计算窗口中心点
	int center_x = abs_x + (wa.width / 2);
	int center_y = abs_y + (wa.height / 2);

	// 4. 获取 XRandR 屏幕资源
	XRRScreenResources *res = XRRGetScreenResources(dpy, root);
	if (!res) {
		return 0;
	}

	int found = 0;

	// 5. 遍历 CRTCs 寻找包含中心点的显示器
	for (int i = 0; i < res->ncrtc; i++) {
		XRRCrtcInfo *crtc_info = XRRGetCrtcInfo(dpy, res, res->crtcs[i]);

		if (crtc_info->mode == None || crtc_info->noutput == 0) {
			XRRFreeCrtcInfo(crtc_info);
			continue;
		}

		// 碰撞检测
		if (center_x >= crtc_info->x &&
			center_x < (crtc_info->x + (int)crtc_info->width) &&
			center_y >= crtc_info->y &&
			center_y < (crtc_info->y + (int)crtc_info->height)) {

			// 找到目标，写入输出参数
			if (x) *x = crtc_info->x;
			if (y) *y = crtc_info->y;
			if (width) *width = (int)crtc_info->width;
			if (height) *height = (int)crtc_info->height;

			found = 1;
			XRRFreeCrtcInfo(crtc_info);
			break;
			}

			XRRFreeCrtcInfo(crtc_info);
	}

	XRRFreeScreenResources(res);
	return found;
}
