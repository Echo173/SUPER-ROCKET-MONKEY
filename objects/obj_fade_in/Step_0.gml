timer -= 1
if (timer <= 0)
{
	if (rad > w/2)
	{
		if (room = rm_area_1) || (room = rm_area_2) || (room = rm_area_3)
		{
			var _snd = get_monkey_sound(false)
			audio_play_sound(_snd,9,false)
		}
			
		instance_destroy();
		exit;
	}
	
	rad += spd
	spd += 1
}	
