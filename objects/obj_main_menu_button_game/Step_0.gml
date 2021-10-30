if (global.in_menu = true) && !(IS_HTML5)
{
	visible = true
	if (global.main_menu_exit = false)
	{
		if (instance_position(mouse_x,mouse_y,id))
		{
			image_index = 1
			if (mouse_check_button_pressed(mb_left))
			{
				audio_sound_gain(snd_level_music, 0, 500)
				audio_sound_gain(snd_level_final_music, 0, 500)
			
				var _r = instance_create_layer(x,y,layer,obj_fade_out)
				_r.room_target = rm_main_menu
				clicked_anim = true
				
				audio_play_sound(snd_scout,100,false)
			
				global.main_menu_exit = true
				save_game();
			}
		}
		else
		{
			image_index = 0
		}
	}
	else
	{
		image_index = 2
	}
}
else
{
	visible = false	
}
