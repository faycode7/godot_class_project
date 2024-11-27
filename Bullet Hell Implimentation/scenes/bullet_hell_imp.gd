extends Node2D
@onready var healthbar = $GUI/healthbar
@onready var health_nums = $GUI/Label
@onready var enemy = $enemy_state_machine
@onready var player = $Player_fox
@onready var box: Node2D = $box
var death_scene = "res://Bullet Hell Implimentation/scenes/game_over_screen.tscn"
var list_of_levels = ["res://Bullet Hell Implimentation/enemies/dollop_spawner.tscn"]



func _ready():
	start_fight()

func start_fight():
	update_hp()
	player_turn()
	healthbar.max_value = Glob.max_health
	if Glob.current_enemy_script != "":
		enemy.load_enemy_script(Glob.current_enemy_script)
		enemy.enemy_start()
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
	if enemy.health  <= 0 :
		end_fight()
		
func player_turn():
	$fight_menu.toggle_menu(true)
	$Player_fox.set_physics_process(false)
	$Player_fox.position = Vector2(0,91)
	$Player_fox.invincibility = true
	
	
func next_turn():
	$fight_menu.toggle_menu(false)
	$enemy_state_machine.attack()
	$Player_fox.set_physics_process(true)
	$Player_fox.invincibility = false
	
	
func end_fight():
	get_tree().paused = false
	print("You win")
	print ("You get", str(randi_range(0,10)) ,"coins")
	print ("You get", str(randi_range(0,20)) ,"expirience")
	get_tree().call_group("main","end_fight")
	self.queue_free()
	
func close():
	get_parent().get_parent().player.set_process_unhandled_input(true)
	get_parent().get_parent().player.set_physics_process(true)
	queue_free()
	
func setbox_small():
	$box/AnimationPlayer.play("set_box_small")
	
func setbox_normal():
	$box/AnimationPlayer.play("set_box_normal")
