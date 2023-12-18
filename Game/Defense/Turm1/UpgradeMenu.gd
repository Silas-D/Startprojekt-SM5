extends Control

const Tower1U1 = preload("res://Game/Defense/Turm1U1/Standard-TowerU1.tscn")
const Tower1U2 = preload("res://Game/Defense/Turm1U2/Standard-TowerU2.tscn")
var main = load("res://Game/main.tscn")
var towerContainer 

func _ready():
	if main:
		towerContainer = get_tree().get_root().get_node("Main")
		if towerContainer:
			towerContainer = towerContainer.get_node("Towers")

func _on_button_pressed():
	$Panel.show()


func _on_delete_pressed():
	$"..".queue_free()
	$Panel.hide()


func _on_upgrade_1_pressed():
	
	if Money.Gold >= 300:
		$Panel.hide()
		var turm = Tower1U1.instantiate()
		towerContainer.add_child(turm)
		turm.position = $".".global_position + Vector2(-28, 46)
		Money.Gold -= 300
	$"..".queue_free()


func _on_upgrade_2_pressed():
	
	if Money.Gold >= 300:
		$Panel.hide()
		var turm = Tower1U2.instantiate()
		towerContainer.add_child(turm)
		turm.position = $".".global_position + Vector2(-28, 46)
		Money.Gold -= 300
	$"..".queue_free()


func _on_close_pressed():
	$Panel.hide()
