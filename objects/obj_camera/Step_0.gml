if (old_target != target)
{
	spd_buffer = 5	
}
spd_buffer = approach(spd_buffer, 0, 0.5)

var cam_spd = 5 + spd_buffer

var dir = point_direction(x,y,mouse_x,mouse_y)
var rad = 8
var m = 1

if (target = obj_player)
{
	if (obj_player.scouting = true)
	{
		rad = 112
		m = 5
		surface_alpha = 1
	}
	else
	{
		surface_alpha = approach(surface_alpha,0,0.2)
	}

	if (instance_exists(target))
	{
		if (target.warp = false)
		{
			if (target.death = false)
			{
				var goto_x = target.x + (lengthdir_x(min(rad,point_distance(x,y,mouse_x,mouse_y)), dir) * m)
				var goto_y = target.y + (lengthdir_y(min(rad,point_distance(x,y,mouse_x,mouse_y)), dir) * m)
			}
			else
			{
				var goto_x = target.x
				var goto_y = target.y
			}
	
			cam_spd += max(0,(obj_player.flash_duration/16))
	
			travel_spd = point_distance(x,y,x + (goto_x - x)/cam_spd, y + (goto_y - y)/cam_spd)
			travel_dir = point_direction(x,y,x + (goto_x - x)/cam_spd, y + (goto_y - y)/cam_spd)
	
			x += (goto_x - x)/cam_spd
			y += (goto_y - y)/cam_spd
		}
		else
		{
			x += lengthdir_x(travel_spd,travel_dir)
			y += lengthdir_y(travel_spd,travel_dir)
			travel_spd += 0.5
		}
	
	}
}
else
{
	var offset = 0
	if (target = obj_checkpoint_final)
	{
		offset = -64	
	}
	
	if (target != obj_lava_wall)
	{
		var goto_x = target.x
		var goto_y = target.y + offset
	}
	else
	{
		var goto_x = obj_player.x
		var goto_y = target.y - (target.image_yscale * 16)
	}
	
				
	x += (goto_x - x)/cam_spd
	y += (goto_y - y)/cam_spd
	surface_alpha = approach(surface_alpha,0,0.2)	
}

var width = camera_get_view_width(view_camera[0])
var height = camera_get_view_height(view_camera[0])

if (shake_dir = -1)
{
	var sx = irandom_range(-shake_mag,shake_mag)
	var sy = irandom_range(-shake_mag,shake_mag)
}
else
{
	shake_step *= -1
	var sx = lengthdir_x(shake_mag * shake_step,shake_dir)
	var sy = lengthdir_y(shake_mag * shake_step,shake_dir)
}
shake_mag = approach(shake_mag,0,shake_dec)

camera_set_view_pos(view_camera[0],x - width/2 + sx,y - height/2 + sy)
if (IS_HTML5)
{
	if (window_get_width() != display_get_width()) || (window_get_height() != display_get_height())
	{
		window_set_size(display_get_width(),display_get_height())
	}
}

old_target = target

if (water_detail_timer <= 0)
{
	//water_detail_timer = irandom_range(10,20)
	//switch (room)
	//{
	//	case rm_area_1:
	//		var sdx = x + irandom_range(-width/1.5,width/1.5)
	//		var sdy = y + irandom_range(-height/1.5,height/1.5)
			
	//		var snum = choose(0,0,1,1,2)
			
	//		if (!instance_position(sdx,sdy,obj_collision)) && (!instance_position(sdx,sdy,obj_ground))
	//		{
	//			for (var ii = 0; ii <= snum; ii += 1)
	//			{
	//				sdx += irandom_range(-16,16)
	//				sdy += irandom_range(-16,16)
	//				instance_create_layer(sdx, sdy,"Detail",obj_water_detail_1)
	//			}
	//		}
	//		else
	//		{
	//			water_detail_timer = 0	
	//		}
	//		break;
	//}	
}
water_detail_timer -= 1