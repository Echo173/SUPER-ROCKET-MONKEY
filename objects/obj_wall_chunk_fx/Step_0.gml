if (init = 1)
{
	image_angle += xspd

	if (place_meeting(x + xspd,y,obj_collision))
	{
		xspd *= -1	
	}
	x += xspd

	if (place_meeting(x,y + yspd,obj_collision))
	{
		yspd *= -1	
	}
	y += yspd

	z += zspd
	
	zspd += grav
	
	if (z > 0)
	{
		z = 0
		zspd *= -0.5
		xspd *= 0.5
		yspd *= 0.5
		
		if (abs(zspd) < 1)
		{
			size -= 0.05
			if (size <= 0) {
				instance_destroy();
				exit;
			}
		}
		
		if (!place_meeting(x,y,obj_ground))
		{
			ripple_fx(sprite_get_width(sprite_index) * 8,25)
			var i = splash_fx("big")
			i.small_splash = true
				
			instance_destroy();
		}
	}
}

image_xscale = size
image_yscale = size

if (init = 0)
{
	init = 1
	
	var s = choose(-1,1)
	xspd = random_range(min_spd,max_spd) * s
	
	var s = 1
	yspd = random_range(min_spd,max_spd) * s
	
	zspd = random_range(-1,-3)
}