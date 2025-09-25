extends Node

const SUN_REQUIREMENT = 10

var dead = false
var game_started = false
var game_won = false
var start_time: int
var elapsed_time: float = 0.0

var current_level = 0

var deaths = 0
var suns = 0
var suns_given = 0


func _process(_delta: float) -> void:
	if game_started == true && game_won == false:
		elapsed_time = (Time.get_ticks_usec() - start_time) / 1_000_000.0


func reset() -> void:
	dead = false
	suns = 0
	suns_given = 0


func get_elapsed_time_string() -> String:
	var total_sec = int(elapsed_time)
	var hours = total_sec / 3600
	var minutes = total_sec / 60
	var seconds = total_sec % 60
	var milliseconds = int((elapsed_time - total_sec) * 1000)
	
	if hours > 0:
		return "%02d:%02d:%02d:%03d" % [hours, minutes, seconds, milliseconds]
	else:
		return "%02d:%02d:%03d" % [minutes, seconds, milliseconds]


func start_stopwatch() -> void:
	start_time = Time.get_ticks_usec()
	game_started = true
	game_won = false
	elapsed_time = 0.0


func debug() -> void:
	print(Globals.SUN_REQUIREMENT)
	print(Globals.dead)
	print(Globals.game_started)
	print(Globals.start_time)
	print(Globals.elapsed_time)
	print(Globals.current_level)
	print(Globals.deaths)
	print(Globals.suns)
	print(Globals.suns_given)
	
