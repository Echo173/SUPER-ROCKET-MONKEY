if (distance_to_object(obj_camera) < 260)
{
	var dist = point_distance(x,y,obj_camera.x,obj_camera.y)

	var d = -clamp(dist/16,2,4)
	var dir = point_direction(obj_camera.x,obj_camera.y,x,y)

	var xx = x + lengthdir_x(d,dir)
	var yy = y + lengthdir_y(d,dir)

	draw_sprite(sprite_index,4,xx,yy)

	draw_self();
}

//draw_circle(x,y,256,true)