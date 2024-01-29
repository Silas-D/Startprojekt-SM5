extends CanvasLayer

@onready var main = owner

func _on_weiterspielen_pressed():
	main.pauseMenu()


func _on_verlassen_pressed():
	get_tree().change_scene_to_file("res://Game/UI/mainmenu/main_menu.tscn")


signal autostart_toggel
func _on_texture_AUTOSTART_toggled(toggled_on):
	autostart_toggel.emit()
