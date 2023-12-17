extends PathFollow2D

const speed = 250
@export var health = 3

func _process(delta):
	move(delta)

	#get_parent().set_progress(get_parent().get_progress() + speed*delta)
	
	if get_progress_ratio() == 1:
		queue_free()

	if health <= 0:
		Money.Gold += 50
		print("Tod")
		#noch ändern dann
		get_parent().get_parent().queue_free()

func move(delta):
	set_progress(get_progress() + speed * delta)
