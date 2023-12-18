extends CharacterBody2D

var target = Vector2.ZERO
const Speed = 1000
var pathName = ""
const bulletDamage = 1

func _physics_process(_delta):
	var slimeSpawnerNode = get_tree().get_root().get_node("Main/Map")
	var foundTarget
	
	for i in range(slimeSpawnerNode.get_child_count()):
		var child = slimeSpawnerNode.get_child(i)
		if child.name == pathName and child.get_child_count() > 0:
			var targetNode = child.get_child(0).get_child(0).get_child(0)
			if targetNode:
				target = targetNode.global_position
				foundTarget = true
				break  # Exit the loop once target is found
				
	if foundTarget:
		velocity = global_position.direction_to(target) * Speed
		move_and_slide()


func _on_area_2d_body_entered(body):
	if "slime" in body.name:
		body.get_parent().health -= bulletDamage
		queue_free()
