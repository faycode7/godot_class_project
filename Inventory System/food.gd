extends Item


@onready var player = $fox_girl
const MAX_HEALTH = 150
var health = player.health

var food_type: String
var energy: int

//gets value from parent Item (item.gd)
func _ready() -> void:
	stackable = true
	item_type = "food"
	quantity
	max_quantity = 9
	price

func give_energy(food_type):
	if food_type == "bread":
		energy = 30
	elif food_type == "cheese":
		energy = 50
	elif food_type == "wine":
		energy = 100

func set_price(food_type):
	if food_type == "bread":
		price = 5
	elif food_type == "cheese":
		price = 10
	elif food_type == "wine":
		price = 20
	

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
		if quantity == 0:
			queue_free()
			
