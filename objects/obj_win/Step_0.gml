if (IS_HTML5)
{
	if (window_get_width() != display_get_width()) || (window_get_height() != display_get_height())
	{
		window_set_size(display_get_width(),display_get_height())
	}
}

if (!audio_is_playing(snd_story_music))
{
	audio_play_sound(snd_story_music,100,true)
	audio_sound_gain(snd_story_music,0,0)
	audio_sound_gain(snd_story_music,1 * index_get_gain(global.music_volume_index,false),2000)
}