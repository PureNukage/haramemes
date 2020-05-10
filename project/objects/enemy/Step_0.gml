switch(states)
{
	#region Free
		case states.free:
		
		if !onGround applyThrust()
		
		break	
	#endregion
	#region Jump
	case states.jump:

		applyThrust()
			
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
				
			thrust = 0
			xx = 0
			yy = 0
		}
	break
	#endregion
	#region Splat
		case states.splat:
			
			
		break
	#endregion
}

force = applyForce(Direction,force)

if knockedDown {
	if timer > 0 {	
		timer -= 1 * app.gameTime 
		if abs(rotation) < 87 {
			rotation = lerp(rotation,90*image_xscale,0.5)
		}	
	}	
	//	Time to get back up
	else if onGround {
		if (abs(rotation) - 0) > 3 {
			rotation = lerp(rotation,0,0.5)	
		} else {
			knockedDown = false		
		}
	}
}

if onGround {
	//	I am on the ground
	z = y
	groundX = x
	groundY = y	
	if movespeed < 0 movespeed = 0
}

if damagedTimer > 0 damagedTimer-- 
else if damaged {
	damaged = false
}

collisionCheck()

depth = -groundY