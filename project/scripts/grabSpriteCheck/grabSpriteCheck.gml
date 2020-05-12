//	Right Hand
if grabRightHand {
	
	//	Facing to the right
	if image_xscale > 0 {
		sprite_index = s_gorilla_punch1
	}
	//	Facing to the left
	else if image_xscale < 0 {
		sprite_index = s_gorilla_punch2redo
	}
	
} 
//	Left Hand
else {
	
	//	Facing to the right
	if image_xscale > 0 {
		sprite_index = s_gorilla_punch2redo
	}
	//	Facing to the left
	else if image_xscale < 0  {
		sprite_index = s_gorilla_punch1
	}
		
}