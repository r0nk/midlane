extends Marker3D

@onready var bullet = load("res://laser_projectile.tscn")

var range=350
@export var damage=10
@export var speed = 6

var timer=10/speed

func attack(target):
	var b = bullet.instantiate()
	b.position=global_position
	b.direction=$target.global_position-global_position
	b.damage=damage
	get_tree().get_root().get_node("main").add_child(b)

func _process(delta):
	timer-=delta
	if(timer<=0):
		timer=10/speed
		attack($target)
