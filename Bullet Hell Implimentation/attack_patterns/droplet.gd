extends Area2D
var rot_degrees = 30
var speed = 100
var sprite = "res://Art/Assets/droplet.png"

func _ready():
	$Sprite2D.texture = load(sprite)
	self.rotation_degrees = rot_degrees
func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta
