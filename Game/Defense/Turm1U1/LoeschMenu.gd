extends Control


func _on_button_pressed():
	$Panel.show()


func _on_delete_pressed():
	$"..".queue_free()
	$Panel.hide()


func _on_close_pressed():
	$Panel.hide()
