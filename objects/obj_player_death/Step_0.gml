timer -= 1
if (timer <= 0)
{
	player_respawn();
	instance_destroy();	
}