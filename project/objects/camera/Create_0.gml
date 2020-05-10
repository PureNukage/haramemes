window_scale = 3

base_width = 1920
base_height = 1080

width = base_width/window_scale
height = base_height/window_scale

target = player.id

screenShakeX = 0
screenShakeY = 0

xx = 0
yy = 0

#region Enabling Use of Views

	view_enabled = true
	view_visible[0] = true

	view_set_visible(0,true)

	view_set_wport(0,width)
	view_set_hport(0,height)

#endregion
#region Resize and Center Game Window

	window_set_rectangle((display_get_width()-view_wport[0])*0.5,(display_get_height()-view_hport[0])*0.5,view_wport[0],view_hport[0])
	
	surface_resize(application_surface,view_wport[0],view_hport[0])
	
	display_set_gui_size(width,height)


#endregion
#region Camera Create

	Camera = camera_create()

	var viewmat = matrix_build_lookat(width,height,-10,width,height,0,0,1,0)
	var projmat = matrix_build_projection_ortho(width,height,1.0,32000.0)

	camera_set_view_mat(Camera,viewmat)
	camera_set_proj_mat(Camera,projmat)
	
	camera_set_view_pos(Camera,x,y)
	camera_set_view_size(Camera,width,height)
	
	camera_set_view_speed(Camera,200,200)
	camera_set_view_border(Camera,width,height)
	
	camera_set_view_target(Camera,id)

	view_camera[0] = Camera
	
#endregion

if target > -1 {
	x = target.x
	y = target.y
}

//scale_canvas(base_width,base_height,1280,720,true)