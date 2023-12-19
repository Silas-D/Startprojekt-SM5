extends CharacterBody2D

var target = Vector2.ZERO
const Speed = 1000
var pathName = ""
const bulletDamage = 1

func _process(_delta):
	var slimeSpawnerNode = get_tree().get_root().get_node("Main/Map/AllPaths")
	var foundTarget
	
	for i in range(slimeSpawnerNode.get_child_count()):
		var path = slimeSpawnerNode.get_child(i)
		if path:  
			for x in range(path.get_child_count()):
				var path2D = path.get_child(x)
				var targetNode = path2D.get_child(0)
	#	if path.name == pathName and path.get_child_count() > 0:
	#		var targetNode = path.get_child(0).get_child(-1).get_child(0)
			#1.getchild = Path; 2.getChild = PathFollowo(instanced); 3.getchild = Sline(instanced)
				if targetNode:
					target = targetNode.global_position
					foundTarget = true
					break  # Exit the loop once target is found
				
	if foundTarget:
		velocity = global_position.direction_to(target) * Speed
		move_and_slide()
#	print(foundTarget)
#	print(target)
	#Problem liegt nicht hier

func _on_area_2d_body_entered(body):
	if "slime" in body.name:
		body.get_parent().health -= bulletDamage
		queue_free()
