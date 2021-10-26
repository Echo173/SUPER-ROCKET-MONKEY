image_xscale = size
image_yscale = size

size -= 0.025
image_alpha -= 0.1

if (image_alpha < 0)
{
	instance_destroy();	
}