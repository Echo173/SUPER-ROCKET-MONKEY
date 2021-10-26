if (spawn_point_init = 0)
{
	spawn_point_init = 1
	
	var dist = 999
	with (obj_checkpoint_spawn)
	{
		if (distance_to_object(other) < dist)
		{
			other.spawn_point = id
			dist = distance_to_object(other)
		}
	}
}

if (global.checkpoint = checkpoint_index)
{
	delay_timer = 20
	
	if (highlight = true) {
		image_index = 2
	}
	
	obj_player.respawn_x = spawn_point.x
	obj_player.respawn_y = spawn_point.y
	
	if (flash_duration > 0)
	{
		if (flash_dir = 1)
		{
			image_index = 1
		}
		
		flash_timer -= 1
		if (flash_timer < 0)
		{
			flash_timer = 2
			flash_dir *= -1
		}
	}
	flash_duration -= 1
}
else
{
	highlight = false
	if (global.disabled_checkpoint_id != id) && (global.is_respawn = false) && (obj_init.init = 1)
	{
		image_index = 0
	
		if (obj_player.death = false)
		{
			if (point_distance(x,y,obj_player.x,obj_player.y) < 256)
			{
				if (obj_player.state = "grounded") && (!collision_line(x,y,obj_player.x,obj_player.y,obj_collision,false,true))
				{
					global.checkpoint = checkpoint_index
					
					if (instance_exists(global.disabled_checkpoint_id))
					{
						if (global.disabled_checkpoint_id.checkpoint_index < checkpoint_index) {
							global.disabled_checkpoint_id = noone
						}
					}
					
					pulse_fx(80,20)
				}
			}
		}
	}
	else
	{
		image_index = 3
		if (delay_timer <= 0)
		{
			if (p_timer <= 0)
			{
				if (distance_to_object(obj_camera) < 260) && (!position_meeting(x,y,obj_lava_wall))
				{
					p_timer = irandom(10)
					instance_create_layer(x + irandom_range(-1,1), y + irandom_range(-1,1),"AirFX",obj_checkpoint_particle_gray)
				}
			}
		}
		p_timer -= 1
		delay_timer -= 1
	}
}
