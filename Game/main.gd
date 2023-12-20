extends Node2D

@onready var pause_menu = $pauseMenu
var paused = false
@export var current_wave = 0
@export var enemies_in_wave = 0
var map_node1
var map_node2
var map_node3
var map_node4
var firstPath
var secondPath
var thirdPath
var fourthPath
var rng = RandomNumberGenerator.new()
var randomStartPath = rng.randi_range(1, 4)
var randomSecondPath = next2randomPath(randomStartPath)
var randomThirdPath = next3randomPath(randomStartPath, randomSecondPath)
var randomFourthPath = 10 - randomStartPath - randomSecondPath - randomThirdPath
var waveDone = true

func _ready():
	Money.Gold = 350
	map_node1 = get_node("Map/AllPaths/Path1")
	map_node2 = get_node("Map/AllPaths/Path2")
	map_node3 = get_node("Map/AllPaths/Path3")
	map_node4 = get_node("Map/AllPaths/Path4")
	pathZuweisung()

##
##Path funcs
##
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

func pathZuweisung():
	#First Path
	if randomStartPath == 1:
		firstPath = map_node1
	elif randomStartPath == 2:
		firstPath = map_node2
	elif randomStartPath == 3:
		firstPath = map_node3
	elif randomStartPath == 4:
		firstPath = map_node4
	#Second Path
	if randomSecondPath == 1:
		secondPath = map_node1
	elif randomSecondPath == 2:
		secondPath = map_node2
	elif randomSecondPath == 3:
		secondPath = map_node3
	elif randomSecondPath == 4:
		secondPath = map_node4
	#Third Path
	if randomThirdPath == 1:
		thirdPath = map_node1
	elif randomThirdPath == 2:
		thirdPath = map_node2
	elif randomThirdPath == 3:
		thirdPath = map_node3
	elif randomThirdPath == 4:
		thirdPath = map_node4
	#Fourth Path
	if randomFourthPath == 1:
		fourthPath = map_node1
	elif randomFourthPath == 2:
		fourthPath = map_node2
	elif randomFourthPath == 3:
		fourthPath = map_node3
	elif randomFourthPath == 4:
		fourthPath = map_node4

##
##Immer aktive Funcs
##
func _process(_delta):
	if Input.is_action_just_pressed("Pause"):
		_on_fast_forward_toggled(false)
		pauseMenu();

##Game Over Func
func _on_game_over_detection_body_entered(body):
	if "slime" in body.name:
		$GameOverScreen.show()

##Pause Menue
func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale =1
	else:
		pause_menu.show()
		Engine.time_scale = 0
		
	paused = !paused

##
##Button Funcs
##
func _on_pause_button_pressed():
	_on_fast_forward_toggled(false)
	pauseMenu();

func _on_next_wave_pressed():
	if waveDone:
		waveDone = false
		Engine.time_scale =1
		start_next_wave()

func _on_fast_forward_toggled(toggled_on):
	if toggled_on:
		get_node("Buttons/FastForward").modulate = Color(0,255,0)
		Engine.time_scale = 2.5
	else :
		get_node("Buttons/FastForward").modulate = Color(255,255,255)
		Engine.time_scale = 1


##
## Wave Functions
##
func start_next_wave():
	#Star Delay
	await get_tree().create_timer(0.2).timeout
	
	spawn_enemies()
	current_wave += 1
	if spawn_enemies:
		get_node("Buttons/NextWave").modulate = Color(255,0,0)
		get_node("Buttons/FastForward").modulate = Color(255,255,255)


var wave_data2
var wave_data3
var wave_data4
func spawn_enemies():
	#Zuordnung
	if current_wave > 8:
		wave_data4 = current_wave - 9
		wave_data3 = current_wave - 6
		wave_data2 = current_wave - 3
	elif current_wave > 5:
		wave_data3 = current_wave - 6
		wave_data2 = current_wave - 3
	elif current_wave > 2:
		wave_data2 = current_wave - 3
	
	#Deciding where to spawn
	var done
	if current_wave > 8:
		done = await Spawn_4_Paths()
	elif current_wave > 5:
		done = await Spawn_3_Paths()
	elif current_wave > 2:
		done = await Spawn_2_Paths()
	elif current_wave >= 0:
		done = await Spawn_1_Path()
		
	if done == true: 
		await get_tree().create_timer(2).timeout
		waveDone = true
		get_node("Buttons/NextWave").modulate = Color(255,255,255)

