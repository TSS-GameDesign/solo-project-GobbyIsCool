window_set_size(1280, 720);

hsp = 0;
vsp = 0;
grv = 0.25;
mspd = 2;
mdir = 0;
jspd = -4.15;
tvel = 4;

wall_jump_cooldown = 0;
air_control_lock = 0;
accel = 0.5;

//Dash
// Dash variables
dash_speed = 6;
dash_time = 5;
dash_timer = 0;
dash_cooldown = 0;
dash_cooldown_max = 20;

dash_dir_x = 0;
dash_dir_y = 0;   

StateFree = function()
{
	//Inputs
var Right = keyboard_check(ord("D"));
var Left = keyboard_check(ord("A"));
var JumpPressed = keyboard_check_pressed(ord("W"));
var Down = keyboard_check(ord("S"));

//Environment Checking
var on_ground  = place_meeting(x, y + 1, oGround);
var wall_left  = place_meeting(x - 1, y, oGround);
var wall_right = place_meeting(x + 1, y, oGround);

//Grav
vsp += grv;

//Jump
if (JumpPressed) {
    if (on_ground) {
        vsp = jspd;
        wall_jump_cooldown = 0;
    }
    else if (wall_left && wall_jump_cooldown <= 0) {
        vsp = jspd * 0.9;
        hsp = +5;                   
        air_control_lock = 8;       
        wall_jump_cooldown = 18;
    }
    else if (wall_right && wall_jump_cooldown <= 0) {
        vsp = jspd * 0.9;
        hsp = -5;               
        air_control_lock = 8;
        wall_jump_cooldown = 18;
    }
}

//cooldowns
if (wall_jump_cooldown > 0) wall_jump_cooldown--;
if (air_control_lock > 0) air_control_lock--;
if (dash_cooldown > 0) dash_cooldown--;
if (dash_cooldown <= 0 && on_ground) candash = true;

//H input
var move = Right - Left;

//apply input when locked
if (air_control_lock <= 0) {
    hsp = move * mspd;
}

//collision
// X
if (place_meeting(x + hsp, y, oGround)) {
    var _subPixel = 0.5;
    var _pixelCheck = _subPixel * sign(hsp);
    while (!place_meeting(x + _pixelCheck, y, oGround)) {
        x += _pixelCheck;
    }
    hsp = 0;
}
x += hsp;

// Y
if (place_meeting(x, y + vsp, oGround)) {
    var _subPixel = 0.5;
    var _pixelCheck = _subPixel * sign(vsp);
    while (!place_meeting(x, y + _pixelCheck, oGround)) {
        y += _pixelCheck;
    }
    vsp = 0;
}
y += vsp;

//facing
if (move != 0) image_xscale = sign(move);
}

//Keys
yellowkey = false
redkey = false
bluekey = false
