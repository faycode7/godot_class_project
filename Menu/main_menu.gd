extends Control

var button_number = 0

func _ready() -> void:
		select_button()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("down"):
		button_number += 1
		if (button_number > 2): button_number = 0
	if Input.is_action_just_pressed("up"):
		button_number -= 1
		if (button_number < 0): button_number = 2
	if Input.is_action_just_pressed("input"):selection()
	select_button()

func select_button():
	for i in $selected_buttons.get_child_count():
		if i != button_number: $selected_buttons.get_child(i).hide()
		if i == button_number: $selected_buttons.get_child(i).show()

func selection():
	if button_number == 0 : get_tree().change_scene_to_file("res://main_scene.tscn")
	if button_number == 1 : print("credits")
	if button_number == 2 : get_tree().quit()
