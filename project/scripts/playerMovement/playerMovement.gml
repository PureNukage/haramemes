///@param hspd
///@param vspd
///@param acclMax


hspd = input.hspd
vspd = input.vspd

Direction = point_direction(0,0,hspd,vspd)

accl = abs(hspd) + abs(vspd)
accl = clamp(accl, 0, 1)

if accl > 0 {
	
	movespeed += 1
	movespeed = clamp(movespeed,0,movespeedMax*accl)
	
	xx += lengthdir_x(movespeed,Direction)
	yy += lengthdir_y(movespeed,Direction)
	
} else {

}