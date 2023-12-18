extends Node2D

@onready var pause_menu = $pauseMenu
var paused = false

@export var current_wave = 0
var enemies_in_wave = 0
var map_node1
var map_node2
var map_node3
var map_node4
var rng = RandomNumberGenerator.new()
var randomStartPath = rng.randi_range(1, 4)
var randomSecondPath = next2randomPath(randomStartPath)
var randomThirdPath = next3randomPath(randomStartPath, randomSecondPath)
var randomFourthPath = 10 - randomStartPath - randomSecondPath - randomThirdPath
var waveDone = true

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
		

func _on_next_wave_pressed():
	if waveDone:
		waveDone = false
		start_next_wave()

##
## Wave Functions
##
func start_next_wave():
	#-> void
	var wave_data = retrieve_wave_data()
	#:
	await get_tree().create_timer(2).timeout ##padding
	
	spawn_enemies(wave_data)
	current_wave += 1
	#start_next_wave()

func retrieve_wave_data():
	# -> Array
	var wave_data = []
	#, ["slime_1", 1]
	if current_wave == 0:
		wave_data = [["slime_1", 1]]
	elif current_wave == 1:
		wave_data = [["slime_1", 1]]
	elif current_wave == 2:
		wave_data = [["slime_1", 1]]
	elif current_wave == 3:
		wave_data = [["slime_1", 1]]
	elif current_wave == 4:
		wave_data = [["slime_2", 1]]
	elif current_wave == 5:
		wave_data = [["slime_2", 1]]
	elif current_wave == 6:
		wave_data = [["slime_2", 1]]
	elif current_wave == 7:
		wave_data = [["slime_3", 1]]
	elif current_wave == 8:
		wave_data = [["slime_3", 1]]
	elif current_wave == 9:
		wave_data = [["slime_3", 1]]
	elif current_wave == 10:
		wave_data = [["slime_4", 1]]
	else:
		wave_data = [["slime_3", 1], ["slime_6", 1]]
	# : Array
	#current_wave += 1
	enemies_in_wave = wave_data.size()
	return wave_data

func spawn_enemies(wave_data):
	# : Array) -> void
	
	for i in wave_data:
		#vollständige konfig
		
		if randomStartPath == 1:
			map_node1.add_child(checkSlime(i[0]))
		if randomStartPath == 2:
			map_node2.add_child(checkSlime(i[0]))
		if randomStartPath == 3:
			map_node3.add_child(checkSlime(i[0]))
		if randomStartPath == 4:
			map_node4.add_child(checkSlime(i[0]))
		if current_wave > 4:
			if randomSecondPath == 1:
				map_node1.add_child(checkSlime(i[0]))
			if randomSecondPath == 2:
				map_node2.add_child(checkSlime(i[0]))
			if randomSecondPath == 3:
				map_node3.add_child(checkSlime(i[0]))
			if randomSecondPath == 4:
				map_node4.add_child(checkSlime(i[0]))
		if current_wave > 7:
			if randomThirdPath == 1:
				map_node1.add_child(checkSlime(i[0]))
			if randomThirdPath == 2:
				map_node2.add_child(checkSlime(i[0]))
			if randomThirdPath == 3:
				map_node3.add_child(checkSlime(i[0]))
			if randomThirdPath == 4:
				map_node4.add_child(checkSlime(i[0]))
		if current_wave > 10:
			if randomFourthPath == 1:
				map_node1.add_child(checkSlime(i[0]))
			if randomFourthPath == 2:
				map_node2.add_child(checkSlime(i[0]))
			if randomFourthPath == 3:
				map_node3.add_child(checkSlime(i[0]))
			if randomFourthPath == 4:
				map_node4.add_child(checkSlime(i[0]))
		await get_tree().create_timer(i[1]).timeout
		
		await get_tree().create_timer(10).timeout
		waveDone = true
		
func checkSlime(slime):
	var new_enemy
	if slime == "slime_1":
		new_enemy = load("res://Game/Enemy/slime1/" + slime + ".tscn").instantiate()
	if slime == "slime_2":
		new_enemy = load("res://Game/Enemy/slime2/" + slime + ".tscn").instantiate()
	if slime == "slime_3":
		new_enemy = load("res://Game/Enemy/slime3/" + slime + ".tscn").instantiate()
	if slime == "slime_4":
		new_enemy = load("res://Game/Enemy/slime4/" + slime + ".tscn").instantiate()
	if slime == "slime_5":
		new_enemy = load("res://Game/Enemy/slime5/" + slime + ".tscn").instantiate()
	if slime == "slime_6":
		new_enemy = load("res://Game/Enemy/slime6/" + slime + ".tscn").instantiate()
	return new_enemy

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

func _on_area_2d_body_entered(body):
	#Game Over Funktion
	pass

func next2randomPath(existingPath):
	var secActivePath = rng.randi_range(1, 4)
	while secActivePath == existingPath:
		secActivePath = rng.randi_range(1, 4)
	return secActivePath

func next3randomPath(existingPath1, existingPath2):
	var thirdActivePath = rng.randi_range(1, 4)
	while thirdActivePath == existingPath1 || thirdActivePath == existingPath2:
		thirdActivePath = rng.randi_range(1, 4)
	return thirdActivePath




