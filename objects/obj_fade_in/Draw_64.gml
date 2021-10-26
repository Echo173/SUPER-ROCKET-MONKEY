if (timer <= 0)
{
	if (surface_exists(surf))
	{
		draw_surface(surf,-o/2,-o/2)	
	}
}
else
{
	draw_set_color(c_black)
	draw_rectangle(-2,-2,w+4,h+4,false)
	draw_set_color(c_white)
}
