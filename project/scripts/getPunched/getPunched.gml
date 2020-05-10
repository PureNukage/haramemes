///@param force 
///@param ?mask

var Force = argument[0]
var Mask = argument[1]

var oldMask = mask_index

mask_index = Mask

if (place_meeting(x + xx, y + yy, enemy) and image_speed > 0) {
	var Enemy = instance_place(x + xx, y + yy, enemy)
	with Enemy {
		if !damaged {
			damaged = true
			damagedTimer = 15
			force = Force
			Direction = point_direction(other.x,other.y,groundX,groundY)
			if other.punchChargePunch triggerSlowmo(0.1,15)
		}
	}
				
}

mask_index = oldMask