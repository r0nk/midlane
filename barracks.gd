extends Sprite2D

@onready var creep = load("res://creep.tscn")

var timer = 0

func _on_timer_timeout():
	for i in range(4):
		var c = creep.instantiate()
		c.position = position + Vector2(randf_range(-1,1),randf_range(-1,1))
		add_sibling(c)
		if name == "bad_barracks":
			c.get_node("acquisition").team="bad"
			c.get_node("acquisition").target_name="rad_tower"
			c.get_node("sprite").self_modulate="#FF0000"
		if name == "rad_barracks":
			c.get_node("acquisition").team="rad"
			c.get_node("acquisition").target_name="bad_tower"
			c.get_node("sprite").self_modulate="#00FF00"

func _process(delta):
	timer-=delta
	if (timer < 0):
		_on_timer_timeout()
		timer=30

