keyRight = keyboard_check(ord("D"))
keyLeft = keyboard_check(ord("A"))
keyJump = keyboard_check(ord("W"))
keyDown = keyboard_check(ord("S"))
keyDash = mouse_check_button(1)

hsp = 0;

// Environment checks
var on_ground = place_meeting(x, y + 1, oSolid);
var wall_left = place_meeting(x - 1, y, oSolid);
var wall_right = place_meeting(x + 1, y, oSolid);
var on_plat = place_meeting(x, y+1, oPlatform);

// Jumping
if (keyboard_check_pressed(ord("W"))) 
{
    if (on_ground) 
	{
        vsp = jumpspeed;
    }
}    
// Input movement
if keyRight
{
    hsp = movespeed;
}
if keyLeft 
{
    hsp = -movespeed;
}

// Gravity
vsp += grv;

// Horizontal movement & collision
if (!place_meeting(x + hsp, y, oSolid))
{
    x += hsp;
} else {
    while (!place_meeting(x + sign(hsp), y, oSolid)) 
	{
        x += sign(hsp);
    }
    hsp = 0;
}
// Vertical movement & collision
if (!place_meeting(x, y + vsp, oSolid)) 
{
    y += vsp;
} else {
    while (!place_meeting(x, y + sign(vsp), oSolid)) 
	{
        y += sign(vsp);
    }
    vsp = 0;
}
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
if place_meeting(x, y+1, oSolid)
{
	vsp = 0
	if keyJump
	{
		vsp = -2.65
	}
}
move_and_collide(hsp, vsp, oSolid)
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
//gates opening
if place_meeting(x, y, oYellowKey)
{
	yellowkey = true
	instance_destroy(oYellowKey)
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
		instance_destroy(oRedGateFC)
		}
}

