extends Label

func _process(_delta):
	var main_node = get_tree().get_root().get_node("Main")
	if main_node:
		var current_wave_value = main_node.current_wave
		self.text = "Welle: " + str(current_wave_value)
