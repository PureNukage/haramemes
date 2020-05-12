if !onGround applyThrust()

//force = applyForce(Direction,force)

//	If in the air
if y < groundY {
	onGround = false
	
	if !wallSplat and thrust < 0 {
		wallSplat = true
		//	Draw wall splat
	
		surface_set_target(app.splatterSurface)
		
		var XX = lengthdir_x(force,Direction)
		var YY = lengthdir_y(force,Direction)
	
		draw_sprite_ext(s_mist,0,x+XX,y+YY,1,1,abs(Direction),c_driedBlood,1)
		
		surface_reset_target()	
	}
} 
//	Splat!
else {
	if !onGround {
		onGround = true
		
		////	Draw wall splat
	
		//surface_set_target(app.splatterSurface)
		
		//var XX = lengthdir_x(force,Direction)
		//var YY = lengthdir_y(force,Direction)
	
		//draw_sprite_ext(s_mist,0,groundX+XX,groundY+YY,1,1,abs(Direction),c_driedBlood,1)
		
		//surface_reset_target()
		
	}
}

// += xx
//y += yy