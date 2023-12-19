extends CanvasLayer

var waves
var enemies

func _process(_delta):
	var main = get_tree().get_root().get_node("Main")
	if main:
			waves = main.current_wave
			waves -= 1
			enemies = main.enemies_in_wave

func _on_weiterspielen_pressed():
	get_tree().change_scene_to_file("res://Game/main.tscn")


func _on_verlassen_pressed():
	get_tree().change_scene_to_file("res://Game/UI/mainmenu/main_menu.tscn")


func _on_visibility_changed():
	waves = str(waves)
	var string1 = String()
	string1 = (waves + " Wellen geschafft!")
	$"Panel/Wellen ausgabe".set_text(string1)
	enemies = str(enemies)
	var string2 = String()
	string2 = (enemies + " Gegner gespawned")
	$"Panel/Gegner killed".set_text(string2)
