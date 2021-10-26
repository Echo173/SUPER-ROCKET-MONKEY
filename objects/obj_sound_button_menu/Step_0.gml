if (obj_main_menu.stage >= 5)
{
	visible = true
	if (instance_position(mouse_x,mouse_y,id))
	{
		if (mouse_check_button_pressed(mb_left))
		{
			global.sound_volume_index += 1
			if (global.sound_volume_index > 3) {
				global.sound_volume_index = 0	
			}
			
			var gain = index_get_gain(global.sound_volume_index,true)
			audio_group_set_gain(SoundFX,gain,0)
			
			audio_play_sound(snd_scout,100,false)
		}
	}
	image_index = global.sound_volume_index
}
else
{
	visible = false	
}