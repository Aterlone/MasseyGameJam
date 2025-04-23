extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		print("Player with the door!")
		##IF button pressed
		##Go to wherever door needs
