////	This unit is moving this frame
if (xx != 0 or yy != 0) {

	//	How many pixels are we moving
	var absXX = abs(xx)		
	var absYY = abs(yy)
	
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
		}
	
		//	y movement
		for(var YY = 0; YY < floorYY; YY++) {
			if !place_meeting(x, y + sign(yy), block) y += sign(yy)	
		}
	} else {
		//	x movement
		for(var XX = 0; XX < floorXX; XX++) {
			if !place_meeting(x + sign(xx), groundY, block) x += sign(xx)
		}
	
		//	y movement
		for(var YY = 0; YY < floorYY; YY++) {
			if !place_meeting(x, groundY + sign(yy), block) {
				groundY += sign(yy)	
				z += sign(yy) 
			}
		}
	}
	
	////	Sub-pixel movement
	//	x movement
	
	xx = 0
	yy = 0
}