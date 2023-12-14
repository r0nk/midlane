extends "res://coin.gd"

func collect(by):
	by.get_node("health/sv/bar").value+=20
