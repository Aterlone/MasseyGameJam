extends Node

var state: bool = true

func _on_body_entered(body):
	if body.name == "Player":
		print("Player collided with this object!")	
