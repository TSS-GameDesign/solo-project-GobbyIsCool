window_set_size(1280, 720);
hsp = 0;
vsp = 0;
grv = 0.275;
mspd = 1;
mdir = 0;
jspd = -4.15;
tvel = 4;

facing = 1;

//Dash
candash = true
canjump = 0;
dashenergy = 10

StateFree = function()
{
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
}
//StateDash = function()

//Keys
yellowkey = false
redkey = false
bluekey = false
