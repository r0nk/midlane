extends Node

var destination = Vector3(5,2,5)
@export var speed = 5
var p

func _ready():
	p = get_parent()

func _process(delta):
	if(p.position.distance_to(destination) == 0.0):
		return
	p.velocity = (destination-p.position).normalized()*speed
	p.move_and_slide()
	p.look_at(destination,Vector3(0,1,0))
	p.rotation.x=0
	p.rotation.z=0
	if(p.position.distance_to(destination) < 0.1):
		p.position=destination


