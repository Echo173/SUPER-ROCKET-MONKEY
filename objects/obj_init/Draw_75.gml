if (old_room != room)
{
	mx = mouse_x
	my = mouse_y
	
	old_room = room
}

mx += (mouse_x - mx)/1.5
my += (mouse_y - my)/1.5

var dmx = mouse_x - camera_get_view_x(view_camera[0])
var dmy = mouse_y - camera_get_view_y(view_camera[0])

var mframe = 0
if (mouse_check_button(mb_left)) {
	mframe = 1
}

var scout = false
if (instance_exists(obj_player))
{
	var can_rotate = true
	if (instance_exists(obj_fade_in))
	{
		if (obj_fade_in.timer > 0) {
			can_rotate = false	
		}
	}
	
	if (can_rotate)
	{
		fang = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y)
		if (obj_player.scouting = true) {
			scout = true	
		}
	}
	else
	{
		fang = point_direction(240,135,dmx,dmy)
	}
}
else
{
	fang = 135	
}

if (scout = false) {
	draw_sprite_ext(spr_mouse,mframe,dmx,dmy,1,1,fang,c_white,1)
} else {
	draw_sprite_ext(spr_mouse,2,dmx,dmy,1,1,0,c_white,1)
}