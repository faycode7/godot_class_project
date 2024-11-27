extends CharacterBody2D
var current_dir = "left"
var speed = 180
var direction = 1

func _ready() -> void:
	rotate_spoon()
	
func _physics_process(delta: float) -> void:
	velocity.y = -speed * direction 
	move_and_slide()

func rotate_spoon():
	rotation_degrees = -90 * direction
