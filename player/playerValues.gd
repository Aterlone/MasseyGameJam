extends CharacterBody2D

# Player values

## Water needed for life
@export var max_health: int = 100
@export var current_health: int = 100
@export var move_speed: float = 200.0

## Time Survived
@export var score: int = 0

## Base damage taken by player
var extra = 0


## Time Survived
func _process(delta):
	score += delta
	extra += floor(delta)
	if delta > 1:
		current_health = max(current_health-floor(extra), 0)
		
	extra -= floor(extra)
	print("Took damage! Health:", current_health)

# Heal the player
func heal() -> void:
	current_health = min(current_health + 5, max_health)
	print("Healed! Health:", current_health)
