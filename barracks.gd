extends StaticBody3D

@onready var creep = load("res://creep.tscn")
@onready var laser_bird = load("res://laser_bird.tscn")

@onready var rune = load("res://rune.tscn")

var timer = 0

func _on_timer_timeout():
	for i in range(3):
		var c = creep.instantiate()
		c.position = $spawn_point.global_position + Vector3(randf_range(-50,50),0,randf_range(-50,50))
		add_sibling(c)
	for i in range(randi()%2):
		var c = laser_bird.instantiate()
		c.position = $spawn_point.global_position + Vector3(randf_range(-50,50),0,randf_range(-50,50))
		add_sibling(c)
	if(randf() < 0.3):
		var c = rune.instantiate()
		c.position = $spawn_point.global_position + Vector3(randf_range(-50,50),0,randf_range(-50,50))
		add_sibling(c)


func _process(delta):
	timer-=delta
	if (timer < 0):
		_on_timer_timeout()
		timer=5

