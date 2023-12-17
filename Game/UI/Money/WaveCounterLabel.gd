extends Label


func _process(delta):
	self.text = "Welle: " + str(WaveCounter.current_wave)
