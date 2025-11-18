if (position_meeting(mouse_x, mouse_y, id))
{
	sprite_index = sStartButton_hover
	if mouse_check_button(1)
	{
		sprite_index = sStartButton
	}
}
else
{
	sprite_index = sStartButton
}