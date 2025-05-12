extends Node


func _on_area_entered(area: Area2D) -> void:
	open_door()

func open_door():
	get_node("../StaticBody2D/CollisionShape2D").disabled = true
