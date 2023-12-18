extends CanvasLayer

@onready var main = owner

func _on_weiterspielen_pressed():
	main.pauseMenu()


func _on_verlassen_pressed():
	get_tree().change_scene_to_file("res://Game/UI/mainmenu/main_menu.tscn")

