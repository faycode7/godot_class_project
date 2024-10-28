extends Node2D
var dollop = "res://Bullet Hell Implimentation/enemies/dollop_attack.tscn"

func _ready():
	projectile_spawner(Vector2(-123,-49))
	await get_tree().create_timer(1).timeout
	projectile_spawner(Vector2(0,-49))
	await get_tree().create_timer(1).timeout
	projectile_spawner(Vector2(123,-49))
func projectile_spawner(pos):
	var spawned = load(dollop).instantiate()
	spawned.global_position = pos
	add_child(spawned)
