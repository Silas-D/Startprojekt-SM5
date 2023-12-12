extends Node2D

@onready var UI = $UI





func _on_button_pressed():
	UI.show()
	
func _on_button_tower_1_pressed():
	UI.hide()
	print(1)
	pass # Spawn Tower 1 an Buttonposition
	


func _on_button_tower_2_pressed():
	UI.hide()
	print(2)
	pass # Spawn Tower 1 an Buttonposition
