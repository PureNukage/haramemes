if states != states.held {
	////	Draw shadow
	draw_set_color(c_dkgray)
	if knockedDown var gY = groundY + 20
	else var gY = groundY
	draw_ellipse(groundX-24,gY-3,groundX+24,gY+3,false)

	if damageFlash {
		shader_set(sdr_flash)	
	}
	draw_sprite_ext(sprite,0,x,y,1,1,rotation,c_white,1)

	shader_reset()

	//	States
	switch(states)
	{
		#region Splat
			case states.splat:
			
				drawSplat()
			
				if force > 30 instance_destroy() else {
					states = states.free
					force = 0	
				}
			
			break
		#endregion
		#region Held
			case states.held:
			
			break
		#endregion
	}
	
}