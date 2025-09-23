extends Area2D

signal sun_area_entered
signal sun_area_exited

var in_coin_zone = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("give_coin") and in_coin_zone:
		%EnterButton.disabled = false
		%EButton.disabled = false

		if Globals.suns != 0:
			%EnterButton.add_theme_color_override("font_color", Color.WHITE)
			%EButton.add_theme_color_override("font_color", Color.WHITE)
			
			Globals.suns -= 1
			Globals.suns_given += 1
			if Globals.suns_given == Globals.SUN_REQUIREMENT:
				print("you can progress!")
	
	if Input.is_action_just_released("give_coin"):
		%EnterButton.disabled = true
		%EButton.disabled = true
		

func _on_body_entered(_body: Node2D) -> void:
	in_coin_zone = true
	%EButton.visible = true
	%EnterButton.visible = true
	sun_area_entered.emit()

func _on_body_exited(_body: Node2D) -> void:
	in_coin_zone = false
	%EButton.visible = false
	%EnterButton.visible = false
	sun_area_exited.emit()
