extends Node2D
var selected = 1

func _unhandled_input(_event: InputEvent) -> void:
	get_viewport().set_input_as_handled()
	if Input.is_action_just_pressed("up"):
		selected = 1
		move_sprite(25)
	elif Input.is_action_just_pressed("down"):
		selected = 2
		move_sprite(85)
	elif Input.is_action_just_pressed("input"):
		if selected == 1:
			try_again()
		else:
			give_up()
func move_sprite(pos):
	$Control.position.y = pos

func try_again():
	get_parent().start_fight()
	Glob.player_health = Glob.max_health
	get_parent().update_hp()
	get_parent().player.position = Vector2(0,91)
	await get_tree().create_timer(0.1).timeout
	self.queue_free()

func give_up():
	get_tree().quit()
	
	
	
