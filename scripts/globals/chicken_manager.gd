extends Node

var chickens_left: int = 9
signal chicken_catched

func add_chicken() -> void:
	if chickens_left > 0:
		chickens_left -= 1
		chicken_catched.emit()
	if chickens_left == 0:
		await get_tree().create_timer(1).timeout
		get_tree().quit()
