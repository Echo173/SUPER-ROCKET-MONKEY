if (active = false)
{
	if (trigger = true)
	{
		trigger = false
		active = true
		
		reset_init = false
		
		visible = true
		mask_index = sprite_index
	}
}
else
{
	if (global.is_cutscene = true)
	{
		image_yscale += (return_scale - image_yscale)/50
	}
	else
	{
		if (end_cutscene_init = 0) {
			end_cutscene_init = 1
			image_yscale = return_scale
		}
		
		var spd = pixel_spd/16
		image_yscale += spd
	}
	
	spriteline_y = y - (image_yscale * 16)
	
	step += 1
	
	offset_spd = sin(step/100) * 3
	
	offset += offset_spd
	if (offset > 16) offset -= 16
	if (offset < 0) offset += 16
}
