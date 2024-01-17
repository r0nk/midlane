extends Node

@export var resource: SkillResource

@onready var explosion = load("res://explosion.tscn")

func activate(target):
#	spawn explosion
	if($cooldown.time_left>0):
		return
	$cooldown.start()
	var e = explosion.instantiate()
	e.position=target
	get_tree().get_root().get_node("main").add_child(e)
