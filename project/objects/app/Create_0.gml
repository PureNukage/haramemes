version = ""
credits = "@PureNukage, @ConcernedBears"

instance_create_layer(0,0,"Instances",time)			debug_log("Created TIME", INFO)
input = instance_create_layer(0,0,"Instances",playerInput)	debug_log("Created PLAYERINPUT", INFO)
instance_create_layer(0,0,"Instances",debug)		debug_log("Created DEBUG", INFO)
instance_create_layer(0,0,"Instances",camera)		debug_log("Created CAMERA", INFO)

gameTime = 1.0
slowmo = -1

splatterSurface = -1
splatterSurfaceFinal = -1