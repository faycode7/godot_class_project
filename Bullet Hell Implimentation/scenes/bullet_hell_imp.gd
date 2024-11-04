extends Node2D
@onready var healthbar = $GUI/healthbar
@onready var health_nums = $GUI/Label
@onready var enemy = $enemy_state_machine
@onready var player = $Player_fox
var death_scene = "res://Bullet Hell Implimentation/scenes/game_over_screen.tscn"
var list_of_levels = ["res://Bullet Hell Implimentation/enemies/dollop_spawner.tscn"]

func _ready():
	update_hp()
	player_turn()
	healthbar.max_value = Glob.max_health

func update_hp():
	healthbar.value = Glob.player_health
	health_nums.text = str(Glob.player_health) + "/" + str(Glob.max_health)

func spawn_death():
	var death = load(death_scene).instantiate()
	add_child(death)
	
#func start_fight():
	#if (enemy.get_child_count()>0):
		#enemy.get_child(0).queue_free()
	#var level = load(list_of_levels[Glob.current_level]).instantiate()
	#enemy.add_child(level)
func setPosition(setPos):
	player.position = setPos 

func apply_damage(damage):
	enemy.health -= damage
func player_turn():
	$fight_menu.toggle_menu(true)
	$Player_fox.set_physics_process(false)
	$Player_fox.position = Vector2(0,91)
	
func next_turn():
	$fight_menu.toggle_menu(false)
	$enemy_state_machine.attack()
	$Player_fox.set_physics_process(true)
	await get_tree().create_timer(5).timeout
	#TODO instead of timer, wait for final signal flag for enemy attack
	player_turn()
	
	
	
