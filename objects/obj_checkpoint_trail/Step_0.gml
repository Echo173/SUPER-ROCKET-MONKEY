if (loaded = true)
{
	var _id;
	with (obj_checkpoint)
	{
		if (global.checkpoint = checkpoint_index)
		{
			_id = id
		}
	}

	x = _id.x
	y = _id.y
	
	loaded = false
}

if (instance_exists(obj_fade_in)) {
	if (obj_fade_in.timer > -5) {
		exit;	
	}
}

if (instance_exists(global.checkpoint_id))
{
	goto_x = global.checkpoint_id.x
	goto_y = global.checkpoint_id.y
	
	if (global.disabled_checkpoint_id = noone) {
		timer = 0
	}
	
	if (x != goto_x) || (y != goto_y)
	{	
		if (timer <= 0)
		{
			if (dist = -1)
			{
				dist = point_distance(x,y,goto_x,goto_y)
				init = 0
				
				if (!instance_exists(global.disabled_checkpoint_id))
				{
					spd_mode = 1
					audio_play_sound(snd_checkpoint_arrive,5,false);
				}
				else
				{
					if (global.disabled_checkpoint_id.checkpoint_index > global.checkpoint) {
						spd_mode = 0
						audio_play_sound(snd_checkpoint_lose,5,false);
					} else {
						spd_mode = 1
						audio_play_sound(snd_checkpoint_arrive,5,false);
					}
				}
				
			}
		
			var d = point_distance(x,y,goto_x,goto_y)
		
			if (spd_mode = 0) {
				spd = 0.1 + (dist - d)/15
			} else {
				spd = 0.1 + d/8
			}
		
			var dir = point_direction(x,y,goto_x,goto_y)
			var xspd = lengthdir_x(spd,dir)
			var yspd = lengthdir_y(spd,dir)
		
			x = approach(x, goto_x, abs(xspd))
			y = approach(y, goto_y, abs(yspd))
			
			if (distance_to_object(obj_camera) < 260)
			{
				var roll = irandom_range(2,4)	
				for (var ii = 0; ii <= roll; ii += 1)
				{
					instance_create_layer(x + irandom_range(-xspd,0) + irandom_range(-2,2), y + irandom_range(-yspd,0) + irandom_range(-2,2),"AirFX",obj_checkpoint_particle)
				}
			}
		}
		else
		{
			if (p_timer <= 0)
			{
				if (distance_to_object(obj_camera) < 260) && (!position_meeting(x,y,obj_lava_wall))
				{
					p_timer = irandom(1)
					var pp = instance_create_layer(x + irandom_range(-1,1), y + irandom_range(-1,1),"AirFX",obj_checkpoint_particle)
					pp.float = true
				}
			
			}
			p_timer -= 1
		}
		timer -= 1
	}
	else
	{
		spd = 0	
		dist = -1
		
		
		if (init = 0)
		{
			init = 1
			
			if (global.final_door = false) {
					if (global.checkpoint = 21) {
					with (obj_door) {
						go = true
					}
				}
			}
			
			
			if (global.disabled_checkpoint_id = noone)
			{
				audio_play_sound(snd_checkpoint_get,3,false);
			}
			
			timer = 20
			
			global.checkpoint_id.flash_duration = 30
			global.checkpoint_id.highlight = true
			pulse_fx(80,20)
		}
		
		if (p_timer <= 0)
		{
			if (distance_to_object(obj_camera) < 260) && (!position_meeting(x,y,obj_lava_wall))
			{
				p_timer = irandom(1)
				var pp = instance_create_layer(x + irandom_range(-1,1), y + irandom_range(-1,1),"AirFX",obj_checkpoint_particle)
				pp.float = true
			}
			
		}
		p_timer -= 1
	}
}