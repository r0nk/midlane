extends Node2D

@onready var bullet = load("res://bullet.tscn")

var range=350
var damage=50

var timer=1

var active = true

func disable():
	active=false

func enable():
	active=true

func attack(target):
	var b = bullet.instantiate()
	b.position=global_position
	b.target=target
	b.cause=get_parent()
	b.damage=damage
	get_parent().add_sibling(b)

func _process(delta):
	if not active:
		return
	if is_instance_valid($"../acquisition".target) and global_position.distance_to($"../acquisition".target.position) < range:
		timer-=delta
		if(timer<=0):
			timer=1
			attack($"../acquisition".target)
	else:
		timer=0
