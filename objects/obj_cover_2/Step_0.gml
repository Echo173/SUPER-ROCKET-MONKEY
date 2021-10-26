if (trigger = true)
{
	reset_init = false
	alpha_spd = 0.1
}
alpha -= alpha_spd

if (alpha <= 0)
{
	visible = false
}