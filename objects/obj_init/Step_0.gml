//Music
if (audio_is_playing(snd_menu_music)) {
	if (room != rm_main_menu) {
		if (audio_sound_get_gain(snd_menu_music) <= 0)
		{
			audio_stop_sound(snd_menu_music);	
		}
	}
}

if (audio_is_playing(snd_story_music)) {
	if (room != rm_win) {
		if (audio_sound_get_gain(snd_story_music) <= 0)
		{
			audio_stop_sound(snd_story_music);	
		}
	}
}

if (room = rm_init) || (room = rm_transition) || (room = rm_main_menu) || (room = rm_win) {
	exit;	
}

//Fix Layers
if (room = rm_area_3)
{
	if (layer_init = 0)
	{
		layer_init = 1	
		layer_set_visible("Covers",true)
		layer_set_visible("LavaWall",true)
	}
}
else
{
	layer_init = 0
}

//Tutorial
if (instance_exists(obj_player))
{
	switch (global.tutorial_stage)
	{
		case 0:
			global.is_cutscene = true
			tutorial_timer += 1
			if (tutorial_timer > 90) {
				global.is_cutscene = false
				global.tutorial_stage += 1
				tutorial_string = "Press the SPACEBAR to scout the path ahead"
			}
			break;
		case 1:
			if (tutorial_alpha < 1)
			{
				tutorial_alpha += 0.1
			}
			else
			{
				if (obj_player.scouting = true)
				{
					global.tutorial_stage += 1
				}
			}
			break;
		case 2:
			if (obj_player.scouting = false)
			{
				tutorial_string_old = tutorial_string
				tutorial_string = "Try using short bursts of your CHIMP-D to reach the next island.\nUse the left mouse button to fire your CHIMP-D."
				tutorial_alpha_dir = -1
				
				global.tutorial_stage += 1
			}
			break;
			
		case 3:
			tutorial_alpha += 0.1 * tutorial_alpha_dir
			tutorial_alpha = clamp(tutorial_alpha,0,1)
			if (tutorial_alpha <= 0) tutorial_alpha_dir = 1
			if (tutorial_alpha >= 1) && (tutorial_alpha_dir = 1)
			{
				if (obj_player.state = "grounded") && (global.checkpoint > 0)
				{
					tutorial_string_old = tutorial_string
					tutorial_string = "Take care not to overheat while flying.\nOverheating with cause you to lose control of the CHIMP-D's Engines."
					tutorial_alpha_dir = -1
				
					global.tutorial_stage += 1
					tutorial_timer = 0
				}
			}
			break;
			
		case 4:
			tutorial_alpha += 0.1 * tutorial_alpha_dir
			tutorial_alpha = clamp(tutorial_alpha,0,1)
			if (tutorial_alpha <= 0) tutorial_alpha_dir = 1
			if (tutorial_alpha >= 1) && (tutorial_alpha_dir = 1)
			{
				if (obj_player.state != "grounded") {
					tutorial_timer += 1
				}
				
				if (tutorial_timer > 180) || (global.disabled_checkpoint_id != noone)
				{
					tutorial_string_old = tutorial_string
					tutorial_string = ""
					tutorial_alpha_dir = -1
				
					global.tutorial_stage += 1
					tutorial_timer = 0
				}
			}
			break;
			
		case 5:
			tutorial_alpha += 0.1 * tutorial_alpha_dir
			tutorial_alpha = clamp(tutorial_alpha,0,1)
			if (tutorial_alpha <= 0) tutorial_alpha_dir = 1
			if (tutorial_alpha >= 1) && (tutorial_alpha_dir = 1)
			{
				if (obj_player.state = "grounded") && (global.disabled_checkpoint_id != noone)
				{
					tutorial_string_old = tutorial_string
					tutorial_string = "You will always respawn next to the sacred flame.\nBut Be careful!\nDeath causes the sacred flame to move backwards one torch."
					tutorial_alpha_dir = -1
				
					global.tutorial_stage += 1
				}
			}
			break;
			
		case 6:
			tutorial_alpha += 0.1 * tutorial_alpha_dir
			tutorial_alpha = clamp(tutorial_alpha,0,1)
			if (tutorial_alpha <= 0) tutorial_alpha_dir = 1
			if (tutorial_alpha >= 1) && (tutorial_alpha_dir = 1)
			{
				if (global.disabled_checkpoint_id = noone)
				{
					tutorial_string_old = tutorial_string
					tutorial_string = ""
					tutorial_alpha_dir = -1
				
					global.tutorial_stage += 1
				}
			}
			break;
			
		case 7:
			tutorial_alpha += 0.1 * tutorial_alpha_dir
			tutorial_alpha = clamp(tutorial_alpha,0,1)
			if (tutorial_alpha <= 0) global.tutorial_stage += 1
			break;
	}
}

//Timer
if (room = rm_area_1) || (room = rm_area_2) || (room = rm_area_3) {
	
	if (global.in_menu = false)
	{
		global.secs += 1/room_speed;
	}

	if (global.secs >= 60)
	{
		global.secs -= 60
		global.mins += 1
	}

	if (global.mins >= 60)
	{
		global.mins -= 60
		global.hrs += 1
	}
}

//Checkpoints
if (init = 0)
{
	init = 1
		
	var _id;
	var num = 99
	with (obj_checkpoint)
	{
		if (checkpoint_index < num)
		{
			_id = id
			num = checkpoint_index
		}
	}
		
	global.checkpoint = 0
	global.checkpoint_id = _id
}
else
{
	var _id = noone
	with (obj_checkpoint)
	{
		if (global.checkpoint = checkpoint_index)
		{
			_id = id
		}
	}
	global.checkpoint_id = _id
	
	if (global.checkpoint <= 9) 
	{
		global.checkpoint_room = rm_area_1
	}
	else
	{
		if (global.checkpoint <= 17) 
		{
			global.checkpoint_room = rm_area_2
		}
		else
		{
			global.checkpoint_room = rm_area_3
		}
	}
}