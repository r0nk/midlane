extends Label3D

func _ready():
	global_scale(Vector3(10,10,10))

var timer=1

var fade_cutoff=0.7

func _process(delta):
	timer-=delta
	position.y+=delta
	if(timer<fade_cutoff):
		modulate.a=timer*(1/fade_cutoff)
		outline_modulate.a=timer*(1/fade_cutoff)
	if(timer<0):
		queue_free()

