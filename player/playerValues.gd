extends Sprite2D

# For Reset
@onready var area_container = get_tree().get_root().get_node("Main/AreaContainer")

# Player values
## Water needed for life
@export var max_health: int = 100
@export var current_health: int = 100

## Time Survived
@export var score: int = 0

## Base damage taken by player
var extra = 0

## Day night hurt cycle
var daylight: float = 0
const min_max = Vector2(1, 8)
var hurt_multi: float = 8

## Inside/Outside
@export var outside: bool = true;

## Update
func _process(delta):
	## Time Survived

	if not current_health:
		get_tree().reload_current_scene()	
		area_container.add_child(load("res://main.tscn").instantiate())
		area_container.get_child(0).queue_free()	
	score += delta
	
	## Hurt
	if outside:
		daylight = 1
	else:
		daylight = 0
	
	hurt_multi = daylight * (min_max.y - min_max.x) + min_max.x
	
	extra += delta * hurt_multi;
	while extra > 1:
		current_health = max(current_health-floor(extra), 0)
		extra -= floor(extra)

# Heal the player
func heal() -> void:
	current_health = min(current_health + 5, max_health)
