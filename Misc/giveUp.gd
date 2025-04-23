extends Node
@onready var area_container = get_tree().get_root().get_node("Main/AreaContainer")

func _on_pressed() -> void:
	get_tree().reload_current_scene()	
	area_container.add_child(load("res://main.tscn").instantiate())
		
	area_container.get_child(0).queue_free()
