extends Area2D

var cam: Node
var lockPos: Vector2
var locked: bool = false

@onready var MAIN = get_tree().get_root().get_node("Main")

##Update method
func _process(delta: float) -> void:
	if (locked):
		print("Locked")
		cam.global_position = lockPos

##On entering pit
func _on_area_entered(area: Node2D):
	print("Entered")
	locked = true
	cam = MAIN.get_node("MainCamera")
	print(locked, " ", cam)
	lockPos = cam.position

##On exiting pit
func _on_area_exited(area: Node2D):
	locked = false
	cam.get_parent().position = Vector2.ZERO
	
	area.get_parent().get_node("Sprite2D").current_health = cp_health
	area.get_parent().get_node("Sprite2D").get_parent().global_position = cp_pos
