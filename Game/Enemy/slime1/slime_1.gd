extends CharacterBody2D

const speed = 50
@export var health = 3

func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed*delta)
	if get_parent().get_progress_ratio() == 1:
		queue_free()
		
	if health <= 0:
		print("Tod")
		get_parent().get_parent().queue_free()
