if (is_clear = false)
{
	if (timer <= 0) {
		room_goto(global.transition_room)
	}
	timer -= 1
}
else
{
	switch (stage)
	{
		case 0:
			timer += 1
			if (timer > 60)
			{
				timer = 0
				stage += 1
			}
			break;
			
		case 1:
			timer += 1
			
			alpha += 0.1 * alpha_dir
			if (alpha > 1 || alpha < 0) alpha_dir *= -1
			
			if (timer >= 200) && (alpha <= 0)
			{
				room_goto(global.transition_room)
			}
			break;
	}
}

if (IS_HTML5)
{
	if (window_get_width() != display_get_width()) || (window_get_height() != display_get_height())
	{
		window_set_size(display_get_width(),display_get_height())
	}
}
