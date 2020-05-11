///@param ?splatStates
///@param ?forceMax

var splatStatesCount = sprite_get_number(s_splatter)
var segments = forceMax / splatStatesCount
			
for(var i=0;i<splatStatesCount;i++) {
	if (force > segments*i and force <= segments*(i+1))
	or (force > forceMax) {
		
		if (force > forceMax) {
			i = splatStatesCount-1	
		}
		
		//	Draw splat
		surface_set_target(app.splatterSurface)
		
		var XX = lengthdir_x(force,Direction)
		var YY = lengthdir_y(force,Direction)
		
		var bloodScatterX = irandom_range(-10,10)
		var bloodScatterY = irandom_range(-10,10)
	
		draw_sprite_ext(s_splatter,i,groundX+XX+bloodScatterX,groundY+YY+bloodScatterY,1,1,abs(Direction),c_driedBlood,1)
		
		surface_reset_target()
		
	}
}