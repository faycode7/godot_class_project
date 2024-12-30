extends Control
@onready var item_description: RichTextLabel = $RichTextLabel2
@onready var inventory_list = $inventory_list
var selected = 0 
var can_input = true

func _ready() -> void:
	change_select()
	list_inventory()
	display_description()
	update_stats()

func _unhandled_input(event: InputEvent) -> void:
	get_viewport().set_input_as_handled()
	if can_input:
		if Input.is_action_just_pressed("up"):
			selected -= 1
			if selected <=0:
				selected = Glob.inventory.size() - 1
			change_select()
		if Input.is_action_just_pressed("down"):
			selected += 1
			if selected > Glob.inventory.size() - 1:
				selected = 0
			change_select()
		if Input.is_action_just_pressed("input") and Glob.inventory:
			consume(Glob.inventory[selected])
			change_select()
			list_inventory()
			display_description()
			update_stats()
		if Input.is_action_just_pressed("inventory"):
			close_inventory()
			
func list_inventory():
	for i in Glob.inventory.size():
		inventory_list.get_child(i).text = Glob.inventory[i]
		print(Glob.inventory[i])

func display_description():
	if selected < Glob.inventory.size() and selected >=0:
		item_description.text = Glob.item_descriptions[Glob.inventory[selected]]
	elif !Glob.inventory:
		item_description.text = "Your pockets are empty"
func change_select():
	for i in inventory_list.get_child_count():
		inventory_list.get_child(i).modulate = Color(1,1,1)
	inventory_list.get_child(selected).modulate = Color(1,1,0)
	display_description()

func consume(item):
	can_input = false
	
	Glob.inventory.pop_at(selected)
	if selected == Glob.inventory.size():
		selected = Glob.inventory.size() - 1
	inventory_list.get_child(Glob.inventory.size()).text = ""
	if item == "bread":
		Glob.update_hp(3)
	if item == "cheese":
		Glob.update_hp(5)
	if item == "axe":
		Glob.player_damage = 20
	
	
	
	await get_tree().create_timer(0.05).timeout
	can_input = true
	get_tree().call_group("bullet_hell_controller","update_hp")
	

func update_stats():
	$RichTextLabel.text = "HP: " + str(Glob.player_health) + "/" + str(Glob.max_health)  + "\n" + "Gold: " + str(Glob.current_money)

func close_inventory():
	self.queue_free()

	
