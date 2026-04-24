
extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is Player: 
		print("Chicken catched")
		ChickenManager.add_chicken()
		get_parent().queue_free()
