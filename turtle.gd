extends CharacterBody3D

@onready var coin = load("res://coin.tscn")

func die():
        drop_loot()

func drop_loot():
        var c = coin.instantiate()
        c.position = global_position
        get_tree().get_root().get_node("main").add_child.call_deferred(c)

func _process(delta):
        $pathfinding.destination=$"../unit".position
        if(position.distance_to($pathfinding.destination)<2):
                $"../unit/health".hurt(10)
                position-=($pathfinding.destination-position)*0.5

