if (position_meeting(mouse_x, mouse_y, id))
{
	sprite_index = sStartButton_hover
	if mouse_check_button(1)
	{
		sprite_index = sStartButton
		room_goto(Level_1)
	}
}
else
{
	sprite_index = sStartButton
}