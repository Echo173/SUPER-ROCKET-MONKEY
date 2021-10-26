draw_self();

var m = 1
if (is_left = false) m = -1
var xx = x + (16 * image_xscale * m)

if (is_left = true) {
	draw_sprite(spr_door_symbol_left,symbol_frame,xx,y)
} else {
	draw_sprite(spr_door_symbol_right,symbol_frame,xx,y)
}