extends Area3D

var damage=50
# Called when the node enters the scene tree for the first time.
func _ready():
	$smoke.restart()
	$sparks.restart()
	$sfx.play()

func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		body.get_node("health/sv/bar").value-=damage*delta

func expire():
	queue_free()

