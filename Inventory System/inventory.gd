extends Node

@onready var item = $item
@onready var weapon = $weapon
var max_quantity = $item.max_quantity
var stackable = $item.stackable
var quantity = $item.quantity
var item_type = $item.item_type
var owned = $weapon.owned

const MAX_SPACE: int = 7
var available_space: int = MAX_SPACE
var inventory: Array

func get_item(item):	
		if item.item_type == "weapon":
			if weapon.owned:
				print("You already have this weapon!")
		
		if item.item_type == "food":
			if item in inventory and item.quantity < max_quantity:
					quantity +=1
			else:
					if available_space > 0:
						available_space -= 1
						inventory.append(item)
						quantity = 1	
			
			
func release_item(item):
	if item.item_type == "food":
		if quantity > 1:
			quantity -= 1
		elif quantity == 1:
			quantity = 0
			queue_free()
	
			
	
