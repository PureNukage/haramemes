////	
if ds_list_empty(smashList) {
	
} else {
	var Enemy = smashList[| 0]
	
	with Enemy {
		knockedDown = true
		states = states.jump
		timer = 120
		zAccl = 8
	}
	
	ds_list_delete(smashList,0)
}