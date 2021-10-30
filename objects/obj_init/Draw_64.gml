if (global.in_menu = false)
{
	if (global.tutorial_stage < 8) && (tutorial_string != "" || tutorial_string_old != "")
	{
		draw_set_alpha(tutorial_alpha)
		draw_set_halign(fa_center)

		if (tutorial_alpha_dir = -1)
		{
			draw_text(240,270 - string_height(tutorial_string_old) - 6,tutorial_string_old)	
		}
		else
		{
			draw_text(240,270 - string_height(tutorial_string) - 6,tutorial_string)
		}

		draw_set_halign(fa_left)
		draw_set_alpha(1)
	}
}
