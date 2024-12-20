extends CharacterBody2D

const speed = 100
var current_dir = "down"
var direction = Vector2(0,0)
var health: int
var attack
var money: int
@onready var animation = $Sprite2D/AnimationPlayer
@onready var sprite = $Sprite2D
@onready var camera = $Camera2D
var interactables = []

func _unhandled_input(event):
	direction = Input.get_vector("left","right","up","down")
	animation_director()
	if Input.is_action_just_pressed("input") and interactables and Glob.player_movement:
		interactables[0].selected()
func _physics_process(_delta):
	if Glob.player_movement:
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

func _on_interaction_area_area_entered(area: Area2D) -> void:
	interactables.append(area)


func _on_interaction_area_area_exited(area: Area2D) -> void:
	interactables.erase(area)
