extends ProgressBar


func _process(delta):
	self.max_value = get_node("Timer").wait_time
	self.value = get_node("Timer").time_left

