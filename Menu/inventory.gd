extends Control
@onready var inventory_list: RichTextLabel = $RichTextLabel
@onready var item_description: RichTextLabel = $RichTextLabel2
var selected = 0 

func list_inventory():
	for i in Glob.inventory.size():
		inventory_list.add_text(Glob.inventory[i] + " \n")

func display_description():
	item_description.text = Glob.item_descriptions[Glob.inventory[selected]]

func _ready() -> void:
	list_inventory()
	display_description()
