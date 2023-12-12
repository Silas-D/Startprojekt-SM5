extends Panel

@onready var tower = preload("res://Game/Defense/Turm1/RedBulletTower.tscn")
var currTile

func _on_gui_input(event):
	var tempTower = tower.instantiate()
	print(1)
	#if event is InputEventMouseButton and event.button_mask ==1:
		#add_child(tempTower)
		
		
		#tempTower.process_mode = Node.PROCESS_MODE_DISABLED
		
		#tempTower.scale = Vector2(1,1)
		
		
	#elif event is InputEventMouseMotion and event.button_mask ==1:
		#if get_child_count() > 1:
			#get_child(1).global_position = event .global_position
		
	#elif event is InputEventMouseButton and event.button_mask ==0:
		#if event.global_position.x >2944:
			#if get_child_count() > 1:
				#get_child(1).queue_free()
		
		
		#var path = get_tree().get_root().get_node("Defence/Turm1")
				
		#path.add_child(tempTower)
		#tempTower.global_posiiton =event.global_position
		#tempTower.get_node("res://Game/Defense/Turm1/RedBulletTower.tscn")
	#else:
		#if get_child_count() >1:
			#get_child(1).queue_free()
