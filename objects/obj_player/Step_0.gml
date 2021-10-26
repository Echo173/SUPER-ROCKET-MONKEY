//Music
if (!audio_is_playing(snd_level_music)) {
	audio_play_sound(snd_level_music,100,true)
	audio_sound_gain(snd_level_music,index_get_gain(global.music_volume_index,false),0)
}
if (room = rm_area_3) {
	if (!audio_is_playing(snd_level_final_music)) audio_play_sound(snd_level_final_music,100,true)
}
else
{
	audio_stop_sound(snd_level_final_music)
}

//Respawn Load
if (global.is_respawn = true)
{
	global.is_respawn = false
	
	var _id = noone
	with (obj_checkpoint)
	{
		if (global.checkpoint + 1 = checkpoint_index)
		{
			_id = id
		}
	}
	global.checkpoint_id = _id
	
	with (_id)
	{
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
	
	x = _id.spawn_point.x
	y = _id.spawn_point.y
	
	obj_camera.x = x
	obj_camera.y = y

	guide_arrow = true
	guide_arrow_dir = 1
	guide_arrow_dir = guide_arrow_get_dir(max(0,global.checkpoint + 1))
	guide_arrow_stop = false
	guide_arrow_stop_timer = 0
	
	warp = false
	
	global.disabled_checkpoint_id = _id
}

//Death
if (death = true) || (warp = true) {
	if (audio_is_playing(snd_jet)) audio_stop_sound(snd_jet);
	if (audio_is_playing(snd_overheat)) audio_stop_sound(snd_overheat);
	land_init = 1
	exit;	
}

//Inputs
key_scout = keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_right)
key_thrust = mouse_check_button(mb_left)

if (state = "grounded") && (scouting = false)
{
	if (keyboard_check_pressed(vk_escape)) || (keyboard_check_pressed(ord("P")))
	{
		if (global.in_menu = true) {
			global.in_menu = false
		} else {
			global.in_menu = true	
		}
	}
}

//Important vars
var avg_spd = max(abs(xspd),abs(yspd))
maxflash = clamp(point_distance(x,y,respawn_x,respawn_y)/8,30,90)

//Scout
if (key_scout) && (state = "grounded") && (!global.is_cutscene = true) && (!global.in_menu = true)
{
	if (scouting = true) {
		scouting = false
		audio_play_sound(snd_scout,50,false)
	} else {
		scouting = true
		audio_play_sound(snd_scout,50,false)
	}
}

if (overheated = false) && (fuel <= 0)
{
	overheated = true
}
if (overheated = true) && (fuel = max_fuel) overheated = false
if (scouting = true) || (overheated = true) || (global.is_cutscene = true) || (global.in_menu = true) || (global.tutorial_stage = 1) key_thrust = 0

//Aim Dir
goto_dir = point_direction(x,y,mouse_x,mouse_y)
aim_dir += angle_difference(goto_dir,aim_dir)/(20 - (15 * (1 - (avg_spd/max_spd))))

//Thrust
thrust = 0.25
if (key_thrust) && (fuel > 0) && (scouting = false)
{
	if (!audio_is_playing(snd_jet)) audio_play_sound(snd_jet,5,false);
	
	fuel -= 1
	xspd += lengthdir_x(thrust,	aim_dir)
	yspd += lengthdir_y(thrust, aim_dir)
}
else
{
	if (audio_is_playing(snd_jet)) audio_stop_sound(snd_jet);
}
//Set Fric and Thrust
var extra_fric = 0

if (!key_thrust) && (avg_spd < 3)
{
	 extra_fric = (3 - avg_spd)/15
}
fric = 0.075 + extra_fric

if (global.is_cutscene = true) {
	fric = 1
}

max_spd = 8

//Improved Movement
var mdir = point_direction(0,0,xspd,yspd)
var xfric = abs(fric * lengthdir_x(1,mdir))
var yfric = abs(fric * lengthdir_y(1,mdir))
var xmax = abs(max_spd * lengthdir_x(1,mdir))
var ymax = abs(max_spd * lengthdir_y(1,mdir))

//if (avg_spd > max_spd - 2)
//{
//	var mag = 2 - (max_spd - avg_spd)
//	cam_shake(mag * 0.25,0.2,mdir)
//}

xspd = approach(xspd,0,xfric)
yspd = approach(yspd,0,yfric)

xspd = clamp(xspd,-xmax, xmax)
yspd = clamp(yspd,-ymax, ymax)

//Animation
image_angle = aim_dir

var min_spd = 0.8
if (key_thrust) && (fuel > 0) min_spd = -1

if (avg_spd < min_spd) {
	state = "grounded"
	if (scouting = false) {
		sprite_index = spr_player_grounded
	} else {
		sprite_index = spr_player_scouting
	}

}
if (avg_spd >= min_spd) {
	land_init = 0
	if (state = "flying")
	{
		state_change_timer += 1
		if (state_change_timer > 10)
		{
			state = "gliding"
			sprite_index = spr_player_gliding
		}
	}
	else
	{
		state = "gliding"
		sprite_index = spr_player_gliding
	}
}
if (avg_spd > 3) {
	state = "flying"
	sprite_index = spr_player_flying
	state_change_timer = 0
	
	land_fx_init = 0
	land_init = 0
}

