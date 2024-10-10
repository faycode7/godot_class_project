extends CharacterBody2D

const speed = 100
var current_dir = "down"
var direction = Vector2(0,0)
@onready var animation = $Sprite2D/AnimationPlayer
@onready var sprite = $Sprite2D

func _unhandled_input(event):
	direction = Input.get_vector("left","right","up","down")
	animation_director()

func _physics_process(_delta):
	apply_movement_velocity()
	move_and_slide()#required for physics process, otherwise physics won't work
	
func apply_movement_velocity():
	velocity = direction * speed
	
func animation_director():
	var movetype = "idle_" if direction == Vector2(0,0) else "walk_"
	if direction!= Vector2(0,0):
		if direction.x!=0 && direction.y == 0:
			current_dir = "right"
			if direction.x < 0:
				sprite.flip_h = true
			else: 
				sprite.flip_h = false
				
		elif direction.y !=0:
			current_dir = "up" if direction.y < 0 else "down"
	animation.play(movetype + current_dir)
				
