keyRight = keyboard_check(ord("D"))
keyLeft = keyboard_check(ord("A"))
keyJump = keyboard_check(ord("W"))
keyDown = keyboard_check(ord("S"))
keyDash = mouse_check_button(1)

//work out where to move horizontally
hsp = (keyRight - keyLeft) * hspwalk;

//work out where to move vertically
vsp = vsp + grv;

//work out if i should jump
if (canjump-- > 0) && (keyJump)
{
	vsp = vspjump;
	canjump = 0;
}

//collide and move
if (place_meeting(x + hsp, y, oTopGround))
{
	while (abs(hsp) > 0.1)
	{
		hsp *= 0.5;
		if (!place_meeting(x + hsp, y, oTopGround)) x += hsp;
	}
	hsp = 0;
}
x += hsp;

if (place_meeting(x, y + vsp, oTopGround))
{
	if (vsp > 0) canjump = 10;
	while (abs(vsp) > 0.1)
	{
		vsp *= 0.5;
		if (!place_meeting(x, y + vsp, oTopGround)) x += vsp;
	}
	vsp = 0;
}
y += vsp;
if keyLeft
{
	hsp = -1.25;
	image_xscale = -1
}
if keyRight
{
	hsp = 1.25;
	image_xscale = 1
}
if place_meeting(x, y+1, oTopGround)
{
	vsp = 0
	if keyJump
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
if keyDown
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

