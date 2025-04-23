extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		print("Player collided with this object!")
		body.get_node("Sprite2D").heal()
		queue_free()
