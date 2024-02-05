extends Node

func _process(delta):
	$"../../shield".visible = ($"../../health".shield>0)

func activate(_target):
	if($cooldown.time_left>0):
		return
	$cooldown.start()
	$sfx.play()
	$"../../health".shield+=1
