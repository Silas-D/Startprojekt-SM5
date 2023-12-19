extends PathFollow2D

const speed = 100
@export var health = 9

func _process(delta):
	move(delta)
	
	if get_progress_ratio() == 1:
		queue_free()

	if health <= 0:
		Money.Gold += 20
		print("Tod")
		#noch ändern dann
		self.queue_free()

func move(delta):
	set_progress(get_progress() + speed * delta)
