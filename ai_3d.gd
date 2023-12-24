extends AIController3D

func pain(damage):
	reward-=damage

func get_obs() -> Dictionary:
	var pos = get_parent().position

	#TODO enemy position and health

	#Important to convert to local frame of reference
#	var ball_pos = to_local(_player.ball.global_position)
	var obs = [pos.x, pos.z]

	for eye in $eyes.get_children():
		obs.append(eye.is_colliding())

	return {"obs":obs}

func get_reward() -> float:
	var ret=reward
#	if(ret!=0):
#		print("reward:",ret);
	reward=0
	return ret

func get_action_space() -> Dictionary:
	return {
		"move_action" : {
			"size": 2,
			"action_type": "continuous"
		},
		}

func set_action(action) -> void:
	var x = clamp(action["move_action"][0], -1.0, 1.0)
	var y = clamp(action["move_action"][1], -1.0, 1.0)
	$"../pathfinding".destination=(position+Vector3(x,0,y))
