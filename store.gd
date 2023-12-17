extends ColorRect

func toggle_store():
	visible=!visible
	get_tree().paused=visible

func _input(_event):
	if Input.is_action_just_pressed('toggle_store'):
		toggle_store()

