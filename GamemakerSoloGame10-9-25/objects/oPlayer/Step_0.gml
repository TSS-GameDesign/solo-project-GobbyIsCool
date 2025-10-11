Right = keyboard_check(ord("D"));
Left = keyboard_check(ord("A"));
JumpPressed = keyboard_check_pressed(ord("W"));
Jump = keyboard_check(ord("W"))
Down = keyboard_check(ord("S"));

//x movement
//direction
mdir = Right - Left

//get xspd
hsp  = mdir * mspd 

//x collision
var _subPixel = 0.5;
if place_meeting(x + hsp, y, oGround)
{
	//scoot up to wall precisely
	var _pixelCheck = _subPixel * sign(hsp);
	while !place_meeting( x + _pixelCheck, y, oGround)
	{
		x += _pixelCheck;
	}
	
	//set xspd to zero  to "collide"
	hsp = 0;	
}

//move
x += hsp;

//y movement
	//gravity
vsp += grv;

//jump
if JumpPressed && place_meeting(x,y+1, oGround)
{
	vsp = jspd;	
}
	//y collison
	var _subPixel = .5
	if place_meeting(x, y + vsp, oGround)
	{
		//scoot
		var _pixelCheck = _subPixel * sign(vsp);
		while !place_meeting(x, y + _pixelCheck, oGround)
		{
			y+= _pixelCheck;
		}
		//set yspd to 0 to collide
		vsp = 0;
	}
// Environment checks
var on_ground = place_meeting(x, y + 1, oGround);
var wall_left = place_meeting(x - 1, y, oGround);
var wall_right = place_meeting(x + 1, y, oGround);
var on_plat = place_meeting(x, y+1, oPlatform);

if Left
{
	hsp = -1.25;
	image_xscale = -1
}
if Right
{
	hsp = 1.25;
	image_xscale = 1
}
move_and_collide(hsp, vsp, oGround)
if (place_meeting(x, y, oFlag))
{
	room_goto_next()
}
if (place_meeting(x, y, oSpike))
{
	game_restart()
}
if Down
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

