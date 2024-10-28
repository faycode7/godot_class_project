# Bullet.gd
extends Area2D

var speed = 300
var direction = Vector2.ZERO  # The direction in which the bullet will move

func _process(delta):
	# Move the bullet in the specified direction
	position += direction * speed * delta
	# Remove the bullet if it goes off-screen
	if position.x < 0 or position.x > get_viewport_rect().size.x or position.y < 0 or position.y > get_viewport_rect().size.y:
		queue_free()
