if target > -1 {
	xx = target.x + screenShakeX
	yy = target.y + screenShakeY
	
	screenShakeX = lerp(screenShakeX,0,0.05)
	screenShakeY = lerp(screenShakeY,0,0.05)
	
	Direction = point_direction(0,0,sign(xx),sign(yy))
	
	var spd = max(xx, yy)
	
	x = lerp(x, xx, 0.05)
	y = lerp(y, yy, 0.05)

}