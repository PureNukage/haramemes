enum states {
	free,
	walk,
	jump,
	punch1,
	punch2,
	smash,
	splat
}

enum decal_types {
	erosion,
	blood
}

#macro animation_end (image_index > image_number - 1)

#macro forceMax 50