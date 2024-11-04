extends Node2D
var selected = 1

func _unhandled_input(event: InputEvent) -> void:
	var dir = Input.get_axis("left","right")
	if selected > 0 or selected < 4:
		selected += dir
	update_select()
	if Input.is_action_just_pressed("input"):
		select_input()

func select_input():
	if selected == 1:attack()
	elif selected == 2:item()
	elif selected == 3:flee()

func update_select():
	for i in $Node2D.get_child_count():
		$Node2D.get_child(i).frame = 1
	$Node2D.get_child(selected - 1).frame = 0
	
func attack():
	set_process_input(false)
	var game = load("res://Bullet Hell Implimentation/attack_indicator/attack_indicator.tscn").instantiate()
	add_child (game)
	
func item():
	pass
	
func flee():
	pass
