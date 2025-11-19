if (position_meeting(mouse_x, mouse_y, id))
{
	sprite_index = sBackButton_hover
	if mouse_check_button(1)
	{
		sprite_index = sBackButton
		room_goto(Startscreen)
	}
}
else
{
	sprite_index = sBackButton
}
