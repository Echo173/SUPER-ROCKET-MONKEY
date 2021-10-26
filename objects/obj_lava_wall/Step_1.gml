if (instance_exists(obj_fade_in)) && (reset_init = false)
{
	if (obj_fade_in.timer > 0)
	{
		reset_init = true
		
		x = return_x
		y = return_y
		image_yscale = return_scale/2
		
		end_cutscene_init = 0
		
		active = false
		trigger = false
		
		step = 0
		offset = 0
		offset_spd = 0
		
		spriteline_y = y

		visible = false
		mask_index = spr_lava_no_collision
	}
}