for (var ii = 0; ii < 5; ii += 1)
{
	pulse[ii,0] -= pulse[ii,1]
	pulse[ii,1] += pulse[ii,2]
	
	if (pulse[ii,0] <= 0)
	{
		pulse[ii,0] = 1
		pulse[ii,1] = 0
		pulse[ii,2] = random_range(0.00005,0.0005)
	}
	
	strip[ii,0] -= strip[ii,1]
	strip[ii,1] += strip[ii,2]
	
	if (strip[ii,0] <= 0)
	{
		strip[ii,0] = 1
		strip[ii,1] = 0
		strip[ii,2] = random_range(0.0005,0.005)
		strip[ii,3] = random(1)
		strip[ii,4] = random(0.2)
	}
}