//Sound
if (state = "flying")
{
	if (collision_circle(x,y,40,obj_collision,false,true))
	{
		voice_timer -= 1
		if (avg_spd > 6) voice_timer -= 1
		
		if (voice_timer <= 0)
		{
			voice_timer = irandom_range(120,240)
		
			var _snd = get_monkey_sound(false)
			audio_play_sound(_snd,9,false)
		}
	}
}

//Trail Effects
if (key_thrust) && (fuel > 0)
{
	//Rocket
	var xx = x - lengthdir_x(6,aim_dir)
	var yy = y - lengthdir_y(6,aim_dir) - _ho
	
	var t = instance_create_layer(xx,yy,"AirFX",obj_rocket_trail_fx)
	t.dir = mdir
	t.spd = avg_spd/4
	t.image_angle = mdir
	
	if (avg_spd > 7)
	{
		xx = x - lengthdir_x(6,aim_dir) + lengthdir_x(4,mdir)
		yy = y - lengthdir_y(6,aim_dir) - _ho + lengthdir_y(4,mdir)
	
		t = instance_create_layer(xx,yy,"AirFX",obj_rocket_trail_fx)
		t.dir = mdir
		t.spd = avg_spd/4
		t.image_angle = mdir
	}
}
if (state != "grounded")
{
	if (!collision_circle(x,y-_ho,4,obj_ground,true,true))
	{
		//Water
		var roll = irandom_range(floor(avg_spd)/4,ceil(avg_spd)/2)
		for (var ii = 0; ii <= roll; ii += 1)
		{
			var dist = irandom(avg_spd)
			var xx = x + lengthdir_x(dist,mdir-180)
			var yy = y + lengthdir_y(dist,mdir-180)
			
			var t = instance_create_layer(xx,yy,"Ripple",obj_water_trail_fx)
		
			var spread = 15 + (30 * (avg_spd/max_spd))
			t.dir = mdir + irandom_range(-spread,spread)
		
			t.spd = avg_spd/4
		
			t.size = max(0.25,avg_spd/8)
			var big = true
			if (t.size <= 0.5)
			{
				t.size *= 2
				big = false
			}
			
			switch (room)
			{
				case rm_area_1:
					if (big = false) {
						t.sprite_index = spr_water_trail_effect_1
					} else {
						t.sprite_index = spr_water_trail_effect_big_1
					}
					break;
				case rm_area_2:
					if (big = false) {
						t.sprite_index = spr_water_trail_effect_2
					} else {
						t.sprite_index = spr_water_trail_effect_big_2
					}
					break;
				case rm_area_3:
					if (big = false) {
						t.sprite_index = spr_water_trail_effect_3
					} else {
						t.sprite_index = spr_water_trail_effect_big_3
					}
					break;
			}
			
			t.image_speed /= max(1,t.size)
		
			t.yscale = choose(0.5,0.5,0.75,1,1,1,1.25,1.25,1.5)
		
			if (state = "gliding") 
			{
				t.image_index = irandom_range(0.5,0.9)
			}
		}
	}
}

trail_fx_timer -= 1

//Low Fuel
if (fuel < max_fuel/3) || (overheated = true)
{
	lowfuel_anim = true
}
else
{
	lowfuel_anim = false
}

if (fuel < max_fuel)
{
	fuel_alpha = 1
}
else
{
	fuel_alpha = approach(fuel_alpha,0,0.1)
}	

if (fuel <= 0) {
	if (!audio_is_playing(snd_overheat)) audio_play_sound(snd_overheat,5,false);
} 

//Collisions
if (state = "grounded")
{
	if (land_init = 0)
	{
		land_init = 1
		if (!collision_circle(x,y,8,obj_ground,true,true))
		{
			player_death("water");
		}
		else
		{
			if (land_fx_init = 0)
			{
				land_fx_init = 1
				
				audio_play_sound(snd_land,1,false)
				var r = pulse_fx(32,15)
				r.col = c_white
			
				nofloor_death_timer = 0
			}
		}
	}
	
	if (fuel < max_fuel)
	{
		var fregen_spd = 10
		if (overheated = true) fregen_spd = 5
		fuel = approach(fuel,max_fuel,fregen_spd)
	}
}
else
{
	nofloor_death_timer = 0
}

//Lava Collision
if (place_meeting(x,y,obj_lava_wall))
{
	player_death("wall");	
}

//XCollision
if (xspd != 0)
{
	if (place_meeting(x + xspd,y,obj_collision))
	{
		if (xspd > 0) {
			x = floor(x)
		} else {
			x = ceil(x)
		}
		
		while (!place_meeting(x + sign(xspd),y,obj_collision))
		{
			x += sign(xspd)	
		}
		
		if (state = "flying") && (!(global.is_cutscene = true))
		{
			player_death("wall");
		}
		else
		{
			xspd *= -1			
		}
	}
}
x += xspd

//YCollision
if (yspd != 0)
{
	if (place_meeting(x,y + yspd,obj_collision))
	{
		if (yspd > 0) {
			y = floor(y)
		} else {
			y = ceil(y)
		}
		
		while (!place_meeting(x,y + sign(yspd),obj_collision))
		{
			y += sign(yspd)	
		}
		
		if (state = "flying") && (!(global.is_cutscene = true))
		{
			player_death("wall");
		}
		else
		{
			yspd *= -1			
		}
	}
}
y += yspd
