if (death = false) && (warp = false)
{
	if (room = rm_area_3) {
		shader_set(shd_black)
	} else {
		shader_set(shd_shadow)
	}
	
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,0.5)
	shader_reset();
	
	var avg_spd = max(abs(xspd),abs(yspd))
	_ho = 1 + (avg_spd * 1.25)
	
	if (flash = 1)
	{
		draw_sprite_ext(sprite_index,image_index,x - 1,y - _ho,image_xscale,image_yscale,image_angle,image_blend,1)
	
		if (overheated = true) {
			draw_sprite_ext(sprite_index,image_index,x - 1,y - _ho,image_xscale,image_yscale,image_angle,c_black,0.5 * lowfuel_anim_alpha)
		}
		
		if (fuel = 0) {
			if (avg_spd > 0.5)
			{
				var roll = irandom(2)
			
				for (var ii = 0; ii <= roll; ii += 1)
				{
					instance_create_layer(x + irandom_range(-4,4), y + irandom_range(-4,4) - _ho,"AirFX",obj_smoke_fx)
				}
			}
		}
	}
	
	//Guide Arrow
	if (guide_arrow = true) 
	{
		guide_arrow_alpha += 0.05 * guide_arrow_alpha_dir
		if (guide_arrow_alpha < 0) || (guide_arrow_alpha > 1)
		{
			if (guide_arrow_stop_timer > 90) {
				guide_arrow = false
			}
			guide_arrow_alpha_dir *= -1
		}
	}
	else
	{
		guide_arrow_alpha = approach(guide_arrow_alpha, 0, 0.05)
	}
	draw_sprite_ext(spr_guide_arrow,0,x,y,1,1,guide_arrow_dir,c_white,guide_arrow_alpha)
	
	if (key_thrust) {
		guide_arrow_stop = true
		guide_arrow_stop_timer += 3
	}

	if (guide_arrow_stop = true) {
		guide_arrow_stop_timer += 1
	}
	
	//Low fuel flash
	if (lowfuel_anim = true)
	{
		lowfuel_anim_alpha -= 0.05
		if (lowfuel_anim_alpha <= 0)
		{
			lowfuel_anim_alpha = 1
		}
	}
	else
	{
		lowfuel_anim_alpha = 0
	}
	
	//draw_text(x,y-32,30 - (29 * (1 - (avg_spd/max_spd))))
	
	if (flash_duration > 0)
	{
		flash_timer -= 1
		if (flash_timer <= 0)
		{
			//flash *= -1
			flash_timer = 6
		}
	}
	else
	{
		flash = 1	
	}
	flash_duration -= 1
}

