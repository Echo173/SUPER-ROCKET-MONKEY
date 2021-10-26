if (distance_to_object(obj_camera) < 260)
{
	for (var ii = 0; ii < 5; ii += 1)
	{
		var _h = pulse[ii,0]
		var _a = (1 - pulse[ii,0])/2
		draw_sprite_ext(spr_entrance_pulse,0,x,y,width,height * _h,image_angle,c_white,_a)
		
		var _p = strip[ii,3]
		var _l = abs(0.5 - abs((strip[ii,0] - 0.5)))/2
		var _yp = strip[ii,0]
		var _height = height + 1
		
		var y_offset = (width*16*strip[ii,4]) + lengthdir_x((16 * _height) - (16 * _height * _l), image_angle) * _yp
		if (image_angle = 0) {
			y_offset = max(y_offset,0)
		} else {
			y_offset = min(y_offset,0)
		}
		
		draw_sprite_ext(spr_entrance_pulse, 0, x - (((16 * width) * _p) * lengthdir_x(-1,image_angle)),
											   y - y_offset, 1/16, _height * _l, image_angle, c_white, 1)
	}
	draw_self();
}
