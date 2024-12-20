extends Area2D
@export var item = ""
@export var price = 0

func _ready() -> void:
	print (Glob.inventory)
	$Sprite2D.texture = load("res://Art/Assets/" + item + ".png")
func is_bought():
	Glob.inventory.append(item)

func selected():
	var Menu = load("res://Menu/buy_menu.tscn").instantiate()
	Menu.item = item
	Menu.price = price
	call_deferred("add_child" , Menu)

	
 
