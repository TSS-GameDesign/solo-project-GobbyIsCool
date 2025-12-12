if (position_meeting(mouse_x, mouse_y, id))
{
	sprite_index = sRetryButton
	if mouse_check_button(1)
	{
		sprite_index = sRetryButton
		room_goto(Level_1)
	}
}
else
{
	sprite_index = sRetryButton_hover
}