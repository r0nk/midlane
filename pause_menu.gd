extends ColorRect

func toggle_pause_menu():
	visible=!visible
	get_tree().paused=visible

func _input(_event):
	if Input.is_action_just_pressed('toggle_pause'):
		toggle_pause_menu()

func set_master(changed):
	var volume=-18+($master_slider.value/5)
	AudioServer.set_bus_volume_db(0,volume)
	AudioServer.set_bus_mute(0,($master_slider.value<2))

func set_music(changed):
	var volume=-18+($music_slider.value/5)
	AudioServer.set_bus_volume_db(1,volume)
	AudioServer.set_bus_mute(1,($music_slider.value<2))
