if player.smash {
	if point_in_circle(x,y,player.x,player.y,player.smashRadius) {
		knockedDown = true
		timer = 120
	}
}

switch(states)
{
	case states.free:
		
	break	
}

if knockedDown {
	if timer > 0 {
		timer--
		if abs(rotation) < 87 {
			rotation = lerp(rotation,90*image_xscale,0.5)
		}	
	}	
	//	Time to get back up
	else {
		if rotation > -3 or rotation < 3 {
			rotation = lerp(rotation,0,0.5)	
		} else {
			knockedDown = false		
		}
	}
}