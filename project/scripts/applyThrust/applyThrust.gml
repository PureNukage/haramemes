//	I am going up or down during this jump
z -= thrust * app.gameTime
			
//	Applying gravity to accelerant
thrust -= grav * app.gameTime
			
//	Keep my shadow following my x-position
groundX = x
			
//	I am visually in the air!
y = z
	
//	Check for landing
if y < groundY {
	onGround = false	
} else {
	onGround = true
}
