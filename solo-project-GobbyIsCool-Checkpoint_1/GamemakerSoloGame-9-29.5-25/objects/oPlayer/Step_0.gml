vsp += 0.1;
hsp = 0;
keyRight = keyboard_check(ord("D"))
keyLeft = keyboard_check(ord("A"))
keyJump = keyboard_check(ord("W"))
keyUp = keyboard_check(vk_up)
keyDown = keyboard_check(ord("S"))
keyDash = mouse_check_button(1)

if (keyboard_check(ord("A")))
{
	hsp = -1.25;
	image_xscale = -1
}
if (keyboard_check(ord("D")))
{
	hsp = 1.25;
	image_xscale = 1
}
if place_meeting(x, y+1, oTopGround)
{
	vsp = 0
	if (keyboard_check(ord("W")))
	{
		vsp = -2.65
	}
}
if place_meeting(x, y, oYellowGate)
{
	vsp = 0
	if (keyboard_check(ord("W")))
	{
		vsp = -2.65
	}
}
move_and_collide(hsp, vsp, oTopGround)
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
if place_meeting(x, y, oYellowKey)
{
	yellowkey = true
	instance_destroy(oYellowKey)
}
if place_meeting(x, y, oYellowGate)
{
	if yellowkey == true
	{
		instance_destroy(oYellowGate)
		}
}
if place_meeting(x, y, oBlueKey)
{
	bluekey = true
	instance_destroy(oBlueKey)
}
if place_meeting(x, y, oBlueGate)
{
	if bluekey == true
	{
		instance_destroy(oBlueGate)
		}
}
if place_meeting(x, y, oRedKey)
{
	redkey = true
	instance_destroy(oRedKey)
}
if place_meeting(x, y, oRedGate)
{
	if redkey == true
	{
		instance_destroy(oRedGate)
		}
}

