extends Sprite2D

var dialog = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("input"):
		if dialog == null:
			print("talking")
			dialog = load("res://Dialog/LadyDialog.tscn").instantiate()
			get_parent().add_child(dialog)
		#hiding dialogue scene when pressing space again
		else:
			dialog.queue_free()
			dialog = null
			
