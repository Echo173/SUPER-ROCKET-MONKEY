if (instance_exists(obj_fade_in)) && (reset_init = false)
{
	if (obj_fade_in.timer > 0)
	{
		visible = true
		
		alpha = 1
		alpha_spd = 0
		trigger = false
	}
}