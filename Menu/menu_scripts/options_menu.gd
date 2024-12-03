extends Control

func _on_back_pressed() -> void:
	print("Back to main menu")
	get_tree().change_scene_to_file("res://Menu//menu_scenes/menu.tscn")

func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value/5)
	
func _on_mute_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0,toggled_on)

func _on_resolution_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920, 1080))
		1:
			DisplayServer.window_set_size(Vector2i(1600, 900))
		2:
			DisplayServer.window_set_size(Vector2i(1280, 720))
		3:
			DisplayServer.window_set_size(Vector2i(640, 360))	

#need to make un-fullscreen work!
func _on_fullscreen_toggled(toggled_on: bool) -> void:
	#if button_pressed() == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	#else:
		#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
