extends Area2D
@export var enemy_script = ""
@export var enemy_sprite = ""
func _on_body_entered(body: Node2D) -> void:
	Glob.current_enemy_script = enemy_script
	get_tree().call_group("main","spawn_fight")
	print("start fight")
func selected():
	pass
func _ready():
	$Sprite2D.texture = load(enemy_sprite)
	
