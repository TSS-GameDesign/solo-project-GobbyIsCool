window_set_size(1280, 720);
grv = 0.15;
hsp = 0;
vsp = 0;
hspwalk = 1;
vspjump = -0.3;
canjump = 0;
canDash = false;
dashDistance = 96;
dashTime = 12;

StateFree = function()
{
	//where to move horizontally
hsp = (keyRight - keyLeft) * hspwalk

//Where to move horizontally
vsp = vsp + grv;

//Jump input
if (canjump-- > 0) && (keyJump) 
{
	vsp = vspjump;
	canjump = 0;
}

//Dash input
if (canDash) && (keyDash)
{
	canDash = false
	canjump = 0;
	dashDirection = point_direction(0, 0, keyRight-keyLeft, keyDown-keyUp)
	dashSpd = dashDistance / dashTime;
	dashEnergy = dashDistance
	state = StateDash
}
//horizontal collision
if (place_meeting(x + hsp, y, oTopGround)) x += hsp;
{
	while (abs(hsp) > 0.1)
	{
		hsp *= 0.5;
		if (!place_meeting(x + hsp, y, oTopGround)) x += hsp;
	}
	hsp = 0;
}
x += hsp;

//vertical collision
if (place_meeting(x, y + vsp, oTopGround))
{
	if (vsp > 0)
	{
		canjump = 10;
		canDash = true;
	}
	while (abs(vsp) > 0.1)
	{
		vsp *= 0.5;
		if (!place_meeting(x, y + vsp, oTopGround)) y += vsp;
	}
	vsp = 0;
}
y += vsp;
}

StateDash = function()
{
	//Move via the dash
	hsp = lengthdir_x(dashSpd, dashDirection);
	vsp = lengthdir_y(dashSpd, dashDirection);
	//horizontal collision
if (place_meeting(x + hsp, y, oTopGround)) x += hsp;
{
	while (abs(hsp) > 0.1)
	{
		hsp *= 0.5;
		if (!place_meeting(x + hsp, y, oTopGround)) x += hsp;
	}
	hsp = 0;
}
x += hsp;

//vertical collision
if (place_meeting(x, y + vsp, oTopGround))
{
	while (abs(vsp) > 0.1)
	{
		vsp *= 0.5;
		if (!place_meeting(x, y + vsp, oTopGround)) y += vsp;
	}
	vsp = 0;
	
	//End dash
	dashEnergy -=dashSpd;
	if (dashEnergy <= 0)
	{
		vsp = 0;
		hsp = 0;
		state = StateFree()
	}
}
y += vsp;
}	
//Keys
yellowkey = false
redkey = false
bluekey = false
