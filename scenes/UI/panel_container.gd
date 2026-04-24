extends PanelContainer
@onready var label: Label = $Label

func _ready() -> void:
	ChickenManager.chicken_catched.connect(on_chicken_catched)

func on_chicken_catched() -> void:
	label.text = "Chickens left: " +str(ChickenManager.chickens_left)
