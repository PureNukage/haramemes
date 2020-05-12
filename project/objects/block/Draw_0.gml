draw_self()

if surface_exists(app.splatterSurface) {
	draw_surface_part(app.splatterSurface, x, y, sprite_get_width(s_block), sprite_get_height(s_block), x, y )
	
	//draw_set_color(c_red)
	//draw_rectangle(x,y,x+sprite_get_width(s_block),y+sprite_get_height(s_block),false)
}