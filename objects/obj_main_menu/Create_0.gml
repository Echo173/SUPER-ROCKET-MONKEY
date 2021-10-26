stage = 0
timer = 0
spd = 0

count = 0

sound_init = 0

for (var ii = 0; ii < 5; ii += 1)
{
	draw[ii] = false
	alpha[ii] = 1
	scale[ii] = 1
	shake_mag[ii] = 0
	xpos[ii] = 0
	ypos[ii] = 0
}

bg_alpha = 1
bg_alpha_white = 0

bx = room_width/2
by = room_height/2

completed = false
