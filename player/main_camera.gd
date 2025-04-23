extends Camera2D

@onready var MAIN = get_tree().get_root().get_node("Main")
@onready var PLAYER = get_tree().get_root().get_node("Main/Player")


func _physics_process(delta: float) -> void:
	var distance_x = (PLAYER.global_position.x - global_position.x)
	global_position.x = global_position.x + distance_x * 0.22
	
	var distance_y = (PLAYER.global_position.y - global_position.y)
	
	if PLAYER.velocity.y > 0:
		distance_y *= 0.2
	else:
		distance_y *= 0.05
	
	global_position.y = global_position.y + distance_y
