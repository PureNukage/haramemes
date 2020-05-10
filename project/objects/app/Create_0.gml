version = ""
credits = "@PureNukage, @ConcernedBears"

instance_create_layer(0,0,"Instances",time)			debug_log("Created TIME")
input = instance_create_layer(0,0,"Instances",playerInput)	debug_log("Created PLAYERINPUT")
instance_create_layer(0,0,"Instances",debug)		debug_log("Created DEBUG")
instance_create_layer(0,0,"Instances",camera)		debug_log("Created CAMERA")

gameTime = 1.0
slowmo = -1

splatterSurface = -1
splatterSurfaceFinal = -1