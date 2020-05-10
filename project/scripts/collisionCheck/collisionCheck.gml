////	This unit is moving this frame
if (xx != 0 or yy != 0) {

	//	How many pixels are we moving
	var absXX = abs(xx)		
	var absYY = abs(yy)
	
	//	Check gameTime
	if app.gameTime != 1.0 and (absXX != 0 or absYY != 0) {
		if object_index == player {
			absXX *= app.gameTime
			absYY *= app.gameTime
		} else {
			absXX *= app.gameTime
			absYY *= app.gameTime
		}
	}
	
	//	Lets floor the pixel movement now
	var floorXX = floor(absXX) 
	var floorYY = floor(absYY)
	
	//	Do we have sub-pixel movements this frame?
	var subXX = absXX - floorXX
	var subYY = absYY - floorYY
	
	////	Floored-pixel movement
	if onGround {
		//	x movement
		for(var XX = 0; XX < floorXX; XX++) {
			if !place_meeting(x + sign(xx), y, block) x += sign(xx)
			else {
				var inst = instance_place(x + sign(xx), y, block)
				if enemySplatCheck(inst) states = states.splat	
				//xx = 0
				XX = floorXX
			}
		}
	
		//	y movement
		for(var YY = 0; YY < floorYY; YY++) {
			if !place_meeting(x, y + sign(yy), block) y += sign(yy)	
			else {
				var inst = instance_place(x , y + sign(yy), block)
				if enemySplatCheck(inst) states = states.splat	
				//yy = 0
				YY = floorYY
			}
		}
	} else {
		//	x movement
		for(var XX = 0; XX < floorXX; XX++) {
			if !place_meeting(x + sign(xx), groundY, block) x += sign(xx)
			else {
				var inst = instance_place(x + sign(xx), groundY, block)
				if enemySplatCheck(inst) states = states.splat	
				//xx = 0
				XX = floorXX
			}
		}
	
		//	y movement
		for(var YY = 0; YY < floorYY; YY++) {
			if !place_meeting(x, groundY + sign(yy), block) {
				groundY += sign(yy)	
				z += sign(yy) 
			}
			else {
				var inst = instance_place(x , groundY + sign(yy), block)
				if enemySplatCheck(inst) if object_index == enemy states = states.splat	
				//yy = 0
				YY = floorYY
			}
		}
	}
	
	////	Sub-pixel movement
	if (subXX != 0 or subYY != 0) {
		subXX *= sign(xx)
		subYY *= sign(yy)
		//	x movement
		if onGround {
			if !place_meeting(x + subXX, y, block) x += subXX
	
			if !place_meeting(x, y + subYY, block) y += subYY
		} else {
			if !place_meeting(x + subXX, groundY, block) x += subXX
		
			if !place_meeting(x, groundY + subYY, block) {
				groundY += subYY
				z += subYY	
			}
		}
	}
	
	xx = 0
	yy = 0
}