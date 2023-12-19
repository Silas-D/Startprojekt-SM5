extends CanvasLayer



func _on_weiterspielen_pressed():
	get_tree().change_scene_to_file("res://Game/main.tscn")


func _on_verlassen_pressed():
	get_tree().change_scene_to_file("res://Game/UI/mainmenu/main_menu.tscn")
