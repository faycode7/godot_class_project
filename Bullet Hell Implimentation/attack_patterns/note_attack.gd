extends Node2D
var count = 0

func _ready():
	get_tree().call_group("bullet_hell_controller","setbox_small")

func _on_timer_timeout() -> void:
	var spawned = load("res://Bullet Hell Implimentation/attack_patterns/droplet.tscn").instantiate()
	spawned.global_position = Vector2 (randi_range(-45,45),- 30 )
	spawned.rot_degrees = 90
	#spawned.sprite =
	add_child(spawned)
	count += 1
	if count >= 25:
		get_tree().call_group("bullet_hell_controller","player_turn")
