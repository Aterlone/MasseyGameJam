extends Node2D

var to_outside = true

func switch_to_next_level(new_door_char):
	to_outside = !to_outside
	
	## insert new level
	for child in $AreaContainer.get_children():
		child.queue_free()
	
	await get_tree().process_frame
	
	if to_outside:
		$AreaContainer.add_child(load("res://level_1.tscn").instantiate())
	else:
		$AreaContainer.add_child(load("res://house_1.tscn").instantiate())
	
	await get_tree().process_frame
	
	var spawn_door = $AreaContainer.get_child(0).get_node("Door" + str(new_door_char))
	
	$Player.global_position = spawn_door.global_position
	spawn_door.get_node("CollisionShape2D").disabled = true
	$MainCamera.global_position = $Player.global_position
	
	$Player.get_node("Sprite2D").outside = to_outside
	
	$Player.get_node("Sprite2D").checkpoint()
	
	print(str(new_door_char))
	print(to_outside)
