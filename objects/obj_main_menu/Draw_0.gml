for (var ii = 3; ii < 5; ii += 1)
{
	if (draw[ii] = true)
	{
		var spr = 0
		switch (ii)
		{
			case 4: spr = spr_title_3 break;	
			case 3: spr = spr_title_2 break;
		}
		
		xpos[ii] += irandom_range(-shake_mag[ii],shake_mag[ii])
		ypos[ii] += irandom_range(-shake_mag[ii],shake_mag[ii])
		
		shake_mag[ii] = approach(shake_mag[ii],0,0.5)
		
		if (shake_mag[ii] = 0) && (scale[ii] = 1) {
			alpha[ii] = approach(alpha[ii],0,0.1)
		}
		
		if (alpha[ii] < 1)
		{
			draw_sprite_ext(spr,0,bx + xpos[ii],by + ypos[ii],scale[ii],scale[ii],0,c_white,1)
		}
		
		if (alpha[ii] > 0)
		{
			shader_set(shd_white)
			draw_sprite_ext(spr,0,bx + xpos[ii],by + ypos[ii],scale[ii],scale[ii],0,c_white,alpha[ii])
			shader_reset();
		}
	}
}
