if (instance_exists(obj_fade_in)) && (reset_init = false)
{
	if (obj_fade_in.timer > 0)
	{
		reset_init = true
		
		broken = false
		trigger = false
		
		layer_set_visible("BreakWallTiles",true)
		layer_set_visible("BreakWallDetail",true)
	}
}