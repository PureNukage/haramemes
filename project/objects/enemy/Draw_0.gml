////	Draw shadow
draw_set_color(c_dkgray)
if knockedDown var gY = groundY + 20
else var gY = groundY
draw_ellipse(groundX-24,gY-3,groundX+24,gY+3,false)

if damaged {
	shader_set(sdr_flash)	
}
draw_sprite_ext(sprite,0,x,y,1,1,rotation,c_white,1)

shader_reset()