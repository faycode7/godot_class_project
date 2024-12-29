extends Node2D
var count = 0

func _on_timer_timeout() -> void:
	var spawned = load("res://Bullet Hell Implimentation/attack_patterns/droplet.tscn").instantiate()
	spawned.global_position = Vector2 (position.x, randi_range(37,138))
	spawned.rot_degrees = 180
	add_child(spawned)
	count += 1
	if count >= 25:
		get_tree().call_group("bullet_hell_controller","player_turn")
		
	
