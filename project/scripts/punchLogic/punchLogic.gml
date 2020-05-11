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
			debug_log("MAXIMUM CHARGED PUNCH!!!!")
			punchChargePunch = true
		}
		image_index = 1
		image_speed = 0
	}
					
}
////	We are NOT holding down punch
else {
	
	//debug_log("[DEBUG] punchCharge: "+string(punchCharge))
				
	if punchCharge > 0 punchCharge -= 1 //* app.gameTime
				
	image_speed = 1
				
	if image_index < 2 {
		image_index = 2
		if punchChargePunch {
				force += punchCharge-9
				debug_log("Charge Punch is applying "+string(punchCharge)+" force to the player!")
			}
			//	Not charge punching
			else {
				force += punchCharge-9
				debug_log("Punch is applying "+string(punchCharge)+" force to the player!")
			}
		if punchCharge > punchChargeMin and !punchChargePunch {
			debug_log("Charge Punch at "+string((punchCharge / punchChargeMax)*100)+"% power!")
			punchChargePunch = true
		}
	} else {
		
		if image_index == 2 {
			if punchChargePunch {
				force += punchCharge
				debug_log("Charge Punch is applying "+string(punchCharge)+" force to the player!")
			}
			//	Not charge punching
			else {
				force += punchCharge
				debug_log("Punch is applying "+string(punchCharge)+" force to the player!")
			}
		}
		
		var slap = -1
		if punchChargePunch slap = force + punchCharge*0.3
		else slap = force
		getPunched(slap, Mask)	
	}
				
	//	Punch again!
	if (input.punch and !punchChargePunch) and image_index >= 3 {
		debug_log("[DEBUG] I am quick punching again!")
		punchQueue = false
		image_index = 0
		punchCharge = 9
		punchChargeRadius = 16
		states = nextState
		damageID = time.stream
	}
	
	if input.punch and punchChargePunch and !punchChargeQueue {		
		punchChargeQueue = true
	}
				
	if animation_end {
		if (!punchChargePunch) or (punchChargePunch and punchCharge <= 0) {
			
			if states == states.punch1 punch1CD = 15
			
			if punchChargeQueue {
				debug_log("I am queueing my next punch")
				states = nextState	
				image_index = 0
				punchCharge = 1
				punchChargeRadius = 16
				punchChargePunch = false
				punchChargeQueue = false
				damageID = time.stream
				exit
			} else {		
				punchChargeQueue = false
				states = states.free
				punchChargeRadius = 16
				punchCharge = 0
				punchChargePunch = false
				image_index = 0
				damageID = -1
			}
					
		}
		image_index = image_number - 1
	}
				
}