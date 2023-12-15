extends Node
#this is where we "hide the ugly"

@export var move_speed = 10

@export var effects: Array[EffectResource]

func get_stat(name):
	assert(get(name),"Effect targets unknown key")
	var value = get(name)
	for effect in effects:
		if(effect.key==name):
			value+=effect.addition
	for effect in effects:
		if(effect.key==name):
			value*=effect.multiplication
	return value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"../pathfinding".speed=get_stat("move_speed")
