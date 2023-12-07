extends StaticBody3D

func _process(delta):
	$model/turret.look_at($"../unit".position)

