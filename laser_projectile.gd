extends CharacterBody3D

var direction :Vector3
var damage = 10
var speed = 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(position+direction)
	velocity=direction*speed
	var collided = move_and_slide()
	if(collided):
		var collision = get_last_slide_collision()
		var target = collision.get_collider()
		if(target.has_node("health")):
			target.get_node("health").hurt(damage)
		else:
			print("attempted to damage a target with no health")
		queue_free()

