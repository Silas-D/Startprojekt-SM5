extends Control



func _on_button_pressed():
	$Panel.show()


func _on_delete_pressed():
	$"..".queue_free()
	$Panel.hide()


func _on_upgrade_1_pressed():
	pass # Replace with function body.


func _on_upgrade_2_pressed():
	pass # Replace with function body.
