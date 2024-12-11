extends Area2D
@export var door_path = ""

func _on_body_entered(body: Node2D) -> void:
	load_room()

func load_room():
	Glob.room_to_load = door_path
	get_tree().call_group("main","load_room")
