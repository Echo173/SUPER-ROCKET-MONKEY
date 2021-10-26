//Draw circles
var need_to_swap = false

if (instance_exists(obj_ripple))
{
	with (obj_ripple)
	{
		if (surface_exists(surf))
		{
			need_to_swap = true
			surface_set_target(surf);
			draw_clear_alpha(c_white,0)

			draw_set_alpha(1 - r)
			draw_circle(size/2,size/2,rad,false)
			draw_set_alpha(1)

			surface_reset_target();
		}
	}
}
	
if (instance_exists(obj_pulse))
{
	with (obj_pulse)
	{
		if (surface_exists(surf))
		{
			need_to_swap = true
			surface_set_target(surf);
			draw_clear_alpha(c_white,0)

			var alpha = (1 - (r - (0.8 * (1 - r))))
			draw_set_alpha(alpha)

			if (col = -1) {
				draw_set_color(make_color_rgb(255,200,0))
			} else {
				draw_set_color(col)
			}

			draw_circle(size/2,size/2,rad,false)
			
			surface_reset_target();
		}
	}
	
	draw_set_alpha(1)
	draw_set_color(c_white)
}

//Remove centres of circles
if (need_to_swap = true) 
{
	gpu_set_blendmode(bm_subtract)

	if (instance_exists(obj_ripple))
	{
		with (obj_ripple)
		{
			if (surface_exists(surf))
			{
				surface_set_target(surf);
				draw_circle(size/2,size/2,rad - width,false)
				surface_reset_target();
			}
		}
	}
	
	if (instance_exists(obj_pulse))
	{
		with (obj_pulse)
		{
			if (surface_exists(surf))
			{
				surface_set_target(surf);
				draw_circle(size/2,size/2,rad - width,false)
				surface_reset_target();	
			}
		}
	}

	gpu_set_blendmode(bm_normal)
}