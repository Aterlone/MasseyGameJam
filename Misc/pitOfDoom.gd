extends Area2D

var cam: Node
var lockPos: Vector2
var locked: bool = false

func _process(delta: float) -> void:
	if (locked):
		print("Locked")
		cam.global_position = lockPos

func _on_area_entered(area: Area2D):
	print("Entered")
	locked = true
	cam = area.get_parent().get_node("Camera2D")
	lockPos = cam.global_position

func _on_area_exited(area: Area2D):
	locked = false
	cam.position = Vector2.ZERO
	area.get_parent().get_node("Sprite2D").checkpoint()
