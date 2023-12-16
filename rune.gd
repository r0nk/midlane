extends "res://coin.gd"

@export var resource: RuneResource

func _ready():
	$model.material.albedo_color = resource.color
	$light.light_color = resource.color

func collect(by):
	by.get_node("health/sv/bar").value+=20
	by.get_node("stats").add_effect(resource.effect)
