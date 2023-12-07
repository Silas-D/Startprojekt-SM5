extends CharacterBody2D

const speed = 200 

@export
var health = 10

func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed*delta)
	if get_parent().get_progress_ratio() == 1:
		get_tree().change_scene_to_file("res://Game/main_menu.tscn")
		#Hier Game Over einfügen
	
	if health <= 0:
		get_parent().get_parent().queue_free()
