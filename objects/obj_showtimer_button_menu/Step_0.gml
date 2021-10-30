if (obj_main_menu.stage >= 5)
{
	visible = true
	if (instance_position(mouse_x,mouse_y,id))
	{
		if (mouse_check_button_pressed(mb_left))
		{
			audio_play_sound(snd_scout,100,false)
			
			if (global.show_timer = true) {
				global.show_timer = false
			} else {
				global.show_timer = true
			}
			
			save_settings();
		}
	}
	image_index = global.show_timer
}
else
{
	visible = false	
}
