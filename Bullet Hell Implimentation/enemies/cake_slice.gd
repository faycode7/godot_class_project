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
	
func cake_flip_sprite(flag):
	$Sprite2D.flip_h = flag
	
