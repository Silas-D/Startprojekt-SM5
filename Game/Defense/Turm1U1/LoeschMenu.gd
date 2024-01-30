extends Control


func _on_button_pressed():
	$Panel.show()


func _on_delete_pressed():
	Money.Gold += 150
	$"..".queue_free()
	$Panel.hide()


func _on_close_pressed():
	$Panel.hide()
