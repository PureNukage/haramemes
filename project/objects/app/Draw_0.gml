if !surface_exists(splatterSurface) or !surface_exists(splatterSurfaceFinal) {
	splatterSurface = surface_create(room_width,room_height)
	splatterSurfaceFinal = surface_create(room_width,room_height)
	
	surface_set_target(splatterSurface)
	draw_clear_alpha(c_white, 0)
	surface_reset_target()
	
	surface_set_target(splatterSurfaceFinal)
	draw_clear_alpha(c_white, 0)
	surface_reset_target()
}
//	Draw splatter surface
else {
	depth = -5000
	surface_set_target(splatterSurfaceFinal)

	draw_clear_alpha(c_white, 0)
	with (block) draw_self()

	gpu_set_blendmode_ext(bm_dest_alpha, bm_zero)
	draw_surface(splatterSurface, 0, 0)
	gpu_set_blendmode(bm_normal)

	surface_reset_target()

	draw_surface(splatterSurfaceFinal, 0, 0)
}