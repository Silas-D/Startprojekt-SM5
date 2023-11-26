extends Control

@onready var main = $"../../"

func _on_weiterspielen_pressed():
	main.pauseMenu()


func _on_verlassen_pressed():
	get_tree().quit()



