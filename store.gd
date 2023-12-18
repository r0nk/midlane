extends ColorRect

func _ready():
	visible=false

func refresh_all():
	$item1.randomize_item()
	$item2.randomize_item()
	$item3.randomize_item()

func toggle_store():
	visible=!visible
	get_tree().paused=visible

func _input(_event):
	if Input.is_action_just_pressed('toggle_store'):
		toggle_store()

