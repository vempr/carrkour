extends Node2D

const SPEED = 60
var direction = 1

func _on_killzone_body_entered(_body: Node2D) -> void:
	%AnimatedSprite2D.play("kill")
 
