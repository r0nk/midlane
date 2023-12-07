extends StaticBody3D

@onready var creep = load("res://creep.tscn")

var timer = 0

func _on_timer_timeout():
	for i in range(4):
		var c = creep.instantiate()
		c.position = $spawn_point.position + Vector3(randf_range(-1,1),0,randf_range(-1,1))
		add_sibling(c)

func _process(delta):
	timer-=delta
	if (timer < 0):
		_on_timer_timeout()
		timer=15

