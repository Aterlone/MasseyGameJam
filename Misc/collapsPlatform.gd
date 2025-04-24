extends Area2D

var time = 1

func _ready():
	set_process(false)

func _process(delta):
	time+=1
	$"../StaticBody2D/Sprite2D".position += Vector2(0, sin(time)*2)

func _on_timer_timeout() -> void:
	get_node("../StaticBody2D/Sprite2D").visible = false
	get_node("../StaticBody2D/CollisionShape2D").disabled = true
	

func _on_area_entered(area: Area2D) -> void:
	set_process(true)
	$"../Timer".start(0.7)
