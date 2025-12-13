draw_set_font(fonty)
if keyboard_check(ord("W"))
{
	draw_text_ext_transformed(48, 32, "The W key is used to jump. Press W while against the wall to walljump.", 90, 1000, 0.175, 0.175, 0)
}
else if keyboard_check(ord("A"))
{
	draw_text_ext_transformed(48, 32, "The A key is used to move left.", 90, 1000, 0.175, 0.175, 0)
}
else if keyboard_check(ord("S"))
{
	draw_text_ext_transformed(48, 32, "The S key does nothing.", 90, 1000, 0.175, 0.175, 0)
}
else if keyboard_check(ord("D"))
{
	draw_text_ext_transformed(48, 32, "The D key is used to move right.", 90, 1000, 0.175, 0.175, 0)
}
else if keyboard_check(vk_backspace)
{
	draw_text_ext_transformed(48, 32, "The backspace key is used to return back to the main menu at any time.", 90, 1000, 0.175, 0.175, 0)
}
else
{
	draw_text_ext_transformed(48, 32, "Hold down a key listed to see its functionality", 90, 1000, 0.175, 0.175, 0)
}