extends CanvasLayer

signal mobile_left_down
signal mobile_left_up
signal mobile_right_down
signal mobile_right_up
signal mobile_jump_down
signal mobile_jump_up
signal mobile_pause


func _ready() -> void:
	if DisplayServer.is_touchscreen_available() == true:
		visible = true


func _on_left_touch_screen_button_pressed() -> void:
	mobile_left_down.emit()


func _on_left_touch_screen_button_released() -> void:
	mobile_left_up.emit()


func _on_right_touch_screen_button_pressed() -> void:
	mobile_right_down.emit()


func _on_right_touch_screen_button_released() -> void:
	mobile_right_up.emit()


func _on_jump_touch_screen_button_pressed() -> void:
	mobile_jump_down.emit()


func _on_jump_touch_screen_button_released() -> void:
	mobile_jump_up.emit()


func _on_touch_screen_button_pressed() -> void:
	mobile_pause.emit()
