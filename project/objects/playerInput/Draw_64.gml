var xx = 15
var yy = 15
draw_text(xx,yy,"Gamepad Left Axis H: "+string(gamepad_axis_value(0, gp_axislh)))	yy += 15
draw_text(xx,yy,"Gamepad Left Axis V: "+string(gamepad_axis_value(0, gp_axislv)))