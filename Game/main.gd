extends Node2D

@onready var pause_menu = $pauseMenu
var paused = false

var current_wave = WaveCounter.current_wave
var enemies_in_wave = 0
var map_node

func _ready():
	map_node = get_node("Map/Path1")
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
	#await <- Nicht nötig
	get_tree().create_timer(0.2) ##padding
	spawn_enemies(wave_data)

func retrieve_wave_data():
	# -> Array
	var wave_data = [["slime_1", 0.1], ["slime_1", 0.1], ["slime_1", 0.1], ["slime_1", 0.1]]
	# : Array
	current_wave += 1
	enemies_in_wave = wave_data.size()
	return wave_data

func spawn_enemies(wave_data):
	# : Array) -> void
	for i in wave_data:
		var new_enemy = load("res://Game/Enemy/slime1/" + i[0] + ".tscn").instantiate()
		map_node.add_child(new_enemy, true)
		#await <- Nicht nötig
		get_tree().create_timer(i[1])

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
