if (obj_door.stage >= 4)
{
	alpha_spd += 0.002
}
alpha -= alpha_spd
if (alpha <= 0)
{
	instance_destroy();	
}