yspd += 0.1;
xspd = 0;
if (keyboard_check(ord("A")))
{
	xspd = -1.25;
}
if (keyboard_check(ord("D")))
{
	xspd = 1.25;
}
if place_meeting(x, y+1, oTopGround)
{
	yspd = 0
	if (keyboard_check(ord("W")))
	{
		yspd = -2.65
	}
}
if place_meeting(x+1, y+1, oYellowGate)
{
	yspd = 0
	if (keyboard_check(ord("W")))
	{
		yspd = -2.65
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
if (keyboard_check(ord("S")))
{
	room_restart()
}
	
