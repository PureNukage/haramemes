if movespeed > 0 {
	sprite_index = s_gorilla_walk
	image_speed = max(accl,.4) * app.gameTime
	if hspd > 0 image_xscale = 1 else if hspd < 0 image_xscale = -1	
} else {
	if movespeed > 0 {
		image_speed = movespeed/movespeedMax * app.gameTime
	} else {
		sprite_index = s_gorilla_idle	
	}	
}