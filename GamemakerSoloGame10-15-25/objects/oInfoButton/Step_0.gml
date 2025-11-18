if (position_meeting(mouse_x, mouse_y, id))
{
	sprite_index = sInfoButton_hover
	if mouse_check_button(1)
	{
		sprite_index = sInfoButton
		room_goto(InfoRoo)
	}
}
else
{
	sprite_index = sInfoButton
}
