extends Node3D

func player_died(node):
	restart_game()

func restart_game():
	$unit/ai.reset()
	$unit/collector.cash=0
	$unit/acquisition.target=null
	$unit/stats.effects.clear()
	$unit/health/sv/bar.value=1000
	$unit.position=Vector3(0,0,0)
	for collectable in get_tree().get_nodes_in_group("collectable"):
		collectable.queue_free()
	for enemy in get_tree().get_nodes_in_group("enemies"):
		enemy.queue_free()
	for projectile in get_tree().get_nodes_in_group("projectiles"):
		projectile.queue_free()



