switch(states)
{
	#region Free
		case states.free:
				
			playerMovement()
			
			//	I am jumping
			if input.jump {
				zAccl = 10
				states = states.jump	
			}
			
			smash = false
			
			//	I am punching
			if input.punch {
				states = states.punch1
				if input.hspd != 0 or input.vspd != 0 {
					Direction = point_direction(0,0,hspd,vspd)
					force = 12
				}
				movespeed = 0
				xx = 0
				yy = 0
				image_index = 0
			}
			
			//	I am on the ground
			onGround = true
			z = y
			groundX = x
			groundY = y
			
		break
	#endregion
	#region Jump
		case states.jump:
		
			playerMovement()
		
			sprite_index = s_gorilla_jump
			
			//	I am going up or down during this jump
			z -= zAccl
			
			//	Applying gravity to accelerant
			zAccl -= grav
			
			//	Keep my shadow following my x-position
			groundX = x
			
			//	I am visually in the air!
			y = z
			
			//	I am jump smashing
			if input.punch and !goSmash and zAccl > 0 and !instance_exists(decal) {
				goSmash = true
				grav = 1
				zAccl += 5
				movespeedMax = 8
				
			}
			
			//	I am in the air!
			if y < groundY {
				onGround = false
			} 
			//	I have landed
			else {
				onGround = true
				states = states.free
				
				//	SMASH
				if goSmash {
					var Decal = instance_create_layer(x,y,"Instances",decal)
					Decal.timer = 120
					smash = true
					var amount = collision_circle_list(x,y,smashRadius,enemy,false,true,smashList,true)
					debug_log("I smashed "+string(amount)+" enemies!")
				}
				goSmash = false
				grav = 1
				movespeedMax = 5
				movespeed = 0
				
				zAccl = 0
				xx = 0
				yy = 0
			}
			
		break
	#endregion
	#region Punch1
		case states.punch1:
			
			sprite_index = s_gorilla_punch1
			image_speed = 1
			
			//	I am on the ground
			groundX = x
			groundY = y
			onGround = true
			z = y
			
			//	I am queuing up a second punch
			if input.punch and image_index > 1 {
				punchCharge = 1
				if input.hspd != 0 or input.vspd != 0 {
					Direction = point_direction(0,0,input.hspd,input.vspd)
				}
				states = states.punch2
				image_index = 0
			}
			
			force = applyForce(Direction,force)
			
			getPunched(2, s_gorilla_punch1)
			
			//	My punch is over
			if animation_end { 
				
				//	I am not punching again
				if !punchCharge {
					states = states.free	
					movespeedMax = 5
				} 

			}
			
		break	
	#endregion
	#region Punch2
		case states.punch2:
			
			sprite_index = s_gorilla_punch2
			
			//	I am changing this punch
			if input.punchHold and punchCharge > 0 {
				image_index = 1
				image_speed = 0
				punchCharge++
				punchCharge = clamp(punchCharge, 0, punchChargeMax)
				if input.hspd != 0 or input.vspd != 0 
				Direction = point_direction(0,0,input.hspd,input.vspd)
				//	I am punching
				if input.punchRelease or punchChargeRadius > punchChargeRadiusMax-5 {
					
					force = force + (punchCharge*2)
					
					punchCharge = 0
					
					punchChargePunch = true
			
				}	
			} else {	
				if punchCharge > 0 {
					force = force + (punchCharge*2)
					punchCharge = 0
					punchChargePunch = true
				}
				image_speed = 1	
			}
			
			//	I am charge punching
			if punchChargePunch {
				force = applyForce(Direction,force)
			}
			
			getPunched(force/2, s_gorilla_punch2)
			
			//	I am on the ground
			groundX = x
			groundY = y
			onGround = true
			z = y
			
			if animation_end {
				punchChargeRadius = 16
				punchCharge = 0
				punchChargePunch = false
				movespeedMax = 5
				states = states.free	
			}
			
		break
	#endregion
}

smashCheck()

collisionCheck()

depth = -y