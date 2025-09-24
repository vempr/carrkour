extends Node2D

@onready var next_level = load("res://scenes/levels/level_1.tscn")


func _pause_children(state: bool) -> void:
	for child in get_children():
		if child != Fade:
			child.set_process(!state)
			child.set_physics_process(!state)


func _on_button_pressed() -> void:
	Globals.debug()
	_pause_children(true)
	await Fade.fade_out().finished
	
	Globals.current_level += 1
	Globals.start_stopwatch()

	get_tree().change_scene_to_packed(next_level)
	await Fade.fade_in().finished
	_pause_children(false)
	
