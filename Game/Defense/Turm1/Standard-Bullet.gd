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
				if targetNode:
					target = targetNode.global_position
					foundTarget = true
					break  # Exit the loop once target is found
	if foundTarget:
		var vector = Vector2.RIGHT
		velocity = vector * Speed
		move_and_slide()

func _on_area_2d_body_entered(body):
	if "slime" in body.name:
		body.get_parent().health -= bulletDamage
		queue_free()
