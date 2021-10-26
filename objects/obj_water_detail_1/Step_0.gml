width += spd

var _r = 0.1 + (abs(((width - maxwidth)/maxwidth)))
spd = base_spd * _r

x += xspd 
xspd += xaccel

if (width < maxwidth) {
	image_xscale = width
} else {
	image_xscale = (maxwidth*2) - width
}

if (width > maxwidth * 2)
{
	instance_destroy();	
}

