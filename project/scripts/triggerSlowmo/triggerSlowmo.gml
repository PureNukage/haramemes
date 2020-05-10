///@param speed
///@param duration

var Speed = argument[0]
var Duration = argument[1]

if app.slowmo == -1 {
	app.gameTime = Speed
	app.slowmo = Duration
} else {
	debug_log("Already in slowmo!")	
}