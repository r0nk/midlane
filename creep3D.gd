extends CharacterBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$pathfinding.destination=$"../unit".position
	if(position.distance_to($pathfinding.destination)<2):
		$"../unit/health/sv/bar".value-=10
		queue_free()

