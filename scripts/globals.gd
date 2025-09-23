extends Node

const SUN_REQUIREMENT = 10

var dead = false
var deaths = 0
var suns = 0
var suns_given = 0

func reset() -> void:
	dead = false
	deaths = 0
	suns = 0
	suns_given = 0
