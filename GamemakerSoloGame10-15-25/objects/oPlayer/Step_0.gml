if (keyboard_check_pressed(vk_f11)) 
{
    window_set_fullscreen(!window_get_fullscreen());
}
  //Inputs
    var Right = keyboard_check(ord("D"));
    var Left = keyboard_check(ord("A"));
    var JumpPressed = keyboard_check_pressed(ord("W"));
    var Down = keyboard_check(ord("S"));
    var KeyDash = keyboard_check_pressed(vk_space);

    //Environment Checks
    var on_ground  = place_meeting(x, y + 1, oGround);
    var wall_left  = place_meeting(x - 1, y, oGround);
    var wall_right = place_meeting(x + 1, y, oGround);
	// Horizontal input
	var move = Right - Left;
	if (air_control_lock <= 0) {
		hsp = move * mspd;
	}
    //Apply gravity
    vsp += grv;

    //Jump logic
    if (JumpPressed) {
        if (on_ground) {
            vsp = jspd;
            wall_jump_cooldown = 0;
            can_dash = true;
        } else if (wall_left && wall_jump_cooldown <= 0) {
			image_xscale = 1
            vsp = jspd * 0.8;
            hsp = +5;
            air_control_lock = 8;
            wall_jump_cooldown = 16;

        } else if (wall_right && wall_jump_cooldown <= 0) {
			image_xscale = -1
            vsp = jspd * 0.8;
            hsp = -5;
            air_control_lock = 8;
            wall_jump_cooldown = 16;

        }
    }
    //Cooldowns
    if (wall_jump_cooldown > 0) wall_jump_cooldown--;
    if (air_control_lock > 0) air_control_lock--;
    //Collision X
    if (place_meeting(x + hsp, y, oGround)) {
        while (!place_meeting(x + sign(hsp), y, oGround)) {
            x += sign(hsp);
        }
        hsp = 0;
    }
    x += hsp;

    // Collision Y
    if (place_meeting(x, y + vsp, oGround)) {
        while (!place_meeting(x, y + sign(vsp), oGround)) {
            y += sign(vsp);
        }
        vsp = 0;
    }
    y += vsp;

    // Facing
    if (move != 0) image_xscale = sign(move);

    // Object interactions
    if (place_meeting(x, y, oFlag)) room_goto_next();
    if (place_meeting(x, y, oSpike)) room_restart();
    if (Down) room_restart();
    if (keyboard_check_pressed(ord("P"))) room_goto_next();

    // Key and gate logic
    if (place_meeting(x, y, oYellowGate) && yellowkey) instance_destroy(oYellowGate);
    if (place_meeting(x, y, oYellowKey)) { yellowkey = true; instance_destroy(oYellowKey); }
    if (place_meeting(x, y, oBlueKey))   { bluekey = true; instance_destroy(oBlueKey); }
    if (place_meeting(x, y, oBlueGate) && bluekey) instance_destroy(oBlueGate);
    if (place_meeting(x, y, oRedKey))    { redkey = true; instance_destroy(oRedKey); }
    if (place_meeting(x, y, oRedGate) && redkey) {
        instance_destroy(oRedGate);
        instance_destroy(oRedGateFC);
    }