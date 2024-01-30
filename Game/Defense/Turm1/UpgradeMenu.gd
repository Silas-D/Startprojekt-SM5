extends Control

const Tower1U1 = preload("res://Game/Defense/Turm1U1/Standard-TowerU1.tscn")
const Tower1U2 = preload("res://Game/Defense/Turm1U2/Standard-TowerU2.tscn")
const U1Preis = 200
const U2Preis = 200
var main = load("res://Game/main.tscn")
var towerContainer 

func _ready():
	if main:
		towerContainer = get_tree().get_root().get_node("Main")
		if towerContainer:
			towerContainer = towerContainer.get_node("Towers")

func _process(_delta):
	if Money.Gold <= U1Preis:
		$"Panel/Upgrade1/U1 Preis".set("theme_override_colors/font_color", Color(1,0,0))
	if Money.Gold >= U1Preis:
		$"Panel/Upgrade1/U1 Preis".set("theme_override_colors/font_color", Color(0,1,0))
	if Money.Gold <= U2Preis:
		$"Panel/Upgrade2/U2 Preis".set("theme_override_colors/font_color", Color(1,0,0))
	if Money.Gold >= U2Preis:
		$"Panel/Upgrade2/U2 Preis".set("theme_override_colors/font_color", Color(0,1,0))


func _on_button_pressed():
	$Panel.show()

func _on_delete_pressed():
	Money.Gold += 100
	$"..".queue_free()
	$Panel.hide()


func _on_upgrade_1_pressed():
	
	if Money.Gold >= U1Preis:
		$Panel.hide()
		var turm = Tower1U1.instantiate()
		towerContainer.add_child(turm)
		turm.position = $".".global_position + Vector2(-28, 46)
		Money.Gold -= U1Preis
		$"..".queue_free()
	else:
		$Panel.hide()


func _on_upgrade_2_pressed():
	
	if Money.Gold >= U2Preis:
		$Panel.hide()
		var turm = Tower1U2.instantiate()
		towerContainer.add_child(turm)
		turm.position = $".".global_position + Vector2(-28, 46)
		Money.Gold -= U2Preis
		$"..".queue_free()
	else:
		$Panel.hide()


func _on_close_pressed():
	$Panel.hide()
