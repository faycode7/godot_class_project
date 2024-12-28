extends Node2D
@export var Camera_limits = Vector4(1000,-1000,1000,-1000)
@export var Spawn_position = Vector2(0,0)

func _ready() -> void:
	$"../..".set_player_pos(Spawn_position)
	Glob.current_room = self.name 
