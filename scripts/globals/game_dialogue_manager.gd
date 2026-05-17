extends Node
signal give_crops_seeds

var status: String = "0"

func action_give_crops_seeds() -> void:
	give_crops_seeds.emit()
