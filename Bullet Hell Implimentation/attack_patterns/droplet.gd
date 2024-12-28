extends Area2D
var rot_degrees = 30
var speed = 100

func _ready():
	self.rotation_degrees = rot_degrees
func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta
