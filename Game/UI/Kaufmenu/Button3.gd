extends Button

@onready var UI = $Panel21

const Tower1 = preload("res://Game/Defense/Turm1/Standard-Tower.tscn")
const Tower2 = preload ("res://Game/Defense/Turm2/advancedtower.tscn")


func _on_pressed():
	UI.show()

func _on_button_tower_1_pressed():
	UI.hide()
	print(1)
	var turm1 = Tower1.instantiate()
	get_parent().add_child(turm1)
	
	turm1.position = $".".global_position + Vector2(33, 37)


func _on_button_tower_2_pressed():
	UI.hide()
	print(2)
	pass # Spawn Tower 2 an Buttonposition


func _on_close_button_pressed():
	UI.hide()
