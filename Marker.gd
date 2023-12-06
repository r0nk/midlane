extends Sprite2D

var max_at = 0.5
var alpha_timer = max_at

func set_pos(pos):
	position=pos
	alpha_timer=max_at

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible and alpha_timer > 0:
		alpha_timer-=delta
		modulate.a=alpha_timer/max_at

