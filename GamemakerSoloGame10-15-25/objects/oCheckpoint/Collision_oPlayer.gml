if (!activated) 
{
    activated = true;
    sprite_index = sCheckpoint;
    other.respawn_x = x;
    other.respawn_y = y;
	image_index = 0;                        
    image_speed = 1;                        
    audio_play_sound(s_Checkpoint, 1, false);
}