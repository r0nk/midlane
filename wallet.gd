extends Node2D

var cash = 0

var passive = 90.0/60.0

func _process(delta):
	cash+=passive*delta
