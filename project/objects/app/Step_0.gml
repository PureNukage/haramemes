//	Move slowmo up or down with Right Analog stick
if input.gamepadAxisRH != 0 {
	gameTime += input.gamepadAxisRH/10
	gameTime = clamp(gameTime, 0 , 2)
}

//	If Slowmo is active
if slowmo > 0 slowmo--
//	Slowmo just finished
else {
	gameTime = 1.0
	slowmo = -1	
}

if input.gamepadKey3Press {
	game_restart()	
}