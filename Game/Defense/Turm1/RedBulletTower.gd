extends StaticBody2D


var Bullet = preload("res://Game/Defense/Turm1/RedBullet.tscn")
var pathName
var currTargets = []
var curr
var towerHealth = 10


func _process(_delta):
	if towerHealth <= 0:
		print("Turm down")
		queue_free()

func _on_tower_body_entered(body):
	if "Soldier A" in body.name:
		var tempArray = []
		currTargets = get_node("Tower").get_overlapping_bodies()
		
		for i in currTargets:
			if "Soldier" in i.name:
				tempArray.append(i)
		
		var currTarget = null
		
		for i in tempArray:
			if currTarget == null:
				currTarget = i.get_node("../")
			else:
				if i.get_parent().get_progress() > currTarget.get_progress():
					currTarget = i.get_node("../")
		
		curr = currTarget
		pathName = currTarget.get_parent().name
		
		var tempBullet = Bullet.instantiate()
		tempBullet.pathName = pathName
		#tempBullet.bulletDamage = bulletDamage
		#Anscheinend nicht benötigt
		get_node("BulletContainer").add_child(tempBullet)
		tempBullet.global_position = $Aim.global_position


func _on_gegner_scan_body_entered(body):
	if "Soldier A" in body.name:
		towerHealth -= 2
		body.health -= 100
	
	if "slime_1" in body.name:
		towerHealth -= 1
		body.health -= 100
	if "slime_2" in body.name:
		towerHealth -= 2
		body.health -= 100
	if "slime_3" in body.name:
		towerHealth -= 3
		body.health -= 100
	if "slime_4" in body.name:
		towerHealth -= 4
		body.health -= 100
	if "slime_5" in body.name:
		towerHealth -= 5
		body.health -= 100
	if "slime_6" in body.name:
		towerHealth -= 6
		body.health -= 100
