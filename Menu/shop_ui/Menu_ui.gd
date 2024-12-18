extends Control
var up_or_down  = 0
var shop_items = [["Sword", 5 , "+ 5 damage"], ["Cheese", 2, "+5 health"]]
func _unhandled_input(event: InputEvent) -> void:
	get_viewport().set_input_as_handled() #turn off player controler
	if up_or_down > shop_items.size():
		up_or_down -= 1
	if up_or_down  < 0:
		up_or_down +=1
	if Input.is_action_just_released("up"):
		up_or_down -= 1
	elif Input.is_action_just_pressed("down"):
		up_or_down += 1
func _ready() -> void:
	for i in shop_items.size():
		$ColorRect/RichTextLabel.add_text(shop_items[i][0]+ "\n")
		print (shop_items[i][0])
