extends StaticBody3D

func _process(delta):
	if $acquisition.target != null:
		$model/turret.look_at($acquisition.target.position)

