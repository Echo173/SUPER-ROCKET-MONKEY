if (obj_main_menu.stage >= 5) && (IS_HTML5)
{
	visible = true
	if (clicked_anim = false)
	{
		if (instance_position(mouse_x,mouse_y,id))
		{
			image_index = 1
			if (mouse_check_button_pressed(mb_left))
			{
				audio_play_sound(snd_scout,100,false)
				
				audio_sound_gain(snd_menu_music,0,2000)
				
				var _r = instance_create_layer(x,y,layer,obj_fade_out)
				_r.room_target = rm_area_1
				clicked_anim = true
				
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
			}
		}
		else
		{
			image_index = 0
		}
	}
	else
	{
		image_index = 2
	}
}
else
{
	visible = false	
}