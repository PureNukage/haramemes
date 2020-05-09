switch(states)
{
	#region Free
		case states.free:
		
			playerMovement()
			
			if input.jump {
				zAccl = 10
				states = states.jump	
			}
			
			if input.punch {
				states = states.punch1	
				movespeed = 0
				xx = 0
				yy = 0
				image_index = 0
			}
			
			z = y
			
			groundX = x
			groundY = y
			
			collisionCheck()
			
		break
	#endregion
	#region Jump
		case states.jump:
		
			playerMovement()
		
			sprite_index = s_gorilla_jump
			
			z -= zAccl
			
			zAccl -= grav
			
			collisionCheck()
			groundX = x
			
			y = z
			
			if input.punch and !goSmash and zAccl > 0 and !instance_exists(decal) {
				goSmash = true
				grav = 1
				zAccl += 5
				movespeedMax = 8
				
			}
			
			if y < groundY {
				onGround = false
			} else {
				onGround = true
				states = states.free
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
			
			movespeedMax = 3
			playerMovement()
			collisionCheck()
			
			groundX = x
			groundY = y
			
			if image_index < sprite_get_number(sprite_index)-2 and input.punch {
				punchCharge = 1
			}
			
			if animation_end { 
				if !punchCharge {
					states = states.free	
					movespeedMax = 5
				} else {
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
			
			if input.punch and image_index < 2 {
				punchCharge = 1	
				image_speed = 0
				image_index = 1
			}
			
			if punchCharge > 0 {
				image_index = 1
				image_speed = 0
				
				if !input.punchHold {
					punchCharge = 0	
					punchChargePunch = true
					image_speed = 1
				}
			}
			
			if punchChargePunch {
				movespeed = 8
				movespeedMax = 8
				playerMovement()
				collisionCheck()
			}
			
			groundX = x
			groundY = y
			
			if animation_end {
				punchCharge = 0
				punchChargePunch = false
				movespeedMax = 5
				states = states.free	
			}
			
		break
	#endregion
}

depth = -y