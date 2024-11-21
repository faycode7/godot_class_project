extends Node2D

@onready var player = $fox_girl
const MAX_HEALTH = 150
var health = $fox_girl.health

var item_type: String #weapon or food
var quantity: int 
var food_type: String
var energy: int
const MAX_QUANTITY = 10

func give_energy(food_type):
	if food_type == "bread":
		energy = 30
	elif food_type == "cheese":
		energy = 50
	elif food_type == "wine":
		energy = 100

func eat(food_type):
	give_energy(food_type)
	if quantity == 0:
		print("Food not available!")
	else:
		var temp_health = health + energy
		if temp_health > MAX_HEALTH:
			health = MAX_HEALTH
		else:
			health = temp_health
		
		quantity -= 1
