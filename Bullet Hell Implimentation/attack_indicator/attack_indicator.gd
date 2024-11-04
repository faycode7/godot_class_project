extends Node2D
var attack_value = 0.0
var attack_modifier = 1
var max_attack = 2
@onready var line = $line

func move_line():
	line.position.x += 15
	if line.position.x <0: attack_value += attack_modifier
	if line.position.x>0: attack_value -= attack_modifier
	 
	print (attack_value)
	if line.position.x >= 179:
		line.hide()
		$Timer.stop()

func _on_timer_timeout() -> void:
	move_line()
	
func _unhandled_input(event: InputEvent) -> void:
	get_viewport().set_input_as_handled()
	if Input.is_action_just_pressed("input"):
		$Timer.stop()
		if attack_value == 11: attack_value += 5
		$"..".apply_damage(attack_value * 5)
		print(attack_value)
		
