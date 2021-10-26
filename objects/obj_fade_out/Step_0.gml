timer -= 1
if (timer <= 0)
{
	if (rad <= 0)
	{
		go_timer += 1
		
		if (go_timer > 5) && (!instance_exists(obj_fade_in))
		{
			instance_create_layer(x,y,layer,obj_fade_in)
		}
		
		if (go_timer > 10)
		{
			if (respawn = true)
			{
				if (global.checkpoint_room = room)
				{
					with (obj_player)
					{
						x = respawn_x
						y = respawn_y
						death = false
						fuel =max_fuel
						flash_duration = maxflash
					
						guide_arrow = true
						guide_arrow_dir = 1
						guide_arrow_dir = guide_arrow_get_dir(global.checkpoint)
						guide_arrow_stop = false
						guide_arrow_stop_timer = 0
					}
					
					obj_camera.x = obj_player.x
					obj_camera.y = obj_player.y
				}
				else
				{
					
					global.is_respawn = true
					global.transition_room = global.checkpoint_room
					room_goto(rm_transition);
				}
				
				if (global.checkpoint > 0)
				{
					global.disabled_checkpoint_id = global.checkpoint_id
					global.checkpoint -= 1
					
					if (global.checkpoint_room = rm_area_2) && (global.checkpoint < 10)
					{
						global.checkpoint_room = rm_area_1
					}
					
					if (global.checkpoint_room = rm_area_3) && (global.checkpoint < 18)
					{
						global.checkpoint_room = rm_area_2
					}
				}
				else
				{
					global.disabled_checkpoint_id = noone
				}
			}
			else
			{
				global.transition_room = room_target
				room_goto(rm_transition);
			}
		
			surface_free(surf);
			instance_destroy();
			exit;
		}
	}
	
	rad = approach(rad,0,spd)
	spd += 1
}
