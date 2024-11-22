extends Node

@onready var player = $fox_girl
@onready var item = $item
var money = player.money

func buy(item):
	if money >= item.price:
		$inventory.get_item(item)
	else:
		print("Not enough money!")
		
func sell(item):
	$inventory.release_item(item)
