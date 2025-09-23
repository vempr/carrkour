extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -300.0
const JUMP_BUFFER_TIME = 0.15
const COYOTE_TIME = 0.1

var flip_cooldown = 0.0
var jump_buffer = 0.0
var coyote_time = 0.0


func _physics_process(delta: float) -> void:
	if Globals.dead == true:
		%Sprite.play("dead")
		%Sprite.flip_h = false
		velocity += get_gravity() * delta
		move_and_slide()
		return

	if not is_on_floor(): 
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump"):
		jump_buffer = JUMP_BUFFER_TIME
	else:
		jump_buffer -= delta
		
	if is_on_floor():
		coyote_time = COYOTE_TIME
	else:
		coyote_time -= delta

	if jump_buffer > 0 and coyote_time > 0:
		velocity.y = JUMP_VELOCITY
		jump_buffer = 0
		coyote_time = 0 

	var direction := Input.get_axis("move_left", "move_right")

	if not is_on_floor():
		%Sprite.play("walk")
		flip_cooldown -= delta
		if flip_cooldown <= 0.0:
			%Sprite.flip_h = !%Sprite.flip_h
			flip_cooldown = 0.1
	elif direction == 0:
		%Sprite.play("idle")
	elif direction == 1:
		%Sprite.play("walk")
		%Sprite.flip_h = false
	else:
		%Sprite.play("walk")
		%Sprite.flip_h = true

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
