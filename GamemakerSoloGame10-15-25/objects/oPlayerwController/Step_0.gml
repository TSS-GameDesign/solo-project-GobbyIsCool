var axis = gamepad_axis_value(0, gp_axislh)
var A = gamepad_button_check(0, gp_face1)
var AP = gamepad_button_check_pressed(0, gp_face1)
var B = gamepad_button_check(0, gp_face2)
var Y = gamepad_button_check(0, gp_face3)

if (abs(axis) > 0.2) 
{
    hsp = axis * mspd;
    facing = sign(axis);
}
else
{
    hsp = 0;
}

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
if AP && place_meeting(x,y+1, oGround)
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

move_and_collide(hsp, vsp, oGround)
if (place_meeting(x, y, oFlag))
{
	room_goto_next()
}
if (place_meeting(x, y, oSpike))
{
	room_restart()
}
if Y
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

