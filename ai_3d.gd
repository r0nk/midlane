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

	#costs,
	var store = get_tree().get_root().get_node("main/Camera3D/hud/store")
	obs.append(store.get_node("item1").cost)
	obs.append(store.get_node("item2").cost)
	obs.append(store.get_node("item3").cost)
	#our current money,
	obs.append($"../collector".cash)
	# if we can afford each item
	obs.append(($"../collector".cash>store.get_node("item1").cost))
	obs.append(($"../collector".cash>store.get_node("item2").cost))
	obs.append(($"../collector".cash>store.get_node("item3").cost))

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
		"cast_action" : {
			"size": 2,
			"action_type": "continuous"
			},
		"buy_one": {
			"size": 2,
			"action_type": "discrete"
			},
		"buy_two": {
			"size": 2,
			"action_type": "discrete"
			},
		"buy_three": {
			"size": 2,
			"action_type": "discrete"
			},
		"cast_q" : {
			"size": 2,
			"action_type": "discrete"
			},
		"cast_w" : {
			"size": 2,
			"action_type": "discrete"
			},
		"cast_e" : {
			"size": 2,
			"action_type": "discrete"
			},
		"cast_r" : {
			"size": 2,
			"action_type": "discrete"
			},
		}

func set_action(action) -> void:
	var x = clamp(action["move_action"][0], -1.0, 1.0)
	var y = clamp(action["move_action"][1], -1.0, 1.0)
	$"../pathfinding".destination=(position+Vector3(x,0,y))

	x = clamp(action["cast_action"][0], -1.0, 1.0)
	y = clamp(action["cast_action"][1], -1.0, 1.0)
	var target = position+Vector3(x,0,y)
#	if(action["cast_q"]):
#		q_spell.activate(target)
#	TODO finish up spell bindings for this.
	$"../pathfinding".destination=(position+Vector3(x,0,y))
	#TODO buy things, or punish if we cant afford
	var store = get_tree().get_root().get_node("main/Camera3D/hud/store")
	if(action["buy_one"]):
		store.get_node("item1").pressed()
	if(action["buy_two"]):
		store.get_node("item2").pressed()
	if(action["buy_three"]):
		store.get_node("item3").pressed()

