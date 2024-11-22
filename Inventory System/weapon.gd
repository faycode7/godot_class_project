extends Item

@onready var player = $fox_girl
const MAX_HEALTH = 150
const INITIAL_ATTACK = 10
var owned: bool 
var health = player.health
var attack = player.attack
var weapon_type: String
var power: int

func _ready() -> void:
	stackable = false
	item_type = "weapon"
	quantity
	max_quantity = 1
	price

func give_power(weapon_type):
	if weapon_type == "axe":
		power = 5
	elif weapon_type == "longsword":
		power = 10
		
func set_price(weapon_type):
	if weapon_type == "axe":
		price = 50
	elif weapon_type == "longsword":
		price = 100


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
