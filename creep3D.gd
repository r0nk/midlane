extends CharacterBody3D


@onready var coin = load("res://coin.tscn")

func drop_loot():
	var c = coin.instantiate()
	c.position = global_position
	get_tree().get_root().get_node("main").add_child.call_deferred(c)

func _process(delta):
	$pathfinding.destination=$"../unit".position
	if(position.distance_to($pathfinding.destination)<2):
		$"../unit/health/sv/bar".value-=10
		position-=($pathfinding.destination-position)*0.5
	if(!$human/AnimationPlayer.is_playing()):
		$human/AnimationPlayer.play("1ArmatureAction")

