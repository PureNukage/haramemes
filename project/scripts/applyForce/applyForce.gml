///@param direction
///@param force

var Direction = argument[0]
var Force = argument[1]

if app.slowmo == -1 or object_index = player {

	xx += lengthdir_x(Force,Direction)
	yy += lengthdir_y(Force,Direction)

	if Force > 0 Force -= fric * app.gameTime
	else Force = 0
	
}

Force = clamp(Force, 0 , 100)

return Force