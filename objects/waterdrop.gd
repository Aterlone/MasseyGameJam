extends Area2D


func _on_area_entered(area: Area2D) -> void:
	if area.get_parent().name == "Player":
		area.get_parent().get_node("Sprite2D").heal(2)
		queue_free()
