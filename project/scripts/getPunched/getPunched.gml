///@param force 
///@param ?mask

var Force = argument[0]
var Mask = argument[1]

var oldMask = mask_index

mask_index = Mask

if (place_meeting(x + xx, y + yy, enemy) and image_speed > 0) {
	var Enemy = instance_place(x + xx, y + yy, enemy)
	with Enemy {
		if !damaged and other.damageID != damageID and (abs(z - other.z) < 128) and (abs(groundY - other.groundY) < 32) {
			damageID = other.damageID
			damaged = true
			damagedTimer = 15
			force += Force
			Direction = point_direction(other.x,other.y,groundX,groundY)
			
			//if other.punchChargePunch triggerSlowmo(0,1)
			
			var bloodScatterX = irandom_range(-10,10)
			var bloodScatterY = irandom_range(-10,10)
			var bloodMist = instance_create_layer(x+bloodScatterX,y+bloodScatterY,"Instances",particle)
			bloodMist.zAccl = 6
			force -= Force/3
			camera.screenShakeX = irandom_range(-10,10)
			camera.screenShakeY = irandom_range(-10,10)
			
			//	Knockup
			if onGround and other.punchChargePunch {
				states = states.jump
				zAccl += Force
			}
			if !onGround and !other.punchChargePunch {
				zAccl += Force
			}
		}
	}	
}

mask_index = oldMask