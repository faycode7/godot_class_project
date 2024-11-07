extends Label

func _ready():
	await $AnimationPlayer.animation_finished
	queue_free()
