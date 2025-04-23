extends Sprite2D

# Player values
## Water needed for life
@export var max_health: int = 100
@export var current_health: int = 100

## Time Survived
@export var score: int = 0

## Base damage taken by player
var extra = 0

## Day night hurt cycle
@export var daylight: float = 0
const min_max = Vector2(1, 8)
var hurt_multi: float = 8

## Update
func _process(delta):
	## Time Survived
	score += delta
	
	## Hurt
	hurt_multi = daylight * (min_max.y - min_max.x) + min_max.x
	
	extra += delta * hurt_multi;
	while extra > 1:
		current_health = max(current_health-floor(extra), 0)
		extra -= floor(extra)
		print("Took damage! Health:", current_health)

# Heal the player
func heal() -> void:
	current_health = min(current_health + 5, max_health)
	print("Healed! Health:", current_health)
