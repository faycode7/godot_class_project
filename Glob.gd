extends Node
var player_health = 10
var max_health = 10
var current_level = 0
var current_enemy_script = ""
var current_room = ""
var room_to_load = ""
var custom_position = Vector2.ZERO
var current_money = 100
var inventory = ["cheese","cheese","cheese","bread","axe"]
var player_movement = true
var player_damage = 5
var max_items = 9
var collected_items = []

var item_descriptions = {
	"bread":"A stale loaf of bread. Heals 3 hp",
	"cheese":"Cheesy. Heals 6 hp",
	"axe":"Sharp. Deals extra 20 damage"
} 

func update_hp(number):
	player_health += number
	if player_health > max_health:
		player_health = max_health
