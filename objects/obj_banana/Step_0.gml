switch (stage)
{
	case 0:
		hover_step += 1
		hover_y = 4 + (sin(hover_step/20) * 2)
		
		if (place_meeting(x,y,obj_player)) && (!instance_exists(obj_fade_in))
		{
			audio_sound_gain(snd_level_music,0,2000)
			audio_play_sound(snd_banana_get,100,false)
			audio_sound_pitch(snd_banana_get,1)
			audio_sound_gain(snd_banana_get,1*index_get_gain(global.sound_volume_index,true),0)
			
			global.is_cutscene = true
			stage += 1
			pulse_fx(80,20)
		}
		break;
	
	case 1:
		reset_init = false
		hover_y += (32 - hover_y)/15
		if (hover_y > 31)
		{
			stage += 1
			timer = 0
		}
		break;
		
	case 2:
		if (global.final_has_played = false)
		{
			var goto_dir = point_direction(x,y - hover_y,obj_player.x,obj_player.y)
			dir += angle_difference(goto_dir,dir)/(15 - spd/2)
			
			if (spd_dir = -1) {
				spd = approach(spd,0,0.05)
			} else {
				spd += 1
				if (spd >= 15) spd_dir = -1
			}
			
			x += lengthdir_x(spd,dir)
			y += lengthdir_y(spd,dir)
			
			if (spd_dir = -1)
			{
				hover_y = approach(hover_y,2,(15 - spd))
				if (spd < 0.05)
				{
					stage += 1
					timer = 0
				}
			}
			
			if (timer <= 0)
			{
				timer = max(5,(spd * 2))
				if (spd_dir != -1) timer = 30
				
				audio_play_sound(snd_banana_get,100,false)	
				audio_sound_pitch(snd_banana_get,pitch)
				audio_sound_gain(snd_banana_get,1*index_get_gain(global.sound_volume_index,true),0)
				
				pitch += 0.012
			}
			timer -= 1
		}
		else
		{
			stage += 1
		}
		break;
	
	case 3:
		size = approach(size,0,0.025)
		
		image_xscale = size
		image_yscale = size
		
		var _s = 25
		if (global.final_has_played = true) {
			_s = 15
			hover_y += (-hover_y)/15
		}
		
		x += (obj_player.x - x)/_s
		y += (obj_player.y - y)/_s
		
		if (size = 0) 
		{
			stage += 1
			timer = 0
			
			pulse_fx_pos(obj_player.x,obj_player.y,128,20)
			
			var p = pulse_fx_pos(obj_player.x,obj_player.y,128,35)
			p.col = c_white
			
			audio_play_sound(snd_banana_get,100,false)
			audio_sound_pitch(snd_banana_get,2)
			audio_sound_gain(snd_banana_get,1*index_get_gain(global.sound_volume_index,true),0)
		}
		break;
	
	case 4:
		timer += 1
		var max_timer = 180
		if (global.final_has_played = true) max_timer = 90
		if (timer > max_timer)
		{
			cam_shake(6,0,-1)
			
			var _time = 3750
			if (global.final_has_played = true) _time = 2200
			audio_sound_gain(snd_level_final_music,0.75 * index_get_gain(global.music_volume_index,false),_time)
			audio_sound_set_track_position(snd_level_final_music,0)
			
			audio_play_sound(snd_explode,80,false)	
			
			obj_cover_2.trigger = 1
			obj_wall_break.trigger = 1
			obj_lava_wall.trigger = true
			stage += 1
			timer = 0
		}
		break;
		
	case 5:
		timer += 1
		var max_timer = 90
		if (global.final_has_played = true) max_timer = 60
		if (timer > max_timer)
		{
			cam_shake(6,0.1,-1)
			stage += 1
			timer = 0
			obj_camera.target = obj_lava_wall
		}
		break;
		
	case 6:
		timer += 1
		var max_timer = 150
		if (global.final_has_played = true) max_timer = 60
		if (timer > max_timer)
		{
			obj_camera.target = obj_player
			global.is_cutscene = false
			global.final_has_played = true
			stage += 1
			timer = 0
		}
		break;
}

//Audio Fix
if (stage <= 4)
{
	if (audio_sound_get_gain(snd_level_final_music) != 0) {
		audio_sound_gain(snd_level_final_music,0,0)
	}
}
else
{
	if (audio_sound_get_gain(snd_level_music) != 0) {
		audio_sound_gain(snd_level_music,0,0)
	}
}