extends Node

const SUN_REQUIREMENT = 10

var current_level = 1
var dead = false
var deaths = 0
var suns = 0
var suns_given = 0

func reset() -> void:
	dead = false
	suns = 0
	suns_given = 0
