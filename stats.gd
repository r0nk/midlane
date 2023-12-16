extends Node
#this is where we "hide the ugly"

@export var move_speed = 10
@export var attack_damage = 10

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

func apply_effect(effect):
	if(effect.key=="heal"):
		assert(effect.multiplication==0)
		$"../health/sv/bar".value+=effect.addition

func apply_stat_links():
	$"../pathfinding".speed=get_stat("move_speed")

func _process(delta):
	for index in effects.size():
		effects[index].duration-=delta
		if(effects[index].duration<=0):
			effects.remove_at(index)
	apply_stat_links()

func add_effect(effect):
	if(effect.duration==0):
		apply_effect(effect)
	else:
		effects.append(effect)

