draw_self();
if (spriteline_y < obj_camera.y + 148)
{
	var min_xx = (obj_camera.x - 260) div 16
	var max_xx = (obj_camera.x + 260) div 16
	
	
	for (var xx = min_xx; xx < max_xx; xx += 1)
	{
		draw_sprite(spr_lava_wall_edge,image_index,(xx * 16) + offset,spriteline_y)
	}
}