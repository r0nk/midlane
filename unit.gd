extends CharacterBody3D

func die():
	%logger.log("DEAD: $"+str($collector.cash)+", Total: $"+str($collector.total_collected))
	get_parent().restart_game()

func _input(_event):
	var bri = $"../Camera3D".get_bedrock_intersection_position()
	if Input.is_action_just_pressed('move'):
		$pathfinding.destination=bri
	if Input.is_action_just_pressed('skill_one'):
		$skills/explosion.activate(bri)
	if Input.is_action_just_pressed('skill_two'):
		$skills/blink.activate(bri)
	if Input.is_action_just_pressed('skill_three'):
		$skills/shield.activate(bri)
