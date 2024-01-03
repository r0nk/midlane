extends Node

@export_file("*.txt") var path = "res://log.txt"

#https://docs.godotengine.org/en/stable/classes/class_fileaccess.html
func log(stuff: String):
	var file = FileAccess.open(path, FileAccess.READ_WRITE)
	file.seek_end()
	print(stuff)
	file.store_string(stuff+"\n")

