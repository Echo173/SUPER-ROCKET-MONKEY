if (global.in_menu = true)
{
	visible = true
	if (instance_position(mouse_x,mouse_y,id))
	{
		if (mouse_check_button_pressed(mb_left))
		{
			global.music_volume_index += 1
			if (global.music_volume_index > 3) {
				global.music_volume_index = 0	
			}
			
			var gain = index_get_gain(global.music_volume_index,false)
			audio_group_set_gain(Music,gain,0)
			
			audio_play_sound(snd_scout,100,false)
		}
	}
	image_index = global.music_volume_index
}
else
{
	visible = false	
}
