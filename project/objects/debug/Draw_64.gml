if on {
	
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
	
	draw_set_color(c_yellow)

	with class_unit {
		var XX = x + 64
		var YY = y - 92
		var e = []
		e[states.free] = "Free"
		e[states.jump] = "Jump"
		e[states.punch1] = "Punch1"
		e[states.punch2] = "Punch2"
		draw_text(XX,YY,e[states])
	
		if object_index == enemy {
			YY += 15
			draw_text(XX,YY,"knockedDown: "+string(knockedDown))	YY += 15
			//draw_text(XX,YY,"xx: "+string(xx))						YY += 15
			//draw_text(XX,YY,"yy: "+string(yy))						YY += 15
			draw_text(XX,YY,"force: "+string(force))				YY += 15
			
			//	Draw direction line
			if force > 0 {
				var distance = 20 + force
				var thicc = 4
				var x2 = x + lengthdir_x(distance,Direction)
				var y2 = y + lengthdir_y(distance,Direction)
				draw_line_width(x,y,x2,y2,thicc)
			}
			
		}	
	}
}
