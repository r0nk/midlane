extends Node

func activate(target):
	if($cooldown.time_left>0):
		return
	$cooldown.start()
	$"../../".position=target
