extends Area3D

@export var effects: Array[EffectResource]

var applied: Array

func expire():
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for body in get_overlapping_bodies():
		if body in applied:
			continue
		#TODO body apply effects
		body.get_node("health/sv/bar").value-=12
		applied.append(body)

