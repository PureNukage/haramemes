//	collision check
var oldMask = mask_index

mask_index = sprite_index

//var XX = lengthdir_x(force, Direction)
//var YY = lengthdir_y(force, Direction)

if instance_place(x + xx, y + yy, enemy) {
	var Enemy = instance_place(x + xx, y + yy, enemy)
	
	if Enemy.justThrown == -1 {
	
		Enemy.states = states.held
	
		if grabRightHand and !grabLeftHand {
			grabRightHandHeld = Enemy
			debug_log("Just grabbed "+object_get_name(Enemy.object_index)+" into my Right hand")
		}
		else if grabLeftHand {
			grabLeftHandHeld = Enemy
			debug_log("Just grabbed "+object_get_name(Enemy.object_index)+" into my Left hand")	
		}
	
		states = states.holding
	
		mask_index = oldMask
	
		exit
	}
}

mask_index = oldMask