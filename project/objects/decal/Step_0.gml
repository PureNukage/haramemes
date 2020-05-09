if !cleanup {
	if timer > 0 timer-- 
	else {
		cleanup = true
	
	}	
} else {
	alpha -= 0.05
	if alpha <= 0 instance_destroy()
}