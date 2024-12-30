extends Node2D
@onready var player = $fox_girl #onready for nodes ONLY!!!!!
func spawn_fight():
	var spawned = load("res://Bullet Hell Implimentation/scenes/bullet_hell_imp.tscn").instantiate()
	$Control.call_deferred("add_child",spawned)
	player.camera.zoom = Vector2(2,2)
	player.set_process_unhandled_input(false)
	player.set_physics_process(false)

func end_fight():
	player.set_process_unhandled_input(true)
	player.set_physics_process(true)
	player.camera.zoom = Vector2(4,4)

func load_room():
	$current_room.get_child(0).queue_free()
	var spawned = load("res://Rooms/" + str(Glob.room_to_load)+ ".tscn").instantiate()
	$current_room.call_deferred("add_child",spawned)

func set_player_pos(pos):
	if Glob.custom_position!= Vector2(0,0):
		$fox_girl.global_position = Glob.custom_position
		Glob.custom_position = Vector2(0,0)
	else:
		$fox_girl.global_position = pos
		
func open_inventory():
	var spawned = load("res://Menu/inventory.tscn").instantiate()
	$GUI.add_child(spawned)
	player.set_physics_process(false)
	player.velocity = Vector2(0,0)
	await get_tree().create_timer(0.1).timeout
	player.set_physics_process(true)
	
