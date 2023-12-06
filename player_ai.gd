extends AIController2D

# Stores the action sampled for the agent's policy, running in python
var x_movement : float = 0.0
var y_movement : float = 0.0

func get_obs() -> Dictionary:
	var p = get_parent()
	var obs = [p.position.x,p.position.y]

	#swap these based on which team the player is on.
	#for each node in group "dire"
	#for each node in group "radi"
		#position ,health, type of each unit to obs

	return {"obs":obs}

func get_reward() -> float:
	var old_reward = reward
	reward=0
	return old_reward

func get_action_space() -> Dictionary:
	return {
		"x_movement" : {
			"size": 1,
			"action_type": "continuous"
		},
		"y_movement" : {
			"size": 1,
			"action_type": "continuous"
		},
		}

func set_action(action) -> void:
	x_movement = clamp(action["x_movement"][0], -1.0, 1.0)
	y_movement = clamp(action["y_movement"][0], -1.0, 1.0)
