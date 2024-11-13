extends CharacterBody2D
var speed = 200
var invincibility = false
@onready var main = $".."

func _ready():
	print(main)
	
func  _physics_process(_delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = speed * direction
	move_and_slide()
	
func damage():
	if invincibility == false:
		print ("hurt")
		$Timer.start()
		invincibility = true
		Glob.player_health -= 1
		main.update_hp()
	if Glob.player_health <= 0 :
		main.spawn_death()
func _on_area_2d_body_entered(_body: Node2D) -> void:
	damage()
	
func _on_timer_timeout() -> void:
	invincibility = false


func _on_area_2d_area_entered(_area: Area2D) -> void:
	damage()
