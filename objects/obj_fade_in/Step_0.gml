timer -= 1
if (timer <= 0)
{
	if (rad > w/2)
	{
		var _snd = get_monkey_sound(false)
		audio_play_sound(_snd,9,false)
			
		instance_destroy();
		exit;
	}
	
	rad += spd
	spd += 1
}	
