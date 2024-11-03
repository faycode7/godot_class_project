extends Area2D

var interaction = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	print(interaction)
	if interaction== true and Input.is_action_pressed("interact"):
		print("interacting")
