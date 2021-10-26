var num = 20
if (small_splash = true) num = 5
for (var ii = 0; ii < 20; ii += 1)
{
	instance_create_layer(x,y,"AirFX",obj_splash_particle_fx)	
}
ripple_fx(160,32)
instance_destroy();