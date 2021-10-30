if (surface_alpha > 0)
{
	draw_surface_ext(surf,-b/2,-b/2,1,1,0,c_white,surface_alpha)
}

//var str = string(window_get_width()) + " | " + string(window_get_height())
//draw_text(2,2,str)

//str = string(display_get_width()) + " | " + string(display_get_height())

if (global.show_timer = true)
{
	var add_txt_s = ""
	var add_txt_m = ""
	if (global.secs < 10) add_txt_s = "0"
	if (global.mins < 10) add_txt_m = "0"
	var str = string(global.hrs) + ":" + add_txt_m + string(global.mins) + ":" + add_txt_s + string(global.secs)

	var xpos = 240 - string_width("0:00:00.00")/2
	draw_text(xpos,4,str)
}
