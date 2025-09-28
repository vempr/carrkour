extends Node2D

@onready var level_one = load("res://scenes/levels/level_1.tscn")
@onready var level_two = load("res://scenes/levels/level_2.tscn")
@onready var level_three = load("res://scenes/levels/level_3.tscn")
@onready var level_four = load("res://scenes/levels/level_4.tscn")


func _ready() -> void:
	Globals.is_in_hardcore_mode = false
	Engine.time_scale = 1.0


func _pause_children(state: bool) -> void:
	for child in get_children():
		if child != Fade:
			child.set_process(!state)
			child.set_physics_process(!state)


func _on_adventure_mode_button_pressed() -> void:
	_pause_children(true)
	await Fade.fade_out().finished
	
	Globals.current_level = 1
	Globals.start_stopwatch()

	get_tree().change_scene_to_packed(level_one)
	await Fade.fade_in().finished
	_pause_children(false)
	

func play_practice_mode(level: int) -> void:
	_pause_children(true)
	await Fade.fade_out().finished
	
	Globals.is_in_practice_mode = true
	Globals.start_stopwatch()

	match level:
		1:
			get_tree().change_scene_to_packed(level_one)
		2:
			get_tree().change_scene_to_packed(level_two)
		3:
			get_tree().change_scene_to_packed(level_three)
		4:
			get_tree().change_scene_to_packed(level_four)
	
	await Fade.fade_in().finished
	_pause_children(false)


func _on_button_level_1_pressed() -> void:
	play_practice_mode(1)


func _on_button_level_2_pressed() -> void:
	play_practice_mode(2)


func _on_button_level_3_pressed() -> void:
	play_practice_mode(3)


func _on_button_level_4_pressed() -> void:
	play_practice_mode(4)


func _on_hardcore_mode_button_pressed() -> void:
	Globals.is_in_hardcore_mode = true
	_on_adventure_mode_button_pressed()
