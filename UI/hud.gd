extends CanvasLayer

@onready var MAIN = get_tree().get_root().get_node("Main")
@onready var PLAYER = get_tree().get_root().get_node("Main/Player")

func _physics_process(delta: float) -> void:
	if !MAIN or !PLAYER:
		return
	
	var current_health = float(PLAYER.get_node("Sprite2D").current_health)
	var max_health = float(PLAYER.get_node("Sprite2D").max_health)
	var value = 100 * (current_health / max_health)
	$Control/ThirstBar.value = value
