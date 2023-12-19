extends Node2D

@onready var pause_menu = $pauseMenu
var paused = false
@export var current_wave = 0
@export var enemies_in_wave = 0
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
	Money.Gold = 1000
	map_node1 = get_node("Map/AllPaths/Path1")
	map_node2 = get_node("Map/AllPaths/Path2")
	map_node3 = get_node("Map/AllPaths/Path3")
	map_node4 = get_node("Map/AllPaths/Path4")

func _process(_delta):
	if Input.is_action_just_pressed("Pause"):
		pauseMenu();
		
		
func _on_next_wave_pressed():
	if waveDone:
		waveDone = false
		Engine.time_scale =1
		start_next_wave()
		


##
## Wave Functions
##
func start_next_wave():
	await get_tree().create_timer(0.2).timeout
	spawn_enemies()
	current_wave += 1
	if spawn_enemies:
		get_node("NextWave").modulate = Color(255,0,0)
	

func retrieve_wave_data(wave):
	var wave_data = []
	if wave == 0:
		wave_data = [["slime_1", 1]]
	elif wave == 1:
		wave_data = [["slime_1", 2], ["slime_1", 2], ["slime_1", 2]]
	elif wave == 2:
		wave_data = [["slime_2", 1]]
	elif wave == 3:
		wave_data = [["slime_3", 1]]
	elif wave == 4:
		wave_data = [["slime_4", 1]]
	elif wave == 5:
		wave_data = [["slime_5", 1]]
	elif wave == 6:
		wave_data = [["slime_6", 1]]
	elif wave == 7:
		wave_data = [["slime_3", 1]]
	elif wave == 8:
		wave_data = [["slime_3", 1]]
	elif wave == 9:
		wave_data = [["slime_3", 1]]
	elif wave == 10:
		wave_data = [["slime_4", 1]]
	else:
		wave_data = [["slime_6", 3], ["slime_3", 1]]
	
	enemies_in_wave += wave_data.size()
	return wave_data

func spawn_enemies():
	var wave_data = retrieve_wave_data(current_wave)
	
	for i in wave_data:
		if randomStartPath == 1:
			map_node1.add_child(checkSlime(i[0]))
		if randomStartPath == 2:
			map_node2.add_child(checkSlime(i[0]))
		if randomStartPath == 3:
			map_node3.add_child(checkSlime(i[0]))
		if randomStartPath == 4:
			map_node4.add_child(checkSlime(i[0]))
		await get_tree().create_timer(i[1]).timeout
	if current_wave > 3:
		var current_wave2 = current_wave - 3
		wave_data = retrieve_wave_data(current_wave2)
		for i in wave_data:
			if randomSecondPath == 1:
				map_node1.add_child(checkSlime(i[0]))
			if randomSecondPath == 2:
				map_node2.add_child(checkSlime(i[0]))
			if randomSecondPath == 3:
				map_node3.add_child(checkSlime(i[0]))
			if randomSecondPath == 4:
				map_node4.add_child(checkSlime(i[0]))
			await get_tree().create_timer(i[1]).timeout
	if current_wave > 6:
		var current_wave3 = current_wave - 6
		wave_data = retrieve_wave_data(current_wave3)
		for i in wave_data:	
			if randomThirdPath == 1:
				map_node1.add_child(checkSlime(i[0]))
			if randomThirdPath == 2:
				map_node2.add_child(checkSlime(i[0]))
			if randomThirdPath == 3:
				map_node3.add_child(checkSlime(i[0]))
			if randomThirdPath == 4:
				map_node4.add_child(checkSlime(i[0]))
			await get_tree().create_timer(i[1]).timeout
	if current_wave > 9:
		var current_wave4 = current_wave - 9
		wave_data = retrieve_wave_data(current_wave4)
		for i in wave_data:
			if randomFourthPath == 1:
				map_node1.add_child(checkSlime(i[0]))
			if randomFourthPath == 2:
				map_node2.add_child(checkSlime(i[0]))
			if randomFourthPath == 3:
				map_node3.add_child(checkSlime(i[0]))
			if randomFourthPath == 4:
				map_node4.add_child(checkSlime(i[0]))
			await get_tree().create_timer(i[1]).timeout
		
	await get_tree().create_timer(2).timeout
	waveDone = true
	get_node("NextWave").modulate = Color(255,255,255)

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
	if "slime" in body.name:
		get_tree().change_scene_to_file("res://Game/UI/mainmenu/main_menu.tscn")

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
	
	
func _on_fast_forward_pressed():
		Engine.time_scale =2.5
	

	
		
	



	
