//Approach
function approach(value,target_value,spd){
	if (value < target_value)
	{
		value += spd
		if (value > target_value)
		{
			return target_value;
		}
	}
	if (value > target_value)
	{
		value -= spd
		if (value < target_value)
		{
			return target_value;
		}
	}
	return value;
}

function index_get_gain(index,is_sfx)
{
	var _g = 0
	if (is_sfx = true)
	{
		switch (index)
		{
			case 0:
				_g = 0
				break;
			case 1:
				_g = 0.2
				break;
			case 2:
				_g = 0.5
				break;
			case 3:
				_g = 1
				break;
		}
	}
	else
	{
		switch (index)
		{
			case 0:
				_g = 0
				break;
			case 1:
				_g = 0.1
				break;
			case 2:
				_g = 0.4
				break;
			case 3:
				_g = 0.75
				break;
		}
	}
	
	return _g;
}

function ripple_fx(rad,_spd)
{
	r = noone
	if (x > 0 && x <  room_width && y > 0 && y < room_height)
	{
		var r = instance_create_layer(x,y,"Ripple",obj_ripple)
		r.goto_rad = rad
		r.spd = _spd
	}
	return r;
}

function pulse_fx(rad,_spd)
{
	r = noone
	if (x > 0 && x <  room_width && y > 0 && y < room_height)
	{
		r = instance_create_layer(x,y,"FloorFX",obj_pulse)
		r.goto_rad = rad
		r.spd = _spd
	}
	return r;
}

function pulse_fx_pos(_x,_y,rad,_spd)
{
	r = noone
	if (x > 0 && x <  room_width && y > 0 && y < room_height)
	{
		r = instance_create_layer(_x,_y,"FloorFX",obj_pulse)
		r.goto_rad = rad
		r.spd = _spd
	}
	return r;
}

function splash_fx(size)
{
	var _inst = noone
	switch (size)
	{
		case "small":
			_inst = instance_create_layer(x,y,"Ripple",obj_splash_fx_small)
			break;
			
		case "medium":
			_inst = instance_create_layer(x,y,"Ripple",obj_splash_fx_medium)
			break;
		
		case "big":
			_inst = instance_create_layer(x,y,"Ripple",obj_splash_fx_big)
			break;
	}
	
	return _inst;
}

function cam_shake(mag,dec,dir)
{
	obj_camera.shake_mag = mag
	obj_camera.shake_dec = dec
	obj_camera.shake_dir = dir
}

function bounce_part_fx(range,number,min_spd,max_spd,sprite)
{
	for (var ii = 0; ii < number; ii += 1)
	{
		var xx = x + irandom_range(-range,range)
		var yy = y + irandom_range(-range,range)
		
		if (!place_meeting(xx,yy,obj_collision))
		{
			var c = instance_create_layer(xx, yy,"FloorFX",obj_bounce_part_fx)
			c.min_spd = min_spd
			c.max_spd = max_spd
			c.sprite_index = sprite
		}
		else
		{
			ii -= 1
		}
	}
}

function explode_fx(number,range)
{
	for (var ii = 0; ii < number; ii += 1)
	{
		var roll = choose(0,0,0,0,0,1)
		var e = instance_create_layer(x + irandom_range(-range,range), y + irandom_range(-range,range),"AirFX",obj_explode_fx)
		
		if (roll = 1)
		{
			e.sprite_index = spr_explode_big
		}
		
		if (ii < number/2)
		{
			e.delay = 0
		}
		else
		{
			e.delay = ii
		}
	}
}

//function trail_fx(_x,_y,index,color)
//{
//	var tt = instance_create_layer(_x,_y,layer,obj_trail_fx)
//	tt.image_index = index
//	tt.image_blend = color
//}

function get_monkey_sound(is_death)
{
	var snd = 0
	if (is_death = true)
	{
		var roll = irandom(5)
		switch (roll)
		{
			case 0:
				snd = snd_monkey_death_1
				break;
			case 1:
				snd = snd_monkey_death_2
				break;
			case 2:
				snd = snd_monkey_death_3
				break;
			case 3:
				snd = snd_monkey_death_4
				break;
			case 4:
				snd = snd_monkey_death_5
				break;
			case 5:
				snd = snd_monkey_death_6
				break;
		}
	}
	else
	{
		var roll = irandom(7)
		switch (roll)
		{
			case 0:
				snd = snd_monkey_speak_1
				break;
			case 1:
				snd = snd_monkey_speak_2
				break;
			case 2:
				snd = snd_monkey_speak_3
				break;
			case 3:
				snd = snd_monkey_speak_4
				break;
			case 4:
				snd = snd_monkey_speak_5
				break;
			case 5:
				snd = snd_monkey_speak_6
				break;
			case 6:
				snd = snd_monkey_speak_7
				break;
			case 7:
				snd = snd_monkey_speak_8
				break;
		}
	}
	
	return snd;
}

function player_death(death_index)
{
	switch (death_index)
	{
		case "wall":
			audio_play_sound(snd_explode,10,false)
			
			cam_shake(8,0.5,-1)
			
			ripple_fx(128,30)
			explode_fx(20,16)
			
			bounce_part_fx(4,3,0,3,spr_monkey_chunk)
			bounce_part_fx(4,5,0,3,spr_rocketpack_chunk)
			
			//bounce_part_fx(4,10,1,5,spr_monkey_particle)
			//bounce_part_fx(4,10,1,5,spr_rocketpack_particle)
			break;
			
		case "water":
			audio_play_sound(snd_sink,10,false)
			
			var _snd = get_monkey_sound(true)
			audio_play_sound(_snd,9,false)
			
			cam_shake(2,0.1,-1)
			
			splash_fx("big")
			ripple_fx(160,32)
			break;
	}
	
	
	
	instance_create_layer(x,y,layer,obj_player_death)
	
	global.death_count += 1
	
	death = true
	
	xspd = 0
	yspd = 0
	
	exit;
}

function player_respawn()
{
	var f = instance_create_layer(x,y,layer,obj_fade_out)
	f.respawn = true
}

function guide_arrow_get_dir(checkpoint_index)
{
	var _dir = -45
	switch (checkpoint_index)
	{
		case 0: _dir = 0 break;
		case 1: _dir = 0 break;
		case 2: _dir = 90 break;
		case 3: _dir = 90 break;
		case 4: _dir = 180 break;
		case 5: _dir = 90 break;
		case 6: _dir = 90 break;
		case 7: _dir = 0 break;
		case 8: _dir = 0 break;
		case 9: _dir = 90 break;
		case 10: _dir = 90 break;
		case 11: _dir = 270 break;
		case 12: _dir = 0 break;
		case 13: _dir = 90 break;
		case 14: _dir = 0 break;
		case 15: _dir = 180 break;
		case 16: _dir = 180 break;
		case 17: _dir = 180 break;
		case 18: _dir = 0 break;
		case 19: _dir = 180 break;
		case 20: _dir = 180 break;
		case 21: _dir = 90 break;
	}
	
	return _dir;
}

//// @description Use this to fix window focus
//// @description Use this to fix window focus
//function focus_window(){
  
//}