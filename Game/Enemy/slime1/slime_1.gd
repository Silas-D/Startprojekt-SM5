extends PathFollow2D

signal TOD
const speed = 50
@export var health = 3

func _process(delta):
	move(delta)
	
	if get_progress_ratio() == 1:
		queue_free()

	if health <= 0:
		TOD.emit()
		Money.Gold += 10
		print("Tod")
		#noch ändern dann
		self.queue_free()

func move(delta):
	set_progress(get_progress() + speed * delta)
