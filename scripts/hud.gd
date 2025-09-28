extends CanvasLayer


func _ready() -> void:
	%ProgressZone.sun_area_entered.connect(_on_sun_area_entered)
	%ProgressZone.sun_area_exited.connect(_on_sun_area_exited)
	
	if Globals.is_in_hardcore_mode == true:
		%HardcoreHue.visible = true
		%HardcoreLabel.visible = true

func _process(_delta: float) -> void:
	if Globals.dead == true:
		%RedHue.visible = true
	else:
		%RedHue.visible = false
	
	%CoinsLabel.text = str(Globals.suns)
	%TimeLabel.text = Globals.get_elapsed_time_string()
	
	var required_suns = Globals.SUN_REQUIREMENT - Globals.suns_given
	
	if required_suns == 0:
		%GiveSunLabel.text = 'Gate: "You shall pass."'
	else:
		%GiveSunLabel.text = 'Gate: "Give me ' + str(Globals.SUN_REQUIREMENT - Globals.suns_given) + ' Sun to progress."'


func _on_sun_area_entered() -> void:
	%GiveSunLabel.visible = true


func _on_sun_area_exited() -> void:
	%GiveSunLabel.visible = false
