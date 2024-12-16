extends Area2D
@export var door_path = ""
@export var custom_spawn_pos = Vector2.ZERO 

func _on_body_entered(body: Node2D) -> void:
	load_room()

func load_room():
	Glob.room_to_load = door_path
	Glob.custom_position = custom_spawn_pos
	get_tree().call_group("main","load_room")
