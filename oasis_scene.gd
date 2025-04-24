extends Node2D


func _ready() -> void:
	#$Player.global_positon = $Door.global_position
	$MainAnimator.play("cutscene")
