extends Node2D
@onready var sprite = $Sprite
@onready var script_holder = $Node
var health = 0
var attack_counter = 0
var enemy_variables
@onready var attacks = $attacks
@onready var enemy_animation = $AnimationPlayer

func get_attack_available():
	if script_holder.get_child_count() > 0:
		enemy_variables = script_holder.get_child(0)

func sprite_setter(enemy_sprite):
	sprite.texture =load(enemy_sprite) 

func health_setter(enemy_health):
	health = enemy_health

func attack():
	attack_counter = randi_range(0,enemy_variables.attack_list.size()-1)
	var attack = load(enemy_variables.attack_list[attack_counter]).instantiate()
	attacks.add_child(attack)

func enemy_start():
	get_attack_available()
	sprite_setter(enemy_variables.sprite)
	health_setter(enemy_variables.health)
	set_enemy_animation()
	
	#get_attack_pattern(enemy_variables.attack_list)

func set_enemy_animation():
	enemy_animation.play(enemy_variables.animation)

func load_enemy_script(script):
	var spawned = load(script).instantiate()
	$Node.add_child(spawned)
