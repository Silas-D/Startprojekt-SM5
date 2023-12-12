extends Button

@onready var UI = $UI
var presed = false

func _on_pressed():
	pass


func _on_toggled(button_pressed):
	if button_pressed:
		UI.show()
	else :
		UI.hide()
