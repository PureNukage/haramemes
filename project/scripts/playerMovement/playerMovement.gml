///@param direction
///@param acclMax

hspd = input.hspd
vspd = input.vspd

Direction = point_direction(0,0,hspd,vspd)

accl = point_distance(0,0,abs(hspd),abs(vspd))
accl = clamp(accl, 0, 1)

if (hspd != 0 or vspd != 0) {
	
	movespeed += accl
	movespeed = clamp(movespeed,0,movespeedMax*accl)
	
	xx += lengthdir_x(movespeed,Direction)
	yy += lengthdir_y(movespeed,Direction)
	
} else {
	if movespeed > 0 movespeed -= fric
}