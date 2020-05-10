if !onGround applyThrust()

//	If in the air
if y < groundY {
	onGround = false
} 
//	Splat!
else {
	onGround = true
}