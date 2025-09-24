yspd += 0.1;
xspd = 0;
if keyboard_check(vk_left)
{
	xspd = -1;
}
if keyboard_check(vk_right)
{
	xspd = 1;
}
if place_meeting(x, y+1, oTopGround)
{
	yspd = 0
	if keyboard_check(vk_up)
	{
		yspd = -2
	}
}
move_and_collide(xspd, yspd, oTopGround)
if (place_meeting(x, y, oFlag))
{
	game_end()
}
if (place_meeting(x, y, oSpike))
{
	game_restart()
}
