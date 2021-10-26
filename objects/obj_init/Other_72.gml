 if (audio_group_is_loaded(SoundFX)) && (audio_group_is_loaded(Music))
{
	audio_group_set_gain(Music,index_get_gain(global.music_volume_index,false),0)
	audio_group_set_gain(SoundFX,index_get_gain(global.sound_volume_index,true),0)
}