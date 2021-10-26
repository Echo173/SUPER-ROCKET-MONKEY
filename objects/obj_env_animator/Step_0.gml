timer += 1

if (timer > 45)
{
	timer = 0
	if (step = 1) {
		layer_set_visible(tile_layer_1,false)
		layer_set_visible(tile_layer_2,true)
	} else {
		layer_set_visible(tile_layer_1,true)
		layer_set_visible(tile_layer_2,false)
	}
	step *= -1
}	