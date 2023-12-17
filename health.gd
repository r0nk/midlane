extends Sprite3D

@export var regen_rate = 10


var dmgn = load("res://dmg_number.tscn")

func hurt(damage):
	var instance = dmgn.instantiate()
	instance.text=str(damage)
	instance.global_position=global_position
	get_tree().get_root().get_node("main").add_child(instance)
	$sv/bar.value-=damage

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if($sv/bar.value <=0):
		get_parent().queue_free()
	$sv/bar.value+=delta*regen_rate

