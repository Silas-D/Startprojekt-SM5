extends Node2D


var Bullet = preload("res://Game/Defense/Turm1/Standard-Bullet.tscn")
var pathName
var currTargets = []
var curr
var towerHealth = 10

var reload = 0
var range = 400

@onready var timer = get_node("ProgressBar/Timer")
var startShooting = false


func _process(_delta):
	if is_instance_valid(curr):
		if timer.is_stopped():
			timer.start()
	else:
		for i in get_node("Node2D/BulletContainer").get_child_count():
			get_node("Node2D/BulletContainer").get_child(i).queue_free()
			
	if towerHealth <= 0:
		print("Turm down")
		queue_free()


func Shoot():
	var tempBullet = Bullet.instantiate()
	tempBullet.pathName = pathName
	get_node("Node2D/BulletContainer").add_child(tempBullet)
	tempBullet.global_position = $Node2D/Aim.global_position



func _on_tower_body_entered(body):
	if "Slime" in body.name:
		var tempArray = []
		currTargets = get_node("Node2D/Tower").get_overlapping_bodies()
		
		for i in currTargets:
			if "Slime" in i.name:
				tempArray.append(i)
		
		var currTarget = null
		
		for i in tempArray:
			if currTarget == null:
				currTarget = i.get_node("../")
			else:
				if i.get_parent().get_progress() > currTarget.get_progress():
					currTarget = i.get_node("../")
		
		curr = currTarget
		pathName = curr.get_parent().name
		
func _on_gegner_scan_body_entered(body):
	
	if "Slime_1" in body.name:
		towerHealth -= 1
		body.health -= 100
	if "Slime_2" in body.name:
		towerHealth -= 2
		body.health -= 100
	if "Slime_3" in body.name:
		towerHealth -= 3
		body.health -= 100
	if "Slime_4" in body.name:
		towerHealth -= 4
		body.health -= 100
	if "Slime_5" in body.name:
		towerHealth -= 5
		body.health -= 100
	if "Slime_6" in body.name:
		towerHealth -= 6
		body.health -= 100


func _on_timer_timeout():
	Shoot()
