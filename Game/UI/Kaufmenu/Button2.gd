extends Button
@onready var UI = $Panel12

const Tower1 = preload("res://Game/Defense/Turm1/Standard-Tower.tscn")
const Tower2 = preload ("res://Game/Defense/Turm2/advancedtower.tscn")
const T1Preis = 150
const T2Preis = 700


func _process(_delta):
	if Money.Gold <= T1Preis:
		$"Panel12/Button Tower 1/T1 Preis".set("theme_override_colors/font_color", Color(1,0,0))
	if Money.Gold >= T1Preis:
		$"Panel12/Button Tower 1/T1 Preis".set("theme_override_colors/font_color", Color(0,1,0))
	if Money.Gold <= T2Preis:
		$"Panel12/Button Tower 2/T2 Preis".set("theme_override_colors/font_color", Color(1,0,0))
	if Money.Gold >= T2Preis:
		$"Panel12/Button Tower 2/T2 Preis".set("theme_override_colors/font_color", Color(0,1,0))

func _on_pressed():
	UI.show()

func _on_button_tower_1_pressed():
	if Money.Gold >= T1Preis:
		UI.hide()
		var turm1 = Tower1.instantiate()
		get_parent().add_child(turm1)
		turm1.position = $".".global_position + Vector2(33, 37)
		Money.Gold -= T1Preis


func _on_button_tower_2_pressed():
	if Money.Gold >= T2Preis:
		UI.hide()
		var turm2 = Tower2.instantiate()
		get_parent().add_child(turm2)
		turm2.position = $".".global_position + Vector2(33, 37)
		Money.Gold -= T2Preis

func _on_close_button_pressed():
	UI.hide()
