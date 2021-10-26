if (!audio_is_playing(snd_story_music))
{
	audio_play_sound(snd_story_music,100,true)
	audio_sound_gain(snd_story_music,0,0)
	audio_sound_gain(snd_story_music,1 * index_get_gain(global.music_volume_index,false),2000)
}

ypos -= 0.2
if (ypos < -332)
{
	if (!instance_exists(obj_fade_out)) 
	{
		var _r = instance_create_layer(x,y,layer,obj_fade_out)
		_r.room_target = rm_area_1
	}
}

//if (translate_timer <= 0)
//{
//	translate_pos += 1
//	translate_timer = 3
//}
//translate_timer -= 1