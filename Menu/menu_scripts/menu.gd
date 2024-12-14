extends Control
@onready var options: Button = $MarginContainer/VBoxContainer/Options as Button

func _ready():
	#To be able to navigate the menu with the arrow keys, we set the Play button as having the default focus when opening the game
	$MarginContainer/VBoxContainer/Play.grab_focus()
	#need to make it so that mouse and button up,down have the same graphics


func _on_play_pressed() -> void:
	print("Playing!")
	get_tree().change_scene_to_file("res://main_scene.tscn")

func _on_controls_pressed() -> void:
	print("Getting controls")
	get_tree().change_scene_to_file("res://Menu/menu_scenes/controls.tscn")

func _on_options_pressed() -> void:
	print("Options")
	get_tree().change_scene_to_file("res://Menu/menu_scenes/options_menu.tscn")

func _on_credits_pressed() -> void:
	print("Getting credits")
	get_tree().change_scene_to_file("res://Menu/menu_scenes/credits.tscn")

func _on_exit_pressed() -> void:
	print("Exiting...")
	get_tree().quit()
