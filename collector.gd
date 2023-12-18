extends Area3D

var pull_speed=20

var cash = 0.0

var passive_income = 0.0

func collect(body):
	if body.has_method("collect"):
		body.collect(get_parent()) #TODO find a better way to link all this
		$heal_sfx.play()
	else:
		cash+=1
		$coin_sfx.pitch_scale=randf_range(0.9,1.1)
		$coin_sfx.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var bodies = get_overlapping_bodies()
	cash +=passive_income*delta
	for body in bodies:
		var bp = body.global_position
		var p = global_position
		body.position-=(bp-p).normalized()*pull_speed*delta
		if(p.distance_to(bp) <= 1):
			collect(body)
			body.queue_free()
