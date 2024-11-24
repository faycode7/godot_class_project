extends CharacterBody2D
var cake_level 
var direction = 1
var speed = 200
var can_move = true
var cake_phase = 0

func _ready():
	set_random_variables()
	set_direction()
	await get_tree().create_timer(0.5).timeout
	$Timer.start()
func set_random_variables():
	cake_level = randi_range(0,2)
	
func _physics_process(delta: float) -> void:
	if can_move:
		velocity.x = speed * direction 
	move_and_slide()

func set_direction():
	for i in get_child_count():
		if i < 3:
			get_child(i).direction = direction * -1
			if direction == 1:
				get_child(i).cake_flip_sprite(true)

	
func _on_timer_timeout() -> void:
	get_child(cake_level).eat_piece()
	cake_phase += 1
