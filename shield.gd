extends CSGSphere3D

@onready var bullet = load("res://laser_projectile.tscn")

func _process(delta):
	visible=$"../health".shield>0

func shield_break(damage):
	for v in [Vector3(1,0,0),Vector3(0,0,1),Vector3(-1,0,0),Vector3(0,0,-1)]:
		var b = bullet.instantiate()
		b.position=global_position
		b.direction=v
		b.damage=damage
		get_tree().get_root().get_node("main").add_child(b)


