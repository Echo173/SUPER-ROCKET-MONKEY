global.transition_room = -1

global.checkpoint = noone
global.checkpoint_id = noone
global.disabled_checkpoint_id = noone

global.checkpoint_room = rm_area_1

global.spawn_x = -1
global.spawn_y = -1
global.is_respawn = false

global.final_door = false
global.final_has_played = false

global.is_cutscene = false

global.secs = 0
global.mins = 0
global.hrs = 0

global.in_menu = false
global.death_count = 0

global.music_volume_index = 2
global.sound_volume_index = 2

global.tutorial_stage = 0
tutorial_timer = 0

tutorial_alpha = 0
tutorial_alpha_dir = 1
tutorial_string = ""
tutorial_string_old = ""

init = 0
layer_init = 0

mx = 0
my = 0

old_room = room

fang = 135

depth = -100

display_set_gui_size(480,270)
draw_set_circle_precision(128);
draw_set_font(fnt_default)
randomize();

audio_group_load(Music)
audio_group_load(SoundFX)