##Spawn Functions
func Spawn_4_Paths():
	var wave_array = retrieve_wave_data(current_wave)
	for i in wave_array:
		firstPath.add_child(checkSlime(i[0]))
		await get_tree().create_timer(i[1]).timeout
	var wave_array2 = retrieve_wave_data(wave_data2)
	for i in wave_array2:
		secondPath.add_child(checkSlime(i[0]))
		await get_tree().create_timer(i[1]).timeout
	var wave_array3 = retrieve_wave_data(wave_data3)
	for i in wave_array3:
		thirdPath.add_child(checkSlime(i[0]))
		await get_tree().create_timer(i[1]).timeout
	var wave_array4 = retrieve_wave_data(wave_data4)
	for i in wave_array4:
		fourthPath.add_child(checkSlime(i[0]))
		await get_tree().create_timer(i[1]).timeout
	return true
func Spawn_3_Paths():
	var wave_array = retrieve_wave_data(current_wave)
	for i in wave_array:
		firstPath.add_child(checkSlime(i[0]))
		await get_tree().create_timer(i[1]).timeout
	var wave_array2 = retrieve_wave_data(wave_data2)
	for i in wave_array2:
		thirdPath.add_child(checkSlime(i[0]))
		await get_tree().create_timer(i[1]).timeout
	var wave_array3 = retrieve_wave_data(wave_data3)
	for i in wave_array3:
		secondPath.add_child(checkSlime(i[0]))
		await get_tree().create_timer(i[1]).timeout
	return true
func Spawn_2_Paths():
	var wave_array = retrieve_wave_data(current_wave)
	for i in wave_array:
		firstPath.add_child(checkSlime(i[0]))
		await get_tree().create_timer(i[1]).timeout
	var wave_array2 = retrieve_wave_data(wave_data2)
	for i in wave_array2:
		secondPath.add_child(checkSlime(i[0]))
		await get_tree().create_timer(i[1]).timeout
	return true
func Spawn_1_Path():
	var wave_array = retrieve_wave_data(current_wave)
	for i in wave_array:
		firstPath.add_child(checkSlime(i[0]))
		await get_tree().create_timer(i[1]).timeout
	return true


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




func retrieve_wave_data(wave):
	var wave_data = []
	if wave == 0:
		wave_data = [["slime_1", 1]]
	elif wave == 1:
		wave_data = [["slime_1", 2], ["slime_1", 3], ["slime_1", 2], ["slime_1", 2], ["slime_1", 3], ["slime_1", 2]]
	elif wave == 2:
		wave_data = [["slime_1", 1], ["slime_1", 1], ["slime_1", 1], ["slime_1", 1]]
	elif wave == 3:
		wave_data = [["slime_1", 2], ["slime_1", 3],["slime_2", 3],["slime_1", 2],["slime_2", 2]] #tower auf startpath bekommt ersten damage
	elif wave == 4:
		wave_data = [["slime_1", 0.7], ["slime_1", 0.7], ["slime_1", 0.7], ["slime_1", 0.7],["slime_1", 0.7], ["slime_2", 1],["slime_2", 1]]
	elif wave == 5:
		wave_data = [["slime_2", 1], ["slime_2", 1], ["slime_2", 1], ["slime_2", 1], ["slime_1", 1], ["slime_1", 1], ["slime_1", 1], ["slime_2", 1]]
	elif wave == 6:
		wave_data = [["slime_2", 1], ["slime_2", 2], ["slime_3", 1], ["slime_3", 1]]
	elif wave == 7:
		wave_data = [["slime_3", 2], ["slime_3", 2], ["slime_3", 2], ["slime_2", 2], ["slime_2", 2], ["slime_1", 0.7], ["slime_1", 0.7], ["slime_1", 0.7], ["slime_1", 0.7],["slime_1", 0.7]]
	elif wave == 8:
		wave_data = [["slime_3", 4], ["slime_2", 2], ["slime_2", 4], ["slime_3", 1]]
	elif wave == 9:
		wave_data = [["slime_2", 3], ["slime_3", 2], ["slime_2", 5], ["slime_4", 1]]
	elif wave == 10:
		wave_data = [["slime_4", 1]]
	else:
		wave_data = [["slime_6", 3], ["slime_3", 1]]
	
	enemies_in_wave += wave_data.size()
	return wave_data
