extends Sprite3D

@export var regen_rate = 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if($sv/bar.value <=0):
		get_parent().queue_free()
	$sv/bar.value+=delta*regen_rate

