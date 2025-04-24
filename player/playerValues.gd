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

## Checkpoint Values
var cp_pos: Vector2
var cp_health: int
var scene

func _ready() -> void:
	cp_pos = get_parent().global_position
	cp_health = current_health
	scene = area_container.get_child(0).get_scene_file_path()

## Update
func _process(delta):
	## Time Survived

	if not current_health:
		respawn()
		
	
	
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
func heal(amount) -> void:
	current_health = min(current_health + amount, max_health)
	
func checkpoint():
	cp_pos = get_parent().global_position
	cp_health = current_health
	scene = area_container.get_child(0).get_scene_file_path()
	
	print(scene)
	
func respawn():
	# Check point swap vals
	self.current_health = cp_health
	get_parent().global_position = cp_pos
	for child in area_container.get_children():
		child.queue_free()
	
	await get_tree().process_frame
	var the_scene = load(scene)
	area_container.add_child(the_scene.instantiate())
