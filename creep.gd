extends CharacterBody2D

var health = 550
var speed = 325

var attack_range = 100
var attack_timer = 0

var damage = 50
var bounty = 45

func actual_speed():
	return speed/4

func attack(target):
	target.health-=damage
	attack_timer=0

func body_entered_acquisition(_body):
	$acquisition.process_targeting()

func _on_acquisition_body_exited(body):
	if body == $acquisition.target:
		$acquisition.process_targeting()

func _process(delta):
	$healthbar.value=100*health/550
	if health <=0:
		queue_free()

	if($acquisition.get("target")==null):
		$acquisition.process_targeting()
	else:
		if position.distance_to($acquisition.target.position) > attack_range:
			attack_timer=0
			velocity = ($acquisition.target.position-position).normalized() * actual_speed()
			move_and_slide()
		else:
			attack_timer+=delta
			if(attack_timer > 1):
				attack($acquisition.target)
