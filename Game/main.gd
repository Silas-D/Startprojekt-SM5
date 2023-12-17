extends Node2D

@onready var pause_menu = $pauseMenu
var paused = false

@export var current_wave = 0
var enemies_in_wave = 0
var map_node1
var map_node2
var map_node3
var map_node4


func _ready():
	map_node1 = get_node("Map/Path1")
	map_node2 = get_node("Map/Path2")
	map_node3 = get_node("Map/Path3")
	map_node4 = get_node("Map/Path4")
#	var new_enemy = load("res://Game/Enemy/slime1/slime_1.tscn").instantiate()
#	map_node.add_child(new_enemy, true)
#.get_node("Path1")
	start_next_wave()

func _process(_delta):
	if Input.is_action_just_pressed("Pause"):
		pauseMenu();
		
##
## Wave Functions
##
func start_next_wave():
	#-> void
	var wave_data = retrieve_wave_data()
	#:
	await get_tree().create_timer(0.2).timeout ##padding
	spawn_enemies(wave_data)

func retrieve_wave_data():
	# -> Array
	var wave_data = []
	
	if current_wave == 0:
		wave_data = [["slime_1", 1]]
	elif current_wave == 1:
		wave_data = [["slime_1", 1], ["slime_1", 1]]
	elif current_wave == 2:
		wave_data = [["slime_1", 1], ["slime_1", 2], ["slime_1", 4], ["slime_1", 5]]
	elif current_wave == 3:
		wave_data = [["slime_1", 1], ["slime_1", 1], ["slime_1", 0.1], ["slime_1", 0.1]]
	elif current_wave == 4:
		wave_data = [["slime_1", 1], ["slime_1", 1], ["slime_1", 0.1], ["slime_1", 0.1]]
	elif current_wave == 5:
		wave_data = [["slime_1", 1], ["slime_1", 1], ["slime_1", 0.1], ["slime_1", 0.1]]
	elif current_wave == 6:
		wave_data = [["slime_1", 1], ["slime_1", 1], ["slime_1", 0.1], ["slime_1", 0.1]]
	elif current_wave == 7:
		wave_data = [["slime_1", 1], ["slime_1", 1], ["slime_1", 0.1], ["slime_1", 0.1]]
	elif current_wave == 8:
		wave_data = [["slime_1", 1], ["slime_1", 1], ["slime_1", 0.1], ["slime_1", 0.1]]
	elif current_wave == 9:
		wave_data = [["slime_1", 1], ["slime_1", 1], ["slime_1", 0.1], ["slime_1", 0.1]]
	elif current_wave == 10:
		wave_data = [["slime_1", 1], ["slime_1", 1], ["slime_1", 0.1], ["slime_1", 0.1]]
	else:
		wave_data = [["slime_1", 1], ["slime_1", 1], ["slime_1", 2], ["slime_1", 0.1]]
	# : Array
	current_wave += 1
	enemies_in_wave = wave_data.size()
	return wave_data

func spawn_enemies(wave_data):
	# : Array) -> void
	var new_enemy
	for i in wave_data:
		#vollständige konfig
		new_enemy = load("res://Game/Enemy/slime1/" + i[0] + ".tscn").instantiate()
		map_node1.add_child(new_enemy, true)
		new_enemy = load("res://Game/Enemy/slime1/" + i[0] + ".tscn").instantiate()
		map_node2.add_child(new_enemy, true)
		new_enemy = load("res://Game/Enemy/slime1/" + i[0] + ".tscn").instantiate()
		map_node3.add_child(new_enemy, true)
		new_enemy = load("res://Game/Enemy/slime1/" + i[0] + ".tscn").instantiate()
		map_node4.add_child(new_enemy, true)
		await get_tree().create_timer(i[1]).timeout

func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale =1
	else:
		pause_menu.show()
		Engine.time_scale = 0
		
	paused = !paused

func _on_pause_button_pressed():
	pauseMenu();
