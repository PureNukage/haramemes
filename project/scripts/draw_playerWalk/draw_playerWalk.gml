if movespeed > 0 {
	sprite_index = s_gorilla_walk
	image_speed = max(accl,.4)
	if hspd > 0 image_xscale = 1 else if hspd < 0 image_xscale = -1	
} else {
	if movespeed > 0 {
		image_speed = movespeed/movespeedMax
	} else {
		sprite_index = s_gorilla_idle	
	}	
}