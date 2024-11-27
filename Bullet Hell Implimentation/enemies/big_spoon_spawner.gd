extends Node2D

func _ready():
	spoon_spawner()
func spoon_spawner():
	var big_spoon = load("res://Bullet Hell Implimentation/enemies/big_spoon.tscn").instantiate()
	add_child(big_spoon)
	big_spoon.global_position=Vector2(30,150)

func _on_timer_timeout() -> void:
	get_tree().call_group("bullet_hell_controller","player_turn")
	self.queue_free()
