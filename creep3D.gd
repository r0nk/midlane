extends CharacterBody3D


@onready var coin = load("res://coin.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func drop_loot():
	var c = coin.instantiate()
	c.global_position = global_position
	get_tree().get_root().get_node("main").add_child.call_deferred(c)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$pathfinding.destination=$"../unit".position
	if(position.distance_to($pathfinding.destination)<2):
		$"../unit/health/sv/bar".value-=10
		position-=($pathfinding.destination-position)*0.5

