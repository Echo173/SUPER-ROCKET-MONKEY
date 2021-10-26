if (bg_alpha > 0) || (bg_alpha_white > 0)
{
	draw_set_color(c_black)
	draw_set_alpha(bg_alpha)
	draw_rectangle(0,0,room_width,room_height,false)
	draw_set_color(c_white)
	draw_set_alpha(bg_alpha_white)
	draw_rectangle(0,0,room_width,room_height,false)
	draw_set_alpha(1)
}

for (var ii = 0; ii < 5; ii += 1)
{
	if (draw[ii] = true)
	{
		var spr = 0
		switch (ii)
		{
			case 0: spr = spr_title_6 break;	
			case 1: spr = spr_title_5 break;
			case 2: spr = spr_title_4 break;
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
