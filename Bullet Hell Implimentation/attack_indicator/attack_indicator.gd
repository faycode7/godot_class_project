extends Node2D
var attack_value = 0.0
var attack_modifier = 1
var max_attack = 2
@onready var line = $line
var damage_text = "res://Bullet Hell Implimentation/attack_indicator/damage_number_popup.tscn"

func move_line():
	line.position.x += 15
	if line.position.x <0: attack_value += attack_modifier
	if line.position.x>0: attack_value -= attack_modifier
	 
	print (attack_value)
	if line.position.x >= 179:
		line.hide()
		$Timer.stop()
		spawn_damage_number("miss")
		end_turn()

func _on_timer_timeout() -> void:
	move_line()
	
func _unhandled_input(event: InputEvent) -> void:
	get_viewport().set_input_as_handled()
	if Input.is_action_just_pressed("input"):
		$Timer.stop()
		if attack_value == 11: attack_value += 5
		attack_value *= 5
		get_parent().get_parent().apply_damage(attack_value + Glob.player_attack)
		print(attack_value)
		await get_tree().create_timer(0.5).timeout
		spawn_damage_number(attack_value)
		end_turn()

func end_turn():
	get_parent().finished_turn()
	queue_free()
	
func spawn_damage_number(string):
	var spawned = load(damage_text).instantiate()
	spawned.position = Vector2(0,0)
	spawned.text = str(string)
	get_parent().get_parent().add_child(spawned)
	print(spawned.position, spawned.text)
