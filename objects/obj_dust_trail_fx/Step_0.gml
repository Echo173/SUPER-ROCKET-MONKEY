x += lengthdir_x(spd,dir - 180)
y += lengthdir_y(spd,dir - 180)

image_angle += spd

image_xscale = size
image_yscale = size

size += spd_size
alpha -= alpha_spd
if (alpha <= 0) instance_destroy();

image_alpha = alpha