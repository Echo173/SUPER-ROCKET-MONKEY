timer = 15

is_clear = false
if (global.transition_room = rm_win) {
	is_clear = true	
	audio_sound_gain(snd_level_final_music,0,1000)
	audio_sound_gain(snd_level_music,0,1000)
}

stage = 0
timer = 0

alpha = 0
alpha_dir = 1