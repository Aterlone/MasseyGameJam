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
	"Z"
) var door_char : String 

@onready var MAIN = get_tree().get_root().get_child(0)

var player_on_door = 0
var player

var other_door

func _ready() -> void:
	self.name = "Door" + str(door_char)

func _physics_process(delta: float) -> void:
	if player_on_door:
		if Input.is_action_just_pressed("ui_accept"):
			
			MAIN.switch_to_next_level(door_char)
			return
			
			#print("SCENE CHANGE")
			#if player.in_house:
				#print("OUT HOUSE")
				#scene_change("res://level_1.tscn")
			#else:
				#print("IN HOUSE" + str(player.in_house))
				#scene_change("res://house_1.tscn")
			#player.get_node("Sprite2D").outside = !player.in_house

func _on_body_entered(body):
	player = body;
	if body.name == "Player":
		player_on_door = 1


func _on_body_exited(body):
	if body.name == "Player":
		player_on_door = 0
	
	
### Change scene
#func scene_change(scene: String):
	#var this_scene = load(scene)
	#player.in_house = !player.in_house
	#
	#MAIN.switch_to_next_level(door_char)
	#return
	#
	#area_container.add_child(this_scene.instantiate())
	#
	#await get_tree().process_frame
	#
	#other_door = area_container.get_child(1).get_node("Door"+str(door_char))
	#other_door.get_node("CollisionShape2D").queue_free()
	##print(str())
#
	#player.global_position = other_door.global_position
	#player.get_node("Sprite2D").checkpoint()
	#
	#area_container.get_child(0).queue_free()
	#
	#print(str(area_container.get_children()))
	
