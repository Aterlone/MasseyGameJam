extends Area2D

@onready var area_container = get_tree().get_root().get_node("Main/AreaContainer")
var in_house

func _on_body_entered(body):
	if body.name == "Player":
		print("Player with the door!")
		if Input.is_action_just_pressed("ui_accept"):
			if in_house:
				scene_change("res://level_1.tscn")
				in_house = 0
			else:
				scene_change("res://house_1.tscn")
				in_house = 1
		##IF button pressed
		##Go to wherever door needs

## Change scene
func scene_change(scene: String):
	var this_scene = load(scene)
	area_container.add_child(this_scene.instantiate())
	area_container.get_child(0).queue_free()
