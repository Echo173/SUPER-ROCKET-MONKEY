//Other
randomize();
death = false
respawn_x = x
respawn_y = y

scouting = false

land_init = 1
land_fx_init = 1

voice_timer = 0

warp = false

//Set Pos
if (global.is_respawn = false)
{
	if (global.spawn_x != -1) && (global.spawn_y != -1)
	{
		x = global.spawn_x
		y = global.spawn_y
	}
}
else
{
	warp = true
}

obj_camera.x = x
obj_camera.y = y

//Physics
state = "grounded"

state_change_timer = 0

xspd = 0
yspd = 0
max_spd = 5

aim_dir = 0
fric = 0

//Fuel
max_fuel = 180
fuel = max_fuel
overheated = false

//Graphics
_ho = 0

lowfuel_anim = false
lowfuel_anim_alpha = 1
fuel_alpha = 0

trail_fx_timer = 0

maxflash = 0

jet_frame = 0
jet_timer = 0

flash_timer = 0
flash_duration = 0
flash = 1

guide_arrow = false
guide_arrow_alpha = 1
guide_arrow_alpha_dir = 1
guide_arrow_dir = 0

guide_arrow_stop = false
guide_arrow_stop_timer = 0