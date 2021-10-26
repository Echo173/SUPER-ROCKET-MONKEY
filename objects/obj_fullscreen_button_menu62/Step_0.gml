if (global.in_menu = true) && (!IS_HTML5)
{
	visible = true
	if (instance_position(mouse_x,mouse_y,id))
	{
		if (mouse_check_button_pressed(mb_left))
		{
			if (window_get_fullscreen())
			{
				window_set_fullscreen(false)
			} 
			else
			{
				window_set_fullscreen(true)
			}
		}
	}
	image_index = window_get_fullscreen()
}
else
{
	visible = false	
}