if (obj_main_menu.stage >= 5) && (!IS_HTML5)
{
	visible = true
	if (instance_position(mouse_x,mouse_y,id))
	{
		audio_play_sound(snd_scout,100,false)
		
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