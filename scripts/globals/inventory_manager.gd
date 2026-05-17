extends Node

var inventory: Dictionary = Dictionary()
var amount: int = 0

signal inventory_changed

func add_collectible(collectable_name: String) -> void:
	inventory.get_or_add(collectable_name)
	
	if inventory[collectable_name] == null:
		inventory[collectable_name] = 1
	else:
		inventory[collectable_name] += 1
	inventory_changed.emit()
	
func find_collectible(collectable_name: String) -> int:
	return inventory.get(collectable_name, 0)
