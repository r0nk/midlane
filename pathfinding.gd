extends Node

var destination = Vector3(5,2,5)
@export var speed = 5
@export var encircle = false
@export var encircle_radius = 10
var encircle_angle = 0
var encircle_speed = 1

var p

func _ready():
	p = get_parent()

func _process(delta):
	var d = destination
	if(encircle):
		encircle_angle+=delta*encircle_speed
		d+=Vector3(encircle_radius,0,0).rotated(Vector3(0,1,0),encircle_angle)
	if(p.position.distance_to(d) == 0.0):
		return
	p.velocity = (d-p.position).normalized()*speed
	p.move_and_slide()
	p.look_at(d,Vector3(0,1,0))
	p.rotation.x=0
	p.rotation.z=0
	if(p.position.distance_to(d) < 0.1):
		p.position=d
