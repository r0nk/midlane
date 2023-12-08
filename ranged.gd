extends Marker3D

@onready var bullet = load("res://bullet.tscn")
@export var acquisition_path = "../acquistion"
var acquisition

var range=350
var damage=10

var timer=1

var active = true

func disable():
	active=false

func enable():
	active=true

func _ready():
	acquisition=get_node(acquisition_path)

func attack(target):
	var b = bullet.instantiate()
	b.position=global_position
	b.target=target
	b.cause=get_parent()
	b.damage=damage
	get_tree().get_root().get_node("main").add_child(b)

func _process(delta):
	if not active:
		return
	if is_instance_valid(acquisition.target) and global_position.distance_to(acquisition.target.position) < range:
		timer-=delta
		if(timer<=0):
			timer=1
			attack(acquisition.target)
	else:
		timer=0
