extends Area3D

var root
@onready var target

func process_targeting():
	var bodies = get_overlapping_bodies()
	if(!has_overlapping_bodies()):
		return
	bodies.sort_custom(target_sort)
#	for body in bodies:
#		print(body.name)
	var body = bodies.pop_back()
	if(body.name == get_parent().name):
		target=bodies.pop_back()
	target=body

func body_entered_or_exited(_body):
	process_targeting()

#this'll be more complicated later
func target_sort(a,b): #a < b, reversed for speed
	return position.distance_to(a.position) < position.distance_to(b.position)
