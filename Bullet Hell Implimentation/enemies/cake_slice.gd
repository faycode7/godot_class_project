extends CharacterBody2D
var current_dir = "left"
@export var cake_value = 2
var eaten_value = 0
var sprite_list = ["res://Art/Assets/cake_top.png","res://Art/Assets/cake_middle.png","res://Art/Assets/cake_bottom.png"]
var position_list = []
var size_list = [Vector2(76,36),Vector2(114,36),Vector2(148,36)]
var mod_list = [20,34,36]
var direction = 1
var position_x = size_list[cake_value].x + mod_list[cake_value] * eaten_value

func _ready():
	$Sprite2D.texture =load(sprite_list[cake_value])
	$CollisionShape2D.shape.size = size_list[cake_value]
	if cake_value != 0: $CollisionShape2D2.disabled = true
	
func eat_piece():
	var mod =  mod_list[cake_value] 
	eaten_value += 1
	if eaten_value > 2: $CollisionShape2D2.disabled = true
	if (eaten_value >=4):
		$".".hide()
		$CollisionShape2D.disabled = true
	if eaten_value <4:
		$Sprite2D.frame = eaten_value
		$CollisionShape2D.shape.size.x = size_list[cake_value].x - mod * eaten_value
		$CollisionShape2D.position.x += mod / 2 * direction
	#if cake_value == 0:
		#cake_top_bullets()
	#elif cake_value == 1:
		#cake_middle_bullets()
	#elif cake_value == 2:
		#cake_bottom_bullets()
	
func cake_flip_sprite(flag):
	$Sprite2D.flip_h = flag
	
func projectile_spawner(pos,rot):
	var spawned = load("res://Bullet Hell Implimentation/enemies/droplet.tscn").instantiate()
	spawned.global_position = pos
	
	spawned.scale = Vector2(0.5,0.5) 
	spawned.speed = 300
	if direction == -1:
		spawned.rot_degrees =  180 - rot 
	else:
		spawned.rot_degrees = rot
	get_parent().add_child(spawned)
	
func cake_top_bullets():
	var pos = Vector2(get_parent().global_position.x - position_x ,global_position.y + 15)
	#projectile_spawner(pos,180)
	#projectile_spawner(pos,170)
	#projectile_spawner(pos,160)
	
func cake_middle_bullets():
	var pos = Vector2(get_parent().global_position.x - position_x ,global_position.y)
	#projectile_spawner(pos,160)
	#projectile_spawner(pos,180)
	#projectile_spawner(pos,200)
	#
func cake_bottom_bullets():
	var pos = Vector2(get_parent().global_position.x - position_x ,global_position.y + 10)
	#projectile_spawner(pos,180)
	#projectile_spawner(pos,190)
	#projectile_spawner(pos,200)
