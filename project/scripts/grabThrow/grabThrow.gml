if other.input.hspd != 0 or other.input.vspd != 0 {
	var DDirection = other.Direction	
} else {
	var DDirection = -1	
}

if !input.gamepadShoulderRRBPressed { 
	if grabRightHand {
		with grabRightHandHeld {
			force += 12
			thrust += 10
			Direction = other.Direction
			states = states.jump
			justThrown = 15
		}
		debug_log("Just tossed "+object_get_name(grabRightHandHeld.object_index)+" with "+string(grabRightHandHeld.force)+" force and "+string(grabRightHandHeld.thrust)+ "thrust from my Right hand")
		grabRightHandHeld = -1
		grabRightHand = false
	}
}

if !input.gamepadShoulderLLBPressed { 
	if grabLeftHand {
		with grabLeftHandHeld {
			force += 12
			thrust += 10
			Direction = other.Direction
			states = states.jump
			justThrown = 15
		}
		debug_log("Just tossed "+object_get_name(grabLeftHandHeld.object_index)+" with "+string(grabLeftHandHeld.force)+" force and "+string(grabLeftHandHeld.thrust)+ "thrust from my Left hand")
		grabLeftHandHeld = -1
		grabLeftHand = false
	}
}