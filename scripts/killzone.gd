extends Area2D

@onready var timer = $Timer
@onready var start_menu = load("res://scenes/levels/level_0.tscn")


func _on_body_entered(body):
	if Globals.is_in_hardcore_mode == true:
		%AudioPlayer.volume_db = 2.0
		%AudioPlayer.volume_db = 0.7
	
	%AudioPlayer.play()
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	Globals.dead = true
	Globals.deaths += 1
	timer.start()


func _on_timer_timeout():
	if Globals.is_in_hardcore_mode == true:
		await Fade.fade_out().finished
		get_tree().change_scene_to_packed(start_menu)
		Globals.is_in_hardcore_mode = false
		Fade.fade_in()
	else:
		Engine.time_scale = 1.0
		get_tree().reload_current_scene()
