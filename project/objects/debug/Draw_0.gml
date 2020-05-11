if on {
	
	draw_set_color(c_yellow)
	
	with class_unit {
		
		var XX = x + 64
		var YY = y - 92
		var e = []
		e[states.free] = "Free"
		e[states.jump] = "Jump"
		e[states.punch1] = "Punch1"
		e[states.punch2] = "Punch2"
		e[states.smash] = "Smash"
		e[states.splat] = "Splat"
		e[states.walk] = "Walk"
		draw_text(XX,YY,e[states])								YY += 15
		
		draw_text(XX,YY,"force: "+string(force))				YY += 15
		draw_text(XX,YY,"onGround: "+string(onGround))			YY += 15
		draw_text(XX,YY,"z: "+string(z))						YY += 15
		draw_text(XX,YY,"thrust: "+string(thrust))				YY += 15
		
		if object_index == player {
			draw_text(XX,YY,"movespeed: "+string(movespeed))				YY += 15
			draw_text(XX,YY,"punchChargePunch: "+string(punchChargePunch))	YY += 15
			draw_text(XX,YY,"punchCharge: "+string(punchCharge))			YY += 15
			draw_text(XX,YY,"punch1CD: "+string(punch1CD))					YY += 15
			draw_text(XX,YY,"punchChargeQueue: "+string(punchChargeQueue))  YY += 15
			
		}
	
		if object_index == enemy {
			draw_text(XX,YY,"knockedDown: "+string(knockedDown))	YY += 15
			//draw_text(XX,YY,"xx: "+string(xx))						YY += 15
			//draw_text(XX,YY,"yy: "+string(yy))						YY += 15
			
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