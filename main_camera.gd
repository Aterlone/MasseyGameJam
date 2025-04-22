extends Camera3D


@onready var MAIN = get_tree().get_root().get_child(0)
@onready var PLAYER = MAIN.get_node("LevelContainer").get_child(0).get_node("Player")

func _physics_process(delta: float) -> void:
	if PLAYER.cam_locked: return
	var speed_x = 0.2
	
#	*---- track x
	global_position.x += (PLAYER.global_position - global_position).x * speed_x
	
#	*---- track y
	var target_y = PLAYER.global_position.y
	target_y += 2
	var speed_y = abs((global_position.y - target_y) / 5)
	speed_y = clamp(speed_y, 0, 0.3)
	if !PLAYER.is_on_floor() and sign(PLAYER.velocity.y) != -1 or PLAYER.velocity.y >= -PLAYER.jump_height / 3:
		speed_y /= 2
	global_position.y = move_toward(global_position.y, target_y, speed_y)
	global_position.y = clamp(global_position.y, target_y - 3, target_y + 2)
	
#	*---- track z
	global_position.z = 8
