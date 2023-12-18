extends Node
#this is where we "hide the ugly"

@export var move_speed = 10
@export var attack_damage = 10
@export var attack_speed = 10
@export var passive_income = 1

@export var effects: Array[EffectResource]

func get_stat(name):
	assert(name in $".","Effect targets unknown key:"+name)
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
	$"../ranged".damage=get_stat("attack_damage")
	$"../ranged".speed=get_stat("attack_speed")
	$"../collector".passive_income=get_stat("passive_income")

func effect_timers(delta):
	var index = 0
	while index < effects.size(): #not 'for' because we modify inside.
		if(effects[index].permanent):
			index+=1
			continue
		effects[index].duration-=delta
		if(effects[index].duration<=0):
			effects.remove_at(index)
		index+=1

func _process(delta):
	effect_timers(delta)
	apply_stat_links()

func add_effect(effect):
	if(effect.duration==0 and !effect.permanent):
		apply_effect(effect)
	else:
		effects.append(effect)
