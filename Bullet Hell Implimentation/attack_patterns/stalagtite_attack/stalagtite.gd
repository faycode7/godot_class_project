extends CharacterBody2D
var fallen = false
func _physics_process(delta: float) -> void:
	if fallen: velocity.y = move_toward(velocity.y,+50, 2)
	if is_on_floor():
		await get_tree().create_timer(0.1).timeout
		queue_free()
	move_and_slide()
	
func _ready() -> void:
	await get_tree().create_timer(2).timeout
	fallen = true
	
	
