window_set_size(1280, 720);
grav = 0.2;
xspd = 0;
yspd = 0;
hspwalk = 3;
vspjump = -6;
canjump = 0;

StateFree = function()
{
	//where to move horizontally
xspd = (keyRight - keyLeft) * hspwalk

//Where to move horizontally
yspd = yspd + grav;

//Jump input
if (canjump-- > 0) && (keyJump) 
{
	yspd = vspjump;
	canjump = 0;
}
//horizontal collision
if (place_meeting(x + xspd, y, oTopGround)) x += xspd;
{
	while (abs(xspd) > 0.1)
	{
		xspd *= 0.5;
		if (!place_meeting(x + xspd, y, oTopGround)) x += xspd;
	}
	xspd = 0;
}
x += xspd;

//vertical collision
if (place_meeting(x, y + yspd, oTopGround))
{
	if (yspd > 0)
	{
		canjump = 10;
	}
	while (abs(yspd) > 0.1)
	{
		yspd *= 0.5;
		if (!place_meeting(x, y + yspd, oTopGround)) y += yspd;
	}
	yspd = 0;
}
y += yspd;
}
//Keys
yellowkey = false
redkey = false
bluekey = false
