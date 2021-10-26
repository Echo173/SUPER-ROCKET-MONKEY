shader_set(shd_shadow)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,0.25)
shader_reset();
	
draw_sprite_ext(sprite_index,image_index,x - 1,y + z,image_xscale,image_yscale,image_angle,image_blend,1)