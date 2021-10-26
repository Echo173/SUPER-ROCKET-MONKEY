if (instance_exists(obj_fade_in)) && (reset_init = false)
{
	if (obj_fade_in.timer > 0)
	{
		reset_init = true
		
		stage = 0
		timer = 0

		hover_y = 4
		hover_step = 0

		spd = 0
		spd_dir = 1
		dir = 0

		size = 1
		
		x = return_x
		y = return_y
		
		image_xscale = size
		image_yscale = size
		
		pitch = 1
		
		if (audio_sound_get_gain(snd_level_final_music) != 0) {
			audio_sound_gain(snd_level_final_music,0,1000)
		}
		if (audio_sound_get_gain(snd_level_final_music) != 0) {
			audio_sound_gain(snd_level_music,1 * index_get_gain(global.music_volume_index,false),2000)
		}
	}
}