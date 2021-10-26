 if (audio_group_is_loaded(SoundFX)) && (audio_group_is_loaded(Music))
{
	audio_group_set_gain(Music,global.music_volume_index/3,0)
	audio_group_set_gain(SoundFX,global.sound_volume_index/3,0)
}