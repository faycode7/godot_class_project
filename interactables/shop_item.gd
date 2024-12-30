extends Area2D
@export var item = ""
@export var price = 0
@export var is_one_time = false

func _ready() -> void:
	check_collected_list()
	print (Glob.inventory)
	$Sprite2D.texture = load("res://Art/Assets/" + item + ".png")
	
func is_bought():
	if is_one_time:
		Glob.collected_items.append(item)
		Glob.player_movement = true
		queue_free()
	Glob.inventory.append(item)

func selected():
	var Menu = load("res://Menu/buy_menu.tscn").instantiate()
	Menu.item = item
	Menu.price = price
	call_deferred("add_child" , Menu)

func check_collected_list():
	if Glob.collected_items:
		for i in Glob.collected_items.size():
			if Glob.collected_items[i] == item:
				self.queue_free()
 
