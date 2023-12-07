extends StaticBody2D


var Bullet = preload("res://Game/Defense/Turm1/RedBullet.tscn")
const bulletDamage = 5
var pathName
var currTargets = []
var curr
var towerHealth = 10


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
		
func _on_tower_body_exited(_body):
	pass # Replace with function body.

