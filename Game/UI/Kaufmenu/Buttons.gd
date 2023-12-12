extends Node2D

@onready var UI = $UI

const Tower1 = preload("res://Game/Defense/Turm1/Standard-Tower.tscn")
const Tower2 = preload ("res://Game/Defense/Turm2/advancedtower.tscn")



func _on_button_pressed():
	UI.show()
	
func _on_button_tower_1_pressed():
	UI.hide()
	print(1)
	var turm1 = Tower1.instantiate()
	get_parent().add_child(turm1)
	
	turm1.position = $Button.global_position
	


func _on_button_tower_2_pressed():
	UI.hide()
	print(2)
	pass # Spawn Tower 2 an Buttonposition
