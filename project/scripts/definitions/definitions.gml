enum states {
	free,
	walk,
	jump,
	punch1,
	punch2,
	smash,
	splat,
	hold
}

enum decal_types {
	erosion,
	blood
}

#macro animation_end (image_index > image_number - 1)

#macro forceMax 50

#macro c_driedBlood make_color_rgb(180,0,0)

#macro INFO 0
#macro DEBUG 1