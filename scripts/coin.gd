extends Area2D


func _on_body_entered(_body: Node2D) -> void:
	Globals.suns += 1
	queue_free()
