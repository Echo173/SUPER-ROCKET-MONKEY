switch (stage)
{
	case 0:
		timer += 1
		if (timer > 15)
		{
			alpha += 0.05
			
			shader_set(shd_white)
			draw_set_alpha(alpha)
			draw_sprite(sprite_index,image_index,x,y)
			draw_set_alpha(1)
			shader_reset();
			
			if (alpha > 1)
			{
				stage += 1
				timer = 0
			}
		}
		break;
	
	case 1:
		alpha -= 0.05
			
		draw_sprite(sprite_index,image_index,x,y)
		
		shader_set(shd_white)
		draw_set_alpha(alpha)
		draw_sprite(sprite_index,image_index,x,y)
		draw_set_alpha(1)
		shader_reset();
		
		if (alpha < 0)
		{
			stage += 1
			timer = 0
		}
		break;
		
	case 2:
		draw_sprite(sprite_index,image_index,x,y)
		timer += 1
		if (timer > 30)
		{
			stage += 1	
		}
		break;
		
	case 3:
		draw_sprite(sprite_index,image_index,x,y)
		
		draw_set_halign(fa_center)
		draw_set_alpha(alpha)
		draw_text(x,y + 64,"click to continue")
		draw_set_alpha(1)
		draw_set_halign(fa_left)
		
		alpha += 0.05 * alpha_dir
		if (alpha > 1) || (alpha < 0) alpha_dir *= -1
		break;
		
	case 4:
		draw_set_halign(fa_center)
		draw_set_alpha(alpha)
		if (alpha_dir = -1) draw_sprite(sprite_index,image_index,x,y)
		draw_text(x,y + 64,"click to continue")
		draw_set_alpha(1)
		draw_set_halign(fa_left)
		
		if (alpha_dir = 1) draw_sprite(sprite_index,image_index,x,y)
		
		alpha += 0.05 * alpha_dir
		if (alpha > 1) alpha_dir *= -1
		if (alpha < 0) stage += 1
		break;
	
	case 5:
		room_goto_next();
		break;
}
