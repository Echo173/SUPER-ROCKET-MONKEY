if (obj_player.warp = false) && (place_meeting(x,y,obj_player))
{
	obj_player.warp = true
	global.spawn_x = goto_x
	global.spawn_y = goto_y
	
	var f = instance_create_layer(x,y,layer,obj_fade_out)
	f.respawn = false
	f.room_target = goto_room
}
