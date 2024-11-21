extends Node2D

@onready var player = $fox_girl
const MAX_HEALTH = 150
const INITIAL_ATTACK = 10
var health = $fox_girl.health
var attack = $fox_girl.attack
var item_type: String #weapon or food
var quantity: int 
var weapon_type: String
var power: int
const MAX_QUANTITY = 1

func give_power(weapon_type):
	if weapon_type == "axe":
		power = 5
	elif weapon_type == "longsword":
		power = 10


func equip(weapon_type):
	give_power(weapon_type)
	if quantity == 0:
		print("Weapon not available!")
	else:
		attack = INITIAL_ATTACK + power 
		#using initial_attack also ensures that the player can change equipped weapons without
		#mixing up the attack
		
		
func unequip():
	attack = INITIAL_ATTACK
