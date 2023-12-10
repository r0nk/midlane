extends CharacterBody3D

func _input(event):
	var bri = $"../Camera3D".get_bedrock_intersection_position()
	if Input.is_action_just_pressed('move'):
		$pathfinding.destination=bri
	if Input.is_action_just_pressed('skill_one'):
		$skills/explosion.activate(bri)
