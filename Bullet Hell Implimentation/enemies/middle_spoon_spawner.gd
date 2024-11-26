extends Node2D
var speed = 200
var direction = 1

func _on_timer_timeout() -> void:
	spoon_spawner(1)
	spoon_spawner(-1)
	
func spoon_spawner(dir):
	var spoon = load("res://Bullet Hell Implimentation/enemies/middle_spoon.tscn").instantiate()
	spoon.direction = dir
	add_child(spoon)
	spoon.global_position=Vector2(20 * dir,20 * dir)
