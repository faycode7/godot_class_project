extends Node
var player_health = 10
var max_health = 10
var current_level = 0
var current_enemy_script = ""
var current_room = ""
var room_to_load = ""
var custom_position = Vector2.ZERO
var current_money = 10
var inventory = ["cheese"]
var player_movement = true




var item_descriptions = {
	"bread":"Heals 3 hp",
	"cheese" : "Heals 6 hp",
	"axe" : "Deals extra 20 damage"
} 
