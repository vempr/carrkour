extends CanvasLayer

signal mobile_left_down
signal mobile_left_up
signal mobile_right_down
signal mobile_right_up
signal mobile_jump_down
signal mobile_jump_up


func _ready() -> void:
	if OS.has_feature("mobile"):
		visible = true


func _on_left_button_button_down() -> void:
	mobile_left_down.emit()


func _on_left_button_button_up() -> void:
	mobile_left_up.emit()


func _on_right_button_button_down() -> void:
	mobile_right_down.emit()


func _on_right_button_button_up() -> void:
	mobile_right_up.emit()


func _on_jump_button_button_down() -> void:
	mobile_jump_down.emit()


func _on_jump_button_button_up() -> void:
	mobile_jump_up.emit()
