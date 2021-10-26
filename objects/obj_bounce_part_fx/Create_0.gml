image_speed = 0
image_index = irandom(100)

init = 0

min_spd = 0
max_spd = 0

z = -irandom_range(2,8)
grav = 0.25
xspd = 0
yspd = 0
zspd = 0

bounce = 0

if (place_meeting(x,y,obj_collision)) instance_destroy();
