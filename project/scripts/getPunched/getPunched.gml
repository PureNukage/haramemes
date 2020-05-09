///@param force 
///@param ?mask

var Force = argument[0]
var Mask = argument[1]

var oldMask = mask_index

mask_index = Mask

if place_meeting(x + xx, y + yy, enemy) and image_speed > 0 {
	var Enemy = instance_place(x + xx, y + yy, enemy)
	with Enemy {
		damaged = true
		damagedTimer = 15
		force = other.force + Force
		Direction = point_direction(other.x,other.y,x,y)	
	}
				
}

mask_index = oldMask