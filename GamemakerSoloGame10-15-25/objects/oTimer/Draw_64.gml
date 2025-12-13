draw_set_font(Font2)
m = floor(t / 60)
s = floor(t) mod 60
ms = floor((t - floor(t)) * 1000)
time_text = string(m) + ":" + string_format(s, 2, 0) + ":" + string_format(ms, 3, 0)
x_pos = display_get_gui_width() / 2 - string_width(time_text) / 2
y_pos = 5
draw_set_color(c_white)
draw_text(x_pos, y_pos, time_text)
