if (place_meeting(x + hsp, y, oGround))
{
	hsp = 0;
}
x += hsp;

if (place_meeting(x, y + vsp, oGround))
{
	vsp = 0;
}
y += vsp;
