extends CanvasLayer


func _ready() -> void:
	%GiveSunLabel.visible = false
	%ProgressZone.sun_area_entered.connect(_on_sun_area_entered)
	%ProgressZone.sun_area_exited.connect(_on_sun_area_exited)


func _process(_delta: float) -> void:
	%CoinsLabel.text = str(Globals.suns)
	
	var required_suns = Globals.SUN_REQUIREMENT - Globals.suns_given
	
	if required_suns == 0:
		%GiveSunLabel.text = 'Gate: "You shall pass."'
	else:
		%GiveSunLabel.text = 'Gate: "Give me ' + str(Globals.SUN_REQUIREMENT - Globals.suns_given) + ' Sun to progress."'


func _on_sun_area_entered() -> void:
	%GiveSunLabel.visible = true


func _on_sun_area_exited() -> void:
	%GiveSunLabel.visible = false
