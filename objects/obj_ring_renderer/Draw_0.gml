//Draw circles
var need_to_swap = false

if (instance_exists(obj_fade_out))
{
	with (obj_fade_out)
	{
		if (surface_exists(surf))
		{
			need_to_swap = true
			surface_set_target(surf)
			draw_clear(c_black);
			surface_reset_target();
		}
	}
}

if (instance_exists(obj_fade_in))
{
	with (obj_fade_in)
	{
		if (timer <= 0)
		{
			if (surface_exists(surf))
			{
				need_to_swap = true
				surface_set_target(surf)
				draw_clear(c_black);
				surface_reset_target();
			}
		}
		else
		{
			need_to_swap = false	
		}
	}
}

//Remove centres of circles
if (need_to_swap = true) 
{
	gpu_set_blendmode(bm_subtract)

	if (instance_exists(obj_fade_out))
	{
		with (obj_fade_out)
		{
			if (surface_exists(surf))
			{
				if (rad > 0)
				{
					surface_set_target(surf);
					draw_circle(w/2 + o/2,h/2 + o/2,rad,false)	
					surface_reset_target();
				}
			}
		}
	}
	
	if (instance_exists(obj_fade_in))
	{
		with (obj_fade_in)
		{
			if (timer <= 0)
			{
				if (surface_exists(surf))
				{
					surface_set_target(surf)
					draw_circle(w/2 + o/2,h/2 + o/2,rad,false)
					surface_reset_target();
				}	
			}
		}
	}

	gpu_set_blendmode(bm_normal)
}