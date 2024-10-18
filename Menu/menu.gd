extends Control
@onready var options: Button = $MarginContainer/VBoxContainer/Options as Button

func _on_play_pressed() -> void:
	print("Playing!")
	get_tree().change_scene_to_file("res://game.tscn")


func _on_controls_pressed() -> void:
	print("Getting controls")
	pass # Replace with function body.

func _on_options_pressed() -> void:
	print("Options")
	get_tree().change_scene_to_file("res://Menu/options_menu.tscn")

func _on_credits_pressed() -> void:
	print("Getting credits")
	pass # Replace with function body.

func _on_exit_pressed() -> void:
	print("Exiting...")
	get_tree().quit()
