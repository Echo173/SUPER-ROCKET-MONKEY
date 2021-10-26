if (init = 0)
{
	init = 1
	
	var s = choose(-1,1)
	xspd = random_range(min_spd,max_spd) * s
	
	var s = choose(-1,1)
	yspd = random_range(min_spd,max_spd) * s
	
	zspd = random_range(-3,-6)
}

//if (abs(xspd) > 1) || (abs(yspd) > 1) || (abs(zspd) > 1)
//{
//	var col = c_white
	
//	switch (sprite_index)
//	{
//		case spr_monkey_chunk:
//			col = c_red
//			break;
		
//		case spr_rocketpack_particle:
//			col = c_ltgrey
//			break;
//	}
	
//	trail_fx(x,y+z,3,col)
//}

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
	
	var roll = irandom(1)
			
	for (var ii = 0; ii <= roll; ii += 1)
	{
		instance_create_layer(x + irandom_range(-1,1), y + irandom_range(-1,1) + z,"AirFX",obj_smoke_fx)
	}

	if (z > 0)
	{
		z = 0
		zspd *= -0.5
		xspd *= 0.5
		yspd *= 0.5
		
		if (abs(zspd) < 1) instance_destroy();
			
		if (!place_meeting(x,y,obj_ground))
		{
			ripple_fx(sprite_get_width(sprite_index) * 8,25)
			
			if (bounce <= 0)
			{
				if (sprite_get_width(sprite_index) <= 4)
				{
					splash_fx("small")
				}
				else
				{
					splash_fx("medium")
				}
				instance_destroy();
			}
			
			bounce -= 1	
		}
	}
}
