target = obj_player
old_target = target

travel_spd = 0
travel_dir = 0

surface_alpha = 0

spd_buffer = 0

surface_resize(application_surface,1920,1080)
display_set_gui_size(480,270)

shake_mag = 0
shake_dec = 0
shake_dir = -1
shake_step = 1

b = 16
w = 480 + b
h = 270 + b

surf = surface_create(w,h)

function scout_overlay()
{
	surface_set_target(surf);
	draw_clear_alpha(c_black,0.75);

	gpu_set_blendmode(bm_subtract)

	var rad = 112
	var spacing = 96

	draw_circle(w/2 - spacing, h/2, rad, false)
	draw_circle(w/2 + spacing, h/2, rad, false)

	gpu_set_blendmode(bm_normal)

	surface_reset_target();
}

scout_overlay();