switch (stage)
{
	case 0:
		if (go = true)
		{
			go = false
			global.is_cutscene = true
			obj_camera.target = obj_checkpoint_final
			stage += 1
			timer = 0
		}
		break;
		
	case 1:
		timer += 1
		if (timer > 60)
		{
			stage += 1
			timer = 0
		}
		break;
		
	case 2:
		timer += 1
		if (timer > 3)
		{
			timer = 0
			
			if (symbol_frame = sprite_get_number(spr_door_symbol_left) - 1) {
				stage += 1
				timer = 0
				
				var m = 1
				if (is_left = false) m = -1
				var fx_x = x + (16 * image_xscale * m)
				
				if (!audio_is_playing(snd_checkpoint_get)) audio_play_sound(snd_checkpoint_get,80,false)
				pulse_fx_pos(fx_x,y,128,20)
				
			} else {
				symbol_frame += 1
				
				if (symbol_frame = 13) {
					if (!audio_is_playing(snd_checkpoint_arrive)) audio_play_sound(snd_checkpoint_arrive,80,false)
					
					var m = 1
					if (is_left = false) m = -1
					var fx_x = x + (16 * image_xscale * m)
					var _p = pulse_fx_pos(fx_x,y,64,25)
					_p.col = c_white
				}
			}			
		}
		break;
		
	case 3:
		timer += 1
		if (timer > 60)
		{
			stage += 1
			timer = 0
			if (!audio_is_playing(snd_door_open)) {
				audio_play_sound(snd_door_open,50,false)
				audio_sound_gain(snd_door_open,0,0)
				audio_sound_gain(snd_door_open,1 * index_get_gain(global.sound_volume_index,true),500)
			}
			
		}
		break;
		
	case 4:
		cam_shake(1,0.1,90)
		if (image_xscale > 0.8 * scale)
		{
			spd += 0.0005
			image_xscale = approach(image_xscale, 0.8 * scale, spd * scale)
			
		}
		else
		{
			if (!audio_is_playing(snd_door_slam)) {
				audio_play_sound(snd_door_slam,80,false)
			}
			
			audio_stop_sound(snd_door_open)
			
			cam_shake(5,0.25,0)
			stage += 1	
			timer = 0
		}
		break;
	
	case 5:
		timer += 1
		if (timer > 30)
		{
			stage += 1	
			spd = 0
			
			if (!audio_is_playing(snd_door_open)) {
				audio_play_sound(snd_door_open,50,false)
				audio_sound_gain(snd_door_open,0,0)
				audio_sound_gain(snd_door_open,1 * index_get_gain(global.sound_volume_index,true),500)
			}
		}
		break;
		
	case 6:
		cam_shake(2,0.1,90)
		if (image_xscale > 0)
		{
			spd += 0.0005
			image_xscale = approach(image_xscale, 0, spd * scale)
		}
		else
		{
			if (!audio_is_playing(snd_door_slam)) {
				audio_play_sound(snd_door_slam,80,false)
			}
			audio_stop_sound(snd_door_open)
			
			timer = 0
			stage += 1
			cam_shake(5,0.25,0)
		}
		break;
		
	case 7:
		timer += 1
		if (timer > 60)
		{
			obj_camera.target = obj_banana
			timer = 0
			stage += 1
		}
		break;
		
	case 8:
		timer += 1
		if (timer > 90)
		{
			obj_camera.target = obj_player
			global.is_cutscene = false
			global.final_door = true
			instance_destroy();
		}	
		break;
}