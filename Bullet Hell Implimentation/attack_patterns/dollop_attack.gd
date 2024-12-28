extends CharacterBody2D
var speed = 50
var hasPopped = false
var time_to_go_up = false


func _ready():
	pass
func _physics_process(_delta: float) -> void:
	if not isOnFloor():
		velocity.y += speed 
	if isOnFloor() and not hasPopped:
		hasPopped = true
		velocity = Vector2(0,0)
		squish_down()
		pop()
		has_popped()
	if time_to_go_up == true:
		velocity.y += speed
	move_and_slide()
func isOnFloor():
	return $RayCast2D.is_colliding()
func pop():
	pass
func squish_down():
	squish()
	squish2()
	unsquish()
func squish_up():
	unsquish()
	squish2()
	squish()
func squish():
	var tween = create_tween()
	tween.tween_property($Sprite2D,"scale",Vector2(1.3,0.7),0.1)
	await tween.finished	
func squish2():
	var tween = create_tween()
	tween.tween_property($Sprite2D,"scale",Vector2(0.9, 1.2),0.3)
	await tween.finished
func unsquish():
	var tween = create_tween()
	tween.tween_property($Sprite2D,"scale",Vector2(1,1),0.3)

func has_popped():
	if hasPopped == true:
		await get_tree().create_timer(1).timeout
		time_to_go_up = true
		spawn_droplet(+30)
		#spawn_droplet(+10)
		spawn_droplet(-10)
		#spawn_droplet(-30)
		spawn_droplet(-50)
		#spawn_droplet(-70)
		spawn_droplet(-90)
		#spawn_droplet(-110)
		spawn_droplet(-130)
		#spawn_droplet(-150)
		spawn_droplet(-170)
		#spawn_droplet(-190)
		spawn_droplet(-210)
		
		#spawn_droplet(-190)
		#spawn_droplet(-230)
		#spawn_droplet(-250)
		#spawn_droplet(-270)
		#spawn_droplet(-290)
		squish_up()

func spawn_droplet(turn):
	var droplet = load("res://Bullet Hell Implimentation/attack_patterns/droplet.tscn").instantiate()
	droplet.rot_degrees = turn
	droplet.global_position = position
	add_sibling(droplet)
	
	
