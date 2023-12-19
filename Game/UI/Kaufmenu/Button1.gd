extends Button

@onready var UI = $Panel11

const Tower1 = preload("res://Game/Defense/Turm1/Standard-Tower.tscn")
const Tower2 = preload ("res://Game/Defense/Turm2/advancedtower.tscn")
var towerContainer 

func _ready():
	if self:
		towerContainer = get_tree().get_root().get_node("Main")
		if towerContainer:
			towerContainer = towerContainer.get_node("Towers")

func _on_pressed():
	UI.show()

func _on_button_tower_1_pressed():
	if Money.Gold >= 150:
		UI.hide()
		var turm1 = Tower1.instantiate()
		towerContainer.add_child(turm1)
		turm1.position = $".".global_position + Vector2(33, 37)
		Money.Gold -= 150


func _on_button_tower_2_pressed():
	#Teuerster Turm!!
	if Money.Gold >= 700:
		UI.hide()
		var turm2 = Tower2.instantiate()
		towerContainer.add_child(turm2)
		turm2.position = $".".global_position + Vector2(33, 37)
		Money.Gold -= 700



func _on_close_button_pressed():
	UI.hide()
