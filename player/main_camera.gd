extends Camera2D

@onready var MAIN = get_tree().get_root().get_node("Main")
@onready var PLAYER = get_tree().get_root().get_node("Main/Player")

@export var unlocked: bool = true


func _physics_process(delta: float) -> void:
	if unlocked:
		global_position.x = global_position.x + (PLAYER.global_position.x - global_position.x) * 0.22
		global_position.y = global_position.y + (PLAYER.global_position.y - global_position.y) * 0.2
