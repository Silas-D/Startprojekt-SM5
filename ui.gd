extends CanvasLayer
@onready var UI = $"."
@export var TowerSpawn = 0

func _on_button_pressed_tower1():
	UI.hide()
	return 1


func _on_button_2_pressed_tower2():
	UI.hide()
	return 2
