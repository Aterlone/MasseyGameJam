extends Area2D


func _on_area_entered(area: Area2D) -> void:
	if area.name == "Player":
		area.get_node("Sprite2D").heal()
		queue_free()
