if (obj_main_menu.stage >= 5) && !(IS_HTML5) && (global.newgame_confirm = false)
{
	visible = true
	if (file_exists("SRM_savedata.save"))
	{
		if (clicked_anim = false)
		{
			if (instance_position(mouse_x,mouse_y,id))
			{
				image_index = 1
				if (mouse_check_button_pressed(mb_left))
				{
					audio_play_sound(snd_scout,100,false)
				
					audio_sound_gain(snd_menu_music,0,2000)
				
					load_game();
					
					global.in_menu = false
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
		image_index = 3
	}
}
else
{
	visible = false	
}