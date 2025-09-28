extends Node2D

var SPEED = 60
var direction = 1


func _ready() -> void:
	if Globals.is_in_hardcore_mode == true:
		SPEED = 80


func _process(delta: float) -> void:
	if Globals.dead == true:
		return;
	
	if %RayCastRight.is_colliding():
		direction = -1
		%AnimatedSprite2D.flip_h = true
	if %RayCastLeft.is_colliding():
		direction = 1
		%AnimatedSprite2D.flip_h = false
		
	position.x += direction * SPEED * delta


func _on_killzone_body_entered(_body: Node2D) -> void:
	%AnimatedSprite2D.play("kill")
