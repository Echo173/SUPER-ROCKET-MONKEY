if (surface_alpha > 0)
{
	if (surface_exists(surf)) {
		draw_surface_ext(surf,-b/2,-b/2,1,1,0,c_white,surface_alpha)
	} else {
		scout_overlay();
	}
	
}

//var str = string(window_get_width()) + " | " + string(window_get_height())
//draw_text(2,2,str)

//str = string(display_get_width()) + " | " + string(display_get_height())

//draw_text(2,2,global.is_cutscene)
//draw_text(2,20,instance_exists(obj_fade_in))