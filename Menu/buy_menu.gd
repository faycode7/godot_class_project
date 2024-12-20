extends CanvasLayer
var price = 1
var item = "bread"
var is_selected = false

func _ready() -> void:
	$Control/RichTextLabel.text =("[center]Buy " + item  + " for " + str(price) + "G [/center]\n" + "[center]" + Glob.item_descriptions[item] + "[/center]")
	Glob.player_movement = false
	
func close():
	await get_tree().create_timer(0.2).timeout
	Glob.player_movement = true

	self.queue_free()
	
func _unhandled_input(event: InputEvent) -> void:
	get_viewport().set_input_as_handled()
	if Input.is_action_just_pressed("left"):
		$Control/no.text = "[color=white]NO[/color]"
		$Control/yes.text = "[color=yellow]YES[/color]"
		is_selected = true
		
	elif Input.is_action_just_pressed("right"):
		$Control/no.text = "[color=yellow]NO[/color]"
		$Control/yes.text = "[color=white]YES[/color]"
		is_selected = false
		
	if Input.is_action_just_pressed("input"):
		if is_selected:
			if (Glob.current_money < price):
				$Control/RichTextLabel.text = ("[center]Not enough money[/center]")
				self.close()
			else:
				get_parent().is_bought()
				Glob.current_money -= price
				$Control/RichTextLabel.text = "[center]You just bought " + item + "[/center]"
				print (Glob.inventory)
				print (Glob.current_money)
				self.close()
		else:
			self.close()
		
