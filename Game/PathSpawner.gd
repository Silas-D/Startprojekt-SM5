extends Node2D

@onready 
var path1 = preload("res://Game/Enemy/slime1/Stage 1.tscn")
var path2 = preload("res://Game/Enemy/slime1/Stage 1.1.tscn")
var path3 = preload("res://Game/Enemy/slime1/Stage 1.2.tscn")
var path4 = preload("res://Game/Enemy/slime1/Stage 1.3.tscn")

func _on_timer_timeout():
	var tempPath1 = path1.instantiate()
	var tempPath2 = path2.instantiate()
	var tempPath3 = path3.instantiate()
	var tempPath4 = path4.instantiate()
	
	add_child(tempPath4)
	add_child(tempPath1)
	add_child(tempPath2)
	add_child(tempPath3)
