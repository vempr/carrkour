extends Node

const SUN_REQUIREMENT = 10

var dead = false
var game_won = false
var start_time: int = 0
var elapsed_time: float = 0.0

var current_level = 1

var deaths = 0
var suns = 0
var suns_given = 0


func _ready() -> void:
	start_time = Time.get_ticks_usec()


func _process(_delta: float) -> void:
	if game_won == false:
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
