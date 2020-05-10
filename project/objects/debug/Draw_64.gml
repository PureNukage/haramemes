if on {
	
	depth = -1
	
	draw_set_color(c_black)
	with app {
		var XX = 15 
		var YY = 15
		draw_text(XX,YY,"gameTime: "+string(gameTime))
	}
	
	draw_set_color(c_black)
	with playerInput {
		var XX = 15
		var YY = 45
		draw_set_color(c_black)
		draw_text(XX,YY,"Gamepad Left Axis H: "+string(gamepad_axis_value(0, gp_axislh)))	YY += 15
		draw_text(XX,YY,"Gamepad Left Axis V: "+string(gamepad_axis_value(0, gp_axislv)))	
	}

}
