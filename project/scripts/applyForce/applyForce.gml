///@param direction
///@param force

var Direction = argument[0]
var Force = argument[1]

xx += lengthdir_x(Force,Direction)
yy += lengthdir_y(Force,Direction)

if Force > 0 Force -= fric

return Force