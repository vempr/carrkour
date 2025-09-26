extends Node2D

const SPEED = 20
var direction = 1


func _process(delta: float) -> void:	
	if %RayCastRight.is_colliding():
		direction = -1
		%AnimatedSprite2D.flip_h = true
	if %RayCastLeft.is_colliding() == false:
		direction = 1
		%AnimatedSprite2D.flip_h = false
		
	position.x += direction * SPEED * delta
