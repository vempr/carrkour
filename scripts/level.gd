extends Node2D

@onready var next_level = load("res://scenes/levels/level_" + str(Globals.current_level + 1) + ".tscn")
@onready var start_menu = load("res://scenes/levels/level_0.tscn")

func _ready() -> void:
	Globals.reset()
	await Fade.fade_in().finished
	Globals.unpause_stopwatch()
	
	%ProgressZone.progress_to_next_level.connect(_on_progress_to_next_level)
	if Globals.is_in_hardcore_mode == true:
		$AudioStreamPlayer.pitch_scale = 0.7
	$AudioStreamPlayer.play()


func _on_progress_to_next_level() -> void:
	Globals.pause_stopwatch()
	_pause_children(true)
	await Fade.fade_out().finished
	
	if Globals.is_in_practice_mode == true:
		get_tree().change_scene_to_packed(start_menu)
		Fade.fade_in()
	else:
		get_tree().change_scene_to_packed(next_level)
		Globals.current_level += 1
		if Globals.current_level == Globals.LAST_LEVEL:
			Globals.game_won = true
			
	Globals.reset()
	_pause_children(false)


func _pause_children(state: bool) -> void:
	for child in get_children():
		if child != Fade:
			child.set_process(!state)
			child.set_physics_process(!state)
