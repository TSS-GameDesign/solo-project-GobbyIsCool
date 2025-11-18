if (position_meeting(mouse_x, mouse_y, id))
{
	sprite_index = sQuitButton_hover
	if mouse_check_button(1)
	{
		game_end();
	}
}
else
{
	sprite_index = sQuitButton
}
