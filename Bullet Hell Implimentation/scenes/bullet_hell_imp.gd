extends Node2D
@onready var healthbar = $GUI/healthbar
@onready var health_nums = $GUI/Label
@onready var enemy = $enemy_state_machine
@onready var player = $Player_fox
@onready var box: Node2D = $box
var dead = false
var death_scene = "res://Bullet Hell Implimentation/scenes/game_over_screen.tscn"
var list_of_levels = ["res://Bullet Hell Implimentation/enemies/dollop_spawner.tscn"]
 

func _ready():
	start_fight()

func start_fight():
	dead = false
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
	if not dead:
		dead = true
		var death = load(death_scene).instantiate()
		add_child(death)
		$fight_menu.toggle_menu(false)
	
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
	$enemy_state_machine.pulverize_children()
	$box/AnimationPlayer.play("RESET")
	
func next_turn():
	$fight_menu.toggle_menu(false)
	$enemy_state_machine.attack()
	$Player_fox.set_physics_process(true)
	$Player_fox.invincibility = false

	
func end_fight():
	player_turn()
	player.visible = false
	get_tree().paused = false
	win()
	await get_tree().create_timer(1).timeout
	get_tree().call_group("main","end_fight")
	
func close():
	get_tree().call_group("main","end_fight")
	queue_free()
	
func setbox_small():
	$box/AnimationPlayer.play("set_box_small")
	
func setbox_normal():
	$box/AnimationPlayer.play("set_box_normal")
	
func win():
	var coin = randi_range(0,10)
	$ColorRect.show()
	$ColorRect/RichTextLabel.text = "You won.\nYou got " + str(coin)  + "coin(s)"
	Glob.current_money += coin
	
	
