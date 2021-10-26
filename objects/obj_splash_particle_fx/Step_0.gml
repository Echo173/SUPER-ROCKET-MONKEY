if (place_meeting(x + xspd,y,obj_collision))
{
	xspd *= -1	
}
x += xspd

if (place_meeting(x,y + yspd,obj_collision))
{
	yspd *= -1	
}
y += yspd

z += zspd
	
zspd += grav

if (z > 0)
{
	ripple_fx(8,25)
	splash_fx("small")	
	instance_destroy();
}