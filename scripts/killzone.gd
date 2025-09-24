extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	Globals.dead = true
	Globals.deaths += 1
	timer.start()
	print(Globals.deaths)


func _on_timer_timeout():
	Globals.reset()
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
