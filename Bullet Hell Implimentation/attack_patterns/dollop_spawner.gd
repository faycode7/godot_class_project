extends Node2D
var dollop = "res://Bullet Hell Implimentation/attack_patterns/dollop_attack.tscn"

func _ready():
	projectile_spawner(Vector2(-123,-49))
	await get_tree().create_timer(1).timeout
	projectile_spawner(Vector2(0,-49))
	await get_tree().create_timer(1).timeout
	projectile_spawner(Vector2(123,-49))
	await get_tree().create_timer(3).timeout
	get_tree().call_group("bullet_hell_controller","player_turn")

func projectile_spawner(pos):
	var spawned = load(dollop).instantiate()
	spawned.global_position = pos
	add_child(spawned)
