extends CanvasLayer

@onready var start_menu = load("res://scenes/levels/level_0.tscn")


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause_game"):
		triggerPause()


func _pause_children(state: bool) -> void:
	for child in get_children():
		if child != Fade:
			child.set_process(!state)
			child.set_physics_process(!state)


func _on_button_main_menu_pressed() -> void:
	_pause_children(true)
	await Fade.fade_out().finished
	get_tree().paused = false
	
	get_tree().change_scene_to_packed(start_menu)

	Globals.reset()

	await Fade.fade_in().finished
	_pause_children(false)


func _on_button_restart_pressed() -> void:
	_pause_children(true)
	await Fade.fade_out().finished
	get_tree().paused = false
	
	get_tree().reload_current_scene()

	Globals.reset()

	await Fade.fade_in().finished
	_pause_children(false)


func _on_button_continue_pressed() -> void:
	triggerPause()


func triggerPause() -> void:
	visible = !visible
	get_tree().paused = visible
