///@param id

var ID = argument[0]

if object_index == enemy {
	if force > 0 {
		
		//	Calculate splat direction
		Direction = point_direction(groundX,groundY,ID.x,ID.y)
		//Direction = point_direction(ID.x,ID.y,groundX,groundY)
		
		return true	
	} else {
		return false
	}	
} else {
	return false	
}