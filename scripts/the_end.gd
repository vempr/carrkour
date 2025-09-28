extends Node2D

@onready var start_menu = load("res://scenes/levels/level_0.tscn")


func _ready() -> void:
	%ProgressZone.progress_to_next_level.connect(_on_progress_to_next_level)
	%ResultsLabel.self_modulate.a = 0.0
	
	if Globals.is_in_hardcore_mode == true:
		$AudioStreamPlayer.pitch_scale = 0.7
		%HardcoreTexts.visible = true
		%MiddlegroundHardcoreMapLayer.visible = true
		%ResultsLabel.text = Globals.get_elapsed_time_string()
	else:
		%Animals.visible = true
		%Vegetables.visible = true
		%Texts.visible = true
		%BackBackgroundMapLayer.visible = true
		%MiddlegroundMapLayer.visible = true
		
		if Globals.deaths > 0:
			%ResultsLabel.text = "I got home in " + Globals.get_elapsed_time_string() + " after dying " + str(Globals.deaths) + " times."
		else:
			%ResultsLabel.text = "I got home in " + Globals.get_elapsed_time_string() + "."


func _on_progress_to_next_level() -> void:
	%Carrot.visible = false;
	%CarrotEnd.visible = true;
	
	var tween = get_tree().create_tween()
	tween.tween_property(%ResultsLabel, "self_modulate:a", 1.0, 4.0)
	
	_pause_children(true)
	
	await get_tree().create_timer(10.0).timeout
	await Fade.fade_out().finished

	get_tree().change_scene_to_packed(start_menu)

	Globals.current_level = 0
	Globals.game_won = false
	Globals.game_started = false
	Globals.reset()

	await Fade.fade_in().finished
	_pause_children(false)


func _pause_children(state: bool) -> void:
	for child in get_children():
		if child != Fade:
			child.set_process(!state)
			child.set_physics_process(!state)
