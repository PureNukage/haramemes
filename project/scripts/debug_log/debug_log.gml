///@param debug_string
///@param level

var String = argument[0]
if argument_count > 1 var Level = argument[1] else var Level = INFO

var Object = object_get_name(object_index)

var ObjectUpper = string_upper(Object)

var Time = time.stream

//ar totalString = "[" + string(Time) + "] " + ObjectUpper + " " +  String
	
var strings = []
strings[INFO] = "INFO"
strings[DEBUG] = "DEBUG"

show_debug_message("[" + string(Time) + "] [" + string(strings[Level]) + "] " + ObjectUpper + " " +  String)