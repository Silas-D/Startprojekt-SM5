extends Label


func _process(_delta):
	self.text = "Welle: " + str(WaveCounter.current_wave)
