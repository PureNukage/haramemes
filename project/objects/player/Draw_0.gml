////	Draw shadow
draw_set_color(c_dkgray)
draw_ellipse(groundX-24,groundY-3,groundX+24,groundY+3,false)

//	Charge Punch
if states == states.punch2  or states == states.punch1 {
	if input.punchHold and punchCharge > punchChargeMin {
		
		var xOffset = -1
		var yOffset = -1
		var side = -1
		
		if states == states.punch2 {
			var xOffset = 21
			var yOffset = 54
			side = image_xscale
		} else {
			var xOffset = 14
			var yOffset = 54
			side = image_xscale*-1
		}
		
		//	Draw white circle around fist
		draw_set_color(c_white)
		draw_circle(x + (side * xOffset), y - yOffset, 16, false)
		
		//	Draw charging white circle
		draw_set_alpha(0.5)
		draw_circle(x + (side * xOffset), y - yOffset, punchChargeRadius, false)
		punchChargeRadius = lerp(punchChargeRadius, punchChargeRadiusMax, 0.05) 
		draw_set_alpha(1)
		
	}
} else if states == states.free {
	
	//	Drawing the player walk cycle
	if !grab draw_playerWalk()	
	
	if grab {
		movespeedMax = 2
		image_speed = .75
		
		//	Sprite check
		grabSpriteCheck()
		//if image_xscale > 0 sprite_index = s_gorilla_punch2redo else if image_xscale < 0 sprite_index = s_gorilla_punch1
		
		if animation_end {
			grab = false
			grabRightHand = false
			grabLeftHand = false
			movespeedMax = 5
		}
	}
	
} else if states == states.jump {
	
	if goSmash sprite_index = s_gorilla_smash
	
} else if states == states.holding {
	
	//	Sprite check
	grabSpriteCheck()
	
	Direction = point_direction(0,0,input.hspd,input.vspd)
	
	if input.hspd != 0 or input.vspd != 0 {
		if input.hspd > 0 image_xscale = 1 else if input.hspd < 0 image_xscale = -1	
	} 
	
	grabThrow()
	
	if !grabRightHand and !grabLeftHand {
		states = states.free
		movespeedMax = 5
		grab = false
	}
	
	if grab {
		
		image_index = 1
		
		var offset = -1
		
		//	Right Hand
		if grabRightHandHeld > -1 and instance_exists(grabRightHandHeld) {
		
			if sprite_index == s_gorilla_punch1 offset = -32
			else offset = 32
			
			draw_sprite(grabRightHandHeld.sprite,0,x+offset,y-4)	
			draw_sprite_ext(grabRightHandHeld.sprite,0,x+offset,y-4,1,1,0,c_black,.5)
		}
		
		//	Left Hand
		if grabLeftHandHeld > -1 and instance_exists(grabLeftHandHeld) {
			
			if sprite_index == s_gorilla_punch2 offset = -32
			else offset = 32
			
			draw_sprite(grabLeftHandHeld.sprite,0,x+offset,y-4)	
			draw_sprite_ext(grabLeftHandHeld.sprite,0,x+offset,y-4,1,1,0,c_black,.5)	
		}
	}
	
	draw_self()	
}


if states != states.holding draw_self()