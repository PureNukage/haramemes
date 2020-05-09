if on {
	
	draw_set_color(c_black)
	with playerInput {
		var xx = 15
		var yy = 15
		draw_set_color(c_black)
		draw_text(xx,yy,"Gamepad Left Axis H: "+string(gamepad_axis_value(0, gp_axislh)))	yy += 15
		draw_text(xx,yy,"Gamepad Left Axis V: "+string(gamepad_axis_value(0, gp_axislv)))	
	}
	
	draw_set_color(c_yellow)

	with class_unit {
		var xx = x + 64
		var yy = y - 92
		var e = []
		e[states.free] = "Free"
		e[states.jump] = "Jump"
		e[states.punch1] = "Punch1"
		e[states.punch2] = "Punch2"
		draw_text(xx,yy,e[states])
	
		if object_index == enemy {
			yy += 15
			draw_text(xx,yy,"knockedDown: "+string(knockedDown))
		}	
	}
}
