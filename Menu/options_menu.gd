extends Control

func _on_back_pressed() -> void:
	print("Back to main menu")
	get_tree().change_scene_to_file("res://Menu/menu.tscn")
