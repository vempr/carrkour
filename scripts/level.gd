extends Node2D

@onready var next_level = load("res://scenes/levels/level_" + str(Globals.current_level + 1) + ".tscn")


func _ready() -> void:
	%ProgressZone.progress_to_next_level.connect(_on_progress_to_next_level)


func _on_progress_to_next_level() -> void:
	_pause_children(true)
	await Fade.fade_out().finished
	
	get_tree().change_scene_to_packed(next_level)

	Globals.current_level += 1
	Globals.reset()

	await Fade.fade_in().finished
	_pause_children(false)


func _pause_children(state: bool) -> void:
	for child in get_children():
		if child != Fade:
			child.set_process(!state)
			child.set_physics_process(!state)
