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
			
			force = applyForce(Direction,force)
			
			//	I am punching
			if input.punch {
				damageID = time.stream
				states = states.punch1
				sprite_index = s_gorilla_punch1
				punchCharge = 1
				//force += abs(movespeed/2)
				image_index = 0
				exit
			}
			
			onGround = true
			
		break
	#endregion
	#region Jump
		case states.jump:
		
			playerMovement()
		
			sprite_index = s_gorilla_jump
			
			applyGravity()
			
			//	I am jump smashing
			//if input.punch and !goSmash and zAccl > 0 and !instance_exists(decal) {
			if input.punch and !goSmash and zAccl > 0 {
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
				y = groundY
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
			
			punchLogic(states.punch2, sprite_index)			
			
		break	
	#endregion
	#region Punch2
		case states.punch2:
			
			sprite_index = s_gorilla_punch2
			
			punchLogic(states.punch1, sprite_index)
			
		break
	#endregion
}

if onGround {
	//	I am on the ground
	z = y
	groundX = x
	groundY = y	
	if movespeed < 0 movespeed = 0
}

smashCheck()

collisionCheck()

depth = -y