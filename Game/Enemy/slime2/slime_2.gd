extends PathFollow2D

const speed = 70
@export var health = 6

func _process(delta):
	move(delta)
	
	if get_progress_ratio() == 1:
		queue_free()

	if health <= 0:
		Money.Gold += 50
		print("Tod")
		#noch ändern dann
		self.queue_free()

func move(delta):
	set_progress(get_progress() + speed * delta)
