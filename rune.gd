extends "res://coin.gd"

@export var resource: RuneResource

func _ready():
	if(resource == null):
		resource = ($resource_picker.pick("test"))
	$model.material.albedo_color = resource.color
	$light.light_color = resource.color

func collect(by):
	by.get_node("stats").add_effect(resource.effect)
