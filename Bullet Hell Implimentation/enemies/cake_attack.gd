extends Node2D

var cake_level 
var direction = 1
var speed = 100
var can_move = true
var cake_phase = 0

@onready var cake_tower = $cake_tower 
func _ready():
	set_random_variables()
	set_direction()
	position.x = -400 * direction
		
func _physics_process(delta: float) -> void:
	if can_move:
		cake_tower.velocity.x = speed * direction 
	cake_tower.move_and_slide()
	
func set_random_variables():
	cake_level = randi_range(0,$cake_tower.get_child_count()-1)
	var rander = randi_range(0,1)
	if rander == 0:
		direction = -1
	elif rander == 1:
		direction = 1

func _on_timer_timeout() -> void:
	cake_tower.get_child(cake_level).eat_piece()
	cake_phase += 1
	if cake_phase >=4:
		$Timer.stop()
		await get_tree().create_timer(1).timeout
		get_tree().call_group("bullet_hell_controller","player_turn")

func set_direction():
	for i in cake_tower.get_child_count():
		cake_tower.get_child(i).direction = direction * -1
		if direction == 1:
			cake_tower.get_child(i).cake_flip_sprite(true)

	
