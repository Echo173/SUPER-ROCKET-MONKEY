if (broken = false)
{
	image_xscale = scale
	if (trigger = true)
	{
		layer_set_visible("BreakWallTiles",false)
		layer_set_visible("BreakWallDetail",false)
		
		broken = true
		image_xscale = 0
		
		for (var ii = 0; ii < 10; ii += 1)
		{
			var xx = x + irandom_range(16,144)
			var yy = y + irandom_range(-4,4)

			instance_create_layer(xx, yy,"FloorFX",obj_wall_chunk_fx)
		}
	}
}
else
{
	reset_init = false
	image_xscale = 0	
}