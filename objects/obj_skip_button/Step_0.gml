if (obj_story.ypos < 220)
{
	image_alpha = approach(image_alpha,1,0.05)
	visible = true
	if (clicked_anim = false)
	{
		if (instance_position(mouse_x,mouse_y,id))
		{
			image_index = 1
			if (mouse_check_button_pressed(mb_left))
			{
				audio_sound_gain(snd_menu_music,0,2000)
			
				if (!instance_exists(obj_fade_out)) {
					var _r = instance_create_layer(x,y,layer,obj_fade_out)
					_r.room_target = rm_area_1
					clicked_anim = true
				}
			
				audio_sound_gain(snd_story_music,0,2000)
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
