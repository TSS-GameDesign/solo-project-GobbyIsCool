if keyboard_check(vk_backspace)
{
	room_goto(Startscreen)
}
if (keyboard_check_pressed(vk_f11))
{
    window_set_fullscreen(!window_get_fullscreen());
}
  //Inputs
    var Right = keyboard_check(ord("D"));
    var Left = keyboard_check(ord("A"));
    var JumpPressed = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_space);
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
	//sprites
	if !on_ground
	{
		sprite_index = sPlayerJump
	}
	else if Right or Left
	{
		sprite_index = sPlayerWalk
	}
	else
	{
		sprite_index = sPlayerIdle	
	}
    //gravity
    vsp += grv;

    //Jump logic type stuff
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
            wall_jump_cooldown = 15;

        } else if (wall_right && wall_jump_cooldown <= 0) {
			image_xscale = -1
            vsp = jspd * 0.8;
            hsp = -5;
            air_control_lock = 8;
            wall_jump_cooldown = 15;

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
    if (place_meeting(x, y, oSpike))
	{
		player_health -= 1;
		if player_health < 1
		{
		x = respawn_x;
		y = respawn_y;
		}
	}

//Spring
if (place_meeting(x, y + vsp, oSpring))
{
    while (place_meeting(x, y, oSpring))
    {
        y -= 1;
    }
    vsp = -6;
}
    // Key and gate logic
    if (place_meeting(x, y, oYellowGate) && yellowkey) 
	{
	instance_destroy(oYellowGate);
	}
    if (place_meeting(x, y, oYellowKey)) 
	{ 
		yellowkey = true; 
		instance_destroy(oYellowKey); 
		instance_destroy(oYInviwall);
		audio_play_sound(s_KeyCollect, 1, 0)
	}
    if (place_meeting(x, y, oBlueKey))   
	{
		bluekey = true;
		instance_destroy(oBlueKey);
		instance_destroy(oBInviwall);
		audio_play_sound(s_KeyCollect, 1, 0)
	}
    if (place_meeting(x, y, oBlueGate) && bluekey) or (place_meeting(x, y, oBlueGate_FC) && bluekey)
	{
	instance_destroy(oBlueGate);
	instance_destroy(oBlueGate_FC);
	}
    if (place_meeting(x, y, oRedKey))    
	{
		redkey = true;
		instance_destroy(oRedKey);
		instance_destroy(oRInviwall);
		audio_play_sound(s_KeyCollect, 1, 0)
	}
    if (place_meeting(x, y, oRedGate) && redkey) or (place_meeting(x, y, oRedGateFC) && redkey)
	{
        instance_destroy(oRedGate);
        instance_destroy(oRedGateFC);
    }