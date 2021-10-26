if (death = false) && (warp = false)
{
	if (fuel_alpha > 0) || (lowfuel_anim = true)
	{
		//Draw Fuel Bar
		var xpos = x - 8
		var ypos = y - 14 - _ho
		draw_sprite_ext(spr_fuel_bar,0,xpos,ypos,16,1,0,c_black,0.5 * fuel_alpha)
		
		var ratio = fuel/max_fuel
		var col = make_color_rgb(255,255 * ratio,0)
		
		draw_sprite_ext(spr_fuel_bar,0,xpos,ypos,16 * (1 - ratio),1,0,col,1 * fuel_alpha)
		
		//Draw Refual flash anim
		draw_sprite_ext(spr_fuel_bar,0,xpos,ypos,16,1,0,c_white,lowfuel_anim_alpha)
	}
	
	if (fuel > 0)
	{
		if (key_thrust)
		{
			var jet_spr = 0
			if (state = "flying") {
				jet_spr = spr_player_jet_flying
			}
			if (state = "gliding") {
				jet_spr = spr_player_jet_gliding
			}
			
			draw_sprite_ext(jet_spr,jet_frame,x - 1,y - _ho,image_xscale,image_yscale,image_angle,image_blend,1)
			
			if (jet_timer <= 0)
			{
				var max_timer = 0
				if (state = "flying") max_timer = 2
				if (state = "gliding") jet_spr = max_timer = 3
				
				jet_timer = max_timer
				
				jet_frame += 1
				if (jet_frame > 1) jet_frame = 0
			}
			jet_timer -= 1
		}	
	}
}