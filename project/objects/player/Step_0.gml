switch(states)
{
	#region Free
		case states.free:
		
			//	Player movement
			//var Direction = point_direction(0,0,input.hspd,input.vspd)
				
			playerMovement()
			
			//	I am jumping
			if input.jump {
				zAccl = 10
				states = states.jump	
			}
			
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
				
				//	Make smash decal
				if goSmash {
					var Decal = instance_create_layer(x,y,"Instances",decal)
					Decal.timer = 120
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
			if input.punch and image_index < sprite_get_number(sprite_index)-2 {
				punchCharge = 1
			}
			
			force = applyForce(Direction,force)
			
			//	My punch is over
			if animation_end { 
				
				//	I am not punching again
				if !punchCharge {
					states = states.free	
					movespeedMax = 5
				} 
				//	I am punching again!
				else {
					if input.hspd != 0 or input.vspd != 0 {
						Direction = point_direction(0,0,input.hspd,input.vspd)
						force = 20
					}
					states = states.punch2
					image_index = 0
				}
			}
			
		break	
	#endregion
	#region Punch2
		case states.punch2:
			
			sprite_index = s_gorilla_punch2
			image_speed = 1
			
			//	I am starting to charge my punch
			if input.punch and punchCharge == 0 and image_index < 2 {
				punchCharge = 1	
				image_speed = 0
				image_index = 1
			}
			
			//	I am charging my punch
			if punchCharge > 0 {
				punchCharge++
				image_index = 1
				image_speed = 0
				
				//	I am done charging my punch
				if !input.punchHold or punchChargeRadius >= punchChargeRadiusMax-5 {
					punchCharge = 0	
					punchChargePunch = true
					image_speed = 1
					image_index = 2
				}
			}
			
			//	I am charge punching
			if punchChargePunch {
				force = applyForce(Direction,force)
			}
			
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

collisionCheck()

depth = -y