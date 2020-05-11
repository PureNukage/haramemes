switch(states)
{
	#region Free
		case states.free:
				
			playerMovement()
			
			if !onGround applyThrust()
			
			//	I am jumping
			if input.jump and onGround {
				//onGround = false
				thrust = 10
				states = states.jump
			}
			
			smash = false
			
			force = applyForce(Direction,force)
			
			//	I am punching
			if input.punch {
				damageID = time.stream
				if punch1CD > -1 {
					states = states.punch2	
				} else {
					states = states.punch1
				}
				sprite_index = s_gorilla_punch1
				punchCharge = 9
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
			
			applyThrust()
			
			//	I am jump smashing
			if input.punch and !goSmash and thrust > 0 {
				goSmash = true
				grav = 1
				thrust += 5
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
				
				thrust = 0
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
			
			sprite_index = s_gorilla_punch2redo
			
			punchLogic(states.punch1, sprite_index)
			
		break
	#endregion
}

if punch1CD > 0 punch1CD--
else if punch1CD == 0 {
	punch1CD = -1
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

depth = -groundY