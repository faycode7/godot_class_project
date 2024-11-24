extends Node2D
var speed = 200
var direction = 1
var counter = 0

func _ready():
	set_direction()

func set_direction():
	var rander = randi_range(0,1)
	if rander == 0:
		direction = -1
	elif rander == 1:
		direction = 1

func spawn_cake_towers():
	var cake = load("res://Bullet Hell Implimentation/enemies/cake_tower.tscn").instantiate()
	cake.direction = direction
	cake.speed = speed
	add_child(cake)
	cake.global_position=Vector2(-400 * direction,position.y)


func _on_timer_timeout() -> void:
	if counter > 5:
		$Timer.stop()
		get_tree().call_group("bullet_hell_controller","player_turn")
		queue_free()
	spawn_cake_towers()
	counter += 1 
