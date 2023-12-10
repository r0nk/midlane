extends Node

@onready var explosion = load("res://explosion.tscn")
@export var cooldown = 5

func _process(delta):
	if(cooldown > 0):
		cooldown-=delta

func activate(target):
#	spawn explosion
	if(cooldown>0):
		return
	cooldown=5
	var e = explosion.instantiate()
	e.position=target
	get_tree().get_root().get_node("main").add_child(e)
	pass
