if target > -1 {
	xx = target.x + screenShakeX
	yy = target.y + screenShakeY
	
	screenShakeX = lerp(screenShakeX,0,0.05)
	screenShakeY = lerp(screenShakeY,0,0.05)
	
	Direction = point_direction(0,0,sign(xx),sign(yy))
	
	var spd = max(xx, yy)
	
	x = round(lerp(x, xx, 0.05))
	y = round(lerp(y, yy, 0.05))

}

scale_canvas(base_width,base_height,1280,720,true)