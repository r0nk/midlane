extends Node

@export_dir var resource_path = "res://"

#TODO rarities

func is_a_resource(path):
	return path.ends_with(".tres")

func pick(_regex_string):
	var dir = DirAccess.open(resource_path)
	if !dir:
		assert(dir)
		print("An error occurred when trying to access the path.")
		return null
#	var regex = RegEx.new()
#	regex.compile(regex_string)
#	var regex_filter = func(s):
#			return   regex matches #TODO
	var files = Array(dir.get_files()).filter(is_a_resource)
	var selection = resource_path+"/"+files.pick_random()
	var resource = load(selection)
	assert(resource!=null,"Bad resource pick for:"+selection)
	return resource
