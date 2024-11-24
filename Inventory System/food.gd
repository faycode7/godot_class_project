extends Item
@onready var player = $fox_girl
var food_type: String

#gets value from parent Item (item.gd)
func _ready() -> void:
	stackable = true
	item_type = "food"
	quantity
	max_quantity = 9
	price

func give_energy(food_type):
	if food_type == "bread":
		Glob.player_health += 30
	elif food_type == "cheese":
		Glob.player_health += 50
	elif food_type == "wine":
		Glob.player_health += 100

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
		if Glob.player_health > Glob.max_health:
			Glob.player_health = Glob.max_health
		quantity -= 1
		if quantity == 0:
			queue_free()
