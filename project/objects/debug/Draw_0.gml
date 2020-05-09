draw_set_color(c_yellow)

with player {
	var xx = x + 64
	var yy = y - 92
	var e = []
	e[states.free] = "Free"
	e[states.jump] = "Jump"
	e[states.punch1] = "Punch1"
	e[states.punch2] = "Punch2"
	draw_text(xx,yy,e[states])	
}