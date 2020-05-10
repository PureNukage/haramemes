////	Draw shadow
draw_set_color(c_dkgray)
draw_ellipse(groundX-24,groundY-3,groundX+24,groundY+3,false)

//	Charge Punch
if states == states.punch2 {
	if input.punchHold and punchCharge > 5 {
		
		//	Draw white circle around fist
		draw_set_color(c_white)
		draw_circle(x + (image_xscale * 21), y - 54, 16, false)
		
		//	Draw charging white circle
		draw_set_alpha(0.5)
		draw_circle(x + (image_xscale * 21), y - 54, punchChargeRadius, false)
		punchChargeRadius = lerp(punchChargeRadius, punchChargeRadiusMax, 0.05) 
		draw_set_alpha(1)
		
	}
} else if states == states.free {
	
	//	Drawing the player walk cycle
	draw_playerWalk()	
	
} else if states == states.jump {
	
	if goSmash sprite_index = s_gorilla_smash
	
}

draw_self()