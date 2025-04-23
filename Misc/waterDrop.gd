extends Area2D

@export var isBottle: bool

func _on_body_entered(body):
	if body.name == "Player":
		print("Player collided with this object!")
		if isBottle:
			body.get_node("Sprite2D").heal(5)
		else:
			body.get_node("Sprite2D").heal(100)
			
		queue_free()
