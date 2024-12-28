extends Node2D
var count = 1


func drop_stal():
	var spawn = load("res://Bullet Hell Implimentation/attack_patterns/stalagtite_attack/stalagtite.tscn").instantiate()
	spawn.global_position = Vector2 ((50 * count) - 200 , position.y - 10)
	count += 1
	add_child(spawn)
	print (spawn.global_position)
	


func _on_timer_timeout() -> void:
	drop_stal()
	if count > 7: 
		$Timer.stop()
		await get_tree().create_timer(5).timeout
		get_tree().call_group("bullet_hell_controller","player_turn")
	
