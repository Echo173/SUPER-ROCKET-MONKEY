if (rad >= goto_rad - 0.1)
{
	instance_destroy();
	exit;
}

r = rad/goto_rad
width = (goto_rad/16) * (1 - r)
rad += (goto_rad - rad)/spd
