if (stage = 3)
{
	if (mouse_check_button_pressed(mb_left))
	{
		stage = 4
	}
}

if (IS_HTML5)
{
	if (window_get_width() != display_get_width()) || (window_get_height() != display_get_height())
	{
		window_set_size(display_get_width(),display_get_height())
	}
}
