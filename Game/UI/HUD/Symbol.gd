extends Label

func _process(_delta):
	self.text = "Gold: " + str(Money.Gold)
