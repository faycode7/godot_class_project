extends Node2D
var direction = 1

func _ready():
	get_tree().call_group("bullet_hell_controller","setbox_small")

func _on_timer_timeout() -> void:
	spoon_spawner(1)
	spoon_spawner(-1)
	
func spoon_spawner(dir):
	var spoon = load("res://Bullet Hell Implimentation/attack_patterns/middle_spoon.tscn").instantiate()
	spoon.direction = dir
	spoon.global_position = Vector2((30 * dir) ,300 * dir)
	add_child(spoon)

func _on_timer_2_timeout() -> void:
	get_tree().call_group("bullet_hell_controller","player_turn")
	get_tree().call_group("bullet_hell_controller","setbox_normal")
	self.queue_free()
