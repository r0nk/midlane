extends CharacterBody3D

var target
var damage = 5
var cause

func _process(delta):
	if not is_instance_valid(target):
		queue_free()
		return
	look_at(target.position)
	if position.distance_to(target.position) > 1:
		position-=(position-target.position).normalized() * 1
	else:
		if(target.has_node("health")):
			target.get_node("health/sv/bar").value-=damage
		else:
			print("attempted to damage a target with no health")
		queue_free()
