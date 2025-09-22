extends Node2D

const SPEED = 60
var direction = 1


func _process(delta: float) -> void:
	if %RayCastRight.is_colliding():
		direction = -1
		%AnimatedSprite2D.flip_h = true
	if %RayCastLeft.is_colliding():
		direction = 1
		%AnimatedSprite2D.flip_h = false
		
	position.x += direction * SPEED * delta


func _on_killzone_body_entered(_body: Node2D) -> void:
	get_tree().call_deferred("reload_current_scene")
