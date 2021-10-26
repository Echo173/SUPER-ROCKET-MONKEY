if (rad >= goto_rad - 0.1)
{
	instance_destroy();
	exit;
}

if (!surface_exists(surf))
{
	size = (goto_rad * 2) + 16
	surf = surface_create(size,size)
}

r = rad/goto_rad
width = (goto_rad/8) * (1 - r)
rad += (goto_rad - rad)/spd
