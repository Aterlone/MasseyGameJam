extends Area2D

@onready var area_container = get_tree().get_root().get_node("Main/AreaContainer")
var in_house
var player_on_door = 0

func _process(delta: float) -> void:
	print(player_on_door)
	if player_on_door:
		if Input.is_action_just_pressed("ui_accept"):
			if in_house:
				scene_change("res://level_1.tscn")
				in_house = 0
			else:
				scene_change("res://house_1.tscn")
				in_house = 1

func _on_body_entered(body):
	if body.name == "Player":
		player_on_door = 1


func _on_body_exited(body):
	if body.name == "Player":
		player_on_door = 0
## Change scene
func scene_change(scene: String):
	var this_scene = load(scene)
	area_container.add_child(this_scene.instantiate())
	area_container.get_child(0).queue_free()
