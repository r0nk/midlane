extends Node

@onready var tongue = load("res://skills/tongue.tscn")

func activate(target):
#       spawn explosion
        if($cooldown.time_left>0):
                return
        $cooldown.start()
        var e = tongue.instantiate()
        e.position=target
        get_tree().get_root().get_node("main").add_child(e)


