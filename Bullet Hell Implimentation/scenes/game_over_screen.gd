extends Node2D
var selected = 1

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("up"):
		selected = 1
		move_sprite(25)
	elif Input.is_action_just_pressed("down"):
		selected = 2
		move_sprite(85)
	elif Input.is_action_just_pressed("interact"):
		if selected == 1:
			try_again()
func move_sprite(pos):
	$Control.position.y = pos
func try_again():
	get_parent().start_fight()
	Glob.player_health = Glob.max_health
	get_parent().update_hp()
	get_parent().player.position = Vector2[0.91]
	self.queue_free()
	
	
	
