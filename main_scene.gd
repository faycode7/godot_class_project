extends Node2D
@onready var player = $fox_girl #onready for nodes ONLY!!!!!
func spawn_fight():
	player.set_process_unhandled_input(false)
	var spawned = load("res://Bullet Hell Implimentation/scenes/bullet_hell_imp.tscn").instantiate()
	$CanvasLayer.call_deferred("add_child",spawned)
	print("has spawned")
	player.PhysicsServer2D.set_active(false)
	
