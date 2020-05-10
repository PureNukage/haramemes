///@param next_state
///@param mask_index

var nextState = argument[0]
var Mask = argument[1]

if (input.hspd != 0 or input.vspd != 0) {
	Direction = point_direction(0,0,input.hspd,input.vspd)
	if input.hspd > 0 {
		if image_xscale < 0 image_xscale = 1
	} else {
		if image_xscale > 0 image_xscale = -1
	}
} else {
	Direction = point_direction(0,0,image_xscale,0)
}
			
if movespeed > 0 movespeed -= fric * app.gameTime
			
force = applyForce(Direction,force)
			
////	We are holding down punch!
if input.punchHold and !input.punch and !punchChargePunch and image_index < 2 {
				
	//
	if punchCharge > 0 and !punchChargePunch {
		if punchCharge < punchChargeMax {
			punchCharge++	
		} else {
			punchChargePunch = true
			force += punchCharge
		}
		image_speed = 0
		image_index = 1
	}
					
}
////	We are NOT holding down punch
else {
				
	if punchCharge > 0 punchCharge -= 1 //* app.gameTime
				
	if !punchChargePunch and punchCharge > punchChargeMin {
		punchChargePunch = true
		force += punchChargeMin
	}
				
	image_speed = 1
				
	if image_index < 2 {
		image_index = 2
		if !punchChargePunch {
			force += punchChargeMin	
		}
	} else {
		var slap = -1
		if punchChargePunch slap = punchCharge
		else slap = punchCharge
		getPunched(force + slap, Mask)	
	}
				
	//	Punch again!
	if input.punch and !punchChargePunch  {
		force += punchCharge/3
		image_index = 0
		punchCharge = 1
		punchChargeRadius = 16
		states = nextState
		damageID = time.stream
	}
				
	if animation_end {
		if (!punchChargePunch) or (punchChargePunch and punchCharge <= 0) {
					
			states = states.free
			punchChargeRadius = 16
			//force += punchCharge
			punchCharge = 0
			punchChargePunch = false
			image_index = 0
			damageID = -1
					
		}
		image_index = image_number - 1
	}
				
}