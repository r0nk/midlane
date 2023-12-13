extends Area3D

var pull_speed=0.2

var cash = 0

func collect():
	cash+=1
	$coin_sfx.pitch_scale=randf_range(0.9,1.1)
	$coin_sfx.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		var bp = body.global_position
		var p = global_position
		body.position-=(bp-p).normalized()*pull_speed
		if(p.distance_to(bp) <= 1):
			collect()
			body.queue_free()
