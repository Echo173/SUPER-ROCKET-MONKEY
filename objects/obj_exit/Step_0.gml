if (obj_main_menu.stage >= 5) && !(IS_HTML5)
{
	visible = true
	if (clicked_anim = false)
	{
		if (instance_position(mouse_x,mouse_y,id))
		{
			image_index = 1
			if (mouse_check_button_pressed(mb_left))
			{
				game_end();
			}
		}
		else
		{
			image_index = 0
		}
	}
	else
	{
		image_index = 2
	}
}
else
{
	visible = false	
}