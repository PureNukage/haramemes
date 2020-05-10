//	I am going up or down during this jump
z -= zAccl * app.gameTime
			
//	Applying gravity to accelerant
zAccl -= grav * app.gameTime
			
//	Keep my shadow following my x-position
groundX = x
			
//	I am visually in the air!
y = z