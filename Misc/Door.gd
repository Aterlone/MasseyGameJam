extends Area2D

@onready var area_container = get_tree().get_root().get_node("Main/AreaContainer")
@export_enum(
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"G",
	"H",
	"I",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
	"Q",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z",
) var door_char

var in_house: bool
var player_on_door = 0
var player

func _ready() -> void:
	name = "Door" + str(door_char)

func _process(delta: float) -> void:
	if player_on_door:
		if Input.is_action_just_pressed("ui_accept"):
			print("SCENE CHANGE")
			if in_house:
				print("OUT HOUSE")
				scene_change("res://level_1.tscn")
			else:
				print("IN HOUSE" + str(in_house))
				scene_change("res://house_1.tscn")
			player.get_node("Sprite2D").outside = !in_house

func _on_body_entered(body):
	player = body;
	if body.name == "Player":
		player_on_door = 1


func _on_body_exited(body):
	if body.name == "Player":
		player_on_door = 0
		
## Change scene
func scene_change(scene: String):
	var this_scene = load(scene)
	in_house = !in_house

	area_container.get_child(0).queue_free()
	
	area_container.add_child(this_scene.instantiate())
	player.global_position = area_container.get_child(0).get_node("Door"+str(door_char)).global_position
