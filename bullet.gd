extends CharacterBody2D

var target
var damage = 50
var cause

func _process(delta):
	if not is_instance_valid(target):
		queue_free()
		return
	look_at(target.position)
	if position.distance_to(target.position) > 20:
		position-=(position-target.position).normalized() * 10
	else:
		target.health-=damage
		if(target.health<=0) and cause and cause.has_node("wallet") and target.bounty:
			cause.get_node("wallet").cash+=target.bounty
			if(cause.has_node("AIController2D")):
				cause.get_node("AIController2D").reward=target.bounty
		queue_free()
