switch (stage)
{
	case 0:
		timer += 1
		
		if (sound_init = 0) && (timer > 30)
		{
			sound_init = 1
			audio_play_sound(snd_title,100,false)
			audio_play_sound(snd_explode,90,false)
			audio_play_sound(snd_door_open,80,false)
		}
		
		if (timer > 60)
		{
			stage += 1
			timer = 0
			
			draw[0] = true
			alpha[0] = 1
			scale[0] = 10
			spd = 1
		}
		break;
		
	case 1:
		scale[0] = approach(scale[0],1,spd)
		spd += 0.1
		
		if (scale[0] = 1)
		{
			shake_mag[0] = 8
			
			audio_play_sound(snd_land,80,false)
			
			alpha[1] = 1
			scale[1] = 10
			spd = 1
			
			stage += 1
			timer = 35
		}
		break;
		
	case 2:
		if (timer <= 0)
		{
			draw[1] = true
			scale[1] = approach(scale[1],1,spd)
			spd += 0.1
		
			if (scale[1] = 1)
			{
				shake_mag[1] = 8
				
				audio_play_sound(snd_land,80,false)
			
				alpha[2] = 1
				scale[2] = 10
				spd = 1
			
				stage += 1
				timer = 30
			}
		}
		timer -= 1
		break;
		
	case 3:
		if (timer <= 0)
		{
			draw[2] = true
			scale[2] = approach(scale[2],1,spd)
			spd += 0.1
		
			if (scale[2] = 1)
			{
				shake_mag[2] = 8
				
				audio_play_sound(snd_land,80,false)
			
				stage += 1
				timer = 90
			}
		}
		timer -= 1
		break;
		
	case 4:
		if (timer <= 0)
		{
			bg_alpha_white += 0.1
			if (bg_alpha_white >= 1)
			{
				bg_alpha = 0
				
				draw[3] = true
				draw[4] = true
				
				stage += 1
				timer = 0
				
				audio_sound_gain(snd_door_open,0,2000)
				
				audio_play_sound(snd_menu_music,100,true)
				audio_sound_gain(snd_menu_music,0,0)
				audio_sound_gain(snd_menu_music,1 * index_get_gain(global.music_volume_index,false),2000)
			}
		}
		timer -= 1
		break;
		
	case 5:
		bg_alpha_white -= 0.01
		if (bg_alpha_white <= 0)
		{
			stage += 1
		}
		break;
		
	case 6:
		completed = true
		stage += 1
		break;
}

for (var ii = 0; ii < 5; ii += 1)
{
	if (draw[ii] = true)
	{
		xpos[ii] = 0
		ypos[ii] = 0
	}
}

if (stage >= 5)
{
	ypos[3] = sin(count/25) * 2
	ypos[4] = sin(count/25 + 1.25) * 2
	
	count += 1
}

if (IS_HTML5)
{
	if (window_get_width() != display_get_width()) || (window_get_height() != display_get_height())
	{
		window_set_size(display_get_width(),display_get_height())
	}
}