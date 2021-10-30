spd = 0
spd_mode = 0
dir = 0
goto_x = 0
goto_y = 0

dist = -1

init = 1
if (global.checkpoint = 21) && (global.is_load = true) && (global.final_door = false)
{
	init = 0
}

timer = 5

p_timer = 0

loaded = false
if (global.is_load = true) {
	loaded = true	
}

if (global.is_respawn = true) & (room = rm_area_1)
{
	x = 1936
	y = 531
}
if (global.is_respawn = true) & (room = rm_area_2)
{
	x = 1424
	y = 176
}