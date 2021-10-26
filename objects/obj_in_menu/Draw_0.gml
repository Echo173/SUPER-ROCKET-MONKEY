if (global.in_menu = true)
{
	draw_set_color(c_black)
	draw_set_alpha(0.5)

	var cx = camera_get_view_x(view_camera[0])
	var cy = camera_get_view_y(view_camera[0])
	draw_rectangle(cx,cy,cx + 480, cy + 270, false)

	draw_set_alpha(1)
	draw_set_color(c_white)

	draw_set_halign(fa_center)
	draw_text(cx + 240,cy + 135,"Menu")
	draw_set_halign(fa_left)
}
