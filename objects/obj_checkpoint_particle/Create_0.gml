image_angle = irandom(3) * 90
image_speed = random_range(0.5,1.25)
size = random_range(0.75,1.25)
image_xscale = size
image_yscale = size

float = false

var dist = point_distance(x,y,obj_camera.x,obj_camera.y)

var spd_mod = min(2,dist/32)

spd = random_range(0.1,0.5) * spd_mod
dir = point_direction(obj_camera.x,obj_camera.y,x,y)

d = 0
dd = depth