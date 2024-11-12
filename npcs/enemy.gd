extends Area2D
@export var enemy_script = ""
@export var enemy_sprite = ""
func _on_body_entered(body: Node2D) -> void:
	get_tree().call_group("main","spawn_fight")
	print("start fight")
