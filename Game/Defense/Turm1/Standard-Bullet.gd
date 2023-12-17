extends CharacterBody2D


var target = Vector2.ZERO
const Speed = 1000
var pathName = ""
const bulletDamage = 1

func _physics_process(_delta):
	#wo liegt die
	var slimeSpawnerNode = get_tree().get_root().get_node("Main/Map")
	var foundTarget
	
	for i in slimeSpawnerNode.get_child_count():
		if slimeSpawnerNode.get_child(i).name == pathName:
			#foundTarget = true
			target = slimeSpawnerNode.get_child(i).get_child(0).get_child(0).get_child(0).global_position
			
	velocity = global_position.direction_to(target) * Speed
	move_and_slide()
	
#	if foundTarget:
#		velocity = global_position.direction_to(target) * Speed
#		look_at(target)
#		move_and_slide()


func _on_area_2d_body_entered(body):
	if "slime" in body.name:
		body.get_parent().health -= bulletDamage
		queue_free()
