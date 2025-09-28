extends Area2D

signal sun_area_entered
signal sun_area_exited
signal progress_to_next_level

var in_coin_zone = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("give_coin") and in_coin_zone:
		if Globals.game_won == true:
			progress_to_next_level.emit()
			process_mode = Node.PROCESS_MODE_DISABLED
			return
			
		%EnterButton.disabled = false
		%EButton.disabled = false

		if Globals.suns != 0:
			%EnterButton.add_theme_color_override("font_color", Color.WHITE)
			%EButton.add_theme_color_override("font_color", Color.WHITE)
			
			Globals.suns -= 1
			Globals.suns_given += 1
			
			get_node("../TileMapLayers/PortalTreeMapLayers/PortalTreeLayer" + str(Globals.suns_given)).visible = true
			
			if Globals.suns_given == Globals.SUN_REQUIREMENT:
				%PortalMapLayer.visible = true
				%PortalAudioStream.play()
			else:
				%GivePortalAudioStream.play()
		else:
			if Globals.suns_given == Globals.SUN_REQUIREMENT:
				%EnterPortalAudioStream.play()
				progress_to_next_level.emit()

	
	if Input.is_action_just_released("give_coin"):
		%EnterButton.disabled = true
		%EButton.disabled = true
		

func _on_body_entered(_body: Node2D) -> void:
	in_coin_zone = true
	%EButton.visible = true
	%EnterButton.visible = true
	%InteractTouchScreenButton.visible = true
	sun_area_entered.emit()


func _on_body_exited(_body: Node2D) -> void:
	in_coin_zone = false
	%EButton.visible = false
	%EnterButton.visible = false
	%InteractTouchScreenButton.visible = false
	sun_area_exited.emit()


func _on_interact_touch_screen_button_pressed() -> void:
	if Globals.game_won == true:
		progress_to_next_level.emit()
		process_mode = Node.PROCESS_MODE_DISABLED
		return

	if Globals.suns != 0:
		Globals.suns -= 1
		Globals.suns_given += 1
		
		get_node("../TileMapLayers/PortalTreeMapLayers/PortalTreeLayer" + str(Globals.suns_given)).visible = true
		
		if Globals.suns_given == Globals.SUN_REQUIREMENT:
			%PortalMapLayer.visible = true
			%PortalAudioStream.play()
		else:
			%GivePortalAudioStream.play()
	else:
		if Globals.suns_given == Globals.SUN_REQUIREMENT:
			%EnterPortalAudioStream.play()
			progress_to_next_level.emit()
