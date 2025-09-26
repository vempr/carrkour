extends Area2D


func _on_body_entered(_body: Node2D) -> void:
	Globals.suns += 1
	
	visible = false
	$CollisionShape2D.queue_free()
	
	%AudioPlayer.play()
	
	await %AudioPlayer.finished
	queue_free()
