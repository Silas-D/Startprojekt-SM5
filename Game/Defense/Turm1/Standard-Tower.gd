extends Node2D


var Bullet = preload("res://Game/Defense/Turm1/Standard-Bullet.tscn")
var pathName
var currTargets = []
var curr
var towerHealth = 10
#wahrscheinlich nicht benötigt
#var reload = 0

@onready var timer = get_node("ProgressBar/Timer")
var startShooting = false


func _process(_delta):
	if is_instance_valid(curr):
		if timer.is_stopped():
			timer.start()
	else:
		if is_inside_tree():
			var bullet_container = get_node_or_null("Node2D/BulletContainer")
			if bullet_container:
				for i in bullet_container.get_child_count():
					bullet_container.get_child(i).queue_free()
			
	if towerHealth <= 0:
		print("Turm down")
		self.queue_free()

func _on_timer_timeout():
	Shoot()

func Shoot():
	var tempBullet = Bullet.instantiate()
	tempBullet.pathName = pathName
	var bullet_container = get_node_or_null("Node2D/BulletContainer")
	if bullet_container:
		get_node_or_null("Node2D/BulletContainer").add_child(tempBullet)
		tempBullet.global_position = $Node2D/Aim.global_position



func _on_tower_body_entered(body):
	if "slime" in body.name:
		var tempArray = []
		currTargets = get_node("Node2D/Tower").get_overlapping_bodies()
		
		for i in currTargets:
			if "slime" in i.name:
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
	
	if "slime1" in body.name:
		towerHealth -= 1
		body.get_parent().health -= 100
	if "slime2" in body.name:
		towerHealth -= 2
		body.get_parent().health -= 100
	if "slime3" in body.name:
		towerHealth -= 3
		body.get_parent().health -= 100
	if "slime4" in body.name:
		towerHealth -= 4
		body.get_parent().health -= 100
	if "slime5" in body.name:
		towerHealth -= 5
		body.get_parent().health -= 100
	if "slime6" in body.name:
		towerHealth -= 6
		body.get_parent().health -= 100



