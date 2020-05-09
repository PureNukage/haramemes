switch(states)
{
	case states.free:
	
		groundX = x
		groundY = y
	
		z = y
		
	break	
	case states.jump:
		//	I am going up or down during this jump
		z -= zAccl
			
		//	Applying gravity to accelerant
		zAccl -= grav
			
		//	Keep my shadow following my x-position
		groundX = x
			
		//	I am visually in the air!
		y = z
			
		//	I am in the air!
		if y < groundY {
			onGround = false
		} 
		//	I have landed
		else {
			onGround = true
			states = states.free
				
			movespeedMax = 5
			movespeed = 0
				
			zAccl = 0
			xx = 0
			yy = 0
		}
	break
}

force = applyForce(Direction,force)

if knockedDown {
	if timer > 0 {	
		timer--
		if abs(rotation) < 87 {
			rotation = lerp(rotation,90*image_xscale,0.5)
		}	
	}	
	//	Time to get back up
	else {
		if (abs(rotation) - 0) > 3 {
			rotation = lerp(rotation,0,0.5)	
		} else {
			knockedDown = false		
		}
	}
}

if damagedTimer > 0 damagedTimer-- 
else if damaged {
	damaged = false
}

collisionCheck()