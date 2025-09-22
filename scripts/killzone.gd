extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	Engine.time_scale = 0.5
	print(body)
	body.get_node("CollisionShape2D").queue_free()
	Globals.dead = true
	timer.start()


func _on_timer_timeout():
	Engine.time_scale = 1.0
	Globals.dead = false
	get_tree().reload_current_scene()
