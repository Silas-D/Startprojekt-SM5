extends Node2D


@onready var pause_menu = $pauseMenu
var paused = false



func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		pauseMenu();
		
func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale =1
	else:
		pause_menu.show()
		Engine.time_scale = 0
		
	paused = !paused



func _on_button_pressed():
	pass


