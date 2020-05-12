///@param force 
///@param ?mask

var Force = argument[0]
var Mask = argument[1]

var oldMask = mask_index

mask_index = Mask

if (place_meeting(x + xx, y + yy, enemy) and image_speed > 0) {
	var Enemy = instance_place(x + xx, y + yy, enemy)
	with Enemy {
		if other.damageID != damageID and (abs(z - other.z) < 128) and (abs(groundY - other.groundY) < 32) {
			damageID = other.damageID
			damaged = true
			damagedTimer = 15
			damagedFlashTimer = 15
			damageFlash = true
			force += Force
			Direction = other.Direction
			
			with other {
				debug_log("Punch is applying "+string(Force)+" force to "+string_upper(string((object_get_name(Enemy.object_index)))), INFO)
			}
			
			//if other.punchChargePunch triggerSlowmo(0,1)
			
			var bloodScatterX = irandom_range(-10,10)
			var bloodScatterY = irandom_range(-10,10)
			var bloodMist = instance_create_layer(x+bloodScatterX,y-32+bloodScatterY,"Instances",particle)
			bloodMist.thrust = 6
			bloodMist.groundX = groundX+bloodScatterX
			bloodMist.groundY = groundY+bloodScatterY
			//bloodMist.Direction = Direction
			//bloodMist.force = force/4
			
			
			other.force = 0
			//camera.screenShakeX = irandom_range(-10,10)
			//camera.screenShakeY = irandom_range(-10,10)
			
			//if knockedDown {
			//	image_xscale = !other.image_xscale
			//}
			
			////	Knockup
			//	enemy on the ground, player is ChargePunching
			if onGround and other.punchChargePunch {
				if onGround { thrust += Force/3 }
			}
			//	enemy on the ground, player is NOT ChargePunching
			else if onGround and !other.punchChargePunch {
				//if onGround { onGround = false thrust += Force/2 }
			}
			//	enemy in the air and player is not ChargePunching
			if !onGround and !other.punchChargePunch {
				//thrust += Force/6
			}
			//	enemy in the air and player is ChargePunching
			else if !onGround and other.punchChargePunch {
				onGround = false thrust += Force/8
			}
		}
	}	
}

mask_index = oldMask